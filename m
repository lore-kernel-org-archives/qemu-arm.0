Received: by 2002:a17:906:4a55:b0:9d0:bf65:29fa with SMTP id a21csp273754ejv;
        Tue, 7 Nov 2023 04:26:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IED9t6IFr+U6f1N1x8CkEn+l7vXBDtLyLVba/MXJ2CwxrL/6zW+GnAhD4kPR2FFPKV4qczw
X-Received: by 2002:ad4:5c4d:0:b0:672:131e:4e9 with SMTP id a13-20020ad45c4d000000b00672131e04e9mr3286141qva.6.1699360008580;
        Tue, 07 Nov 2023 04:26:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699360008; cv=none;
        d=google.com; s=arc-20160816;
        b=xRMybDtigM9XY51M9Pnb38Lb9wn4LmjGX1Tq+fmpv6PvTyMtMMYT2ma7ILYFELXp8z
         arvll78PaoTEIFzGsc7Cvygel3AOn7qbjQRlTx/Yor4O6XUctvWx2yhB8Ai9qLCYsQcn
         BI1NKP0BqnehmCjbZsG3Wt0SGoD86raa51P6BsEdR05XDP9OWNeQ23d+awRVOtiMEQ/2
         D6KRtDX8spXCkBGI7iCqpe4dL1p1N4Ci/LqWPPf2gC/0c99eSNu0IDCLWlpuqZbOiN1T
         /RAE9Nc9YGAw3+M9SvS2k8Pdl6e5S7YBFQ1vj0PalfJm6JYeUckU2xBByO22U+jtjv7I
         g4ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=xQIx7Qo+vYb4U5X/jCWdqru6+jgyWVX+HEchvZf2EPw=;
        fh=zqCJK/GNKinD327RpwX+nzDujFsGQ+TAosBHb+QbdKo=;
        b=Q5Bx/y8PGcF+C8fUzxp2I8Loo+I7j9ivZte0HtcUXDezKRZZaW/ab1+Pdz4gBHicpC
         nXh863QDjQ76NgBcuY+XdkDTtVT+TdU+8VNae6gE7mlcaE8SQc3/T6c9tglR84mg2MqY
         roikT8f+YGLQ2ex0L2uNhRzWjGmYmw/tbc9BpvzM3q3YOm9JTb/m9QyE/s62vUVb1uG0
         aA3hOK7Q4R7DGFNHGjTQ1fdaBebc0+0ZtBNlhp0XUUQ2shh+MoHCA8dCCnwel7AhibdG
         W+JoLs3d9pWEsSWVLYEkfxScc0njTOWq07WC6p/+TKSGRU+zHmklLkeMwWrDffGy21eb
         eTVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=crFDbXpt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k4-20020a05621414e400b0066fccf78aa6si7122913qvw.543.2023.11.07.04.26.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Nov 2023 04:26:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=crFDbXpt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r0L8s-0005Lu-Jf; Tue, 07 Nov 2023 07:25:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r0L8o-0005Go-J9
 for qemu-devel@nongnu.org; Tue, 07 Nov 2023 07:25:10 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r0L8Z-0004f9-PP
 for qemu-devel@nongnu.org; Tue, 07 Nov 2023 07:25:09 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4084095722aso42504355e9.1
 for <qemu-devel@nongnu.org>; Tue, 07 Nov 2023 04:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699359891; x=1699964691; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xQIx7Qo+vYb4U5X/jCWdqru6+jgyWVX+HEchvZf2EPw=;
 b=crFDbXptn9AogKys/42RfC4yUmdED8y5lYwhf7soQRCfspxd4XV0fpC1T3GJ+M93HE
 4H0x1XG0a3yA3t8QuIUbcHbnrWdBJ5pY6ZG1giBT7WbgTrwh3/K1aIQ9YBb0BBaGMCAm
 cdXUPZk7Wl+UDPeuzuPmIFK7Gg26aL0B3defVOxiyH/IWR0hM60FuQM51zZjJoNuWjrt
 Defu1cs2mpGXM6QHz+Tpr3EgbBLiFHRqJ2GFvMRGtxGtRoUTqelV+09hRtCrOs+OoXa9
 FHocc/FNWFfwUJ1+DTDtKKbYLOm/rv3bsOUscDbNqjjW3wc6zspHVRIYpD8cTjde6Gbn
 1kFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699359891; x=1699964691;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xQIx7Qo+vYb4U5X/jCWdqru6+jgyWVX+HEchvZf2EPw=;
 b=himhajB2fVS3URWD07FcA8I9vtGbn+gnM5pW6Y7iXtnQXks7zBnuqC2VCsjmgd/fTJ
 63MeOvCcQ664xgu8icnNab42halDCwKgf+YOgvYePRyHQ5flrWfhJPb9HYxcW0pdTlV+
 oQrMU4oeUBX4VaCEnrWvHtzEsnIMYUYjU/Ezust+ncRKjaZveL/1fnOvO0R4WDReWRqH
 pEADyBof88srqXieL4G9pBg6Q+ZAWsj7XG9aVmbffEMboF8fsx3sryxTWZ34iCPVqYyr
 XGO2nFSGSva4pP1Fj1v+5FnLEEL0iY/6zu6DrGMUJc6ELZwAdUgEpRNnK2wWe5P/W6Gl
 tlcw==
