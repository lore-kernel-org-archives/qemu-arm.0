Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp1725037lfu;
        Thu, 28 Apr 2022 06:19:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCFa3AxMFqGdcPW+8UdPhVAHYa/SajWBo9yjjYGJZAD+VZj02iLFsyxTbL7HVdEHgUMzVz
X-Received: by 2002:ac8:5709:0:b0:2f3:6440:ec8f with SMTP id 9-20020ac85709000000b002f36440ec8fmr16675027qtw.678.1651151998039;
        Thu, 28 Apr 2022 06:19:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651151998; cv=none;
        d=google.com; s=arc-20160816;
        b=RDj7lGqDa++PpXbWIE7TLGmYv0EvK1lzmGiCXFwOT5woeGFRTh50h88J28MDYeUs+6
         4chmZrQpbskllOMTbMd5WDgONmVQsjZLfLvPQGJ04g85wf/kkE1971sC/pBhlAoS+nAc
         OG1k9rlkvFnYBgIRnUEOZxncCwqoWmg/Kpd/3zUNyJAvxSBj+aOXM2gK4ATl2JgsCtVH
         ik2U3fhE2+33Cwaie0wygk2Rjp5qdh63mQUCJUXUAY3cIy0a3ydddK3zLQTiHmMGRrdN
         pLS7EvXpkmHPyxP/5RbnooPTkdjrmBOIqSM9uRSHUKuTV40EiNEGqep5SKo1vwVqUYEp
         gAsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=Bfbc8Hiy9yEGQ64oseWOsvJ/Y0B8UdcjSFOpcy2VPOI=;
        b=Bmjr5pD4pTX2B61iF28sm+xMV1Do+wm71F5voYMpvD8aIg50nIm4OvJOCLDBpOfA3C
         81YBPUN2U8x9uG2AsEnAaRr8AoTu3JZw+xWIODusUKlkXCJKc0H+F9ffYAmya6GWG12z
         v/SL2N8fy9PjV8JaEqvYKvnsBWKg34B/RmG5yTwR56LF/cDo6j096M/jw2QkxfhofF/R
         6qy/eOOYkJpqk+bvpOpcZHMEMz/qY3iUnpxJNNzuNmwj2ZJaI/D6KtaZKkIEVRndOk3s
         4bhrqe1V5+rjNNr1vdyGtILJLnMjlRcjtHdfKLAg1m15XmMCAR4g9BHbmaSmw+L9Hmzd
         SyxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=aMlvXcDQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q184-20020a37a7c1000000b0069f2d740251si1617433qke.627.2022.04.28.06.19.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Apr 2022 06:19:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=aMlvXcDQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nk43p-0002hF-H1
	for alex.bennee@linaro.org; Thu, 28 Apr 2022 09:19:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <redha.gouicem@gmail.com>)
 id 1nk2OQ-0006X9-EB; Thu, 28 Apr 2022 07:33:06 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:33367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <redha.gouicem@gmail.com>)
 id 1nk2OO-0002QB-CW; Thu, 28 Apr 2022 07:33:06 -0400
Received: by mail-wr1-x432.google.com with SMTP id x18so6411841wrc.0;
 Thu, 28 Apr 2022 04:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Bfbc8Hiy9yEGQ64oseWOsvJ/Y0B8UdcjSFOpcy2VPOI=;
 b=aMlvXcDQ5ETStW+x5Bqvn1BqBcffwyexgQwzWlIqyTIwmZDTVaQkj+9zYDhIyei2Wa
 PWRgJ8rvn1EBGZoqL7cNVWhhTpro4q6vzUSxbAgHswSZwhwpzbbxr4gnjYwBe9HVOEdX
 /WtGfMcwtw3Rt9qG7BMR6zInnw571SuX4L+vICd5Y1kgnX7mn+Moj5cRJarAw0hknJiQ
 rIz9jN93+PRwPcAEVaZWPjuh+bVZ9sj86QDlIuQiQh3YteYaI5GqV2zY5KPOgrceL9Dv
 OwYQgen4C+sWpBKp1i/X1VH2a/cxEAs6isUIbZh9z6GQocPSsLqEhjZcLpbOyoYUkFmc
 fg3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Bfbc8Hiy9yEGQ64oseWOsvJ/Y0B8UdcjSFOpcy2VPOI=;
 b=ezVRUKfWOHww4qJK7nFUryNke+dQdlQKejLcLRc5y62P9OrYLyakv13/p5aX9C1tEc
 WKEqRTFlPN8d3EVqLfWBH3ralUJnvttNHefgTXuPwhB7wPFLcKQ/6yDErny26DygYUNn
 nFwBs/EHIvIZ91WIcGkJoTDQ48L+1YG5N4f7sGxKGVAOHuuicgBsU5b8Erh2JgnsLkZo
 Bc4UjYKPzQXNc8/JWTLsQ9T9yf9ZiMWi28RdAiUDqqeTm2y0dnt8xuOgPlEuvK7MOXDr
 3G0QtEP5gd2cGVstc6s5kOyIw9WJwq2v2NSLF7s0cACCso/PO+ZH44LoiBNlB4IRpD8X
 GQmQ==
