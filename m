Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2921063lfq;
        Mon, 11 Jan 2021 11:06:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwaQgyWB6Ztyxy9WPdMil8ovbhcxF0xSFtHxGeYZ+7ggGY0WbT0mjmUjWpV+qnU2MuwZy+2
X-Received: by 2002:a5b:404:: with SMTP id m4mr1778555ybp.436.1610392005423;
        Mon, 11 Jan 2021 11:06:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610392005; cv=none;
        d=google.com; s=arc-20160816;
        b=fhA3jS5+dn0+qmdJNg3vGB9bsDJod8DvQ84FSYiIbbimsFPSA8iaIv52UggGP1ZlAw
         06Ki3ZttMRRZnaD5t48GPgH/1auN9aV8JnSG6f5ixwTReOBYFWJe8+fHbG5A84uEwkIK
         ZIy2ojfqg4fTpsy5DNcdxfUkZzY7deTxC8sMNC++TAaNMt2wUuPEzaFLU8uR7fjdTbSo
         JAvKhCgNnyQ3xnbgBkjkuBLSaSKjF4ptJ7VhOHuWzdhumO+7t5zZ0fesU2trE0hueaY5
         cWgkTZTjDCI5sVeW/4RqzxV7x7vVSuWdfjLlwpZqbl88KORNs+I0ycX5FtjwZ55/Qh9k
         zUTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Eqku9olTG9KcFAe0Bboq71aa8Qg5GclGuwOXsQ8VxnQ=;
        b=yEj/Ymvu6qEGz6Vf41acWWEq/m9Bnfpjb735Uv8Qk62f/X6P1IWZVc7BdwOj+QRRAg
         ikpwDXqvf2gqHA83lf7e69ZaauAgmIPYn3TJOjUzqrzN+5QcZstReXtPnCOP3fIzQtkn
         2IR3wtb15kl290D67HIYihjmwGGw3c7H9y8A5Z4WKFLDgjx/MrL8mBjBcfoxbtE3YyMD
         GyO0GaRRx0v9z64rjaEslhNj459HLXvagMQ/NqF+T80vfyuCGDrkbvDIPSGrV5Ic+kpy
         Pa26njw3gxa5d22LpnZugIBMa+kW1IJFgXf74bMGieI5rgssta4NXY6wMmI9DE9csCTG
         Wkig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HUpgZHTq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f75si620784yba.96.2021.01.11.11.06.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Jan 2021 11:06:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HUpgZHTq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kz2Wa-0002eO-O2
	for alex.bennee@linaro.org; Mon, 11 Jan 2021 14:06:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2RX-0005up-Tg
 for qemu-arm@nongnu.org; Mon, 11 Jan 2021 14:01:31 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:42407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2RW-0006Ow-2f
 for qemu-arm@nongnu.org; Mon, 11 Jan 2021 14:01:31 -0500
Received: by mail-pg1-x52d.google.com with SMTP id g15so256924pgu.9
 for <qemu-arm@nongnu.org>; Mon, 11 Jan 2021 11:01:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Eqku9olTG9KcFAe0Bboq71aa8Qg5GclGuwOXsQ8VxnQ=;
 b=HUpgZHTqPegkXvHDjb+0RAGfu6JGta9zzUU+7Yf7+/LRQcdHUIOvEXqPN3h4xdbge7
 gpmaCSOL+k3npdkFcE3cSzOP+qXwZdeslyYq7RPZYzGCnVMRgbrUr8FSpaC6FTn50z29
 Dx2BHCM78hxky0jzHbmnwD6PkMOJBBDuquVyZcVA9UVUN8yPU5MMF05EiIK8vj5+CQsV
 yM9Z9IPTj8YxYFratsg0tarEkYq+PrdsL+vgGnYgxFaCNvnIRdASSXrpLF3E8Ao+bX+z
 JJ/qqdnLE0jcPme6nsSbwK7qcbRcLtejZWDyYi6SWEqHc8HUSEGTqVCx/2Us7FiDOIvf
 qxYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Eqku9olTG9KcFAe0Bboq71aa8Qg5GclGuwOXsQ8VxnQ=;
 b=KTuB+KFZXOX6HqMd68VOubWJCZ3+IJ0UkR4CuUD0s7V149UvaPQQ+rBMfyBwc7eAPF
 v2Vx7yu6Wyl718g1CrgMpZfzhKyS+YEFgGs2o/NkGt3WzegtC8TIiiAff95hsx+8wo5N
 EPtIt78G+Mgm4Ck0J9z7ndO2Gt2hp64ek+L0N7Eljfw2Ivc6NN+1RBr5FDLEpgRyiqTC
 HE8JXJzDbpk5DXTMufcU77CZYBFToYEStKziihAukkrl+GnVodItWICYwbExVNSbuJ47
 Ekw3tUJ8cap6Ah5rkvrPat58THbcG3+AdgNFM/2EStYrgC2QJzPvtjroQa5LuSNlYGxE
 afzg==
X-Gm-Message-State: AOAM531M+CopQVq+cX1VQPNpMiqn5BVi2EjnKEYggX4p6VKgGJxcAwA4
 XPmxJ63n+zTah0GL+tJrbYfYcg==
X-Received: by 2002:a62:8f0e:0:b029:1aa:1268:fa4e with SMTP id
 n14-20020a628f0e0000b02901aa1268fa4emr823755pfd.18.1610391688695; 
 Mon, 11 Jan 2021 11:01:28 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id n195sm350395pfd.169.2021.01.11.11.01.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 11:01:28 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/30] target/arm: Move TBFLAG_AM32 bits to the top
