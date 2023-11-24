Received: by 2002:a17:906:3fc4:b0:a04:79f0:9a0e with SMTP id k4csp1110742ejj;
        Fri, 24 Nov 2023 04:06:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGljxugJoH6TC7QAEWkOg8L7GqRCOCFBcdgB30R0DyQmJv4relpKe6+bNXGDqwCO2ZkUPng
X-Received: by 2002:a05:6214:4991:b0:671:dac1:c856 with SMTP id pf17-20020a056214499100b00671dac1c856mr3878735qvb.53.1700827570904;
        Fri, 24 Nov 2023 04:06:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700827570; cv=none;
        d=google.com; s=arc-20160816;
        b=VJX1SQCgEgKsmRO9uM7isU4lr1pY49z7OkADbFi6Zf00fnON4coGH95NYnDC5V7B92
         wdqxutC7SdYupej05ym6SAoGeB2MK++WfpMIYnXHtXUWbTtJ7ncq2QiU+DXQ/Z9AKHLy
         Hj2z68uUh36hVr40/ovi0zwHLl4hxyociMBzkyeBYQDYs93kN1ZqwYdGMnWQ4BT0TwN0
         1bAr3k7LBEIf7IHta3mIcckqjwX2pphMY6lZfnYTew65WjoxCtyW5abeOO6GWumcYXZD
         VCd0ekuThNNVr0YfO5VUvNtXa/6UCDoECPsD/pirPlWE4uXmHyV0E/ZVYMijPKYt901t
         EmTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=KBtRS9rXbG5xbiUaGd4Om2KDFww1AXus+neXP9XVFqw=;
        fh=UMlouvVl3Ph4Ne7UvGTvosqVcNxKyKMHDiGsZppDwks=;
        b=N0deAGnFyAwF1bDZn0VG1lZ6TeRQtfv/YYd6DiWSyjmb+ONRDWTrcXIPprNSk4vKIY
         kyuapsxcMnd4BA7QelvR3Gdfi5G4WtChrzRe/FIhOUPpdOk5S5QHlgNtocwCIHrxVoF3
         SX6ZlEGW8bs1xyQZO07qBg3WCw4ISbvAZVdrhM+vFDRts0pG9ykjX0uftFACVhIUknxY
         U6v2BMeG/m501COiWu8/KcHHxAuFIuTrn4gT4OhcIMDYEL+uP5cIyjYkdoNxnBg/4cLB
         h+EwJDYe+i1lQRyMaw0I2IrGjX5+iLDjn6suVShlD18r4xCKVHhKBEtWfgU+FEaSwrM5
         ocig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="kxUahs/N";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s4-20020a05622a1a8400b004236f267ac1si3296473qtc.69.2023.11.24.04.06.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Nov 2023 04:06:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="kxUahs/N";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r6Uwa-0007xB-Nb; Fri, 24 Nov 2023 07:06:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r6UwK-0007lT-Im
 for qemu-arm@nongnu.org; Fri, 24 Nov 2023 07:05:45 -0500
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r6UwH-0008NO-LG
 for qemu-arm@nongnu.org; Fri, 24 Nov 2023 07:05:44 -0500
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2c87adce180so22321821fa.0
 for <qemu-arm@nongnu.org>; Fri, 24 Nov 2023 04:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700827539; x=1701432339; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KBtRS9rXbG5xbiUaGd4Om2KDFww1AXus+neXP9XVFqw=;
 b=kxUahs/NeSx9SWIRnQ7HiRIV12l//Gk+wGsZcBCnnPrCtdxG8vmfBfw4jJrq/g6DYe
 tJ8kS8Ba3ceZOgqp39DgKr8mwNWoG8T0dARaaa/7HwfOiIXlEyszAghz3xcYWlhQzO82
 U2InwPm3WY0txrUXFn5K5PW+T6TP1309XsBq7O168aXB0k3uG9XYRhokbqaJqHCDsJiX
 oT2vCIvvGaOvnx8nP9fsMQjbs0vp3V36A1X2ukPgL4MBo+sN4TsnGBOLn9c7A+6up3vx
 LFObXV6i5/lO4CtDCae3rix3v3zL2YQqzXf6d8zavQQeKRbsurbKdJvjstp5v1bP7swH
 bR9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700827539; x=1701432339;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KBtRS9rXbG5xbiUaGd4Om2KDFww1AXus+neXP9XVFqw=;
 b=O7OXW2FNf4dSulZ7Gvx0gvPMI48Z3pLhAhqhvDzeC1xHcw4DNS55PNrtdqXwKT6JUt
 oTmI79gV2/8K5+LPBIuE95x5G6+iL7k0j/0pP2k8PgdeqEqGkMDyJ0ticVQy6Bv6gmUk
 sI+ultgdCKGzfszoBZHAR8JtPZHY7XyjbX8Iwh+v+v1fFbTyyvjF3Lma13WFAKX7uBs7
 GlGivOiFZOo1ltPrLA/9rEvJPjxLbYDthZiEaHlflSiTvQl4JU88cOi+fiANUDNCOC8i
 s5TELKX6wqDi0uR5it/+4igzVtCMo4PIxZLGVDtYqT0yK03skW0RpHLxZt+bFu1XLukj
 mEOw==
