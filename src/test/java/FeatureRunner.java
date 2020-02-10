import com.intuit.karate.junit5.Karate;

class FeatureRunner {

    @Karate.Test
    Karate bookitRooms() {
       // return new Karate().tags("@bookit").relativeTo(getClass());
       // return new Karate().tags("@add_new_student").relativeTo(getClass());
        return new Karate().tags("@scenario_outline_bookit").relativeTo(getClass());
    }


    @Karate.Test
    Karate testUsers() {
//        return new Karate().feature("my.feature").relativeTo(getClass());
        return new Karate().tags("@omdb").relativeTo(getClass());
    }

    @Karate.Test
    Karate metaWeatherTests(){
        return new Karate().tags("@meta_weather").relativeTo(getClass());
    }

    @Karate.Test
    Karate getSpartans(){
        return new Karate().tags("@delete-Spartan").relativeTo(getClass());
    }

    @Karate.Test
    Karate addSpartans(){
        return new Karate().tags("@add_spartan_with_external_json").relativeTo(getClass());
    }


    @Karate.Test
    Karate patchSpartans() {
        return new Karate().tags("@patch_spartan").relativeTo(getClass());
    }

    @Karate.Test
    Karate updateSpartans() {
        return new Karate().tags("@update_spartan").relativeTo(getClass());
    }
}


