Received: by 2002:a17:907:1006:b0:9d0:bf65:29fa with SMTP id ox6csp1859255ejb;
        Sun, 19 Nov 2023 16:30:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE1Hij1dg5gnbHfsFS4R24lTEBPRrFCJScfDoKAm9YX7BFoevilDTrG9Cu5GYbo7G4Vyop5
X-Received: by 2002:a05:622a:8f:b0:41c:c205:f718 with SMTP id o15-20020a05622a008f00b0041cc205f718mr8055196qtw.45.1700440207756;
        Sun, 19 Nov 2023 16:30:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700440207; cv=none;
        d=google.com; s=arc-20160816;
        b=enq2Alw7IE+rrWvdZpoO04gm+0IV5v8F6LP6U2UE+rJ+qS+X4GPwLQk62BneLsKLb/
         BUwA8Frno4vQnYQvNMGm1pS7o/1nLi4ZPccEK5b6qgjYqeod6s6Rj57SAHl0E89yyMdM
         YU9MlUYPtSoDrH3kZWq4tBfCEUB19pmKWSffEdxql8mqQ2Suq6C/cU3dNeGonCYV/dJS
         E+khMdGcYKwTnhzvZ7qoeKZ9pzulu4+roC1UBLP+sGWj71W+C89LJ9hnpqZ7b2wV9w7R
         e2pNtFg/BpiHCtkFOGry+Pxc6WjSuXThB5Ldem3/iczn4Xeiyc3jVtl0CWCjyY+W9aOg
         YLXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=w+qtphYnj/pT3fYoVfsr4aPDYGcbxcq96VDWEstwRy0=;
        fh=eprYT8whwr4stGFQLeeZHwk74gIWGMhzJm3THIcsCHI=;
        b=KuTaoTldjAkKnNcFxmDZ2A01Eb36Yl8ncpMOYTgWPGy2xNW8pNz/GcAunHhQHlz3Hc
         1UEw0/QAo9p4tIEJdNbtCVB6rhofGKQhEWYYPJ0HxMLknSc6tHJmbkUXGzHN5DheUvmi
         XnV1UtQ8qLQyBhmN1cdhnvnP8hIVNF5pqPL133ZqCm64FGcj7or3zgp1iaVvFBLw1Ec9
         tQ+WRrg2zfpnO5S66oin1BHEy74T58m3c9fWMxNQSaP638DbBs/i+FnQn8dE5HYtglyX
         Bpm6bVm/xBSywMOx5QGBXTGowfSS12dWNRCLxxHspifOmsG9S3aYQn47kLcjqXgZxfIl
         8YoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FXWPsEMG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p10-20020a05622a13ca00b00417fd10f754si6335182qtk.412.2023.11.19.16.30.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 19 Nov 2023 16:30:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FXWPsEMG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r4sA7-0005aJ-C2; Sun, 19 Nov 2023 19:29:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r4sA5-0005Zn-Th
 for qemu-arm@nongnu.org; Sun, 19 Nov 2023 19:29:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r4sA2-0001It-Cs
 for qemu-arm@nongnu.org; Sun, 19 Nov 2023 19:29:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700440149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w+qtphYnj/pT3fYoVfsr4aPDYGcbxcq96VDWEstwRy0=;
 b=FXWPsEMGwwzQCWRjh6FXS7WfzIw+GA7/rYYf6LcM1HLj4t2BvrxdgwJlQ/P3wiDiEGB8Sj
 P0tF5SoZMBkOTbtFAkfOuAhw9yhb2T/mIva9K6nduyfe+grMCaKivmpl0b2O9LNZCYT79W
 Sw7fAB8B209JzgdKHS7/NWznFwEbOWA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-383-XeQ_xvmDOYK38NDBX6eVnw-1; Sun, 19 Nov 2023 19:29:04 -0500
X-MC-Unique: XeQ_xvmDOYK38NDBX6eVnw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D5F938058ED;
 Mon, 20 Nov 2023 00:29:02 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.87])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A8B040C6EB9;
 Mon, 20 Nov 2023 00:28:55 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, imammedo@redhat.com, b.galvani@gmail.com,
 strahinja.p.jankovic@gmail.com, kfting@nuvoton.com, wuhaotsh@google.com,
 nieklinnenbank@gmail.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 marcin.juszkiewicz@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com,
 vijai@behindbytes.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, shan.gavin@gmail.com
