Received: by 2002:a17:906:2484:b0:98d:b2f5:1316 with SMTP id e4csp198304ejb;
        Tue, 25 Jul 2023 17:35:39 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEq6W+fOOdIYEEdnuBbknD8Fg5APKNtyFs48FNkn9tww9GuSZeQD8BcHPWKxOqXserAj1Bj
X-Received: by 2002:a05:6214:5294:b0:637:85e3:2a2d with SMTP id kj20-20020a056214529400b0063785e32a2dmr612192qvb.58.1690331739745;
        Tue, 25 Jul 2023 17:35:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690331739; cv=none;
        d=google.com; s=arc-20160816;
        b=XLY3OHKc5RIsBDkvRzo5/1Q7SjLxsPJmhjQaAEGDjd6xLxN3TbkRwfdA28ee79yxeB
         NzOYKkUs1RLl+5q4Qw1U2ywV3xT+AtvGpU9mFISo4BIGcZSc0S20yr1h+xLwgAu6mApM
         q5VQKM8UEgVfDN22bjDiaDvWxwAA2JyudDYd8t81g8KLgEhKQQhyrHJ7pBUlTZl4IONe
         onvuqk2DKSEFT3P2URKsIUfPJB5W7LVI5MeQT5kf64mojVgUdmYoPazxE5EKXxiAKNbL
         TajAqe3iTPinzohcnLm04/jNQyFxOk1AXQxUp5TzRvp/wfaNxeQQp6pWmipWa+LkstsH
         72mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=cK/u9hBezZjv5U8uB342B7vDcqbotvyMZ2sIvXNJXuw=;
        fh=FuziOALKyXfrMoq6H15/q1ev+uC2b5q3xHaYPu2Bj/E=;
        b=GctEFG6tWgB3qsT5AE/PcTpsEUe3abS6O3KtO+hJ5fMZ2ytR20A6MIHtbYV/prW0o/
         NO5V1dgLVwW9gh/Y2zHVK+70QXKvWf7lL/rZB7DafLGQJ1Te6eQQeb+EePsXxJkYVMPv
         uOKiPHKpvJ4RlI37coZjA/WM+EM7gDhklM4YtKyzwmQkpHHb3lspGWxiXtMR+C4FDoUa
         hrdKBU28/TuPGBKCDUqP2CpHoWJvSP3vBrfRGIhSxlWMB3dNasHtgAEVgxxILt9Ovgqe
         lyC8rGn5UOFomAH/XJkx7GgPka+lm2IUFicaeMBZ4rrHyBR18AYvFsHJHw+IvJq6LXmj
         Rj7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=I5qOfScq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x26-20020a0ca89a000000b005ef6e5c03a0si7153357qva.224.2023.07.25.17.35.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jul 2023 17:35:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=I5qOfScq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qOSTh-0001vq-9O; Tue, 25 Jul 2023 20:34:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qOSTg-0001uT-Bt
 for qemu-arm@nongnu.org; Tue, 25 Jul 2023 20:34:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qOSTd-0003At-AP
 for qemu-arm@nongnu.org; Tue, 25 Jul 2023 20:34:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690331634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cK/u9hBezZjv5U8uB342B7vDcqbotvyMZ2sIvXNJXuw=;
 b=I5qOfScqUFlnJ7GV1ug8RMKLiXpZ9mEhSRiHYi4ZWjEImytu8WDDJfX/2bNXzWnx77/lDQ
 3oaRWhCLOdonwPu1sgHXXH7WvMgNSwROVckKSNGWh9XhofGqFGUBjuYBXZebAh2Y49p9MK
 fA7S6dcMzkPpZVVHkIUAH8KdL//H/5Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-5-J2x1c4w3PviT9B5_7O8dmg-1; Tue, 25 Jul 2023 20:33:48 -0400
X-MC-Unique: J2x1c4w3PviT9B5_7O8dmg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C410885A58A;
 Wed, 26 Jul 2023 00:33:46 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.80])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 32EB0492C13;
 Wed, 26 Jul 2023 00:33:37 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, peter.maydell@linaro.org,
 b.galvani@gmail.com, strahinja.p.jankovic@gmail.com,
 sundeep.lkml@gmail.com, kfting@nuvoton.com, wuhaotsh@google.com,
 nieklinnenbank@gmail.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 marcin.juszkiewicz@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com,
 laurent@vivier.eu, vijai@behindbytes.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 imammedo@redhat.com, cohuck@redhat.com, richard.henderson@linaro.org,
 pbonzini@redhat.com, shan.gavin@gmail.com
Subject: [PATCH v2 4/8] hw/arm/virt: Check CPU type in machine_run_board_init()
Date: Wed, 26 Jul 2023 10:32:01 +1000
Message-ID: <20230726003205.1599788-5-gshan@redhat.com>
In-Reply-To: <20230726003205.1599788-1-gshan@redhat.com>
References: <20230726003205.1599788-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
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
X-TUID: EE3NX4JEWOe5

Set mc->valid_cpu_{types, models} so that the specified CPU type
can be checked in machine_run_board_init(). We needn't to do the
check by ourselves.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 hw/arm/virt.c | 39 ++++++++++++++++++++++-----------------
 1 file changed, 22 insertions(+), 17 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 7d9dbc2663..debd85614e 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -203,7 +203,7 @@ static const int a15irqmap[] = {
     [VIRT_PLATFORM_BUS] = 112, /* ...to 112 + PLATFORM_BUS_NUM_IRQS -1 */
 };
 
-static const char *valid_cpus[] = {
+static const char * const valid_cpu_types[] = {
 #ifdef CONFIG_TCG
     ARM_CPU_TYPE_NAME("cortex-a7"),
     ARM_CPU_TYPE_NAME("cortex-a15"),
@@ -219,19 +219,27 @@ static const char *valid_cpus[] = {
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
+static const char * const valid_cpu_models[] = {
+#ifdef CONFIG_TCG
+    "cortex-a7",
+    "cortex-a15",
+    "cortex-a35",
+    "cortex-a55",
+    "cortex-a72",
+    "cortex-a76",
+    "a64fx",
+    "neoverse-n1",
+    "neoverse-v1",
+#endif
+    "cortex-a53",
+    "cortex-a57",
+    "host",
+    "max",
+    NULL
+};
 
 static void create_randomness(MachineState *ms, const char *node)
 {
@@ -2030,11 +2038,6 @@ static void machvirt_init(MachineState *machine)
     unsigned int smp_cpus = machine->smp.cpus;
     unsigned int max_cpus = machine->smp.max_cpus;
 
-    if (!cpu_type_valid(machine->cpu_type)) {
-        error_report("mach-virt: CPU type %s not supported", machine->cpu_type);
-        exit(1);
-    }
-
     possible_cpus = mc->possible_cpu_arch_ids(machine);
 
     /*
@@ -2953,6 +2956,8 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
 #else
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("max");
 #endif
+    mc->valid_cpu_types = valid_cpu_types;
+    mc->valid_cpu_models = valid_cpu_models;
     mc->get_default_cpu_node_id = virt_get_default_cpu_node_id;
     mc->kvm_type = virt_kvm_type;
     assert(!mc->get_hotplug_handler);
-- 
2.41.0

