Received: by 10.25.44.15 with SMTP id s15csp1974158lfs;
        Sat, 15 Jul 2017 00:56:59 -0700 (PDT)
X-Received: by 10.28.93.74 with SMTP id r71mr332758wmb.126.1500105419639;
        Sat, 15 Jul 2017 00:56:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500105419; cv=none;
        d=google.com; s=arc-20160816;
        b=tlKPEkYwoqbfrbofBlNqmR/Hphzosqg+B+kluFXe410Ueh7vLux+MHOH1HGLGxRseP
         Xu3xjalkZohNbCgQ5AG/o5hvmyqZSeK1pHbmJtmTgALJ3w5PFAKKUrIGLTqpNdwbf1lF
         /Y9cRBvYQfg5kREQp2vEQ/KpokbiwsfxQFl+RSUnVhHAQQQJB1oh1QBB+ZHG4MvY2+nH
         eDqijjrSfZEnIu2sr0Kco53paOFwPFEnUs5sK20Jv8wjOKE0XJd99k1vbFVUcIF2kHW9
         PZcOM26y/Zw3/POplrkrvVFsQJl+z+I0hsVlwumORr5IMyh9/vaWMTaRQUsvBGEV1DrB
         6wUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:date:mail-followup-to:references:subject:cc:to:from
         :arc-authentication-results;
        bh=mo7LNYvruWA754Z/kzmPxkWWYyvz4oDqcLOs5a7aZFQ=;
        b=YCIyZyeiLGVt2F+cUzykEGuGqMMP/V6OBzpf6Kef0z5VIN9gsztgYFE/FxZHAgTyOe
         Y9fBct6dxIaovm0QQEFie349DSga5sTX0Lrrd1zV/CzeKDRPk6Z2jVlPH3oEUPIA5rVU
         uCzGW3mj+8OpE8h12Z9JjhVitON1JIT6Erp2yLm/HlZ1JbbMY4qv5UuYvH+rGhjqLhB2
         YoBl54wvdzYSrNq9js8avrKlA/HqdcHsNe7KeREpOswo1ydtbu1NSwM9LdSMxtzP+4pj
         ESwAJfx2id/VweHj0M9CNJj55dR2H37Oayoc+L2MlMu9zPVsetBAs2+FpdzFWXo48YWl
         CCOg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Return-Path: <vilanova@ac.upc.edu>
Received: from roura.ac.upc.es (roura.ac.upc.edu. [147.83.33.10])
        by mx.google.com with ESMTP id l8si4305999wmg.196.2017.07.15.00.56.59;
        Sat, 15 Jul 2017 00:56:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) client-ip=147.83.33.10;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Received: from correu-2.ac.upc.es (correu-2.ac.upc.es [147.83.30.92])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id v6F7uusB005112;
	Sat, 15 Jul 2017 09:56:56 +0200
Received: from localhost (unknown [31.210.188.120])
	by correu-2.ac.upc.es (Postfix) with ESMTPSA id 495715D4;
	Sat, 15 Jul 2017 09:56:51 +0200 (CEST)
From: =?utf-8?Q?Llu=C3=ADs_Vilanova?= <vilanova@ac.upc.edu>
To: Richard Henderson <rth@twiddle.net>
Cc: qemu-devel@nongnu.org, "Emilio G. Cota" <cota@braap.org>,
        Alex
 =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Peter Crosthwaite
 <crosthwaite.peter@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        "open list\:ARM"
 <qemu-arm@nongnu.org>
Subject: Re: [PATCH v13 22/26] target/arm: [tcg] Port to tb_stop
References: <150002001195.22386.4679134058536830996.stgit@frigg.lan>
	<150002534291.22386.13499916738708680298.stgit@frigg.lan>
	<28a48f7c-930a-389b-b39d-64c43654cd04@twiddle.net>
Mail-Followup-To: Richard Henderson <rth@twiddle.net>,
 qemu-devel@nongnu.org,
	"Emilio G. Cota" <cota@braap.org>, Alex =?utf-8?Q?Benn=C3=A9e?=
	<alex.bennee@linaro.org>, Peter Crosthwaite
	<crosthwaite.peter@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, "open list\:ARM"
	<qemu-arm@nongnu.org>
Date: Sat, 15 Jul 2017 10:56:50 +0300
In-Reply-To: <28a48f7c-930a-389b-b39d-64c43654cd04@twiddle.net> (Richard
	Henderson's message of "Fri, 14 Jul 2017 07:33:46 -1000")
Message-ID: <87a846b0al.fsf@frigg.lan>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: qB7YFyqUUN7A

Richard Henderson writes:

> On 07/13/2017 11:42 PM, Llu=C3=ADs Vilanova wrote:
>> -        dc->base.is_jmp =3D DISAS_SKIP;
>> +        dc->base.is_jmp =3D DISAS_NORETURN;

> Really should fold this back into the patch that introduced SKIP temporar=
ily.

Sorry, I don't understand what you mean.


Thanks,
  Lluis