X-Gm-Message-State: AOJu0YwG3StxmqbvLyMqCJMQd5vhXKRCcSqJF7UAAJQxDK3PbBa3ySFu
 29QmoBcittxP1iH2UEIdh7FjvwfPNm09J6Mhm9A=
X-Received: by 2002:a05:600c:2b0d:b0:409:19a0:d26f with SMTP id
 y13-20020a05600c2b0d00b0040919a0d26fmr2323873wme.23.1699359890958; 
 Tue, 07 Nov 2023 04:24:50 -0800 (PST)
Received: from m1x-phil.lan ([176.187.216.69])
 by smtp.gmail.com with ESMTPSA id
 fc13-20020a05600c524d00b004068de50c64sm15791988wmb.46.2023.11.07.04.24.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 07 Nov 2023 04:24:50 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 36/75] target/ppc: Define powerpc_pm_insn_t in 'internal.h'
Date: Tue,  7 Nov 2023 13:24:26 +0100
Message-ID: <20231107122442.58674-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231107122442.58674-1-philmd@linaro.org>
References: <20231107122442.58674-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: QoKIMQprQJpN

PM instructions are only used by TCG helpers. No need to
expose to other hardware.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20231013125630.95116-3-philmd@linaro.org>
---
 target/ppc/cpu-qom.h  | 10 ----------
 target/ppc/internal.h |  9 +++++++++
 2 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/target/ppc/cpu-qom.h b/target/ppc/cpu-qom.h
index 41df51269b..f681bfb4a6 100644
--- a/target/ppc/cpu-qom.h
+++ b/target/ppc/cpu-qom.h
@@ -114,16 +114,6 @@ enum powerpc_excp_t {
     POWERPC_EXCP_POWER10,
 };
 
-/*****************************************************************************/
-/* PM instructions */
-typedef enum {
-    PPC_PM_DOZE,
-    PPC_PM_NAP,
-    PPC_PM_SLEEP,
-    PPC_PM_RVWINKLE,
-    PPC_PM_STOP,
-} powerpc_pm_insn_t;
-
 /*****************************************************************************/
 /* Input pins model                                                          */
 typedef enum powerpc_input_t powerpc_input_t;
diff --git a/target/ppc/internal.h b/target/ppc/internal.h
index c881c67a8b..5b20ecbd33 100644
--- a/target/ppc/internal.h
+++ b/target/ppc/internal.h
@@ -20,6 +20,15 @@
 
 #include "hw/registerfields.h"
 
+/* PM instructions */
+typedef enum {
+    PPC_PM_DOZE,
+    PPC_PM_NAP,
+    PPC_PM_SLEEP,
+    PPC_PM_RVWINKLE,
+    PPC_PM_STOP,
+} powerpc_pm_insn_t;
+
 #define FUNC_MASK(name, ret_type, size, max_val)                  \
 static inline ret_type name(uint##size##_t start,                 \
                               uint##size##_t end)                 \
-- 
2.41.0

