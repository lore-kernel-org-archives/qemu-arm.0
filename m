Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp781742lfp;
        Tue, 14 Sep 2021 08:17:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz5UXveXQIZlrsNQbr43Ek3lsdT/tNQ3DlClF9rNI0XK1hQyEWRDdltrivzFZAjCjduNJzo
X-Received: by 2002:a50:d6cd:: with SMTP id l13mr19337700edj.360.1631632666850;
        Tue, 14 Sep 2021 08:17:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631632666; cv=none;
        d=google.com; s=arc-20160816;
        b=0SETm3uj1OWbxYuqUIHmecrCCSjk4SowtT2spG348OjQ2qZCPP/cRT6DrabtIvkcrl
         XUtzmMmHsSFzub0dVzygtKD/sk+4+upPJzhorPdT7SpWk0jmTOhgK5L1SZsst8Fra/U1
         IgcqHLbnTWfPlARfkgY4V50HIlFhx43VczwBvRlyhMq7hT053FUjYw0+9KTbiSn6sl8S
         d4lmaGGtwhF3fJQju2ojs+gW63R5SKS/SlEkyskkqBNnVRKrru1jb5UYGF7r24cDYLOI
         mF0vPefwc9mTFbV8W29VNfyEDVQ6W7OgwSax4D+t076XuixmgODD6HHQagxPhvOFa4fh
         +EcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=x2ItSwilEkeD7dA4djStHQP7kqiJtaHr3ZbwT8gFz/w=;
        b=zZKK05EYU176/J+/Fx5YiN+5eqm5FMBjcZxOgKPxi+IAysVAD01JKMk40jxRsQ/XXk
         D8Rj4ifeg2Ogg60BIe8lvNiuUYJ61qQ974GoR6CWVNKWdtFtYiM3RtiqKUCWbZ6G4nts
         y9YEOv7PpPBcqDoLd8/0sRSo5+2aQ/tajKKs+8SjTPMluapavYofgjGhIbdMUxOrtwnE
         3yoBBn6Qrpk23hzSOZ28jxnAIfmgJCDQKiefUCfrYi+Sma/1Mz4I7eayWKTMI/I17pI7
         h4nWFe+QzsPpCVBYD1QSUgN5Ii4wj+mYqpghKjoDkgxvEwQNs1RXo9ZnBM92CLJansQB
         uOVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cXFA74yA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dn10si11552588ejc.275.2021.09.14.08.17.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Sep 2021 08:17:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cXFA74yA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mQABt-00046V-Py
	for alex.bennee@linaro.org; Tue, 14 Sep 2021 11:17:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9TD-0007uM-Dx
 for qemu-arm@nongnu.org; Tue, 14 Sep 2021 10:31:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9T8-0002Bg-Fd
 for qemu-arm@nongnu.org; Tue, 14 Sep 2021 10:31:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631629889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x2ItSwilEkeD7dA4djStHQP7kqiJtaHr3ZbwT8gFz/w=;
 b=cXFA74yAOE6HcErDXxfe/1nqAgJw/ut994Cox68Uo3exTDY6Zl0z62ebpxv/3qETkm2Mj2
 j+fm/OptAECW+oa2cVu3/3fQ7USp/vJiIMHJggnSQ+VuFCP0sjUD9bNXWTQhX8ztIBG4m7
 FyAbtA3FblUNQnL9HNp92TAinpAwcKc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-9W2v34IWNiqKtR_BwCE15w-1; Tue, 14 Sep 2021 10:31:28 -0400
X-MC-Unique: 9W2v34IWNiqKtR_BwCE15w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1AC6B1054F90;
 Tue, 14 Sep 2021 14:31:21 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0B3565D9DD;
 Tue, 14 Sep 2021 14:31:12 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 32/53] qapi: introduce x-query-numa QMP command
Date: Tue, 14 Sep 2021 15:20:21 +0100
Message-Id: <20210914142042.1655100-33-berrange@redhat.com>
In-Reply-To: <20210914142042.1655100-1-berrange@redhat.com>
References: <20210914142042.1655100-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.398, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Chris Wulff <crwulff@gmail.com>,
 David Hildenbrand <david@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Laurent Vivier <laurent@vivier.eu>, Max Filippov <jcmvbkbc@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Eric Blake <eblake@redhat.com>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 08vk7eBzXSyU

This is a counterpart to the HMP "info numa" command. It is being
added with an "x-" prefix because this QMP command is intended as an
adhoc debugging tool and will thus not be modelled in QAPI as fully
structured data, nor will it have long term guaranteed stability.
The existing HMP command is rewritten to call the QMP command.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/core/machine-hmp-cmds.c | 33 +++++-------------------------
 hw/core/machine-qmp-cmds.c | 42 ++++++++++++++++++++++++++++++++++++++
 qapi/machine.json          | 12 +++++++++++
 3 files changed, 59 insertions(+), 28 deletions(-)

