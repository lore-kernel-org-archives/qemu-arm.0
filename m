Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp4043364lft;
        Tue, 5 Jul 2022 08:37:28 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vwpoy3LaV6PshBc6LptkGFQPERPeR8uD8LHMC7lCdWgeX5EGdxC5Fhwalxunlo4VMDJTbQ
X-Received: by 2002:ac8:5882:0:b0:31d:3da8:421d with SMTP id t2-20020ac85882000000b0031d3da8421dmr14932221qta.15.1657035447952;
        Tue, 05 Jul 2022 08:37:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657035447; cv=none;
        d=google.com; s=arc-20160816;
        b=XDJ2AzQoZuMyeUqKbv7VZ1HybS03S2fs/fLBsB0ZdHUhA7Z3LDxzoTVJxlyD3ohwFW
         7ASFhQE9OFeEZHIh0++9VbGIEb4J5EvA325C3zoJAHYbj6WdWITgpSySkn2VZ/4v5BEy
         RbbymOQ6hWehEyCB7t6g4dfBVSQx53Y5AKT97/stXlF5QCtjlqLLwx0UcbRVOqNy74Cy
         bwrYw9lEd8T1XIzc7rWuHU8vCsLZjit3WVrXXkAiXrm08sDdkORNJMDIIowEuGr//zP0
         BmXA3znUeiXtH03UN0cKP31IQ8j08bsvuRKxjdNjjxAbyLJ49TrEP9BqY8ulNaiYuwV6
         WHxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=B23Hv/JJ5V7B28rPjE1KNfCck5kfKEAAvzTIBAcZf58=;
        b=CUCobDtHZk3LtJx0zTfEJl8ZBZdZfRlP+7QROTS28Y3ixKxrRF9GTKY0wMkuE55GYZ
         7l3tX6Nv/N5J8PztLnCyN0Clq4+3Z/vwABrKZ3TxHr1WHlafkdbMMxFDBb2uy7THQ43p
         lizCu1gyvnIaMLhlCtpB6UX9LdbGgYGSVU/S2N7ltGkoNARkPjoDvyXkHG0uVOixTdl3
         cbBjv7/VZvn2/n142cnNz9Mn+RNsu5hoChbG58HhdopjuAs7gOExn+MbedbgdfkG18Ui
         gw1alIETy1ljw/VudncPs/5ofg4X1ZAicbdCVJyUGwuIPZjYXCWYAdSHNxaLZ6Q78y+n
         cXdg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iNfJ7S3c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kc24-20020a056214411800b004704587c6c3si1059285qvb.119.2022.07.05.08.37.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Jul 2022 08:37:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iNfJ7S3c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8kcB-0006UT-EO
	for alex.bennee@linaro.org; Tue, 05 Jul 2022 11:37:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8kc1-0006TA-KU
 for qemu-arm@nongnu.org; Tue, 05 Jul 2022 11:37:17 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:34384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8kby-0007eq-RL
 for qemu-arm@nongnu.org; Tue, 05 Jul 2022 11:37:17 -0400
Received: by mail-yb1-xb33.google.com with SMTP id i14so2757854yba.1
 for <qemu-arm@nongnu.org>; Tue, 05 Jul 2022 08:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B23Hv/JJ5V7B28rPjE1KNfCck5kfKEAAvzTIBAcZf58=;
 b=iNfJ7S3cL3ZiCB7LBQnEV1qNkdXw1wyxT2kEpu8f2i0tgYoQphsJxa6CvNYCVEPEOp
 Q68cDQlanL6e8JRCAq6H4abbM1UQeUUK5w2OqNCOxaf7FZWHIMxYY2NXfUUl/6L28Y12
 KJjSeeNOIfnaOXcvPZpnClhzODei6gr5Rcs6/9Q6MGA02Xrnlb5xZxQzpWz5+tNf3T/V
 NCljJniDdxpCpOPg950os6WQf6h8KYNILkrli4zHGFCY2LdHkkJYLQGz4Eeph7f7Vinq
 NxXnasvquq7lKNIf4PBVZPNnztHDOQwKPqySqFJXs4d2R5PzU04DZyP2dT6Gxs3+9lrh
 WnOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B23Hv/JJ5V7B28rPjE1KNfCck5kfKEAAvzTIBAcZf58=;
 b=XsfWdVLZ/XX6BCrb4QJgdIHzsGRSTy79IbLODsF+osIhBmlYEuMPbCv72RXnMDWDmm
 1Muuzx4mQ6ZwNqT4JUsxOfKaMNTiDR4e9xqKBs5VGT6jVrSQ5q8dMbXr03nEDL7g1/tW
 D4rf145hPq0gMUPyBre4rQ6Wl8cz7qXweXcbzB2IOgt94sq3rLxwiF+yzoFARvHdzO3J
 o7rWhgCccmrZY5z0fL4QB0t1XvAezBsL9ZFe9ScuUuPWUSykYBcj2mFq9nJpAsELM2lx
 xfQ38y7TuILdXcb4PWUwgcDMh+2FARmWVNLhcgvy+Vzs+OAf8HlPIEkdcKuE2LvIg+8d
 PSew==
