Received: by 2002:a17:906:fc12:b0:98d:b2f5:1316 with SMTP id ov18csp2904837ejb;
        Tue, 1 Aug 2023 07:23:13 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEgh7aTLEAmgC11zDZswDzOfVN5LBmnKeZ3QbLgefpB3shAZoOTVm6NkcMqOgqS/wjT31/9
X-Received: by 2002:ac8:5a15:0:b0:401:e2b1:d28d with SMTP id n21-20020ac85a15000000b00401e2b1d28dmr15642114qta.20.1690899793237;
        Tue, 01 Aug 2023 07:23:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690899793; cv=none;
        d=google.com; s=arc-20160816;
        b=BXd3R3PBCEAnR5nH6QkGsWb7STb/WaihozIBE2hdtqnS1GrBJ+McKEvC2pg8gUy6dd
         xtKCmTPNtJKURralU1l+4Hvdys4jKKhEvwbjZMeGLB4+kvd0I5ucjBs2zMZ1fkm5y8pE
         iScGZIsKxvbnlozjBSIL1KquR3kW5H0/Hk5fvkxPkOhJQo0RfdoQyoYDp00SGsKoz4JK
         AVJJKx7K/QwR1RmPiPsMWXZ+kEEK457DOUIl2GAXVCwjAO1gBlKxGFAiBZDrPlUnqKom
         fWNa7vMo3MJdW+FGMnM4MG3eTL98yvv2S5XQZRFC8i59dhC72O55gkCV9OPgOau/QrfX
         Ylag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Q+kuX/EChX1xOdMZ2LS/4H20RD3DMHGuUOy1vmhdta0=;
        fh=jI2hgQY1g0wvMyxw33p9cbh4a/lNgpBuc7/Fp8cj8eI=;
        b=H9pJIBmioXqEF80AFTG9yn/ZG2cb5OyE5rUCvFMG/jFTG3EPpbSfQLkfgBw7uEsgog
         KJLfAY7+vqIaME6LclpAeLEt5bNp1x4eVQ4yaAcIKKuh5Hpx4sH7GdnOriEHF9zmpe/t
         p5o3vAuf129LnLR6T5SvAyhvhkGjWc/K90XqgShrVc93dsFaYo9fDiKGiDJ+ylubDlJM
         w+VbxKSpV7IfkWruARZirdDS9mR4wwSRBVrgqpbaIfTBzb6DdQXsYrvZo3hOEVXvOW+5
         e3sOQCb3Ya6gRn1r+9neZSSjlIjlqTBjrMw0mCDAe0S7AOE2VEC7tQdHuAdXSFiTMCrD
         QwEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZCEtL9l0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q14-20020a05622a04ce00b004033859d205si3949617qtx.167.2023.08.01.07.23.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Aug 2023 07:23:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZCEtL9l0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qQqGt-0005qc-OZ; Tue, 01 Aug 2023 10:22:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qQqGs-0005q5-2S
 for qemu-arm@nongnu.org; Tue, 01 Aug 2023 10:22:46 -0400
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qQqGq-0004ta-Gk
 for qemu-arm@nongnu.org; Tue, 01 Aug 2023 10:22:45 -0400
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4fe3678010eso3586776e87.3
 for <qemu-arm@nongnu.org>; Tue, 01 Aug 2023 07:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690899763; x=1691504563;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Q+kuX/EChX1xOdMZ2LS/4H20RD3DMHGuUOy1vmhdta0=;
 b=ZCEtL9l05AhGAU4KzxDAFuV7yifKF+sSoMYAm1qMrK8d939RFv96GZey6Lp8Don+vp
 nXyL1wfVAiakUXGy+5vucAeA9Ty8oJQ3i3tucsHv86ZrdMsk0f99m/rY3Ox4qdt/kMkr
 vgV0XCZ0TxGLOpa1WxKNIRt4XRb4N8ZINMOilSaJDRIBnEDBVrfnJFAjW3HjSlno2Vg2
 i2H2TjEHLkK24MAGPjl9+/6hwrRkM1K8u97dC5/wqqrFMnOEiLNa2M6RZbIIJIaSwRgj
 VRmskaDojB1LqcNMk4Z7M1ov8LERxQAur6n2RLl2vqnTTo5FCGIGFBT6M4DF8MJXiXB+
 lSKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690899763; x=1691504563;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q+kuX/EChX1xOdMZ2LS/4H20RD3DMHGuUOy1vmhdta0=;
 b=T+Ju7c5gdbUrEVSSJAyTli5k8ZgbxYcXHneCNRAtSofn036EKmVMDj76J3RI+FnZYz
 ICA10F9Ptwu3OE89ktyiORPmWznKHWaUNGuFInosEVwEAYfKiLMz7ieJMRINdw6gH4PN
 KPSTIHqQ5Y95WspliALdgAMRJ+3/UCs4dlTElAV9oE88hzME599PvUqtsrTSHnKo4gvs
 rfROR8SrTZgm/mjf7PWHPL7+45a1j7O4HlV0oEgBNizDisBbv1pzen/j/e38Wjw/LGhs
 HEvXnV4VcF3rASMQcykTsadbVzJkQsZpa2wW9PhATjCAqOQ6aYE/vF6wYzvdvGuis5MR
 uLeg==
