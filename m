Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp709278lfy;
        Fri, 14 Aug 2020 12:15:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyKPH1F+Ob2YOiddFPR2w7kqrnDIEWQAe5bRNTG4IBxn/Os5hJGQkkmyfXgpmAjjAoT5AOr
X-Received: by 2002:a25:2a58:: with SMTP id q85mr5828354ybq.518.1597432547289;
        Fri, 14 Aug 2020 12:15:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597432547; cv=none;
        d=google.com; s=arc-20160816;
        b=pQ0KT8906qzKsaCV0S6ZurWAdIf7+v3KKOjsneXFgU22SdybGqRRqdLmjEYEKM8Wao
         mysbw/T5AbnYzuMP9VWiV1eKdtdA39i/z4ibb6YyWRvnOK1e06GPZUUhxV5fBIApltPr
         jirmlhQqI25YekwHWAkatP9XI2Nu7E0VoH2V5mhuwbU8lTvk43X4T0YZbWA5k86bqueb
         gmtpEBF8we+kBkgt6p9BinxeObuFQcIXH8ZYd+nixo0QhHG8pXfgBgloVxg3RZOvP0H3
         wh6zSerFPOpMJfnaNUnzXShMVQMC3qTFZ9PLum0bJ9tEXbdRcNh95AOaZXDv0i/kp3Mh
         CrBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=VPevZZZSNzJI3RXDIboWLUgP7dDJqhDDw2za3RM3Et0=;
        b=AE1smpU7UV5WFh0FVOMOht0pYXAPXIWBz8F7QFmXZDEqAD79DTROWuEwVTmMZSLrRC
         ZoFotIsxUiSxDKwE39v3bhsNapcYsOAPaEKci86CEe7jyr3WnOCwB87oh8N9tVgrNrbN
         0pEWqYtPI9f7H7LC7+qFNHudD3kH6WlpVjXt0SdJmXbkakYutstl73ZKVzlFuLsvlxgv
         Xs3uEtPv1etY7EKgUlQqYrhcHfa9IBtax3OtGfKUImwANvGMOlEJJ0cz4s+XLsfpi4/m
         WdII27A+K2Ez7EGROtpbLB88z1WM0SbJAenHBgalqP/aGz0OHDpe/40u2hqef16jWuZf
         5hVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wwaj9NIm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c186si9082535yba.330.2020.08.14.12.15.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Aug 2020 12:15:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wwaj9NIm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k6fB4-0007qY-Lj
	for alex.bennee@linaro.org; Fri, 14 Aug 2020 15:15:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k6fAv-0007nO-0V
 for qemu-arm@nongnu.org; Fri, 14 Aug 2020 15:15:37 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:43758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k6fAr-0003Zs-PP
 for qemu-arm@nongnu.org; Fri, 14 Aug 2020 15:15:36 -0400
Received: by mail-pf1-x443.google.com with SMTP id y206so4999860pfb.10
 for <qemu-arm@nongnu.org>; Fri, 14 Aug 2020 12:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VPevZZZSNzJI3RXDIboWLUgP7dDJqhDDw2za3RM3Et0=;
 b=wwaj9NImhBeBZyp3CKoz6Fznw3zHjiwjna7r8hPQuVA6RMhRMChDQ50dTqXUoj/Dj6
 Kz5uRgAURVi/1Li3lTfy98tIyTqitKeXTuA7627HqQgccPh/p5AjUjiU5XwS7TCuJx/J
 vsawYCexBkeZJN7ET1Pj1SIE8jnu7M6s+hI+PwFXnyav6QZEDYsa9cG4TFI0mLtTYMUX
 3HPDn7YYkPnvKLCJRM+i55URRy4lLbe3G9rvYUaGlQc+3YENDnYIl6DBiksZn2me/aYS
 hWm48uga5o+h7JFCfz2yRAoMJZ4aG8qbh4Zjm18VWRXeCftIzvRcoZVIzGqSWLBzkIT5
 fMKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VPevZZZSNzJI3RXDIboWLUgP7dDJqhDDw2za3RM3Et0=;
 b=plufSf/PpDoi0Bev0EW8VMGQ5tL9nivIjn8JFCTQOaw2n4PybvT9IjMTe7WReEifZT
 XXom/gLK2srs+7HfFuZnBVvlL/xHqawsl1Jm9mClfXWUZMtlls3pJHPVRzcEu56tBUnX
 zTPWS802LXT/w9xmmhp2hpcqT02riNI9GolB45zDYd6JcdC9MXp0PAGKfPoFNogfFDzl
 cS0lE2p2d8KpDyOzwgU8AT1vvJ/w3uJpA5/Xs4/KXl5dVabZyuJ+0fxrFuik9+gHwsGm
 PCdNm+IcHCreLhpqHL8pSmBMIecLMc5IkpeRYyXSnHBnfC3Qn8LY3qbrkpZy5XPExl3m
 pGWg==
X-Gm-Message-State: AOAM533PpfuEmw6dfgPv/gwdm3NTngd0TyHiDxAvB2q0vHNCC34QUhSs
 n+C/jhaiLiapJfBM93eBBNo13Q==
X-Received: by 2002:a05:6a00:1344:: with SMTP id
 k4mr2710398pfu.131.1597432532122; 
 Fri, 14 Aug 2020 12:15:32 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id k125sm9198339pga.48.2020.08.14.12.15.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2020 12:15:31 -0700 (PDT)
Subject: Re: [PATCH 3/7] target/arm/cpu: spe: Add an option to turn on/off
 vSPE support
To: Haibo Xu <haibo.xu@linaro.org>, peter.maydell@linaro.org
References: <cover.1596768588.git.haibo.xu@linaro.org>
 <c4ab709b684bf6505a9721163564d2223d06c49d.1596768588.git.haibo.xu@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9fc812e2-a401-0f5d-b96a-0cce9c405aca@linaro.org>
Date: Fri, 14 Aug 2020 12:15:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <c4ab709b684bf6505a9721163564d2223d06c49d.1596768588.git.haibo.xu@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: drjones@redhat.com, qemu-arm@nongnu.org, philmd@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3QXbonYgfejX

On 8/7/20 1:10 AM, Haibo Xu wrote:
> +static void arm_set_spe(Object *obj, bool value, Error **errp)
> +{
> +    ARMCPU *cpu = ARM_CPU(obj);
> +
> +    if (value) {
> +        if (kvm_enabled() && !kvm_arm_spe_supported()) {
> +            error_setg(errp, "'spe' feature not supported by KVM on this host");
> +            return;
> +        }
> +        set_feature(&cpu->env, ARM_FEATURE_SPE);
> +    } else {
> +        unset_feature(&cpu->env, ARM_FEATURE_SPE);
> +    }
> +    cpu->has_spe = value;
> +}

I think you want to simply set cpu->has_spe here, and leave the adjustment of
ID_AA64DFR0 to a finalize routine.  Because there are multiple values that
PMSVer can take.

Once the get/set routines are only setting a flag on ARMCPU, you can use a
simpler property interface:

static Property arm_cpu_spe_property =
    DEFINE_PROP_BOOL("spe", ARMCPU, has_spe, true);

qdev_property_add_static(DEVICE(obj), &arm_cpu_spe_property);

The finalize routine would be called from arm_cpu_finalize_features(), much
like the existing arm_cpu_sve_finalize().

Since you're only registering the spe property when the selected cpu supports
spe, the finalize routine only needs to set PMSVer to 0 to turn it off,
preserving the initial enabled value of 1 or 2.


r~