X-Gm-Message-State: AOAM530ez8C1wSF06f+fei3WGj780tSu4sn64Z3en23SDVxvQM6t8Mjh
 5NRoNNorse1CdZaQRlIdXSs=
X-Received: by 2002:a5d:648a:0:b0:20a:e3ab:4350 with SMTP id
 o10-20020a5d648a000000b0020ae3ab4350mr11536623wri.130.1651145580411; 
 Thu, 28 Apr 2022 04:33:00 -0700 (PDT)
Received: from laughtale.in.tum.de (ethstick5.dse.in.tum.de.
 [2a09:80c0:38::1092]) by smtp.googlemail.com with ESMTPSA id
 3-20020a5d47a3000000b0020aa79d55b5sm19071560wrb.35.2022.04.28.04.32.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 04:32:59 -0700 (PDT)
From: Redha Gouicem <redha.gouicem@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH] tcg: fix guest memory ordering enforcement
Date: Thu, 28 Apr 2022 13:32:35 +0200
Message-Id: <20220428113234.37953-1-redha.gouicem@gmail.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=redha.gouicem@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 28 Apr 2022 09:19:34 -0400
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
Cc: qemu-riscv@nongnu.org, Redha Gouicem <redha.gouicem@gmail.com>,
 qemu-devel@nongnu.org, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WlolYNLiLajE

This commit allows memory ordering enforcement to be performed more
precisely. The previous scheme with fences always inserted before the memory
access made it impossible to correctly enforce the x86 model on weakly ordered
architectures such as arm. With this change, the memory models of guests can be
defined more precisely, with a fence before and a fence after the access. This
allows for a precise mapping of the ordering, that relies less on what type of
fences the host architecture provides.

Signed-off-by: Redha Gouicem <redha.gouicem@gmail.com>
---
 target/alpha/cpu.h  |  4 ++++
 target/arm/cpu.h    |  4 ++++
 target/avr/cpu.h    |  4 ++++
 target/hppa/cpu.h   |  4 ++++
 target/i386/cpu.h   |  4 ++++
 target/mips/cpu.h   |  4 ++++
 target/ppc/cpu.h    |  4 ++++
 target/riscv/cpu.h  |  4 ++++
 target/s390x/cpu.h  |  4 ++++
 target/xtensa/cpu.h |  4 ++++
 tcg/tcg-op.c        | 19 ++++++++++++-------
 11 files changed, 52 insertions(+), 7 deletions(-)

diff --git a/target/alpha/cpu.h b/target/alpha/cpu.h
index d0abc949a8..00220c66c8 100644
--- a/target/alpha/cpu.h
+++ b/target/alpha/cpu.h
@@ -26,6 +26,10 @@
 
 /* Alpha processors have a weak memory model */
 #define TCG_GUEST_DEFAULT_MO      (0)
+#define TCG_GUEST_MO_BEF_LD       (0)
+#define TCG_GUEST_MO_AFT_LD       (0)
+#define TCG_GUEST_MO_BEF_ST       (0)
+#define TCG_GUEST_MO_AFT_ST       (0)
 
 #define ICACHE_LINE_SIZE 32
 #define DCACHE_LINE_SIZE 32
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index db8ff04449..ec1407dc43 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -29,6 +29,10 @@
 
 /* ARM processors have a weak memory model */
 #define TCG_GUEST_DEFAULT_MO      (0)
+#define TCG_GUEST_MO_BEF_LD       (0)
+#define TCG_GUEST_MO_AFT_LD       (0)
+#define TCG_GUEST_MO_BEF_ST       (0)
+#define TCG_GUEST_MO_AFT_ST       (0)
 
 #ifdef TARGET_AARCH64
 #define KVM_HAVE_MCE_INJECTION 1
diff --git a/target/avr/cpu.h b/target/avr/cpu.h
index 55497f851d..adcab7c88b 100644
--- a/target/avr/cpu.h
+++ b/target/avr/cpu.h
@@ -33,6 +33,10 @@
 #define CPU_RESOLVING_TYPE TYPE_AVR_CPU
 
 #define TCG_GUEST_DEFAULT_MO 0
