Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2772440lfq;
        Mon, 11 Jan 2021 07:32:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx17JJ90z6yACYtNYwrO4GEGMgN7VBkNeXO8yQd3hN2yVQztb745MWmcTypuWIxqXKMnqCU
X-Received: by 2002:a25:b195:: with SMTP id h21mr452594ybj.406.1610379161209;
        Mon, 11 Jan 2021 07:32:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610379161; cv=none;
        d=google.com; s=arc-20160816;
        b=lFk05MOQpFrifFNcaT8ZKpTeYOhvk2/DIxjhvphoN81kD6vR/K1D8pZXQYp9NqyxJ8
         /gw0DYs/pALuTbV4d4ikcQ0OrYOccmifqZsWUP4qtf4/ThM3HV7FAHX9c1HQo097GJVu
         IGsZMnQxRhVmreZFzBt+MyA/A5nymk2gPDfWUGVdX+BFTptZUH+KvlPC4tPLzc9Qe3W7
         OIoLxzZvyIoFXpTVr3IgWeQaV8MRy48soKFeqeEa+Z+aanFB0IGxbPorCeLWIL45OG8B
         GOoWvzdMHeEiL/sQyH6lfZZAA7Ca4m11qp7OUUl9mKabUDzGaWJpGnRe31hGELlTkT2c
         0xxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:cc:to:from:subject
         :dkim-signature;
        bh=oFhE1fuK2u+lt8651i050zlH4eIqB40KpbdOdnqE+Ks=;
        b=u8gY1dQ2VfdnzgeHBG4yRxfOGHNB8542jnMHq0P1bOYYV3xQPQwNrm9rhC1hRwupCa
         iYJGLmz0iLSDDrnMtS87DPpPWUc2Ema/X9Y4qGKRzP/xhqUXfUAFodZXd645K9VczJXz
         gmYa4DpV71+Ldz89MCBTK6DfLw9uLbv54gMSQ4FTKXIUtFq11yqhPqJG1G5w2ROQ1YVJ
         RiB5xvBaiSCuyxA6B/zenkTl9srLp7QsryjpkN7NneqmP/ww1uxsgTE1QJlSs2ppI8Qd
         jLmQB+hwPR5GCwIbYlvEaS+Ap59F9VjD1LbD6DlFn2J7PGaDHMDpeWG70SOqU0GPvWJ/
         0VXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FyyyMdSX;
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [63.128.21.124])
        by mx.google.com with ESMTPS id r9si130711ybk.389.2021.01.11.07.32.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Jan 2021 07:32:41 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) client-ip=63.128.21.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FyyyMdSX;
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1610379160;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oFhE1fuK2u+lt8651i050zlH4eIqB40KpbdOdnqE+Ks=;
	b=FyyyMdSXhGvPYDnJQdn9jeTJm+97YcYi+LtWbUNM8xyBMurkYv5wvVbtKI0bhuGK/Apk2b
	wdtRHAYmO+a0Ixkf9MPPuR2j+dyW3kLxpR0RqBCu45IYvLbyRrEfKyB3vxfkakTvDsyxEu
	+JdNRyOBJuWfdv2W84OIl6mCwpTsH5c=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-jrc94fsLMHCzHOFzX8enhg-1; Mon, 11 Jan 2021 10:32:36 -0500
X-MC-Unique: jrc94fsLMHCzHOFzX8enhg-1
Received: by mail-ed1-f69.google.com with SMTP id x13so8421338edi.7
        for <alex.bennee@linaro.org>; Mon, 11 Jan 2021 07:32:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=oFhE1fuK2u+lt8651i050zlH4eIqB40KpbdOdnqE+Ks=;
        b=l/6x9pEKpKGDTRw5PjX2JVaYoY4Rtmg69AF8EMtNmT0HekkFMDaXEae0ISuufOfek9
         nOBFISJLdxA14df03Yrx31LrnUaEtAoJuEr1yUlZPm7Q766Pl3uNCCgt8UR1HBwTraZD
         h+R3U8sBv1WofUrJ0hW68jJdPVX522wl+w+kABHkKHlEfUrPz15q9F46i1Pf1dZvpz5s
         8hTlr4gHTEszdiCPEwkTa6656yDUbViX+fSJ6+6HuSxVvIBl8dafoesqDIKV6MMxUVod
         fZ74WK9oLumAzFA9rcxj3+/40chcX+MRPiuPRUpT8SYWlhh/ONQIKRYlwEBVDR14za2P
         R3+A==
