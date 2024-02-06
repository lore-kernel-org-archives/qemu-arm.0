Received: by 2002:a17:906:755:b0:a37:6271:4f3c with SMTP id z21csp2021818ejb;
        Tue, 6 Feb 2024 11:22:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGQN8sayG3Aj6QRMeWljOXHg0HPc7usdsZh1tmzLpQRxIS9rnrFcDCWUmx/WPDvlnhj9nR6
X-Received: by 2002:a05:6870:b28e:b0:219:2d1a:90ab with SMTP id c14-20020a056870b28e00b002192d1a90abmr3578569oao.59.1707247331393;
        Tue, 06 Feb 2024 11:22:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707247331; cv=none;
        d=google.com; s=arc-20160816;
        b=FDCurP/eeudBV3lgr+a05poD8mwN8ebqiRG1PKkUcLWOp1i5DTqoxxmHsYOETggYcN
         EDDj3OJYW+0a6xCbSEmng5/BzpQVtsnQ3fkyaaIXgeCfU5LcoFoRYXcuwjKFVlZgH5c5
         9Hw/+H+msZLOI8ZN3/wDpXItG+ikx4BFq5kqV4jXq0aOWuyaTJoZ9CKp7mhHeTjAajPu
         qKtjjTCIGjeyIcaQ39+QfvMIuYkT2T4T2Row3WaIDfThkxnnpIFBbHJ27SEDO7Q9nfTr
         28FdSsY4cxeN9N/uBtI8tCdRYsjMdjnh+Vdnx9c5V0/NHwd1bysRyTf1HwLLD0mNKEHZ
         x+lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=zeN2GYndT3rYVw9aH89oXBvwvMJv6cZWW3iXWW8pX5k=;
        fh=SW9wcS2BncVnFazT6kK8wsmD3MpTQB2gxVvqScCQue8=;
        b=h02i7ETN0LMlFCXzVEzZ8wn/drB+jGszkGyHVL8fQiHjYEZqCyfPIbnepkY3q4dzAT
         qaxASILQ2yhg8pGqHh9wjMrXI1dl9x3NW1viFeeUY7/6Eoqabr4DCweV7wbWnAQCETrd
         zH0ckZUfXtX1w5nbhx/pFygX0XkYkaB65pLIfUTIVD4qvF8mg+dTBoxvrZYYkXxnq2F3
         ErG5lc4kj1k2EQdyh3K3mkUmdsUgB1vHqxSHlHtpw9Y9o0QOl9UIiHdnfJbko039qu/S
         N2rR5nujN/53XbPhuEdoGJtm8bVeZmhBitUkDrRsBBrpd7ykKA5rAvd/w2nnoVu+r9KZ
         +8WQ==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I9Gksr6W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=0; AJvYcCW/soRylGUG7k5ukmK/3fh3Z5Lu8Ownw46EGQgja4ZZ3HQS60h0A3n9FlnoMOyWbt1bDaG69noj++8rKcAgBa0nt/cqftho
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c16-20020ac87dd0000000b0042c2f438890si2954207qte.718.2024.02.06.11.22.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Feb 2024 11:22:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I9Gksr6W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rXR0s-0007Ze-K5; Tue, 06 Feb 2024 14:21:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rXR0n-0007Z7-JV
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 14:21:42 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rXR0g-0003Hl-Nt
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 14:21:41 -0500
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a3856588ba8so34541066b.1
 for <qemu-arm@nongnu.org>; Tue, 06 Feb 2024 11:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707247292; x=1707852092; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zeN2GYndT3rYVw9aH89oXBvwvMJv6cZWW3iXWW8pX5k=;
 b=I9Gksr6WNeViBH6DLfaHtdo9cTHkwNxSZVW/YrBvxFNGuw4tjGNN2GhC3uj/L//kki
 IOg07JIR8ic8n9vBkuVTYv5LZ9ZACbILfFPHQd++YQZZ9lgwCcKiEYctUnoZQi6QtBtY
 nsZZRWbTygqpvY3RxCnnqDfxX9XGYFueWh+aCoT/3gr6I3sewAaYS0Cg3yH2syyGaB1c
 pkuB8Ag+CBnzWGSyM0nFRFKmhpVWRBJKGP8j88gBtmzVX6PGU35N1f6mE4e2r+j4NOvP
 OOxxmuwnTabKmwY7muXkWPZd2RLbsMaNdGFaSKgS2LBf5bmlQZZJnNgS2aDffen7zDZ1
 I4xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707247292; x=1707852092;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zeN2GYndT3rYVw9aH89oXBvwvMJv6cZWW3iXWW8pX5k=;
 b=XCwcYd6W5FooMYS3vyBLWO9xszQ/9k3q1AHBt5TgPPlfLqBEkPBnka+SbIDuKEUCi3
 dkOHoZp/cWEAbNLMDqQj129G5a/oGZb2BfMDnoGr0P2NPbbMHQuNJwu5DQZRh+Vi9VcE
 F+YPvDJYguxZN9sZA/8p8Vv/doinannuBhibk6vMehxLQkXfJp2rJJc/amP9mlaBogQy
 26AnmcNdI0AtuzY6YvdOaVeXfJQcOG+S3SO6r0PmqJBrL5WXggshMaylDbfPIDGjGkXM
 vIBP66MtbD/c0k5i67bqCtj13kBQx1rWNq7gQAL4l1VBo+ZIU8YNbUXSe2SdShm3xTGv
 t7JA==
