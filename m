Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp666348ejc;
        Thu, 10 Aug 2023 06:17:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYYduJztIw1yMSr9PniAQfyDQRXqxQer57lQlt1HZl71kZWVV6Crk/D0fiIzn/nW/dybeP
X-Received: by 2002:a1f:41d6:0:b0:486:53f4:12ec with SMTP id o205-20020a1f41d6000000b0048653f412ecmr1395962vka.8.1691673437906;
        Thu, 10 Aug 2023 06:17:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691673437; cv=none;
        d=google.com; s=arc-20160816;
        b=uEheTSALQ/3/+iuALrM58eu1X8fsl4znJFTNI8NEpWi8Z9THjiknrdEmcrWzYM3GjF
         mncMNgvQQr4Cn2ZaLZp1Gdk48LKs73gdWJFKKKG5Z4mutF6w5fskW73m9Q4VNm3n/rBO
         ThCk4RDv699IugtBCB3ZXM61VarF9v8UpxIDbmTnseDISAIqkoKp0zEKxYY78dVJ+JAb
         keKFYe86XRnoLRH+Wxlhog7Ob335f9nbg1/ukYEiSm2t6ximbqf9J6II4VTdcbOy8Yft
         zxxgh9BCP4JL4ExfSFLWAJCNGVArgPQlPEBHojjLknKaRgY77HPwxb1bK16OQDRxFnZV
         gccw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=XvznmDeo1oK14c9Q6GLwEOoHv2gSi+p2PJZSwYjMG3M=;
        fh=CEa3UdY0L+UQ/2T/5R8rkDkdq4jlW1F1hWJjDNQD42w=;
        b=vvrJOW7AwWAjMo9IkQD9l0OludsPMHCDh2XfzZKWEdrPiG5raEoLw8+YoyGm+4khYC
         l0d9oDdDBEJxXc3oulfV2fMd96vcqK7+RpV2vpLycioJjHKFKY4fG/BwQd3EXb+7Z6ve
         8pFo1uc+XSIukOyCRYjaIC5eYCIX94kCYeXFgYQ6SkrPLnCrALlKb1n1ZbWsXjRumzjh
         T+jTuvKXFrgFfa3Z/aG/YdJKVRXsVNwKxhc5ZmHDcZ/EKQccX5RnNybb1nbnHR2R6VLJ
         xz8VrHkdqpHGhGB+lu6GTyb1fI4F8FVEh1mhNGNh8xrdb//td5/lNM3PXHkXYWO37SGy
         VKWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nnR84Gmh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f145-20020a1f1f97000000b00486cec0290fsi110242vkf.170.2023.08.10.06.17.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Aug 2023 06:17:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nnR84Gmh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qU5XM-0003Ls-Kg; Thu, 10 Aug 2023 09:17:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qU5XL-0003LZ-6w
 for qemu-arm@nongnu.org; Thu, 10 Aug 2023 09:17:11 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qU5XJ-0007Hf-Ab
 for qemu-arm@nongnu.org; Thu, 10 Aug 2023 09:17:10 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-51cff235226so1913779a12.0
 for <qemu-arm@nongnu.org>; Thu, 10 Aug 2023 06:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691673427; x=1692278227;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XvznmDeo1oK14c9Q6GLwEOoHv2gSi+p2PJZSwYjMG3M=;
 b=nnR84GmhTb05gN8QkrFnD3XJzIblingTgWVOf0ps6C/SytLNl4Rnf7mrUDObUQQV2d
 2473t34WiIvcF9JsDFNkmE7Ztvaig1h3r+G9nVmO6FC/EWDoGnV0EoKwEFC5C4QeAL7V
 OkmAV42RDn8TUHzxB8sAtd+lYRqxj/YCeEjs2bbrDGoC8A/RCLLULa62sf6gYT41gmes
 RzCTygRiLlErHaQQpeKQjZHSYIN2Ip+oxNC943lDPqed0tRv3GkEB81GaHL3Whc/wcZY
 mgcfZXjEUnar08mqFyyaXKF7WhdV1yur5En3R52u7Q5PaIRsVjuFchsD8dEsCY5AgjLe
 Emhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691673427; x=1692278227;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XvznmDeo1oK14c9Q6GLwEOoHv2gSi+p2PJZSwYjMG3M=;
 b=LH/yWZDAPJhdr8glJvg9ANwQBuMlwQG9qiZQzUO4nVepXfXXlgi01/F0iJdP7iZB56
 KOCr0A9ygmoeG5FIqFbpkWRT2B39pvih5eIw8al2Qo6QTy7JhK6roIYPsfNCtZi7AeoH
 Lvi9jUlerV2qPdtUhHr2TgTXqHSFD19y1kTT1dO7EFuwpHSA/qp916MJguferCjMIXRI
 VrEQ0QLyjNdj4kLlX4LEqMmsritITv1SDOfQC+XDWeQWlpMztrQat2tKH6f2nGCQz6Mu
 7IDq7gWRUfC7CZ9t+k9TFglmE06pLNiKqCjjpSazTWVinm3kEwFmTDwA5aLfvajBMlap
 kClA==
