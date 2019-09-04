Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1136943wrp;
        Wed, 4 Sep 2019 12:59:31 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzD9CPUja4p8zgHIf3+eNE2qw9tKaPgkWeYEItvfzbkirUn38NaphpjnGt+A4Oa3R7Pm5oY
X-Received: by 2002:a37:9804:: with SMTP id a4mr42450378qke.149.1567627170958;
        Wed, 04 Sep 2019 12:59:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567627170; cv=none;
        d=google.com; s=arc-20160816;
        b=NGL+5bXV2Rcz/2BhqlnX/VZTuuapkk+qyExPAPaYoB2/1bIRtVUNG/6WH9i5Y9Erc7
         xDbRqgDQl867dgZgsygL9K0DollF8QFtZVz1noWS/P5EQczGJv9LDkC4GkjHAtG/sZmH
         0PrpV3N/G1xhLL69DewAQGHwPMw1V1Sg43NQxZTelwxe5SoKcl0DGm2nJPIEh9x+Nsv4
         mGgvd4qxYQTkDPcpBBPn//gQC/nRKblwfWfpU226gMPv29HN5/9xQMm9waK560lU8vub
         h0sZbY+ULmbwtcqeBDYUzs9ICUql4bs+L2bP5tMS3vpKJ9F+rUBhexp63aKlos/NyE/u
         cWTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=uBQvYz8IHxhp6JSRYx+eAJLbYd/WxV5+vKoQFHwhKKE=;
        b=axZDU+6NPpMVaemqyydhufsgd2nnR7jj+lw1xokpwoXB1AclTpXOoKrfVPE+AHCY5q
         YMHvTh2d+QtYKUOifh9PKGNDU61jgc6FHxRSM3pvoBgLyvyXxr6fvzvNxbopMMtOxiqM
         e5zLAzS2E9wsqTWcvjeF/x0+8tcMG9FSomIax3cBSz7ec4apAKq//4x/i1AzLtPqE6G0
         d5Lnnmun125Ba4Z2hInyE9KJ3gLDRaN5+KNcir2QcTWgQk2Gn9a5PBisuC/bcmnmlKaa
         3gS4iwce/UlMYo/SCGc+Jfp8msLlwpM1bmPTE7+cCsVQoqrpAmsHh1LQ1Go8GmteBkSX
         LcbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nP0gy5CA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u188si16013qka.97.2019.09.04.12.59.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 12:59:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nP0gy5CA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5bRB-0001u8-RV
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 15:59:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40682)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i5b0U-00058G-9w
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:31:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i5b0R-0002k3-1S
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:31:54 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:42825)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i5b0Q-0002ie-En
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:31:50 -0400
Received: by mail-pf1-x441.google.com with SMTP id w22so5464522pfi.9
 for <qemu-arm@nongnu.org>; Wed, 04 Sep 2019 12:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uBQvYz8IHxhp6JSRYx+eAJLbYd/WxV5+vKoQFHwhKKE=;
 b=nP0gy5CA8F+hMVqR1RfqRCtQOYZtv4ByApFNWYu5Y7QSKSC84dP0ezc6vrzChPerie
 Qtvl0whj6iiKAoO2qPoOOv/F0M/kX5kHKwDKSw3Yrr5HZGXs006i5s1UsZh2oKdHNrTq
 sYNJcGaRKkWlY4NR7xiVn5Y9W2HvQFBzdr5Nbf+GTa+wory0Ud6cTdKFpISgDG2WYM1y
 FTXYewj4ikPmdcS1fc2OnwM5z/UMC1KA10K2RcNQhbIpDTntUoCgS0aUbm2MwbCSuojY
 yguEVQBlmL4KnPkpcG1yZ1c0CRI/TsRDBt19uulMMZLC6klP1nCaFEDl5Al88k8oS7Df
 YeNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uBQvYz8IHxhp6JSRYx+eAJLbYd/WxV5+vKoQFHwhKKE=;
 b=cVuGdscEy9gUqiKYJNfrmETVImmniifMLNOzfXxFuL+k+0p3EfNJwzGarNVRBQHz7n
 hcdOmFhbsEibZwBtMcKlmBRIT5AsEdJQZ4VpzMNxSFMQz6LahlKuLSiJ9Yxs36JeG1AI
 hBb7MXRMQQlY/DtMfgOHIz6rPilUmDQVkwdg039OfYs9VCuph+Ju8KSM4Duw9pCfcguC
 ol0eguhfoOp4Dc/zBLVO88HgchKCHGw7fQiFLMpVDJZ/wLdrK2cBzUJa/xTi0tL5cP3N
 Z1H7xvZZyfuVznxuXNsEEXVOp3FWtRBGMwfQjAkb8/C+rQGEP1RS0VNysnyyK7Nu74Bb
 091w==
