Received: by 2002:a17:504:749a:b0:1be9:327d:8ee3 with SMTP id a26csp637378njk;
        Thu, 17 Apr 2025 02:21:08 -0700 (PDT)
X-Received: by 2002:a17:902:f688:b0:223:65a9:ab86 with SMTP id d9443c01a7336-22c358d9b38mr93594305ad.12.1744881668531;
        Thu, 17 Apr 2025 02:21:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744881668; cv=none;
        d=google.com; s=arc-20240605;
        b=J2GMFziKfJOB9X4J3Ito//vtuvMMnaX26OaOn5ZD8OqzDej3OSSf3g0k+Wubzm46t9
         4Qr8CmQN75rsrneUTaY4ML9CYsxtY0wSXcc2ndozGkrQxFUzTIH6OtX5LvUYSTc0/kLT
         OAmr5AlStS+ja5j4MdrFcu1NE40SbzPFyRpUOrbYEjwYAQEctIqRuv3b5gItZIGY8VO8
         DuQbWxP9eeqXEHzt6aOY6nuAqlLOxIt5TGsgP0PgXGSAFryPHGk0oLPmKikvfsKlsyvl
         xRmkepSEghS/gfrWA0KEipxGag+w4EyaGCJigh/T31ZU/HrkL34K82Jv/MzR6pWri5/q
         qnhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OG5KtvSbp7DuW3mb0sIa++3mxR7J3c6MDCmq573m0z8=;
        fh=IxYvq4Rp+C08gQTfkqh8Z0VvnfRpIGAaRQZF8AbP6gs=;
        b=P5+Ro1p905T3OqhKTp7PdInKPnuQTvXqvTO22HtVHpUrT0zf72WJvwx+36exf+cnVb
         ZbhLXE5U3ViJeB8iSy0rMINUqy+9J0TB+QjykP1Dulr2JqWgyMLVWFAJaH5Ih3d1Ruig
         BXTxmhv6FLJXyrMHj13iTjFLkOYLdmA6/gKDN45X5VrdrEnqmFS5+Egpc37KZQxFbIVg
         c/I6znRVe4mm1KkL30nk+M/HEbi0qBIX9Ltp4AvC0Kh35uIRQRE21Svq3dZyfJGhCs2U
         c/MPpwey4qmJjxvIoRbUgQq6XZH9ZbEd57IV04+aBe4lBW7GmOroCZhvHw4ijzNOi/cQ
         w5qw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Bom6A573;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22ac75a5790sor156035535ad.0.2025.04.17.02.21.08
        (Google Transport Security);
        Thu, 17 Apr 2025 02:21:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Bom6A573;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744881668; x=1745486468; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OG5KtvSbp7DuW3mb0sIa++3mxR7J3c6MDCmq573m0z8=;
        b=Bom6A573f8t8lnC3Cq/15ZTQTXWuOTJyG/hEyBTFp21MRUtiAipfbwEL4YHlGhSeBH
         4xvTQA5LLB3Gap245iE5j25gssJkr8YVseR9hTLaZp1siygzF+6UvtTVl1A1cLdigEa9
         feP4LiW7o2wlmu9cRGWvUBySQGZsf6WxeZR0TJvCooja3HoUyL8RIcRdxS2JVwdJFFPy
         1r+ZnCC2AMOUX5dcGtxMXcXdj72jlAJYSynRorP10bZmND2uOGCJWN8uahTNrsY++bki
         3ongmhRtP6wwoPYpL6JqSsb7pgx/xiEkuxpzN0bDuIYDCrpvrOZHKbp6v8iZkJCXFaiZ
         xuyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744881668; x=1745486468;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OG5KtvSbp7DuW3mb0sIa++3mxR7J3c6MDCmq573m0z8=;
        b=VO01XXyzkQ7sgD4kfEEnxOkwmQP8OO9FsyO3bl9V5wDLc594Aws4FrRrmc13y3a5Aj
         7HKOHV35/nQ9fA/s6l6ZV+GzaiDWrMbefiTl/gQ5gmM2XWbqLvpPz5mzSe3D5mwLNDE8
         O9+hz5IrbNPndfCFzYj4tJGtxY6IWREjmp9Uj5oZU2Nr8HT3sVdqzT69iMjEm5zjsCMT
         pmWKM/QTZUsgd/Yjgk7N3rc2Z1DFcIvMp/x5dsL5GJbJFElt8kfYzbkpFcg+zedZf+RU
         YN21fdkbAaMvcVxIGmKgpKUimhuZkUEiMeDqev/BAwOHunVpP6Ax1XF2364+skjxJeWP
         L+rg==
