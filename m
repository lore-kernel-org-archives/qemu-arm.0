Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp51214lfm;
        Thu, 25 Jun 2020 20:38:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzp8YyJlp2Il6NKBtidCGy1JGx9Y67ikSqcH4wbEj2/Fc/OgDYZOGMu7VF7S8HHQng14Ez3
X-Received: by 2002:a25:ba81:: with SMTP id s1mr1780376ybg.386.1593142727138;
        Thu, 25 Jun 2020 20:38:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593142727; cv=none;
        d=google.com; s=arc-20160816;
        b=OBU+sovefknIQfTiXwryKWtRnnm4HdbuitkEa6P6gM/plc6JfKGm1QTD6/rStXzFKb
         Gx+GIKnObJrff8z7MqSg4MPChpyea//i6/6RZsFI+Szpd47SI6dEj4cOLwn2Mnn0KP+S
         7JNDjigLfa5iUgfS7qD28kxWPky+9tiC4IQ+/5nIyFqZZranuyZGIFT6GxOy7ZdlX4V9
         rKAIvRPOABQnHFQKOSq6dYcyR+YozqkYG+0kjF7Szjry9s6SvrlWDq31/ir1xfNOtaGs
         zLiTcPVa0Agn8Rpl6LHfjb771/Thd+lGZ28RLm4mYV5npPhzjcPIN3A6xFzU7yaCX6cU
         pJeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=qDKnE6CQ1+e8GKFB2CRQQ8tPHOtJCQQxxuNXqwNntCM=;
        b=XYrvHNQYbwPiMKAk7roLo/AvDFS8lfBIev2gDU3Ia/UOkUwY0oOIdi88NTp4y+CNQl
         dVjzWhryOmiwPfORmDP011oDbZlHQuirBvHrKwxnIfZyLRHoewkcVGhxg6JABtgvf/E7
         82A2VVQoOFGIKktJDQPUh0PHUbCElsGmVMOIqKhPaRJ+sCJ+9uKN7gueQigB7i3PvSg/
         tEz06zLwcHCLfnyVeuDUaA1FOg047NAEyHuTsaiwx6M6nDhJ/jxTuWS7hHvOrVK2+XwW
         TefSrGvk3TnzbQfFenR6omFSxTUWP2DN2UZ8DBCUcTcVkE1G/MiixrA4GNNmJ3NF20I7
         u0Fw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jaGMFLVA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t7si25429339ybl.92.2020.06.25.20.38.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 20:38:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jaGMFLVA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jofCQ-00046g-GR
	for alex.bennee@linaro.org; Thu, 25 Jun 2020 23:38:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jof64-0008Rb-9Z
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 23:32:12 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:44935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jof62-0001sA-4R
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 23:32:11 -0400
Received: by mail-pl1-x643.google.com with SMTP id bh7so3744176plb.11
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2020 20:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qDKnE6CQ1+e8GKFB2CRQQ8tPHOtJCQQxxuNXqwNntCM=;
 b=jaGMFLVAxbTIUtc6DIUX+CwzqFpY7FZhyGacm7ZN3yS+gMkFSyJYEhS+52R+8jAiPi
 ieo2zrRz1HajivQxqxLC2Himl9evv7EOszoFBSM8HSozUAgrs2IxVDBc6Zy5EOrM8a85
 WtU0SD8d6noD4T6qwWYg6R6gWLpUrgDD6AqQvFiVQCVPBzSrIYVrtxaKXmyeWa66Rr6i
 WN+uUWFPMlNLEGLf1sVHhuQGs6DrDlsPRUTw3tuL+mFkXn3Jk8BZ0eiCFHUMFFjPPHQa
 baG9JhGew9Ln7YhKzmPpRrjUt1Tz6Wz1prENJMbmoyV0de+VYHMIcxtbv3HEQ2iVjVOS
 F1PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qDKnE6CQ1+e8GKFB2CRQQ8tPHOtJCQQxxuNXqwNntCM=;
 b=fi4GLRGyfj+NydrjGlAB+AzUFKaoA8+EOjNn2q8dtK8Vv4nfkgbMlthced1+thmoUV
 tZDCKRKNeySR3BpuwX/g7PgzEvq4YqVhqkX9CEMr+ffXLKu5vPeSSGOLGN86C3AA3AhL
 RBxIm2nHpZSBF1tj6ru1pHFZGam+6xj1C1uipVZ4SkGh7HdB8GqjwwPg320DYjSAd5KF
 l/9x3ARuCWgdmc34FWNv0AhkKzl68/Fzb8vpKXVhx40JJDaH7PDslkhFFgaNAbIj85b+
 9HGdfCeMRkseQ756VFFWgo9kOKdeC8mA9M58SMhpfaZgFwcB5Drmgbhb+rjIiDB6WkkE
 WGgw==
X-Gm-Message-State: AOAM530QIBvuOmsEJ8v7DPwfJzXowZ4z/G4EoAkG4YYscEvlhjC5eafl
 JnPXqVcn5XhFrrnSEdeu6itQAA==
X-Received: by 2002:a17:90a:e983:: with SMTP id
 v3mr1165562pjy.71.1593142328916; 
 Thu, 25 Jun 2020 20:32:08 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id y27sm1605256pgc.56.2020.06.25.20.32.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2020 20:32:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 17/46] target/arm: Restrict the values of DCZID.BS under TCG
Date: Thu, 25 Jun 2020 20:31:15 -0700
Message-Id: <20200626033144.790098-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200626033144.790098-1-richard.henderson@linaro.org>
References: <20200626033144.790098-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, david.spickett@linaro.org,
 steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0pOBu4jBV2an

We can simplify our DC_ZVA if we recognize that the largest BS
that we actually use in system mode is 64.  Let us just assert
that it fits within TARGET_PAGE_SIZE.

For DC_GVA and STZGM, we want to be able to write whole bytes
of tag memory, so assert that BS is >= 2 * TAG_GRANULE, or 32.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index d9b8ec791e..d9876337c0 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1758,6 +1758,30 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
     }
 #endif
 
+    if (tcg_enabled()) {
+        int dcz_blocklen = 4 << cpu->dcz_blocksize;
+
+        /*
+         * We only support DCZ blocklen that fits on one page.
+         *
+         * Architectually this is always true.  However TARGET_PAGE_SIZE
+         * is variable and, for compatibility with -machine virt-2.7,
+         * is only 1KiB, as an artifact of legacy ARMv5 subpage support.
+         * But even then, while the largest architectural DCZ blocklen
+         * is 2KiB, no cpu actually uses such a large blocklen.
+         */
+        assert(dcz_blocklen <= TARGET_PAGE_SIZE);
+
+        /*
+         * We only support DCZ blocksize >= 2*TAG_GRANULE, which is to say
+         * both nibbles of each byte storing tag data may be written at once.
+         * Since TAG_GRANULE is 16, this means that blocklen must be >= 32.
+         */
+        if (cpu_isar_feature(aa64_mte, cpu)) {
+            assert(dcz_blocklen >= 2 * TAG_GRANULE);
+        }
+    }
+
     qemu_init_vcpu(cs);
     cpu_reset(cs);
 
-- 
2.25.1

