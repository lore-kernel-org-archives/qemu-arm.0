Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp2676936eja;
        Mon, 6 Nov 2023 03:05:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGyUoK1G+RXToKYfOwS1Lt+hoh4cpPt9x1wBmtRKQnEEbpkPip37hI7MO2zPQaMeYszvNOp
X-Received: by 2002:a05:6a21:9994:b0:15e:dc75:66a7 with SMTP id ve20-20020a056a21999400b0015edc7566a7mr28237579pzb.24.1699268734295;
        Mon, 06 Nov 2023 03:05:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699268734; cv=none;
        d=google.com; s=arc-20160816;
        b=ESbfqrLJWpMD3q9QllI/op8UwWqTc+8GtfvFU3H5dGu++QS59nnSkwFz4ZFrjNbtkT
         bOQE4R4gGAJvuBafFKC2vpINGTYRruEQdTcq5aFHqRd+7kuEfYulg9W0YnErbpo0A+9D
         IYvKsczGXvJWedxjvG9P4KB/dOm0dQKcZzCk8GWinC1w+euh5C01U1jrG8P3bEd7uanZ
         POqMzbDhAZROdbbIcIZJu9qsPSTceWNK9/TazME19OduTvz5DnjjZKsdQpJl9EVApDir
         zcZnIK2fXjXDSgV/Fr4iVr1h6quvoMByxqLTFqkIUqegMeLDQADhPsLZ8tMG+PrpqBtk
         jDWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=JXuP88BtphoINz4Bov6u/pkpdXdezQqYli4OVAIpAZI=;
        fh=HHDAOkkCMuf4E2bzSwt4ZIJtIt9dFVMuzjG7zjOPHak=;
        b=DXMiFeB4WORj7hm8oqzhGBfgI4gS16z6Gp2ONQAvW8bIOq7gtn41aIiLE4t6MtothC
         K36Kg+ZeRcRPtI0jIMLUZ0LD184dxG6S9YwVIDIfpnmyEHSh06VutMSqivDiQDMntOMv
         6+ySAMRWK7t+0yryqrdyuFSu/tfJ/hIV/ZbOOJa0/pUyq3CX2RCiIqKdRp7i0vKhno7Y
         QFsFcvAT8LVjfDYY8Rz+cinIJo4bNIpkt4AoPRSfRYnN57k6tCM8FsvyFybkf3S9oQ+d
         8OBC7vRzNOOI1qP8L0oIYjZiMpY/sNX89H5cjmGmdRrVnOmf3EOCzKosgpndDSQOa5R0
         pDLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AA4+XnlG;
       spf=pass (google.com: domain of kvm+bounces-684-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="kvm+bounces-684-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-684-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [147.75.48.161])
        by mx.google.com with ESMTPS id e2-20020a170902f10200b001c36018fdaasi7457657plb.219.2023.11.06.03.05.33
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 03:05:34 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-684-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) client-ip=147.75.48.161;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AA4+XnlG;
       spf=pass (google.com: domain of kvm+bounces-684-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="kvm+bounces-684-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 22961B20F4A
	for <alex.bennee@linaro.org>; Mon,  6 Nov 2023 11:05:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEDE7156EB;
	Mon,  6 Nov 2023 11:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AA4+XnlG"
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122681C6A3
	for <kvm@vger.kernel.org>; Mon,  6 Nov 2023 11:05:28 +0000 (UTC)
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C4141B2
	for <kvm@vger.kernel.org>; Mon,  6 Nov 2023 03:05:26 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-32fb95dfe99so1770946f8f.2
        for <kvm@vger.kernel.org>; Mon, 06 Nov 2023 03:05:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699268724; x=1699873524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JXuP88BtphoINz4Bov6u/pkpdXdezQqYli4OVAIpAZI=;
        b=AA4+XnlG3554s1bGa/aRay++tHiJE7gwBegIEQmofQcGxfg1pLrrI7cw8Uk2Ly/J61
         HXkjTwvmhB4YqCIRa3kX2prP9CQjgesrPXrBjN5HMli1BgK5XOIT9PGsoJwzh935tKCm
         dn8Oe7Tn4Vum8OeyL77+LFxxZyYTD+xJXK8jy8tjNECGRbsKPuWr5KK8bRP6J0p5EDIR
         9YP1iigkg1CKyi+W2ZoNtdJsmaNVG17blsoThWjvE4HfpLjwolM4j0NrNZYqqMzND3+3
         /LADfVJ5DbI/xyWUPy6LybSWXn65C4zRDyv3fvH6QLrAmopU2MviwF8U+tfPl5OwcJ1S
         cVRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699268724; x=1699873524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JXuP88BtphoINz4Bov6u/pkpdXdezQqYli4OVAIpAZI=;
        b=dhWFXH/r0Ur+7pxwh1E5nLrwP9KfsT5xJ9kLjmbBJovEJGQQoPzFVUt95ulx5C/FK6
         rGLbMzBM6NbLfkpdnR/DL6noSQSHA/QOlS6egEXCjO4NdIwNOmTTIG2djZNGAT6rMNge
         LMp/IJowIWb2zpQh7XPIWs8dSeLHHJIy+5/EWy9FBMCzLCClRx9/RJFFLE+x+qo3zjj8
         WB/m7sm+7xXp1re0A1qHQqdzn2UPADfmFgYQAeE/XihMErrfMLGR7RRsiLtBkJ09Nme9
         KVuJTwD1LgGubcj2onGl6YacSu/FqGadDQTVlqBlI3pr46QlG4Z2rvsSpCIgoQsrItcH
         3YyQ==
X-Gm-Message-State: AOJu0YxRKpjbf/UVdsXwW6P+A2j6VpSmpw93V09ChFkW687g9nkUwC2O
	4+mNDZl4CCDCwV+bw1SZ3DRlxA==
X-Received: by 2002:adf:e6c4:0:b0:32f:adaf:be86 with SMTP id y4-20020adfe6c4000000b0032fadafbe86mr8820884wrm.16.1699268724027;
        Mon, 06 Nov 2023 03:05:24 -0800 (PST)
Received: from m1x-phil.lan (176-131-220-199.abo.bbox.fr. [176.131.220.199])
        by smtp.gmail.com with ESMTPSA id f6-20020a5d5686000000b0032f7eaa6e43sm9161653wrv.79.2023.11.06.03.05.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 06 Nov 2023 03:05:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org,
	qemu-s390x@nongnu.org,
	qemu-block@nongnu.org,
	qemu-riscv@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Song Gao <gaosong@loongson.cn>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 15/60] target/loongarch: Declare QOM definitions in 'cpu-qom.h'
