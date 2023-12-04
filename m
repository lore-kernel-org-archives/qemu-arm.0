Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp2392662ejb;
        Sun, 3 Dec 2023 16:49:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGYzTqmFqdl8DKqGIb/f83JgjzKrJdDLA+BGMKVZUSFDrofBLofrbfFQBtkn/H/GSw6//EH
X-Received: by 2002:a05:6214:1194:b0:67a:a721:ec1d with SMTP id t20-20020a056214119400b0067aa721ec1dmr1306111qvv.97.1701650984186;
        Sun, 03 Dec 2023 16:49:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701650984; cv=none;
        d=google.com; s=arc-20160816;
        b=DyqdIHhKrvoULzum4N5MnqvLMhWwduXKXxajyXjQUzKQaMl7NQTBZn/Z1wRUUrdXfs
         3kmwIpyHrHDfTZ8rXokbQT9AoUOu+OtRDgN/7NT5G4PNf2nPENLF2iLKKz0NCV0/pfYt
         mKWTFQ0pscS9yJw1RVVO0lWjRs3qPoQvTN80zTb12YOp99p2Hpp7uqYTcBqRskmtWfRY
         geq4Zh7iLoVWk85NWSu65XhaZgCCNKK7drB6oPUW8fTi7cwEXlRmTKkiLSK7PwjgJSur
         cwHujcunlhlGKTQBNtI4rvIrz+Z/WcfISLRd2cggbpZ0nTe1WjAGfGbxr0MTi8f48+BD
         OkSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:dkim-signature;
        bh=/Jgzcsw4wi9TdGHuAd1FUF0BAgtVYLmWUIhdAchC7Ww=;
        fh=iuLTZZ1fjCI8LjSgJoBa8MYZ2BtgjMRkSSF1C0uH4/8=;
        b=uW0opvOovvRjKc6KRDFC1gbhmKnRkotd43+pg2Vu164VcM5WGa/h4Jxa6YFjhX3RNz
         HhS30ghL3hdRpmv3PqrEAlV4ou3NPaFdepafF+M3BK7mFS/i5CFNAdBa5aOxavOttwIU
         QKJxl95TqkXjE75A1oQbthu3cktsz0KLwGq7UpUyV3rn6nZ5BXnV3NFNF2G569en1th0
         EcJ/pGvKsktB7LGFCz2u0blubDsPKeUMRKdkw6jrSRFl1RWF/XGJOMO/s6CBKd4MA7tv
         eT8CJSuVTrF3KQUs0EwIcDin4ci+svlhBSuTfhOeXn5ol1wEde8HTIKiNb1xRXZrqdGJ
         lDDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dRCUmHWf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dn16-20020a056214095000b0067aa1f844f9si5463591qvb.9.2023.12.03.16.49.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Dec 2023 16:49:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dRCUmHWf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r9x8i-0005Bl-Nw; Sun, 03 Dec 2023 19:48:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r9x8h-00059a-8p
 for qemu-arm@nongnu.org; Sun, 03 Dec 2023 19:48:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r9x8f-0001q9-GA
 for qemu-arm@nongnu.org; Sun, 03 Dec 2023 19:48:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701650924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:mime-version: content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Jgzcsw4wi9TdGHuAd1FUF0BAgtVYLmWUIhdAchC7Ww=;
 b=dRCUmHWfuy5fHBzUD/reePCZ33ayC/otQ3yf/niMW6fg66IGir++UnwTxdqc5TvJZTWPeb
 9v6BqZ7msG14voDuf7KAiPiLm0E0Fzu8VxVEvsnhRJQLXR8o8B2w/OMav3+l7hnuUXeOL0
 ST3XgK96mNEZ6v+PXh7hMAa4yrCoYOo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-423-0U6QGPH_Pkq9WXrnNUqvGw-1; Sun, 03 Dec 2023 19:48:39 -0500
X-MC-Unique: 0U6QGPH_Pkq9WXrnNUqvGw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AFA7E8007B3;
 Mon,  4 Dec 2023 00:48:38 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.61])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E0168492BE0;
 Mon,  4 Dec 2023 00:48:30 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, peter.maydell@linaro.org,
 b.galvani@gmail.com, strahinja.p.jankovic@gmail.com, imammedo@redhat.com,
 kfting@nuvoton.com, wuhaotsh@google.com, nieklinnenbank@gmail.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 armbru@redhat.com, wangyanan55@huawei.com, vijai@behindbytes.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, shan.gavin@gmail.com
