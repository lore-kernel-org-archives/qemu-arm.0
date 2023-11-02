Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp63086eja;
        Wed, 1 Nov 2023 17:34:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPOQPeQsnBrBStwsF+BT6+qsQcfzCCggKUfCBfwMPf2kiP2nzAopHQJfvTbrj8PZYow0+V
X-Received: by 2002:a05:620a:3905:b0:76c:ea67:38e4 with SMTP id qr5-20020a05620a390500b0076cea6738e4mr11962344qkn.12.1698885286561;
        Wed, 01 Nov 2023 17:34:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698885286; cv=none;
        d=google.com; s=arc-20160816;
        b=geoxJdFpj4w3k0X7gK+nPBxFCPOY/2ge6J5l5eOa3ETiNdKRorZ09ZN1yL//mRwuS3
         5aDFoRX07uVVtjLoEMB/3ZbGB2FqW92OJphPe48ciHBCYBffC0flkfTs8tMEEqfABKkx
         081ukLZX5lNG/xZV1MQX/qVX9eyIupW0EdISq8kgtpc5l3eVihkTZA9c/zjjGbdjo+pt
         5LkRFcWlfgnF6+K5chTI0rsmAvV0XQIrCX5e5mJW4rDvcGA10mYMRxCxw6sSWd+uFoNr
         uV7Nis9BZqbeyMyTZqKjdN8MWUVUa2hgp6b3jXyPo6glKY2//Wp52aXVnDZ4c3fDR5QC
         6qKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=9Qbo0qZ3aA5N9pLrsGCE9k5OST9RFUJZn12kzjpEtwk=;
        fh=rgQPcVbcOjZgL6aK5WmEt+m6+w+zLiqfGJUo4Bg6NIA=;
        b=D6ZcGuROIP6FTZmC9ZU62JVSBystYax3YJzMVwm7rBYyztPsH8pH8wKnIDAL1ccQH/
         7c6TPtWHoj8E1D8n/Agx7ojVeP47ONGGc2xXj6dP2L5QPmbnmfG0QOVYW3QZKL2Y+SU1
         2Iy38h19qEsJlkd0ykjR9FUKM3LO/6rzJSS6P1EMSSnbsl+82cdks5RRnau4m6OjT2+6
         2puL8P8ENiOaHiEJlOV8zfN4pSJuCIPfpfQ2FlkRSousa3LOmq/XLipqpb3ss/F9RFCL
         3TRnbXR1Xj1XNOLbRRLPrZFSPYi0LMCQ0DW9ZgVNSUMT4wYJIlVM7v8r6K5A0esUEGSm
         LJzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UOIDKwq5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j3-20020a05620a410300b0076d74f9006dsi3807003qko.330.2023.11.01.17.34.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Nov 2023 17:34:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UOIDKwq5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qyLeB-00053t-1u; Wed, 01 Nov 2023 20:33:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qyLe7-0004op-0k
 for qemu-arm@nongnu.org; Wed, 01 Nov 2023 20:33:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qyLdu-00036u-Hh
 for qemu-arm@nongnu.org; Wed, 01 Nov 2023 20:33:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698885175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9Qbo0qZ3aA5N9pLrsGCE9k5OST9RFUJZn12kzjpEtwk=;
 b=UOIDKwq5wZCBII94gd3j6yQ2FyPatxn9RjGZZcG9EhsdtxCb13vhFeDKh/ECGcwUXRGIyk
 74m6N8y/C8fomFMA6XGfH4rRB+mp1K70nHU9Sh0uLdlIerzFNdwBrT4T8JzZnJQ+cRlTPE
 bXwBC+0yMoRzkysi1CKH8nGG9S+4kdM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-536-e0Wfj5SbOs-cYfKU85pwaw-1; Wed, 01 Nov 2023 20:32:49 -0400
X-MC-Unique: e0Wfj5SbOs-cYfKU85pwaw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F2DD8185A781;
 Thu,  2 Nov 2023 00:32:46 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 64D62C0FE05;
 Thu,  2 Nov 2023 00:32:31 +0000 (UTC)
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
Subject: [PATCH v4 27/33] machine: Introduce helper is_cpu_type_supported()
Date: Thu,  2 Nov 2023 10:24:54 +1000
Message-ID: <20231102002500.1750692-28-gshan@redhat.com>
In-Reply-To: <20231102002500.1750692-1-gshan@redhat.com>
References: <20231102002500.1750692-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: UY6l4eBPW8i3

