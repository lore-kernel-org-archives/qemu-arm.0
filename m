Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3513357ejc;
        Tue, 10 Jan 2023 14:04:12 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs5nRyfDT6vfZs3xgolJqIqzOZ5Tb7SOesXVvsjJ1L+jsQduF2SMtBqg4HeKjbpbNHcWSU3
X-Received: by 2002:a17:907:8a20:b0:7c0:cfb2:40d2 with SMTP id sc32-20020a1709078a2000b007c0cfb240d2mr76465527ejc.64.1673388252293;
        Tue, 10 Jan 2023 14:04:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673388252; cv=none;
        d=google.com; s=arc-20160816;
        b=QLW8cz4haYbfspPWCy3TgT4adW/AZ1m/s1jfTB9PvOufWAMhx/5a4u52DJ7+CiCHxa
         p6NX3n4v+rxHJ5MhBHYD7bsh86ufcvLoOXngWbM2p1xI6WJYBQdW60yFL+DUUcq8d56I
         pB7HUAihH8hm90DOPwwC2NASB+/i6l/WdBCtChOXjHptvK9crS2Pn28jSZ7rzbgTKnx8
         tmkNFtV2phL6Lz+Jyf2947kIuIj/BDK1g0Q98yKKBG50V0oZJP4e53ydJxqMF3T/V8Md
         JNWirFur4LbLaZy5jWuUtixGdUcCrIuB4As/2ZwDjR5aVjqQRpnLOZ10WCHL0DFB7gya
         cTuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date;
        bh=x3/DnXVNYqLibGXi0EkO3QB8E24UhyGw9XgDfwVYdTY=;
        b=i/6gl3cc1xIjEwDS573iEAfauYTrsWKMI8KYxbyBqbWpT++/NoKTWX6TLmWOEyaFtr
         HoH5Dz/Nr1kKYl3JH4SiY7hiTYrmwiKv9ky4NUHxjYJ1uE3khCG7sOVc1lMe4W+anqeH
         abWeMdcND7HVveorLrULki0j68DyVQKjPDD1Nic+W251ZX4VAS1dUIPR2lkqzrfo+1TY
         qboQnpHxCKzxTyA0X/sH/hDSNynUEo7lelzmUwpj/fm2BsHQqh9ySmnHOsha5k5Fg+1p
         PKzuMdYwDhu+xykwCg8wdQnN4b98MH3p/3VA9GOYBJa57EpQCEXiLjCOJ1W6S9ScMxzp
         aPZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of balaton@eik.bme.hu designates 2001:738:2001:2001::2001 as permitted sender) smtp.mailfrom=balaton@eik.bme.hu;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Return-Path: <balaton@eik.bme.hu>
Received: from zero.eik.bme.hu (zero.eik.bme.hu. [2001:738:2001:2001::2001])
        by mx.google.com with ESMTPS id gt33-20020a1709072da100b007c4f75345e1si14984040ejc.443.2023.01.10.14.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 14:04:12 -0800 (PST)
Received-SPF: pass (google.com: domain of balaton@eik.bme.hu designates 2001:738:2001:2001::2001 as permitted sender) client-ip=2001:738:2001:2001::2001;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of balaton@eik.bme.hu designates 2001:738:2001:2001::2001 as permitted sender) smtp.mailfrom=balaton@eik.bme.hu;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
	by localhost (Postfix) with SMTP id 3ACFA745712;
	Tue, 10 Jan 2023 23:01:53 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
	id F3B30745706; Tue, 10 Jan 2023 23:01:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zero.eik.bme.hu (Postfix) with ESMTP id F05E37456E3;
	Tue, 10 Jan 2023 23:01:52 +0100 (CET)
Date: Tue, 10 Jan 2023 23:01:52 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
    qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
    Richard Henderson <richard.henderson@linaro.org>, 
    =?ISO-8859-15?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>, ale@rev.ng, 
    qemu-riscv@nongnu.org, xen-devel@lists.xenproject.org, 
    Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] bulk: Rename TARGET_FMT_plx -> HWADDR_FMT_plx
In-Reply-To: <20230110212947.34557-1-philmd@linaro.org>
Message-ID: <d4ea8bf5-a669-eb33-6dd2-f37417dab1c7@eik.bme.hu>
References: <20230110212947.34557-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="3866299591-1251169997-1673388112=:35553"
X-Spam-Checker-Version: Sophos PMX: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.1.10.215119, AntiVirus-Engine: 5.96.0, AntiVirus-Data: 2023.1.10.5960001
X-Spam-Flag: NO
X-Spam-Probability: 9%
X-Spam-Level: 
X-Spam-Status: No, score=9% required=50%
X-TUID: vgA5MW4+SEqi

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1251169997-1673388112=:35553
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Tue, 10 Jan 2023, Philippe Mathieu-Daudé wrote:
> The 'hwaddr' type is defined in "exec/hwaddr.h" as:
>
>    hwaddr is the type of a physical address
>   (its size can be different from 'target_ulong').
>
> All definitions use the 'HWADDR_' prefix, except TARGET_FMT_plx:
>
> $ fgrep define include/exec/hwaddr.h
> #define HWADDR_H
> #define HWADDR_BITS 64
> #define HWADDR_MAX UINT64_MAX
> #define TARGET_FMT_plx "%016" PRIx64
>         ^^^^^^
> #define HWADDR_PRId PRId64
> #define HWADDR_PRIi PRIi64
> #define HWADDR_PRIo PRIo64
> #define HWADDR_PRIu PRIu64
> #define HWADDR_PRIx PRIx64

Why are there both TARGET_FMT_plx and HWADDR_PRIx? Why not just use 
HWADDR_PRIx instead?

Regards,
BALATON Zoltan
--3866299591-1251169997-1673388112=:35553--
