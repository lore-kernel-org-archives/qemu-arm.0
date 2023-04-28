Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp180406ejm;
        Fri, 28 Apr 2023 15:41:24 -0700 (PDT)
X-Received: by 2002:a5d:4008:0:b0:301:3179:f94 with SMTP id n8-20020a5d4008000000b0030131790f94mr4689150wrp.5.1682721684019;
        Fri, 28 Apr 2023 15:41:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682721684; cv=none;
        d=google.com; s=arc-20160816;
        b=E2gZvu3dp0+t85SV8D8XKFVRmUQ9ESQMlKiTOJLL+DQcC9wlzK5cDRf0vUsBhYsseD
         AE4WYu5zow0CSvPSesYUIQab3/auuOBDWSVHtDs5M4vdxxiggFhs12KDDFc3UHrjcnqg
         9N+GfXp0AL5oHOjFACYzZr20qrF2NPnqBkbTRpEmIm57LSIgbtWKtBwMS3V4Y28cby0K
         ZzQxaXFhmW0OEYJkzLjkFKgdrFCr0CWOJ+hqCveeYxp3P3P6vxsD3xY5QBXBvVoC84dV
         8qNHG2l9bP3zZzLVDrHbtOjO9VuzHYkaVZr/VLthMGeVrliC+4yqh64UJ4dxP2R/hqEp
         xcvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=0cuvsEbBhCtuQzbt1hUViFpMfr807snK5BPN0pHj8nk=;
        b=GLu33XfTRMlW2+isefeH3Annort+Er7IUDITso084lUTLMBwrbbQ5Ubpaq9E6NyDy8
         ApxkhxBCdMDCVt17/hWb72C5Av/Rpe3OoNfP43F7a+oQfugZovJDri4hXmLF6i1qNYgH
         p4D5nKBUaG4RYXZUiSH3vhDyiNvYI8Qgs/mma5rAGiM5kshv3JXlw+Abc0SOelP19rGj
         /jFw6/D38HwhNl0LRBgwZvkZpx/OAtl9vV7ThfxTaNeK2eK3YQWOBfFa5/XrKYEZ4p14
         HLdrs4ldRCpA976q5lNPHlcGCL41t57qx73t/LdPwczFsopktScIpolvroglXAJCIc6l
         bjFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Dpb24JZj;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e15-20020adfe38f000000b00304aba33971sor2570083wrm.95.2023.04.28.15.41.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 28 Apr 2023 15:41:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Dpb24JZj;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682721683; x=1685313683;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0cuvsEbBhCtuQzbt1hUViFpMfr807snK5BPN0pHj8nk=;
        b=Dpb24JZjNfF/BBFERkAAmCteJ+a4xGF8bpRWFODOs+TwSLuV3e1f2x1sS+5QpnK/d+
         JIfAcr45f6QVaA6dxbmX67CSSl3iFCybIr1zBQ77H2aBbdJxXAh7B0r9wSfYs/RrqdM6
         XXOkXslemMdv+Xcia9bFz4sgqSTbyf08UYAgETEPCpJDjPuzPl5sS/UG+5qEK3N422uS
         ijgjuDvJeh9fJkkXFhTMJfhkc0hWoEfua14jAMgQkyRlk0Ax5Ak7e14nP3GhG2jgy1yd
         8s2bLBWzZzN8klGtpd9Fhp9tmPZUngmnpJ4dvrfG22itG4gFU7iYF8MQBqfJmtWQbBcL
         vH2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682721683; x=1685313683;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0cuvsEbBhCtuQzbt1hUViFpMfr807snK5BPN0pHj8nk=;
        b=hY5z80/RVSXJ7Ke+eexaxnnt3m/tKdcC9hcTObO9nCsLaYfeJ6h6es0U3FI+JqmFb5
         bWWUQNCqqYZloUE/M7VO93nKMtNiY0O3Gt5uLWE/pLpcVczeRq6xpTjbQLqSlAC6+72z
         v7OAdIY9qyD0FnBBo1A8sk2ejNKD1tbNpSczKmc5fnGRlm09NjOZCRt8W1L+J65ii/ya
         4GKVGIjBHQwXOHcvb8bKzy37eiNScUkKGrF481Cv3YmcyntEC7RvEqVit3zDcIGXkkwE
         uifY7bZ9Uaeav+ryQ2tk2n2ZPvtWnuDDGUHH1na2jtHgi4YxnkDv7LOhB/XstIxTVSYD
         VQiQ==
X-Gm-Message-State: AC+VfDzS3UfUO/l0W0Bd+5U9SRVWm0LegPZ/zEvf/vEDtXcKPD4gKsg1
	RyzqKn2idR75IcYh4LB06F6+0KAy
X-Google-Smtp-Source: ACHHUZ6CBXLQ5gCKt2seqdiKXKMVQKpM3dyIKRg7+KjCHZbPYn5VcaDPJ7EtiQQUy6Q+kqkjAcgDtw==
X-Received: by 2002:a5d:544e:0:b0:2f5:c57c:192f with SMTP id w14-20020a5d544e000000b002f5c57c192fmr5346414wrv.68.1682721683677;
        Fri, 28 Apr 2023 15:41:23 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.192.175] (47.red-88-28-19.dynamicip.rima-tde.net. [88.28.19.47])
        by smtp.gmail.com with ESMTPSA id c13-20020adfe70d000000b002fbaef32231sm22057901wrm.22.2023.04.28.15.41.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Apr 2023 15:41:23 -0700 (PDT)
Message-ID: <2acdf22e-52d8-64c2-a41e-b55dc30dab17@linaro.org>
Date: Fri, 28 Apr 2023 23:41:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v11 01/13] target/arm: Move cortex sysregs into a separate
 file
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
References: <20230426180013.14814-1-farosas@suse.de>
 <20230426180013.14814-2-farosas@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230426180013.14814-2-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: C7xJsXnfsNa3

On 26/4/23 20:00, Fabiano Rosas wrote:
> The file cpu_tcg.c is about to be moved into the tcg/ directory, so
> move the register definitions into a new file.
> 
> Also move the function declaration to the more appropriate cpregs.h.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   target/arm/cortex-regs.c | 69 ++++++++++++++++++++++++++++++++++++++++

Worth renaming explicitly as cortex-a_regs.c?

Otherwise,

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

>   target/arm/cpregs.h      |  6 ++++
>   target/arm/cpu64.c       |  1 +
>   target/arm/cpu_tcg.c     | 59 ----------------------------------
>   target/arm/internals.h   |  6 ----
>   target/arm/meson.build   |  1 +
>   6 files changed, 77 insertions(+), 65 deletions(-)
>   create mode 100644 target/arm/cortex-regs.c
