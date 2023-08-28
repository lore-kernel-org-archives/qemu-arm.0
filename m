Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp3054683ejc;
        Mon, 28 Aug 2023 07:57:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHszTWnfw/gUHJUzJDoOOD8kD25JBFNUINc9g29qrIzXu13Jn0RTEJKBLA86CmDAKqOh0GO
X-Received: by 2002:a05:620a:191e:b0:76d:acd1:447b with SMTP id bj30-20020a05620a191e00b0076dacd1447bmr22923964qkb.41.1693234661955;
        Mon, 28 Aug 2023 07:57:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693234661; cv=none;
        d=google.com; s=arc-20160816;
        b=qWNhPd55jG2dPTHbcCkU+h6QUleKuwGh8++UuP05BI/zJHclvwxIN7Lmas7vceRb3E
         qJpGZyVmxBX882EdPxRE8K2gYDCUEu0DDu1x4eDGwwq1DhD0Ui7EPQyipsvzXvWCm4dP
         Smzp/y1bun8okiEogW8uv8YLum5PbrZWuTrSBJqqC8hqPOClwHaz8h4GvStq131fIEVD
         Kok2jtcBQAZnNJFEAI+OeVk157eYbgcUU9dUjROhiU/9kVqfJZSxBcyunIHT+/iSmFnv
         UGLmwGxfsMp9v4SuALK6EftFpIsB6XjKsXbpnysxkqKjcvEGFDs5BgkSQyBOzOePClOe
         lLmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=zXtDlBaV4QYBxAWaYJ7Na+553ToqZMUDyRUVndMkrKA=;
        fh=FxYtB1slzL/yn78+bieLaailXu9MIAo7Kb5vkjusizk=;
        b=LiEdGRHeLpWxvHW1KPpqiMWO4bHsvSMUK+6ZmC4Ijlxkb917yU//IeXSYQYA93Xi0A
         xis4Kd5U3dCqLTiqdFaPjmE9P5OhhbgiMn5gHIF8h1WfZC/+elbE6JcneUjfwAOIy9YI
         aw3mCAlO9wIlU4xtG3i+jFJYg8BRxKK8dRg4AiAOqzxd/P8CRWXHVG0KD8bfeCnen8Er
         ObXokbzFysDSdOHQ6u+aJrwBMTjT4AV5GZvlF+XHO0FVizt6t7xbbegmngWusa3pyREe
         sM69GfKx3+0lORVLgcvYnz6bAS3kKzOtpoliqKiR2LIClcxiXEOCIA+oergLFNnKRoC8
         HL/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Fi5EfCZi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s7-20020a05620a0bc700b0076cb218e5f3si4944005qki.658.2023.08.28.07.57.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Aug 2023 07:57:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Fi5EfCZi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qadf3-0003Oz-Ai; Mon, 28 Aug 2023 10:56:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qadf2-0003OH-0h
 for qemu-arm@nongnu.org; Mon, 28 Aug 2023 10:56:12 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qadex-0000fE-Tu
 for qemu-arm@nongnu.org; Mon, 28 Aug 2023 10:56:11 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-31c93d2a24fso1263210f8f.2
 for <qemu-arm@nongnu.org>; Mon, 28 Aug 2023 07:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693234566; x=1693839366;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zXtDlBaV4QYBxAWaYJ7Na+553ToqZMUDyRUVndMkrKA=;
 b=Fi5EfCZizUdiyM0qhIfy80uUGXGeZVRvKB9AepVxClNSEo6fT6nngK8MSTGmXkWK0J
 InhkoXhL2bUvjJ6axowNG38eNED0WMXI3DfdsUs02Rz2ud2mM+A9J458X5y23fmFxkXo
 9C8mEU/zNMzlGragzyORb9jNcDuTdF+XWrS7LFMCghJO91UhzSaGannkoTynSUO++jTu
 TMz0rN5jG6hGQWsL0Cdk70Lq1Kmm1SmfWgE/tzfpPVeyrpiK8OZgjBqBqAg4IQSTQJ0v
 U+d0cYH89eaIrlt7rX2+6rFoua8AG8BPW7vN4uq/ZJUNCRWpOFnpZSBg1BMx6uPAMu0+
 5uOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693234566; x=1693839366;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zXtDlBaV4QYBxAWaYJ7Na+553ToqZMUDyRUVndMkrKA=;
 b=jWziE3Cz1kbwI/WxWBRpakvHc0RqkirF+9k7fEFQo+jGOtz7CXZWDprs4h9DKQFGx/
 770D+vwgNx43okP4lHi822Evgb0AAwEfBryFo/GNbwb41wqibfcJnRttKOThuxPg0mI6
 guduzXCxJw4IK3Xw9Ez6geQ0K/t8CtMXu+B1VVwW29Wt7TGZm2DUpXtQAJ1jX6dRKSBF
 g25i3FRBaQEDaE4NadjLq64u/+NlblQAeFP18TbfLyopYhN34botQfqIqp3tAhHGC8qZ
 YFFEgZtpEcr8LLM2kgIQBiWXfkbrtcuOcZVBXWLz1mATM2+7N1xEprk7PMySPwpWIzH+
 y5hg==