X-Gm-Message-State: AOJu0Yy9t+WLbDRbPmU8yiruZOKhV9oMJ/W4CllwXaTELB8mEcK5ZbtJ
 AZEQkejyTml391fu4KnHkHThFtnlk5lU8HWXRfsuCAbYBPuu+Ns20yeKPWCSy8XBaAGR0kQfBAH
 J
X-Received: by 2002:a17:907:7da0:b0:a37:f6aa:99fb with SMTP id
 oz32-20020a1709077da000b00a37f6aa99fbmr3043794ejc.54.1707247291855; 
 Tue, 06 Feb 2024 11:21:31 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCXRoeYGsxyvTzDoG96sZz7AOmTBkrYQxRIiIQcavE58ZpZq+LpjrS39UK4PtOydX8KD3mpHMXs5ROCauu4loig0ZVAiYgbnK6A5yhaQeHbAbbnJ535oMBUlD2Y=
Received: from [192.168.69.100] ([176.176.170.22])
 by smtp.gmail.com with ESMTPSA id
 q11-20020a1709060e4b00b00a36cc8c1bcbsm1468476eji.173.2024.02.06.11.21.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 11:21:31 -0800 (PST)
Message-ID: <30da5b3b-6b4c-4639-b630-c02e1664821c@linaro.org>
Date: Tue, 6 Feb 2024 20:21:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/13] hw/arm/mps3r: Initial skeleton for mps3-an536 board
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240206132931.38376-1-peter.maydell@linaro.org>
 <20240206132931.38376-9-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240206132931.38376-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62c.google.com
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
X-TUID: /p5Pp2ZNqekQ

Hi Peter,

On 6/2/24 14:29, Peter Maydell wrote:
> The AN536 is another FPGA image for the MPS3 development board. Unlike
> the existing FPGA images we already model, this board uses a Cortex-R
> family CPU, and it does not use any equivalent to the M-profile
> "Subsystem for Embedded" SoC-equivalent that we model in hw/arm/armsse.c.
> It's therefore more convenient for us to model it as a completely
> separate C file.
> 
> This commit adds the basic skeleton of the board model, and the
> code to create all the RAM and ROM. We assume that we're probably
> going to want to add more images in future, so use the same
> base class/subclass setup that mps2-tz.c uses, even though at
> the moment there's only a single subclass.
> 
> Following commits will add the CPUs and the peripherals.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   MAINTAINERS                             |   3 +-
>   configs/devices/arm-softmmu/default.mak |   1 +
>   hw/arm/mps3r.c                          | 239 ++++++++++++++++++++++++
>   hw/arm/Kconfig                          |   5 +
>   hw/arm/meson.build                      |   1 +
>   5 files changed, 248 insertions(+), 1 deletion(-)
>   create mode 100644 hw/arm/mps3r.c


> +static MemoryRegion *mr_for_raminfo(MPS3RMachineState *mms,
> +                                    const RAMInfo *raminfo)
> +{
> +    /* Return an initialized MemoryRegion for the RAMInfo. */
> +    MemoryRegion *ram;
> +
> +    if (raminfo->mrindex < 0) {
> +        /* Means this RAMInfo is for QEMU's "system memory" */
> +        MachineState *machine = MACHINE(mms);
> +        assert(!(raminfo->flags & IS_ROM));
> +        return machine->ram;
> +    }
> +
> +    assert(raminfo->mrindex < MPS3R_RAM_MAX);
> +    ram = &mms->ram[raminfo->mrindex];
> +
> +    memory_region_init_ram(ram, NULL, raminfo->name,

You are not using the parent=mms, is that deliberate?
(as in: easier to migrate eventually?)

> +                           raminfo->size, &error_fatal);
> +    if (raminfo->flags & IS_ROM) {
> +        memory_region_set_readonly(ram, true);
> +    }
> +    return ram;
> +}