X-Gm-Message-State: AOAM532GFdTPalg42T2kc/zSI7FmxM12FzzdX5yHqViwkttYMSXHtcTv
	v4VaZbbCh3+c3X0NGSDgw4FuKd5DSLcY8N+MMP+hYBUflOMAptNz8sCBwcmNoxRA/JHDICjetVc
	/ChdNXJ68gTVMiaQ+
X-Received: by 2002:a17:907:271c:: with SMTP id w28mr42958ejk.140.1610379154475;
        Mon, 11 Jan 2021 07:32:34 -0800 (PST)
X-Received: by 2002:a17:907:271c:: with SMTP id w28mr42948ejk.140.1610379154281;
        Mon, 11 Jan 2021 07:32:34 -0800 (PST)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (129.red-88-21-205.staticip.rima-tde.net. [88.21.205.129])
        by smtp.gmail.com with ESMTPSA id r21sm73326eds.91.2021.01.11.07.32.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jan 2021 07:32:33 -0800 (PST)
Subject: Re: [PATCH v1 12/20] semihosting: Move ARM semihosting code to shared
 directories
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Keith Packard <keithp@keithp.com>, Laurent Vivier <laurent@vivier.eu>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>
References: <20210108224256.2321-1-alex.bennee@linaro.org>
 <20210108224256.2321-13-alex.bennee@linaro.org>
 <15248375-2760-8e5c-4468-b952b247ed2d@redhat.com>
Message-ID: <5f7091fe-a7ff-d2c6-528a-728b97434d3a@redhat.com>
Date: Mon, 11 Jan 2021 16:32:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <15248375-2760-8e5c-4468-b952b247ed2d@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: NphigsmojuMK

On 1/11/21 4:30 PM, Philippe Mathieu-Daudé wrote:
> On 1/8/21 11:42 PM, Alex Bennée wrote:
>> From: Keith Packard <keithp@keithp.com>
>>
>> This commit renames two files which provide ARM semihosting support so
>> that they can be shared by other architectures:
>>
>>  1. target/arm/arm-semi.c     -> hw/semihosting/common-semi.c
>>  2. linux-user/arm/semihost.c -> linux-user/semihost.c
>>
>> The build system was modified use a new config variable,
>> CONFIG_ARM_COMPATIBLE_SEMIHOSTING, which has been added to the ARM
>> softmmu and linux-user default configs. The contents of the source
>> files has not been changed in this patch.
>>
>> Signed-off-by: Keith Packard <keithp@keithp.com>
>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> Message-Id: <20210107170717.2098982-2-keithp@keithp.com>
>> ---
>>  default-configs/devices/arm-softmmu.mak               | 1 +
>>  default-configs/targets/aarch64-linux-user.mak        | 1 +
>>  default-configs/targets/aarch64_be-linux-user.mak     | 1 +
>>  default-configs/targets/arm-linux-user.mak            | 1 +
>>  default-configs/targets/armeb-linux-user.mak          | 1 +
>>  target/arm/arm-semi.c => hw/semihosting/common-semi.c | 0
>>  linux-user/{arm => }/semihost.c                       | 0
>>  hw/semihosting/Kconfig                                | 3 +++
>>  hw/semihosting/meson.build                            | 3 +++
>>  linux-user/arm/meson.build                            | 3 ---
>>  linux-user/meson.build                                | 1 +
>>  target/arm/meson.build                                | 2 --
>>  12 files changed, 12 insertions(+), 5 deletions(-)
>>  rename target/arm/arm-semi.c => hw/semihosting/common-semi.c (100%)
>>  rename linux-user/{arm => }/semihost.c (100%)

Can we name these file with some explicit "arm_compat_semihosting"?

> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