+#define TCG_GUEST_MO_BEF_LD  0
+#define TCG_GUEST_MO_AFT_LD  0
+#define TCG_GUEST_MO_BEF_ST  0
+#define TCG_GUEST_MO_AFT_ST  0
 
 /*
  * AVR has two memory spaces, data & code.
diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
index 6f3b6beecf..a1236548cf 100644
--- a/target/hppa/cpu.h
+++ b/target/hppa/cpu.h
@@ -29,6 +29,10 @@
    a weak memory model, but with TLB bits that force ordering on a per-page
    basis.  It's probably easier to fall back to a strong memory model.  */
 #define TCG_GUEST_DEFAULT_MO        TCG_MO_ALL
+#define TCG_GUEST_MO_BEF_LD       (TCG_MO_LD_LD | TCG_MO_ST_LD)
+#define TCG_GUEST_MO_AFT_LD       (0)
+#define TCG_GUEST_MO_BEF_ST       (TCG_MO_ST_ST | TCG_MO_LD_ST)
+#define TCG_GUEST_MO_AFT_ST       (0)
 
 #define MMU_KERNEL_IDX   0
 #define MMU_USER_IDX     3
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 9661f9fbd1..c6a7052d58 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -29,6 +29,10 @@
 
 /* The x86 has a strong memory model with some store-after-load re-ordering */
 #define TCG_GUEST_DEFAULT_MO      (TCG_MO_ALL & ~TCG_MO_ST_LD)
+#define TCG_GUEST_MO_BEF_LD       (0)
+#define TCG_GUEST_MO_AFT_LD       (TCG_MO_LD_ST | TCG_MO_LD_LD)
+#define TCG_GUEST_MO_BEF_ST       (TCG_MO_ST_ST)
+#define TCG_GUEST_MO_AFT_ST       (0)
 
 #define KVM_HAVE_MCE_INJECTION 1
 
diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 5335ac10a3..c2c0ca9c4a 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -8,6 +8,10 @@
 #include "mips-defs.h"
 
 #define TCG_GUEST_DEFAULT_MO (0)
+#define TCG_GUEST_MO_BEF_LD  (0)
+#define TCG_GUEST_MO_AFT_LD  (0)
+#define TCG_GUEST_MO_BEF_ST  (0)
+#define TCG_GUEST_MO_AFT_ST  (0)
 
 typedef struct CPUMIPSTLBContext CPUMIPSTLBContext;
 
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index c2b6c987c0..2763ba465a 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -27,6 +27,10 @@
 #include "qom/object.h"
 
 #define TCG_GUEST_DEFAULT_MO 0
+#define TCG_GUEST_MO_BEF_LD  0
+#define TCG_GUEST_MO_AFT_LD  0
+#define TCG_GUEST_MO_BEF_ST  0
+#define TCG_GUEST_MO_AFT_ST  0
 
 #define TARGET_PAGE_BITS_64K 16
 #define TARGET_PAGE_BITS_16M 24
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 34c22d5d3b..5f3a9dd463 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -29,6 +29,10 @@
 #include "cpu_bits.h"
 
 #define TCG_GUEST_DEFAULT_MO 0
+#define TCG_GUEST_MO_BEF_LD  0
+#define TCG_GUEST_MO_AFT_LD  0
+#define TCG_GUEST_MO_BEF_ST  0
+#define TCG_GUEST_MO_AFT_ST  0
 
 #define TYPE_RISCV_CPU "riscv-cpu"
 
diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index 7d6d01325b..59684809cd 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -34,6 +34,10 @@
 
 /* The z/Architecture has a strong memory model with some store-after-load re-ordering */
 #define TCG_GUEST_DEFAULT_MO      (TCG_MO_ALL & ~TCG_MO_ST_LD)
+#define TCG_GUEST_MO_BEF_LD       (0)
+#define TCG_GUEST_MO_AFT_LD       (TCG_MO_LD_ST | TCG_MO_LD_LD)
+#define TCG_GUEST_MO_BEF_ST       (TCG_MO_ST_ST)
+#define TCG_GUEST_MO_AFT_ST       (0)
 
 #define TARGET_INSN_START_EXTRA_WORDS 2
 
diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
index d4b8268146..29ef6ec5b7 100644
--- a/target/xtensa/cpu.h
+++ b/target/xtensa/cpu.h
@@ -35,6 +35,10 @@
 
 /* Xtensa processors have a weak memory model */
 #define TCG_GUEST_DEFAULT_MO      (0)
