Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp3096817eje;
        Wed, 12 Jul 2023 22:47:22 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGILyTUxi2XlSONyHkoVOL9JVu5aySXHAtAetwK/XP5xPWRS4cpJTRfTgrkXrUmk1STpgeq
X-Received: by 2002:a05:620a:4bc9:b0:767:1a27:5302 with SMTP id sw9-20020a05620a4bc900b007671a275302mr663814qkn.7.1689227242278;
        Wed, 12 Jul 2023 22:47:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689227242; cv=none;
        d=google.com; s=arc-20160816;
        b=bWyj39A5oibmyQaehbOgjinjmJXYb+O9p8JTw1DIUGSvEOL8toLzfdNXfAiZbGFU+0
         vo4id1nKu4Z0BgMLzfYImSQENelE+FpwLB1Sy/mcpSxd+PZYypg8t7gS00us7ZSt26aI
         RbaakmsLtYHP/fhfI+ePm2dQkSxPZc0rH89vCBCApB3g6G/iaYhJc1uB+bLa336ePAys
         I1Y0S+gO/2CSjQy5ka/+AsvvEtv6oiWunfHJlVJvl3RvGMP/zdAvp8Eo4whQJCsdJFsJ
         /HsY4jBj3ES6VDbjYZWgde/NbyWkKsXtebfB3T5v0smZWFCVw6Ul6UGHV3P7yEXOykv0
         0EyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=hVzUhykJcidkPK6jw21EHNHwiC1ag8vAkShAFbnFjXU=;
        fh=HG7+8NG+gFyTR0uRZiWeu4GDRUTSvE55u2ps4eGUrf0=;
        b=GUHWMOUFln8DZILLgR2h4pFz5JpAy9ECTidMg2uQdrcoToTWA20Hs/Rc4K19ayXBvN
         1TsMOBW5OSedNmjQCZvqY7luGezmd1aVtV66gzhpryKmDKmUF7nszraa6ed8G5BABdnJ
         Ra5UHymFWWU3wOFDlA9mTX1ewNwJ9wJYgVchrFDSE7KMRNAJ0JEmaMfaNv/BVRg2vg3H
         RV+YeNeRerWZsb0ZK428N7wkrcicAsXvph0TA9+f4dwdSYOChMkSsE6+w+iVJxoJbbrn
         5jgtsbBXUmPsCi4h7ADnMV9VPOEsACktPZmaDMn+DZMT/Cr4Fwkc3xlPbEIT++lYb2bD
         Mawg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Dq03/ryW";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id qr15-20020a05620a390f00b00767cf918cf6si2635580qkn.440.2023.07.12.22.47.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Jul 2023 22:47:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Dq03/ryW";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qJp9i-0007jL-Hr; Thu, 13 Jul 2023 01:46:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qJp9Q-0007gn-49
 for qemu-devel@nongnu.org; Thu, 13 Jul 2023 01:46:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qJp9O-0001Ut-Er
 for qemu-devel@nongnu.org; Thu, 13 Jul 2023 01:46:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689227161;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hVzUhykJcidkPK6jw21EHNHwiC1ag8vAkShAFbnFjXU=;
 b=Dq03/ryWJKGXBOQcx6dHwjj1GH5GFEYgL4pUv+D1sVWeCldVawU9StLWFsYglyJl/4tQjq
 I9oQzJ8x3ZV9HDh0atq9ftr+msm4bZz6Q3g6CI6rXKc4EmIeY0ehnGvmgilQsD2XfTJ/lk
 /QAFUpJA/DRMBuIeGEu2tAlRO3s4zaI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-116-2x85mZEXOqeUzdvdkcu5FQ-1; Thu, 13 Jul 2023 01:45:55 -0400
X-MC-Unique: 2x85mZEXOqeUzdvdkcu5FQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F02E4101A54E;
 Thu, 13 Jul 2023 05:45:54 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-126.bne.redhat.com [10.64.54.126])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B3AEC111DCE0;
 Thu, 13 Jul 2023 05:45:51 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net,
 peter.maydell@linaro.org, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, shan.gavin@gmail.com
Subject: [PATCH 2/3] hw/arm/virt: Use generic CPU type invalidation
Date: Thu, 13 Jul 2023 15:45:01 +1000
Message-ID: <20230713054502.410911-3-gshan@redhat.com>
In-Reply-To: <20230713054502.410911-1-gshan@redhat.com>
References: <20230713054502.410911-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: nnVOhOJb+dsP

There is a generic CPU type invalidation in machine_run_board_init()
and we needn't a same and private invalidation. Set mc->valid_cpu_types
to use the generic CPU type invalidation.

No functional change intended.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 hw/arm/virt.c | 21 +++------------------
 1 file changed, 3 insertions(+), 18 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 7d9dbc2663..43d7772ffd 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -203,7 +203,7 @@ static const int a15irqmap[] = {
     [VIRT_PLATFORM_BUS] = 112, /* ...to 112 + PLATFORM_BUS_NUM_IRQS -1 */
 };
 
-static const char *valid_cpus[] = {
+static const char *valid_cpu_types[] = {
 #ifdef CONFIG_TCG
     ARM_CPU_TYPE_NAME("cortex-a7"),
     ARM_CPU_TYPE_NAME("cortex-a15"),
@@ -219,20 +219,9 @@ static const char *valid_cpus[] = {
     ARM_CPU_TYPE_NAME("cortex-a57"),
     ARM_CPU_TYPE_NAME("host"),
     ARM_CPU_TYPE_NAME("max"),
+    NULL
 };
 
-static bool cpu_type_valid(const char *cpu)
-{
-    int i;
-
-    for (i = 0; i < ARRAY_SIZE(valid_cpus); i++) {
-        if (strcmp(cpu, valid_cpus[i]) == 0) {
-            return true;
-        }
-    }
-    return false;
-}
-
 static void create_randomness(MachineState *ms, const char *node)
 {
     struct {
@@ -2030,11 +2019,6 @@ static void machvirt_init(MachineState *machine)
     unsigned int smp_cpus = machine->smp.cpus;
     unsigned int max_cpus = machine->smp.max_cpus;
 
-    if (!cpu_type_valid(machine->cpu_type)) {
-        error_report("mach-virt: CPU type %s not supported", machine->cpu_type);
-        exit(1);
-    }
-
     possible_cpus = mc->possible_cpu_arch_ids(machine);
 
     /*
@@ -2953,6 +2937,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
 #else
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("max");
 #endif
+    mc->valid_cpu_types = valid_cpu_types;
     mc->get_default_cpu_node_id = virt_get_default_cpu_node_id;
     mc->kvm_type = virt_kvm_type;
     assert(!mc->get_hotplug_handler);
-- 
2.41.0