The logic, to check if the specified CPU type is supported in
machine_run_board_init(), is independent enough. Factor it out into
helper is_cpu_type_supported(). machine_run_board_init() looks a bit
clean with this. Since we're here, @machine_class is renamed to @mc
to avoid multiple line spanning of code. The comments are tweaked a
bit either.

No functional change intended.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 hw/core/machine.c | 82 +++++++++++++++++++++++++----------------------
 1 file changed, 44 insertions(+), 38 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 1c17a0d5bf..2d78692df1 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1386,13 +1386,51 @@ out:
     return r;
 }
 
+static void is_cpu_type_supported(MachineState *machine, Error **errp)
+{
+    MachineClass *mc = MACHINE_GET_CLASS(machine);
+    ObjectClass *oc = object_class_by_name(machine->cpu_type);
+    CPUClass *cc;
+    int i;
+
+    /*
+     * Check if the user specified CPU type is supported when the valid
+     * CPU types have been determined. Note that the user specified CPU
+     * type is provided through '-cpu' option.
+     */
+    if (mc->valid_cpu_types && machine->cpu_type) {
+        for (i = 0; mc->valid_cpu_types[i]; i++) {
+            if (object_class_dynamic_cast(oc, mc->valid_cpu_types[i])) {
+                break;
+            }
+        }
+
+        /* The user specified CPU type isn't valid */
+        if (!mc->valid_cpu_types[i]) {
+            error_setg(errp, "Invalid CPU type: %s", machine->cpu_type);
+            error_append_hint(errp, "The valid types are: %s",
+                              mc->valid_cpu_types[0]);
+            for (i = 1; mc->valid_cpu_types[i]; i++) {
+                error_append_hint(errp, ", %s", mc->valid_cpu_types[i]);
+            }
+
+            error_append_hint(errp, "\n");
+            return;
+        }
+    }
+
+    /* Check if CPU type is deprecated and warn if so */
+    cc = CPU_CLASS(oc);
+    if (cc && cc->deprecation_note) {
+        warn_report("CPU model %s is deprecated -- %s",
+                    machine->cpu_type, cc->deprecation_note);
+    }
+}
 
 void machine_run_board_init(MachineState *machine, const char *mem_path, Error **errp)
 {
     ERRP_GUARD();
     MachineClass *machine_class = MACHINE_GET_CLASS(machine);
-    ObjectClass *oc = object_class_by_name(machine->cpu_type);
-    CPUClass *cc;
     Error *local_err = NULL;
 
     /* This checkpoint is required by replay to separate prior clock
@@ -1448,42 +1486,10 @@ void machine_run_board_init(MachineState *machine, const char *mem_path, Error *
         machine->ram = machine_consume_memdev(machine, machine->memdev);
     }
 
-    /* If the machine supports the valid_cpu_types check and the user
-     * specified a CPU with -cpu check here that the user CPU is supported.
-     */
-    if (machine_class->valid_cpu_types && machine->cpu_type) {
-        int i;
-
-        for (i = 0; machine_class->valid_cpu_types[i]; i++) {
-            if (object_class_dynamic_cast(oc,
-                                          machine_class->valid_cpu_types[i])) {
-                /* The user specified CPU is in the valid field, we are
-                 * good to go.
-                 */
-                break;
-            }
-        }
-
-        if (!machine_class->valid_cpu_types[i]) {
-            /* The user specified CPU is not valid */
-            error_setg(&local_err, "Invalid CPU type: %s", machine->cpu_type);
-            error_append_hint(&local_err, "The valid types are: %s",
-                              machine_class->valid_cpu_types[0]);
-            for (i = 1; machine_class->valid_cpu_types[i]; i++) {
-                error_append_hint(&local_err, ", %s",
-                                  machine_class->valid_cpu_types[i]);
-            }
-            error_append_hint(&local_err, "\n");
-
-            error_propagate(errp, local_err);
-        }
-    }
-
-    /* Check if CPU type is deprecated and warn if so */
-    cc = CPU_CLASS(oc);
-    if (cc && cc->deprecation_note) {
-        warn_report("CPU model %s is deprecated -- %s", machine->cpu_type,
-                    cc->deprecation_note);
+    /* Check if the CPU type is supported */
+    is_cpu_type_supported(machine, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
     }
 
     if (machine->cgs) {
-- 
2.41.0

