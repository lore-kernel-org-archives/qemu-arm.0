Received: by 2002:a17:504:749a:b0:1be9:327d:8ee3 with SMTP id a26csp643863njk;
        Thu, 17 Apr 2025 02:37:55 -0700 (PDT)
X-Received: by 2002:a17:903:247:b0:216:410d:4c53 with SMTP id d9443c01a7336-22c3597eeb9mr84694735ad.41.1744882675220;
        Thu, 17 Apr 2025 02:37:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744882675; cv=none;
        d=google.com; s=arc-20240605;
        b=NrKb2fsxOT3/eo+XMpfj68TPTfQoThl4d+ByW7BrODieeHZ1tlYZ49O234mN6ozh/I
         O4r8Nj9oRDdWErqxLXX6d3ZlS6Kan9Q1xnvrTqgeAYKMaQIHSc72zG470CRI23432IHs
         rjp2C5qIv4UcCI5XGc/e58RqDaTQ8jMryk3O8hZ7uyFvZblsYSIwxF4f8SjLCYmBVYZ7
         spQDjwAnRCnwJGasvbqQjHv/IneQ3zXqwzYczCzLcpcwflMz4Gi91/klhb7VSy4h0RmS
         VydNal5tEnYXGrn7yQEJz2hk8MAGjxpgOzfmsSCnML27LTfZA3Pmy6/Dg2SmRtV74usA
         l7pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VIHHhOHU9thrZULwqN7ovEV2VNYQ+ztuVgkUr/Z3nlI=;
        fh=YWoPeaoIh0DcMLEXMhQv00SWSQ2qFEOyO7XEcHT3n3w=;
        b=ArT+dXc36vla/RmIN5poEf94yp4iTO+mqSU5um533beUEwukUYwpj1tusjOSdZ7iD1
         q4dCvpfPhpywPG/xRsDOKqE3/h3zuA47gZUCd3iTYIp4vMZmlvH3hzMp7rhqJO/A5eEW
         u65pr2OsnathEC0ZeCsa2xW8i2I9pckvJ1EYaCIQ6mEvPt5VQI6lJ7CcNfFatP64c13T
         8Ojihk1fAnACowU8nbW2n9wR7nVtfujDZ5X29hdGkeGl8fBxleqEq6zWrHwBVka25C4y
         VWQEJWWBF6kAg7+Gs/r5pv8/Jpxks0lzoosLT30Ol8mFK05kO53Y+47MBsvc8as30xgW
         XvGw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=dKZwGLsg;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-306df2fc96fsor12152723a91.7.2025.04.17.02.37.54
        (Google Transport Security);
        Thu, 17 Apr 2025 02:37:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=dKZwGLsg;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744882674; x=1745487474; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VIHHhOHU9thrZULwqN7ovEV2VNYQ+ztuVgkUr/Z3nlI=;
        b=dKZwGLsg+zvQGDd7b3PveOHpPLQFqIFEwdPo/vYW5Zf0Hnp73i7EbJke+urffSv8sd
         RvzZHEh5QS/nvKJbLw25DCyekikSJtD5wz6mmIqXAWsYpxjTXCDinFfbEo+L/HVFdaz8
         VMb76esNi+BTLTGXNwI/SHVcDVctnRINCWkFhCxJpVvvFK6Rdq61a4eTjqXNYldc/WGW
         jnr19aPRDOEmJmBneQpF3XWbt+Iuq9bBJhO1DDfY/i+gyNZ+6mX23LFVnwAgI06CB9IU
         o4Id5TApkD+AGUJzDt0YLi8GzKUJOH0cG0+kfiBfy5lBzxNjUJKlPQx/i7zn9VI8t1dt
         N/9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744882674; x=1745487474;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VIHHhOHU9thrZULwqN7ovEV2VNYQ+ztuVgkUr/Z3nlI=;
        b=cnN1PEFQM5WaZa1AnGJKgUNBS5B8jtKRInueE/WiHHuuYcwCYA25H98KYd+ZdZsFkD
         E2AnTc2FjqYlH7Ex3rvj6l5b+ZEBJfqLcM8PBA1EumLmQzZ/YMFPRubHCuFNcSxrt0OG
         7ffuSfpG0dcvtmpkG6AX+5Uql/+I7hJoy9pKEdZG7qdbE9EgpzC+aI61QURL0rR5MA04
         z8JOmiilzV+M6BDldJKcsKPXjje/i1SjCfR/1wqm2JOaFyTc6qgfQdOUdtkAJM19z0vQ
         WM45yTbNedY9e28l/KhTrg0fZ9caWtE8udmVnhMZ8s8bEuYuqOvtjPh/b4mduoH1GZ1P
         5Y+g==
