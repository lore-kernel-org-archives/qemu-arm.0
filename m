Received: by 10.25.44.15 with SMTP id s15csp359987lfs;
        Fri, 7 Jul 2017 10:33:30 -0700 (PDT)
X-Received: by 10.223.170.70 with SMTP id q6mr1355146wrd.205.1499448810467;
        Fri, 07 Jul 2017 10:33:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499448810; cv=none;
        d=google.com; s=arc-20160816;
        b=S/vcBf3PyPLXuZuFzYDm3yZTJok9CYp/Kx7TinTbDKIq8jM9OOQgVOmSPHw2l1E2Tk
         1OSJgutSujyYnsiX0bylmtoSlMpKEG5eS1I42r/cDTILHmIG8S2s7MYso3i2VKLxae+x
         KLA85PgcE8D7mkR336yVEQEReEQ6vlY1+aNpMGOBSlggzu5+Bb/EO6ik5ukfNg6DW+cz
         vEDJMd8dxjULn32qxLzOYdp41sUczpbt2lq1q2uUsNAGDruO7Zldn4ApaP+ku2IbVs/n
         +Wq+1ss2i2kVhtLeOEAg8m0OehCQiztItg3M6sPkmCwA+5q4Db9ogMrAJFWxiyv0iYRo
         7Dig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:user-agent:message-id:in-reply-to:date
         :mail-followup-to:references:subject:cc:to:from
         :arc-authentication-results;
        bh=w9ltEQ0b3jcZhUqdaOu+aYrp66ebCwll9VyH+HuKGeg=;
        b=VEW0EIxFR+N+LJ0Fg3vZvjSShhH5w1DqwXO0jsVyCNVrUtR373d3Ax5NnywTDhKi3a
         BMUDjuPe354Vp/nhez8YPmvD0KCmkmB4JpWzECDw/D0hVOGnqF5kJ3JJ58ef+fTboyTS
         YoygcpvABeAkWCLUqGfTk79MKzNNpArhr3l00TIpqtL5T7+zDZABhfKtEGzDKrcG2MjU
         mdy+lJOxk8fN2elEXAS3TCN4mRAGpGLnMruEbZBZHyfX0IybwA2bnLs3cNAUx0us+SbP
         vfkI4UkR2Xwh5mYCGFNsE96pl+xsAK43H2JYu3MjMrfvl9nfFLVvMsALDnWt6703cUv5
         rINA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Return-Path: <vilanova@ac.upc.edu>
Received: from roura.ac.upc.es (roura.ac.upc.edu. [147.83.33.10])
        by mx.google.com with ESMTP id 197si6755wmo.114.2017.07.07.10.33.30;
        Fri, 07 Jul 2017 10:33:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) client-ip=147.83.33.10;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Received: from correu-1.ac.upc.es (correu-1.ac.upc.es [147.83.30.91])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id v67HXReZ029496;
	Fri, 7 Jul 2017 19:33:27 +0200
Received: from localhost (63.red-83-51-187.dynamicip.rima-tde.net [83.51.187.63])
	by correu-1.ac.upc.es (Postfix) with ESMTPSA id 061F123D;
	Fri,  7 Jul 2017 19:33:21 +0200 (CEST)
From: =?utf-8?Q?Llu=C3=ADs_Vilanova?= <vilanova@ac.upc.edu>
To: "Emilio G. Cota" <cota@braap.org>
Cc: Richard Henderson <rth@twiddle.net>,
        Peter Maydell
 <peter.maydell@linaro.org>,
        Peter Crosthwaite
 <crosthwaite.peter@gmail.com>,
        qemu-devel@nongnu.org, "open list\:ARM"
 <qemu-arm@nongnu.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Alex
 =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [Qemu-devel] [PATCH v11 24/29] target/arm: [tcg, a64] Port to translate_insn
References: <149865219962.17063.10630533069463266646.stgit@frigg.lan>
	<149865801156.17063.15618379976159104550.stgit@frigg.lan>
	<244b5aab-8863-3139-f252-09cc02333eda@twiddle.net>
	<87inj4ebqn.fsf@frigg.lan>
	<c35a41d9-4c9d-3daf-2759-17a784b8711b@twiddle.net>
	<20170707161913.GA16183@flamenco>
Mail-Followup-To: "Emilio G. Cota" <cota@braap.org>, Richard Henderson
	<rth@twiddle.net>, Peter Maydell <peter.maydell@linaro.org>, Peter
	Crosthwaite <crosthwaite.peter@gmail.com>, qemu-devel@nongnu.org,
	"open list\:ARM" <qemu-arm@nongnu.org>, Paolo Bonzini
	<pbonzini@redhat.com>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>
Date: Fri, 07 Jul 2017 19:33:16 +0200
In-Reply-To: <20170707161913.GA16183@flamenco> (Emilio G. Cota's message of
	"Fri, 7 Jul 2017 12:19:13 -0400")
Message-ID: <8760f4cftv.fsf@frigg.lan>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-TUID: gAKkNU0egLJR

Emilio G Cota writes:

> On Fri, Jul 07, 2017 at 05:46:19 -1000, Richard Henderson wrote:
>> I do wonder if we should provide a generic empty hook, so that a target that
>> does not need a particular hook need not define an empty function.  It could
>> just put e.g. "translator_noop" into the structure.  Ok, maybe a better name
>> than that...

> NULL would serve that purpose well. The subsequent "if (hook)" branch
> would be essentially free because it'd be trivially predicted.

Someone (Richard? can't remember exactly) already objected to using NULL.


Cheers,
  Lluis
