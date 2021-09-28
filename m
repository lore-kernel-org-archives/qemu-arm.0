Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp4841580lfp;
        Tue, 28 Sep 2021 05:50:20 -0700 (PDT)
X-Received: by 2002:a05:622a:1a9f:: with SMTP id s31mr5320963qtc.381.1632833420155;
        Tue, 28 Sep 2021 05:50:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632833420; cv=none;
        d=google.com; s=arc-20160816;
        b=ag3mT+MAc9SMSy7jsBvgRolLLmlZbek1hc3ZzD14Gp+t6HW/1C3BU8Mmea0R87VaEw
         sMwSLcvteITZAPBUqh+lOGbALMpiU6Ce8ScZXMJ+Zg4EHw8wkJ5Fa1XyuaXJGWOjG+4w
         6eVPFP0akjvmL7jWa1Ou3DMHSpIlJsAW4iRP1cKMP65S6ebZCm8Rg0Cst9e1KiFUf5ma
         uubgyd9Esf1emu+FPBd3Uhi+gCNe+qQSifZACO63y3eXjp7l0GXV03zNZJ8EYFmO/TfS
         jcW4XenKid69z/P18OpC1d5YXINBXbcFv8+CXWNJgYGAedsbuybO3Ens9RN4otsZZrep
         nLvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=Nifb82zOt4L1jbCwPB7F1P15sSowUBIE8D9lmMaSkIc=;
        b=xkNxDj7Sl9nqhMWdSz5/SHROAQki4y8qH21m+K1MLwiohsMAfyMkKQ6ZdXZa4HcJVQ
         hepFsql4NNVtVT1xZrmSCkRTlqdsth2zJ/E9SB3I8iMvd+nVsSnzEL4ed3B4OPXg/GkY
         p19ltxUYdhoLhuU4HORISS/vCAVAJ2IEdU+Q7CFX6Hi0IoknTg7zY4LXD2a+MQXZOWso
         3VV6iWwyAVBaNZraB5zTzm2hweZJ1il6ENi7RJl7UPQRIyiQl1YTBbpVUvFXfK44si3Z
         Rt/v6NTkyw/HYBuihVnmu31W0cgRx9DC/99eTGxf1w4goTgCTHjNTLsOzBoEJ5HmW+6o
         V0Sw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QQ9nWeMK;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id f10sor6652534qkm.14.2021.09.28.05.50.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 28 Sep 2021 05:50:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QQ9nWeMK;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Nifb82zOt4L1jbCwPB7F1P15sSowUBIE8D9lmMaSkIc=;
        b=QQ9nWeMK37xStcubx5e+t+SHBrmDrrKwfBTLAsALjR6DY5Ovu9JPPhirBPbfifK8fz
         NHDuAztWuYHEbVLtW62c2/+6COPAbNLeIIFH7l1YGntdchiD35RnsvDK7QvzqB19/6Ho
         L/GnECrVa8nyNWWAL6ffkYgS5FlMPrQdMWvgu2/MjfixA168PPKiIiqvKxj+GgY13Wh1
         DZzKBLmYWPyg03+zV3l9xfTKS7iR+eOq4fyYW1W8OGSotD/lJop0+GgutXAgLBUy+aCJ
         N8a1OQ475pkuEYpyHmYfIcvOlJcuWaKGaG2Qlek2ioKu9Ur433jNIJ8yRAljI8bBDxJt
         ywng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Nifb82zOt4L1jbCwPB7F1P15sSowUBIE8D9lmMaSkIc=;
        b=gDHVMBeDlZcZ1ZGeUWPLNs9WflFQhOlZ14Y0vsmGPj4vwhVFBkUxCWaXukzVGD57HN
         Qq+MkzaN/NjOwilImg7TwYNSex/zmIYUDqxcHeysdJMq/KeCwAC4aML02zBvoVXyKmoF
         /nFYTGQqkY4ilX6gMJeQbwQSbeAeHJTHJOc+SYaLoLSWA3tcW1mOmHOda7sJgcSXEC3D
         cirjESMO9udOWGtD9fByOoLNK8FuPOMCpb9+zTA5Qa3iPPw47lEQRVr6vZMIKE9U8RiU
         kPZN9XFCArG5ZxcPoc2wvjDAyHiWWeCMvoPlKPnO5xZYARsrf03An9aJuS1lMFKIiYBe
         /sBQ==
X-Gm-Message-State: AOAM531953qEQfVxLrSFViiKzHtq1lPstvN4riG13byYYQl/kqUePuRN
	x0TneULOoWrXDn52kXswrnj4O+jj
X-Google-Smtp-Source: ABdhPJxwCmNVP4ejlJqyMRRsFa/BQaGuBqPrVm4WaB55TO71/7vz+lXnPtevUz/ZWeoo6QPQ0hWAgw==
X-Received: by 2002:a37:8085:: with SMTP id b127mr4957268qkd.449.1632833419774;
        Tue, 28 Sep 2021 05:50:19 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.3.43] (cpe-24-31-215-130.sc.res.rr.com. [24.31.215.130])
        by smtp.gmail.com with ESMTPSA id y22sm14358443qkp.9.2021.09.28.05.50.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Sep 2021 05:50:19 -0700 (PDT)
Subject: Re: [PATCH 10/29] tcg_funcs: Add tlb_flush to TCGModuleOps
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Laurent Vivier <laurent@vivier.eu>, Peter Xu <peterx@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-ppc@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-riscv@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Stafford Horne <shorne@gmail.com>, Huacai Chen <chenhuacai@kernel.org>,
 Halil Pasic <pasic@linux.ibm.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Bin Meng <bin.meng@windriver.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Greg Kurz <groug@kaod.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 qemu-arm@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20210831121545.2874233-1-kraxel@redhat.com>
 <20210831121545.2874233-11-kraxel@redhat.com>
 <fdfd7f35-fbec-84f7-ebbd-7790df20b1bd@linaro.org>
 <20210928113204.ic2syx4w2cjsqr7h@sirius.home.kraxel.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9d3cceef-f385-5d0b-6b0d-2b7be17ce187@linaro.org>
Date: Tue, 28 Sep 2021 08:50:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210928113204.ic2syx4w2cjsqr7h@sirius.home.kraxel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: HlrlNaCyz82H

On 9/28/21 7:32 AM, Gerd Hoffmann wrote:
> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> index 608d768a4371..72e4e3b5bb89 100644
> --- a/include/exec/exec-all.h
> +++ b/include/exec/exec-all.h
> @@ -160,7 +160,9 @@ void tlb_flush_page_all_cpus_synced(CPUState *src, target_ulong addr);
>    * so this is generally safe. If more selective flushing is required
>    * use one of the other functions for efficiency.
>    */
> +#ifdef TCG_DIRECT_CALL
>   void tlb_flush(CPUState *cpu);
> +#endif

I'm pretty sure you can drop these ifdefs.  Just because there's a regular declaration for 
a function doesn't mean a subsequent inline definition does not apply.

And even if that didn't work, I'd be willing to trade inline expansion for not adding lots 
of ifdefs...

> +static inline void tlb_flush(CPUState *cpu)
> +{
> +    tcg.tlb_flush(cpu);
> +}

... these could just as well be out-of-line.


r~
