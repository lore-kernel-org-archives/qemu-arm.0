Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp107914njc;
        Fri, 13 Jun 2025 01:36:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXJl476S1y6dgGpSiden+mqLyU2fNNLoPZUseKf0cWzYoWe+ydpkTiEvudli/NEFvwSv4Vc8Mv13lHK0Q==@linaro.org
X-Google-Smtp-Source: AGHT+IEe80AfWB0v7s7s6TtRLbw1wbuUuelYRE/fzOyGrWQnGiu3/zlGbf0Lk6n4uy9a+HPq5qA1
X-Received: by 2002:a05:6214:27cc:b0:6fa:fe02:8219 with SMTP id 6a1803df08f44-6fb3e57c9ffmr32157386d6.7.1749803792077;
        Fri, 13 Jun 2025 01:36:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749803792; cv=none;
        d=google.com; s=arc-20240605;
        b=WBPiUuHIqz4yjPGsPjre7715GOh/S5wJE1vv6HeyVBp4K7VwNs8ZTI/hh1aTWvnPiC
         Rpgj07ggeev+hUCAZWszXpGjtvskebWrk0aVYSc23WQY7zDXgFGVMrp4wlASIU/trfN+
         gc9J73szr+XPIjYFlAsw7aIWJLoYvrm6+v9Kbtb/QLB2IG/oaurXJ8XiVBV5H6zWZZzA
         skQ1zPA0dxR292FCA8Xq4rxipGLSNA9b+z5EwTPtuLx8RA8Gs4VzXixy8XZGBhg9PtQe
         oFQr+mBUNDsijYptmlLBpudd7Jpew70EQ1jT1JnpHFvkozo4pA7QxbqQt4e/H6Et5aQL
         0bHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=/I6+d9Yd3eLTkCHtR7fFtt05vaPNjoHu7+WkpC52NnU=;
        fh=sNJLqsEOa2NoJjWo++TWwJEsM2GpzElEP0K0btXHaQY=;
        b=k6xARHcAiD7cB+eT5fq9Mn1vdBkKkTOldvvEEfNY2UYsus8MgkwklJNLUntd+WHand
         27dS32BFG/ta2hmLgXlU00Ysx+uYac66/eGn0LLZSKLFSAHn2D7/NSx/0vgAM+GqL4kV
         vyjxiIzH4Yw5zcz8mPtxzmWV5BcMv7BGyRUWVOcX0VswOgwrC/M1z4D/Rh/9Ig8I8Nd6
         39N2aRSYwwEkuNIcOUDUNS5Lkwb1ubdVydvZkGxaLfXyKl6SScWdO8WfSpqEQh4Y6Mgr
         40l5ToBaI/EwCnBAUgi6CG73ueDWXmeaL1ZmBjnX2gy9oV7z4J6vsj2nf7Pp+1ALqUeh
         KHsA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=f866kL+d;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fb35c1aff1si35106246d6.395.2025.06.13.01.36.31
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 01:36:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=f866kL+d;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749803791;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=/I6+d9Yd3eLTkCHtR7fFtt05vaPNjoHu7+WkpC52NnU=;
	b=f866kL+d89iVL4Z8N9tTK9I2QrsOcJhc7nkr9IsADw5vD3R8gMFlZpLOr7xPM2K0Lqt+1S
	Qr98/GzgB9wYyEhYUC/LHtQhIgnKMXtY4bKptR88Xe/3DqTFCvtm4sowYZihICVOOrm7V7
	ydCWVv/ksJOcFsR90tFJ0cC6aCRyy70=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-h87zie06N12oLF-xyCVALQ-1; Fri, 13 Jun 2025 04:36:28 -0400
X-MC-Unique: h87zie06N12oLF-xyCVALQ-1
X-Mimecast-MFC-AGG-ID: h87zie06N12oLF-xyCVALQ_1749803787
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a4f858bc5eso1308329f8f.0
        for <alex.bennee@linaro.org>; Fri, 13 Jun 2025 01:36:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749803787; x=1750408587;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/I6+d9Yd3eLTkCHtR7fFtt05vaPNjoHu7+WkpC52NnU=;
        b=nZJEZUWdllIkz8dVWYhuSWXpXpaRFf6YE7kciaAu9ErM9cZ9NXq9DhW2B5ObZYOEg4
         X/uwiiVcdobXLsIKmQKAMP5cSXd/+H8Ntb8zVozFBzbOWBC+hXql3UNj+kcVUoQ1ofjJ
         Q9cFYNRo5BdHi9TDj3lKP1SoL9WNMs9T1nu3C6QYAr/M25Itrodgk2oWk/oBPbmY09Ar
         DlKa51vVGS8l7cqKv5pbzjYwCWfbfcBXdwFgBT8G8alK9pLKhS2ebM64QAbYAnbqqcSN
         HNAf6w748RASou0T4hN6DfhE6gTO9MxJSAkCfCfvZKjl41dF2UkLZA8qh7Sx5TSG46N5
         licA==
X-Forwarded-Encrypted: i=1; AJvYcCWmSlnAkcRs0CfgaTkj3nDZL8x/Fzlzv91bSDexllOWW7AG4PwTgXpNlU617MABo4Toisg9rbhm08EiVQ==@linaro.org
X-Gm-Message-State: AOJu0YyewCdsJ9QcH9C+qKEPXZqb8FeGawfujPPij2izxNikb+uwLJl+
	Uu3hURlKS7nmkCkvR6Fsj1orbRhxQwEqA8liuM9Tlikjp2v7aqxTKL7So/yNE52sNcBqiqsCw8W
	VcXCOooKmk/KduHyn4Elc/gMF1fA6BoDVC4QZuwOYxlhMVOvlvEiqV7RqaA==
