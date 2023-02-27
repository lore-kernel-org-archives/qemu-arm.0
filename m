Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5094080ejc;
        Mon, 27 Feb 2023 14:32:15 -0800 (PST)
X-Received: by 2002:adf:dd85:0:b0:2c5:5d21:7d4c with SMTP id x5-20020adfdd85000000b002c55d217d4cmr458055wrl.43.1677537135280;
        Mon, 27 Feb 2023 14:32:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677537135; cv=none;
        d=google.com; s=arc-20160816;
        b=p46Y0Azr0MdezvTl43BgjFi1IJYFjZunw20qozKJEkIMILdH1TBNnQVmqJpU11wv3+
         PjYSJ0KkduxwvX4Z8xXb9wzdr0MKKrW0Noe5a7RToh6nOZSwPMxtufG57gbxpUtnxRyW
         CPNI9XaNgbSvqNfl59uxSZ74Mdq24q5pigzFdtGZbC8Rx5zB9EU1A7XebuhlvI20umYF
         7o1WBqRgBQfbYEOBOUtNa6klP4QtQEQfuhCmRuY0D2EWooVDJ0m6w+E2rzTnNYLttjuM
         /gahFuX9lXSNFNuPGdP/Ljcb7O04xYEm7QOX3lnlSnpJ76m0waiqi6ex4e4mLLWnv9w+
         DEgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Ofek98SXwJV2M6Yf6K+LdTUVNT4BwXDI3q6LCsUjAbM=;
        b=SjjxrRaVtqKJPhkQj9296SzRW7GFVpsBEjUbZIrzhZu9ZBkvNL73o6EgP/GRpDtjwK
         6UxOSsk3N92QJMMY0q9ejN01smJ721KFw8E9mhXlghy5Is2kJNouza1xIT+Ea+QFsR8g
         uF6JAuPxDqis8RmlHQIj+Fo0rXGs17Ss2HT4qkk8WmHNzmGbzLFoWfeNtx2RxnfwUa8X
         TFIKDJJAl8ShOP23676/Isr5HyXaQ2OXeHbRbnEfuxnNjlWxDIYuevCChYvbu92A+AXD
         YIOijK8Nb6vpqm+OYv1rK0XSD3umPJ/wJ/9RjCyh/tQ5ZY7SLQA0YT6rIuLwf4R4cXsK
         4qqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mvOH5L0O;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u12-20020a05600c210c00b003da1388e79dsor3493136wml.8.2023.02.27.14.32.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 27 Feb 2023 14:32:15 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mvOH5L0O;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ofek98SXwJV2M6Yf6K+LdTUVNT4BwXDI3q6LCsUjAbM=;
        b=mvOH5L0O5VrDuqOkJOneTHF0kZjSFhkuqYqGYY1b3iDRgoS25+AjZMG/Sbr5+PT3cH
         eNVT811nI0dgMwuHj2PnFqPQdJQf+ZmaRS9u7MpvRQUD6goztJc7aYuRh2AbH2JjJueE
         YEHRp5Ng1EZrCF67kMuU7nZ1JRLnL8vZFP6rBDITyO2KP9iAuQL5zr3+VLXmlXT4ubra
         weEsjWLbVI4YP5Jhmbdi6U8LLRgCrqoMGjf12zrPfHW98Ncuslo0F4Nd1oa8iss3ReSS
         t184TWHoXYgOHbSQ3Mv2nTRA1ZLys135PxQwHvrQytH8vuhsRspz5Ik8LZQAAzjn1wdi
         l1Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ofek98SXwJV2M6Yf6K+LdTUVNT4BwXDI3q6LCsUjAbM=;
        b=17pCveJ+c4Z9oauIEbvVNssJY8jjxRjoiUX77S7+7BC71RIUV/UGxMTvisbUTPWRXt
         T3sKIFI2v2TGBtx2y/+852V9K5fbBCi6l19aN8cZAlBNHjV8CQr/uoDZ8Ng9GJyXLp8X
         VPwlo1ir2R9VwomCZfCfK9DO8ILzGmChNWNZqni0ngsfmnKehZU41sbNfO8OEca5teJh
         d/fPQA3t71i6vAi/bJvYLAx4/NKIeu8NeBSz9KsByqaCEV8p44smoozGi2Rz2P3SzB4s
         wrkrV/PmUbMIUU9FVeHOG+PuOqf1tcpkSITJgPNRbv4oC3JiVEK7z2fbITwHw8gHrCCR
         MUYA==
X-Gm-Message-State: AO0yUKWbViWW1CdocGgD1Zh0E1C3LcjlfGUeGp050wiBQeFP6ifztdnS
	7lLIDhmQPhzOta7WAy4fdoMESM48
X-Google-Smtp-Source: AK7set9s3SslHAqqicd2niVRMhwWH/QJ3T9n5pd3LtY4pHcbw8/iWqLGlwcnuR5R+JDLd9iTy2Ht0w==
X-Received: by 2002:a05:600c:4f45:b0:3e2:24a0:ba26 with SMTP id m5-20020a05600c4f4500b003e224a0ba26mr482035wmq.16.1677537134886;
        Mon, 27 Feb 2023 14:32:14 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.1.115] ([185.126.107.38])
        by smtp.gmail.com with ESMTPSA id 7-20020a05600c028700b003dc47d458cdsm10091307wmk.15.2023.02.27.14.32.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 14:32:14 -0800 (PST)
Message-ID: <77b8545c-4f2a-b389-2811-47d2d48940d9@linaro.org>
Date: Mon, 27 Feb 2023 23:32:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] docs/about: Deprecate 32-bit x86 hosts and
 qemu-system-i386
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230227111050.54083-1-thuth@redhat.com>
 <20230227111050.54083-2-thuth@redhat.com> <Y/yY72L9wyjuv3Yz@redhat.com>
 <20230227150858-mutt-send-email-mst@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227150858-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: w188LAnltttn

On 27/2/23 21:12, Michael S. Tsirkin wrote:
> On Mon, Feb 27, 2023 at 11:50:07AM +0000, Daniel P. Berrangé wrote:
>> I feel like we should have separate deprecation entries for the
>> i686 host support, and for qemu-system-i386 emulator binary, as
>> although they're related they are independant features with
>> differing impact. eg removing qemu-system-i386 affects all
>> host architectures, not merely 32-bit x86 host, so I think we
>> can explain the impact more clearly if we separate them.
> 
> Removing qemu-system-i386 seems ok to me - I think qemu-system-x86_64 is
> a superset.

Doesn't qemu-system-i386 start the CPU in a different mode that
qemu-system-x86_64? Last time we discussed it, we mention adding
-32 and -64 CLI flags to maintain compat, and IIRC this flag would
add boot code to switch the CPU in 32-b. But then maybe I misunderstood.
Thomas said, "CPUs must start in the same mode they start in HW".

> Removing support for building on 32 bit systems seems like a pity - it's
> one of a small number of ways to run 64 bit binaries on 32 bit systems,
> and the maintainance overhead is quite small.
> 
> In fact, keeping this support around forces correct use of
> posix APIs such as e.g. PRIx64 which makes the code base
> more future-proof.
> 
