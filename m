Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp3284333ejc;
        Mon, 28 Aug 2023 15:14:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFeHYnJymgienRjfya7t3yIAsKobyBcQ8MNlh6dgKLeauMTsFJo80Wax1RhLAxQeJTBGLfz
X-Received: by 2002:a0c:f249:0:b0:64f:420d:18ab with SMTP id z9-20020a0cf249000000b0064f420d18abmr12160231qvl.28.1693260884043;
        Mon, 28 Aug 2023 15:14:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693260884; cv=none;
        d=google.com; s=arc-20160816;
        b=cJMT3VENnGjSkeRc3XmvM7iB6oGEt9V1c21hpm3zhVPLN+yASo3rN8WOkX24ePHQJQ
         +h5aDvgxz+dj2np3IZAscT+jGKTOux0oPXFbz2z2kBHIGLnjeqMik3yu/wWZS/GmLcsf
         QJ6PGv23GuisjomQZa2eI2P6KVDro1MXJ81mmiUAKycY6vDXoUJSrkINPTvPGXRHii4Y
         BSDiRUjwl06rrWKjiboUNTvXpVWMAlKGXPVuO3s6fLAIKKiVGVu4xO9XvN2hlp8/JA6N
         fFWdzWx39FXFwyEa0WAfX93vFB6/w6H2pasKpW7cJqzxtBJyR9eI9u09JTjIJPj6ic7z
         1DFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ssBvu4DzmFM7P1c5RxQ8Yw61cUsLlr2cfwVX7OvTMhs=;
        fh=dbvxcF+wv/s0W/vbgiEajIQqQ0tE/CJz29MvQ77T3zI=;
        b=GIMAS4Cx6UqzJ8GgXKXMhmTsNR+ZUCfza3rUbnodNkbzIISIU1XuzBrVL0b0ZaRJvW
         hjMZ+7rNMVKsxBXmlzjaVuPJ3Nqc4d8c7bP2UDDvinupgUNsfaoy43H1ySvM70Q0flxS
         mp43Ab0N0/Sl5i8Bsme797l8w7bRfizi+nY+0zRdGd0nJDD8pcBj8JUU9hz1R4pQmP34
         96pseJekUC33a7mIskRP3IdMzqLzez9bKl3oJvkwkE8VyJelZBVdJ1ZsXf0TdxYu9Rct
         WxmPoaUO7lpSSkaQhAxx4V8uQCTgfQZKnGZCSBRPbN3sivj+oRKHqL/HCmcxxQd1sZj/
         ZVQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FVfj+4+7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h28-20020a0cab1c000000b0064720702fcasi5270851qvb.436.2023.08.28.15.14.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Aug 2023 15:14:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FVfj+4+7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qakUW-0005yD-Ez; Mon, 28 Aug 2023 18:13:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qakUQ-0005wD-QD
 for qemu-devel@nongnu.org; Mon, 28 Aug 2023 18:13:44 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qakUM-0004AJ-4q
 for qemu-devel@nongnu.org; Mon, 28 Aug 2023 18:13:41 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-31781e15a0cso3317375f8f.3
 for <qemu-devel@nongnu.org>; Mon, 28 Aug 2023 15:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693260816; x=1693865616;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ssBvu4DzmFM7P1c5RxQ8Yw61cUsLlr2cfwVX7OvTMhs=;
 b=FVfj+4+7zlv008OcnUNBIkugVojkXIRGj/MkyiPGUTDK7xGCW2UyrKjaDnrR4f7eDm
 AGpj0a6b+WCSv9bB4uMmBBHUGWJmJDGJ8O5ekawbUNI8FGpknM0N36SYFLjmReI2eAnE
 QLBIvYh59nvuWFEGVuMp3e+5x4e8TcZbtqDEJi4hC7xZhNqJCj7lHKdxVn7UfoZqHasU
 NIir8tV8KtjpuUjEi7sWlX+3Y293eDFi7G1Lh8Gq75kWUygx6IeWH0dPABqcDrFweRtb
 MwiGKPe+yJhhUu2epghQGPy/O+TZyMLYFVCnleONxhXgZ+w6o98SYYGxOUpQaNfIauem
 yuCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693260816; x=1693865616;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ssBvu4DzmFM7P1c5RxQ8Yw61cUsLlr2cfwVX7OvTMhs=;
 b=LVz2rZ6hyjvqlBWZomB8k3NvaEMYrHZCACu/KQDARvWSiDgqF4AO17V1x+ybjaNiYs
 bzhy28WITV1CFdsmMKUDa5woO7ZMFnbiNQzbCYc/2bhc5ilTYvDRVzscOlgzHUpF8ubo
 0pqCEhL54nMz7M/Vr29aAAEA+8n6/4Rm7eI/PGt+9PfHdynAQyC4QlITTzuvfTHqkRRq
 QHnGoJqbsD0ik64IpJcVBx2RQsujOATTu1/OogRWCxqRnlYtZy0HlanafeVvhlQODk8r
 MXTalw1ZDn19uJ+q0Rh1MBq9tBMPg8+55xdlnR8f9nE+8KnPXUSym+d7DpvhlggOGRK3
 mpgg==
X-Gm-Message-State: AOJu0YynV+tHeHqnNZNIngrmj4vhY1LQtpMscxmx4sHS0xZ4d+WlVPwt
 GwshvZjuNcaapCInM4VbDTva6I7QurJiEoQ//bA=
X-Received: by 2002:adf:ce82:0:b0:317:5f13:5c2f with SMTP id
 r2-20020adfce82000000b003175f135c2fmr18469381wrn.0.1693260816435; 
 Mon, 28 Aug 2023 15:13:36 -0700 (PDT)
Received: from m1x-phil.lan ([176.164.201.64])
 by smtp.gmail.com with ESMTPSA id
 f22-20020a5d58f6000000b0031981c500aasm11704824wrd.25.2023.08.28.15.13.34
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 28 Aug 2023 15:13:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 03/11] target/translate: Include missing 'exec/cpu_ldst.h'
 header
Date: Tue, 29 Aug 2023 00:13:06 +0200
Message-ID: <20230828221314.18435-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230828221314.18435-1-philmd@linaro.org>
References: <20230828221314.18435-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: s4HLsHumXUYs

All these files access the CPU LD/ST API declared in "exec/cpu_ldst.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
index bf7e0029a1..bc9e151aa9 100644
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