+#define TCG_GUEST_MO_BEF_LD       (0)
+#define TCG_GUEST_MO_AFT_LD       (0)
+#define TCG_GUEST_MO_BEF_ST       (0)
+#define TCG_GUEST_MO_AFT_ST       (0)
 
 enum {
     /* Additional instructions */
diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index 5d48537927..d9b43bc38a 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -2834,9 +2834,6 @@ static void gen_ldst_i64(TCGOpcode opc, TCGv_i64 val, TCGv addr,
 
 static void tcg_gen_req_mo(TCGBar type)
 {
-#ifdef TCG_GUEST_DEFAULT_MO
-    type &= TCG_GUEST_DEFAULT_MO;
-#endif
     type &= ~TCG_TARGET_DEFAULT_MO;
     if (type) {
         tcg_gen_mb(type | TCG_BAR_SC);
@@ -2873,7 +2870,7 @@ void tcg_gen_qemu_ld_i32(TCGv_i32 val, TCGv addr, TCGArg idx, MemOp memop)
     MemOp orig_memop;
     MemOpIdx oi;
 
-    tcg_gen_req_mo(TCG_MO_LD_LD | TCG_MO_ST_LD);
+    tcg_gen_req_mo(TCG_GUEST_MO_BEF_LD);
     memop = tcg_canonicalize_memop(memop, 0, 0);
     oi = make_memop_idx(memop, idx);
 
@@ -2904,6 +2901,8 @@ void tcg_gen_qemu_ld_i32(TCGv_i32 val, TCGv addr, TCGArg idx, MemOp memop)
             g_assert_not_reached();
         }
     }
+
+    tcg_gen_req_mo(TCG_GUEST_MO_AFT_LD);
 }
 
 void tcg_gen_qemu_st_i32(TCGv_i32 val, TCGv addr, TCGArg idx, MemOp memop)
@@ -2911,7 +2910,7 @@ void tcg_gen_qemu_st_i32(TCGv_i32 val, TCGv addr, TCGArg idx, MemOp memop)
     TCGv_i32 swap = NULL;
     MemOpIdx oi;
 
-    tcg_gen_req_mo(TCG_MO_LD_ST | TCG_MO_ST_ST);
+    tcg_gen_req_mo(TCG_GUEST_MO_BEF_ST);
     memop = tcg_canonicalize_memop(memop, 0, 1);
     oi = make_memop_idx(memop, idx);
 
@@ -2942,6 +2941,8 @@ void tcg_gen_qemu_st_i32(TCGv_i32 val, TCGv addr, TCGArg idx, MemOp memop)
     if (swap) {
         tcg_temp_free_i32(swap);
     }
+
+    tcg_gen_req_mo(TCG_GUEST_MO_AFT_ST);
 }
 
 void tcg_gen_qemu_ld_i64(TCGv_i64 val, TCGv addr, TCGArg idx, MemOp memop)
@@ -2959,7 +2960,7 @@ void tcg_gen_qemu_ld_i64(TCGv_i64 val, TCGv addr, TCGArg idx, MemOp memop)
         return;
     }
 
-    tcg_gen_req_mo(TCG_MO_LD_LD | TCG_MO_ST_LD);
+    tcg_gen_req_mo(TCG_GUEST_MO_BEF_LD);
     memop = tcg_canonicalize_memop(memop, 1, 0);
     oi = make_memop_idx(memop, idx);
 
@@ -2994,6 +2995,8 @@ void tcg_gen_qemu_ld_i64(TCGv_i64 val, TCGv addr, TCGArg idx, MemOp memop)
             g_assert_not_reached();
         }
     }
+
+    tcg_gen_req_mo(TCG_GUEST_MO_AFT_LD);
 }
 
 void tcg_gen_qemu_st_i64(TCGv_i64 val, TCGv addr, TCGArg idx, MemOp memop)
@@ -3006,7 +3009,7 @@ void tcg_gen_qemu_st_i64(TCGv_i64 val, TCGv addr, TCGArg idx, MemOp memop)
         return;
     }
 
-    tcg_gen_req_mo(TCG_MO_LD_ST | TCG_MO_ST_ST);
+    tcg_gen_req_mo(TCG_GUEST_MO_BEF_ST);
     memop = tcg_canonicalize_memop(memop, 1, 1);
     oi = make_memop_idx(memop, idx);
 
@@ -3036,6 +3039,8 @@ void tcg_gen_qemu_st_i64(TCGv_i64 val, TCGv addr, TCGArg idx, MemOp memop)
     if (swap) {
         tcg_temp_free_i64(swap);
     }
+
+    tcg_gen_req_mo(TCG_GUEST_MO_AFT_ST);
 }
 
 static void tcg_gen_ext_i32(TCGv_i32 ret, TCGv_i32 val, MemOp opc)
-- 
2.36.0

