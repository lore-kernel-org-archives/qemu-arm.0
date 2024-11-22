Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp5278663njc;
        Fri, 22 Nov 2024 02:16:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHk1FBZ1B8t59xHVMm8WIygApd239joJlPHic6XSiBCxKGUtjg5u7g+DLSQ0YGY/Zkerly2
X-Received: by 2002:a05:6808:d4b:b0:3e0:47eb:baa with SMTP id 5614622812f47-3e91581ce29mr2468600b6e.14.1732270573192;
        Fri, 22 Nov 2024 02:16:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732270573; cv=none;
        d=google.com; s=arc-20240605;
        b=G9OYhAgaFxur3btEC1657omJeWlnf8IDnBo2DMa8uRX+/XA9UTS7VADbo3xIvK+Ksd
         VKK53cAvduPE2nUCF/Mya7+tBUziUQmW7qPgq1QBTgqrXXD2m7Z7+dHbk8yKpXmIAqa2
         8ZiKoonDrYk4YaZWxpwgFWQOlkZAZqlRJ+ghF1HAQb1cVGG3+N6MmxTZtC0i888SGjx0
         s9Z4wojGtrmVFvQ5y8c6dj8oLRoqf27FJCGrLF54l0lg5pGnB0Xm0y1/FmHFdur8dhs1
         Xyz0u9KYSiozUq1MOgRufZeRucbuoh87Gvt17u4PycvczG8YQjsh8YkdC1+RF4qMAmMa
         P9yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=f8lnsQx38mwQcFWsJU9FQHM8nMFtGVXvm6OeViFzSec=;
        fh=3ZIpeD8qIEMa900j4P6H4idDomKYC42bwM8vcp12P/Q=;
        b=kHRUAhfYSVHBouv/QVD7dilea5GNK6003DelLsIxeB7I3jgpWxLW37rz+uoE8XJkiw
         JouPLPwia9pIpOBazmAq/7v/sG07gsd5ZgXiGTcWdmEq1BsQeBPGv3Kt5RIbdYJrgL+O
         kXVWNi4Q21vuNaZDfztxxnBkJOtOe4fkq6rkPdYDtaO9BCSbh0VNeFOz98z/zTBcbfSH
         WcgFl7rTgsmd2pA5F6RDFFrHZ4T6AjgJ1hdpgFqILBKnKvQUo/QBFvbgv8DdHnW8CZe4
         A/R2PJBaZUeWoXC0yGJn2Z6JX0j0AYQcsTeQPGyPBuARzO7hiyhgIiOO9Z3xHZ+wyriH
         +05w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AH7GAtp+;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d451b49c54si16595086d6.355.2024.11.22.02.16.13
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 02:16:13 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AH7GAtp+;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732270572;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=f8lnsQx38mwQcFWsJU9FQHM8nMFtGVXvm6OeViFzSec=;
	b=AH7GAtp+DESh6UuhUzgNtVxO+AEQQUrSo8Z/JQLVYMjyIiPcCXP8gnuzxjY5hyWQgQMhd4
	U/lcj+Lq//E6JFjmHmnjPn3NkLDaj2/MvqpGoePPGJ6UUO+cWj9+GDCl7l0nF0DS3o/+qA
	KWGdCtnoDJViP+sX+7PDaTQbHxcMx+c=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-ovl98KIwM_iodk4Uvn7uqA-1; Fri, 22 Nov 2024 05:16:11 -0500
X-MC-Unique: ovl98KIwM_iodk4Uvn7uqA-1
X-Mimecast-MFC-AGG-ID: ovl98KIwM_iodk4Uvn7uqA
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4315d98a75fso14572975e9.2
        for <alex.bennee@linaro.org>; Fri, 22 Nov 2024 02:16:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732270570; x=1732875370;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f8lnsQx38mwQcFWsJU9FQHM8nMFtGVXvm6OeViFzSec=;
        b=Q0tP0G6bY0BZziDiB2TCC4HmOz4478qIQbKszOq9U8yX8Z7oxEPxtrXeJ6/BbYCP+u
         o5kF/6q1mBrCOt4wFCHNrgaVa87UoexZ+7775hyZ12T75fkr/sVowNnXxLesHOLb9ol3
         Qg3LZUrIBNm9e1WB0T4yfRi7sJ0WW1BVy4380LbhfEIvlEsQlQwD0OHwtLKnlo2zMhO2
         QscDBJzLVej0b/ahNfN/WcsQuNCtWb9sglunCayC3D+9JAoimb+XS5MM9yr7mPjZn9ST
         M45nNSsSaoU4GkAN4wcn+jPi53qIuvKLQRARYh5ybeuIueJWo63oqJ3fBxTARrBHuvm+
         knAw==
