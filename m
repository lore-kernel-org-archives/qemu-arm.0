Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp680001lfi;
        Sat, 28 Mar 2020 07:03:55 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsYbFHS0Q8Dw892+ii18v9D7CuHuzoAiPlI+JrF/nZL+yqv0voZKGSXa5zyU/gJ6nJP/zrP
X-Received: by 2002:ad4:58b3:: with SMTP id ea19mr4126226qvb.8.1585404234817;
        Sat, 28 Mar 2020 07:03:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585404234; cv=none;
        d=google.com; s=arc-20160816;
        b=E4fERZJq4jVde6P6wCHlpRFy/ir4528oZufGAk0X+Vbhg2MB4xRlGTsUMa7nvK7ycr
         164GtJBd/QDoDJQPDElquz3I0U6/olmME9m39qKlomwX/dd7dm2siLgI7GvgfrZZIrg6
         jvhdlxxMjmOyYHaTKS4nsgTnbemmtuUgmPA1fe8dqN71XNfli9dbJ5f9vAdbOlBqMAF4
         cKi9G4lMm4DXBoXXHD5SMozAO/Zf670uLS0hZdZXywfi3NI5aEq95lamxdlXNYR6r11i
         f2w5eCBM+H4OA2ioZoMhmWn7e2lTBNetcuVhpu28lsvECphYRWZUda81p1PxXT4DSUVt
         WVYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=J4NbX63enxz8LHoh8wHu1+3eT2IUoLyMTy2RULZE4I4=;
        b=XYOY3pwYgtis7efikCCO4RngjCWOcBeb+dKPwPiJcbuVbb57CS4zK5J95EqERP+6FX
         Hy6/xQykRRhYCUzCdAAVa46OD61NRwmAu7AQKFDFng604KUCtAVkUlqBdYXRTXm5dHwz
         Uw7va4c9QJDdhCCTDmklz3DE2548OXL9JmGOxWBJvdKTc5P4iZAzkGQNgO48ZdANzjXr
         OGv13tuPc/KI+x+DSaarVzBKxNbJPo06W1ahkUc75jUbvAvDsUC7sBxwOlG8zw29BmXu
         4HnZmm6gLJ7P3lduvKrYY/7KM856O6GY35XSbi2cC0T0e+61HSnJWgmFBZ6UetZP6WtT
         TrEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=B6GaNvBZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r48si5306295qtj.317.2020.03.28.07.03.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 28 Mar 2020 07:03:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=B6GaNvBZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jIC42-0000VW-9o
	for alex.bennee@linaro.org; Sat, 28 Mar 2020 10:03:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59970)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <changbin.du@gmail.com>) id 1jIC3A-0008Vl-6l
 for qemu-devel@nongnu.org; Sat, 28 Mar 2020 10:03:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <changbin.du@gmail.com>) id 1jIC39-0002Ai-6R
 for qemu-devel@nongnu.org; Sat, 28 Mar 2020 10:03:00 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:39975)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <changbin.du@gmail.com>)
 id 1jIC37-0002A2-4e; Sat, 28 Mar 2020 10:02:57 -0400
Received: by mail-pl1-x642.google.com with SMTP id h11so4616221plk.7;
 Sat, 28 Mar 2020 07:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J4NbX63enxz8LHoh8wHu1+3eT2IUoLyMTy2RULZE4I4=;
 b=B6GaNvBZNP7kQEbX3iGRK2z8wcsPa7xthpN3NwQBPk1qjZZa8im7DxofvOsMhU8GB6
 g4K4rFncw3jCY4ZkmtpRysftgdTgG/InPMPis49J5f+bW5p8fIegEYAf+8k2GUVaSW8X
 XCMty4w5D25gfH48ZsR2UxDbmp5Yfn+5+bSbp3XFQkNAcSa/LCY54ZwF/VyqPnaEXkf8
 u4KD5TjPigvJQazQe4sAEe7M82bgI00hrXdgxsbJETGnBnF5kKjsVSrqdAeX5k3IBM90
 UTQo246Ae/GP45/IK9ralxq8c2Gks4p0bR/IeVBo9TlLuLycy5EM6UCX6TxkSJmLOvw9
 uYMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J4NbX63enxz8LHoh8wHu1+3eT2IUoLyMTy2RULZE4I4=;
 b=B8/VAvVgP5Re1Nk3G6ni2i2Job5nMK3K5JNJ5mKKcnIc4X91qSfBnoiWMVslz/V8MU
 Jp3ChwIlmHUqPdXcrTD23v9yaMRCyCKGWcZc3MH0Vz+fT+r5nVYrLPpEStWZJPCQMEz8
 xTwaNSkq+GwzxSRBqxuOg5VdljwQbSNuWZbXM5aTBtXD7fPBDVUW9pe14QZFXDo9uUFT
 MPklISkp2xgA0BpTI/amoM4NB0oOdryThkDGtDPVFJPsuGXJLke0B9IIr4RaUqSbgz4V
 MhaYe/5tATFf67z//3e6BgF8tLixkGn40EEdeF9yRoVhAvn4/84CicmL4UCn+fol+22X
 CKAA==
X-Gm-Message-State: ANhLgQ2Sl2tBbS3gVCuTHoMAaMudwx761DaGP9xnWSYomUCZfpUDfkbp
 LoXEPUBydteqTiT0lt7VZNo=
X-Received: by 2002:a17:90b:24f:: with SMTP id
 fz15mr5085224pjb.138.1585404174316; 
 Sat, 28 Mar 2020 07:02:54 -0700 (PDT)
Received: from vultr.guest ([149.248.10.52])
 by smtp.gmail.com with ESMTPSA id i14sm5978258pgh.47.2020.03.28.07.02.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Mar 2020 07:02:53 -0700 (PDT)
From: Changbin Du <changbin.du@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH] target/arm: fix incorrect current EL bug in aarch32 exception
 emulation
Date: Sat, 28 Mar 2020 22:02:32 +0800
Message-Id: <20200328140232.17278-1-changbin.du@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Changbin Du <changbin.du@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: N9kXd3wCrilq

The arm_current_el() should be invoked after mode switching. Otherwise, we
get a wrong current EL value, since current EL is also determined by
current mode.

Fixes: 4a2696c0d4 ("target/arm: Set PAN bit as required on exception entry")
Signed-off-by: Changbin Du <changbin.du@gmail.com>
---
 target/arm/helper.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index b7b6887241..163c91a1cc 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9172,7 +9172,6 @@ static void take_aarch32_exception(CPUARMState *env, int new_mode,
 
     /* Change the CPU state so as to actually take the exception. */
     switch_mode(env, new_mode);
-    new_el = arm_current_el(env);
 
     /*
      * For exceptions taken to AArch32 we must clear the SS bit in both
@@ -9184,6 +9183,10 @@ static void take_aarch32_exception(CPUARMState *env, int new_mode,
     env->condexec_bits = 0;
     /* Switch to the new mode, and to the correct instruction set.  */
     env->uncached_cpsr = (env->uncached_cpsr & ~CPSR_M) | new_mode;
+
+    /* This must be after mode switching. */
+    new_el = arm_current_el(env);
+
     /* Set new mode endianness */
     env->uncached_cpsr &= ~CPSR_E;
     if (env->cp15.sctlr_el[new_el] & SCTLR_EE) {
-- 
2.25.1

