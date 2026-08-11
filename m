Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E7DCC5B56A
	for <qemu-arm@archiver.kernel.org>; Tue, 11 Aug 2026 18:36:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wtrJx-0008OP-QW; Tue, 11 Aug 2026 14:35:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wtrJv-0008IH-Cz
 for qemu-arm@nongnu.org; Tue, 11 Aug 2026 14:35:27 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wtrJt-0002pV-FT
 for qemu-arm@nongnu.org; Tue, 11 Aug 2026 14:35:27 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67BGNmps1164659
 for <qemu-arm@nongnu.org>; Tue, 11 Aug 2026 18:35:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 5cKNYN1YVV/K1jHg9iJCW7yGQ3ybLzpVvQJS3M//mQs=; b=Lql9sAjZZP6bEaBy
 jmWk3rsV8wV7KJWNWxp3H4c+7+MVeD/Fn0H5xpOyk/HNHk7IDwxEST/2ah/xrW+8
 kdyPnyB5DfKyagCYVRlY2lhzhqvnEoajGz+4a4SXLNbToZuUKY3B0fjbXVMsTyQW
 se5K3aHXUuwZlcUnA0KXiBWQNRO0Cb5i0Iya06xrJtQSkGlBOEz9fYsOcg7sP0VJ
 yqmLBQsQOIBLBAkr6OkqdevuZ0oOd1QIt5clfz1G72GaRPM8o58zdR5J/jqgI8sJ
 VGv1FSmcmBINDPSh3DS2ExnXXTbQ4dcm7EUBkYkk947dCrJeDSb+c9E3vZkHuPPK
 PT0vVw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g01q12413-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 11 Aug 2026 18:35:13 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-52cd0374265so3771151cf.1
 for <qemu-arm@nongnu.org>; Tue, 11 Aug 2026 11:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786473313; x=1787078113; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=5cKNYN1YVV/K1jHg9iJCW7yGQ3ybLzpVvQJS3M//mQs=;
 b=GBg6eMW5+cnzeLQngIuo2dDd6Z0O6X4gQ5YCP+ihRXo5ZA+mYBKAAcLchPl8tPt+WQ
 hNasqEycMnfvDau28Rniw9Pzpl6vMaK0tlMzaKQwabQ4JI7OGstwOLXokKH8dqjDu34Y
 sxYH2OKNz58y5WUs5r6a/1fcN+ZL84PvIlQG7T2OUgHDMM2DBYdsFxZ7YTiPMVJIy+XJ
 +BPSmyQPMzb/cpr3VfrDSOqc74EIs6+fM5xMKXNwnj6s8E3/5h2+QBl4KRvuwEIkRqTx
 xHkY+AVQl0RrryInYUEyetwpEwFZ1X7TRMxtLri+ZT4hZruI4ny9dtMwALudoEY2xApa
 aXEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786473313; x=1787078113;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=5cKNYN1YVV/K1jHg9iJCW7yGQ3ybLzpVvQJS3M//mQs=;
 b=puTfyx6mm4FQoAgjD3E6nEipE0tIZEZTiA7dtpyiJwapjFbtfAj1Q8K9Q1IXDGfTVP
 kIrfgu2apu84LfIF7fi58WFp3O/J0w2Ob646e91mkwOPxANMtSN7diKDaCyvl9u7j+3U
 i/BQ3BhR0ll1T1VCSECRmBnlkGZqeZQRVAWeUHaxKXN2QoSxLGwWbqc+qSm5NYsCpUhc
 0rX35KrZNExGbS/er/lXBGtDDsjDXoIvRqMNZF3SoZ58pcL1pGWJMCFsS5NGVUyvAqSO
 liWZpTLnzRQs9pX3Km4XY08JtWaFeBj2ADAyuyrFH7zQ1eQRuC9/EuGORWh6X8HiMblz
 63pw==
X-Forwarded-Encrypted: i=1;
 AHgh+RrZCchFpMWrXpNrIDh6/HJiMrzt5XpLOespsf4jjXdW7vB4MZM/ljENE/s09rGC/eS5O9YyOhevCQ==@nongnu.org
X-Gm-Message-State: AOJu0YyI0oBv4ganWlhN6+av3jYOiYqJT4ZTh/3E2a5pxIz9hSzYAstg
 zOVU86CYvi15rwd6FQZJx46wmNRpft2C438TREFp7sluKrV7KJgTKbYj5rEpxvwAZT4CyOBfbAe
 K/xMV6A6p8UqlDJBTcZQcHbhEZcYxiIL3xqJ5EZYmrlZYOtLfCQKBgac=
