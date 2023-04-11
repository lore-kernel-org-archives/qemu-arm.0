Received: by 2002:a17:907:2c4d:b0:94e:1233:1117 with SMTP id hf13csp183702ejc;
        Mon, 10 Apr 2023 18:08:03 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZSk+3DFHQi3NcbxlVO6U5XPvSIAvHWvbaaDE419hwgZiVxzKOttiGpZcmvTRCgJ+3YBW4X
X-Received: by 2002:a05:622a:1803:b0:3e6:4b7b:254 with SMTP id t3-20020a05622a180300b003e64b7b0254mr14267450qtc.25.1681175283412;
        Mon, 10 Apr 2023 18:08:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681175283; cv=none;
        d=google.com; s=arc-20160816;
        b=bgK6+bzXqlWAY1rqGEviM7M5jx1y0eKAacR6WjsIeWhj8/D+eYSRW5Ph2zHWBMf9Lj
         HGkY9mbFOKWK5rDvlBWOyHAdTnuwNRe8OudQ5cdxi21mYLGzCMAZR7pSKrIQAGVVgOKp
         JxgeL2URN7tO6KMyGTUm8yI+zFR/ULrTXoQu8k9vFV3P3tzhPjciYiWwdUsTA6zidy8W
         1FQZfISt3Uwefz48IV7OllNPCpE9UuxJSiseSqGUiyWZ+f97iyKc/AMmyr18Lu1vpPbc
         W8YiNJJo3WbhDBs0SDxJDkwdTQLWyH3gTX/tdIOuIa4Wee9XdvUQQI/A3acJWNQGM/Dy
         XDCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+UEhKa6Kyo4j3o7ZlobQD32dbnUlsNBQxIzZtf9c8vU=;
        b=w9cuqEnxcWcBcGABBWuIbHS2OhVTyhSYmULBmb0rhVuHSy0u4gCWOwDBUI/Y/nDFXB
         c4CB5LlASiMp5ymkQuH3aM4dknFApSMlemfl3AsP3QPglUBbHorGTpLHoPyCXluijqLv
         72DegwqFMvpt4DF+ox2TQ5trdxgQf4HZoPzDXm1Hk+cmQoQBeJ6zMkkb8QBl3EhdgjTO
         nMKpXAqIl12ZZP2HGr1FCL+C/DPhHNIxBSEojLMaDU5y7EYhg6AyH2Sf84fkfO4pE8Lm
         42tkzHdGpK2fUKDVKNYdnAHrHVENUOyousSjxeAAbSl/J7TGQFwWX5wdMGbMLSdM2XNH
         tFXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xQUW+pmp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n14-20020ac85b4e000000b003e18051efdbsi8292678qtw.671.2023.04.10.18.08.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Apr 2023 18:08:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xQUW+pmp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pm2T9-000660-4h; Mon, 10 Apr 2023 21:06:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2T6-00061v-Vi
 for qemu-arm@nongnu.org; Mon, 10 Apr 2023 21:06:45 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2T4-0000c5-JR
 for qemu-arm@nongnu.org; Mon, 10 Apr 2023 21:06:44 -0400
Received: by mail-pj1-x102d.google.com with SMTP id g3so7597777pja.2
 for <qemu-arm@nongnu.org>; Mon, 10 Apr 2023 18:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681175201;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+UEhKa6Kyo4j3o7ZlobQD32dbnUlsNBQxIzZtf9c8vU=;
 b=xQUW+pmp+bbkv9dsnFMd2/rpWlEZ+nQ2OK5YZMmwmm3UrVMW9zSHaUnEJvbgObbgxw
 FtAzx4V3ABnt4/lg85Y9STzcGMU2OoYF7mxSPzpTb43yFIHiRCz9id79M9a26l/XfY8H
 mM52ZTDoEdbZeMnf7ByqaRpnFQV9mejLmGtbZHXgAf80jOQFEF8Y0seU4we4AolxpIB4
 aJ2WZGjonPDM2RACBa0hsJya+8GxGy275Baa3Wr7mL25R3wHMjTJCeFZUhfA0hzDSq+y
 DzNrd/O3+w6LGWTLmIK6JPN4q1fs5sjCILA7PlJVkejbctgE4VMlJuRdilo+96JPIW+d
 v05A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681175201;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+UEhKa6Kyo4j3o7ZlobQD32dbnUlsNBQxIzZtf9c8vU=;
 b=VOoNT2pu+zTELzJLvwGEJccBuvh2pPa2QGUaMSvIS9DwAYIBlbpZuwWk2tmuvBWIpL
 irz6JEU/xH4AuoHEZ6xM0bXyvE6yrpj/+vmHXmWX2Dxz+K7aDg/bhVO7meXqRqise1hV
 wmIQu2FwFwr+Dk0hRGTKgIVnFUOFoTP4NjRNASmq6ULPb+4BQyGvVga0JJbzFZYMa6mL
 4R99DCxnQBqp16RhnfSH9i6huZULPfa33Wk/7H2pB5+wtk6hgpFTPHLubqODpbaVMmZP
 61kpI44NbjX5CdkgDfkfY0ayGxHxXrV2zns5kFnj4LlFJCtDIOlfDY4gbMx1GMu4sZ+J
 MDrA==
