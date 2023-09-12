Received: by 2002:a17:906:9502:b0:9a1:fa4e:495e with SMTP id u2csp2062610ejx;
        Tue, 12 Sep 2023 07:04:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+fN0gHbXF3MhHmFFVm7kI9VuJsxNKGlEF5r0qB9uF+xMB6zmy60fSLa7qCm75en+xEsdC
X-Received: by 2002:a0c:e10a:0:b0:64f:6f65:18b7 with SMTP id w10-20020a0ce10a000000b0064f6f6518b7mr13187286qvk.47.1694527497778;
        Tue, 12 Sep 2023 07:04:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694527497; cv=none;
        d=google.com; s=arc-20160816;
        b=n+zvSVgN2ADeILSpeosVVSdxMJbH5Tl08FYEHJ/fdpwjqp3AhFWCqHP/CkHaE8c2Hs
         77csnall0GZ17rUzBUD5RlSIGFOti4TgQ12/FFc3ATaSrINOqqSSOQRAlM3SzGct/1DC
         eGeN0zmqjcqhOlBLvM1Pr7428Vyc6WNeol9N5lydaCOxw//KQ6Yu6cIYvAFOtKbnzRYW
         rVrpu9DA7UZv2TzVcbl5slXiVmMMAMbvBnXS+rA4r5Y2NTmqNMtBYY5gyHpcohXW3cSg
         mBKnonfudfRP8gxEkR3UlEh234cZYjPfbC9GYRks0FA+DwRYcG574GlvxtBodkn+2NG7
         t3Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=AZ7z+PF4zRsdie2W5wNUk9pY8AcE3Vlvunka/Km+EXQ=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=Z0OfxCKJoSVgasNHb2RAJkGb0dHd0b9x6WU7HtEDG917uYgo2dWq4cChZq0FhxxyyT
         +jWLKplDJMn3kIDHB/4eJaTELw1A0xWMojWKaoudgKQ9zT6JNqMYMl3Aacc9A4bICDWc
         fRuVpw0DAJ9LppUGjbRvAEsiGlYCIJOr5LGcvT4xgjBLdfsLnT57Hmdy2l0YBRZh+XyW
         vk1ZOXL0BAkkUKLn4Axra3UfhXO+rvTUJCpLkjeL9uZGkB0Dm6jmDGwc5tgTzvB2CEDt
         Pi5ScqKabLHQIbA/KZ0HiI/EGdJtS7C3CGhN5o/sR2qz50K78PoHZB76IG41DBuy2JbQ
         W4Vg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k50PTPYc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c21-20020a05620a201500b0076cb8552663si6135742qka.8.2023.09.12.07.04.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Sep 2023 07:04:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k50PTPYc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qg40Y-00086t-MY; Tue, 12 Sep 2023 10:04:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qg40W-00086P-Mm
 for qemu-arm@nongnu.org; Tue, 12 Sep 2023 10:04:49 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qg40N-0003pZ-NT
 for qemu-arm@nongnu.org; Tue, 12 Sep 2023 10:04:43 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-403012f27e1so36703715e9.1
 for <qemu-arm@nongnu.org>; Tue, 12 Sep 2023 07:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694527476; x=1695132276; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=AZ7z+PF4zRsdie2W5wNUk9pY8AcE3Vlvunka/Km+EXQ=;
 b=k50PTPYcziYiy1SUZB5An8TkPyoepEGaY393+MoDPpqFBdqJYoUQSA4/N+NPmF9oe/
 c8w1hNbVPBmhF1iTKSl4AfwT+a+2RpiTcVHMi6YRTQuXs3WpPnyi+aAsHIqlxXqW3kPq
 b6e75/GSrgRnMYb4dTmM0/n+N2AxWwEJ0OyLXq3eBc1ChlPDkg+F5ziRvDmLYpsbJCz2
 guQ4ZXs94jmFRWtAGXZAH4PILfJSqlAf7FR6ESO/duPWRhxjLb0LWVEmjZdsefRYfT3e
 5g0vP+/Qd7UzFR+USe+TF2fWvOEcjy4bvf54J3IcIFWQVPD2dkZc864bKpw00LC1tSBH
 PA6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694527476; x=1695132276;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AZ7z+PF4zRsdie2W5wNUk9pY8AcE3Vlvunka/Km+EXQ=;
 b=GS2vnAUjSlJ8GINNJJIsnbaGjXP/texKL6h+8HW8YSkhQYpiULNSm54nSI9ieTmczY
 6fr1OiQ7/tQs/5Din9A/y/hgn+A8dk92sNc8qdEOT/IeOuNOWopv4e9Cs8Y5gBc7122Z
 lPNoTzX5+lw40IfdEydHbaftm703ZJSUKvA2tPQxxSkdCtywzlF9PTVWhZA7R5pzotrm
 Jp2e76SMfnXhx2eRSeIXF2ojPIcrdNogBQVzuHaOBb7L3w9sLxWWKvmmmvTkd+jeu5kC
 45eDyrY2ZpMSY5U7lBd6Ac3xQ2Rz+Lw2Tgpy9AVxNq/73eSQIhnDPRrPNdCok3uNo5eY
 NgJA==
