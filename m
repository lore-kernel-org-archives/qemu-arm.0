Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp2676836eja;
        Mon, 6 Nov 2023 03:05:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEO8NQInH4zC/SQRwvmNFHZTPawSXpCMSX7hAHtRCR3/adeEbHPMNH8KXmc+bU2E6pi1HOO
X-Received: by 2002:a05:6a20:3d0e:b0:125:517c:4f18 with SMTP id y14-20020a056a203d0e00b00125517c4f18mr29303104pzi.8.1699268726234;
        Mon, 06 Nov 2023 03:05:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699268726; cv=none;
        d=google.com; s=arc-20160816;
        b=S3FiuYTHv6TRGYyNRYhSuMHDfEPL6uz5fsssjI5g1Ay6npKHVQZVCjMRrsynoIMzCP
         ay+eGbIsLgj4ospWMwFNzYm3FJb2at/gticM28aLmBo39HlroJNeJMT/J/OueQVDafQM
         d3GniBmj6V1oYjquj7QU3hZqoFdu44uHfYLyndjxgyJaGjTwhcyzH2emlH4ARQ8JW4ib
         i6HWEeIEa1c6+9mcFBCwL89Kchk+3TdK+uNySIK0ySAXLAJRaTpFfB6kxcCijha6eqoI
         ERsXIIYLxz7kRv0LOJ73brMfdTY+SXG6biKJv0U5RZAkcIRx12Y+huzS2Uuit/qiZLoQ
         1VxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=vep8ejgClIB/0OUtyRO014f5iK14K4Tf/g8eVxuuhkY=;
        fh=bHWlTSBnQQA/ns5ZcbJavuHdAVuQY/3XoI0kJTOxHf4=;
        b=BmfS/iMB1BpLw91zyRL0K1KESrAaB0lSw1XlgCcUlMhaFskO8OIA5X0aDqV4gIifXs
         uDHtFawUC4U99zth3V3U7g6ffJLPNrhyumzdzWkGzLKFHAMXnOBP22OHcL3mRSZpC2mq
         F6kCBwnEIIqJF5SM3l//Syo+3Xs3gZ/E4lpunvPbTiLyMARriqlgIbnHGz+SnRO+Fw/A
         +HKZTHfp5Bxfsyoe7bpvtQ0YXwC8VCvyzm8YgkJ+WQ+LRvWIMAbZIp6ORcN3YA92UMcR
         SAyrdvO4cZCwODTtuUO1vSol7tFYwNA2Z8du+e5eN1PmvO1IGKeCtdmKSK67JeyhIS2n
         ZSEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="N8Vy/HKw";
       spf=pass (google.com: domain of kvm+bounces-683-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="kvm+bounces-683-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-683-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id cf7-20020a056a02084700b00578c64433c9si8336891pgb.894.2023.11.06.03.05.25
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 03:05:26 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-683-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="N8Vy/HKw";
       spf=pass (google.com: domain of kvm+bounces-683-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="kvm+bounces-683-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8D502811F6
	for <alex.bennee@linaro.org>; Mon,  6 Nov 2023 11:05:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E3B61A737;
	Mon,  6 Nov 2023 11:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N8Vy/HKw"
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F351A701
	for <kvm@vger.kernel.org>; Mon,  6 Nov 2023 11:05:20 +0000 (UTC)
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E337DB0
	for <kvm@vger.kernel.org>; Mon,  6 Nov 2023 03:05:18 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-32fb95dfe99so1770844f8f.2
        for <kvm@vger.kernel.org>; Mon, 06 Nov 2023 03:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699268717; x=1699873517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vep8ejgClIB/0OUtyRO014f5iK14K4Tf/g8eVxuuhkY=;
        b=N8Vy/HKwavdw7v7DnLLei0YcmyvuqQY+xxD/oZy1Kwkuv8OrHDV0heuKDFmAk4G4H6
         9Dm5jmp8w2Zgo4exu8CmkJRVw0p1dH3M1adyRc6ut5Rwpm/PCGkzcgyaN5QiKRRQMaBD
         MZs1vy/HZ9kSsEpdM6BbTMsrcglXWCMS2h2oBrjLDoQhnbiUAkOl/5m1dtOONRRNbD1K
         vI3v0VnWwmJG76lYC2389yfjLnr8gU9fT9zGD+O7rbpWmnE927PkmHKrZyTpqFo0Vgw3
         v462ZwMFSagE+893jhWWBIVEBMJIuOKdwcv48wVkdaxyeroNJVvA5kfWnSM1M/6i1CMw
         TyGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699268717; x=1699873517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vep8ejgClIB/0OUtyRO014f5iK14K4Tf/g8eVxuuhkY=;
        b=F4djjJrMcXfiYkJZF3CIdanrrP9pJOWeYIoTQ8Ds/tF+Wh5YZZB9qSneMPSOKrXKVI
         4hurIzmgrzLOX0DQMjhA6uWAXwyJ5TH5sACtXgeIjW5680PvZYcbIg/+cyhPBNVK63KD
         Y8dvs/qj6bllkPCpNn/FNpdErz3WUB/p1Yseazbl6xsvnNewRO3+RzY5jZRyZrNrUiCf
         /f40iqapljKKFSQQLQFq/z9wbV0mu2Z0OKEl+gVRLpT0JOy6R+tk3/HGXf9/oJ4uMxNP
         ZvIH2VnOrrKRbkYO1LH8i/07yGysNNsGXVaSMnW6l/6z0sqQoqalFXSbet/2TarXvhC/
         +W1Q==
X-Gm-Message-State: AOJu0Yz9LJQUrHqDgC0M5Vj6RifyK2MWn3K6JzNmqswtC/L4NBCLQqEr
	dFkKEdRDoSjC7KT6ouYYJwbgSg==
X-Received: by 2002:a05:6000:186c:b0:32f:7a65:da64 with SMTP id d12-20020a056000186c00b0032f7a65da64mr24414146wri.65.1699268717450;
        Mon, 06 Nov 2023 03:05:17 -0800 (PST)
Received: from m1x-phil.lan (176-131-220-199.abo.bbox.fr. [176.131.220.199])
        by smtp.gmail.com with ESMTPSA id l9-20020adfe589000000b0032f7d7ec4adsm9108143wrm.92.2023.11.06.03.05.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 06 Nov 2023 03:05:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org,
	qemu-s390x@nongnu.org,
	qemu-block@nongnu.org,
	qemu-riscv@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Brian Cain <bcain@quicinc.com>
Subject: [PULL 14/60] target/hexagon: Declare QOM definitions in 'cpu-qom.h'
Date: Mon,  6 Nov 2023 12:02:46 +0100
Message-ID: <20231106110336.358-15-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106110336.358-1-philmd@linaro.org>
References: <20231106110336.358-1-philmd@linaro.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 2E1D4vZdoYkl

"target/foo/cpu.h" contains the target specific declarations.

A heterogeneous setup need to access target agnostic declarations
(at least the QOM ones, to instantiate the objects).

Our convention is to add such target agnostic QOM declarations in
the "target/foo/cpu-qom.h" header.
Add a comment clarifying that in the header.

Extract QOM definitions from "cpu.h" to "cpu-qom.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Brian Cain <bcain@quicinc.com>
Message-Id: <20231013140116.255-8-philmd@linaro.org>
---
 target/hexagon/cpu-qom.h | 28 ++++++++++++++++++++++++++++
 target/hexagon/cpu.h     | 15 +--------------
 2 files changed, 29 insertions(+), 14 deletions(-)
 create mode 100644 target/hexagon/cpu-qom.h

diff --git a/target/hexagon/cpu-qom.h b/target/hexagon/cpu-qom.h
new file mode 100644
index 0000000000..f02df7ee6f
--- /dev/null
+++ b/target/hexagon/cpu-qom.h
@@ -0,0 +1,28 @@
+/*
+ * QEMU Hexagon CPU QOM header (target agnostic)
+ *
+ * Copyright(c) 2019-2023 Qualcomm Innovation Center, Inc. All Rights Reserved.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef QEMU_HEXAGON_CPU_QOM_H
+#define QEMU_HEXAGON_CPU_QOM_H
+
+#include "hw/core/cpu.h"
+#include "qom/object.h"
+
+#define TYPE_HEXAGON_CPU "hexagon-cpu"
+
+#define HEXAGON_CPU_TYPE_SUFFIX "-" TYPE_HEXAGON_CPU
+#define HEXAGON_CPU_TYPE_NAME(name) (name HEXAGON_CPU_TYPE_SUFFIX)
+
+#define TYPE_HEXAGON_CPU_V67 HEXAGON_CPU_TYPE_NAME("v67")
+#define TYPE_HEXAGON_CPU_V68 HEXAGON_CPU_TYPE_NAME("v68")
+#define TYPE_HEXAGON_CPU_V69 HEXAGON_CPU_TYPE_NAME("v69")
+#define TYPE_HEXAGON_CPU_V71 HEXAGON_CPU_TYPE_NAME("v71")
+#define TYPE_HEXAGON_CPU_V73 HEXAGON_CPU_TYPE_NAME("v73")
+
+OBJECT_DECLARE_CPU_TYPE(HexagonCPU, HexagonCPUClass, HEXAGON_CPU)
+
+#endif
diff --git a/target/hexagon/cpu.h b/target/hexagon/cpu.h
index 035ac4fb6d..7d16083c6a 100644
--- a/target/hexagon/cpu.h
+++ b/target/hexagon/cpu.h
@@ -20,11 +20,10 @@
 
 #include "fpu/softfloat-types.h"
 
+#include "cpu-qom.h"
 #include "exec/cpu-defs.h"
 #include "hex_regs.h"
 #include "mmvec/mmvec.h"
-#include "qom/object.h"
-#include "hw/core/cpu.h"
 #include "hw/registerfields.h"
 
 #define NUM_PREGS 4
@@ -36,18 +35,8 @@
 #define PRED_WRITES_MAX 5                   /* 4 insns + endloop */
 #define VSTORES_MAX 2
 
-#define TYPE_HEXAGON_CPU "hexagon-cpu"
-
-#define HEXAGON_CPU_TYPE_SUFFIX "-" TYPE_HEXAGON_CPU
-#define HEXAGON_CPU_TYPE_NAME(name) (name HEXAGON_CPU_TYPE_SUFFIX)
 #define CPU_RESOLVING_TYPE TYPE_HEXAGON_CPU
 
-#define TYPE_HEXAGON_CPU_V67 HEXAGON_CPU_TYPE_NAME("v67")
-#define TYPE_HEXAGON_CPU_V68 HEXAGON_CPU_TYPE_NAME("v68")
-#define TYPE_HEXAGON_CPU_V69 HEXAGON_CPU_TYPE_NAME("v69")
-#define TYPE_HEXAGON_CPU_V71 HEXAGON_CPU_TYPE_NAME("v71")
-#define TYPE_HEXAGON_CPU_V73 HEXAGON_CPU_TYPE_NAME("v73")
-
 void hexagon_cpu_list(void);
 #define cpu_list hexagon_cpu_list
 
@@ -127,8 +116,6 @@ typedef struct CPUArchState {
     VTCMStoreLog vtcm_log;
 } CPUHexagonState;
 
-OBJECT_DECLARE_CPU_TYPE(HexagonCPU, HexagonCPUClass, HEXAGON_CPU)
-
 typedef struct HexagonCPUClass {
     CPUClass parent_class;
 
-- 
2.41.0

