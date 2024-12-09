Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp2891475njb;
        Mon, 9 Dec 2024 13:22:38 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUhaT/WIniYPvCS0ureLG5XGP+VIIg+uwoIN6jOvwhSbJlNQ/KxxWjZh/gSiG3sM1zFE4DyKegrhyNRSQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHvM7t938+yXl30cOTtnvAGS2sDbvrjTlB2WmpwQZKIHDkYlF80QsGTDbD9HO9xm2xJJ1mD
X-Received: by 2002:a05:6214:b6c:b0:6d8:8390:15db with SMTP id 6a1803df08f44-6d91e34685cmr28290486d6.6.1733779357972;
        Mon, 09 Dec 2024 13:22:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733779357; cv=none;
        d=google.com; s=arc-20240605;
        b=lgBqk2U5Xww3JhWrhMXFuCDL3awJdxvQdhIpFFSolzJdtU9HqKAHAxAOGy7RhS5drS
         uGBIAZKQBsM3ynW3IpIqA4FT5Qs7o0PsVGtv65mCzuVgIKCpYB2wYIjtUNc6fE8oT9j2
         nKrc9CVKJEoMKaVetCGmOsOGm3Lc+Ar1avZ2OyXDMeYBw60Z3wNKV8NLPHZw5Sq1gMZV
         IdII99oLwBAXDJfFN0DEaCSvS/vfKG0+gnD88uHrZor5el5fdkplFDY6ZJiu1A9jeDvT
         EkHPQAQtRcXoUTc3Tyj23Ol2JCJ3xLJOtqKn5Mg4BfKV/A3Lr+rV0vcyNQcx1Z2UtjIF
         KShA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=cR4DdMc/TwvrY+t0EgVMm3YLHZbFJEHU46vDw3/T3S4=;
        fh=3d3l/tsw+NqSP5NdfQDVxXNrcsouaTG+KJd7iVlcC0Q=;
        b=dePrT5dvmIcFJ2TeM6U9kXYfYVxSoSR+nMa/IZ4Vu3/+8SDy+jV2aLRH0ajLsHngUT
         tKojUe5cYtQ6wBLSZ2xWKc2iyb1Z1dXfmifKnuC2RFDy/Pk62E5YZiWHYJyeAtZnr58A
         7EbcD8q3afDXdjK3uXj8Wq8kdw/w5QtyonHdtuAW6Bre5vw5QiRpzzjtgqzbS4WF6Q9n
         9vYyqXbnnn6+6TXvcBvPa2SZe0wzBZLqK2cA7gy6QpKlrI0XnkyssFIouePYzFGVvmy/
         DCCPDD5p6YK7gVN78TFLZGq1l7bvVvri2bqKcRiihLaaBLWeC3i1uOj4w3GwkbgAo2+3
         2d6A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bJcA43XO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d9167d5735si28006666d6.528.2024.12.09.13.22.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Dec 2024 13:22:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bJcA43XO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tKlCj-0001vD-IV; Mon, 09 Dec 2024 16:22:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tKlCf-0001up-Oq
 for qemu-arm@nongnu.org; Mon, 09 Dec 2024 16:22:05 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tKlCe-0007ii-9A
 for qemu-arm@nongnu.org; Mon, 09 Dec 2024 16:22:05 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-434a766b475so47130105e9.1
 for <qemu-arm@nongnu.org>; Mon, 09 Dec 2024 13:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733779322; x=1734384122; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cR4DdMc/TwvrY+t0EgVMm3YLHZbFJEHU46vDw3/T3S4=;
 b=bJcA43XOxS/oTBJSM9aw4NVFCpGliWD/q1ZzptDiQfMVnhbQEsS4U85K+J90i5yyXN
 XcgVXR3I75yx6KNbgfYqrSaIoe4rGygegQwOVedbXQIGpTHxq3XmH/qDbvTd7kH43iVn
 nheLDoTiHWW2kuygVMZHtwczR3k7JJvi8m3w1Ogev6dsqWIcVIBHRz3BUCqdGF2SCSXJ
 wPmoVmsxAZ0S8NA+ESjaj3q9GJ72LErzM+XT5M4MS/WgVwTyC6Hg1PVC2wi42YghkLQy
 4kn4/+B81L8qetHnMB8pNGXpra8w6K+CaLC2jAbGirWx2yGc4BxZ4fPqD90lIc8ZtPpI
 Mnkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733779322; x=1734384122;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cR4DdMc/TwvrY+t0EgVMm3YLHZbFJEHU46vDw3/T3S4=;
 b=UaTev05Uf44U2pljtGqZ3Qa/UlFksTe8KlVjeET+DOG7h6evAgYptqdJJ/3G6N3dqu
 bgAhw5mSWhPUV8m3yb2hm79IezDg7/jOBVeXdsrqEfCmcqHzW5loMZaqD4DIfls8mM36
 2UT0UMA69n7gKJRF3grIoVqd26JW2tLXk6MvMA91QKPKCGoswf0+Lni99rYD1Ig0x2vz
 SruK13c6osA3IKwLGYtVkQ5pMCqC43O9jeh/tE5LYYtv6kBQK2bPxNKADRY2j4jOfemV
 YN3ertE73FsntlTBInBBzKk4AUi7BwSa8ZuATwxLEOW2752RJMXYTwkBp/V2hdwFSjNA
 U2Cg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5Kx4N20blJg7x+iwfS9KXaxwZCXRGVhWUMNdZMt7FTnxu5YEiiPjj3E2aKnxZ+G6u4ClBro9LXw==@nongnu.org
