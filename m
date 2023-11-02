Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp63910eja;
        Wed, 1 Nov 2023 17:37:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlRx/YPAKJyVeJLnN6CCpn5PEHELLPqY2crYkVBT13CizrdCj8EakHT6UJee9MTidVIXvx
X-Received: by 2002:a05:620a:51d2:b0:767:e993:5702 with SMTP id cx18-20020a05620a51d200b00767e9935702mr16280572qkb.35.1698885423441;
        Wed, 01 Nov 2023 17:37:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698885423; cv=none;
        d=google.com; s=arc-20160816;
        b=RQL1N1n6x6J4oZZWn84yukKOcbf0EfADZnlFLX7HCj/1Yt3Dm9K7chmBuOaXHDjcml
         mEmZo8Ms0w7NRhSScXdQbFCur9cTFpJ3q9JPtTOiq4wPiq0vtJZqLsme3S+9RvU5xduU
         WfTOBZok05dVZv5Y2t9lPIjHdatou9wW+sGjspyv+F3Bha0tcD1Wb0o9WtZEUtUAntz5
         k874Ns9iKOloi3tobrxk66fBEQ2wRd1zjH88Kh6sShx0GZAcpsIJYewyuTEtVtbQocv6
         qFN4cg+EzMX8Ji8y9GnDeJ26GqIYaaPvhKS/DizZAzAFJbAhRfrOHjhLEEQbc6x35rNQ
         i0zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:dkim-signature;
        bh=hpeKOnNHDzdleIFAJE8H9OmrGjfXzc6pC5SCT7yL3NQ=;
        fh=rgQPcVbcOjZgL6aK5WmEt+m6+w+zLiqfGJUo4Bg6NIA=;
        b=UNGvyDMKcFfyQjyB+hnlCPG9ZBdlD7v5C8YH90JUC3679Q3w7Qp/+IfJGDOicanmVo
         Rf7AgDQl0B79RdAmV73Qdny4LwasqwKPCYmoPt65ICnFoQoiqPoFhnfeSRS43F+TSYtk
         DqXH4oZdpgQlnqRpxAeytO7qdCd9kZBMc42L3/K49pvJsreohQbts0AZl6Cjz4GhIwNI
         UysMAZ7bjsdZybkEQoj+rdJpICJ+r4aNwyQrirLRwDsAFrIWA/f1UxHp/tAsFofqL2bU
         vVkEjAo5ytdcbdtK+Y6i1xJ9gN5i7+x3MlC1TTIFpJqF4bRkUWuQpkvAqlTBWvdu6z5O
         IhUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Z8a2jUat;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id qd17-20020a05620a659100b0076daa449cb8si3469243qkn.224.2023.11.01.17.37.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Nov 2023 17:37:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Z8a2jUat;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qyLfN-00025M-LS; Wed, 01 Nov 2023 20:34:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qyLfM-0001xs-7I
 for qemu-arm@nongnu.org; Wed, 01 Nov 2023 20:34:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qyLfJ-0003ye-J0
 for qemu-arm@nongnu.org; Wed, 01 Nov 2023 20:34:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698885268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:mime-version: content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hpeKOnNHDzdleIFAJE8H9OmrGjfXzc6pC5SCT7yL3NQ=;
 b=Z8a2jUats5dDraFRZD+W02Pnmcyuxl61upPuReIXc0Zw4deEYCl18zppDgT3iUxrPyJR7m
 1vHArmp3g1McIMPenK/hkzTC9n8X1daEaVb2MOZMKBpAc3B2Pok1G0cxd5Sw7uddAlwDRc
 ma//MNRiJRGxnCJTugT8eHwUBiBVn1o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-575-32QwqszdMMy1-_97uBo5iQ-1; Wed, 01 Nov 2023 20:34:25 -0400
X-MC-Unique: 32QwqszdMMy1-_97uBo5iQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 47A1981B560;
 Thu,  2 Nov 2023 00:34:23 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DE972C0FE05;
 Thu,  2 Nov 2023 00:34:07 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, philmd@linaro.org, clg@kaod.org,
 imammedo@redhat.com, imp@bsdimp.com, kevans@freebsd.org,
 richard.henderson@linaro.org, pbonzini@redhat.com,
 peter.maydell@linaro.org, b.galvani@gmail.com,
 strahinja.p.jankovic@gmail.com, sundeep.lkml@gmail.com, kfting@nuvoton.com,
 wuhaotsh@google.com, nieklinnenbank@gmail.com, rad@semihalf.com,
 quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, wangyanan55@huawei.com,
 laurent@vivier.eu, vijai@behindbytes.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, mrolnik@gmail.com,
 edgar.iglesias@gmail.com, bcain@quicinc.com, gaosong@loongson.cn,
 aurelien@aurel32.net, jiaxun.yang@flygoat.com,
 aleksandar.rikalo@syrmia.com, chenhuacai@kernel.org, crwulff@gmail.com,
 marex@denx.de, shorne@gmail.com, npiggin@gmail.com,
 ysato@users.sourceforge.jp, david@redhat.com, thuth@redhat.com,
 iii@linux.ibm.com, kbastian@mail.uni-paderborn.de, jcmvbkbc@gmail.com,
 shan.gavin@gmail.com
Subject: [PATCH v4 33/33] hw/riscv/shakti_c: Check CPU type in
 machine_run_board_init()
Date: Thu,  2 Nov 2023 10:25:00 +1000
Message-ID: <20231102002500.1750692-34-gshan@redhat.com>
In-Reply-To: <20231102002500.1750692-1-gshan@redhat.com>
References: <20231102002500.1750692-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
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
X-TUID: aR+a4wYhpoSZ

Set mc->valid_cpu_types so that the user specified CPU type can
be validated in machine_run_board_init(). We needn't to do it
by ourselves.

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/riscv/shakti_c.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/hw/riscv/shakti_c.c b/hw/riscv/shakti_c.c
index 12ea74b032..fc83ed4db4 100644
--- a/hw/riscv/shakti_c.c
+++ b/hw/riscv/shakti_c.c
@@ -28,6 +28,10 @@
 #include "exec/address-spaces.h"
 #include "hw/riscv/boot.h"
 
+static const char * const valid_cpu_types[] = {
+    RISCV_CPU_TYPE_NAME("shakti-c"),
+    NULL
+};
 
 static const struct MemmapEntry {
     hwaddr base;
@@ -47,12 +51,6 @@ static void shakti_c_machine_state_init(MachineState *mstate)
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
@@ -85,6 +83,7 @@ static void shakti_c_machine_class_init(ObjectClass *klass, void *data)
     mc->desc = "RISC-V Board compatible with Shakti SDK";
     mc->init = shakti_c_machine_state_init;
     mc->default_cpu_type = TYPE_RISCV_CPU_SHAKTI_C;
+    mc->valid_cpu_types = valid_cpu_types;
     mc->default_ram_id = "riscv.shakti.c.ram";
 }
 
-- 
2.41.0

