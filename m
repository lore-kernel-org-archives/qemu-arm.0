Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp653287lfr;
        Fri, 16 Apr 2021 12:06:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzIxGGEbUASLaLLXj2oljhbFsPBmNT2NgYF4Y64plhL8ePETO+3JvpYa2e0RKRRlHlVoo9q
X-Received: by 2002:a02:a38f:: with SMTP id y15mr5449192jak.106.1618600011980;
        Fri, 16 Apr 2021 12:06:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618600011; cv=none;
        d=google.com; s=arc-20160816;
        b=APe4Q1EUWsdYSy+z/5kIOXrE+Fj0MYoqf1H77Qo7c8VE02R98aQiuBCgm9pshfa66j
         5CkZ0jBlGXZfD9HMK8GK+P3Zxtp3aQgVXuGNT1vr/8xWZVmLoH1xZQeG2yZEtM1LE8w9
         2ecU77gGb/TB8tpVQspu2Q+hnfQbp46gl8iVkx6IROcWj67qKnL4hCzXexYuTJdCsa2e
         OEufUXL9V9hPYf2rVOEnFeEk9jjHbuPzbNANh7X8b1uitl8WOxvhWxhM8eSD62vcYQna
         Q2fbb2wjSQOLHNeFwnBne1IN0v6wsHIvlBxn1TDd6KQaGbwowNV88YLObH1WVwikbx4R
         cayw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=cT3QO7VItfU2VrQhqJUimeA2gkAab7Ike6sYupHt1Ns=;
        b=YeaDPJeOnsBaU8RJ5KzNLR4IoOviRm9ZjuNIWkONY6CueDpWFFr9N7o5AdFckj7R4T
         9eB94B1i6yywGoRT3gWEU6hkx8fGr3QDa2pJNFsI7zP4QBj8GLGAZuaa2JJ/uD9XvpEK
         Ydap6VX/55Fsu0cfb4KEr/g72MAsYGees8Nyu0d6EpbGw6tcqlexu1KOVXdDhAWI+fnv
         Rbisw6pjXad8XJvVa+6EMKpVdM++jW8uZYFJfV8KkPZTa/itm3fwfSOtXJAcdTAxZSb8
         9+opFOubkaWOKWfrqOwOQ2pZVeshD6iXqaP3FWJ4oT0zd/V7Win33WVGIPUAPALz9I+F
         pElw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OfrSZ+OM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t16si7099602iov.11.2021.04.16.12.06.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 12:06:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OfrSZ+OM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXTnn-0002mh-50
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 15:06:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXThc-0003Tx-Oo
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 15:00:28 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:45869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXThI-0004H9-If
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 15:00:28 -0400
Received: by mail-pl1-x62b.google.com with SMTP id p16so10518195plf.12
 for <qemu-arm@nongnu.org>; Fri, 16 Apr 2021 12:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cT3QO7VItfU2VrQhqJUimeA2gkAab7Ike6sYupHt1Ns=;
 b=OfrSZ+OMHSbYGaGqVds/CA0XLpHG8fQUkcOxqjtCIRNJvla5b0ZpPGx698A9KZv1RX
 9Lko5708APj3y2qm6pVVPSpJ2R2oqPApUidWVyeQcma9ZOrPreUoMXfmdsx4y5kRVofy
 1LhY1AHZHMY/vQwsFJdjaYwrn6akSs5DgehiaCX9Vdzpu8McgoLyWZtuT7N+u3UjE720
 K0jE4Pi6M8QMcgKYe8YE1aM8TN3Zszi40+D/DKI57nLhmUYxafJyUasLw4fGX/o/JDAc
 pVDU5DZQ0/6MwvVTVFnzSpmbQWmOpzu72LmX8ToH6/dzmZfFIGZ95/iFUrXe/BkFA50x
 jjQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cT3QO7VItfU2VrQhqJUimeA2gkAab7Ike6sYupHt1Ns=;
 b=EaGET7rDSsnKX0JrSd1wgZ6Uas3/aq2R9hzW2akvguIoEcrn+T+50NpZj0hGcOQUCZ
 bslmL+ejMhxjSYjochOMDG2wtJI2Z7AOgiDH2yB2a7WeRnnCQEALprHcE29rBO7G3ZVd
 +y+YFA2JJmh/Vfl2sO8JmOhQckyFZzVTLrx0vxMVAQGaBk3HC8n9YWg8PmwIMic4vnto
 V0mP3IzDf/HZtqHxYjJ5i7Fj+Jk6WNUukgZqWPkMlYQ9Jb0hRZNDCJHJ2wqlgmh2+pS1
 OE7JlJFJxT+R1epHL5aRB1QJ1v2EldxLtRYOPh0Y1orYz9cfURQukGVOEUDhfV4ZPnPG
 9w0g==
X-Gm-Message-State: AOAM532ovvtVTmmmNDFZLGB5ZGPzEkG6tZVpyoVjc4ZGtD3NPdR4P2xA
 d69/ZogoEhQI+rSan7FMdtfFXoCSY/UQdw==
X-Received: by 2002:a17:90a:a22:: with SMTP id
 o31mr11466660pjo.127.1618599607144; 
 Fri, 16 Apr 2021 12:00:07 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id d7sm1988337pfv.197.2021.04.16.12.00.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 12:00:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 07/30] target/arm: Move TBFLAG_AM32 bits to the top
Date: Fri, 16 Apr 2021 11:59:36 -0700
Message-Id: <20210416185959.1520974-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416185959.1520974-1-richard.henderson@linaro.org>
References: <20210416185959.1520974-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tblCUq4mAj5o

Now that these bits have been moved out of tb->flags,
where TBFLAG_ANY was filling from the top, move AM32
to fill from the top, and A32 and M32 to fill from the
bottom.  This means fewer changes when adding new bits.

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