X-Gm-Gg: ASbGnctY1230gUHXUovFQR0nonwRZwY/d60m86kiuKwydiu0z3DAVrzeJQ04YfX/4BQ
	PCSclEqNVmhCdfmLLLvSx63yWBBQB9joDFnk7g41n+JsTJQ5zA1bla4jJw14e3jbeU+8alhfSep
	zYj25ONC0HmWKK2stZwoaKuKY0wo/dKNq2eaDSklFbD/4Ql1XgXGOuo7Lrr1u/HTVNWZS05DgCR
	BMlf4+360Bm4h/d1PZhFkqXmOziGuwiXRgMR4U8kWC+fGDsqo3qIAXIvq1EoAG4JaFsWHhVsqtQ
	CPGy4t436e9ip9PgnKMhOILmUis5HBI/8ZL7I7L5ALtlvDVxfI5DbSzGvmb+tQ==
X-Received: by 2002:a05:6000:1a88:b0:3a4:ec32:e4f3 with SMTP id ffacd0b85a97d-3a5686bca97mr2034707f8f.17.1749803786938;
        Fri, 13 Jun 2025 01:36:26 -0700 (PDT)
X-Received: by 2002:a05:6000:1a88:b0:3a4:ec32:e4f3 with SMTP id ffacd0b85a97d-3a5686bca97mr2034642f8f.17.1749803786353;
        Fri, 13 Jun 2025 01:36:26 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.4] (ltea-047-064-114-027.pools.arcor-ip.net. [47.64.114.27])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a72cd3sm1675721f8f.32.2025.06.13.01.36.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 01:36:25 -0700 (PDT)
Message-ID: <7e66e758-da47-47eb-9114-22f07e1ffdc9@redhat.com>
Date: Fri, 13 Jun 2025 10:36:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/12] python: convert packages to
 PEP517/pyproject.toml
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, Yi Liu <yi.l.liu@intel.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Helge Deller <deller@gmx.de>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Fabiano Rosas <farosas@suse.de>, Alexander Bulekov <alxndr@bu.edu>,
 Darren Kenny <darren.kenny@oracle.com>,
 Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Ed Maste <emaste@freebsd.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Warner Losh <imp@bsdimp.com>, Tyrone Ting <kfting@nuvoton.com>,
 Eric Blake <eblake@redhat.com>, Troy Lee <leetroy@gmail.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Michael Roth <michael.roth@amd.com>, Laurent Vivier <laurent@vivier.eu>,
 Ani Sinha <anisinha@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Eric Farman <farman@linux.ibm.com>, Steven Lee <steven_lee@aspeedtech.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?Q?Cl=C3=A9ment_Mathieu--Drif?= <clement.mathieu--drif@eviden.com>,
 Maksim Davydov <davydov-max@yandex-team.ru>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Paul Durrant <paul@xen.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Anton Johansson <anjo@rev.ng>,
 Peter Maydell <peter.maydell@linaro.org>, Eric Auger
 <eric.auger@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 qemu-arm@nongnu.org, Hao Wu <wuhaotsh@google.com>,
 Mads Ynddal <mads@ynddal.dk>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>, qemu-riscv@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>, Michael Rolnik <mrolnik@gmail.com>,
 Zhao Liu <zhao1.liu@intel.com>, Alessandro Di Federico <ale@rev.ng>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Hanna Reitz <hreitz@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Hyman Huang <yong.huang@smartx.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-rust@nongnu.org, Bandan Das <bsd@redhat.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 kvm@vger.kernel.org, Fam Zheng <fam@euphon.net>, Jia Liu <proljc@gmail.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Kyle Evans <kevans@freebsd.org>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Peter Xu <peterx@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?B?RnLDqWTDqXJpYyBCYXJyYXQ=?= <fbarrat@linux.ibm.com>,
 qemu-ppc@nongnu.org, Radoslaw Biernacki <rad@semihalf.com>,
 Beniamino Galvani <b.galvani@gmail.com>, David Hildenbrand
 <david@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 David Woodhouse <dwmw2@infradead.org>, Eduardo Habkost
 <eduardo@habkost.net>, Ahmed Karaman <ahmedkhaledkaraman@gmail.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>
References: <20250612205451.1177751-1-jsnow@redhat.com>
 <20250612205451.1177751-2-jsnow@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250612205451.1177751-2-jsnow@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: eANrPiv3xyVavDS7R36Wziigh2wvRWzjHGv9Jxzfhro_1749803787
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: Kq9CaM/m+1ht

On 12/06/2025 22.54, John Snow wrote:
> Newer versions of setuptools increasingly expect that packages are
> defined using the pyproject.toml/PEP517 packaging layout format. With
> 3.9 as our minimum, I believe it's finally appropriate to make the shift
> away from the legacy packaging format.
> 
> Update documentation and dependencies that change as a result of the
> different build/packaging/installation pathways.
> 
> This change has the effect of fixing "make check-dev", which has been
> broken on newer versions of Fedora for a while, now.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   python/README.rst        | 33 ++++++++++++++++-----------------
>   python/Makefile          | 18 +++++++++---------
>   python/pyproject.toml    | 10 ++++++++++
>   python/setup.py          | 40 ----------------------------------------
>   python/tests/minreqs.txt |  2 +-
>   5 files changed, 36 insertions(+), 67 deletions(-)
>   create mode 100644 python/pyproject.toml
>   delete mode 100755 python/setup.py

Reviewed-by: Thomas Huth <thuth@redhat.com>
