Received: by 2002:a17:504:749a:b0:1be9:327d:8ee3 with SMTP id a26csp642914njk;
        Thu, 17 Apr 2025 02:35:23 -0700 (PDT)
X-Received: by 2002:a05:6a20:1587:b0:1f5:6f5d:3366 with SMTP id adf61e73a8af0-203b40039d8mr8194890637.37.1744882523674;
        Thu, 17 Apr 2025 02:35:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744882523; cv=none;
        d=google.com; s=arc-20240605;
        b=Zjvljx6z5q1AvznD4072QCnlqs50Ny2hEvNvyOu480jcI9X6X5d1myeCcdzBLu2XcL
         Y4nLifu5ukInQD1t31pCswgc4R3qKwsoeMRshMezJv5q2CKed9PMxeBe5Ny448gcE+EU
         xzQgEWKBG7OOkpnR0pAEDghkun4pi0Tg01cleINNxjCQCr3GnTXBoOZGHjKqU0feN8uZ
         ygscMmXHNJ+jHaPq/B8g4j+KRtshYbZcnZPipv4Y1xC6pQ0WoF+3O+YtBRJdEi6hLnXp
         4hLxCmOSoJcOGjvr0RoPa35oG6ZWA6E3lGkB3rLzEpsFH6/7FGKOq3Rr+9as+GvBQPt/
         fq0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xO5EtXdo5R5SORB6VhGJS2vroOZK0eGIlzXzvwsNqpU=;
        fh=jkXS0MmLDtoslt3BKxwpQbfbG9pDeYJQJQXQKHmGL9U=;
        b=PBo6XLyPr6HpkxNjN06oYSZMm9ON0kB9fhe9v+q4bcOkg2yotFfwqzT3EKpdv7LcEA
         6uet3GSRKKkKwX2L7fmqxt9UO+0P4FSlnx0eHmUMYTyaRsTA+mqAmyKXJgMr30IBCDjd
         LzsPRH6r3qfE0C5ozxLfuGIt2bysjOBD6wCL1r8IOD1Mtl6ojusiLMA4w7Ixgk6zKeFm
         jVUMgE1GfcS6x0iO+m8xqCoYM4vOGDBZf/NUFt/HezGwaMJkXUIxZTDpbiULeZ2XgosW
         JVLOlj7wYxETbYuaMj3JbA9KBE9OB9DUWR2vNoL8lhrt8w5/RN955WAMCH7jn1/WrO3s
         BmQA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Qo3aG8fA;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-b02a2455564sor12978703a12.4.2025.04.17.02.35.23
        (Google Transport Security);
        Thu, 17 Apr 2025 02:35:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Qo3aG8fA;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744882523; x=1745487323; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xO5EtXdo5R5SORB6VhGJS2vroOZK0eGIlzXzvwsNqpU=;
        b=Qo3aG8fAb+EPXu8P6JULcF+4Lyxp65CpXaJFTBbzR7tQeBonjNF6VjdJgcmhFfyH1k
         PzaJ4eIyo7PsZExd4g/yPmAmw4AZoOngdo75GG5B8OAPIRDlOycYqcVGVDJnUtn3UD8+
         hfSPYyjc6eQzJdXXw/qD84hOuAvj5/q9zj6rA42Cx17IN/4L/D8Y/t2zzzoysJQEryfJ
         VAsXgIbLfL89Bxy5Zlh6JX0zzfmtr5fpmptaYXo+eNQV2I7ZRxuELiQv6HskcLIs2z+v
         uXr6u3ey4MxMkNByFVP7NowsdqL3aZ6JM1FOEKsQo7k9vKGVrb82zb7kJFJwhP3/8EBL
         uMsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744882523; x=1745487323;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xO5EtXdo5R5SORB6VhGJS2vroOZK0eGIlzXzvwsNqpU=;
        b=Mso3+zxcvhDwgaF+QmgtWrKeVWyQ2j9f8aKk0WaHTpBAaCC4Wd3yDgI3OYoSooKmr4
         YHCdZXQUYhofgK5oimH10Jotr1vlM5kU6Hc8mI/gBka5hTNq9H5caytLBI+CU5IgWxpg
         VUkHWTU6oxsECnhhkF75gnDjooBzICwmfURf+QQjOSfa3N60EtOi5GwopxTuNoBeB4L5
         llBhchQdN+JZW3RjIJjhyquK/hODyfmGqng/9vxGq3S1tqtxEBdutaUZqgqffV2aOolO
         KFkkVL9KP/hgzMGof7vFdFOHTfBtG6yAhSD0NRrPL2mXutavq6CaHZZ9tNcOQheTVRlC
         ZrAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSblxLFFvs8Cfkx0NS4V7llb3ngxLVLpL+vrs2VMoGN4Dr0odwkEL+6H//YyVbZm6D2TuOj2dgmxbXzcHQVSCAFKQ=@linaro.org, AJvYcCWxxn329oJgvE8/drFI71l1sNsLPgpu/4Hxs7ISG6roEukyVEMcFKYi753YSGYEX7j4U9FzYVFNaBhKKeqt@linaro.org, AJvYcCXHYwfxvdfl1u59KlfgkA0COBh2ZFXwgkhyD/o2BD49q21asXvuL2Kj3H766A/ykXFdR4LyQkD98HWz75CyVdauNg==@linaro.org
