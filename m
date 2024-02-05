Received: by 2002:a17:906:755:b0:a37:6271:4f3c with SMTP id z21csp1148317ejb;
        Mon, 5 Feb 2024 06:04:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG99OaRBNCJ+Q1QFpuNjNZRF1jfDjDw4BkTcVsr4h6tJTRjBTs9zVXJrBXhZkRIAnMgZU8b
X-Received: by 2002:a05:620a:102b:b0:783:d709:54a3 with SMTP id a11-20020a05620a102b00b00783d70954a3mr13756985qkk.32.1707141894704;
        Mon, 05 Feb 2024 06:04:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707141894; cv=none;
        d=google.com; s=arc-20160816;
        b=SBB5E7+U76Y76nJ4NGeB2K731ZXhDz2bWjJZ5gtzJcpeHnrVcFv9frfILtKuI/4Pi4
         XFseS/zjqQZ6YSLqYPGnR9nk76UA3JiFHmsss7binDlv+7Zn6MV1HoWbb7a1wqDG3Qon
         nFqQdZ6zrPhz4F7X0FegM5o/mlTBRMH4/jiQctI5R0y/hZR/wDVENGa3JjMLv+kJ4ue2
         UH2GFuhVxNkO3h0+cCovBxZ4oUHW31Q/9sE1RCf+7xr2/vDR6mnQIZqxyYxriT2WoXHL
         7I5eOIvPwoTQ/DZt9pdECZWUrOX6x95YtPwL7Cexbe7qDSuxKkwFhxEOL5dVku6vwp1u
         X3gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=RhzBM03iuYGJapSmajdfOvxaccvCR3jZDmUfTcGvZoQ=;
        fh=xbyuh46pQq674avqXqLJecsbHeLww+nlvgBE1RGY9Ak=;
        b=N6u0pWVyIMjbklMHpkzZbWLgEuKec/ylXXxyvsakyyU+1Iz4veY8C43hUYizHSMOTM
         jRXs0CBcttOuiqe9oyjWNnwS7Nw+ykLNQivQjWjkkMrcthcwRJe7iAUx7O+TCfcR6O0j
         5MYp8j4hKVweDSa6TE9LAaFcUoSEoncmJIq/etIasSGko2t5I+oxrUtUt5GKMvf8GpRJ
         uv4spA9czMe66bPDLozz4KCve0Vp3rpwWk1LMxltZLf7aMbPUmCm0duMEkraK80502UB
         6W3BlgTO3DKLV+J2bvzeM1fQdqvkd+QcHslkX8x4JhMbBXKhKoryWIzt71p9uG4eIAxh
         r3DQ==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="H+j/fl55";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=0; AJvYcCWO177JD8XBKfBx3p8p4R2CWACW374HGtnliDQXy0/ArskPnLHozuhsTkdeFlFqR4OtzCiBvErSYN/F0Z8wRwB+ebv3iIFb
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b21-20020a05620a04f500b0078553473225si8270695qkh.419.2024.02.05.06.04.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Feb 2024 06:04:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="H+j/fl55";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rWza1-0004GQ-SU; Mon, 05 Feb 2024 09:04:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rWzZu-0004FI-BW
 for qemu-arm@nongnu.org; Mon, 05 Feb 2024 09:04:06 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rWzZr-0000Je-Sw
 for qemu-arm@nongnu.org; Mon, 05 Feb 2024 09:04:05 -0500
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-55ff4dbe6a8so3540109a12.2
 for <qemu-arm@nongnu.org>; Mon, 05 Feb 2024 06:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707141842; x=1707746642; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RhzBM03iuYGJapSmajdfOvxaccvCR3jZDmUfTcGvZoQ=;
 b=H+j/fl551/3zaS3CzjasbUAVlPf6QJbh4FWGlWiaLgwvL6i2JSpC1TYm9pfgyiZJmu
 rJUpRCIFK2HVHBXyHf+gsK+pkVJc7srp3AAo9n1BaELskn35aeKsH4upKZfnw2rP1H8B
 UR+GLspnn3MIxCd79GOYfliX99JOjd+nqGQ+D7zvxiFaw/7zaV4dh3aQ8cnaxxYO3jSN
 HRZtv9gFnjuHgglC04IBZrj9Jd8K2SA94jQ80BUducgDmkWTGaSdqnUpUhhnZik33/Gl
 Y+xRHzAXv+2dZYR+yhcWvCTVdXg/72+1EynVMib9l4aIvAaD69pAPh4d8p2lYzB3sOwT
 aOyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707141842; x=1707746642;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RhzBM03iuYGJapSmajdfOvxaccvCR3jZDmUfTcGvZoQ=;
 b=B00gDnBilHuMiYeiRG6+mPTFgdMvylNKw8R2Z8cHK3UMGSf6TbReV5F6gw923P7+vS
 IEl9B/K3ygUHVKQ9NlFzSPFm2VFEQJnshAr+C/oIGWQozn52sUO/CX+TOaQUHyn+6IOb
 tD6JtT38zhMrlMhKh7MT+iEY4B7zkkcPGlKPLsrCl6LhLcvDqgZrpEX5ebz7GZoQBbz8
 gzYC+07nX1f2ygW88qtkAXOtwEqQyZd819b7IA9SjWvHSNBgtqYJ/12Ji/LTbsk1KVjR
 f7kWdP77hIcr2MuNlyseVH/ZVaTVAQ5QKxuJWRcBG2kxz8rR+iX/nstKiD7oBIYGVKBQ
 ZyHQ==