X-Gm-Message-State: AOJu0YxLDU6EcMiluGJuyhXiA67W0YS8/ZvUmwJnsJ4xaNpntb7FjPml
	Eyw9E68kbLlr6keGMN24XzvFmIkDs3s3DvrAU0V1AiGSh6BZrUsTiIo36Nv46FEa872NrTHiShD
	9D1icAbBOs6YoP0f3C1hU09mL2vy5SR/UY3chT/aonvRHKSvey3KmZihm1RS0TZBCCarZQqEMPy
	N8yfPSkfjt9O8h9wtkX46x/k5kb8wF+zC5Rw==
X-Gm-Gg: ASbGncufUWY7fpZaURlqM0E3sjynlDBEz87LoK/69/mwDAWnQUu+ybRQmEaTbF5fQG3
	E0cO9to33VT8Ejs4/u6pC2L+LXCqJCUobrfBmjamS4xvOQy7PnaYXZFFajqOV9Z041Vu35zYPB3
	ScSpFMoiHl+UngMcXGxxMwj/bgBW/fzaaRVpjEP7JpS4eEP6Zjz9OWYzb4sdHfDiW4ABAC48VtC
	R9hLZTOb8/Ka+VsyFgSZ08JX9Fp6duIpxWydQoU279YipJ3kUuf88lnpi5K+Mtg8VDjVTvK4Dg=
X-Received: by 2002:a05:600c:3514:b0:428:f0c2:ef4a with SMTP id 5b1f17b1804b1-433ce4250dbmr19335375e9.13.1732270570619;
        Fri, 22 Nov 2024 02:16:10 -0800 (PST)
X-Received: by 2002:a05:600c:3514:b0:428:f0c2:ef4a with SMTP id 5b1f17b1804b1-433ce4250dbmr19334755e9.13.1732270570224;
        Fri, 22 Nov 2024 02:16:10 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [10.33.192.206] (nat-pool-str-t.redhat.com. [149.14.88.106])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433cde98b70sm22148395e9.41.2024.11.22.02.16.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Nov 2024 02:16:09 -0800 (PST)
Message-ID: <42d7844f-7e12-4e7a-9bf5-fea3f913a34d@redhat.com>
Date: Fri, 22 Nov 2024 11:16:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 23/39] tests/functional: add a m68k tuxrun tests
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-ppc@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alexandre Iooss <erdnaxe@crans.org>, qemu-riscv@nongnu.org,
 Thomas Huth <huth@tuxfamily.org>, Bernhard Beschow <shentey@gmail.com>,
 Eric Farman <farman@linux.ibm.com>, Bin Meng <bmeng.cn@gmail.com>,
 qemu-s390x@nongnu.org, Niek Linnenbank <nieklinnenbank@gmail.com>,
 qemu-arm@nongnu.org, John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-rust@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Markus Armbruster <armbru@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Ani Sinha <anisinha@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Laurent Vivier <laurent@vivier.eu>, Anders Roxell <anders.roxell@linaro.org>
References: <20241121165806.476008-1-alex.bennee@linaro.org>
 <20241121165806.476008-24-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20241121165806.476008-24-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qzfqS2benNz6Z0kRqW6e94qBXkR7YP6MjCHroSP9UxY_1732270571
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 37Q7mgpk4Lp2

On 21/11/2024 17.57, Alex Bennée wrote:
> We didn't have this before and as it exercises the m68k virt platform
> it seems worth adding. We don't wait for the shutdown because QEMU
> will auto-exit on the shutdown.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Laurent Vivier <laurent@vivier.eu>
> Cc: Anders Roxell <anders.roxell@linaro.org>
> ---
>   tests/functional/meson.build         |  1 +
>   tests/functional/test_m68k_tuxrun.py | 34 ++++++++++++++++++++++++++++
>   2 files changed, 35 insertions(+)
>   create mode 100644 tests/functional/test_m68k_tuxrun.py
> 
> diff --git a/tests/functional/meson.build b/tests/functional/meson.build
> index 923f9e7078..3ce969066c 100644
> --- a/tests/functional/meson.build
> +++ b/tests/functional/meson.build
> @@ -95,6 +95,7 @@ tests_m68k_system_thorough = [
>     'm68k_mcf5208evb',
>     'm68k_nextcube',
>     'm68k_q800',
> +  'm68k_tuxrun',
>   ]
>   
>   tests_microblaze_system_thorough = [
> diff --git a/tests/functional/test_m68k_tuxrun.py b/tests/functional/test_m68k_tuxrun.py
> new file mode 100644

Please make it executable like all other test files, so we can run it more 
easily without the test harness, too!

  Thanks,
   Thomas
