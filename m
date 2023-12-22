Received: by 2002:a17:906:3017:b0:a26:c056:f233 with SMTP id 23csp87139ejz;
        Fri, 22 Dec 2023 00:06:30 -0800 (PST)
X-Received: by 2002:a17:902:ecc2:b0:1d3:9afa:1be4 with SMTP id a2-20020a170902ecc200b001d39afa1be4mr764585plh.124.1703232389921;
        Fri, 22 Dec 2023 00:06:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703232389; cv=none;
        d=google.com; s=arc-20160816;
        b=hVc8V9TX3xtaaKNPIx24+q9yTPNRbhCMq2a+HwAn0dS9r2NNt2t7lPwdIa6WFu+GL7
         SJYn/tmMMMDZzjVtnFMWI7m/0BarJqtpWqguggLsmQVk5NU1e6Xi2QfswPaBG8ZBFIqw
         YFklB3JatTL9L/pOIlmrFC28hiSsIBE3QT7Y8anHLHZQTywnbR4qT7fOccZLGwNrdPuO
         pDQnSf+bo+8LzF77DVu+jV5LluE5OEDU8bPubXGEwWNtTc9k/gaE0YbLtaOAfCQL8PPz
         cjFQtaveikCeuAIztNWA+Y0QrSSgJPFoJNNwU0e3+WuTRPA6Ffi4R+mUCLM4dHIRe0ZH
         xKhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:dkim-signature;
        bh=Dy7zv8H2NWsKZUX8wVrMymGZN33/m0uz3ciTz2vhuko=;
        fh=cqABqwFlKe669EsXXyAe5W1aGWpUXcVrkNkDiQHVt+M=;
        b=GeUoVNtu214KJ/oaJTaUqMouVXNxdztEgHxDA6C/V9RKf+Of+2Bu4tWcg57CjpftMb
         I/Qxp8f8d4uqK8ECeXsCJQSaS2FmSFgaMUsDZVxMZMkui7NDkgdN2D78+txIjcBHrFV4
         U2KdOuM+DeajsRfXTP8Y3h024CN4qAmJHQBJyMnEI6zMEcSGFerlY61yk5j61U30cpfN
         VmZ3pkYE0xEYo/zuUZMDfhrHS2QZkUolLtj0hi1OcKREElFoS0XMv4KCKjD44kO5i5uu
         caQvEaPTCCOwLTu+ryR9xrGSX9oGBCPPDzb1whlC8hLBsYBpN6IrW4L7P51TakCUrZiL
         Ltvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Qew59mLZ;
       spf=pass (google.com: domain of npiggin@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=npiggin@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <npiggin@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ja18-20020a170902efd200b001d3e52acb11sor1294692plb.10.2023.12.22.00.06.29
        (Google Transport Security);
        Fri, 22 Dec 2023 00:06:29 -0800 (PST)
Received-SPF: pass (google.com: domain of npiggin@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Qew59mLZ;
       spf=pass (google.com: domain of npiggin@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=npiggin@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703232389; x=1703837189; darn=linaro.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dy7zv8H2NWsKZUX8wVrMymGZN33/m0uz3ciTz2vhuko=;
        b=Qew59mLZGP0hCUZhYQLFNBF0rbH4r1aOeDo6GXu5feoCUlyUBkVD2pltCqaRAn9ixW
         ZVLB4eNQDRM/Uy1mYVoATUj4cK+CAvmpi8Br2s2i6IUfVkGuJIjlHSSNIq7zjNfNJlq2
         wVmJJqOBWd0wWBsLBr7Hyg3TrkdpDz0USWXKlreObsmbQ8HicmgNZRqt6qpqnixfoGMa
         Pvdu74oRphrWwIpRaG1mLkYmuqR6T8VfLWXWLh6B/6dX3FBd1KN2DPClDwgGzsWYuv/3
         b3oLBe3BF4O0X3mcgOvMiPqyqRhCElmta/rtgjifCwVEe8XJLXTtiCj6prumecXDA7vS
         SXIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703232389; x=1703837189;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Dy7zv8H2NWsKZUX8wVrMymGZN33/m0uz3ciTz2vhuko=;
        b=MfWWlg1bRIoRsZ37NZgIYZ8kxqc+3xw41mZWG4d+fbTF2yNKUyElYHWHC50IXtJ2rl
         jw2BsvBDCV8kAdsvgVZYpswVyxys0V8gEXY4O8MSF/0fayl0+Qj3+PTxKYky2mM3Rbzs
         euEIjdPIVLQ0Q3lORRXokekPOxBdiPOE/+QcRWzMZkO7tVw1izYTLzXFxKT3UvesAP0h
         xqbsiL5IYw7gJTF3cP2kfF19R+yWUZrXqsq4IDzZQgDh1nm82Ozf5Ux96XBjwSthPe9e
         oUtPSDvbfbuSBPQqlOIFXzg4STm0SkFDmc/2MSoV7kFXaXn11ffM39gXsWfU0xOVq/42
         x9Bg==
X-Gm-Message-State: AOJu0Yxnm6JQc9CKohpFuQuP3c7tCXEB9hvDv2ebt516pz/PAH+7FIdx
	or+UbyMIRReMn0fGM8eGA0LwLEvVfCM=
X-Google-Smtp-Source: AGHT+IGrOcGhiSZsNJ9IeSdzELFp2R9wZrFeuViIHy9jE38BlPHv5DYK+IDBq5Jj+QGCL5877wvnHw==
X-Received: by 2002:a17:903:22cc:b0:1d0:cf22:c6ca with SMTP id y12-20020a17090322cc00b001d0cf22c6camr723492plg.52.1703232388857;
        Fri, 22 Dec 2023 00:06:28 -0800 (PST)
Return-Path: <npiggin@gmail.com>
Received: from localhost ([203.220.145.68])
        by smtp.gmail.com with ESMTPSA id m10-20020a170902db0a00b001d3867b6424sm2849139plx.113.2023.12.22.00.06.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Dec 2023 00:06:28 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 22 Dec 2023 18:06:11 +1000
Message-Id: <CXUPHHNKAVYM.129IGW3MNKCSQ@wheely>
From: "Nicholas Piggin" <npiggin@gmail.com>
To: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 <qemu-devel@nongnu.org>
Cc: "Ilya Leoshkevich" <iii@linux.ibm.com>, "Peter Xu" <peterx@redhat.com>,
 "Liu Zhiwei" <zhiwei_liu@linux.alibaba.com>, "Peter Maydell"
 <peter.maydell@linaro.org>, "Mark Cave-Ayland"
 <mark.cave-ayland@ilande.co.uk>, "Eduardo Habkost" <eduardo@habkost.net>,
 <qemu-arm@nongnu.org>, "Paolo Bonzini" <pbonzini@redhat.com>,
 <qemu-ppc@nongnu.org>, <qemu-s390x@nongnu.org>,
 =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?utf-8?b?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>,
 <qemu-riscv@nongnu.org>, "David Hildenbrand" <david@redhat.com>, "Warner
 Losh" <imp@bsdimp.com>, "Claudio Fontana" <cfontana@suse.de>, "Brian Cain"
 <bcain@quicinc.com>, "Daniel Henrique Barboza" <danielhb413@gmail.com>,
 "Richard Henderson" <richard.henderson@linaro.org>, "Thomas Huth"
 <thuth@redhat.com>, "Riku Voipio" <riku.voipio@iki.fi>, "Kyle Evans"
 <kevans@freebsd.org>, "BALATON Zoltan" <balaton@eik.bme.hu>, "Edgar E.
 Iglesias" <edgar.iglesias@gmail.com>, "Laurent Vivier" <laurent@vivier.eu>,
 "Michael Rolnik" <mrolnik@gmail.com>, "Song Gao" <gaosong@loongson.cn>,
 "Huacai Chen" <chenhuacai@kernel.org>, "Aurelien Jarno"
 <aurelien@aurel32.net>, "Jiaxun Yang" <jiaxun.yang@flygoat.com>,
 "Aleksandar Rikalo" <aleksandar.rikalo@syrmia.com>, "Chris Wulff"
 <crwulff@gmail.com>, "Marek Vasut" <marex@denx.de>, "Stafford Horne"
 <shorne@gmail.com>, =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Alistair Francis"
 <alistair.francis@wdc.com>, "Bin Meng" <bin.meng@windriver.com>, "Weiwei
 Li" <liwei1518@gmail.com>, "Yoshinori Sato" <ysato@users.sourceforge.jp>,
 "Artyom Tarasenko" <atar4qemu@gmail.com>, "Bastian Koppelmann"
 <kbastian@mail.uni-paderborn.de>, "Max Filippov" <jcmvbkbc@gmail.com>
Subject: Re: [PATCH 23/24] exec/cpu-all: Extract page-protection definitions
 to page-prot-common.h
X-Mailer: aerc 0.15.2
References: <20231211212003.21686-1-philmd@linaro.org>
 <20231211212003.21686-24-philmd@linaro.org>
In-Reply-To: <20231211212003.21686-24-philmd@linaro.org>
X-TUID: k8YXyuSdoha4

On Tue Dec 12, 2023 at 7:20 AM AEST, Philippe Mathieu-Daud=C3=A9 wrote:
> Extract page-protection definitions from "exec/cpu-all.h"
> to "exec/page-prot-common.h".
>
> The list of files requiring the new header was generated
> using:
>
> $ git grep -wE \
>   'PAGE_(READ|WRITE|EXEC|BITS|VALID|ANON|RESERVED|TARGET_.|PASSTHROUGH)'

Acked-by: Nicholas Piggin <npiggin@gmail.com> (ppc)

Looks trivial for ppc, so fine. But what's the difference between
-common.h and -all.h suffix?

Thanks,
Nick