Date: Mon, 11 Jan 2021 09:00:50 -1000
Message-Id: <20210111190113.303726-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111190113.303726-1-richard.henderson@linaro.org>
References: <20210111190113.303726-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Dx/ISQbvvRuH

Now that these bits have been moved out of tb->flags,
where TBFLAG_ANY was filling from the top, move AM32
to fill from the top, and A32 and M32 to fill from the
bottom.  This means fewer changes when adding new bits.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 42 +++++++++++++++++++++---------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index af70462cfa..43bcd21959 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3265,13 +3265,13 @@ typedef ARMCPU ArchCPU;
  *
  * The bits for 32-bit A-profile and M-profile partially overlap:
  *
- *  18             9              0
- * +----------------+--------------+
- * |   TBFLAG_A32   |              |
- * +-----+----------+  TBFLAG_AM32 |
- * |     |TBFLAG_M32|              |
- * +-----+----------+--------------+
- *     14          9              0
+ *  31         23         11 10             0
+ * +-------------+----------+----------------+
+ * |             |          |   TBFLAG_A32   |
+ * | TBFLAG_AM32 |          +-----+----------+
+ * |             |                |TBFLAG_M32|
+ * +-------------+----------------+----------+
+ *  31         23                5 4        0
  *
  * Unless otherwise noted, these bits are cached in env->hflags.
  */
@@ -3288,44 +3288,44 @@ FIELD(TBFLAG_ANY, DEBUG_TARGET_EL, 20, 2)
 /*
  * Bit usage when in AArch32 state, both A- and M-profile.
  */
-FIELD(TBFLAG_AM32, CONDEXEC, 0, 8)      /* Not cached. */
-FIELD(TBFLAG_AM32, THUMB, 8, 1)         /* Not cached. */
+FIELD(TBFLAG_AM32, CONDEXEC, 24, 8)      /* Not cached. */
+FIELD(TBFLAG_AM32, THUMB, 23, 1)         /* Not cached. */
 
 /*
  * Bit usage when in AArch32 state, for A-profile only.
  */
-FIELD(TBFLAG_A32, VECLEN, 9, 3)         /* Not cached. */
-FIELD(TBFLAG_A32, VECSTRIDE, 12, 2)     /* Not cached. */
+FIELD(TBFLAG_A32, VECLEN, 0, 3)         /* Not cached. */
+FIELD(TBFLAG_A32, VECSTRIDE, 3, 2)     /* Not cached. */
 /*
  * We store the bottom two bits of the CPAR as TB flags and handle
  * checks on the other bits at runtime. This shares the same bits as
  * VECSTRIDE, which is OK as no XScale CPU has VFP.
  * Not cached, because VECLEN+VECSTRIDE are not cached.
  */
-FIELD(TBFLAG_A32, XSCALE_CPAR, 12, 2)
-FIELD(TBFLAG_A32, VFPEN, 14, 1)         /* Partially cached, minus FPEXC. */
-FIELD(TBFLAG_A32, SCTLR__B, 15, 1)      /* Cannot overlap with SCTLR_B */
-FIELD(TBFLAG_A32, HSTR_ACTIVE, 16, 1)
+FIELD(TBFLAG_A32, XSCALE_CPAR, 5, 2)
+FIELD(TBFLAG_A32, VFPEN, 7, 1)         /* Partially cached, minus FPEXC. */
+FIELD(TBFLAG_A32, SCTLR__B, 8, 1)      /* Cannot overlap with SCTLR_B */
+FIELD(TBFLAG_A32, HSTR_ACTIVE, 9, 1)
 /*
  * Indicates whether cp register reads and writes by guest code should access
  * the secure or nonsecure bank of banked registers; note that this is not
  * the same thing as the current security state of the processor!
  */
-FIELD(TBFLAG_A32, NS, 17, 1)
+FIELD(TBFLAG_A32, NS, 10, 1)
 
 /*
  * Bit usage when in AArch32 state, for M-profile only.
  */
 /* Handler (ie not Thread) mode */
-FIELD(TBFLAG_M32, HANDLER, 9, 1)
+FIELD(TBFLAG_M32, HANDLER, 0, 1)
 /* Whether we should generate stack-limit checks */
-FIELD(TBFLAG_M32, STACKCHECK, 10, 1)
+FIELD(TBFLAG_M32, STACKCHECK, 1, 1)
 /* Set if FPCCR.LSPACT is set */
-FIELD(TBFLAG_M32, LSPACT, 11, 1)                 /* Not cached. */
+FIELD(TBFLAG_M32, LSPACT, 2, 1)                 /* Not cached. */
 /* Set if we must create a new FP context */
-FIELD(TBFLAG_M32, NEW_FP_CTXT_NEEDED, 12, 1)     /* Not cached. */
+FIELD(TBFLAG_M32, NEW_FP_CTXT_NEEDED, 3, 1)     /* Not cached. */
 /* Set if FPCCR.S does not match current security state */
-FIELD(TBFLAG_M32, FPCCR_S_WRONG, 13, 1)          /* Not cached. */
+FIELD(TBFLAG_M32, FPCCR_S_WRONG, 4, 1)          /* Not cached. */
 
 /*
  * Bit usage when in AArch64 state
-- 
2.25.1

