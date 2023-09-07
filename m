Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp3155632ejb;
        Wed, 6 Sep 2023 17:45:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBiaUhna1G5Z7IRk4U0Q5Ba35HSVjzPV/ZId1OdXB/7NnbUz+3xC78WSuZvcrupl+Igf0s
X-Received: by 2002:a05:622a:1889:b0:410:a562:b420 with SMTP id v9-20020a05622a188900b00410a562b420mr1791935qtc.4.1694047530880;
        Wed, 06 Sep 2023 17:45:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694047530; cv=none;
        d=google.com; s=arc-20160816;
        b=f9p0aIjh7ADg2OgQgOiVplQU/ARyi06v8ElzcALofh/dONTdD7+ZZD8eFISFhtra5P
         VQhs4u9ccrv3vH8eaeapUUOE67RPG1W5FFldAK+wUNLkQQapWL3aSdIGni033BkhuUAp
         d4rOYrUck4Z0hpAOEFhoFo/+UJeY6J9SYpOmNzqaWsf3kCLIUCst6KKfa/USCTH0ls3L
         mkqZNxWvX/Cocr8Tw3Jf0+om58XhiSU5um6TCiFv39cWwnfX6ZMEUWD0YOTIgNX/9T9C
         I9dDj1zAFrtpeBUXcsGMHx6Iwu4yDIvvrb7nPwu12m+ECgRD+kXOsh+4QUS8hko0NCxh
         +OMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=5MaAI4QaueGmh2GOqWg63+CJNCCKsD3mxcIbrX6dw+c=;
        fh=kk2WWDSe9SCzWyjzequbgooYc9A8PDm7nTb22zWaiac=;
        b=iQhRHaj+o2DerBLa14VwYkuKMg4qgtK7TvFXWNhFQLSAeSS10+aAhPnawXzRTnsgsb
         bC00ccPFL4tvj3twtbQTGRJ6Mb3Az7HozM+F0OwzF/e/lW3VaIc5IpOcdW1llUVuf8wY
         MvinYj2nQbEpzgbdTwDPY+rgD5adv1i8DEAdexOcDkzIbCuvk+pd87U0GCd7QXLaeVH9
         WGkMZYN650XbAVVEzv3mpgft9AgOXRE6QM/gFnQqp6XXeIYGRsFw0RXBGANGTuJgvJ82
         fSpVdq4GY9eOJyVz9X6laEbH40ne3FCIqfn1gxtZUkSvnfQa7Mn9SSu7CWUBmG3CyXBE
         oD+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LXgXmSXZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t34-20020a05622a182200b004055a6f662asi10583114qtc.267.2023.09.06.17.45.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Sep 2023 17:45:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LXgXmSXZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qe38y-0004OU-SR; Wed, 06 Sep 2023 20:45:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qe38w-0004D0-Tt
 for qemu-arm@nongnu.org; Wed, 06 Sep 2023 20:45:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qe38u-0003km-FC
 for qemu-arm@nongnu.org; Wed, 06 Sep 2023 20:45:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694047507;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5MaAI4QaueGmh2GOqWg63+CJNCCKsD3mxcIbrX6dw+c=;
 b=LXgXmSXZs/DfYeGeVrM8oTDkWitHLE4RH7j+4tCsY4K3I63ApfCRmpIODOBcfnqZkEdMV4
 0rGdJu7O+jKorPADN+MedwYwE+6gqadJNV87Y9OR9IgF4sCky8UIiIfpRkc/krZyZoCm0A
 /ZxZiUairZTAqhSKfpyYYhjITnHYRcY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-132-AWicWxSUPyO4E1PC8tLffQ-1; Wed, 06 Sep 2023 20:45:04 -0400
X-MC-Unique: AWicWxSUPyO4E1PC8tLffQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 25A6E8015AA;
 Thu,  7 Sep 2023 00:45:02 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6069DC03295;
 Thu,  7 Sep 2023 00:44:47 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, imp@bsdimp.com, kevans@freebsd.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, peter.maydell@linaro.org, b.galvani@gmail.com,
 strahinja.p.jankovic@gmail.com, sundeep.lkml@gmail.com, kfting@nuvoton.com,
 wuhaotsh@google.com, nieklinnenbank@gmail.com, rad@semihalf.com,
 quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 laurent@vivier.eu, vijai@behindbytes.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 richard.henderson@linaro.org, mrolnik@gmail.com, edgar.iglesias@gmail.com,
 bcain@quicinc.com, gaosong@loongson.cn, yangxiaojuan@loongson.cn,
 aurelien@aurel32.net, jiaxun.yang@flygoat.com,
 aleksandar.rikalo@syrmia.com, chenhuacai@kernel.org, crwulff@gmail.com,
 marex@denx.de, shorne@gmail.com, clg@kaod.org, david@gibson.dropbear.id.au,
 groug@kaod.org, npiggin@gmail.com, ysato@users.sourceforge.jp,
 david@redhat.com, thuth@redhat.com, iii@linux.ibm.com,
 mark.cave-ayland@ilande.co.uk, atar4qemu@gmail.com,
 kbastian@mail.uni-paderborn.de, jcmvbkbc@gmail.com, pbonzini@redhat.com,
 imammedo@redhat.com, shan.gavin@gmail.com
Subject: [PATCH v3 32/32] hw/riscv/shakti_c: Check CPU type in
 machine_run_board_init()
Date: Thu,  7 Sep 2023 10:35:53 +1000
Message-ID: <20230907003553.1636896-33-gshan@redhat.com>
In-Reply-To: <20230907003553.1636896-1-gshan@redhat.com>
References: <20230907003553.1636896-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 2636lQsh4V9g

Set mc->valid_cpu_types so that the user specified CPU type can
be validated in machine_run_board_init(). We needn't to do it
by ourselves.

Signed-off-by: Gavin Shan <gshan@redhat.com>
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

