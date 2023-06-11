Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp1540337ejb;
        Sun, 11 Jun 2023 09:02:59 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5jwLzaUDWY+5sDiExDu3+ki6MPY+dXLYOq4y1nKX+v+Go0e5P3ioE2GPLdCcO2TXhNtWDS
X-Received: by 2002:a05:6808:1395:b0:39c:73b1:ac6 with SMTP id c21-20020a056808139500b0039c73b10ac6mr3085204oiw.3.1686499378989;
        Sun, 11 Jun 2023 09:02:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686499378; cv=none;
        d=google.com; s=arc-20160816;
        b=i0VnwXkh9rl+WK+eva2tQKe/hIfythsz83Y0c8Z4Z7NW3lk89fqBG964EP3K1ciLU0
         ESIeHcfFL6Um0UdahgMch8yM9Lsjjj2I1VlIQps/53xWex1T3pcAc0aXmQ1n1Opd+GoI
         3v7nTjfzlW8s9F2455N/jOC6rh+and4F0wOpY9HuxTBRUcifN2mkL8MKDVHrseQ4fqga
         IkxoyvWiZkkftBfUk76kqN+HsdlAiWLFFxX4VNoVhZNbYDq5KJY+nQRQ72xhIVYuF0tA
         yYCs4kmdscUOEWyCkU4xSj06LZcUllUrZq2CQRi2UIPNZtqgdP7sKYxH/jnghwOKNnQv
         7OuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=EhniXz311o/2DcPgdcKAEpSrZXehm+PpvIlCx/ZyH40=;
        b=RgjmUoutjcolbQX2Ix14A4kEof56sLrXq9ajE8Nu2mQqHIqp9aOv5jMose32nRGxnX
         OoeYH0yu/yDP92Lh8op9RkEKpE7oGo1JRBmBw/TYYTRkT/cF2iOrwxagqeCO/D5ErUp9
         uWUS2oQ6O7jk4M7srrINkHS/oh9dY+AL2apKTxycmnRZBhAXP85HFFP7DPvWTuPvB8A9
         fSXUJ11hKyj88E7Zsv2FNQg57oLBKYgadTipfPKkacVRvq52jurf+7KhQpEFUSEspuFU
         VY+RBzIjyOL7xxyN8y+ndVI3owT8w/gr2Ooakxi86e1dlG5rltts39Zl/7jd9b4OeCTg
         alvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="sSRGz/mc";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e3-20020a0562140d8300b00621041c75bcsi5120458qve.37.2023.06.11.09.02.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 11 Jun 2023 09:02:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="sSRGz/mc";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q8NVd-0006UI-DB; Sun, 11 Jun 2023 12:01:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q8NUi-0005qx-49
 for qemu-arm@nongnu.org; Sun, 11 Jun 2023 12:00:50 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q8NUd-0000SA-34
 for qemu-arm@nongnu.org; Sun, 11 Jun 2023 12:00:43 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f738f579ceso25478295e9.3
 for <qemu-arm@nongnu.org>; Sun, 11 Jun 2023 09:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686499237; x=1689091237;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=EhniXz311o/2DcPgdcKAEpSrZXehm+PpvIlCx/ZyH40=;
 b=sSRGz/mcblbfikzBzOQ8d7UvGsbkzHXp7q6oeQ4EigRv2RlU+wf0/KO858BuyjkgXd
 iRmbrepMj0hzSkbKathdsCRD93S1hw/AT7YSV1TsyNDIzfEP7szVDDFDS1ATjsE6DuSm
 A3R+ClsSoUx2beMCbkGp3ykaJg6e9W+JDq2vk5awpcvxig4sYaPA4BsQ2LKSLoRcYNs8
 u/uIeiOyjnNS+h6tqHIjmYKWOWuqKRysttnLdVv/JwFFctcwxBGz67E93E7/PPy5GPO9
 Luw/0nJWRRKQpywl2dm9UJU0yjsjZrTcpwtyQsbiZFBXrCbCSUEZk1ke0nweIhPJcf72
 qIbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686499237; x=1689091237;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EhniXz311o/2DcPgdcKAEpSrZXehm+PpvIlCx/ZyH40=;
 b=bWP74kfGm3Z2r8C9mMWfbu3Pn7iE0sZN8Wfzg1U4g5oeyXvWqrxh5xGEOD86isKINJ
 MXeNR8ylWgvFZhtCdXNJTAAzT0jPX0DOcqRvz2KcPtKtZEbMwlAB3m/ZXGLke3KfcJJF
 IFD4CVga9oRys1U0SGMMRtujljWEOjayWqPem6x0Y8x+C8EaVzwjsLmS/Rh8rzOVW3NI
 f5udQCp4ETTwmF/N2w1mHNw90/m+mcyGiMOIWql4Q+IAQLs6k9MoI5naJ6SxsPVYf8Cf
 TAKpzjvUCR1vz5yLvTcQfrb6NYu81CXeI+MNal36PcRBvB97a6e+BKkYJbIEO8reDzmW
 k0+Q==
X-Gm-Message-State: AC+VfDz3BUhuBSTSkPBIqqTL3iWa5/XOIE5W++XDYWXbuR+XA1buxrbR
 Le+u0mtbQfs18E7nghzHJ7AmNSFYuTfVi6dLtss=