X-Gm-Gg: AR+sD12TbN7p13OEji6sPrXgJYsv80DqPRJgrMtAYANFFsf5ngn1DbMYQVD7cp2IIc2
 1g8OH2c1e3rxk+fwEjJSSFi/HGGkG8yPdcErgr4oim1zOTYCjByHTtPNX0L3ELkOpeUKZZySL8c
 r87+MWCQbAAx0KC2sFbpgM/LHsCGH+bPt1axZHmtUKDyFkutZ0vCfMNs8TKxVlJnYdtHPNdZwck
 +gvntsXl+j4UMDFY7QOOrNCgguTOjIyRNXSwyRekOQGbgyV6/SwjAMvOj1727tju9aI8ExLaKMd
 cj3ffnAlg9JJLDMAvUrXgKfKRSxhNyyTd72qebM68IHgp81ommh3mvytDhKlhjIWh1MlJ7F4RQj
 4FaugnuIY32r3G5Pcmju3iavOTYm9sTJtIR0AoyqpTA==
X-Received: by 2002:ac8:58ca:0:b0:50d:3e1e:7998 with SMTP id
 d75a77b69052e-52d586946b4mr43853111cf.37.1786473312887; 
 Tue, 11 Aug 2026 11:35:12 -0700 (PDT)
X-Received: by 2002:ac8:58ca:0:b0:50d:3e1e:7998 with SMTP id
 d75a77b69052e-52d586946b4mr43852861cf.37.1786473312462; 
 Tue, 11 Aug 2026 11:35:12 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4997ad79e5csm3958745e9.3.2026.08.11.11.35.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 11 Aug 2026 11:35:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org, kvm@vger.kernel.org,
 qemu-riscv@nongnu.org
Subject: [PATCH 8/8] hw/cpu: Move system-specific cpu_exec_realize() to
 cpu-system.c
Date: Tue, 11 Aug 2026 20:34:10 +0200
Message-ID: <20260811183410.22428-9-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260811183410.22428-1-philmd@oss.qualcomm.com>
References: <20260811183410.22428-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Pro_O0b9XNF0HxX-xNKAmFWsX8DisdUS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDE1NSBTYWx0ZWRfXyk9D1K7YzFPz
 1rPIFy1m7MqJOfr5b2YfP2K9zCBm0OLj7kg7caZOGhSSXHZd+AxAzOK9T+WVTEPvRWsvMaY5kIP
 uNCboFy3vGb2NVAhr7vcjcVSLkuolScnYAP0SZt9Ar4zbE8oaJcA1H9mwpycLq0zAkIt8qHYSd9
 hjt+jO7iWFmZE4Xx03O0lJT0t+t8OOX1ZKDtTtDXM+lSM+GT0kKRyL7S5FmALkNmExR2kxEtBkC
 trm8MtFUf0KCf1LVcpN8Nzdc0XEEWTh/lFn8H6IbQz6f0Nuk45AmgD0wp1rrnZV1kvWcdfinlxD
 rrgQoA4MR4mzi8gzsYcqfvjvyPMIjyH2ZIuAQOdA747yQRNj3ZEG8A5jpjsvwZSMapcU8kW083o
 72J9jlCJYf9fIJK/8n3cYT+dfmG80vpqRjx15cfpgQ2bXWQGC+4x+7uIZAbmVL5XXwcPuOnFIim
 NF6XnHIlZg9H+a6MDbw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDE1NSBTYWx0ZWRfX86C6e2Xi7sk0
 ln836O0Himgfcfdu1pa1hXC2K5TyhI1GC1nX7n3Hn1JMJFePMryjbQM3MWOj27WliQQ4h0huUOq
 eGaDctbd+7F4QrsOhbYxArJvT4GngRg=
X-Proofpoint-ORIG-GUID: Pro_O0b9XNF0HxX-xNKAmFWsX8DisdUS
X-Authority-Analysis: v=2.4 cv=brt8wkai c=1 sm=1 tr=0 ts=6a7b6b61 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=pilchTG5AImVgDdFcq4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_04,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110155
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Current cpu_exec_realize() body only contains system-mode
related code. Move that method out of cpu-common.c to
cpu-system.c, removing the system / machine mentions in
this common file. Add an empty stub for user-mode.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 hw/core/cpu-internal.h |  1 +
 hw/core/cpu-common.c   | 24 ------------------------
 hw/core/cpu-system.c   | 26 ++++++++++++++++++++++++++
 hw/core/cpu-user.c     |  5 +++++
 4 files changed, 32 insertions(+), 24 deletions(-)