X-Gm-Message-State: AAQBX9eN9twJrp65lfWgukXftLiwiG08eB/HFO3l1bgmi2eQAHCNnOPj
 yka5y5+5NnNle3r1krbxytuslQ==
X-Received: by 2002:a05:6a20:17aa:b0:d8:decb:3419 with SMTP id
 bl42-20020a056a2017aa00b000d8decb3419mr8955926pzb.40.1681175201698; 
 Mon, 10 Apr 2023 18:06:41 -0700 (PDT)
Received: from stoup.WiFi.IPv4InfoBelow
 (h146.238.133.40.static.ip.windstream.net. [40.133.238.146])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a65690a000000b0051b0e564963sm1320291pgq.49.2023.04.10.18.06.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 18:06:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 31/54] tcg: Move TCGLabelQemuLdst to tcg.c
Date: Mon, 10 Apr 2023 18:04:49 -0700
Message-Id: <20230411010512.5375-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230411010512.5375-1-richard.henderson@linaro.org>
References: <20230411010512.5375-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: qXukawfCn4qA

This will shortly be used by sparc64 without also using
TCG_TARGET_NEED_LDST_LABELS.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c          | 13 +++++++++++++
 tcg/tcg-ldst.c.inc | 14 --------------
 2 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index cfd3262a4a..6f5daaee5f 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -94,6 +94,19 @@ typedef struct QEMU_PACKED {
     DebugFrameFDEHeader fde;
 } DebugFrameHeader;
 
+typedef struct TCGLabelQemuLdst {
+    bool is_ld;             /* qemu_ld: true, qemu_st: false */
+    MemOpIdx oi;
+    TCGType type;           /* result type of a load */
+    TCGReg addrlo_reg;      /* reg index for low word of guest virtual addr */
+    TCGReg addrhi_reg;      /* reg index for high word of guest virtual addr */
+    TCGReg datalo_reg;      /* reg index for low word to be loaded or stored */
+    TCGReg datahi_reg;      /* reg index for high word to be loaded or stored */
+    const tcg_insn_unit *raddr;   /* addr of the next IR of qemu_ld/st IR */
+    tcg_insn_unit *label_ptr[2]; /* label pointers to be updated */
+    QSIMPLEQ_ENTRY(TCGLabelQemuLdst) next;
+} TCGLabelQemuLdst;
+
 static void tcg_register_jit_int(const void *buf, size_t size,
                                  const void *debug_frame,
                                  size_t debug_frame_size)
diff --git a/tcg/tcg-ldst.c.inc b/tcg/tcg-ldst.c.inc
index 403cbb0f06..ffada04af0 100644
--- a/tcg/tcg-ldst.c.inc
+++ b/tcg/tcg-ldst.c.inc
@@ -20,20 +20,6 @@
  * THE SOFTWARE.
  */
 
-typedef struct TCGLabelQemuLdst {
-    bool is_ld;             /* qemu_ld: true, qemu_st: false */
-    MemOpIdx oi;
-    TCGType type;           /* result type of a load */
-    TCGReg addrlo_reg;      /* reg index for low word of guest virtual addr */
-    TCGReg addrhi_reg;      /* reg index for high word of guest virtual addr */
-    TCGReg datalo_reg;      /* reg index for low word to be loaded or stored */
-    TCGReg datahi_reg;      /* reg index for high word to be loaded or stored */
-    const tcg_insn_unit *raddr;   /* addr of the next IR of qemu_ld/st IR */
-    tcg_insn_unit *label_ptr[2]; /* label pointers to be updated */
-    QSIMPLEQ_ENTRY(TCGLabelQemuLdst) next;
-} TCGLabelQemuLdst;
-
-
 /*
  * Generate TB finalization at the end of block
  */
-- 
2.34.1

