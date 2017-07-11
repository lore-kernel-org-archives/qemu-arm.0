Received: by 10.25.44.15 with SMTP id s15csp5023668lfs;
        Tue, 11 Jul 2017 08:57:07 -0700 (PDT)
X-Received: by 10.28.54.217 with SMTP id y86mr3223761wmh.81.1499788627354;
        Tue, 11 Jul 2017 08:57:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499788627; cv=none;
        d=google.com; s=arc-20160816;
        b=uvagvze2IQlNzOGbm6/YCspN2rLGFGdNXf1WjvE33hrXgBHmWBvZNfh99l9d/3s28m
         9mzz/ZO7neYfAWPgT70JWSx3fG3CypzaiQ7TzQyqheFtW7oF29zoiQks9YO9Q7jhu4yM
         mWk/n1jC8IPPlsMw+AI1yWvN81g+5IZ9rclrRQHzDo6fGLZyTYNmvxY39SB4xpW/IjyF
         xYZQeE+wUYe6UsSQ/WnH+89utQiXWLHMmVK/3jImQ6m1XVH4NTkuP+9dlVuSArAFIIiG
         iKBvVicrn04GyadwnRv5TgHbVwPqyRi81Yw8wRpqeDZrGh9wnlrTbQnsiAbroRL322ZV
         1ptg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:date:mail-followup-to:references:subject:cc:to:from
         :arc-authentication-results;
        bh=Al3XNxgh/EWM+LTo86Y5togKwCJ8g3ts/TRM2N1vwVA=;
        b=XeCnkm2C9kMFhrjTbTmUGi0DfY3Uo8O7ooJ/LVL2A8Xxr8oh4Oq+AlYz/ajwO73jqr
         XYIM+hkNFc4SzyJutB80kvvnEMihWOPlGMLMqGjg4+e7tZgmmq5+S4thX3zpbGoVZMhQ
         XcNUx4DMPb+hojCkCicAzoD8YziqOu0/QBo81QfQssPfMV1iOgJd/dFkgBeQIrTgJ9vv
         6OuYF1xNDYGEVDjHi1bnN9v5zGeety9Gg1cDrGWFc+EsRZ2WPHo74UVvEXHrCyvQQeSr
         VYp9sUGIS/WaZTtVjuHqLMY8Ih8t4w/ufpx5derchkjvCVuQ4AxODMrufNleAyytOIwg
         2Ghw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Return-Path: <vilanova@ac.upc.edu>
Received: from roura.ac.upc.es (roura.ac.upc.edu. [147.83.33.10])
        by mx.google.com with ESMTP id w205si2092284wma.43.2017.07.11.08.57.07;
        Tue, 11 Jul 2017 08:57:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) client-ip=147.83.33.10;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Received: from correu-1.ac.upc.es (correu-1.ac.upc.es [147.83.30.91])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id v6BFv2Co013651;
	Tue, 11 Jul 2017 17:57:02 +0200
Received: from localhost (unknown [132.68.137.33])
	by correu-1.ac.upc.es (Postfix) with ESMTPSA id 10C6C3D8;
	Tue, 11 Jul 2017 17:56:56 +0200 (CEST)
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
Subject: Re: [Qemu-devel] [PATCH v11 24/29] target/arm: [tcg, a64] Port to translate_insn
References: <149865219962.17063.10630533069463266646.stgit@frigg.lan>
	<149865801156.17063.15618379976159104550.stgit@frigg.lan>
	<244b5aab-8863-3139-f252-09cc02333eda@twiddle.net>
	<87inj4ebqn.fsf@frigg.lan>
	<c35a41d9-4c9d-3daf-2759-17a784b8711b@twiddle.net>
	<87a84gcfv6.fsf@frigg.lan>
	<9611b022-c352-0191-67f6-716b36c8f1e6@twiddle.net>
Mail-Followup-To: Richard Henderson <rth@twiddle.net>,
 qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>, Peter Crosthwaite
	<crosthwaite.peter@gmail.com>, "Emilio G. Cota" <cota@braap.org>,
	"open list\:ARM" <qemu-arm@nongnu.org>, Paolo Bonzini
	<pbonzini@redhat.com>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>
Date: Tue, 11 Jul 2017 18:56:55 +0300
In-Reply-To: <9611b022-c352-0191-67f6-716b36c8f1e6@twiddle.net> (Richard
	Henderson's message of "Fri, 7 Jul 2017 07:41:49 -1000")
Message-ID: <87o9srhsqg.fsf@frigg.lan>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: A8HIdqhYpdN3

Richard Henderson writes:

> On 07/07/2017 07:32 AM, Llu=C3=ADs Vilanova wrote:
[...]
>> I can restore the NULL approach or add a default empty hook implementati=
on
>> (translator_ignored_op?) if there's a strong feeling to change it.

> Ok, we can work that out.

I'm not sure what you mean. Leave as-is (targets must define all hooks), ig=
nore
NULLs as before, add a default empty implementation for each hook?


Cheers,
  Lluis
