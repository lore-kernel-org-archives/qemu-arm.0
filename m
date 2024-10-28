Received: by 2002:a17:504:82cc:b0:1be9:327d:8ee3 with SMTP id m12csp36733njj;
        Mon, 28 Oct 2024 23:11:00 -0700 (PDT)
X-Received: by 2002:a05:600c:1c1e:b0:431:5ecf:2a39 with SMTP id 5b1f17b1804b1-4319ad32854mr73965145e9.35.1730182260377;
        Mon, 28 Oct 2024 23:11:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730182260; cv=none;
        d=google.com; s=arc-20240605;
        b=Pt7KgQvCEep+egG+HWkY0dlCP7juo+BDEd5NH8DLPp3N5CRYMX32QlWg8/3aRtW0vU
         bVcnENn3vnHwWsdlMLa5E063mf7KOvATOHsF13czJGq/DaN/ezmSz6pu4oMIwhYqWSWn
         yeQjaoq75MvVaQ/Fxi6MtDAsMjpoP5SD6/ABm0oIdJembXuOT7GC8wKgea3Xk0NrCRNa
         qjHyYG2QZdiioE+uw3/a1jyjtHRvElNrIRTPbcf7kT8iRMhuGtrx3oSe8Mv/X46onL8F
         XdFixcwV0EIZRzUpVzEqekOVXyabwXPfsPqER0yVHEvUHFCCbekk2SoOgMrPvgvWtHAB
         YUPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=LahcWkmLa46gQ/BZWeklcOH8biCwkYCWvJuufWQf5gE=;
        fh=cV0x2MJ9gtIrfnrUMYB6k0QkF3vl+EU6F4WwtejqRuE=;
        b=CDMSJ/Xgco/ulPJu9Sbr4moGv3+jXUpnD+UlS/gxy9NM/mYmMOKkSq/2LpyDmcmX5N
         5yiX135D1/Pid1HDSodDfhC39E/DNY19c2oWAiPPUgnhbAdYSDuC+VikZ2WFfChbUFZv
         FjjTsDazZ+7aCBDCD/DYGClkaV7H8lpQfV7nJJSMfeJfjXjsAbs1uZ3kMrwQBwcVOtDn
         1Vx3KvWQEfrXAbbLyxkTqX3ScwUDamzHyhkLYHfTky+pKMR+UegsU4/NPsTGPILzWvQY
         RXL2ZwO0hX3dN6Plw5WRWLWkEI/u0KrSj27hx7Q2JBrrGcHQM49E1TkkepwOr0K/57sW
         jZ2A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V9V4lbN9;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-431939721adsor37894175e9.10.2024.10.28.23.11.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 28 Oct 2024 23:11:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V9V4lbN9;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730182260; x=1730787060; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LahcWkmLa46gQ/BZWeklcOH8biCwkYCWvJuufWQf5gE=;
        b=V9V4lbN9Sd2+DcuGRaFGIGjczocp830xpYAefEiKnPaYjJKK6W056sVg0qFUYD+Oiv
         GDAkLPMbWrQn0WKKxUWTUN8wzfzC1NzZmmMhX9i3280iv+96oMltHGzBDCM++YoFgfJa
         RQH5o3LLXss6J86lR+GOf2c1WVI/4OI5jr+5meqqZU3se+jqdKanXNXZiRnU6JyGObAf
         Q9WmWaPKyll1gLg1W7tRms0EalLhf1PLxz9Gh15MjhRWVthlq3o0vgTriGZaQojhbFlK
         VtAkwRy596dfu7G/xrtIhgLPmJZjwPMGSGx8ZiRIYmzb4o+Fz3NddqpPEbgB3M2eb3eN
         O+6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730182260; x=1730787060;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LahcWkmLa46gQ/BZWeklcOH8biCwkYCWvJuufWQf5gE=;
        b=Ydn2LFRVbiOxp7yCxCG7M8plPJ9T7+10cft41m7mpiySN1wAfxlqYVgaIPah/5hdbN
         V1IpFyjwo+iGSMgy5k7NnUsZuwoiGqY83DsONuVTboMtm1b/zjweH6SSmWhfnOlzea+O
         fQz/I8URFjPmeuJ0qk4S8cRvrwrNU9Nd2fBFJB5hBKftgA5vGE8il+TwzcGBNp0KJQF/
         TGsdFmw6zx2D28OZj6ZgsA6h96J4puIRCI6vChnuIzRmiCNn/oi9//i3ByNV2s8u5/Sd
         Qo7qKF3Hr6F9fBnVEzPV88bSu3ZJbVotH/AWhMjEJSJxCiZazL456vfNBM1DSrbq564b
         l/RA==
X-Gm-Message-State: AOJu0YxRmsXF8C/dQnpsiW2E98FwivBaQYEsfoAjZgWav1P+RogX2bet
	AsCSefgVh4ZIbf2OAc74KpGfODsjjO0+eflKfhG32kCFQyC6RdgDvMfDrhU8cbqXSA==
X-Google-Smtp-Source: AGHT+IHExKUK3UshOUzVx5r5Be89FzG9/0HsbhesmFubuIqpfzCLyoE34FsfTaBE395kmjfd8mxDug==
X-Received: by 2002:a05:600c:3b87:b0:42c:b187:bde9 with SMTP id 5b1f17b1804b1-4319ad2f06fmr81341425e9.30.1730182259795;
        Mon, 28 Oct 2024 23:10:59 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.21.227] ([90.197.151.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431b45aa058sm12150405e9.1.2024.10.28.23.10.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 23:10:59 -0700 (PDT)
Message-ID: <3939d294-2a0a-4f39-aed4-86adf8de48de@linaro.org>
Date: Mon, 28 Oct 2024 12:22:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/21] target/xtensa: Explicitly set 2-NaN propagation
 rule
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Eduardo Habkost <eduardo@habkost.net>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Aleksandar Rikalo
 <arikalo@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-ppc@nongnu.org, qemu-s390x@nongnu.org
References: <20241025141254.2141506-1-peter.maydell@linaro.org>
 <20241025141254.2141506-15-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241025141254.2141506-15-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: TpUlrAv+zMlK

On 10/25/24 15:12, Peter Maydell wrote:
> Set the NaN propagation rule explicitly in xtensa_use_first_nan().
> 
> (When we convert the softfloat pickNaNMulAdd routine to also
> select a NaN propagation rule at runtime, we will be able to
> remove the use_first_nan flag because the propagation rules
> will handle everything.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/xtensa/fpu_helper.c     |  2 ++
>   fpu/softfloat-specialize.c.inc | 12 +-----------
>   2 files changed, 3 insertions(+), 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
