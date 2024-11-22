Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp5280502njc;
        Fri, 22 Nov 2024 02:20:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEsk7w63ujyTg1AIB0MTPs35vL5mKmsfkbOg4ReWgKkEX9TIIZwnwwIvolK69bmwITlYIm1
X-Received: by 2002:a05:6102:3a0a:b0:4ad:65b1:63c9 with SMTP id ada2fe7eead31-4addcbfcfdemr2368896137.13.1732270815197;
        Fri, 22 Nov 2024 02:20:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732270815; cv=none;
        d=google.com; s=arc-20240605;
        b=iJ12IC5gzboQcFiK7UuSieQ86tGiQW9uNxYHoMTOV4xQUboPmCfVY/N62ql1a5SQNi
         CRnd5tTGXRY98fdNnIily2e65WGltfxcFrJSmbpYfZPwY4k80IWpcmF+Rp0SXew1zLUi
         lPudjDqCyGa+0osCVG9RUC374yQZWVcjKBRBDEd5pikxXP9Ti1XlLTzu1AcNSzP0qO+M
         SXDk7Jpofq1xEshhEVQC+/Uv9BbnSfPiUgNg2wWy5IiThidV344HCq2BtbFty7jk6nop
         ONAnECSxCm0ryPy5hlO56mXywLMDIFN6ziJ4eedDOg6c0oowCq4Qv9JlAPJf0QZJBPJK
         WTXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=Vdinpbk14Hi0vdwJjM+nP1P7ckZicRqdxHQUsPZ49PI=;
        fh=wVPQWqTxHsMhgDFUYzS4WRCfPsDqkM1sZVnXLJCyo1A=;
        b=PXHQHc2xXE7tLZzeuf9rmnxpIjABXw2Sc2gUrc2ElDMFsv7JLsG4P9P1X1yxQGz9QQ
         fZGr1EFXzp25RNwPC08nQA983UH4KttnJYU+dsSQAYRYsMMmQNvp7gWOUgHMYfcSuYP1
         O6HRJjycG02nyq8mh+nOxV9MX6eYnJ2TfrYzvo8aGz1tz7guyaUdvylMQ1WZEnmOdAR5
         gIGo+doYKFoa0xJ3S594BRxYwMlj2HdgY7I8g7M3+iptjY1R+0vPC6eGAVRuwA0jbUW9
         9VUKWND+yZZR851qWWgjKSjFMIybT9/CTOBGK0LhYw7jmLEGAazkkNu/WF3FtY1n4veq
         aTFQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=I4fnLCYa;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4653c4a10c0si17866401cf.537.2024.11.22.02.20.15
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 02:20:15 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=I4fnLCYa;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732270814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Vdinpbk14Hi0vdwJjM+nP1P7ckZicRqdxHQUsPZ49PI=;
	b=I4fnLCYaO4TuuFlkQCiTX2ICxOy/6rRiAHZ/MlRv/zMRVqIHLS0cWQCach3AZGD3TtfjHU
	DV5Ogj1Iqp4lqmbGwTGiCQRdZvUcm+YMchGez59fo7yLVKUa+Fq7MnqtWFwfl1mCgVfEHA
	AzhnD902vgkPE6CpAiOeTmoanjl1z6g=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-381-_mPO06EMNHGmEBdqzLEIDw-1; Fri, 22 Nov 2024 05:20:11 -0500
