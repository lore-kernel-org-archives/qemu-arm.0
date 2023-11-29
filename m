Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp2384620ejt;
        Tue, 28 Nov 2023 20:22:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEnHI2DyF8SniWU/f52BYp/BzjiINUrXT37+R6EBvL8LiprkpthoOyFQCZ2b+umpAywwKO2
X-Received: by 2002:a05:620a:8385:b0:77d:7449:df18 with SMTP id pb5-20020a05620a838500b0077d7449df18mr20305183qkn.13.1701231767821;
        Tue, 28 Nov 2023 20:22:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701231767; cv=none;
        d=google.com; s=arc-20160816;
        b=KO8CTKgjSNVv0Xcs61QevCjlDLZF/x5c7P527gkPJKsRgnuLjjORkUmESMjMgekBF1
         hCfKVZR2vjzoQb3PtDyi4J20yFXp/i8rNfMkY4Q8FJXhVj/Zb1Kt4+QYUohmaujF6gHz
         QkjAkz8Qk+KNLi4Rg9Rlw+Y55Wzfvp8+1BAXl+ygmtFgalwlkvHEFDtPGkvmKHdpn6/1
         MQmY9ZZCipSqcO7ph8M+9PRoNRNwWobMr+E4D/nqDIjN9LJAHCvuLL/fhqUglKcjiiIM
         KI6pHJ6HlzoicZBJGq5sx9e6AXhD5e/16yFPQgwW3f+5RMMeIQl88xwHBoiwq2hLClbU
         BaJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:dkim-signature;
        bh=JVyfjLzyQs0XZ2Tf2HNNgNKUbfHJiHRiECV6o6YVcyQ=;
        fh=dYswejlzixW+/pN5BDGaZGk2aL8UDmDK4StoDp2TZgs=;
        b=ghDz5ZGix99jxip3dA1yCHCoseO93jEeLFVgNYYX4Fg0ViaeASTxZz8k9HwjyD/ye7
         LFKnZsjVhoJKpOJef/1FxnSaOKtzknccf8zsDjruQqNyDdbcT3W8bl9cLdg8l2Pzlybz
         48RD3yyp+nES80l7/Q1tEpax0TgNdNYliHAAXiWvqY2MvrKGpUDEcfk/4sv3EqqJeRkA
         iE2IuJmLFGOn/mAzo2rR+Wf7YJtNvVztOrbIYxEl0CXzYnDUFe/hJXr8/ilU5Z5peeaw
         D026pdtRNV9qCZo8Mo0CEEEu5pqLhwRiTvWOypnC1FkP5g8f95tNOJmATK4twc3Xfqm3
         Irfg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eyuwuWul;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n17-20020a05620a295100b0077dc534626fsi1918418qkp.409.2023.11.28.20.22.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Nov 2023 20:22:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eyuwuWul;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r8C5G-0003eB-1Y; Tue, 28 Nov 2023 23:21:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r8C5E-0003VJ-VR
 for qemu-devel@nongnu.org; Tue, 28 Nov 2023 23:21:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r8C5D-0007S5-Cw
 for qemu-devel@nongnu.org; Tue, 28 Nov 2023 23:21:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701231714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:mime-version: content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JVyfjLzyQs0XZ2Tf2HNNgNKUbfHJiHRiECV6o6YVcyQ=;
 b=eyuwuWuluvo0e84lkH25QPWeMGWQC3BnxhEav+Do3sgeWJM+Td1eYDyV99sGAvApQ4IMC1
 mzihMue1s0AJGnL3Uq+n/EkrvRBLTGA6JYWO+oVPrX9Zlg2wvrgEdI4uz4c4Fk7U0SCPuB
 2YVztU1NlUAwwrn0uU3QNoiZ7csscvw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-140-U9X8hXBdMli6dCpHfluznA-1; Tue, 28 Nov 2023 23:21:51 -0500
X-MC-Unique: U9X8hXBdMli6dCpHfluznA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 02E0380C343;
 Wed, 29 Nov 2023 04:21:50 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.61])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9EB81492BE0;
 Wed, 29 Nov 2023 04:21:42 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, peter.maydell@linaro.org,
 imammedo@redhat.com, b.galvani@gmail.com, strahinja.p.jankovic@gmail.com,
 sundeep.lkml@gmail.com, kfting@nuvoton.com, wuhaotsh@google.com,
 nieklinnenbank@gmail.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 marcin.juszkiewicz@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com,
 vijai@behindbytes.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, shan.gavin@gmail.com
Subject: [PATCH v8 9/9] hw/riscv/shakti_c: Check CPU type in
 machine_run_board_init()
Date: Wed, 29 Nov 2023 14:20:12 +1000
Message-ID: <20231129042012.277831-10-gshan@redhat.com>
In-Reply-To: <20231129042012.277831-1-gshan@redhat.com>
References: <20231129042012.277831-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: /zm0i9kbB2gg

Set mc->valid_cpu_types so that the user specified CPU type can
be validated in machine_run_board_init(). We needn't to do it
by ourselves.

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/riscv/shakti_c.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/hw/riscv/shakti_c.c b/hw/riscv/shakti_c.c
index 12ea74b032..3888034c2b 100644
--- a/hw/riscv/shakti_c.c
+++ b/hw/riscv/shakti_c.c
@@ -28,7 +28,6 @@
 #include "exec/address-spaces.h"
 #include "hw/riscv/boot.h"
 
-
 static const struct MemmapEntry {
     hwaddr base;
     hwaddr size;
@@ -47,12 +46,6 @@ static void shakti_c_machine_state_init(MachineState *mstate)
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
@@ -82,9 +75,15 @@ static void shakti_c_machine_instance_init(Object *obj)
 static void shakti_c_machine_class_init(ObjectClass *klass, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(klass);
+    static const char * const valid_cpu_types[] = {
+        RISCV_CPU_TYPE_NAME("shakti-c"),
+        NULL
+    };
+
     mc->desc = "RISC-V Board compatible with Shakti SDK";
     mc->init = shakti_c_machine_state_init;
     mc->default_cpu_type = TYPE_RISCV_CPU_SHAKTI_C;
+    mc->valid_cpu_types = valid_cpu_types;
     mc->default_ram_id = "riscv.shakti.c.ram";
 }
 
-- 
2.42.0