X-Forwarded-Encrypted: i=1; AJvYcCUvB9dNgTna7BiB1wW0NVHC7l72bOBBmNEbmJM6uY5mJj/e5b7MW/C1h6H/gOjKl1fSa1CHEVtRlmDEsduP+S2UUg==@linaro.org, AJvYcCWEK7nsIJs/ldthyyWEcY8lA8d/DpYesmB8LYwqWqF4HPeUDhsD1Qgd0KHlrNpdo4zYyeu/ScQF31SUrAe3Atypvv8=@linaro.org, AJvYcCWZJHHypyMpdd3iISMiL4T5Jgwv7jEUdyj9GU/gNtDsDrNvvr1R01HIeFvBQ7IpAaR/jxQouaa1leY3zEcM@linaro.org
X-Gm-Message-State: AOJu0YxRunk9fz2oElOMjYQzVpyHk49BbPW+Wt41vdij43rHSvZqTQOx
	e+lcGzH81gF+6BoN6eM0GIa7o+FErRHIqoTLBow3RSpW3vZwcViwhP6RuIEtGnpgQtBU8671wml
	k3L9nJzKPiPJammQPflau8gcmJGciT/1rCFk=
X-Gm-Gg: ASbGncsjP5MWKZUxTdX49m87EMRdEcdXkrNuDWlQvvzHqdotXT9SAmCORIQ7Xbv+BQY
	LCfSYx1uN6gFDY7p+05eq+s3G9xjcmr4RGVqRTVhmnRet+aM+D2xWptQZ1zdmbP6+W/e53tTwSx
	2g//buVSsTOh1E8Tj7d9C5JnLXDoTbM1v7fWt7jSuxi96x0OxK+/WP
X-Google-Smtp-Source: AGHT+IGEw9Ig9rsAuDcS+U8mEvnZBN113C69jDEuhXVah5myDghRCQFAujKFPMx05ApxSnY+XT049yJaBKqjFnQ6qK0=
X-Received: by 2002:a17:90b:2810:b0:2ee:d371:3227 with SMTP id
 98e67ed59e1d1-30863f2f79fmr8276090a91.17.1744882674626; Thu, 17 Apr 2025
 02:37:54 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1744787186.git.ktokunaga.mail@gmail.com>
 <835dfef61307a941cdb58331607c308238d37e00.1744787186.git.ktokunaga.mail@gmail.com>
 <c00e2bc8-3248-44a7-bf4a-87441f6f9c19@linaro.org>
In-Reply-To: <c00e2bc8-3248-44a7-bf4a-87441f6f9c19@linaro.org>
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
Date: Thu, 17 Apr 2025 18:37:43 +0900
X-Gm-Features: ATxdqUGrkd5pDO3oglO636PGnfGtSmhldiHWBdiYlXRlIjzH63vRphXYkdkBSJU
Message-ID: <CAEDrbUZxBDUsK4WzbjkxZfyRzM-ALup9YfLVBeh1rD8XuhGDMQ@mail.gmail.com>
Subject: Re: [PATCH 17/19] meson: Add wasm build in build scripts
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
Content-Type: multipart/alternative; boundary="000000000000fef8cf0632f6271b"
X-TUID: H9NofrOJOLSy

--000000000000fef8cf0632f6271b
Content-Type: text/plain; charset="UTF-8"

Hi Philippe,

> Does wasm depend on TCI at this point (no TCG backend)? If so, should
> we check TCI is enabled? (I wonder if configuring with the
> --disable-tcg-interpreter option succeed).

Yes, it depends on TCI at this point. Configuring with the
--disable-tcg-interpreter succeeds but leads to a build error. I'll update
the patch to include a check to ensure TCI is enabled.

--000000000000fef8cf0632f6271b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Philippe,</div><div dir=3D"ltr"><br></=
div>&gt; Does wasm depend on TCI at this point (no TCG backend)? If so, sho=
uld<br>&gt; we check TCI is enabled? (I wonder if configuring with the<br>&=
gt; --disable-tcg-interpreter option succeed).<br><br>Yes, it depends on TC=
I at this point. Configuring with the<br>--disable-tcg-interpreter succeeds=
 but leads to a build error. I&#39;ll update<br>the patch to include a chec=
k to ensure TCI is enabled.<br><br><br><br></div>

--000000000000fef8cf0632f6271b--
