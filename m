Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2412135ejc;
        Tue, 14 Nov 2023 16:04:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE9qxnnF3Ag34ggMRZGM0zvmapoVhiK6GMNz4jRTZ4qnoPkCQejVwTt1m55cQYUxfHm7aZ4
X-Received: by 2002:a05:620a:6185:b0:77a:2c0:eb27 with SMTP id or5-20020a05620a618500b0077a02c0eb27mr4025928qkn.74.1700006644121;
        Tue, 14 Nov 2023 16:04:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700006644; cv=none;
        d=google.com; s=arc-20160816;
        b=m4qxPGOP/evdnAkuoLwNtPyZ5f1hbvMTRNJwe9k8VXgsVsOZscEMOCaHpCBThSat2l
         Hytg0T1WOlvS457fOzrKCxGEroImVXMsRWk9W0z7GqM6pEU6m1y7KuK9I29gHwwx/l/o
         Zpbw5ZMuCqGQwLZPKI3QGi8QzWlqTEuC/P7pBREm7nM1PiTEH/Ed94IKYli8XCcdjp6f
         otuxai5ztC1osEKjKZ1IbG6l6UFiQmgyYj5P+y+xk7V/NVKcBnJ6L+YdWnRm6UnBgaSE
         nPJyH/26cLrAI37bSKlUmSi9DR86UGwtSEfCjiOj8U2kcq09FamWmLd+rCKg5GMBjFrF
         t0Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:dkim-signature;
        bh=FSOg4PasQI/la8jkikNl1M6J4RqsUzhTCb4HDpgfBOw=;
        fh=/T6xqUCWHJxCL2odTXkl490KMICJmjWwCPOs7M5ODd4=;
        b=sRpm/gt1p5YWAYNRmm7RlJ/ZxKRui8yyd+mvZ+smAYt38EU8o5alA1Ng+nQiIQq7H/
         VavviiPUTO4RBsQJT8R9r/+DnzBZZt4y2VyUCeDJY5tERsorABKFC9A6ruqfYbcnLzss
         TtKCe5/1De3g9sI9Y8b3EP4TMXxaS5tAjahU/X/U8NG5QFYQ51MTvbOlIhjOEgQfkUml
         g6tWhoS7n++GzecPTo/6FmPLho8msmOyQ/dUivWiA2AToR2bFX0aKwGYTZOBCr/ja433
         23uSpM5N97M/tRqaYvpJvgMxpu50oFbU7bT/uShSGi7ryY37IW/EDYbAjtIn6Q/ibBwh
         FKwA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Q85wTlsG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 20-20020a05620a04d400b00774182478b5si7480698qks.11.2023.11.14.16.04.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Nov 2023 16:04:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Q85wTlsG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r33NY-0001mA-KH; Tue, 14 Nov 2023 19:03:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r33NX-0001iP-Iv
 for qemu-arm@nongnu.org; Tue, 14 Nov 2023 19:03:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r33NW-0008Si-23
 for qemu-arm@nongnu.org; Tue, 14 Nov 2023 19:03:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700006613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:mime-version: content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FSOg4PasQI/la8jkikNl1M6J4RqsUzhTCb4HDpgfBOw=;
 b=Q85wTlsGEHEnHv8i5rFpG4UPWaV//LcpmNkXoasjrVEW+oAXa7cY2EDbAPmegkkvYWleHr
 Z0x3KYNQzGafcQRvJEKzK2GEbxvQmEw/9nYhs6bXJ7YpGenoqTip0tGS/CNR2YzSKRCGPR
 qGtKDYRn17R1NS8rP7kbOoqT4fM3bBc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-541-zeiS33GxNX6YXstdEthyHA-1; Tue, 14 Nov 2023 19:03:18 -0500
X-MC-Unique: zeiS33GxNX6YXstdEthyHA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D78DF185A780;
 Wed, 15 Nov 2023 00:03:16 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 28EAEC15885;
 Wed, 15 Nov 2023 00:03:03 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 imp@bsdimp.com, kevans@freebsd.org, richard.henderson@linaro.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, imammedo@redhat.com,
 philmd@linaro.org, b.galvani@gmail.com, strahinja.p.jankovic@gmail.com,
 sundeep.lkml@gmail.com, kfting@nuvoton.com, wuhaotsh@google.com,
 nieklinnenbank@gmail.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 marcin.juszkiewicz@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, wangyanan55@huawei.com, laurent@vivier.eu,
 vijai@behindbytes.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, mrolnik@gmail.com, edgar.iglesias@gmail.com,
 bcain@quicinc.com, gaosong@loongson.cn, aurelien@aurel32.net,
 jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com,
 chenhuacai@kernel.org, shorne@gmail.com, npiggin@gmail.com, clg@kaod.org,
 ysato@users.sourceforge.jp, kbastian@mail.uni-paderborn.de,
 jcmvbkbc@gmail.com, shan.gavin@gmail.com
Subject: [PATCH v5 28/31] hw/arm/virt: Check CPU type in
 machine_run_board_init()
Date: Wed, 15 Nov 2023 09:56:25 +1000
Message-ID: <20231114235628.534334-29-gshan@redhat.com>
In-Reply-To: <20231114235628.534334-1-gshan@redhat.com>
References: <20231114235628.534334-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: BKnUDeAzWwPm

Set mc->valid_cpu_types so that the user specified CPU type can be
validated in machine_run_board_init(). We needn't to do the check
by ourselves.

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/arm/virt.c | 21 +++------------------
 1 file changed, 3 insertions(+), 18 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 668c0d3194..1d149cf7a9 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -204,7 +204,7 @@ static const int a15irqmap[] = {
     [VIRT_PLATFORM_BUS] = 112, /* ...to 112 + PLATFORM_BUS_NUM_IRQS -1 */
 };
 
-static const char *valid_cpus[] = {
+static const char * const valid_cpu_types[] = {
 #ifdef CONFIG_TCG
     ARM_CPU_TYPE_NAME("cortex-a7"),
     ARM_CPU_TYPE_NAME("cortex-a15"),
@@ -224,20 +224,9 @@ static const char *valid_cpus[] = {
     ARM_CPU_TYPE_NAME("host"),
 #endif
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
@@ -2041,11 +2030,6 @@ static void machvirt_init(MachineState *machine)
     unsigned int smp_cpus = machine->smp.cpus;
     unsigned int max_cpus = machine->smp.max_cpus;
 
-    if (!cpu_type_valid(machine->cpu_type)) {
-        error_report("mach-virt: CPU type %s not supported", machine->cpu_type);
-        exit(1);
-    }
-
     possible_cpus = mc->possible_cpu_arch_ids(machine);
 
     /*
@@ -2965,6 +2949,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
 #else
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("max");
 #endif
+    mc->valid_cpu_types = valid_cpu_types;
     mc->get_default_cpu_node_id = virt_get_default_cpu_node_id;
     mc->kvm_type = virt_kvm_type;
     assert(!mc->get_hotplug_handler);
-- 
2.41.0

