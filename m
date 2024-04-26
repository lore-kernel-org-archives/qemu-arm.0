Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp638440ejb;
        Fri, 26 Apr 2024 12:46:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWnHj3Erm55Sg2e15YQlFDnFIGInrx30aoskseEf35NVwRLDndpbGbZJ/Z15txQ0wWQ4AMdSi8gslDUUcoJsGVhwXBvPpjC
X-Google-Smtp-Source: AGHT+IFQl1/bdkAO8EN9FokOdggE482TRsw0rLWgZI1gqpHCuQw1T53z6OSHcEbZ4G8/9/yu3HUX
X-Received: by 2002:a25:ae68:0:b0:de1:d52:ddfc with SMTP id g40-20020a25ae68000000b00de10d52ddfcmr5080273ybe.29.1714160800924;
        Fri, 26 Apr 2024 12:46:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714160800; cv=none;
        d=google.com; s=arc-20160816;
        b=WeA91yzINe28BDpylI9HhPz9qnmqtcS7SvkKs0lhuPH80gZKTTD7R5TYui83AiDCdR
         6MMxeCXA8mDnHpNP22TsfLESk/xwDwMIjq5tJ/uGvqGz6Iw2Qi0ZzlX4BbxCWiecHppC
         QGg1ZT+Ske9O9HNq8FyjrD1aOjnHlTL7RoxmCZ0xAiSCdCrfIeb7UQlRv54Yt8wrk3fm
         yAP9QidPf5cTJ8lGbR4qU7psCHrvDBrBOFZIKCKIFt1UpZ8/75WsBnyojNuID8I97/y2
         +2O+20DLcnR9RUqedoSKsK92WLtJ8Bl3lOvoHg8s00M55HmIQfvkVqgYfG4MshXmX5WQ
         LTtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=8BKq9AOlmyTVE7jo5I1jTR1/z4GjV5JQu17n51iZoU8=;
        fh=6ApBxAhllrZYPLWcoUq5f/HJyojqB5ccqRqQGQRMxKs=;
        b=QZGz12e5QhE/eOU8USCwtD2WcY8JkH86R3UDOzGgsnhraGajbWwJA9M5kn9qB4k/JA
         K/nv+pqkEgs60oCkFcErp35M8eyBqISu4N7ZAUiv+e4TQRPvDft6ucCCuC50pBS0i3bH
         lwpBD16S/2qOcqiU3CacFmMs5W+2xqjcvveV0WKiyvi2qg6U1Keme1JdGrLhS/1OXDzc
         p2pn7YSZOKcbv08Eastvu0zjgu8slLzjdRFrHH5AGjbr20JPf20B8LdSq7BR1W62pG1+
         peZIead7xQO6D8yjIbjuktOmA41uJI787x+LrJJhbwjMsD2pLMguOvFHTRpHL04mVuKB
         luFg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w2lTb3mT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o12-20020a05622a044c00b00437b3e1dd9bsi20664276qtx.281.2024.04.26.12.46.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Apr 2024 12:46:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w2lTb3mT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s0RVL-00009X-Nr; Fri, 26 Apr 2024 15:45:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s0RVI-00007f-Sq
 for qemu-arm@nongnu.org; Fri, 26 Apr 2024 15:45:04 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s0RVF-0004Db-JX
 for qemu-arm@nongnu.org; Fri, 26 Apr 2024 15:45:04 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a4715991c32so281977766b.1
 for <qemu-arm@nongnu.org>; Fri, 26 Apr 2024 12:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714160700; x=1714765500; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8BKq9AOlmyTVE7jo5I1jTR1/z4GjV5JQu17n51iZoU8=;
 b=w2lTb3mTpYS5QZ+v/RyeIc8ERwMnoszxSO+GOKnCG+E0TDlWpw16kPLpt4AO2fVydF
 1WyxSDginBee40/njndqIK1Wx92drpgqNVePA3j4Ff8afG3zth83nhgwP2ALKOp/omAi
 exbdzc65EZVphC5fnVg5BsbfxXi3TqPqW09A9EcI86qTYg5kEZu6E9a+OomXutYS4lov
 z0JX4KhsoI4QG04/ZFSdtOsohsfyE7X5tSj59VJTIVDsdOkE62UXjLGbcbK8Jtq2oZBJ
 nKpa0P442HfK6yhnH2PJlz4lRV6hphW/syl1B3eXXoDuKe5zkyHgZsVb9zpL/SWK978T
 AKMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714160700; x=1714765500;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8BKq9AOlmyTVE7jo5I1jTR1/z4GjV5JQu17n51iZoU8=;
 b=O3I3lOqKe+jPfK1nYJK7jMeua1tG35ypY9Am+tB01wzNycNEN/19ExRdCi43JQtyU1
 Rq9CSkF8iXUGNwsNtfQMOkZsuaZ6xKkr2mmfPksDzz83gCRQfq0+UYkE/j3DDzOdpOjg
 gO9WpF3ELrxpNzi2In3gs7QJvcxUmBWfXLpf1fpLaZuNxvwCG8ROkACdaG4VPK8CZs6j
 qINF0soMivWaOdFDh62Bw0cZQq/c4usZEoUUd5xrus+FI4C1nOzWBluFMV1Zsba3IDBu
 ebfYEbGQfD374INZj0DIDrDVsZz+X6gExLpMigJIP8RdyLHpdj7pGek94p7GHvB/+pr7
 jVzA==