X-MC-Unique: _mPO06EMNHGmEBdqzLEIDw-1
X-Mimecast-MFC-AGG-ID: _mPO06EMNHGmEBdqzLEIDw
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2120c877e75so20237465ad.0
        for <alex.bennee@linaro.org>; Fri, 22 Nov 2024 02:20:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732270810; x=1732875610;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vdinpbk14Hi0vdwJjM+nP1P7ckZicRqdxHQUsPZ49PI=;
        b=e2c0R+envLpzCd3owENzmAErqJpp+UejTFcbFVFFm30qkoAgEj4o8SEGUj0QquQ34p
         bffCAdjkhuop8NrF2dJGCjcTtPiqUeLHceb5FtP9TyT+XGcA5CT+4yrjQyVWLxMEIreQ
         a1UsOAkwUyFJgHFUAbpIgAvrmk83GYQF2riVOfA9ArsJ3HNOOFCfK/hZ30v3XfXefbsm
         1a9EbDu1Nbbxns5B0WjsHxLQJjGPW40xi2JT5tiX8q/Bk7ATBB8GX/wCm7UhNPkCmVk0
         PzQXTkdse93lbPa/azkFPrGR9EJrLBBgQXVgTkrYqglcd35CG++dBY4k28U5U8tbzArg
         F1WQ==
X-Gm-Message-State: AOJu0YyUyPEX0QDDVJB5QnQQSv9zda8sFQQRPCIDM6lKzRdiQ/v7s/Yw
	em9wsz7yiO8PvThlZdfhrcepdsLnhl5M/Xg3JwyN+XLJyZrH9uPvAnN8hQhjyJTWN0aoa8OZMDs
	6JmMDpMMSlOhk5zLMlOnatyT2ZHdg6dmZ1uBff+BZHX++UaId5BGvbsH+dJaadvS0k65qp4nylT
	2KwyhK5cEJhGsP/RwBTUOG1HbUTfI/uYBfQZMC
X-Gm-Gg: ASbGnctuDoql1YXjuLR5MMRBD76T0Zi3jbmpdRxcvirq4R5BiSv9VPgsQUhuIshnYJr
	k4IPVVBi9EC/P3Gc4UNfXLmDCipO7+5D+FCWdO6aH+02GleVuOJNvWrQuyQwWdbLf7riG7961mR
	D39gpoJg1KwDQCh/zjl9+dUSGdj2xPZ0yAEPLY0sSFiTjh1Vi9zJv/HOsw7HxU4uvlegOboz735
	f3J8R1esqE6wkmdU8gd9WVobq8COfz4qBUL3+y1SXsoundiy85ajkPJ57HIyAm27OvwKOjE5cs=
X-Received: by 2002:a17:902:e5cb:b0:212:10e3:7671 with SMTP id d9443c01a7336-2129fce2fcdmr23452665ad.4.1732270810735;
        Fri, 22 Nov 2024 02:20:10 -0800 (PST)
X-Received: by 2002:a17:902:e5cb:b0:212:10e3:7671 with SMTP id d9443c01a7336-2129fce2fcdmr23452155ad.4.1732270810376;
        Fri, 22 Nov 2024 02:20:10 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [10.33.192.206] (nat-pool-str-t.redhat.com. [149.14.88.106])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dbff5f7sm12437295ad.123.2024.11.22.02.19.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Nov 2024 02:20:10 -0800 (PST)
Message-ID: <c4ad832e-b440-4c09-8cdc-456845085eff@redhat.com>
Date: Fri, 22 Nov 2024 11:19:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/39] tests/functional: avoid accessing log_filename on
 earlier failures
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
 Alistair Francis <alistair.francis@wdc.com>
References: <20241121165806.476008-1-alex.bennee@linaro.org>
 <20241121165806.476008-19-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20241121165806.476008-19-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WUghu8giZhiCOVt9loo5b4-wituo5PQjw7p4UgsSnI8_1732270811
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Fd+gvTWJ+h1x

On 21/11/2024 17.57, Alex Bennée wrote:
> From: Daniel P. Berrangé <berrange@redhat.com>
> 
> If a failure occurs early in the QemuBaseTest constructor, the
> 'log_filename' object atttribute may not exist yet. This happens

s/atttribute/attribute/

> most notably if the QEMU_TEST_QEMU_BINARY is not set. We can't
> initialize 'log_filename' earlier as we use the binary to identify
> the architecture which is then used to build the path in which the
> logs are stored.

With the typo fixed:
Reviewed-by: Thomas Huth <thuth@redhat.com>