Subject: [PATCH v6 7/8] hw/arm: Check CPU type in machine_run_board_init()
Date: Mon, 20 Nov 2023 10:27:23 +1000
Message-ID: <20231120002724.986326-8-gshan@redhat.com>
In-Reply-To: <20231120002724.986326-1-gshan@redhat.com>
References: <20231120002724.986326-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
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
X-TUID: P7csh65s3VGh

Set mc->valid_cpu_types so that the user specified CPU type can
be validated in machine_run_board_init(). We needn't to do it by
ourselves.

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
v6: To have unified valid_cpu_types[] and move it to board's
    class_init() function                                    (Phil)
---
 hw/arm/bananapi_m2u.c   | 12 ++++++------
 hw/arm/cubieboard.c     | 12 ++++++------
 hw/arm/mps2-tz.c        | 26 ++++++++++++++++++++------
 hw/arm/mps2.c           | 26 ++++++++++++++++++++------
 hw/arm/msf2-som.c       | 12 ++++++------
 hw/arm/musca.c          | 12 +++++-------
 hw/arm/npcm7xx_boards.c | 12 +++++-------
 hw/arm/orangepi.c       | 12 ++++++------
 8 files changed, 74 insertions(+), 50 deletions(-)

diff --git a/hw/arm/bananapi_m2u.c b/hw/arm/bananapi_m2u.c
index 8f24b18d8c..0a4b6f29b1 100644
--- a/hw/arm/bananapi_m2u.c
+++ b/hw/arm/bananapi_m2u.c
@@ -71,12 +71,6 @@ static void bpim2u_init(MachineState *machine)
         exit(1);
     }
 
-    /* Only allow Cortex-A7 for this board */
-    if (strcmp(machine->cpu_type, ARM_CPU_TYPE_NAME("cortex-a7")) != 0) {
-        error_report("This board can only be used with cortex-a7 CPU");
-        exit(1);
-    }
-
     r40 = AW_R40(object_new(TYPE_AW_R40));
     object_property_add_child(OBJECT(machine), "soc", OBJECT(r40));
     object_unref(OBJECT(r40));
@@ -133,12 +127,18 @@ static void bpim2u_init(MachineState *machine)
 
 static void bpim2u_machine_init(MachineClass *mc)
 {
+    static const char * const valid_cpu_types[] = {
+        ARM_CPU_TYPE_NAME("cortex-a7"),
+        NULL
+    };
+
     mc->desc = "Bananapi M2U (Cortex-A7)";
     mc->init = bpim2u_init;
     mc->min_cpus = AW_R40_NUM_CPUS;
     mc->max_cpus = AW_R40_NUM_CPUS;
     mc->default_cpus = AW_R40_NUM_CPUS;
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a7");
+    mc->valid_cpu_types = valid_cpu_types;
     mc->default_ram_size = 1 * GiB;
     mc->default_ram_id = "bpim2u.ram";
 }
diff --git a/hw/arm/cubieboard.c b/hw/arm/cubieboard.c
index 29146f5018..b976727eef 100644
--- a/hw/arm/cubieboard.c
+++ b/hw/arm/cubieboard.c
@@ -52,12 +52,6 @@ static void cubieboard_init(MachineState *machine)
         exit(1);
     }
 
-    /* Only allow Cortex-A8 for this board */
-    if (strcmp(machine->cpu_type, ARM_CPU_TYPE_NAME("cortex-a8")) != 0) {
-        error_report("This board can only be used with cortex-a8 CPU");
-        exit(1);
-    }
-
     a10 = AW_A10(object_new(TYPE_AW_A10));
     object_property_add_child(OBJECT(machine), "soc", OBJECT(a10));
     object_unref(OBJECT(a10));