X-Gm-Message-State: ABy/qLaVxah0CJm6BQFvYmnO7Bc/XzXM2pYsiDbkVGW/EodnRv9nkxul
 fP478lwY8bISE+MlMBYmfYbGafa+MMAGw3ardUFavg==
X-Received: by 2002:ac2:47ea:0:b0:4fe:3a2f:681 with SMTP id
 b10-20020ac247ea000000b004fe3a2f0681mr1873949lfp.23.1690899762628; Tue, 01
 Aug 2023 07:22:42 -0700 (PDT)
MIME-Version: 1.0
References: <ZMkPRJ3subSuW+Rg@p100>
In-Reply-To: <ZMkPRJ3subSuW+Rg@p100>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Aug 2023 15:22:31 +0100
Message-ID: <CAFEAcA8cEp2_vc0i9QMNeb7KkxsJecXjuYhYUR6nkL6-LLyFqw@mail.gmail.com>
Subject: Re: [PATCH] linux-user: Emulate /proc/cpuinfo on aarch64 and arm
To: Helge Deller <deller@gmx.de>
Cc: Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>, 
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x12c.google.com
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
X-TUID: il7N8+SHLqVM

On Tue, 1 Aug 2023 at 14:57, Helge Deller <deller@gmx.de> wrote:
>
> Add emulation for /proc/cpuinfo for arm architecture.
> The output below mimics output as seen on debian porterboxes.


> +#if defined(TARGET_AARCH64) || defined(TARGET_ARM)
> +static int open_cpuinfo(CPUArchState *cpu_env, int fd)
> +{
> +    int i, num_cpus;
> +    const int is64 = TARGET_ABI_BITS == 64;
> +
> +    num_cpus = sysconf(_SC_NPROCESSORS_ONLN);
> +    for (i = 0; i < num_cpus; i++) {
> +        dprintf(fd, "processor\t: %d\n", i);
> +        if (!is64) {
> +            dprintf(fd, "model name\t: ARMv7 Processor rev 2 (v7l)\n");
> +        }
> +        dprintf(fd, "BogoMIPS\t: %d.00\n", is64 ? 100 : 50);
> +        dprintf(fd, "Features\t: %s\n",
> +                is64 ? "fp asimd evtstrm cpuid"
> +                     : "half thumb fastmult vfp edsp thumbee vfpv3 " \
> +                       "tls idiva idivt vfpd32 lpae");
> +        dprintf(fd, "CPU implementer\t: 0x%d\n", is64 ? 50 : 56);
> +        dprintf(fd, "CPU architecture: %d\n",    is64 ? 8 : 7);
> +        dprintf(fd, "CPU variant\t: 0x%d\n",     is64 ? 0 : 2);
> +        dprintf(fd, "CPU part\t: 0x%d\n",        is64 ? 0 : 584);
> +        dprintf(fd, "CPU revision\t: %d\n\n",    is64 ? 1 : 2);

If you want to do this you should hook it up to what the
CPU being emulated actually is and what features it has.
(Compare how we set the hwcaps.)

> +    }
> +    return 0;
> +}

thanks
-- PMM
