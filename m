Received: by 2002:a17:906:2484:b0:98d:b2f5:1316 with SMTP id e4csp198154ejb;
        Tue, 25 Jul 2023 17:35:16 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFpmnXxFqQH8TUAvodi7Mq8k0/H5GXTB1srIJB9Q8FREfKZWodh3htL8WGs0LENgxsRYuTg
X-Received: by 2002:a05:622a:346:b0:403:ea90:dfa9 with SMTP id r6-20020a05622a034600b00403ea90dfa9mr572160qtw.60.1690331716020;
        Tue, 25 Jul 2023 17:35:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690331716; cv=none;
        d=google.com; s=arc-20160816;
        b=UBGJQyE6pNX1VZR4xb1uXRAGwBfx2Yw8BorukOFxenyeFTLK0/5DiYsnpNPqic8AoM
         +AVj8ZCM1xb97Oh4eezmFHL1ou7q3bqVMLb26Vo8dNkdSnUnwhr9LhIsSiukNwQIF8Ms
         2ziaHVyQZ7kqej/A8NwKunBSRslpIs6gS8OAs0q+kzMoi8+EvDMP8BDqZ0MxeN/fcb83
         yzCsCut/9Q1uKyOhmp/4vxDebHx89MLsmLHZYGZBqXrku7Rpvk+o+hjD7Uq8lFLfFn7C
         NAbMfzMk0jrnVBk4I0bVXdQotg4AAzTnPHMtaay1bHCDs4k4tJT5IcP5OtGjS+cjg4Te
         bDYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=F5xerAzameuwUcWJLh2CpRUU0MVacN+v0fS5ArJFekU=;
        fh=FuziOALKyXfrMoq6H15/q1ev+uC2b5q3xHaYPu2Bj/E=;
        b=XOxBPvThtxmjSLVlhFxm53e+t27n2Gm1uBiIbjb79jQ4xNgT4IH9L+sW7qweiyIdpI
         /7neRvz/nmEvf5WgcIOlTxQHpy8rJb6LiNjjFRNC8kKCMWweyXhd7dmxDGsQSsBUFNqM
         ZGlBDWx+j4+iT9+DBg5o5OQLlgzzXkkAiNwoVMrdu8AuzU4TH3wkdSAznckiXYmLMFbp
         VCASw79QS3vqT9fvyBcUtIce0SEc9ZZT3EbEoPkLtETFOyLudLt+ex/2kL7DHTFpAnNA
         Vod4yLm5ySr1SSegqsBPLkbInTZj/S88QjatQsI+sGrLL6Iv8ktf+3BEGusltTpb0Cra
         I4lQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Xo1326CH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l7-20020a05622a050700b00403abf5b44csi7146355qtx.264.2023.07.25.17.35.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jul 2023 17:35:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Xo1326CH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qOSUC-0002hb-Ld; Tue, 25 Jul 2023 20:34:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qOSU4-0002NH-Ie
 for qemu-devel@nongnu.org; Tue, 25 Jul 2023 20:34:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qOSU2-0003Gn-5g
 for qemu-devel@nongnu.org; Tue, 25 Jul 2023 20:34:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690331669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F5xerAzameuwUcWJLh2CpRUU0MVacN+v0fS5ArJFekU=;
 b=Xo1326CH7bHp05yFTVtSs5oqgmZCPgo6swhrFCtcs8gQALFCTeMarUVEE0IBPN2/lz1jcH
 nFzKAFU6/O11ns6wvPP/XxGRlulyezdtnxyUd45BWpljXTqKxN4tmsuNTOTNf0XN/pY0cQ
 6zKWGprSLm3bhyqcniNhqIUdg3r9TKA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-606-L4uT3TutNh2ip98KgVrFtQ-1; Tue, 25 Jul 2023 20:34:24 -0400
X-MC-Unique: L4uT3TutNh2ip98KgVrFtQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C6C668008A4;
 Wed, 26 Jul 2023 00:34:22 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.80])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5EEE54A9004;
 Wed, 26 Jul 2023 00:34:14 +0000 (UTC)
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
Subject: [PATCH v2 8/8] hw/riscv/shakti_c: Check CPU type in
 machine_run_board_init()
Date: Wed, 26 Jul 2023 10:32:05 +1000
Message-ID: <20230726003205.1599788-9-gshan@redhat.com>
In-Reply-To: <20230726003205.1599788-1-gshan@redhat.com>
References: <20230726003205.1599788-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
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
X-TUID: HffisWqn1AcO

Set mc->valid_cpu_{types, models} so that the specified CPU type
can be checked in machine_run_board_init(). We needn't to do the
check by ourselves.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 hw/riscv/shakti_c.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/hw/riscv/shakti_c.c b/hw/riscv/shakti_c.c
index 12ea74b032..0bd59d47cd 100644
--- a/hw/riscv/shakti_c.c
+++ b/hw/riscv/shakti_c.c
@@ -28,6 +28,15 @@
 #include "exec/address-spaces.h"
 #include "hw/riscv/boot.h"
 
+static const char * const valid_cpu_types[] = {
+    RISCV_CPU_TYPE_NAME("shakti-c"),
+    NULL
+};
+
+static const char * const valid_cpu_models[] = {
+    "shakti-c",
+    NULL
+};
 
 static const struct MemmapEntry {
     hwaddr base;
@@ -47,12 +56,6 @@ static void shakti_c_machine_state_init(MachineState *mstate)
     ShaktiCMachineState *sms = RISCV_SHAKTI_MACHINE(mstate);
     MemoryRegion *system_memory = get_system_memory();
 
-    /* Allow only Shakti C CPU for this platform */
-    if (strcmp(mstate->cpu_type, TYPE_RISCV_CPU_SHAKTI_C) != 0) {
-        error_report("This board can only be used with Shakti C CPU");
-        exit(1);
-    }
-
     /* Initialize SoC */
     object_initialize_child(OBJECT(mstate), "soc", &sms->soc,
                             TYPE_RISCV_SHAKTI_SOC);
@@ -85,6 +88,8 @@ static void shakti_c_machine_class_init(ObjectClass *klass, void *data)
     mc->desc = "RISC-V Board compatible with Shakti SDK";
     mc->init = shakti_c_machine_state_init;
     mc->default_cpu_type = TYPE_RISCV_CPU_SHAKTI_C;
+    mc->valid_cpu_types = valid_cpu_types;
+    mc->valid_cpu_models = valid_cpu_models;
     mc->default_ram_id = "riscv.shakti.c.ram";
 }
 
-- 
2.41.0

