Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp634205ejt;
        Sun, 26 Nov 2023 15:13:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHvVpy+BQt2nWBpeWLYOpUWfI+cIQ/oC/cmBH0Bq/UhgwH6ATF/iX7Q2nIpe9RfQt4VAnoQ
X-Received: by 2002:a05:622a:86:b0:423:80b2:858 with SMTP id o6-20020a05622a008600b0042380b20858mr13175968qtw.36.1701040415919;
        Sun, 26 Nov 2023 15:13:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701040415; cv=none;
        d=google.com; s=arc-20160816;
        b=KfrMcXwiu6exp7Oy/No4ym3aaWiE/Tabs66ErrxtH55SzFezdQamCiMX4sXyA+57UW
         flJmj/3e7sFVKUHe5Fb8DO0LYoWOjVjYvI8j+bNUWKTZuBDlGdMRDr1MybR0J+LtfiPZ
         V9hje/M4CANPLELZhMIxGxhTGwI848nrtVq4L4HmL2mpg1/RxLwNb9lXYXJ4SBT3de0e
         hmNt7sUkD5mj0hLeVRA2dfJ+2nYLmUeFEN29NqJCr9sKDmYBjJaiH5bhrmwWV+n43/6S
         UiyZhD1shegVPLUeBbv0QwBP92suFzM/OSSgPU0QEImkQ3cCrKwTJf/Sb1dPTnoC8IRQ
         io9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=fyGU7fHc6FmO2V+yLKvp9wqQYthe9lBuvSpH61DiUPI=;
        fh=j+indnOjTt+RINOBLao7PfkDc9cNRlB5CyY3wo1fnnU=;
        b=0R13slpPOZbDHgtHi+0Tglui6JADJ47QYg5K4a4/Wd7JVg7Zjc0bskvmVRUzG2Fs6R
         ESMIcIcUGPdeEDGuK5RisV9c0fmgpQwghwnKNvapOZjYK3N8NgKlllyfeAysP0la81Fa
         rb5u6kdVgW9ZzxNEEzLqEHX+ULYyNPWJtbI/Z65ivFDhtbnJs/16keLVHWJxqQcLHxag
         namCirs2joeJkHQuJKi7bJ8bPy1TroJOiZ4jDp5Ye/0W5EPmTYh6418Af7JxIhOkj3Ro
         LRLS9ZaKIhHqOpmaDcmEZc7BHBKFyakhewfdinglSnTdh4ljvscKXceNmrNtLkm0rUCG
         n6Xg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JsbzyqnY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u8-20020a05622a198800b0042370d06f2csi8643980qtc.381.2023.11.26.15.13.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Nov 2023 15:13:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JsbzyqnY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r7OIz-0001WV-3p; Sun, 26 Nov 2023 18:12:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r7OIx-0001Vr-Nz
 for qemu-arm@nongnu.org; Sun, 26 Nov 2023 18:12:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r7OIw-00060E-3S
 for qemu-arm@nongnu.org; Sun, 26 Nov 2023 18:12:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701040365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fyGU7fHc6FmO2V+yLKvp9wqQYthe9lBuvSpH61DiUPI=;
 b=JsbzyqnYXR98GcB7M5FyflJL14yyKFDhCzv04gwmepx2oWm4EVqVOZqDtBKrlmK7KlBLqV
 jvaW6NSIgrs4aqBeMxIoIet2HfZKuF1JYemID4KUMu8uq4O7+JrJU0W4cK8up/e+zO+D9L
 7TI1U756khhhQ8AUK5YN8owlX2ldFNs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-bZF7kwvSO4ui3yFTcBXOWw-1; Sun, 26 Nov 2023 18:12:42 -0500
X-MC-Unique: bZF7kwvSO4ui3yFTcBXOWw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1889E101A52D;
 Sun, 26 Nov 2023 23:12:41 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.61])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 37B63492BE7;
 Sun, 26 Nov 2023 23:12:32 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, peter.maydell@linaro.org,
 imammedo@redhat.com, richard.henderson@linaro.org,
 quic_llindhol@quicinc.com, b.galvani@gmail.com,
 strahinja.p.jankovic@gmail.com, kfting@nuvoton.com, wuhaotsh@google.com,
 nieklinnenbank@gmail.com, rad@semihalf.com, marcin.juszkiewicz@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, vijai@behindbytes.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 shan.gavin@gmail.com
Subject: [PATCH v7 2/8] machine: Introduce helper is_cpu_type_supported()
Date: Mon, 27 Nov 2023 09:12:04 +1000
Message-ID: <20231126231210.112820-3-gshan@redhat.com>
In-Reply-To: <20231126231210.112820-1-gshan@redhat.com>
References: <20231126231210.112820-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
X-TUID: k6h0JXRGbYxc

The logic, to check if the specified CPU type is supported in
machine_run_board_init(), is independent enough. Factor it out into
helper is_cpu_type_supported(). machine_run_board_init() looks a bit
clean with this. Since we're here, @machine_class is renamed to @mc
to avoid multiple line spanning of code. The error messages and comments
are tweaked a bit either.

No functional change intended.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 hw/core/machine.c | 90 +++++++++++++++++++++++++++--------------------
 1 file changed, 51 insertions(+), 39 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index b3ef325936..05e1922b89 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1387,13 +1387,57 @@ out:
     return r;
 }
 
+static void is_cpu_type_supported(const MachineState *machine, Error **errp)
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
+            if (!mc->valid_cpu_types[1]) {
+                error_append_hint(errp, "The only valid type is: %s",
+                                  mc->valid_cpu_types[0]);
+            } else {
+                error_append_hint(errp, "The valid types are: %s",
+                                  mc->valid_cpu_types[0]);
+            }
+
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
@@ -1449,43 +1493,11 @@ void machine_run_board_init(MachineState *machine, const char *mem_path, Error *
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
-            return;
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
+        return;
     }
 
     if (machine->cgs) {
-- 
2.42.0