Date: Mon,  6 Nov 2023 12:02:47 +0100
Message-ID: <20231106110336.358-16-philmd@linaro.org>
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
X-TUID: ACb67hHp3NXv

"target/foo/cpu.h" contains the target specific declarations.

A heterogeneous setup need to access target agnostic declarations
(at least the QOM ones, to instantiate the objects).

Our convention is to add such target agnostic QOM declarations in
the "target/foo/cpu-qom.h" header.
Add a comment clarifying that in the header.

Extract QOM definitions from "cpu.h" to "cpu-qom.h".

Reviewed-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20231013140116.255-9-philmd@linaro.org>
---
 target/loongarch/cpu-qom.h | 24 ++++++++++++++++++++++++
 target/loongarch/cpu.h     | 10 +---------
 2 files changed, 25 insertions(+), 9 deletions(-)
 create mode 100644 target/loongarch/cpu-qom.h

diff --git a/target/loongarch/cpu-qom.h b/target/loongarch/cpu-qom.h
new file mode 100644
index 0000000000..82c86d146d
--- /dev/null
+++ b/target/loongarch/cpu-qom.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * QEMU LoongArch CPU QOM header (target agnostic)
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ */
+
+#ifndef LOONGARCH_CPU_QOM_H
+#define LOONGARCH_CPU_QOM_H
+
+#include "hw/core/cpu.h"
+#include "qom/object.h"
+
+#define TYPE_LOONGARCH_CPU "loongarch-cpu"
+#define TYPE_LOONGARCH32_CPU "loongarch32-cpu"
+#define TYPE_LOONGARCH64_CPU "loongarch64-cpu"
+
+OBJECT_DECLARE_CPU_TYPE(LoongArchCPU, LoongArchCPUClass,
+                        LOONGARCH_CPU)
+
+#define LOONGARCH_CPU_TYPE_SUFFIX "-" TYPE_LOONGARCH_CPU
+#define LOONGARCH_CPU_TYPE_NAME(model) model LOONGARCH_CPU_TYPE_SUFFIX
+
+#endif
diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index 8f0e9f0182..c8839f4cff 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -17,6 +17,7 @@
 #include "exec/memory.h"
 #endif
 #include "cpu-csr.h"
+#include "cpu-qom.h"
 
 #define IOCSRF_TEMP             0
 #define IOCSRF_NODECNT          1
@@ -381,13 +382,6 @@ struct ArchCPU {
     const char *dtb_compatible;
 };
 
-#define TYPE_LOONGARCH_CPU "loongarch-cpu"
-#define TYPE_LOONGARCH32_CPU "loongarch32-cpu"
-#define TYPE_LOONGARCH64_CPU "loongarch64-cpu"
-
-OBJECT_DECLARE_CPU_TYPE(LoongArchCPU, LoongArchCPUClass,
-                        LOONGARCH_CPU)
-
 /**
  * LoongArchCPUClass:
  * @parent_realize: The parent class' realize handler.
@@ -478,8 +472,6 @@ void loongarch_cpu_list(void);
 
 #include "exec/cpu-all.h"
 
-#define LOONGARCH_CPU_TYPE_SUFFIX "-" TYPE_LOONGARCH_CPU
-#define LOONGARCH_CPU_TYPE_NAME(model) model LOONGARCH_CPU_TYPE_SUFFIX
 #define CPU_RESOLVING_TYPE TYPE_LOONGARCH_CPU
 
 #endif /* LOONGARCH_CPU_H */
-- 
2.41.0