diff --git a/hw/core/cpu-internal.h b/hw/core/cpu-internal.h
index ae6a31bca2d..44715b44329 100644
--- a/hw/core/cpu-internal.h
+++ b/hw/core/cpu-internal.h
@@ -15,6 +15,7 @@ void cpu_class_init_props(DeviceClass *dc);
 void cpu_exec_class_post_init(CPUClass *cc);
 
 void cpu_exec_init(CPUState *cpu);
+void cpu_exec_realize(CPUState *cpu, Error **errp);
 
 void cpu_vmstate_register(CPUState *cpu);
 void cpu_vmstate_unregister(CPUState *cpu);
diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index cd7c8763cf5..4f4c87f33a0 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -33,7 +33,6 @@
 #include "exec/log.h"
 #include "exec/gdbstub.h"
 #include "system/tcg.h"
-#include "hw/core/boards.h"
 #include "hw/core/qdev-properties.h"
 #include "trace.h"
 #ifdef CONFIG_PLUGIN
@@ -246,29 +245,6 @@ bool cpu_common_realize(CPUState *cpu, Error **errp)
     return true;
 }
 
-static void cpu_exec_realize(CPUState *cpu, Error **errp)
-{
-    Object *machine = qdev_get_machine();
-
-    /* qdev_get_machine() can return something that's not TYPE_MACHINE
-     * if this is one of the user-only emulators; in that case there's
-     * no need to check the ignore_memory_transaction_failures board flag.
-     */
-    if (object_dynamic_cast(machine, TYPE_MACHINE)) {
-        MachineClass *mc = MACHINE_GET_CLASS(machine);
-
-        if (mc) {
-            cpu->ignore_memory_transaction_failures =
-                mc->ignore_memory_transaction_failures;
-        }
-    }
-
-    if (DEVICE(cpu)->hotplugged) {
-        cpu_synchronize_post_init(cpu);
-        cpu_resume(cpu);
-    }
-}
-
 static void cpu_common_realizefn(DeviceState *dev, Error **errp)
 {
     cpu_exec_realize(CPU(dev), errp);
diff --git a/hw/core/cpu-system.c b/hw/core/cpu-system.c
index 8a9f2fcea84..feadfb5af00 100644
--- a/hw/core/cpu-system.c
+++ b/hw/core/cpu-system.c
@@ -25,10 +25,12 @@
 #include "exec/target_page.h"
 #include "system/memory.h"
 #include "qemu/target-info.h"
+#include "hw/core/boards.h"
 #include "hw/core/qdev.h"
 #include "hw/core/qdev-properties.h"
 #include "hw/core/sysemu-cpu-ops.h"
 #include "migration/vmstate.h"
+#include "system/hw_accel.h"
 #include "system/tcg.h"
 #include "cpu-internal.h"
 
@@ -221,6 +223,30 @@ static int cpu_common_pre_load(void *opaque)
     return 0;
 }
 
+void cpu_exec_realize(CPUState *cpu, Error **errp)
+{
+    Object *machine = qdev_get_machine();
+
+    /* qdev_get_machine() can return something that's not TYPE_MACHINE
+     * if this is one of the user-only emulators; in that case there's
+     * no need to check the ignore_memory_transaction_failures board flag.
+     */
+    if (object_dynamic_cast(machine, TYPE_MACHINE)) {
+        MachineClass *mc = MACHINE_GET_CLASS(machine);
+
+        if (mc) {
+            cpu->ignore_memory_transaction_failures =
+                mc->ignore_memory_transaction_failures;
+        }
+    }
+
+    if (DEVICE(cpu)->hotplugged) {
+        cpu_synchronize_post_init(cpu);
+        cpu_resume(cpu);
+    }
+
+}
+
 static bool cpu_common_exception_index_needed(void *opaque)
 {
     CPUState *cpu = opaque;
diff --git a/hw/core/cpu-user.c b/hw/core/cpu-user.c
index c2cb00a85d3..1e38c88f9bd 100644
--- a/hw/core/cpu-user.c
+++ b/hw/core/cpu-user.c
@@ -38,6 +38,11 @@ void cpu_exec_init(CPUState *cpu)
     /* nothing to do */
 }
 
+void cpu_exec_realize(CPUState *cpu, Error **errp)
+{
+    /* nothing to do */
+}
+
 void cpu_vmstate_register(CPUState *cpu)
 {
     assert(qdev_get_vmsd(DEVICE(cpu)) == NULL ||
-- 
2.53.0