X-Gm-Message-State: AOJu0YzZ6KRYLbHH29l6ie7xADLV+YvC1yLnMrVlf1jI/BXxB4+xhy9/
 VcFXVHqsL5CVjVKIP1sz3tzFnl9nSmQrNfvLWBM=
X-Received: by 2002:a2e:934f:0:b0:2c5:32b:28ea with SMTP id
 m15-20020a2e934f000000b002c5032b28eamr1700773ljh.32.1700827538830; 
 Fri, 24 Nov 2023 04:05:38 -0800 (PST)
Received: from [192.168.69.100] ([176.187.218.17])
 by smtp.gmail.com with ESMTPSA id
 z11-20020a5d4d0b000000b00332cb23ccbdsm4093327wrt.81.2023.11.24.04.05.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Nov 2023 04:05:38 -0800 (PST)
Message-ID: <6cda42c9-b4f2-4f07-b6d8-2a7c12eb7c49@linaro.org>
Date: Fri, 24 Nov 2023 13:05:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-9.0 00/21] target/arm: kvm cleanups
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20231123044219.896776-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231123044219.896776-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::232;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x232.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: QuF+/iMSYrkd

On 23/11/23 05:41, Richard Henderson wrote:
> This is primarily concerned with merging kvm64.c with kvm.c
> and then unexporting everything that is not required outside.
> 
> r~
> 
> Chao Du (1):
>    target/arm: kvm64: remove a redundant KVM_CAP_SET_GUEST_DEBUG probe
> 
> Richard Henderson (20):
>    accel/kvm: Make kvm_has_guest_debug static
>    target/arm/kvm: Merge kvm_arm_init_debug into kvm_arch_init
>    target/arm/kvm: Move kvm_arm_verify_ext_dabt_pending and unexport
>    target/arm/kvm: Move kvm_arm_copy_hw_debug_data and unexport
>    target/arm/kvm: Move kvm_arm_hw_debug_active and unexport
>    target/arm/kvm: Move kvm_arm_handle_debug and unexport
>    target/arm/kvm: Unexport kvm_arm_{get,put}_virtual_time
>    target/arm/kvm: Inline kvm_arm_steal_time_supported
>    target/arm/kvm: Move kvm_arm_get_host_cpu_features and unexport
>    target/arm/kvm: Use a switch for kvm_arm_cpreg_level
>    target/arm/kvm: Move kvm_arm_cpreg_level and unexport
>    target/arm/kvm: Move kvm_arm_reg_syncs_via_cpreg_list and unexport
>    target/arm/kvm: Merge kvm64.c into kvm.c
>    target/arm/kvm: Unexport kvm_arm_vcpu_init
>    target/arm/kvm: Unexport kvm_arm_vcpu_finalize
>    target/arm/kvm: Unexport kvm_arm_init_cpreg_list
>    target/arm/kvm: Init cap_has_inject_serror_esr in kvm_arch_init
>    target/arm/kvm: Unexport kvm_{get,put}_vcpu_events
>    target/arm/kvm: Unexport and tidy kvm_arm_sync_mpstate_to_{kvm,qemu}
>    target/arm/kvm: Unexport kvm_arm_vm_state_change

Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>