Subject: [PATCH v9 6/9] hw/arm/virt: Check CPU type in machine_run_board_init()
Date: Mon,  4 Dec 2023 10:47:23 +1000
Message-ID: <20231204004726.483558-7-gshan@redhat.com>
In-Reply-To: <20231204004726.483558-1-gshan@redhat.com>
References: <20231204004726.483558-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: AeL8IlWxgMZv

Set mc->valid_cpu_types so that the user specified CPU type can be
validated in machine_run_board_init(). We needn't to do the check
by ourselves.

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/arm/virt.c | 62 +++++++++++++++++++--------------------------------
 1 file changed, 23 insertions(+), 39 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 668c0d3194..04f9f5fa56 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -204,40 +204,6 @@ static const int a15irqmap[] = {
     [VIRT_PLATFORM_BUS] = 112, /* ...to 112 + PLATFORM_BUS_NUM_IRQS -1 */
 };
 
-static const char *valid_cpus[] = {
-#ifdef CONFIG_TCG
-    ARM_CPU_TYPE_NAME("cortex-a7"),
-    ARM_CPU_TYPE_NAME("cortex-a15"),
-    ARM_CPU_TYPE_NAME("cortex-a35"),
-    ARM_CPU_TYPE_NAME("cortex-a55"),
-    ARM_CPU_TYPE_NAME("cortex-a72"),
-    ARM_CPU_TYPE_NAME("cortex-a76"),
-    ARM_CPU_TYPE_NAME("cortex-a710"),
-    ARM_CPU_TYPE_NAME("a64fx"),
-    ARM_CPU_TYPE_NAME("neoverse-n1"),
-    ARM_CPU_TYPE_NAME("neoverse-v1"),
-    ARM_CPU_TYPE_NAME("neoverse-n2"),
-#endif
-    ARM_CPU_TYPE_NAME("cortex-a53"),
-    ARM_CPU_TYPE_NAME("cortex-a57"),
-#if defined(CONFIG_KVM) || defined(CONFIG_HVF)
-    ARM_CPU_TYPE_NAME("host"),
-#endif
-    ARM_CPU_TYPE_NAME("max"),
-};
-
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
@@ -2041,11 +2007,6 @@ static void machvirt_init(MachineState *machine)
     unsigned int smp_cpus = machine->smp.cpus;
     unsigned int max_cpus = machine->smp.max_cpus;
 
-    if (!cpu_type_valid(machine->cpu_type)) {
-        error_report("mach-virt: CPU type %s not supported", machine->cpu_type);
-        exit(1);
-    }
-
     possible_cpus = mc->possible_cpu_arch_ids(machine);
 
     /*
@@ -2939,6 +2900,28 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
     HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(oc);
+    static const char * const valid_cpu_types[] = {
+#ifdef CONFIG_TCG
+        ARM_CPU_TYPE_NAME("cortex-a7"),
+        ARM_CPU_TYPE_NAME("cortex-a15"),
+        ARM_CPU_TYPE_NAME("cortex-a35"),
+        ARM_CPU_TYPE_NAME("cortex-a55"),
+        ARM_CPU_TYPE_NAME("cortex-a72"),
+        ARM_CPU_TYPE_NAME("cortex-a76"),
+        ARM_CPU_TYPE_NAME("cortex-a710"),
+        ARM_CPU_TYPE_NAME("a64fx"),
+        ARM_CPU_TYPE_NAME("neoverse-n1"),
+        ARM_CPU_TYPE_NAME("neoverse-v1"),
+        ARM_CPU_TYPE_NAME("neoverse-n2"),
+#endif
+        ARM_CPU_TYPE_NAME("cortex-a53"),
+        ARM_CPU_TYPE_NAME("cortex-a57"),
+#if defined(CONFIG_KVM) || defined(CONFIG_HVF)
+        ARM_CPU_TYPE_NAME("host"),
+#endif
+        ARM_CPU_TYPE_NAME("max"),
+        NULL
+    };
 
     mc->init = machvirt_init;
     /* Start with max_cpus set to 512, which is the maximum supported by KVM.
@@ -2965,6 +2948,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
 #else
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("max");
 #endif
+    mc->valid_cpu_types = valid_cpu_types;
     mc->get_default_cpu_node_id = virt_get_default_cpu_node_id;
     mc->kvm_type = virt_kvm_type;
     assert(!mc->get_hotplug_handler);
-- 
2.42.0

