Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp476418njm;
        Tue, 4 Mar 2025 16:01:53 -0800 (PST)
X-Received: by 2002:a05:600c:1c13:b0:43b:cfc2:ffe with SMTP id 5b1f17b1804b1-43bd296588bmr5882275e9.13.1741132913111;
        Tue, 04 Mar 2025 16:01:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741132913; cv=none;
        d=google.com; s=arc-20240605;
        b=UC3+OsInWOkur2RUfZzPg4qjlrChWQTnn93w1lDHNDTWFjqZb0oyJ9vDa/KD1qFPYx
         L3CoFFk1ydjXVe+2UrXce4vlA44oKnTo1qilf6IWgtlzxHXmstAEPbqA1VvBc5az87Eo
         3D/N/q54c9ZRLMrrjvPyedE8mqQ+SKHHCblYP2tKkr973x/s1XBx+Gf9pCvmfp1q5QQ+
         +itUHVMxVhHFCOBeTK/hJ4Q1POcDPW4EYIDm6bRCqDKr9Euqc/P42HlX8osgG5JBTboJ
         Ni+4Uhszfl50StctNs77xa8wTT/NiLBsaIr5Rt1zL8nc1sH4/MD61pPYmlWPlJWlv7sE
         7KGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=R6mMiL81tBq7dadl/UEbWgW83XnayeAp3Egzm+vVHNk=;
        fh=4v1ylLgBh0hKF05sfVPUAQgmXJ/Xd2PZ3U9U2/7eYvQ=;
        b=hsI0psQiC8yh/CRyyS86d+76Y7Z/2zsN79YsN4VdhU9spJX0d+egLNeLc48HFGsU89
         v6bFojsvjQG464QL2DKCo9Db6zDZ/TfOEeQpmY/WyMpNpED1+omrk3PgGE57NWUnUHUF
         /lk1QiJpVdA9/VwxBGPkj/ej/2G9cv0QausYpDpfMoiWFxThv53hvNi2cYY5ShO/8Y1Y
         UEEopHZ54KRMZrPrJ25OrcxMbmzM9rw1JAJcMcYLQIKqJhp2U7GqSK8+7s/clIzpxRWr
         g8AYYtGwgKdQBBTUPdypq3BY+2RpjdPhC0C1NXDqx9HLHJCup+McM9VyEEZ/mFhjzwuh
         eknQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x4bvbJaN;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43b73701473sor64469735e9.2.2025.03.04.16.01.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 04 Mar 2025 16:01:53 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x4bvbJaN;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741132912; x=1741737712; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R6mMiL81tBq7dadl/UEbWgW83XnayeAp3Egzm+vVHNk=;
        b=x4bvbJaNmgM5Q6U2OGskkY+OoLyfW3HsNeVVXH15H/AMvK7TkVao0VkDrkGRpJkWKA
         YNBiiZY1GkODHsGXpI2a97Oj67D/Esy0u8zexuE3jzO10BLM9i3pIZwYLzvRpPGPCysS
         cvrxtonBzirdOabL6nkrEGz83nzSaODeVTVDYgPw9c2vnKhqJWLQaIVwZeaGqUzZI43w
         emJeOaeQpLBevqEOAmK7hAS2YR/UlM3LPrBj/XuvyFB9WHpOKodxEH/Ekb0zL0iMMxbK
         0+GebCLq+4B0DZ7v7NRHxI3SRXUtSGm8CKoa+JppXoC0ayW3VbU6tyWaUJgrjrjtK50g
         ULeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741132912; x=1741737712;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R6mMiL81tBq7dadl/UEbWgW83XnayeAp3Egzm+vVHNk=;
        b=t3LLVu0vpRHxS5YxzG9WbWm/r/W5FO6JqU0uDC7DKf/kyhVA31+O+asZEgHQVJVHfo
         43UZ/rSYeh6ud7VqgG7YI3zxsWTLtI/QeDMEFn2hQLlvz6d7ama4A8HobR5GVh2nonHt
         q30zvOX+Ab9/OxzvJnOAlIK2xGa+qSq29nkuGGbAA+kdR6fgptIRZYTnbwVKXU62QPOa
         aZOz3wTyoPQsx1RmECqQYXXB3CQARBpAwvyonQZvEJfXsUG9Atznyg4z5GqUZG9aI6T0
         Q0ZevA3Wordgf8wmpGUh9ZVBDrUzAjYG7h4mvGYGpCca/w7G35PLjhLNmPTyXIfcflL8
         8cKQ==
