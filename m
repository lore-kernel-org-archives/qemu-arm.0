Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp62165eja;
        Wed, 1 Nov 2023 17:32:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHzaDlYG3EXltspqVblGX35Vg0ow8AIp5B7n2WdAtGv6W0gURiCutIfFtHmrK4yqtJtvZi
X-Received: by 2002:a05:622a:11c5:b0:418:cd5:ac97 with SMTP id n5-20020a05622a11c500b004180cd5ac97mr18678410qtk.65.1698885140948;
        Wed, 01 Nov 2023 17:32:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698885140; cv=none;
        d=google.com; s=arc-20160816;
        b=OjU4lIzUUa39BJfu24mdjkFuLVPuauOBuL8koSmb9MrZIYPm1bqAzl3R8XhbywS/05
         Reez7JjyYWuvPCAKpdO3DsB7qlykrDKm3gLFmbC7+GOT6FgHHtgw9caTIbhqsUXbdmGv
         AteVUz43wByolUzSD0TzVO+3sQFub3b47T6UsgYZ6LKqMtvCyQIONv2M0uaxG3w5L6nW
         kisofX/UelDXx51igLIvhcZ1GaZFTJt+l+11ClbmvN4G+vGqgFdqtwApd7oMqEAjfEaZ
         WmkYwFaeIY5mkhULT6Q3T3UFJSkjWtyPViaBdZMy43UmTFhDVV5qMAPJjQP/FOGHlsYG
         c4pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=HAmJR97N1p+HFxaLy1sg9/QiaB8n3tU9O4qQ7UKAECs=;
        fh=rgQPcVbcOjZgL6aK5WmEt+m6+w+zLiqfGJUo4Bg6NIA=;
        b=zblB++Og8ciNT+NhX87e4Lq08CfEFLRe9HgX9aEPPy25oFytkYtaZBM/rANiWfQ70U
         wgKYr+xgQ1Q0ErZe6+YqxAyYlLpxUVIBR4bGNB4OF1D0bcUBPlO4XKmJCHFci5D6qkyu
         TrtvXzBGEcGLN6Z5IVlkRquybhuc5cz+/h14XpZwPWQ6zmco96wxyfMNeqsskBdEyPCX
         daiwsumQj30a/uQ1Ac7hCVP7uiP2pnHdfo0SAc3oll1xma5nhTEhBU+A4Q6eD9tEZGk/
         poPV5qZ8RCPFBZ+EDSvo4c8YwpYF3FUoti4cs1Uwc7z9nBgy+VtEui6w+LCcogdfOfIF
         A6Aw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=M6KE6RV7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b22-20020a05622a021600b0041974779343si3368436qtx.479.2023.11.01.17.32.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Nov 2023 17:32:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=M6KE6RV7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qyLcl-0001EC-W6; Wed, 01 Nov 2023 20:31:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qyLch-0000vc-Fp
 for qemu-devel@nongnu.org; Wed, 01 Nov 2023 20:31:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qyLcf-0002eC-F0
 for qemu-devel@nongnu.org; Wed, 01 Nov 2023 20:31:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698885104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HAmJR97N1p+HFxaLy1sg9/QiaB8n3tU9O4qQ7UKAECs=;
 b=M6KE6RV7Gf91roE3KsT6Kc+A8LqBuqefYbj0tnTIJKw2rYUsPD4Nclc8da4u91L3acvAOm
 YD7mD9U5kRy/q0vyQ2+VkCawKxTbKblYgoOLKtmOvW2EWExqVRpdeTtTEoyzUyHhwZ0FP/
 3bFo4di7QWQpGpTrtQth0Aj6gnoDDyY=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-487-GKHcXHFcMUyBz_Y_dcI7mQ-1; Wed,
 01 Nov 2023 20:31:43 -0400
X-MC-Unique: GKHcXHFcMUyBz_Y_dcI7mQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3ED803826D26;
 Thu,  2 Nov 2023 00:31:41 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 19878C0FE05;
 Thu,  2 Nov 2023 00:31:24 +0000 (UTC)
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
Subject: [PATCH v4 23/33] target/nios2: Implement nios2_cpu_list()
Date: Thu,  2 Nov 2023 10:24:50 +1000
Message-ID: <20231102002500.1750692-24-gshan@redhat.com>
In-Reply-To: <20231102002500.1750692-1-gshan@redhat.com>
References: <20231102002500.1750692-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
X-TUID: y3VP0ZqQm4qU

Implement nios2_cpu_list() to support cpu_list(). With this applied,
the available CPU model names, same to the CPU type names, are shown
as below.

  $ ./build/qemu-system-nios2 -cpu ?
  Available CPUs:
    nios2-cpu

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 target/nios2/cpu.c | 20 ++++++++++++++++++++
 target/nios2/cpu.h |  3 +++
 2 files changed, 23 insertions(+)

diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index 15e499f828..5981418aee 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -21,6 +21,7 @@
 #include "qemu/osdep.h"
 #include "qemu/module.h"
 #include "qapi/error.h"
+#include "qemu/qemu-print.h"
 #include "cpu.h"
 #include "exec/log.h"
 #include "gdbstub/helpers.h"
@@ -111,6 +112,25 @@ static void iic_set_irq(void *opaque, int irq, int level)
 }
 #endif
 
+static void nios2_cpu_list_entry(gpointer data, gpointer user_data)
+{
+    const char *typename = object_class_get_name(OBJECT_CLASS(data));
+    char *model = cpu_model_from_type(typename);
+
+    qemu_printf("  %s\n", model);
+    g_free(model);
+}
+
+void nios2_cpu_list(void)
+{
+    GSList *list;
+
+    list = object_class_get_list_sorted(TYPE_NIOS2_CPU, false);
+    qemu_printf("Available CPUs:\n");
+    g_slist_foreach(list, nios2_cpu_list_entry, NULL);
+    g_slist_free(list);
+}
+
 static void nios2_cpu_initfn(Object *obj)
 {
 #if !defined(CONFIG_USER_ONLY)
diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 70b6377a4f..93bf84b620 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -291,6 +291,9 @@ bool nios2_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                         MMUAccessType access_type, int mmu_idx,
                         bool probe, uintptr_t retaddr);
 #endif
+void nios2_cpu_list(void);
+
+#define cpu_list nios2_cpu_list
 
 typedef CPUNios2State CPUArchState;
 typedef Nios2CPU ArchCPU;
-- 
2.41.0