X-Gm-Message-State: AOJu0YxH9fbv7My8gZRvD2L7ZtGtMmTnurFPf6VBbLT0aRvJgUOfQjmZ
 zgdpTHjDxGd2VuTNr27aY+syiu6ROpIKk6VabhCqgJcmWF1eY51rPSZI622mZFU=
X-Received: by 2002:a05:6402:5245:b0:560:5d7e:4061 with SMTP id
 t5-20020a056402524500b005605d7e4061mr2612761edd.29.1707141841944; 
 Mon, 05 Feb 2024 06:04:01 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCXIWNZBuxzeRp7c2tz9tmaGe/oJUFBhTJE0rEJGvRcHB9joYcvYwGeoBGNIaLtRcnEP43cpq3pkb1d6ORIRBy6Yra9W/WTvbRHYrlHmySbr5wawbi6jj2h4AkAKes05GPigUExp8/QzeZe13YE9ngalhNIMouQ4Sn6/TaoE1y2VorYgVWtfsMm/HQcRp9177XHqv92QCP6aAfCW8DeDILMEZuYKGelrQBiCBSzqGVCO/NIyQhKLOV9HxTGOJoujtpNMb0IDnlPqzct3rZb/Aeq2Z+KTiwnj7ZUvfp5um6EnJuUHpivWVnbnXJzE1UOIHaxYVAtKZg==
Received: from [192.168.197.175] ([92.88.170.125])
 by smtp.gmail.com with ESMTPSA id
 g9-20020aa7d1c9000000b005606b3d835fsm1002764edp.50.2024.02.05.06.04.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 06:04:01 -0800 (PST)
Message-ID: <f20a325e-7998-4065-b4ed-d43da7d4b5df@linaro.org>
Date: Mon, 5 Feb 2024 15:03:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Add device DM163 (led driver, matrix colors shield &
 display)
Content-Language: en-US
To: =?UTF-8?Q?In=C3=A8s_Varhol?= <ines.varhol@telecom-paris.fr>,
 qemu-devel@nongnu.org
Cc: Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Samuel Tardieu <sam@rfc1149.net>, Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
References: <20240126193657.792005-1-ines.varhol@telecom-paris.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240126193657.792005-1-ines.varhol@telecom-paris.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: A6af+xPNDgRJ

Hi Inès,

On 26/1/24 20:31, Inès Varhol wrote:
> This device implements the IM120417002 colors shield v1.1 for Arduino
> (which relies on the DM163 8x3-channel led driving logic) and features
> a simple display of an 8x8 RGB matrix.
> 
> This color shield can be plugged on the Arduino board (or the
> B-L475E-IOT01A board) to drive an 8x8 RGB led matrix.

Nice. Do you have an example? Or better, a test :)

> This RGB led matrix takes advantage of retinal persistance to
> seemingly display different colors in each row.
> 
> It'd be convenient to set the QEMU console's refresh rate
> in order to ensure that the delay before turning off rows
> (2 frames currently) isn't too short. However
> `dpy_ui_info_supported(s->console)` can't be used.

Cc'ing Marc-André Lureau.

> I saw that Kconfig configurable components aren't visible in C files,
> does that mean it's impossible to make the DM163 device optional when
> using the B-L475E-IOT01A board?

You could (but shouldn't) use for build-time:

   #include CONFIG_DEVICES

But better at run-time using [module_]object_class_by_name().

> Based-on: 20240123122505.516393-1-ines.varhol@telecom-paris.fr
> ([PATCH v3 0/3] Add device STM32L4x5 GPIO)
> 
> Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
> Signed-off-by: Inès Varhol <ines.varhol@telecom-paris.fr>
> 
> Inès Varhol (3):
>    hw/display : Add device DM163
>    hw/arm : Connect DM163 to STM32L4x5
>    tests/qtest : Add testcase for DM163

