Received: by 2002:a17:504:4644:b0:1be9:327d:8ee3 with SMTP id d4csp1212792njg;
        Wed, 26 Feb 2025 14:19:44 -0800 (PST)
X-Received: by 2002:a05:600c:1c16:b0:439:8346:506b with SMTP id 5b1f17b1804b1-439aebb2e0fmr186501815e9.19.1740608383906;
        Wed, 26 Feb 2025 14:19:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740608383; cv=none;
        d=google.com; s=arc-20240605;
        b=DHMOmW6+Q9TmidhdKr4m/duocjZAoPhjubKHDddfSB254g40sNS3UdavFTEIWSUai0
         5vPjrcPrX4RVQ9yPmDw+kDP1Dn05x2YwY/Cb7Btuibw3XWvZj2hjE+a/750kELYm1XkS
         OGaygd4fE8nEx180uHTqdKSFS2FLf7WlDVvQi84dCOxkNV+PQdJGt/PJTygoGA91AqY7
         kixeFinI8JpwMwYVyDRb7s+pSl0SVoEUv4I+69mv2rnfzu4F+Q0ETWKNtGyiB9Os0aNU
         oe6qFSrlXkVzf2sWHfqHnFdksKz1CbUh6lli3LWIJJa3JicyuqKiy+HlNodoM+s3frza
         SJQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=I+p9gOhEHGVoC9nVh64I6Ojhb1aZ2tfzH956ceNDxus=;
        fh=Q/+Y5r1U4UNFm8ayBnMFXKmdEltXe+pZ2xP8La5F4Is=;
        b=ZAZ5ZEQ2OYs14olEKr9PQ8hvGLpIvqeJ347MzQARZV8+pkAeuFkrOI+brUB1DGUVHm
         7pmOmMU6f4VIwbp275gI4ttN01ziUIUVXFpV22F7KiB554k0d2o3Q+PiG3wGfTUjJQEl
         T+mThg01GT5z9bjA7f5f5YeCfZLpySlXV6UtX3l1fiZB81hJDq13VXqO3BcD6HZjAZu+
         thgsAMQF8Guj2zEESpJmk9/ZnmQjznR9W7MDoOCcDomXsIKWkwF/FEG/reY3Sp3SUWnu
         9N0xa01A9SZ0eXNHXLHrxqL+4Z2UwOviI3HiG1Ajg5JRE/yMSZ+HXLtnKm40p7+h/uGk
         RbOA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YHrUVtvD;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-390e482d121sor33830f8f.4.2025.02.26.14.19.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 26 Feb 2025 14:19:43 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YHrUVtvD;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740608383; x=1741213183; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I+p9gOhEHGVoC9nVh64I6Ojhb1aZ2tfzH956ceNDxus=;
        b=YHrUVtvDHIfJ3jvqd51q0PfJRpAxMsgJXWcTWn0CYpf0Cl8iIZIMRVsVK+w8qoMLN2
         q0/gvjCA2KOkaFctjtNgZ32elSdbt4Ugacc01tAPR9UHMeisEl5eXwYYOw0EuniVuz3V
         NhEKJh6hAoIY6ncPler0mC3WOS6Oo1V67eDGdzbREpTqGCbIPzMvO0mfx7BCd6t4ahLg
         lIMpLYZl125PQ6y5uYX1pWPNcjaZHjFGL6Fx6RMpi9/csBJs47CyofR8XeFhzlBmmTiW
         nhw2dUI3mH0nTgB+BlethcSYQHFZ5b7Y777H08t1rsOKEk4H+ExL04VHsPCB4KPglTyz
         T8Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740608383; x=1741213183;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I+p9gOhEHGVoC9nVh64I6Ojhb1aZ2tfzH956ceNDxus=;
        b=EAVlmUldUHegD3GR6tV9ybHI0x1v3rUhmVniyUCwMGu1sxeG48JukYLFJ+8+iJYF9m
         78pcwFDZtA1Eh0U6CcogPuMo0k+cODJ4UrMAAW3oKPI3WTmSJ76wB9b/3mOeXANYiISg
         RXlP2oXsUmRNp7I8T9OfPaMFG4ak8aHAph1KAeaDO5amt+hAQdzACFOU9vigOvN4o1Tq
         gI5/qYoQAh+MC/s2AqJM/DiFpIPttSIrSCDBeMSbsqV2xoeQbOxwogZRu87KOmSQrtcT
         GBFlXRP0vNFy3TTnmN+mBiM2GPsuKlhw5AZ1YEY6UwGIbhbeFR//cyl6qDkLGRwPj6Sh
         tL6Q==
X-Gm-Message-State: AOJu0YxybNLQCb0bgvajo0EVZSlAkg3F5m66qPBJgvjJAskQPzTh68Su
	P66rDuwcaRZrR/+XJk8lm/SkuQBBfU2nnasgkB9gmk4Yl6eijwV5u7llR3DyBFr0AnFxcpHOSf2
	834dBPA==
X-Gm-Gg: ASbGncv7vJ9flyQ4zqLDcHxsuoOn9II6DMvdS2uZfhtlGGkv3EVjCGB1DdsAtgxM5kp
	QhPiPz+wN101+Emz9KRuV3u/SC7A3HryZzaG3w1CzK8hxCLyh5GMTHJ3rDSK1mAOsditkHLqryG
	MTmGMW2liSr7VIT+GsDTqxeqtYjxQGCeoJ1q4WXOkCjKzaTh/5nZaoEZQ6NabdeIMyzkz2T0Ybi
	tkyD8sceRALgauvXAXkORfnIH8Pyo3NXPgFOkTfnsXDsT7OtGdJlqgiyJ7pKOQJvYfHX7Zk61LS
	Psa+7dAJScu1aAfem5RouMgRzXZTC8XYPzHIBwDLZ2ioNhJbo1ucIoo3LSysB48YpbUSSw==
X-Google-Smtp-Source: AGHT+IFYpE4nJBQqZGIKSb9Eib5UVSiLyPwaOANLz5VD/BYC0hGWhHGiSgWe0udZR9AhqRZ0+alpmA==
X-Received: by 2002:a05:6000:1447:b0:38f:2ffc:10b0 with SMTP id ffacd0b85a97d-38f707b0b03mr19834487f8f.27.1740608382910;
        Wed, 26 Feb 2025 14:19:42 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.196] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e46f580bsm162691f8f.0.2025.02.26.14.19.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 14:19:42 -0800 (PST)
Message-ID: <02154f4f-954c-4e38-a473-f1d1b752257d@linaro.org>
Date: Wed, 26 Feb 2025 23:19:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/25] plugins/api: use qemu_target_page_mask() to get
 value
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, Eduardo Habkost <eduardo@habkost.net>,
 Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Riku Voipio <riku.voipio@iki.fi>, Warner Losh <imp@bsdimp.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ed Maste <emaste@freebsd.org>, Thomas Huth <thuth@redhat.com>
References: <20250226140343.3907080-1-alex.bennee@linaro.org>
 <20250226140343.3907080-16-alex.bennee@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250226140343.3907080-16-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: fxnybM/dFUIJ

On 26/2/25 15:03, Alex Bennée wrote:
> Requiring TARGET_PAGE_MASK to be defined gets in the way of building
> this unit once. qemu_target_page_mask() will tell us what it is.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20250225110844.3296991-2-alex.bennee@linaro.org>
> 
> ---
> v2
>    - use the proper qemu_target_page_mask() api
> ---
>   plugins/api.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
