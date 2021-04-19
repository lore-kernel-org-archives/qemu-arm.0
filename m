Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp1489282lfb;
        Mon, 19 Apr 2021 13:30:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxWo0PQ+vYNmlicKCayknmcWoSHBjyMgHiJS4HeCpTGAetdl4kcirRk24kd1lQ1QPe+3hJL
X-Received: by 2002:a6b:a04:: with SMTP id z4mr14165846ioi.120.1618864227621;
        Mon, 19 Apr 2021 13:30:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618864227; cv=none;
        d=google.com; s=arc-20160816;
        b=FZtiuNWHJRaXNjWC8Zwg5pdUdJinbPdsO4r+hwPPWnhFqC1cF0cIG9/2k+GupARYOD
         DFRtNinRetYCv3WF985vXEy1NlOoiPqi/g4wYcOeXuzLqsO71RbxAzNb156qbooP45W6
         ycWYVvYew4SgUF+3bJulx+wMBAlGiNxB6G24uAWouhA+j9Uc0kBHE+K4i84zXehTgnsx
         xrTIkb3oP3L/pPtkMF1vdc+VhPaBZZzjHGE3FNRcteh0aqm0CnwFTh/4eWvNC7Jnc6ZA
         RI/w9Q1+i4XxADRnwTYqHW1zJKSKQlN1TBEBPEBivRUD/Ie8j0jLiDbFmf5oygPSkQai
         i6qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=/4C6soQQ2UF5+ReqTTpmW8mt3pgISFVYnIcWMzWl4kI=;
        b=Fyx1pJZPblTwCUKhLxkqnO7DgTRkwFlXp2JOS4y+o+U98k1xgENzTJjxRIsu5wbVOY
         UDfGdnVHUJfrT4DEl5sMdcM6Wj4RbsfJL/cKFrtxWiH8DDYlgv5Oor56At7qQLweRedl
         NxkQzTlK4X/t1cXEp8fIeG2ZVzy7GGt1L+IDp+stjf9w45/bEGMldNvSyanof0BiiEjh
         a48Mi+w1ChZL/kcGffuz7u9V9hQVcu+vM9fWLj7XBMlCaHeMiwDKTxCw7geHK072t/aN
         Zh3miDVo0HwRY2Aidby+bLv5KURH3EHFaDqqN5LC8CccTWQ0s0+HBnO1PbyywbFCS4bZ
         ahIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="aC/nVnJO";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u12si14123426ilm.67.2021.04.19.13.30.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Apr 2021 13:30:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="aC/nVnJO";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lYaXK-0006At-U1
	for alex.bennee@linaro.org; Mon, 19 Apr 2021 16:30:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaQR-00075k-K0
 for qemu-arm@nongnu.org; Mon, 19 Apr 2021 16:23:19 -0400
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34]:33477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaQP-0002Uv-KH
 for qemu-arm@nongnu.org; Mon, 19 Apr 2021 16:23:19 -0400
Received: by mail-qv1-xf34.google.com with SMTP id ef17so11886153qvb.0
 for <qemu-arm@nongnu.org>; Mon, 19 Apr 2021 13:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/4C6soQQ2UF5+ReqTTpmW8mt3pgISFVYnIcWMzWl4kI=;
 b=aC/nVnJOB2h5gN7XGjlZgdlaBGJyO3ay0iyMDBGX9Ux9X6Y17AXNHTPctjp+t4F1HA
 AAdqXwmQD2z3iN0C6+F8/ckxY9GTm31Kf1zttTUILYHx5r2pdwem0hVsUte9vXNjMW/8
 TcUdlPWssRxTYxMOCb4zSI5EmuGxTHOVd00ePzXC6tXwJ7+JurLZH5N5NaziK+VY3tRS
 g/HaQPnHW86CqsKj4fdQ6STJ9bHCP/KNU+9mATwCHugvjYig1PraVK5LnuvuscQhFGg0
 00bm/pI4ghH8LRH5Hd4fjM6c8odPrwbcmkgtfSocVoClc0bbABc2NXDqzBXEocaBWehF
 IPbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/4C6soQQ2UF5+ReqTTpmW8mt3pgISFVYnIcWMzWl4kI=;
 b=CuvSTZmowna+9hmNmFdQXxdzf0YiGgT6Sh1nxOjxbHlqcSg+Pk3wBq3NiPWP4aYUhr
 E3j4ln5USTBj2quHR2NTusiwT/ODKKumsiL/TQwvNkXuXslply7c1TMidLfMXvUjUE0J
 tGlBMRu96l2/9gcYDGdAaQ1QvhCgJDVxZyjQlLjUN1knUeIntTkGnJsSagyIbZOLajw7
 lNPzz46KJt+hLPRAdUIWW+fahF57b/pYcjKiGWLLhCfjYEM3/piu2cT+SfsTA2VOtE3K
 9Q3E4Uup6peWjRHnGrAOPD6RGmbVyZ604HCQqLWrXRzrqClDwPQupAi5l+nYQsJZAVir
 keVA==
X-Gm-Message-State: AOAM531q9Y8GlDFmtWijjDzt6p1NqukS5NpSqeNNZgHattkWpD0iGILV
 NZUYb2l7up13fRtxsIIZifHoAQ==
X-Received: by 2002:a0c:a956:: with SMTP id z22mr22760803qva.22.1618863796699; 
 Mon, 19 Apr 2021 13:23:16 -0700 (PDT)
Received: from localhost.localdomain ([2607:fb90:80c7:aba4:3594:91a:8889:c77a])
 by smtp.gmail.com with ESMTPSA id c23sm10007835qtm.46.2021.04.19.13.23.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 13:23:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 08/31] target/arm: Move TBFLAG_AM32 bits to the top
Date: Mon, 19 Apr 2021 13:22:34 -0700
Message-Id: <20210419202257.161730-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210419202257.161730-1-richard.henderson@linaro.org>
References: <20210419202257.161730-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f34;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf34.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rdXLHgcdhPvn

Now that these bits have been moved out of tb->flags,
where TBFLAG_ANY was filling from the top, move AM32
to fill from the top, and A32 and M32 to fill from the
bottom.  This means fewer changes when adding new bits.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 42 +++++++++++++++++++++---------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index a8da7c55a6..15104e1440 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3395,13 +3395,13 @@ typedef ARMCPU ArchCPU;
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
@@ -3418,44 +3418,44 @@ FIELD(TBFLAG_ANY, DEBUG_TARGET_EL, 20, 2)
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