@@ -114,8 +108,14 @@ static void cubieboard_init(MachineState *machine)
 
 static void cubieboard_machine_init(MachineClass *mc)
 {
+    static const char * const valid_cpu_types[] = {
+        ARM_CPU_TYPE_NAME("cortex-a8"),
+        NULL
+    };
+
     mc->desc = "cubietech cubieboard (Cortex-A8)";
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a8");
+    mc->valid_cpu_types = valid_cpu_types;
     mc->default_ram_size = 1 * GiB;
     mc->init = cubieboard_init;
     mc->block_default_type = IF_IDE;
diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 668db5ed61..5d8cdc1a4c 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -813,12 +813,6 @@ static void mps2tz_common_init(MachineState *machine)
     int num_ppcs;
     int i;
 
-    if (strcmp(machine->cpu_type, mc->default_cpu_type) != 0) {
-        error_report("This board can only be used with CPU %s",
-                     mc->default_cpu_type);
-        exit(1);
-    }
-
     if (machine->ram_size != mc->default_ram_size) {
         char *sz = size_to_str(mc->default_ram_size);
         error_report("Invalid RAM size, should be %s", sz);
@@ -1318,6 +1312,10 @@ static void mps2tz_an505_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
     MPS2TZMachineClass *mmc = MPS2TZ_MACHINE_CLASS(oc);
+    static const char * const valid_cpu_types[] = {
+        ARM_CPU_TYPE_NAME("cortex-m33"),
+        NULL
+    };
 
     mc->desc = "ARM MPS2 with AN505 FPGA image for Cortex-M33";
     mc->default_cpus = 1;
@@ -1325,6 +1323,7 @@ static void mps2tz_an505_class_init(ObjectClass *oc, void *data)
     mc->max_cpus = mc->default_cpus;
     mmc->fpga_type = FPGA_AN505;
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m33");
+    mc->valid_cpu_types = valid_cpu_types;
     mmc->scc_id = 0x41045050;
     mmc->sysclk_frq = 20 * 1000 * 1000; /* 20MHz */
     mmc->apb_periph_frq = mmc->sysclk_frq;
@@ -1347,6 +1346,10 @@ static void mps2tz_an521_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
     MPS2TZMachineClass *mmc = MPS2TZ_MACHINE_CLASS(oc);
+    static const char * const valid_cpu_types[] = {
+        ARM_CPU_TYPE_NAME("cortex-m33"),
+        NULL
+    };
 
     mc->desc = "ARM MPS2 with AN521 FPGA image for dual Cortex-M33";
     mc->default_cpus = 2;
@@ -1354,6 +1357,7 @@ static void mps2tz_an521_class_init(ObjectClass *oc, void *data)
     mc->max_cpus = mc->default_cpus;
     mmc->fpga_type = FPGA_AN521;
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m33");
+    mc->valid_cpu_types = valid_cpu_types;
     mmc->scc_id = 0x41045210;
     mmc->sysclk_frq = 20 * 1000 * 1000; /* 20MHz */
     mmc->apb_periph_frq = mmc->sysclk_frq;
@@ -1376,6 +1380,10 @@ static void mps3tz_an524_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
     MPS2TZMachineClass *mmc = MPS2TZ_MACHINE_CLASS(oc);
+    static const char * const valid_cpu_types[] = {
+        ARM_CPU_TYPE_NAME("cortex-m33"),
+        NULL
+    };
 
     mc->desc = "ARM MPS3 with AN524 FPGA image for dual Cortex-M33";
     mc->default_cpus = 2;
@@ -1383,6 +1391,7 @@ static void mps3tz_an524_class_init(ObjectClass *oc, void *data)
     mc->max_cpus = mc->default_cpus;
     mmc->fpga_type = FPGA_AN524;
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m33");
+    mc->valid_cpu_types = valid_cpu_types;
     mmc->scc_id = 0x41045240;
     mmc->sysclk_frq = 32 * 1000 * 1000; /* 32MHz */
     mmc->apb_periph_frq = mmc->sysclk_frq;
@@ -1410,6 +1419,10 @@ static void mps3tz_an547_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
     MPS2TZMachineClass *mmc = MPS2TZ_MACHINE_CLASS(oc);
+    static const char * const valid_cpu_types[] = {
+        ARM_CPU_TYPE_NAME("cortex-m55"),
+        NULL
+    };
 
     mc->desc = "ARM MPS3 with AN547 FPGA image for Cortex-M55";
     mc->default_cpus = 1;
@@ -1417,6 +1430,7 @@ static void mps3tz_an547_class_init(ObjectClass *oc, void *data)
     mc->max_cpus = mc->default_cpus;
     mmc->fpga_type = FPGA_AN547;
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m55");
+    mc->valid_cpu_types = valid_cpu_types;
     mmc->scc_id = 0x41055470;
     mmc->sysclk_frq = 32 * 1000 * 1000; /* 32MHz */
     mmc->apb_periph_frq = 25 * 1000 * 1000; /* 25MHz */
diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
index 292a180ad2..bd873cc5de 100644
--- a/hw/arm/mps2.c
+++ b/hw/arm/mps2.c
@@ -142,12 +142,6 @@ static void mps2_common_init(MachineState *machine)
     QList *oscclk;
     int i;
 
-    if (strcmp(machine->cpu_type, mc->default_cpu_type) != 0) {
-        error_report("This board can only be used with CPU %s",
-                     mc->default_cpu_type);
-        exit(1);
-    }
-
     if (machine->ram_size != mc->default_ram_size) {
         char *sz = size_to_str(mc->default_ram_size);
         error_report("Invalid RAM size, should be %s", sz);
@@ -484,10 +478,15 @@ static void mps2_an385_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
     MPS2MachineClass *mmc = MPS2_MACHINE_CLASS(oc);
+    static const char * const valid_cpu_types[] = {
+        ARM_CPU_TYPE_NAME("cortex-m3"),
+        NULL
+    };
 
     mc->desc = "ARM MPS2 with AN385 FPGA image for Cortex-M3";
     mmc->fpga_type = FPGA_AN385;
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m3");
+    mc->valid_cpu_types = valid_cpu_types;
     mmc->scc_id = 0x41043850;
     mmc->psram_base = 0x21000000;
     mmc->ethernet_base = 0x40200000;
@@ -498,10 +497,15 @@ static void mps2_an386_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
     MPS2MachineClass *mmc = MPS2_MACHINE_CLASS(oc);
+    static const char * const valid_cpu_types[] = {
+        ARM_CPU_TYPE_NAME("cortex-m4"),
+        NULL
+    };
 
     mc->desc = "ARM MPS2 with AN386 FPGA image for Cortex-M4";
     mmc->fpga_type = FPGA_AN386;
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m4");
+    mc->valid_cpu_types = valid_cpu_types;
     mmc->scc_id = 0x41043860;
     mmc->psram_base = 0x21000000;
     mmc->ethernet_base = 0x40200000;
@@ -512,10 +516,15 @@ static void mps2_an500_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
     MPS2MachineClass *mmc = MPS2_MACHINE_CLASS(oc);
+    static const char * const valid_cpu_types[] = {
+        ARM_CPU_TYPE_NAME("cortex-m7"),
+        NULL
+    };
 
     mc->desc = "ARM MPS2 with AN500 FPGA image for Cortex-M7";
     mmc->fpga_type = FPGA_AN500;
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m7");
+    mc->valid_cpu_types = valid_cpu_types;
     mmc->scc_id = 0x41045000;
     mmc->psram_base = 0x60000000;
     mmc->ethernet_base = 0xa0000000;
@@ -526,10 +535,15 @@ static void mps2_an511_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
     MPS2MachineClass *mmc = MPS2_MACHINE_CLASS(oc);
+    static const char * const valid_cpu_types[] = {
+        ARM_CPU_TYPE_NAME("cortex-m3"),
+        NULL
+    };
 
     mc->desc = "ARM MPS2 with AN511 DesignStart FPGA image for Cortex-M3";
     mmc->fpga_type = FPGA_AN511;
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m3");
+    mc->valid_cpu_types = valid_cpu_types;
     mmc->scc_id = 0x41045110;
     mmc->psram_base = 0x21000000;
     mmc->ethernet_base = 0x40200000;
diff --git a/hw/arm/msf2-som.c b/hw/arm/msf2-som.c
index 7b3106c790..eb74b23797 100644
--- a/hw/arm/msf2-som.c
+++ b/hw/arm/msf2-som.c
@@ -55,12 +55,6 @@ static void emcraft_sf2_s2s010_init(MachineState *machine)
     MemoryRegion *ddr = g_new(MemoryRegion, 1);
     Clock *m3clk;
 
-    if (strcmp(machine->cpu_type, mc->default_cpu_type) != 0) {
-        error_report("This board can only be used with CPU %s",
-                     mc->default_cpu_type);
-        exit(1);
-    }
-
     memory_region_init_ram(ddr, NULL, "ddr-ram", DDR_SIZE,
                            &error_fatal);
     memory_region_add_subregion(sysmem, DDR_BASE_ADDRESS, ddr);
@@ -106,9 +100,15 @@ static void emcraft_sf2_s2s010_init(MachineState *machine)
 
 static void emcraft_sf2_machine_init(MachineClass *mc)
 {
+    static const char * const valid_cpu_types[] = {
+        ARM_CPU_TYPE_NAME("cortex-m3"),
+        NULL
+    };
+
     mc->desc = "SmartFusion2 SOM kit from Emcraft (M2S010)";
     mc->init = emcraft_sf2_s2s010_init;
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m3");
+    mc->valid_cpu_types = valid_cpu_types;
 }
 
 DEFINE_MACHINE("emcraft-sf2", emcraft_sf2_machine_init)
diff --git a/hw/arm/musca.c b/hw/arm/musca.c
index 6eeee57c9d..770ec1a15c 100644
--- a/hw/arm/musca.c
+++ b/hw/arm/musca.c
@@ -355,7 +355,6 @@ static void musca_init(MachineState *machine)
 {
     MuscaMachineState *mms = MUSCA_MACHINE(machine);
     MuscaMachineClass *mmc = MUSCA_MACHINE_GET_CLASS(mms);
-    MachineClass *mc = MACHINE_GET_CLASS(machine);
     MemoryRegion *system_memory = get_system_memory();
     DeviceState *ssedev;
     DeviceState *dev_splitter;
@@ -366,12 +365,6 @@ static void musca_init(MachineState *machine)
     assert(mmc->num_irqs <= MUSCA_NUMIRQ_MAX);
     assert(mmc->num_mpcs <= MUSCA_MPC_MAX);
 
-    if (strcmp(machine->cpu_type, mc->default_cpu_type) != 0) {
-        error_report("This board can only be used with CPU %s",
-                     mc->default_cpu_type);
-        exit(1);
-    }
-
     mms->sysclk = clock_new(OBJECT(machine), "SYSCLK");
     clock_set_hz(mms->sysclk, SYSCLK_FRQ);
     mms->s32kclk = clock_new(OBJECT(machine), "S32KCLK");
@@ -604,11 +597,16 @@ static void musca_init(MachineState *machine)
 static void musca_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
+    static const char * const valid_cpu_types[] = {
+        ARM_CPU_TYPE_NAME("cortex-m33"),
+        NULL
+    };
 
     mc->default_cpus = 2;
     mc->min_cpus = mc->default_cpus;
     mc->max_cpus = mc->default_cpus;
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m33");
+    mc->valid_cpu_types = valid_cpu_types;
     mc->init = musca_init;
 }
 
diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index 2aef579aac..2999b8b96d 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -121,15 +121,8 @@ static NPCM7xxState *npcm7xx_create_soc(MachineState *machine,
                                         uint32_t hw_straps)
 {
     NPCM7xxMachineClass *nmc = NPCM7XX_MACHINE_GET_CLASS(machine);
-    MachineClass *mc = MACHINE_CLASS(nmc);
     Object *obj;
 
-    if (strcmp(machine->cpu_type, mc->default_cpu_type) != 0) {
-        error_report("This board can only be used with %s",
-                     mc->default_cpu_type);
-        exit(1);
-    }
-
     obj = object_new_with_props(nmc->soc_type, OBJECT(machine), "soc",
                                 &error_abort, NULL);
     object_property_set_uint(obj, "power-on-straps", hw_straps, &error_abort);
@@ -463,12 +456,17 @@ static void npcm7xx_set_soc_type(NPCM7xxMachineClass *nmc, const char *type)
 static void npcm7xx_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
+    static const char * const valid_cpu_types[] = {
+        ARM_CPU_TYPE_NAME("cortex-a9"),
+        NULL
+    };
 
     mc->no_floppy = 1;
     mc->no_cdrom = 1;
     mc->no_parallel = 1;
     mc->default_ram_id = "ram";
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a9");
+    mc->valid_cpu_types = valid_cpu_types;
 }
 
 /*
diff --git a/hw/arm/orangepi.c b/hw/arm/orangepi.c
index f3784d45ca..77e328191d 100644
--- a/hw/arm/orangepi.c
+++ b/hw/arm/orangepi.c
@@ -49,12 +49,6 @@ static void orangepi_init(MachineState *machine)
         exit(1);
     }
 
-    /* Only allow Cortex-A7 for this board */
-    if (strcmp(machine->cpu_type, ARM_CPU_TYPE_NAME("cortex-a7")) != 0) {
-        error_report("This board can only be used with cortex-a7 CPU");
-        exit(1);
-    }
-
     h3 = AW_H3(object_new(TYPE_AW_H3));
     object_property_add_child(OBJECT(machine), "soc", OBJECT(h3));
     object_unref(OBJECT(h3));
@@ -111,6 +105,11 @@ static void orangepi_init(MachineState *machine)
 
 static void orangepi_machine_init(MachineClass *mc)
 {
+    static const char * const valid_cpu_types[] = {
+        ARM_CPU_TYPE_NAME("cortex-a7"),
+        NULL
+    };
+
     mc->desc = "Orange Pi PC (Cortex-A7)";
     mc->init = orangepi_init;
     mc->block_default_type = IF_SD;
@@ -119,6 +118,7 @@ static void orangepi_machine_init(MachineClass *mc)
     mc->max_cpus = AW_H3_NUM_CPUS;
     mc->default_cpus = AW_H3_NUM_CPUS;
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a7");
+    mc->valid_cpu_types = valid_cpu_types;
     mc->default_ram_size = 1 * GiB;
     mc->default_ram_id = "orangepi.ram";
 }
-- 
2.41.0