X-Gm-Message-State: AJIora9lzHk0jTFTRz4INBRnYvtKlvb/hE7XKDyl3P9zzHvzi9wNuNId
 0Gf+bp/ulLGSKTiaGknficNUGU+HE/rdqlM808beDw==
X-Received: by 2002:a25:500e:0:b0:66e:4c27:6223 with SMTP id
 e14-20020a25500e000000b0066e4c276223mr11845773ybb.85.1657035433664; Tue, 05
 Jul 2022 08:37:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220630194116.3438513-1-peter.maydell@linaro.org>
 <20220630194116.3438513-6-peter.maydell@linaro.org>
 <d717bccb-09d1-99e5-f15b-fdecb2b224f6@linaro.org>
In-Reply-To: <d717bccb-09d1-99e5-f15b-fdecb2b224f6@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Jul 2022 16:36:35 +0100
Message-ID: <CAFEAcA_5QBpjRH_VGFDG8bYFDduRJ9eew98WpeXXpceuhK6s4Q@mail.gmail.com>
Subject: Re: [PATCH 5/5] target/arm: Correctly implement Feat_DoubleLock
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QcfTTf8m+UXm

On Sat, 2 Jul 2022 at 15:19, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 7/1/22 01:11, Peter Maydell wrote:
> > +static inline bool isar_feature_any_doublelock(const ARMISARegisters *id)
> > +{
> > +    /*
> > +     * We can't just OR together the aa32 and aa64 checks, because
> > +     * if there is no AArch64 support the aa64 function will default
> > +     * to returning true for a zero id_aa64dfr0.
> > +     * We use "is id_aa64pfr0 non-zero" as a proxy for "do we have
> > +     * the AArch64 ID register values in id", because it's always the
> > +     * case that ID_AA64PFR0_EL1.EL0 at least will be non-zero.
> > +     */
> > +    if (id->id_aa64pfr0) {
> > +        return isar_feature_aa64_doublelock(id);
> > +    }
> > +    return isar_feature_aa32_doublelock(id);
> > +}
>
> If you're going to rely on this, you need to clear this register for -cpu aarch64=off.
> It's probably easier to drop this function...
>
> > +static void osdlr_write(CPUARMState *env, const ARMCPRegInfo *ri,
> > +                        uint64_t value)
> > +{
> > +    /*
> > +     * Only defined bit is bit 0 (DLK); if Feat_DoubleLock is not
> > +     * implemented this is RAZ/WI.
> > +     */
> > +    if (cpu_isar_feature(any_doublelock, env_archcpu(env))) {
>
> ... and use
>
>      if (arm_feature(env, ARM_FEATURE_AARCH64)
>          ? cpu_isar_feature(aa64_doublelock, cpu)
>          : cpu_isar_feature(aa32_doublelock, cpu)) {
>
> since it's just used once.

If I squash in this change:

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 069dfe1d308..1f4f3e0485c 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4218,22 +4218,6 @@ static inline bool isar_feature_any_ras(const
ARMISARegisters *id)
     return isar_feature_aa64_ras(id) || isar_feature_aa32_ras(id);
 }

-static inline bool isar_feature_any_doublelock(const ARMISARegisters *id)
-{
-    /*
-     * We can't just OR together the aa32 and aa64 checks, because
-     * if there is no AArch64 support the aa64 function will default
-     * to returning true for a zero id_aa64dfr0.
-     * We use "is id_aa64pfr0 non-zero" as a proxy for "do we have
-     * the AArch64 ID register values in id", because it's always the
-     * case that ID_AA64PFR0_EL1.EL0 at least will be non-zero.
-     */
-    if (id->id_aa64pfr0) {
-        return isar_feature_aa64_doublelock(id);
-    }
-    return isar_feature_aa32_doublelock(id);
-}
-
 /*
  * Forward to the above feature tests given an ARMCPU pointer.
  */
diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index 62bd8f85383..d09fccb0a4f 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -617,11 +617,14 @@ static void oslar_write(CPUARMState *env, const
ARMCPRegInfo *ri,
 static void osdlr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                         uint64_t value)
 {
+    ARMCPU *cpu = env_archcpu(env);
     /*
      * Only defined bit is bit 0 (DLK); if Feat_DoubleLock is not
      * implemented this is RAZ/WI.
      */
-    if (cpu_isar_feature(any_doublelock, env_archcpu(env))) {
+    if(arm_feature(env, ARM_FEATURE_AARCH64)
+       ? cpu_isar_feature(aa64_doublelock, cpu)
+       : cpu_isar_feature(aa32_doublelock, cpu)) {
         env->cp15.osdlr_el1 = value & 1;
     }
 }




can I have a reviewed-by? Would save me doing a respin.

thanks
-- PMM
