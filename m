Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp2384152ejt;
        Tue, 28 Nov 2023 20:21:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG/AT5yaVPOVY/CMgH1cY8eKHLWZcOSKplTSNB8+uSP0JWqZzSTSa60zGv6HXFyNz1eJbR6
X-Received: by 2002:a0d:eb0b:0:b0:5cc:d0bc:fc31 with SMTP id u11-20020a0deb0b000000b005ccd0bcfc31mr17957039ywe.24.1701231690328;
        Tue, 28 Nov 2023 20:21:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701231690; cv=none;
        d=google.com; s=arc-20160816;
        b=vuoSktpx1JrGwLQvTMJrVYuAc2Ep64ATy7BnZumielewQRw8xT/dy8N3W2lTotG+1k
         EeoyKRkKkcp+wyXWKzVn65oze3vslylaqjcdjTbQvn7L9YoJNnwqEmtnU5RJSDnT+Uw9
         L5n+1ivtldGDl5qcQ1/kcf0bhnZqdT1c+XnzA+RFMN33nR6rG6/ex9gwz77eA3FD2FoW
         L+qoHW8TL096B32d3gvYyQ/vthRGWRuOGZJVL+DbharyUK2AMrWXg0s2vrMz9/3L01X/
         5/vLWOhzxkigdkgwgz7+wsnpUxewa8/hdEnpRu35s4IyXwyrTT2J2ccIiEqGaSp1wCL8
         EMYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=YEvDWxmldq74ZNrxiNy7qHk4ebPu/ZUqFG0XrxYEvmk=;
        fh=dYswejlzixW+/pN5BDGaZGk2aL8UDmDK4StoDp2TZgs=;
        b=wm9f9Xu4tz57Ty+jAfyO7xdrvVDZr7mozsTzRAfEgmaA8k+aGnKuwTePm0wevuKdu1
         W0lkJV/NLGK9NTVYDydKYRF2Pu9WVvKt8Et6o5151mzlxHIPfh5nC+r6juHlT9bw0toR
         FF3OpvySMd7X6pJE1BMk0J/J6xN47pGxNqXF1PtXMjI9D/hwPC/aalkiPYoC51GJqpMy
         PorvuOxqdVh8L47cwJPQsHtz7hBEhbTj9qjWGjZSxybcL5EvFg/G16htDlPVwzk41xXB
         n3ge3FIoSng10HmMF7/M0t1+VEWeZK00z8JFozAvV3OfmaSe6JzT+57iQwAPaqn4xto/
         1vpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=J2YtrehC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x3-20020a0cfe03000000b0067a1b08544dsi10200159qvr.100.2023.11.28.20.21.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Nov 2023 20:21:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=J2YtrehC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r8C4X-0001ah-Vo; Tue, 28 Nov 2023 23:21:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r8C4Q-0001Yo-Sx
 for qemu-arm@nongnu.org; Tue, 28 Nov 2023 23:21:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r8C4O-0007LM-JG
 for qemu-arm@nongnu.org; Tue, 28 Nov 2023 23:21:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701231661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YEvDWxmldq74ZNrxiNy7qHk4ebPu/ZUqFG0XrxYEvmk=;
 b=J2YtrehCAlGWosAIessRuL9+lu50V5uhEoRIwI52hzzPT5uJZ3MlRrqIePobtfEhaeqzSv
 peAImHRQaUfuvYpRefv4l4e6cRvPuHADbd3ALxu2FpwG17ylrxnyci0RWacV3CLye468tu
 yiWVSbunncTz9CttiwFUNOoCuTeKOmg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-20-1mWc24GqP7mRxWXSII6Ujw-1; Tue, 28 Nov 2023 23:20:53 -0500
X-MC-Unique: 1mWc24GqP7mRxWXSII6Ujw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 835D98556ED;
 Wed, 29 Nov 2023 04:20:52 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.61])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C2FD3492BE0;
 Wed, 29 Nov 2023 04:20:44 +0000 (UTC)
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
Subject: [PATCH v8 2/9] machine: Introduce helper is_cpu_type_supported()
Date: Wed, 29 Nov 2023 14:20:05 +1000
Message-ID: <20231129042012.277831-3-gshan@redhat.com>
In-Reply-To: <20231129042012.277831-1-gshan@redhat.com>
References: <20231129042012.277831-1-gshan@redhat.com>
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
X-TUID: W6RG3UnHk7qb

The logic, to check if the specified CPU type is supported in
machine_run_board_init(), is independent enough. Factor it out into
helper is_cpu_type_supported(). machine_run_board_init() looks a bit
clean with this. Since we're here, @machine_class is renamed to @mc to
avoid multiple line spanning of code. The comments are tweaked a bit
either.

No functional change intended.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
v8: Move the precise message hint to PATCH[v8 3/9]        (Gavin)
---
 hw/core/machine.c | 83 +++++++++++++++++++++++++----------------------
 1 file changed, 45 insertions(+), 38 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index bde7f4af6d..1797e002f9 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1387,13 +1387,53 @@ out:
     return r;
 }
 
+static bool is_cpu_type_supported(const MachineState *machine, Error **errp)
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
+            return false;
+        }
+    }
+
+    /* Check if CPU type is deprecated and warn if so */
+    cc = CPU_CLASS(oc);
+    if (cc && cc->deprecation_note) {
+        warn_report("CPU model %s is deprecated -- %s",
+                    machine->cpu_type, cc->deprecation_note);
+    }
+
+    return true;
+}
 
 void machine_run_board_init(MachineState *machine, const char *mem_path, Error **errp)
 {
     ERRP_GUARD();
     MachineClass *machine_class = MACHINE_GET_CLASS(machine);
-    ObjectClass *oc = object_class_by_name(machine->cpu_type);
-    CPUClass *cc;
 
     /* This checkpoint is required by replay to separate prior clock
        reading from the other reads, because timer polling functions query
@@ -1448,42 +1488,9 @@ void machine_run_board_init(MachineState *machine, const char *mem_path, Error *
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
-            error_setg(errp, "Invalid CPU type: %s", machine->cpu_type);
-            error_append_hint(errp, "The valid types are: %s",
-                              machine_class->valid_cpu_types[0]);
-            for (i = 1; machine_class->valid_cpu_types[i]; i++) {
-                error_append_hint(errp, ", %s",
-                                  machine_class->valid_cpu_types[i]);
-            }
-
-            error_append_hint(&errp, "\n");
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
+    if (!is_cpu_type_supported(machine, errp)) {
+        return;
     }
 
     if (machine->cgs) {
-- 
2.42.0

