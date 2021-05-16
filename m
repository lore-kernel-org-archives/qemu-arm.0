Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp651050lfm;
        Sun, 16 May 2021 12:59:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyjKWApRBClbUBcwmvTjFw72PxkPvz6m61GbpJCgK7EsQkjlAsmJi+uEuKm4N8XCbO/ly+C
X-Received: by 2002:a05:6e02:1d9e:: with SMTP id h30mr48174329ila.214.1621195165728;
        Sun, 16 May 2021 12:59:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621195165; cv=none;
        d=google.com; s=arc-20160816;
        b=IUcxnlSN9MFmiLFwe4QVjMQXeWRR86oQFQKgTWjJhB06xnTMCTuiauSp9H24ovEwSx
         MJSvta28g8Olt2NrEyDmBSUTGpUH3v3WvrbEj5xZ1UXTU0HpKoPAtMeahDjQAgTdw1e+
         G+rosdM3pxxk6rFN6E8IQ7y3fEqmg7Db7T3e9mQQHa/9+s3zbT6Uv8qB31ygdqi3+aPa
         wP6k3sdAhdyAkWhxaIOgB3fDYdLcf1i4+DgZomkKqWFBWaXYyXj4Y9DeJLgusumBZNaV
         nv+5z5YxWcdIPeTrJF+9Ovs5M90iw16HUSqFdzWGVAlFDjdASvQuo9KO6/yC2dZQraM7
         OXlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=VnCCFuHA68L1IT2V6O5u/jRYTe4kMm9yQQ7qveI4YNA=;
        b=DT/AnAENJa4Masua/xxaZN9G2MDKZC9GFa4HaNbQ1ELkRjLNlrNcy+k1CH5lbft9R/
         VTrJ036W64GvdWkk0MbTEyLXAgzqH3h6nfYGmm87ymDmolf+4ZI08GsFsyLiQIJGcbER
         x9qyzdGngwoftngTh5YqE0hEbhSqEoMywqO6MasUbRAbc4/e0SEOiksKIrGxmziHoPtm
         3Nc/JVSmE1DjQCXXOIhlWuNmweO7vTGmnrkB5jiopEXxkhXGd+A0W0gQUKYv3Nxhng1Z
         SfLc9I8B2KmA/dhtUFKfl4lm7qYU5jVMH6ZVOtJ5AnCKbjTbhGqJxCWXx7cyR861IctO
         yYwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o2si2072957jaa.70.2021.05.16.12.59.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 16 May 2021 12:59:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1liMv6-0002gJ-Vs
	for alex.bennee@linaro.org; Sun, 16 May 2021 15:59:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1liMum-0001sy-8F; Sun, 16 May 2021 15:59:04 -0400
Received: from mail.csgraf.de ([85.25.223.15]:45320 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1liMuh-0008CS-R4; Sun, 16 May 2021 15:59:03 -0400
Received: from localhost.localdomain
 (dynamic-095-118-089-019.95.118.pool.telefonica.de [95.118.89.19])
 by csgraf.de (Postfix) with ESMTPSA id BA7AF6080642;
 Sun, 16 May 2021 21:58:57 +0200 (CEST)
From: Alexander Graf <agraf@csgraf.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Subject: [PATCH v7 02/19] hvf: Move vcpu thread functions into common directory
Date: Sun, 16 May 2021 21:58:38 +0200
Message-Id: <20210516195855.28869-3-agraf@csgraf.de>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20210516195855.28869-1-agraf@csgraf.de>
References: <20210516195855.28869-1-agraf@csgraf.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm <qemu-arm@nongnu.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wqdpG7n7fekr

Until now, Hypervisor.framework has only been available on x86_64 systems.
With Apple Silicon shipping now, it extends its reach to aarch64. To
prepare for support for multiple architectures, let's start moving common
code out into its own accel directory.

This patch moves the vCPU thread loop over.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
---
 {target/i386 => accel}/hvf/hvf-accel-ops.c | 0
 {target/i386 => accel}/hvf/hvf-accel-ops.h | 0
 accel/hvf/meson.build                      | 1 +
 target/i386/hvf/meson.build                | 1 -
 target/i386/hvf/x86hvf.c                   | 2 +-
 5 files changed, 2 insertions(+), 2 deletions(-)
 rename {target/i386 => accel}/hvf/hvf-accel-ops.c (100%)
 rename {target/i386 => accel}/hvf/hvf-accel-ops.h (100%)

diff --git a/target/i386/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
similarity index 100%
rename from target/i386/hvf/hvf-accel-ops.c
rename to accel/hvf/hvf-accel-ops.c
diff --git a/target/i386/hvf/hvf-accel-ops.h b/accel/hvf/hvf-accel-ops.h
similarity index 100%
rename from target/i386/hvf/hvf-accel-ops.h
rename to accel/hvf/hvf-accel-ops.h
diff --git a/accel/hvf/meson.build b/accel/hvf/meson.build
index 227b11cd71..fc52cb7843 100644
--- a/accel/hvf/meson.build
+++ b/accel/hvf/meson.build
@@ -1,6 +1,7 @@
 hvf_ss = ss.source_set()
 hvf_ss.add(files(
   'hvf-all.c',
+  'hvf-accel-ops.c',
 ))
 
 specific_ss.add_all(when: 'CONFIG_HVF', if_true: hvf_ss)
diff --git a/target/i386/hvf/meson.build b/target/i386/hvf/meson.build
index d253d5fd10..f6d4c394d3 100644
--- a/target/i386/hvf/meson.build
+++ b/target/i386/hvf/meson.build
@@ -1,6 +1,5 @@
 i386_softmmu_ss.add(when: [hvf, 'CONFIG_HVF'], if_true: files(
   'hvf.c',
-  'hvf-accel-ops.c',
   'x86.c',
   'x86_cpuid.c',
   'x86_decode.c',
diff --git a/target/i386/hvf/x86hvf.c b/target/i386/hvf/x86hvf.c
index 0d7533742e..2b99f3eaa2 100644
--- a/target/i386/hvf/x86hvf.c
+++ b/target/i386/hvf/x86hvf.c
@@ -32,7 +32,7 @@
 #include <Hypervisor/hv.h>
 #include <Hypervisor/hv_vmx.h>
 
-#include "hvf-accel-ops.h"
+#include "accel/hvf/hvf-accel-ops.h"
 
 void hvf_set_segment(struct CPUState *cpu, struct vmx_segment *vmx_seg,
                      SegmentCache *qseg, bool is_tr)
-- 
2.30.1 (Apple Git-130)