X-Gm-Message-State: AOJu0YyRTzWHhafuoEWt8KB5IN+DahgBQgke0PilfdpHDy051OTPHRog
	o1v1zliomThc39Zd6JYIRDiZ56+I6noScSdvlStsxvalFnH602pPvf/BCFR3rlfrYb4x+NpCAI8
	BNMeazXug3LiOE37aZo7H80AZbHoDifB/Z6A=
X-Gm-Gg: ASbGncvwx0GbUL78zfoZB+T5ReLW5AT/FCaaHyOc1KRwnP5Dbl1W+3BlRXpgCeyVZRE
	d9Zn23rTa+izB7bc/pcXOAUyQlWsbvog5PC6330fB20AN2Ja+hv7jJktwFBBZI6VRwhAtEq0wH9
	qiFtLbC283EWz+RCJi/P6sxkhbfDcQrQt+e8Cs5vDmLJUfTBa1oIgO
X-Google-Smtp-Source: AGHT+IEVLXnHZPcnnQ0+XGzkds0VJ6GfOiqMQh1ZBRq3Q9zGrdJIlmfDtyJzayKxEXYlV17znANc3AGZNGGP1of6Ik8=
X-Received: by 2002:a17:90a:dfc5:b0:2fe:8c22:48b0 with SMTP id
 98e67ed59e1d1-30863f2e193mr8333339a91.15.1744882523014; Thu, 17 Apr 2025
 02:35:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1744787186.git.ktokunaga.mail@gmail.com>
 <7ef485c860a0c26d2ddcf6a96430f5443deb5aee.1744787186.git.ktokunaga.mail@gmail.com>
 <a92737eb-786d-4ebc-87df-a5518417195c@linaro.org>
In-Reply-To: <a92737eb-786d-4ebc-87df-a5518417195c@linaro.org>
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
Date: Thu, 17 Apr 2025 18:35:11 +0900
X-Gm-Features: ATxdqUGQDeC-L_eWjOnDqk1i2h_NYl6uI6kQaJuEdutsEAhD4spiaw4v131Labg
Message-ID: <CAEDrbUaZYYxvW_D8ZS=qxOai06PiQQnN4mO2fjupPkwiNqqQjA@mail.gmail.com>
Subject: Re: [PATCH 15/19] util/mmap-alloc: Add qemu_ram_mmap implementation
 for emscripten
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
Content-Type: multipart/alternative; boundary="000000000000f58c390632f61e38"
X-TUID: sVHyRYjTzwje

--000000000000f58c390632f61e38
Content-Type: text/plain; charset="UTF-8"

Hi Philippe,

> Can we keep this code generic? I.e. with something in the lines
> of (only build-tested):

Thank you for the suggestion. I'll try this approach.

--000000000000f58c390632f61e38
Content-Type: text/html; charset="UTF-8"

<div dir="ltr"><div dir="ltr">Hi Philippe,<br><br>&gt; Can we keep this code generic? I.e. with something in the lines<br>&gt; of (only build-tested):<br><br>Thank you for the suggestion. I&#39;ll try this approach.</div><br></div>

--000000000000f58c390632f61e38--
