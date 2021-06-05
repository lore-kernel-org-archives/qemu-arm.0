Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp1694442lfa;
        Fri, 4 Jun 2021 20:39:15 -0700 (PDT)
X-Received: by 2002:a17:90b:b0e:: with SMTP id bf14mr8138314pjb.147.1622864355640;
        Fri, 04 Jun 2021 20:39:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622864355; cv=none;
        d=google.com; s=arc-20160816;
        b=LceMf58a2JaATcHp73k0FxXCtMyRaLF7AsJ5CtWvduPcbP0FDIWOEVB7caBwC0p3i6
         jtWAnyfMtK81KSpwjIcO3Ip0ew+MweYn20akYSheh1zJZNPTPol+Qw05j+4EKeOYzvIm
         iauFT63RD4h+EerCXrD0H1k1PQbbsLI8BX9FpA6lA2HrIh3IR4ZSB9aDg5njTNDbMU7P
         kw8s1SGurGMCcC0mYCUQrkAie/Zx7A6f9JFX0PZeBy/MNcv7C7Wi5iRW514I0EICeFdS
         +BSbACPaSaSdD7JDnlDYKvlH+AhWp7V7UNorSuNP+cGFUc9nuI2npIrmPyE0koqWSAVu
         +WyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=wfnaLuPEEPfaThVtUJBDi8gBMKeb4fLTPe3iiDSJSAU=;
        b=GOcdPWKFhKHsdwh0ebhEyl8jYm+me3Oi7x6A1KVDJ6JH6n7hiHsND2HawZz4EplIeR
         NGEk10PG2w5LWjKRxMLX7DgBwbcDyoggCDxxaZR9eK/gAHj7lBi16Q8AZ/WkdooKBKzI
         n+S8GMQxM4DMXroW5Cq9TKC35hZtmyNri8NO+koXo5S542n4S3TeOO0AzkQrdG0G/TMt
         TZVntFHFLrYcGrXLt8ft7ajS8dCDH6wndimxL/SoHczbgijv/NbfbewoiLe3FwVV9Vo/
         LDGLWUdwnylVrIOD0fCZ1FB34SlSHCdVaen6/noWmRUVm/iWqvMHwCFcGRYfvrv90mxh
         Ug/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xGnWyKsE;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id s24sor2167676pgh.82.2021.06.04.20.39.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 04 Jun 2021 20:39:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xGnWyKsE;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wfnaLuPEEPfaThVtUJBDi8gBMKeb4fLTPe3iiDSJSAU=;
        b=xGnWyKsECDHQD6m03UzkUsJy43RfYRgZnkh8Y2oBEXsTudz09EQd8DM6oxtydNJ6DR
         DENJleoTs+EIihgUCijtfitbqdni6cu/JqHiRNPifEbaTMUENN6kfPJRgHMySBCizHwB
         EmmgmVs2xvBqmvPyENAXEag47ef6eNxlc36BFkiz60vzEPdSX33SAbLABVEVPdpDBwCQ
         oDZZQHvQowaVEZiuOQ4c1nERDitntTwP0sJmaCTnk4sTFlb7Nso8m1gZKbNR+ZCay4C2
         41YRn5gHKv1na0uNuds7l02LZnjonRLvN7fpyzCGmYRyJ83g6+rBLnjepxSkVE2kCmRw
         oOiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wfnaLuPEEPfaThVtUJBDi8gBMKeb4fLTPe3iiDSJSAU=;
        b=M/nwERszp7EgIxwCdLr/EocG2LlqfavRyiHVGLWC4qg95t6Q/83O8vSSYqJdRdd65c
         Cs9LzumfC04LmzMkX7mSc7Ozl0eDOJ6uwTMKCRw1FnJ3yAF/9oxBHJNi0Xm9uprCjDMV
         JBpCwMMc8xxNLMn4B+N5DIrQIiLa1X5Yip3MBfZkZLG5uGa5GZaxW3nJo0ofkbukdtIB
         O/CpFlNSXMvvem6m52HmCEmCwD/wZnPBrk5E/hpVGrCR3NFMZ9CHijyJzUhT9mcmTngZ
         6SVE9NmtG8JwHpfOPBrAlVxbXQTWze3guV1tQZiXDSotqXiUS9SVw/J6mWHYwVvXZy7B
         eDBA==
X-Gm-Message-State: AOAM531qCLM6oIXbKHxS/gGc1TGS3KXYOEiIyFsp1PVOWk8BMphI6K9y
	c+aH2KuRUMxAUYzpA8/bWxVCT5Kh
X-Google-Smtp-Source: ABdhPJycUnc1Uom6Ne+pXT23ySe3KUidovqpYlGarLcNeFNRy+puxWF7wopEuP05iI8Fx3xlr6U9RQ==
X-Received: by 2002:a63:338c:: with SMTP id z134mr7965537pgz.167.1622864355076;
        Fri, 04 Jun 2021 20:39:15 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
        by smtp.gmail.com with ESMTPSA id s20sm5942589pjn.23.2021.06.04.20.39.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jun 2021 20:39:14 -0700 (PDT)
Subject: Re: [PATCH v16 54/99] target/arm: move TCGCPUOps to tcg/tcg-cpu.c
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-55-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a7d172e8-9602-e150-296f-1d760f5c6b38@linaro.org>
Date: Fri, 4 Jun 2021 20:39:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-55-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: BR8VAqAzwCtp

On 6/4/21 8:52 AM, Alex Bennée wrote:
> From: Claudio Fontana<cfontana@suse.de>
> 
> move the TCGCPUOps interface to tcg/tcg-cpu.c
> in preparation for the addition of the TCG accel-cpu class.
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   target/arm/cpu.h           |   1 -
>   target/arm/internals.h     |   5 -
>   target/arm/tcg/tcg-cpu.h   |   6 +
>   target/arm/cpu-sysemu.c    |   4 +
>   target/arm/cpu.c           | 210 +---------------------------------
>   target/arm/cpu_tcg.c       |   2 +-
>   target/arm/tcg/helper.c    |   1 +
>   target/arm/tcg/tcg-cpu.c   | 229 +++++++++++++++++++++++++++++++++++++
>   target/arm/tcg/meson.build |   1 +
>   9 files changed, 244 insertions(+), 215 deletions(-)
>   create mode 100644 target/arm/tcg/tcg-cpu.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