X-Received: by 2002:a05:600c:365a:b0:3f7:38e1:5e53 with SMTP id
 y26-20020a05600c365a00b003f738e15e53mr4991909wmq.4.1686499237724; 
 Sun, 11 Jun 2023 09:00:37 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 m9-20020a056000008900b0030ae499da59sm9923022wrx.111.2023.06.11.09.00.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jun 2023 09:00:37 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 07/23] target/arm: Convert CFINV,
 XAFLAG and AXFLAG to decodetree
Date: Sun, 11 Jun 2023 17:00:16 +0100
Message-Id: <20230611160032.274823-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230611160032.274823-1-peter.maydell@linaro.org>
References: <20230611160032.274823-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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
X-TUID: zVrXI1ljmqeu

Convert the CFINV, XAFLAG and AXFLAG insns to decodetree.
The old decoder handles these in handle_msr_i(), but
the architecture defines them as separate instructions
from MSR (immediate).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230602155223.2040685-5-peter.maydell@linaro.org
---
 target/arm/tcg/a64.decode      |  6 ++++
 target/arm/tcg/translate-a64.c | 53 +++++++++++++++++-----------------
 2 files changed, 32 insertions(+), 27 deletions(-)

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index b3608d38dc9..fd23fc3e0ff 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -188,3 +188,9 @@ CLREX           1101 0101 0000 0011 0011 ---- 010 11111
 DSB_DMB         1101 0101 0000 0011 0011 domain:2 types:2 10- 11111
 ISB             1101 0101 0000 0011 0011 ---- 110 11111
 SB              1101 0101 0000 0011 0011 0000 111 11111
+
+# PSTATE
+
+CFINV           1101 0101 0000 0 000 0100 0000 000 11111
+XAFLAG          1101 0101 0000 0 000 0100 0000 001 11111
+AXFLAG          1101 0101 0000 0 000 0100 0000 010 11111
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 088dfd8b1fd..c1b02b96183 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -1864,9 +1864,24 @@ static bool trans_SB(DisasContext *s, arg_SB *a)
     return true;
 }
 
-static void gen_xaflag(void)
+static bool trans_CFINV(DisasContext *s, arg_CFINV *a)
 {
-    TCGv_i32 z = tcg_temp_new_i32();
+    if (!dc_isar_feature(aa64_condm_4, s)) {
+        return false;
+    }
+    tcg_gen_xori_i32(cpu_CF, cpu_CF, 1);
+    return true;
+}
+
+static bool trans_XAFLAG(DisasContext *s, arg_XAFLAG *a)
+{
+    TCGv_i32 z;
+
+    if (!dc_isar_feature(aa64_condm_5, s)) {
+        return false;
+    }
+
+    z = tcg_temp_new_i32();
 
     tcg_gen_setcondi_i32(TCG_COND_EQ, z, cpu_ZF, 0);
 
@@ -1890,10 +1905,16 @@ static void gen_xaflag(void)
 
     /* C | Z */
     tcg_gen_or_i32(cpu_CF, cpu_CF, z);
+
+    return true;
 }
 
-static void gen_axflag(void)
+static bool trans_AXFLAG(DisasContext *s, arg_AXFLAG *a)
 {
+    if (!dc_isar_feature(aa64_condm_5, s)) {
+        return false;
+    }
+
     tcg_gen_sari_i32(cpu_VF, cpu_VF, 31);         /* V ? -1 : 0 */
     tcg_gen_andc_i32(cpu_CF, cpu_CF, cpu_VF);     /* C & !V */
 
@@ -1902,6 +1923,8 @@ static void gen_axflag(void)
 
     tcg_gen_movi_i32(cpu_NF, 0);
     tcg_gen_movi_i32(cpu_VF, 0);
+
+    return true;
 }
 
 /* MSR (immediate) - move immediate to processor state field */
@@ -1914,30 +1937,6 @@ static void handle_msr_i(DisasContext *s, uint32_t insn,
     s->base.is_jmp = DISAS_TOO_MANY;
 
     switch (op) {
-    case 0x00: /* CFINV */
-        if (crm != 0 || !dc_isar_feature(aa64_condm_4, s)) {
-            goto do_unallocated;
-        }
-        tcg_gen_xori_i32(cpu_CF, cpu_CF, 1);
-        s->base.is_jmp = DISAS_NEXT;
-        break;
-
-    case 0x01: /* XAFlag */
-        if (crm != 0 || !dc_isar_feature(aa64_condm_5, s)) {
-            goto do_unallocated;
-        }
-        gen_xaflag();
-        s->base.is_jmp = DISAS_NEXT;
-        break;
-
-    case 0x02: /* AXFlag */
-        if (crm != 0 || !dc_isar_feature(aa64_condm_5, s)) {
-            goto do_unallocated;
-        }
-        gen_axflag();
-        s->base.is_jmp = DISAS_NEXT;
-        break;
-
     case 0x03: /* UAO */
         if (!dc_isar_feature(aa64_uao, s) || s->current_el == 0) {
             goto do_unallocated;
-- 
2.34.1