X-Gm-Message-State: AOJu0YzSQAmVQWv9yLreMRwxXEWpqTx1DAEhcM34Zqu+DSyR4PeRU3b5
 2qSGAbU/a/Vndi3zeGMps4S8Z/fIDIBU579Vg5PEjw==
X-Received: by 2002:a05:6402:1ac9:b0:523:e25:5656 with SMTP id
 ba9-20020a0564021ac900b005230e255656mr2517110edb.5.1691673427593; Thu, 10 Aug
 2023 06:17:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230809123706.1842548-1-jean-philippe@linaro.org>
In-Reply-To: <20230809123706.1842548-1-jean-philippe@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Aug 2023 14:16:56 +0100
Message-ID: <CAFEAcA8wh35V4ivo2cMP6zUGgCDi6t9-AHS0FVfeLThvjHtV9A@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] target/arm: Fixes for RME
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
X-TUID: Q9pRnMxW6vJj

On Wed, 9 Aug 2023 at 13:37, Jean-Philippe Brucker
<jean-philippe@linaro.org> wrote:
>
> A few patches to fix RME support and allow booting a realm guest, based
> on "[PATCH v2 00/15] target/arm/ptw: Cleanups and a few bugfixes"
> https://lore.kernel.org/all/20230807141514.19075-1-peter.maydell@linaro.org/
>
> Since v2:
>
> * Updated the comment in patch 5. I also removed the check for FEAT_RME,
>   because as pointed out in "target/arm: Catch illegal-exception-return
>   from EL3 with bad NSE/NS", the SCR_NSE bit can only be set with
>   FEAT_RME enabled. Because of this additional change, I didn't add the
>   Reviewed-by.
>
> * Added an EL-change hook to patch 6, to update the timer IRQ
>   when changing the security state. I was wondering whether the
>   el_change function should filter security state changes, since we only
>   need to update IRQ state when switching between Root and
>   Secure/NonSecure. But with a small syscall benchmark exercising
>   EL0-EL1 switch with FEAT_RME enabled, I couldn't see any difference
>   with and without the el_change hook, so I kept it simple.
>
> * Also added the .raw_write callback for CNTHCTL_EL2.
>
> v2: https://lore.kernel.org/all/20230802170157.401491-1-jean-philippe@linaro.org/

This didn't build for the linux-user targets. I squashed
this into patch 6:

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 7df1f7600b1..d906d2b1caa 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2169,9 +2169,11 @@ static void arm_cpu_realizefn(DeviceState *dev,
Error **errp)
         set_feature(env, ARM_FEATURE_VBAR);
     }

-    if (cpu_isar_feature(aa64_rme, cpu)) {
+#ifndef CONFIG_USER_ONLY
+    if (tcg_enabled() && cpu_isar_feature(aa64_rme, cpu)) {
         arm_register_el_change_hook(cpu, &gt_rme_post_el_change, 0);
     }
+#endif

     register_cp_regs_for_features(cpu);
     arm_cpu_register_gdb_regs_for_features(cpu);

With that, I've applied the series to target-arm-for-8.2.

thanks
-- PMM