X-Forwarded-Encrypted: i=1; AJvYcCUAkTnjBu/RK0X8acYyrQk+P6etOiMNHB2RrYMtX79fw5yqF2FrYoGw+hdNc2NRfLotAGQrBBL3@linaro.org, AJvYcCUmtvUotxyfz1mwGPeQBS9hWykPnuZxf/FRBKFXN2eKy6jlKli//Ima3qM/LqWLu4DdsHoeCjUJ4xAFy8GzjkW8Hg==@linaro.org, AJvYcCVyeCOFKat+O9GiP+i7dPt9bTXO7XYImDk19fCAnXbV55rPJpfJWUJn403W9txQdHcyRe1eNSO1UhrWh5iP@linaro.org, AJvYcCWLbGTOzysvVeLyu68hxUoPRwZbrPQ4Id0bwJ02qgfD3uwuJrIeE8W9rJja7KA+WeUJVwl0KzvqnHJXa+EfaaxHWJU=@linaro.org
X-Gm-Message-State: AOJu0YzaTwWZrW+JMpy9rbRu3nlcysFqBVFK8bJ9C2YpNNWn8qGDF2t9
	paFAjo1N4tULADGHhSU9wKsTkoe7mJBHZTacothEomA2b4MfXs6gbY/bkg8lEIO5KzjGrI5v5z5
	7/fAsTIRaN04RorHHREsppo6y6Qs=
X-Gm-Gg: ASbGncuauP2EdQT99RkDAfSt0aslaRSqGUiZIL/ehwhEiZT/EE446wSkPeMDKOvoZz/
	j9tmZd1RW+CBLwx1Zg1RYQjWl/84I1I5Ux3uGKiZ1szkC3oO0p79sbVKaAvfMYp6hbx6tZ9lS3P
	XuQl7pDYobKm91Wp1ygEzojQmif4gS/nxOOAxcx6lqvv9XpvmbkQXn
X-Google-Smtp-Source: AGHT+IFtpuAcuk2tOeXMOs0Bgazy/F4BdxyEAnP7gxX2qYDbDgpkI0WSTiErJIKXrWLlH7zkiuSEdQglorWfNjkU7l8=
X-Received: by 2002:a17:902:ec8b:b0:21f:35fd:1b7b with SMTP id
 d9443c01a7336-22c35985749mr63251815ad.50.1744881667907; Thu, 17 Apr 2025
 02:21:07 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1744787186.git.ktokunaga.mail@gmail.com>
 <f6e0e42ae3491564478929e412991c2a16ee3539.1744787186.git.ktokunaga.mail@gmail.com>
 <263e4803-65d0-5a41-4031-99766b067915@eik.bme.hu>
In-Reply-To: <263e4803-65d0-5a41-4031-99766b067915@eik.bme.hu>
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
Date: Thu, 17 Apr 2025 18:20:55 +0900
X-Gm-Features: ATxdqUFAWifqrroQkKwXjdJ39LiEwm386rnDj1tdoJGH6O7N8ll_3L_Kh732Fy8
Message-ID: <CAEDrbUbUzgb7Bp=3iU88_0BB0bdPKMHEFM6KNy602Ux9vqrc=A@mail.gmail.com>
Subject: Re: [PATCH 10/19] include/glib-compat.h: Poison g_list_sort and g_slist_sort
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
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
Content-Type: multipart/alternative; boundary="000000000000fdb3490632f5eb74"
X-TUID: 0jS34dzz0kNh

--000000000000fdb3490632f5eb74
Content-Type: text/plain; charset="UTF-8"

Hi Balaton,

> Typo: instead

Thank you for the feedback. I'll fix this in the next version of the series.

--000000000000fdb3490632f5eb74
Content-Type: text/html; charset="UTF-8"

<div dir="ltr"><div dir="ltr">Hi Balaton,<br><br>&gt; Typo: instead<br><br>Thank you for the feedback. I&#39;ll fix this in the next version of the series.</div></div>

--000000000000fdb3490632f5eb74--
