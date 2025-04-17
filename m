Received: by 2002:a17:504:749a:b0:1be9:327d:8ee3 with SMTP id a26csp644396njk;
        Thu, 17 Apr 2025 02:39:23 -0700 (PDT)
X-Received: by 2002:a17:90b:570f:b0:2ee:cded:9ac7 with SMTP id 98e67ed59e1d1-30863f2f5admr7572753a91.20.1744882763303;
        Thu, 17 Apr 2025 02:39:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744882763; cv=none;
        d=google.com; s=arc-20240605;
        b=C5PaMg1S2YDVUQaJw50hNJb71x8pY4xl8ZImftjjh9oWshEM/CXkTofeG6BRz6ONnf
         0kNkuyBQf8T/l7w2NBh9t/I5qkAS4RIFPHETY8lsl4SmaNlCjqhWVzy0pijvJXFnFmDU
         Px1jL0RMc6o7/1xmBA1HhLpazlydG3lu02pkSqvJ8xMZXiyxXEhXy6SF6XN7CDElmWvj
         4CuSZy1/RWF4VEp+w9PGZW8EVDOar2ZMBwo1HQ7LTtGN9AKn8qSbZthvFicin0B5XA8v
         msVWmnq62UpVYq6Uj1ABkTsg0zqP24QJO/oPAlQB19fl1itZk4b4EcqTbhC3/TfNq7Bq
         7Grw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4IUwotaB6QpXvayv7s4yBerKtK+FrKs7EK6XfCGHghE=;
        fh=Khm1GxviNJFKyopvKX3EPKEBi5CyTw8LiaQR1eJMR9c=;
        b=RRV3zdu4RPLvtiOlpJcR7dC0j/jOicTSPaNHc37NHZm+Qloc5VPKQltiJlAexlM808
         jSQ3ig/auizu+//9LGn+rpn/8dSVEad1ODrHqlan8BNaN+HnWm/vfrJ6q5IioWEXF35z
         Qro5SwfcTpQxhnHQo76gClmVh2tZsHhRVGfFVASd4SaGXzCd/qO7zaf7go7h4Yi6DDSF
         nzBQpA82bSWs/K7LEmehw4G2Oiu1DnL3V/j3V62h0IGkIJrHWX1W+02Jiu2tbctsXRov
         XLXu4G7rcwZLoKrKm2QYq4kH3mUrqM0CJg009PMB2fFOcxOYbQf5MVckdd6pR3nKvS+r
         60IA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=g7Ji2fmu;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-30818827cf6sor11276024a91.8.2025.04.17.02.39.23
        (Google Transport Security);
        Thu, 17 Apr 2025 02:39:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=g7Ji2fmu;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744882763; x=1745487563; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4IUwotaB6QpXvayv7s4yBerKtK+FrKs7EK6XfCGHghE=;
        b=g7Ji2fmu1Liu40LtHrl7GTI/RAVdrqXs06fbQg3U9g3Uoez0jz+vUrqTOUGBRtkK8/
         F/VvyuXqvZEj2PmIle7WFxpdivYHWTf7e8IQedEUaPcIC26UPnCZNdjWeVhSrTrIiF1q
         5tQ4wGzCtT+CFtukJ9Dfk2T+yAvpWeYuNm32+yxmiRchJR8hbs7QRENv9E4fCwe/Z3wU
         1GTP52kJTPLA6lnCEEsi/vGDb3vv+gbdIBgzWcXOgl+AjkFifATlctRBEO45In2IYxgG
         GHZ5ZSSLVOm6pJ6NefSc7sArGn4606hHVg0FdSCVL/LK5DxYHd527MAiBRUt80tUVPzV
         BFXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744882763; x=1745487563;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4IUwotaB6QpXvayv7s4yBerKtK+FrKs7EK6XfCGHghE=;
        b=r55hxKnoxPqCdCfpWopqCR2ic5ia3DlYIPyuvZq1IScDdvldG0NMyx+b7rlETBnm/l
         eZqhdsH2Te/o9cTrgWgioJrRUpv+ltWTyaQ6S0cq/ZPawYcccFNi5Owfa0I7gEfIKBTw
         m6ILe+alUBFeBerBpefFSsH76iA9FytqqILOT/CkDTUzCjNmB3XFnGPqr1LswAv4SJmV
         guT2yPTczUSFhgrSWsAf3HaCcwLzGAv1Cc8s9MvJnfLIiHz/P3aTUG5hrrS4J5a0FsFB
         OsRcfgQ2Vtvs9JQhts8fMd0DucKmsXo4e6b068B79gUkTxTZ+JMlodpLWV1HOPWwVO6a
         kDgQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0roxWPwzIVS7D5sISrkTyiaJo6atylhjPonKEk+RIJ998/XOUtmSOFI46Z3UwEPxGq/dGLQTT+4f6OkikGDfb1gU=@linaro.org, AJvYcCU1WYHZA7lFxWrmlj8aXrYrZeq9P2HwcnnkywTrDCX8CMxyAQCBrnxRCYauK0z1HNYXfv56dHtn9AdJ63WJUmhHhg==@linaro.org, AJvYcCXVZy6eMJIrm+8EDsbOLcauodi21J4RhmESSF1U/UJ5CatESmli6m/i49zMD029QMj2/DJwlnN3MVrJxQ+3@linaro.org