X-Gm-Message-State: AOJu0Yw7Tw5OEBHXL2V666zJZhPnwW22Wg0t8fHva5zZrzJ23xz8r5OA
 M5HFw9KcftTChYzrggRacXHpi1mNSwjluPbCGmsqw7dJFDa0TPXS36769Lokgko=
X-Gm-Gg: ASbGnctJbvL+IHKSZqcMM2bileNgKScLeLzN+zjJQkLGbuhnZCRVi1M+cXACrGdDoZG
 EF+LsEwfb4xuKLzNNuY5V4WKp5u+EPVNlBUrdL/3aRS9ROWP8nLoen990/uVklB7Q1dwKNM262f
 Y8+25ewD1VvtZKQOTiqMDj2G0XA7aTOx1jpv4PT9S8JFlYht6deHYxfQwmsmdKEf/efnu2Q9MVA
 riWm/DbwcZJgtDDqxk6R+HSqaGlnzAzhsGvvM4RSM/QTP9rrHNvlNP+madviEHOnANc7BYMfPq0
 //7ykazefU3XJHgr/HpGdPxtZPABwAnU
X-Received: by 2002:a05:6000:2ad:b0:386:4034:f9a4 with SMTP id
 ffacd0b85a97d-386453fbbbdmr1289281f8f.43.1733779322084; 
 Mon, 09 Dec 2024 13:22:02 -0800 (PST)
Received: from [192.168.1.17] (lfbn-bay-1-170-196.w83-193.abo.wanadoo.fr.
 [83.193.250.196]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-386220b071dsm13951354f8f.101.2024.12.09.13.22.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Dec 2024 13:22:01 -0800 (PST)
Message-ID: <c401b320-b382-4887-82bc-0252dd9f8c98@linaro.org>
Date: Mon, 9 Dec 2024 22:22:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/11] i386/hvf: Don't send signal to thread when kicking
To: phil@philjordan.eu, qemu-devel@nongnu.org
Cc: Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <rbolshakov@ddn.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
References: <20241209203629.74436-1-phil@philjordan.eu>
 <20241209203629.74436-4-phil@philjordan.eu>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241209203629.74436-4-phil@philjordan.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: B5uq8DXLUDtJ

On 9/12/24 21:36, phil@philjordan.eu wrote:
> From: Phil Dennis-Jordan <phil@philjordan.eu>
> 
> This seems to be entirely superfluous and is costly enough to show up in

So the pthread_kill(cpu->thread, SIG_IPI) is entirely superfluous?

> profiling. hv_vcpu_interrupt() has been demonstrated to very reliably
> cause VM exits - even if the target vCPU isn't even running, it will
> immediately exit on entry.
> 
> Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
> ---
>   target/i386/hvf/hvf.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
> index 3b6ee79fb2..936c31dbdd 100644
> --- a/target/i386/hvf/hvf.c
> +++ b/target/i386/hvf/hvf.c
> @@ -214,7 +214,7 @@ static inline bool apic_bus_freq_is_known(CPUX86State *env)
>   
>   void hvf_kick_vcpu_thread(CPUState *cpu)
>   {
> -    cpus_kick_thread(cpu);
> +    cpu->thread_kicked = true;
>       hv_vcpu_interrupt(&cpu->accel->fd, 1);
>   }
>   

