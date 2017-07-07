Received: by 10.25.44.15 with SMTP id s15csp3213640lfs;
        Fri, 7 Jul 2017 04:26:38 -0700 (PDT)
X-Received: by 10.223.164.23 with SMTP id d23mr523460wra.58.1499426798706;
        Fri, 07 Jul 2017 04:26:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499426798; cv=none;
        d=google.com; s=arc-20160816;
        b=V4Z4iQdQOYKHqXZ/17nyxCoiSke8uPxSpHf4k3WqMP75Lw7YVlqdnQhSuTczl/lFOq
         tAUDbD8Yf57hO8RLK9qRNLgtH6Yiq9gikVKduCYq/I3raf9wtnUR3ozNVxeNiunGTDqt
         4SnwhhHnJhGtRzZP9ALn7iF6gpzlQE+zkqYPNp/MD9eUqmzNPFi+9xPwVmzk8Yf1lmHJ
         8eJOoFJAcq+2meAGLfJEjWgyn1UwzroWnDgHHedPuu8zj2reE1NR3GgZ1j56baCYpuwD
         HB9KkwtLHcicYskTgiLtcEr4lu3c7nxH0c/zARtq9kb50CCzBzu7ya+b/x6MrwulcN2V
         Kwsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:date:mail-followup-to:references:subject:cc:to:from
         :arc-authentication-results;
        bh=YsC4vYEMWrazPjazeb2Eui4QIZp14b5ziPq+XmMJSvA=;
        b=y84+TUTzBVJiWImKVFB09SxtdC4EFfRlcuMqPiSbTSKzmNOyfFoAwimedmkKTnn6UW
         TCLgn1yBMYZrkzpFie0PZ1+sPAky/X4b6tCtewU3Ja4NViHXcxtyQB7K3JMbeuXG70RY
         aBcvNYUsuSk8gUYDbwoDy6T4PgnuBzLUDhhBilrjI/EEJd/F+C4DQZZye52K4fdTE+lC
         RDr94PO0Y9ymXl4G68sRCwX8VebhXoHa7iOxha4XlMQpbrt4msT9+iQtQgxXGPx/51uG
         O2S3NlTdb5GBkrj1Yr76v8RsyLpcveRwkdHaWs0Im28CIMgjGRiHWaTtOckgheJRTXi8
         CvWw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Return-Path: <vilanova@ac.upc.edu>
Received: from roura.ac.upc.es (roura.ac.upc.es. [147.83.33.10])
        by mx.google.com with ESMTP id 88si2106310wrf.105.2017.07.07.04.26.38;
        Fri, 07 Jul 2017 04:26:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) client-ip=147.83.33.10;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Received: from correu-1.ac.upc.es (correu-1.ac.upc.es [147.83.30.91])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id v67BQYjv019487;
	Fri, 7 Jul 2017 13:26:34 +0200
Received: from localhost (63.red-83-51-187.dynamicip.rima-tde.net [83.51.187.63])
	by correu-1.ac.upc.es (Postfix) with ESMTPSA id 9C54D23D;
	Fri,  7 Jul 2017 13:26:29 +0200 (CEST)
From: =?utf-8?Q?Llu=C3=ADs_Vilanova?= <vilanova@ac.upc.edu>
To: Richard Henderson <rth@twiddle.net>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
        Peter
 Crosthwaite <crosthwaite.peter@gmail.com>,
        "Emilio G. Cota"
 <cota@braap.org>,
        "open list\:ARM" <qemu-arm@nongnu.org>,
        Paolo Bonzini
 <pbonzini@redhat.com>,
        Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>
Subject: Re: [Qemu-devel] [PATCH v11 29/29] target/arm: [tcg] Port to generic translation framework
References: <149865219962.17063.10630533069463266646.stgit@frigg.lan>
	<149865922142.17063.17637554632892697681.stgit@frigg.lan>
	<5e3f1bec-5597-172b-1ec0-0a823a4960b0@twiddle.net>
Mail-Followup-To: Richard Henderson <rth@twiddle.net>,
 qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>, Peter Crosthwaite
	<crosthwaite.peter@gmail.com>, "Emilio G. Cota" <cota@braap.org>,
	"open list\:ARM" <qemu-arm@nongnu.org>, Paolo Bonzini
	<pbonzini@redhat.com>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>
Date: Fri, 07 Jul 2017 13:26:23 +0200
In-Reply-To: <5e3f1bec-5597-172b-1ec0-0a823a4960b0@twiddle.net> (Richard
	Henderson's message of "Sat, 1 Jul 2017 18:54:05 -0700")
Message-ID: <87bmowebds.fsf@frigg.lan>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: Ec1TSr0oPbLN

Richard Henderson writes:

> On 06/28/2017 07:13 AM, Llu=C3=ADs Vilanova wrote:
>> @@ -11377,6 +11385,9 @@ static void aarch64_trblock_tb_stop(DisasContext=
Base *dcbase, CPUState *cpu)
>> break;
>> }
>> }
>> +
>> +    /* Functions above can change dc->pc, so re-align db->pc_next */
>> +    dc->base.pc_next =3D dc->pc;
>> }
>> static void aarch64_trblock_disas_log(const DisasContextBase *dcbase,

> Surely this belonged in a previous patch.

No, there's pieces of the previous loop that used dc->pc (calculation of
tb->size at the end), and the generic one only has dc->base.pc_next now.


Thanks,
  Lluis
