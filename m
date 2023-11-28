Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp1905287ejt;
        Tue, 28 Nov 2023 06:07:03 -0800 (PST)
X-Received: by 2002:a05:6871:438b:b0:1f9:9980:93bb with SMTP id lv11-20020a056871438b00b001f9998093bbmr20845480oab.52.1701180422820;
        Tue, 28 Nov 2023 06:07:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701180422; cv=none;
        d=google.com; s=arc-20160816;
        b=PTF+gB07gDsnCOmamvihhVAWd03VjC+ohQ8ogcwGEkEngrphQt0FmBCy5HX4PkW93Q
         hnMnhTNwzzLsyTz4ALzkrE3UzAxu0NrTQeaiHPenoyMoNd5+MroHGFOymfRrX4re70ZL
         Py+s5+/NVt9T5oktFQb1hceZCJrsefmMV+LdeyveotvcnOTZZk9hpMN4p9DGdknX04pA
         5BVt40p6S1pp1uvcTp2aGAEbJfEDl80jYJH4hKwMqN0pt5CiV+s64mS7kEErm1HTCCb9
         bSORQK4/1ULbdX/mQCo4oVAEbV6TnV7u+oyLw0hsV17fF5I96xCTBeEULyOQzKps7uKT
         UDlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=IVBXxCL3b/HYlHx/ddymQrkvoQWPPSzCHh5nA+M6FXA=;
        fh=j47SlpSDusZ2mmWrSbVW2DB7/ZZUDU/502C3FK4P+uA=;
        b=s5+43Q8GwrbvNFX7XT+5n11wvKg9GTidru/KG8TlNlDOHPslp41KPiUhVIHL2Gq3TO
         jA6m1NtudT5jRRBO758ZJea94gavOhj/gpi2KtCWs+Qiu+ObVvr6Y4pUs8ld2eqSNZDX
         LJOpW71z3UMP6Z4NbRtvU4CdsDGrp3BSWiPlU/+m9mDSf4543VWxpr22R0wzwun9PHVJ
         TcxDRKISBomdWih4t9/t12lrEsNcACYTm6D3+50UdKwgYiA1XInKeBzDYAmG/k+XHQwg
         DCajN2nTdBI+OOsjrKeGJGgEMTKpUZ+YV4HEkdq7vgVZfIMgTelgCTD16WaGyVhd+5+w
         YLcg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E4fQtlZ4;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ds50-20020a0568705b3200b001fa170f5108sor2823567oab.10.2023.11.28.06.07.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 28 Nov 2023 06:07:02 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E4fQtlZ4;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701180422; x=1701785222; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IVBXxCL3b/HYlHx/ddymQrkvoQWPPSzCHh5nA+M6FXA=;
        b=E4fQtlZ4ll3nQ8l8xcsSti97R4xG73r52YBUjrZjPIvrpj7/SWdIRbjBnpBPnt4bQ8
         BtglOlSRVNWpZ1QQ6ldTi80+N0qP09qA4pWKxbdAalR55RdHS53EL3GC6hRlg7MtyrHF
         6yh8LmQnS8wq36Ou1YZ7d56ib34lqN+ZZHEgGI0etzjOzy7yuB92haI5PlKeMNIDNu+u
         gSE2Omq0CoIEJLKBWZRus6DFrcEctOv+w7UY6xP1ZBSvdrok9wPDmCTX0NDkGIq70nm0
         GfCGgkGLBgGvm5sRmBtWDz1AWYHzngXxSyz8HW5iO19x1zwl3KkSCE3cpAe0k1kwj9PT
         Mxmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701180422; x=1701785222;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IVBXxCL3b/HYlHx/ddymQrkvoQWPPSzCHh5nA+M6FXA=;
        b=Qm4RBBDE+TeTQlZSN4xq1EG931OlDLw+tFIvDSsYnXuZf2/LH+NlwkLPz2kb2qpxOE
         MxIC2nbSX9/xf7aIOrZKeF4mrQCxk1t3FNVj27owSHOAYmcZnob4waZ2FNuiXPrzpVnB
         R9zu43hjQ9Zdi1bxSrKTU+D+FnmFB5jsHbTQOlswc5fFR7mv2VpZojJ/DNZptD8pdbyd
         aQr4QMViPFlINaOkvrYTo+rM+ciWb9QNyQD14PJxPB3P8B8jg8J3AV8A/gk5LuUTcpyY
         fRcTggYUOsgZXVjvg1whyyClj6Uj8bn9stHzkj/PPyhXljmcVH+Eb6R3g3g+ii9Pl7wH
         Dniw==
X-Gm-Message-State: AOJu0YxE4WbETpQwToieDZaG8f5cMxBZnmJxZ5y9F4Tu9Hrq5yQyGe5p
	8q1tqSRrQv0IOceh344atmMHHxJh
X-Google-Smtp-Source: AGHT+IGPFcCdUHQObrVW3CgDplXB4diSgReBGYpq27a3lR5i+QRn6MLEA6pyj1N1ZXX+VusUQtMu6A==
X-Received: by 2002:a05:6870:55c9:b0:1fa:25de:2f6b with SMTP id qk9-20020a05687055c900b001fa25de2f6bmr11596564oac.23.1701180422236;
        Tue, 28 Nov 2023 06:07:02 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [172.20.7.39] ([187.217.227.247])
        by smtp.gmail.com with ESMTPSA id nx11-20020a056870be8b00b001e98b1544fesm2863972oab.9.2023.11.28.06.07.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Nov 2023 06:07:01 -0800 (PST)
Message-ID: <67bdc461-14e0-4db8-b41a-f664361ff4e3@linaro.org>
Date: Tue, 28 Nov 2023 08:06:59 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH-for-9.0 09/11] hw/arm/bcm2836: Allocate ARM CPU state
 with object_new()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost
 <eduardo@habkost.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20231122183048.17150-1-philmd@linaro.org>
 <20231122183048.17150-10-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231122183048.17150-10-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: PAEeVvpGe75I

On 11/22/23 12:30, Philippe Mathieu-Daudé wrote:
> The ARMCPU type is forward declared as a pointer to all hw/ files.
> Its declaration is restricted to target/arm/ files. By using a
> pointer in BCM283XState instead of embedding the whole CPU state,
> we don't need to include "cpu.h" which is target-specific.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/hw/arm/bcm2836.h |  4 ++--
>   hw/arm/bcm2836.c         | 19 ++++++++++---------
>   hw/arm/raspi.c           |  2 +-
>   3 files changed, 13 insertions(+), 12 deletions(-)
> 
> diff --git a/include/hw/arm/bcm2836.h b/include/hw/arm/bcm2836.h
> index 6f90cabfa3..784bab0aad 100644
> --- a/include/hw/arm/bcm2836.h
> +++ b/include/hw/arm/bcm2836.h
> @@ -14,7 +14,7 @@
>   
>   #include "hw/arm/bcm2835_peripherals.h"
>   #include "hw/intc/bcm2836_control.h"
> -#include "target/arm/cpu.h"
> +#include "target/arm/cpu-qom.h"
>   #include "qom/object.h"
>   
>   #define TYPE_BCM283X "bcm283x"
> @@ -38,7 +38,7 @@ struct BCM283XState {
>       uint32_t enabled_cpus;
>   
>       struct {
> -        ARMCPU core;
> +        ARMCPU *core;
>       } cpu[BCM283X_NCPUS];

I'd be tempted to drop the unused struct:

     ARMCPU *cpu[BCM283X_NCPUS];

while you're at it.  Anyway,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
