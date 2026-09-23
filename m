Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDC97C9830E
	for <qemu-arm@archiver.kernel.org>; Wed, 23 Sep 2026 13:28:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x9Mzt-0003Oe-Qp; Wed, 23 Sep 2026 09:26:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x9MvK-0003jd-TT
 for qemu-arm@nongnu.org; Wed, 23 Sep 2026 09:22:14 -0400
Received: from mail-dy2-x0f.google.com ([2607:f8b0:4864:36::f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x9MvJ-0007eh-5O
 for qemu-arm@nongnu.org; Wed, 23 Sep 2026 09:22:10 -0400
Received: by mail-dy2-x0f.google.com with SMTP id
 5a478bee46e88-33e46a15703so623404eec.0
 for <qemu-arm@nongnu.org>; Wed, 23 Sep 2026 06:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790169718; x=1790774518; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=20fmaOno77HQJxryAkVKJDwkjIsA6lPsyx3HFEs6GYM=;
 b=PMEkrb/Ri/F4T5LjCFoieBle/ToHgeQB+JQeO6a9z2TYc5AiaS04dnO7AgHRuEyp4V
 2o5LimxbInUl+xJpmYdfprqfL759qSkv5v49hCMgvG8PNwTDy8ZbXkDvu/UNzUuAzTk7
 Vz5Iq4BM4TwNrwM2Oa6ND/OdcsZ7bRAmWmWlA3YbcfiGzaVv6kVmmA6Zkq/PYxnn7NE1
 ZO3Q9fYq8SpKg+LcBF3TCIAsPJ1hlA5uanbH69WvVzY4xV7h3DeauB5SbpglSiJGimUY
 RQ8DUhmrqEKQXz7/GezZD5IqPG1DH3V7sP1pvoW0E8XSEaOQPtSGEmIQa8f0SbiDNAGh
 3/0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790169718; x=1790774518;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=20fmaOno77HQJxryAkVKJDwkjIsA6lPsyx3HFEs6GYM=;
 b=l6Lyp/Zce3KDQ9DHWmjred0caYKA5BEkEeO9MjzwQBc2ViWl2kvifM8Yp0DjBCW+rM
 SLXl3G4zqEOOkziGvsMVCtCzUh2G6zF2u30M0OeVA8B631NF2KimOQD5nbHXO5TYrflQ
 TYU89jzzVdUDVZNzbOg5jBuRLr1NB+kJJApuVy39SDisDjQa48Q3QD1XqcERu6j8xPn3
 0E53PdeYG3Q7NB/kob+AP0ojCJ+qNfMTjZ+1huBfdmgyJwYc95wO69CsFY90paWE1J3P
 QG0CLlKF5jzDp+Yxq8RD3V5sagS0Ob+7sMcN+X6m7EQ0r3alwABgMjtN6jA0rLVPDigP
 LBrA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzfZKqCslipUOFnH5jdpnqClzD5Ap7aW5viaTBE0wUEOZUMchJgxQeOF5FJtx7zU2D9IOVBNK4i5w==@nongnu.org
X-Gm-Message-State: AFuF++nhZY1Oh5gYWL9DG6CBO2oU6mz8jMWNqaGgz1sXbBydDxstBHhP
 gsAkUGvBuQsRzzm54carH65gAUm4YCr51v7NAGhWPfCcMwkBsVw1+D2u
X-Gm-Gg: AYBFou3o/yvEh8TARAKEBup0GmVzre95MGQzLft4kSFWzrYOXyJ8zxoYuFI8JvHEVAR
 l2xYHPGXWJh7N0dW4P9llyUu0jXdtD9jAYXol64j3J60qbYdDDL9Mc2jemY1yeA5NUa9agHmuw8
 XTz03Z3CAA8ywjkvEMoMW0jx2IDCzpJafLxRwXR6su7aIItLEC5KTqVfgMhDF72nwZB7Se0Kea7
 zUQVQSSCC00Q+lBZMRkmLEWSUmKsyEGQi496/9fs4HPfc4qIp2Sz21E36ilV+rtuHux48mPfyR5
 FdMpoduE1nxLwSEJ3yToA+Cs5Zff02/vR84INqEV43VKLBmku33JkGMAKAW3o9v+AtLxyebsOtn
 rfZuotq3xNa0ci1KKYC4HQPKhUKpOgKn7VU7HCpw4IkEvbfcQ5yiXi+Q1ycojF1NmI6Y92E3itq
 +bNcODedh/a8WjPtiShwE2nlWyGaWRai2x/4jmPn4U2HTUCazr/WsbYQhmQnAk2zHEaKAiF8hiF
 qE8aubjMsRLYB38v6WG+4B3whlIiAe9qt3hF1Pxqg==
X-Received: by 2002:a05:7301:db0c:b0:33b:96b8:3818 with SMTP id
 5a478bee46e88-33e8ddbe14cmr1962518eec.32.1790169717553; 
 Wed, 23 Sep 2026 06:21:57 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-33e97236754sm5553695eec.29.2026.09.23.06.21.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2026 06:21:56 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>, xen-devel@lists.xenproject.org,
 Chao Liu <chao.liu@processmission.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Peter Xu <peterx@redhat.com>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Fabiano Rosas <farosas@suse.de>, Xianglai Li <lixianglai@loongson.cn>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-ppc@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bibo Mao <maobibo@loongson.cn>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 David Hildenbrand <david@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-riscv@nongnu.org,
 kvm@vger.kernel.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stafford Horne <shorne@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Song Gao <17746591750@163.com>, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Brian Cain <brian.cain@oss.qualcomm.com>
Subject: [PATCH v3 030/114] target/riscv: add kvm stubs source set
Date: Wed, 23 Sep 2026 21:15:04 +0800
Message-ID: <20260923131635.1894-31-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260923131635.1894-1-luoyonggang@gmail.com>
References: <20260923131635.1894-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:36::f;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy2-x0f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

- Add riscv_stubs_ss and kvm-stub.c, matching the ARM target_stubs_arch
  pattern (has_mp_state returns false; other entry points are
  g_assert_not_reached).
- Register target_stubs_arch += {'riscv': riscv_stubs_ss}.
- Leave target_arch / target_system_arch in place; next change can
  move RISC-V onto target_common_system_arch.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 target/riscv/kvm/kvm-stub.c | 33 ++++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/target/riscv/kvm/kvm-stub.c b/target/riscv/kvm/kvm-stub.c
index 64e39c96d89..1c8c324cd44 100644
--- a/target/riscv/kvm/kvm-stub.c
+++ b/target/riscv/kvm/kvm-stub.c
@@ -9,6 +9,37 @@
 #include "qemu/osdep.h"
 #include "target/riscv/kvm/kvm_riscv.h"
 
+/*
+ * Safe to call without KVM. Return "not supported".
+ */
+bool kvm_riscv_has_mp_state(void)
+{
+    return false;
+}
+
+/*
+ * These functions should never actually be called without KVM support.
+ */
+void kvm_riscv_reset_vcpu(RISCVCPU *cpu)
+{
+    g_assert_not_reached();
+}
+
+void kvm_riscv_set_irq(RISCVCPU *cpu, int irq, int level)
+{
+    g_assert_not_reached();
+}
+
+void riscv_kvm_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
+{
+    g_assert_not_reached();
+}
+
+uint64_t kvm_riscv_get_timebase_frequency(RISCVCPU *cpu)
+{
+    g_assert_not_reached();
+}
+
 void kvm_riscv_aia_create(MachineState *machine, uint64_t group_shift,
                           uint64_t aia_irq_num, uint64_t aia_msi_num,
                           uint64_t aplic_base, uint64_t imsic_base,
@@ -17,7 +48,7 @@ void kvm_riscv_aia_create(MachineState *machine, uint64_t group_shift,
     g_assert_not_reached();
 }
 
-uint64_t kvm_riscv_get_timebase_frequency(RISCVCPU *cpu)
+void riscv_kvm_aplic_request(void *opaque, int irq, int level)
 {
     g_assert_not_reached();
 }
-- 
2.52.0.windows.1


