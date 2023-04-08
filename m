Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp650663ejb;
        Fri, 7 Apr 2023 19:49:48 -0700 (PDT)
X-Google-Smtp-Source: AKy350bVoPtFwoXlbd7lNhJvYaAXzNST7xQ6+GjApwwKYl8B240gfl9AY29OtKmjWQjlRgMAcJDF
X-Received: by 2002:a05:622a:1ba4:b0:3e6:970e:a406 with SMTP id bp36-20020a05622a1ba400b003e6970ea406mr2881551qtb.3.1680922188413;
        Fri, 07 Apr 2023 19:49:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680922188; cv=none;
        d=google.com; s=arc-20160816;
        b=0tsk8gppyxqFwe7MPJ/AHU7On44ZpcfOYbG63u/GtVcDFkthJpyvE2ndJPoyIQqiJJ
         3qVCm4e5bgR4Lce4VWB2O9fCpbLYxtQievWN4QG2l4f3lNP5CnwKuyPNINqhCktzQGH7
         otM6DdtyRYqvfzm1BDgz1SyGVGYvDDsmlpfevS4SblvYDRCXhSSOoLWhYI+k4Fm9xOPV
         iZ27uL7r9I/QeDgJmm4NSqqBLTJWgu0VMhGqx191Id6Dtdk1Xddxrf1IJL46FzeFEz30
         4PC9z9MLPjswFsrFrt6l0BHaYsryhwNO0IQhEcPVT2BcuX2FqkOZlgLEAnjeJ03jvRgs
         Bc5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=xHwCzrWrjIn4aTCJiRqtc9aUATfCI30+ZXph55J2XuY=;
        b=XkGn/PPINqVhvWONZHhufAYL4JltLZcJTPbtxNWAABZwe/euU2xilECIaIcSzM9YQi
         cPu/TG0YCf+P0WiMwH7HWqI45O0ROzE9hvp7Say//0dA15GKI0UrRFsm7daIq/yhQLC8
         uJffdbxfhb8QCBZgCHdfwjRypjxeL9EXS6DpHzONUw7kg1QoVB/H9Swfg04962BX8p5e
         1E6QhxLxYE/9tMSwiUcllBMc4IJ1eJOsaChw/D/rOHUXMQNxnnmmkVCWP9o17WwjGk98
         E/enZNPrC2DtvP8CHRx/ea2WZJyPgnACodgcKT/0wY1T6RZRNV3KRGtANP/ZrK0Z/vys
         2BRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rbnmPVRI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w22-20020a05622a135600b003ba10333aa9si3829132qtk.522.2023.04.07.19.49.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Apr 2023 19:49:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rbnmPVRI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkyYr-00086e-GB; Fri, 07 Apr 2023 22:44:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyYo-00082C-5I
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 22:44:14 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyYI-0005XC-Ue
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 22:44:13 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 d22-20020a17090a111600b0023d1b009f52so2769605pja.2
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 19:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680921822;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xHwCzrWrjIn4aTCJiRqtc9aUATfCI30+ZXph55J2XuY=;
 b=rbnmPVRIZ/bZxKYCnI476FDVMdNONDO7jTioSCjCKdJ0qeyAni86VwohJFRA0hQDTt
 0LqUVAU/D1w1llI4kDOCpzVFY+4MBG0/GfUOwJjby66QEW2gO8n38lYNZlYKeAk8ESHB
 MSpogYUzah64ec4zyrf5NgWHVTP8xjBN3BV+xKIfBEx9QXHXWWQZOf1Q+BLIk+lu4O0T
 HtcEGWcjiDXf99mcD43kl/5IyEf51XD4OdcrBrMGES45B04Yg5IJ0fyCOisjNwbyLKHk
 UPzU6yCbRVsCZBaa0X5vldrp93ygfpWpf5YV23KnQOPq7p5MHYA8TnfPbqASdXOsn/sQ
 HQWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680921822;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xHwCzrWrjIn4aTCJiRqtc9aUATfCI30+ZXph55J2XuY=;
 b=rGRGaLLu04hcM2zire7Y1VIpoHZ+yzAi+sItZHlhjICshQ540m5VeNFWG0/8RQZ94y
 9fvkB31dlTpci7JbpmU7YUEJbnio46lA3WCc8Z8XloZbwD8+8QUHfF+GaXypDYtbrVAa
 eoRCeoraGu3tJsSGd9y6dXt+T6lkkgWmfsqmVB7XQI6QW7BrWv1SHFMIUM6lG5iYLmsv
 bTD8jyERCOqXs3mM08TOC+qzVqboDTP93l+OSQ/bStFyhoAJUkpddvdspbHTZBcv3EAT
 gvszd2pXk/vJiHF1fv3/MCndzfn2uD/FZF+k+Z18cGD2YXf0vSWrDDam6vdMjezmhJdP
 fbKA==
X-Gm-Message-State: AAQBX9eX1fc0BkxTBrIsc73zdm8uUuIe4e9IQaQ2z6/nXglCcfjj1m1+
 d+F/bTyv6Fr7u9XpzyPS5QQDDIEY6AEVnNgZGXk=
X-Received: by 2002:a17:903:2347:b0:1a2:a298:6f65 with SMTP id
 c7-20020a170903234700b001a2a2986f65mr5875721plh.2.1680921822089; 
 Fri, 07 Apr 2023 19:43:42 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a170902c18900b0019d397b0f18sm3530780pld.214.2023.04.07.19.43.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 19:43:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH 29/42] tcg: Move TCGLabelQemuLdst to tcg.c
Date: Fri,  7 Apr 2023 19:43:01 -0700
Message-Id: <20230408024314.3357414-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230408024314.3357414-1-richard.henderson@linaro.org>
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 2zlaiE9AQA3T

This will shortly be used by sparc64 without also using
TCG_TARGET_NEED_LDST_LABELS.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c          | 13 +++++++++++++
 tcg/tcg-ldst.c.inc | 14 --------------
 2 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 1c11f15bce..647af6c210 100644
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