X-Gm-Message-State: AOJu0YwR0vxVTHy/EuFcTerqpwvblDM4qaL+ZyYswclZXjHzFTIGAS2w
	Z3q+JU8pPIwHXSvFTgm0ADPEYI2HFa3cQ5eeDQUWn2cV2mH7+y1pkJHvCKxQ6N7t2JXGR8ZtBdt
	0W5YAXA==
X-Gm-Gg: ASbGncsRLtfyfK+TdmAobHndBcamQp4+EDsFe+R1JXE8FXr/YC5511V8sSIOgo4Av33
	wN3dBGUV/3MJQAI8pVoL+R36nxur/VZZIpRQg699egA+WGeVJc6P7hO9ILeLstmXjpUfK9Z6kbl
	S5wix+2JvQ7BKUcrjBQ5ME1eIll+h9aWilRrjFpkbHTYGURxsTzDbjJvMERa/eIvYctVhEsrYSq
	j2wltGxF7TKu2YFKFCOTYcNWfM++wcj2ZIxTp4aIAKuLofcdci/YqhXD3Oox7kUSM5S6yHYv5od
	OjtLxRCAJXbIZytBRXLewXsjzt5+7RfNcp8JxgcxG9CIZl3pCJOXJMkMmBZtPlIvU8QoziWgJeQ
	rvOqddO9ALIQN
X-Google-Smtp-Source: AGHT+IH1Vbd87AWbycmQeSkjTrK6veDQEJpf7bkJSNA/Xj+Z9mIrkDUSCBIQ9MwbY570c8sLgFOmuw==
X-Received: by 2002:a05:600c:5114:b0:43b:8198:f713 with SMTP id 5b1f17b1804b1-43bd292db63mr5598295e9.4.1741132912151;
        Tue, 04 Mar 2025 16:01:52 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.199] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e486eea3sm18806425f8f.101.2025.03.04.16.01.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 16:01:51 -0800 (PST)
Message-ID: <44f7f6d6-2c13-49a0-8775-40a9a12ba86b@linaro.org>
Date: Wed, 5 Mar 2025 01:01:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 21/32] plugins/loader: populate target_name with
 target_name()
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Peter Maydell <peter.maydell@linaro.org>, Laurent Vivier
 <laurent@vivier.eu>, qemu-arm@nongnu.org, Alexandre Iooss
 <erdnaxe@crans.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Riku Voipio <riku.voipio@iki.fi>, Warner Losh <imp@bsdimp.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Kyle Evans <kevans@freebsd.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Ed Maste <emaste@freebsd.org>, Pierrick Bouvier
 <pierrick.bouvier@linaro.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>
References: <20250304222439.2035603-1-alex.bennee@linaro.org>
 <20250304222439.2035603-22-alex.bennee@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250304222439.2035603-22-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: W1+Y2qsa3yg+

On 4/3/25 23:24, Alex Bennée wrote:
> We have a function we can call for this, lets not rely on macros that
> stop us building once.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20250226140343.3907080-17-alex.bennee@linaro.org>
> ---
>   plugins/loader.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/plugins/loader.c b/plugins/loader.c
> index 99686b5466..827473c8b6 100644
> --- a/plugins/loader.c
> +++ b/plugins/loader.c
> @@ -297,7 +297,7 @@ int qemu_plugin_load_list(QemuPluginList *head, Error **errp)
>       struct qemu_plugin_desc *desc, *next;
>       g_autofree qemu_info_t *info = g_new0(qemu_info_t, 1);
>   
> -    info->target_name = TARGET_NAME;
> +    info->target_name = target_name();

Unfortunately the declaration is in "hw/core/cpu.h".

>       info->version.min = QEMU_PLUGIN_MIN_VERSION;
>       info->version.cur = QEMU_PLUGIN_VERSION;
>   #ifndef CONFIG_USER_ONLY
