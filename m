Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp2076962lfc;
        Thu, 4 Jun 2020 21:26:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPfNY6OsqEn762mFuatXeulg8aZuvf8syqKK6/0OpN6dCTq0ScEkyS1DNjU4xGi0ZWFhvd
X-Received: by 2002:a25:ba8d:: with SMTP id s13mr13131813ybg.123.1591331198113;
        Thu, 04 Jun 2020 21:26:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591331198; cv=none;
        d=google.com; s=arc-20160816;
        b=KSCGi8XbzvULDoqiDlbHH+fOUJqzEkRvSSuEVwr7ZacHx8I5Vl1sUfRZHAr5yf3dgF
         qG503xtW7QOn37ChAR1q4MByklDjIlgOudzK3CvpH0PEBKQXBBXZFKYRnAMiln01PzKS
         TF/v53NQrqJi5DefU2oKPCv+IRRIqWNxrzYE79hNpf2aEf/sOgN2d56ODn6YNn/f++ok
         ECo82vosFBm/hmTUjV2K9lXqCkVywq3v/GgFT8o+PJr5DvhAsfZRXyPecz679Lki5+vG
         U4qPAjDzgWloGgM4SA9sFKL2YMjQV8N87cBxleKsr7yK2hH6dMePuCKvMagf/FJX0qAT
         8Kqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=7wl+QdYCs/b+nFYwpri9epwwg1rNtdW9XylmaArLSo0=;
        b=HXMZHJKfcG9J5nSgsIVvMOkHdgo7teIFEsPDuOtO5U5WFIkMrQ6f9MHvb8PzYOHEME
         2eupmcCpiWfg0XF0fxVmUSS36Mpe4BiefgAkkStgGiODlQyay4mLOOFY4SMWzLIxTQhn
         WrX5/BStk0aEcbTdtY+bw/4tXQFrEBrJlK9RBe8IV5ueEgnfahvaZKOYJ6kIN/w0hcHC
         FUDkJcXMGtY7KujMsFQ6dtPHjBeENyMwPTsjZUstbau0Qik8L2JZ6CS5wc+HSEg2OasX
         HwprFQRfqzRr987NWnyC8enfeS3/oUwH8P4qTSKPS6EFcMGX3L4U6XN/pHjrkNvY4JQw
         Ui4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cQxyorMA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a3si5825225ybo.142.2020.06.04.21.26.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jun 2020 21:26:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cQxyorMA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jh3wD-0004Os-GJ
	for alex.bennee@linaro.org; Fri, 05 Jun 2020 00:26:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jh3nq-0004oF-9Y
 for qemu-arm@nongnu.org; Fri, 05 Jun 2020 00:17:58 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:46979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jh3np-0000mq-2l
 for qemu-arm@nongnu.org; Fri, 05 Jun 2020 00:17:58 -0400
Received: by mail-pl1-x641.google.com with SMTP id n2so3098751pld.13
 for <qemu-arm@nongnu.org>; Thu, 04 Jun 2020 21:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7wl+QdYCs/b+nFYwpri9epwwg1rNtdW9XylmaArLSo0=;
 b=cQxyorMAU8+1QNUYtQhzCFjW1u4xVBdmi2WxWjOAJHTlfkkzJqHvbU+HiDOohvwOct
 e+nHWOqSpnXOeSORC61ph8dLA+DlEfTX2XTz9avKNWGdeWkLdhfu5H64IT6WDwgJuKU8
 3Kt5tIqD02fpdHx01TvZsQxPqhatIuQ+zjeGY3tjJ0TNN6nRI8uEK6ILwfyY0K1fx4JT
 cQ3Ht7PTuTQ9e4758AgWQHAJ83Wd8wfLvskxcvx05UD16kLKst9RFLGtAlPJH5ODt1y9
 sSErkbnQke6zY/FGpNwFcozrocgt608PdQdbqacubq5PkwglvMUtxTfWgOiY5z8rS4X9
 e6HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7wl+QdYCs/b+nFYwpri9epwwg1rNtdW9XylmaArLSo0=;
 b=oULb4Ox/84JwYRr2PpY+fnutD/xNOnCwzFJP/poXDPvLO92WYgDjKU4HvyBK1DFdTr
 PFz7QG7R8FI52mn9tzXvJcwDIoWgZoRnQvSuPZCXkyQ89ec6XTxVHkYGJh4Gc9Hft8Ta
 YC/+70PkS5d09ty4KVSFWGcyhmsfQ4bYieD+kaA6PaRtvrC+rvM5LrLcJ99vRu+Zd2u3
 v53sUoGruho8jR3Emz5Mq7Rg8BhRuWEq/nE+SFfr1HeW2WRdX5LyGOdsoS1Fqqeo/1cJ
 oxS3HPRqLkyVdbWX/ympm9i2CFTqU+L9yTNKMTV781NSF0eH9Jfl+AvxcAPjOBUJVgzp
 67UA==
X-Gm-Message-State: AOAM5311eqEIBKZCSHbplES2BhNNL+AyAGxJG7AOrSvPkOi08P4YK1Y7
 OW0S+tt9x0B/lk55pKDpkByLkA==
X-Received: by 2002:a17:902:b603:: with SMTP id b3mr8153031pls.1.1591330675623; 
 Thu, 04 Jun 2020 21:17:55 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id h15sm5440902pgl.12.2020.06.04.21.17.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2020 21:17:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 16/17] target/arm: Enable MTE for user-only
Date: Thu,  4 Jun 2020 21:17:32 -0700
Message-Id: <20200605041733.415188-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200605041733.415188-1-richard.henderson@linaro.org>
References: <20200605041733.415188-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vJo7se4aDJmU

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 37b7cc2c9c..6395918524 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -39,6 +39,7 @@
 #include "kvm_arm.h"
 #include "disas/capstone.h"
 #include "fpu/softfloat.h"
+#include "qemu/guest-random.h"
 
 static void arm_cpu_set_pc(CPUState *cs, vaddr value)
 {
@@ -191,6 +192,22 @@ static void arm_cpu_reset(DeviceState *dev)
         /* Enable all PAC keys.  */
         env->cp15.sctlr_el[1] |= (SCTLR_EnIA | SCTLR_EnIB |
                                   SCTLR_EnDA | SCTLR_EnDB);
+        /* Enable MTE */
+        if (cpu_isar_feature(aa64_mte, cpu)) {
+            /* Enable tag access, but leave TCF0 as No Effect (0). */
+            env->cp15.sctlr_el[1] |= SCTLR_ATA0;
+            /*
+             * Exclude all tags, so that tag 0 is always used.
+             * This corresponds to Linux current->thread.gcr_incl = 0.
+             */
+            env->cp15.gcr_el1 = 0xffff;
+            /* If RGSR == 0, NextRandomTagBit will always produce 0.  */
+            do {
+                qemu_guest_getrandom_nofail(&env->cp15.rgsr_el1,
+                                            sizeof(env->cp15.rgsr_el1));
+                env->cp15.rgsr_el1 &= 0xffff0fu;
+            } while (env->cp15.rgsr_el1 == 0);
+        }
         /* and to the FP/Neon instructions */
         env->cp15.cpacr_el1 = deposit64(env->cp15.cpacr_el1, 20, 2, 3);
         /* and to the SVE instructions */
-- 
2.25.1