X-Gm-Message-State: APjAAAW6OsrxxO8w5EmJjWMrOpje/LGX33nV6j/HH97NA/lO0t/pfcDU
 qpN/+JlQZxNoD2R1KHI2xVY1AQ==
X-Received: by 2002:a17:90a:a40e:: with SMTP id
 y14mr6414114pjp.83.1567625509182; 
 Wed, 04 Sep 2019 12:31:49 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f6sm18999174pga.50.2019.09.04.12.31.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 12:31:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  4 Sep 2019 12:30:27 -0700
Message-Id: <20190904193059.26202-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190904193059.26202-1-richard.henderson@linaro.org>
References: <20190904193059.26202-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: [Qemu-arm] [PATCH v4 37/69] target/arm: Convert SETEND
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
X-TUID: IYBMFxwLK1hX

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c       | 22 +++++++++++++---------
 target/arm/a32-uncond.decode |  4 ++++
 2 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 664ea281f8..a599da96e1 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10240,6 +10240,18 @@ static bool trans_SB(DisasContext *s, arg_SB *a)
     return true;
 }
 
+static bool trans_SETEND(DisasContext *s, arg_SETEND *a)
+{
+    if (!ENABLE_ARCH_6) {
+        return false;
+    }
+    if (a->E != (s->be_data == MO_BE)) {
+        gen_helper_setend(cpu_env);
+        s->base.is_jmp = DISAS_UPDATE;
+    }
+    return true;
+}
+
 /*
  * Legacy decoder.
  */
@@ -10325,15 +10337,7 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
             return; /* v7MP: Unallocated memory hint: must NOP */
         }
 
-        if ((insn & 0x0ffffdff) == 0x01010000) {
-            ARCH(6);
-            /* setend */
-            if (((insn >> 9) & 1) != !!(s->be_data == MO_BE)) {
-                gen_helper_setend(cpu_env);
-                s->base.is_jmp = DISAS_UPDATE;
-            }
-            return;
-        } else if ((insn & 0x0e000f00) == 0x0c000100) {
+        if ((insn & 0x0e000f00) == 0x0c000100) {
             if (arm_dc_feature(s, ARM_FEATURE_IWMMXT)) {
                 /* iWMMXt register transfer.  */
                 if (extract32(s->c15_cpar, 1, 1)) {
diff --git a/target/arm/a32-uncond.decode b/target/arm/a32-uncond.decode
index de611e8aff..32253b4f9a 100644
--- a/target/arm/a32-uncond.decode
+++ b/target/arm/a32-uncond.decode
@@ -24,6 +24,7 @@
 
 &empty           !extern
 &i               !extern imm
+&setend          E
 
 # Branch with Link and Exchange
 
@@ -50,3 +51,6 @@ DSB              1111 0101 0111 1111 1111 0000 0100 ----
 DMB              1111 0101 0111 1111 1111 0000 0101 ----
 ISB              1111 0101 0111 1111 1111 0000 0110 ----
 SB               1111 0101 0111 1111 1111 0000 0111 0000
+
+# Set Endianness
+SETEND           1111 0001 0000 0001 0000 00 E:1 0 0000 0000  &setend
-- 
2.17.1