diff --git a/hw/core/machine-hmp-cmds.c b/hw/core/machine-hmp-cmds.c
index 76b22b00d6..cfa01c6933 100644
--- a/hw/core/machine-hmp-cmds.c
+++ b/hw/core/machine-hmp-cmds.c
@@ -134,35 +134,12 @@ void hmp_info_memdev(Monitor *mon, const QDict *qdict)
 
 void hmp_info_numa(Monitor *mon, const QDict *qdict)
 {
-    int i, nb_numa_nodes;
-    NumaNodeMem *node_mem;
-    CpuInfoFastList *cpu_list, *cpu;
-    MachineState *ms = MACHINE(qdev_get_machine());
+    Error *err = NULL;
+    g_autoptr(HumanReadableText) info = qmp_x_query_numa(&err);
 
-    nb_numa_nodes = ms->numa_state ? ms->numa_state->num_nodes : 0;
-    monitor_printf(mon, "%d nodes\n", nb_numa_nodes);
-    if (!nb_numa_nodes) {
+    if (err) {
+        error_report_err(err);
         return;
     }
-
-    cpu_list = qmp_query_cpus_fast(&error_abort);
-    node_mem = g_new0(NumaNodeMem, nb_numa_nodes);
-
-    query_numa_node_mem(node_mem, ms);
-    for (i = 0; i < nb_numa_nodes; i++) {
-        monitor_printf(mon, "node %d cpus:", i);
-        for (cpu = cpu_list; cpu; cpu = cpu->next) {
-            if (cpu->value->has_props && cpu->value->props->has_node_id &&
-                cpu->value->props->node_id == i) {
-                monitor_printf(mon, " %" PRIi64, cpu->value->cpu_index);
-            }
-        }
-        monitor_printf(mon, "\n");
-        monitor_printf(mon, "node %d size: %" PRId64 " MB\n", i,
-                       node_mem[i].node_mem >> 20);
-        monitor_printf(mon, "node %d plugged: %" PRId64 " MB\n", i,
-                       node_mem[i].node_plugged_mem >> 20);
-    }
-    qapi_free_CpuInfoFastList(cpu_list);
-    g_free(node_mem);
+    monitor_printf(mon, "%s", info->human_readable_text);
 }
diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
index c4e384f7d5..4407e967da 100644
--- a/hw/core/machine-qmp-cmds.c
+++ b/hw/core/machine-qmp-cmds.c
@@ -234,3 +234,45 @@ HumanReadableText *qmp_x_query_registers(bool has_cpu, int64_t cpu,
     ret->human_readable_text = g_steal_pointer(&buf->str);
     return ret;
 }
+
+HumanReadableText *qmp_x_query_numa(Error **errp)
+{
+    HumanReadableText *ret;
+    g_autoptr(GString) buf = g_string_new("");
+    int i, nb_numa_nodes;
+    NumaNodeMem *node_mem;
+    CpuInfoFastList *cpu_list, *cpu;
+    MachineState *ms = MACHINE(qdev_get_machine());
+
+    nb_numa_nodes = ms->numa_state ? ms->numa_state->num_nodes : 0;
+    g_string_append_printf(buf, "%d nodes\n", nb_numa_nodes);
+    if (!nb_numa_nodes) {
+        goto done;
+    }
+
+    cpu_list = qmp_query_cpus_fast(&error_abort);
+    node_mem = g_new0(NumaNodeMem, nb_numa_nodes);
+
+    query_numa_node_mem(node_mem, ms);
+    for (i = 0; i < nb_numa_nodes; i++) {
+        g_string_append_printf(buf, "node %d cpus:", i);
+        for (cpu = cpu_list; cpu; cpu = cpu->next) {
+            if (cpu->value->has_props && cpu->value->props->has_node_id &&
+                cpu->value->props->node_id == i) {
+                g_string_append_printf(buf, " %" PRIi64, cpu->value->cpu_index);
+            }
+        }
+        g_string_append_printf(buf, "\n");
+        g_string_append_printf(buf, "node %d size: %" PRId64 " MB\n", i,
+                               node_mem[i].node_mem >> 20);
+        g_string_append_printf(buf, "node %d plugged: %" PRId64 " MB\n", i,
+                               node_mem[i].node_plugged_mem >> 20);
+    }
+    qapi_free_CpuInfoFastList(cpu_list);
+    g_free(node_mem);
+
+ done:
+    ret = g_new0(HumanReadableText, 1);
+    ret->human_readable_text = g_steal_pointer(&buf->str);
+    return ret;
+}
diff --git a/qapi/machine.json b/qapi/machine.json
index d74c3f3fef..916f855e9b 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1313,6 +1313,18 @@
      '*threads': 'int',
      '*maxcpus': 'int' } }
 
+##
+# @x-query-numa:
+#
+# Query NUMA topology information
+#
+# Returns: topology information
+#
+# Since: 6.2
+##
+{ 'command': 'x-query-numa',
+  'returns': 'HumanReadableText' }
+
 ##
 # @x-query-profile:
 #
-- 
2.31.1