X-Gm-Message-State: AOJu0YzK03af828ourPVI/4zpctl/WVpkSJVM3E9zOU8ShTtoS3vTEWm
	vXzV3VUsoZbBG+oPizhAzMgMVRZd2RC9j/YuE/BQxM9kpa3e1d9Q6ZAhMw4HPy6X478HwAo6YwO
	L4O6J7BG8KjJypLAJMW5qk7Evk8C7DyL7xVk=
X-Gm-Gg: ASbGncuRDyOZtLrvz8j5c+fvqX7Ejkh+7MiygWnZUBP262JnWZ7g73Ap0M+S9G/b078
	7pz6aJo2QJwLqB7lK5ARpSkWdEXvMZKzFk8GK5rFyiZkYTWkU+xsr8DTrFO4StwZEz37N+UthHl
	5XRAbnbx8k+RB0pDp5ThyZntSLYdvd8kSjTrDXUdYMis0Cue+tc7tI
X-Google-Smtp-Source: AGHT+IFGO09VYMrl10ZjGYqmmRzbxNWDwxetel7yMJnEh4wV5kv3PfNYs8qKTOf1V1Q+IQsx1zdNjYz79TSWIB1rIfI=
X-Received: by 2002:a17:90b:57e6:b0:308:5273:4dee with SMTP id
 98e67ed59e1d1-30863f2c4fcmr8208361a91.15.1744882762526; Thu, 17 Apr 2025
 02:39:22 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1744787186.git.ktokunaga.mail@gmail.com>
 <16055d17cadcb5f4c23203218cb8fc3fa81d1754.1744787186.git.ktokunaga.mail@gmail.com>
 <91dc0def-2e17-40c0-a66a-c5992f10eb3e@linaro.org>
In-Reply-To: <91dc0def-2e17-40c0-a66a-c5992f10eb3e@linaro.org>
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
Date: Thu, 17 Apr 2025 18:39:10 +0900
X-Gm-Features: ATxdqUFMJQjUjwv7_rm5KRUGYLctreEWeKcrZ-VtCgLHnxVjiLH26TVqskdecX0
Message-ID: <CAEDrbUZHJ0_hfmXB6Zfn2UKCu53eeqNGwzdtr7Lsuee2rGdKKQ@mail.gmail.com>
Subject: Re: [PATCH 18/19] gitlab: Enable CI for wasm build
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	qemu-devel@nongnu.org
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Thomas Huth <thuth@redhat.com>, Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>, 
	Mahmoud Mandour <ma.mandourr@gmail.com>, Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
	Pavel Pisa <pisa@cmp.felk.cvut.cz>, Francisco Iglesias <francisco.iglesias@amd.com>, 
	Vikram Garhwal <vikram.garhwal@bytedance.com>, Jason Wang <jasowang@redhat.com>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	=?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Eduardo Habkost <eduardo@habkost.net>, Peter Maydell <peter.maydell@linaro.org>, 
	Zhao Liu <zhao1.liu@intel.com>, Nicholas Piggin <npiggin@gmail.com>, 
	Daniel Henrique Barboza <danielhb413@gmail.com>, David Hildenbrand <david@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Ilya Leoshkevich <iii@linux.ibm.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org, qemu-arm@nongnu.org, 
	qemu-ppc@nongnu.org, qemu-s390x@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000003c35f70632f62d58"
X-TUID: 1EqGyR6D1CPK

--0000000000003c35f70632f62d58
Content-Type: text/plain; charset="UTF-8"

Hi Philippe,

> Probably nitpicking, I'd add the Dockerfile first, then the GitLab job
> in another patch.

Thank you for the suggestion. I'll split the patch in the next version.

--0000000000003c35f70632f62d58
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Philippe,<br><br>&gt; Probably nitpick=
ing, I&#39;d add the Dockerfile first, then the GitLab job<br>&gt; in anoth=
er patch.<br><br>Thank you for the suggestion. I&#39;ll split the patch in =
the next version.<br><br></div></div>

--0000000000003c35f70632f62d58--