X-Gm-Message-State: AOJu0Yzq+1SZLBRkdXj1jzG//qB9Y1OMcLjcpFEHAmf8Pq+1eHw+Qxxz
 njUApOevq/C7CxeEpe2ddyuIkSeYV6yPN3eJQrU=
X-Received: by 2002:a5d:5103:0:b0:315:8f4f:81b8 with SMTP id
 s3-20020a5d5103000000b003158f4f81b8mr10928695wrt.50.1694527476476; 
 Tue, 12 Sep 2023 07:04:36 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 r3-20020a5d4983000000b00317ab75748bsm12892672wrq.49.2023.09.12.07.04.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Sep 2023 07:04:36 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 01/12] target/arm: Don't skip MTE checks for LDRT/STRT at
 EL0
Date: Tue, 12 Sep 2023 15:04:23 +0100
Message-Id: <20230912140434.1333369-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230912140434.1333369-1-peter.maydell@linaro.org>
References: <20230912140434.1333369-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: yP27Ego4+H1b

The LDRT/STRT "unprivileged load/store" instructions behave like
normal ones if executed at EL0. We handle this correctly for
the load/store semantics, but get the MTE checking wrong.

We always look at s->mte_active[is_unpriv] to see whether we should
be doing MTE checks, but in hflags.c when we set the TB flags that
will be used to fill the mte_active[] array we only set the
MTE0_ACTIVE bit if UNPRIV is true (i.e.  we are not at EL0).

This means that a LDRT at EL0 will see s->mte_active[1] as 0,
and will not do MTE checks even when MTE is enabled.

To avoid the translate-time code having to do an explicit check on
s->unpriv to see if it is OK to index into the mte_active[] array,
duplicate MTE_ACTIVE into MTE0_ACTIVE when UNPRIV is false.

(This isn't a very serious bug because generally nobody executes
LDRT/STRT at EL0, because they have no use there.)

Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/hflags.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/arm/tcg/hflags.c b/target/arm/tcg/hflags.c
index 616c5fa7237..ea642384f5a 100644
--- a/target/arm/tcg/hflags.c
+++ b/target/arm/tcg/hflags.c
@@ -306,6 +306,15 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
                 && !(env->pstate & PSTATE_TCO)
                 && (sctlr & (el == 0 ? SCTLR_TCF0 : SCTLR_TCF))) {
                 DP_TBFLAG_A64(flags, MTE_ACTIVE, 1);
+                if (!EX_TBFLAG_A64(flags, UNPRIV)) {
+                    /*
+                     * In non-unpriv contexts (eg EL0), unpriv load/stores
+                     * act like normal ones; duplicate the MTE info to
+                     * avoid translate-a64.c having to check UNPRIV to see
+                     * whether it is OK to index into MTE_ACTIVE[].
+                     */
+                    DP_TBFLAG_A64(flags, MTE0_ACTIVE, 1);
+                }
             }
         }
         /* And again for unprivileged accesses, if required.  */
-- 
2.34.1