X-Gm-Message-State: AOJu0YwqWZEVMMTFni2iy6xDOWbCtLl2OfHvNlXmSAdVK9gIG+3I9wEU
 do8DwRSIBZouyeyowFNGL7mmYVhjASpE6Mn+qz2xjwc7gvQyDPBnoniCp2gT3yY=
X-Received: by 2002:a17:907:31ca:b0:a58:c551:4ea2 with SMTP id
 xf10-20020a17090731ca00b00a58c5514ea2mr2927994ejb.58.1714160700180; 
 Fri, 26 Apr 2024 12:45:00 -0700 (PDT)
Received: from m1x-phil.lan (aul93-h02-176-184-11-147.dsl.sta.abo.bbox.fr.
 [176.184.11.147]) by smtp.gmail.com with ESMTPSA id
 qt3-20020a170906ece300b00a5887fed95dsm3904481ejb.2.2024.04.26.12.44.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 26 Apr 2024 12:44:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [PULL 30/38] exec: Declare MMUAccessType type in 'mmu-access-type.h'
 header
Date: Fri, 26 Apr 2024 21:41:50 +0200
Message-ID: <20240426194200.43723-31-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240426194200.43723-1-philmd@linaro.org>
References: <20240426194200.43723-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: FtHXjx/qiaEI

The MMUAccessType enum is declared in "hw/core/cpu.h".
"hw/core/cpu.h" contains declarations related to CPUState
and CPUClass. Some source files only require MMUAccessType
and don't need to pull in all CPU* declarations. In order
to simplify, create a new "exec/mmu-access-type.h" header.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20240418192525.97451-2-philmd@linaro.org>
---
 include/exec/cpu_ldst.h        |  1 +
 include/exec/exec-all.h        |  1 +
 include/exec/mmu-access-type.h | 18 ++++++++++++++++++
 include/hw/core/cpu.h          |  8 +-------
 4 files changed, 21 insertions(+), 7 deletions(-)
 create mode 100644 include/exec/mmu-access-type.h

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index 64e0319996..5b99666702 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -64,6 +64,7 @@
 
 #include "exec/memopidx.h"
 #include "exec/abi_ptr.h"
+#include "exec/mmu-access-type.h"
 #include "qemu/int128.h"
 #include "cpu.h"
 
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 530d442112..4c5e470581 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -25,6 +25,7 @@
 #include "exec/abi_ptr.h"
 #include "exec/cpu_ldst.h"
 #endif
+#include "exec/mmu-access-type.h"
 #include "exec/translation-block.h"
 #include "qemu/clang-tsa.h"
 
diff --git a/include/exec/mmu-access-type.h b/include/exec/mmu-access-type.h
new file mode 100644
index 0000000000..28bbb05b94
--- /dev/null
+++ b/include/exec/mmu-access-type.h
@@ -0,0 +1,18 @@
+/*
+ * QEMU MMU Access type definitions
+ *
+ * Copyright (c) 2012 SUSE LINUX Products GmbH
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#ifndef EXEC_MMU_ACCESS_TYPE_H
+#define EXEC_MMU_ACCESS_TYPE_H
+
+typedef enum MMUAccessType {
+    MMU_DATA_LOAD  = 0,
+    MMU_DATA_STORE = 1,
+    MMU_INST_FETCH = 2
+#define MMU_ACCESS_COUNT 3
+} MMUAccessType;
+
+#endif
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index d89b2cffcb..759c3e7d89 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -25,6 +25,7 @@
 #include "exec/hwaddr.h"
 #include "exec/vaddr.h"
 #include "exec/memattrs.h"
+#include "exec/mmu-access-type.h"
 #include "exec/tlb-common.h"
 #include "qapi/qapi-types-run-state.h"
 #include "qemu/bitmap.h"
@@ -80,13 +81,6 @@ DECLARE_CLASS_CHECKERS(CPUClass, CPU,
     typedef struct ArchCPU CpuInstanceType; \
     OBJECT_DECLARE_TYPE(ArchCPU, CpuClassType, CPU_MODULE_OBJ_NAME);
 
-typedef enum MMUAccessType {
-    MMU_DATA_LOAD  = 0,
-    MMU_DATA_STORE = 1,
-    MMU_INST_FETCH = 2
-#define MMU_ACCESS_COUNT 3
-} MMUAccessType;
-
 typedef struct CPUWatchpoint CPUWatchpoint;
 
 /* see accel-cpu.h */
-- 
2.41.0