X-Gm-Message-State: AOJu0Yx7XVyXyPLf1E7r/Ep0/T30ZB77ZAumaaqC/ndKTAsjzpNnSs9o
 vtUICaWMQEuN4O+OPjm9fU35RA==
X-Received: by 2002:adf:ee8b:0:b0:319:6997:942e with SMTP id
 b11-20020adfee8b000000b003196997942emr18952747wro.8.1693234566159; 
 Mon, 28 Aug 2023 07:56:06 -0700 (PDT)
Received: from m1x-phil.lan ([176.164.201.64])
 by smtp.gmail.com with ESMTPSA id
 h14-20020a05600c260e00b003fefb94ccc9sm10943778wma.11.2023.08.28.07.56.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 28 Aug 2023 07:56:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 3/8] target/translate: Include missing 'exec/cpu_ldst.h' header
Date: Mon, 28 Aug 2023 16:55:40 +0200
Message-ID: <20230828145545.81165-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230828145545.81165-1-philmd@linaro.org>
References: <20230828145545.81165-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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
X-TUID: t8SIoiymBzSi

All these files access the CPU LD/ST API declared in "exec/cpu_ldst.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/avr/helper.c                  | 1 +
 target/i386/tcg/fpu_helper.c         | 1 +
 target/i386/tcg/sysemu/excp_helper.c | 1 +
 target/loongarch/cpu.c               | 1 +
 target/mips/tcg/ldst_helper.c        | 1 +
 target/mips/tcg/msa_helper.c         | 1 +
 target/riscv/op_helper.c             | 1 +
 target/riscv/vector_helper.c         | 1 +
 8 files changed, 8 insertions(+)

diff --git a/target/avr/helper.c b/target/avr/helper.c
index e6e7d51487..fdc9884ea0 100644
--- a/target/avr/helper.c
+++ b/target/avr/helper.c
@@ -24,6 +24,7 @@
 #include "cpu.h"
 #include "hw/core/tcg-cpu-ops.h"
 #include "exec/exec-all.h"
+#include "exec/cpu_ldst.h"
 #include "exec/address-spaces.h"
 #include "exec/helper-proto.h"
 
diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
index 6f3741b635..4430d3d380 100644
--- a/target/i386/tcg/fpu_helper.c
+++ b/target/i386/tcg/fpu_helper.c
@@ -21,6 +21,7 @@
 #include <math.h>
 #include "cpu.h"
 #include "tcg-cpu.h"
+#include "exec/cpu_ldst.h"
 #include "exec/helper-proto.h"
 #include "fpu/softfloat.h"
 #include "fpu/softfloat-macros.h"
diff --git a/target/i386/tcg/sysemu/excp_helper.c b/target/i386/tcg/sysemu/excp_helper.c
index b5f0abffa3..226689a4f2 100644
--- a/target/i386/tcg/sysemu/excp_helper.c
+++ b/target/i386/tcg/sysemu/excp_helper.c
@@ -19,6 +19,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
+#include "exec/cpu_ldst.h"
 #include "exec/exec-all.h"
 #include "tcg/helper-tcg.h"
 
diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 27fc6e1f33..65f9320e34 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -11,6 +11,7 @@
 #include "qapi/error.h"
 #include "qemu/module.h"
 #include "sysemu/qtest.h"
+#include "exec/cpu_ldst.h"
 #include "exec/exec-all.h"
 #include "cpu.h"
 #include "internals.h"
diff --git a/target/mips/tcg/ldst_helper.c b/target/mips/tcg/ldst_helper.c
index c1a8380e34..97056d00a2 100644
--- a/target/mips/tcg/ldst_helper.c
+++ b/target/mips/tcg/ldst_helper.c
@@ -24,6 +24,7 @@
 #include "cpu.h"
 #include "exec/helper-proto.h"
 #include "exec/exec-all.h"
+#include "exec/cpu_ldst.h"
 #include "exec/memop.h"
 #include "internal.h"
 
diff --git a/target/mips/tcg/msa_helper.c b/target/mips/tcg/msa_helper.c
index 29b31d70fe..c8597b9e30 100644
--- a/target/mips/tcg/msa_helper.c
+++ b/target/mips/tcg/msa_helper.c
@@ -22,6 +22,7 @@
 #include "internal.h"
 #include "tcg/tcg.h"
 #include "exec/exec-all.h"
+#include "exec/cpu_ldst.h"
 #include "exec/helper-proto.h"
 #include "exec/memop.h"
 #include "fpu/softfloat.h"
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 9cdb9cdd06..7e2f1908ee 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -23,6 +23,7 @@
 #include "internals.h"
 #include "qemu/main-loop.h"
 #include "exec/exec-all.h"
+#include "exec/cpu_ldst.h"
 #include "exec/helper-proto.h"
 
 /* Exceptions processing helpers */
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 4d06754826..e3ef2113d6 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -22,6 +22,7 @@
 #include "cpu.h"
 #include "exec/memop.h"
 #include "exec/exec-all.h"
+#include "exec/cpu_ldst.h"
 #include "exec/helper-proto.h"
 #include "fpu/softfloat.h"
 #include "tcg/tcg-gvec-desc.h"
-- 
2.41.0

