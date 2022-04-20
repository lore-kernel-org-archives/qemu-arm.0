Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp3049441lfk;
        Wed, 20 Apr 2022 04:16:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJywYydso0ihQstTCcxuAjfEFixmfZmCwcMJ6FuaMXBkKmQXFvtzzJvoy/hcmcLAGXF9HiVY
X-Received: by 2002:a05:620a:f03:b0:67e:1e38:3a90 with SMTP id v3-20020a05620a0f0300b0067e1e383a90mr12055787qkl.442.1650453403630;
        Wed, 20 Apr 2022 04:16:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650453403; cv=none;
        d=google.com; s=arc-20160816;
        b=nXqn270rur6gk/JZaJFjRRU57X6GmXJd1fHAD3kZ4np2OLq+N3IYQ7+Iyjo2yPQQkt
         Sj3cO8O/fo2K+0Xv4sfxged1Ssg7LxByDYTllpK4XYWO3v9Vpvzt57ywYjY3pvCil2qT
         t3x5gwjQZ6QVJO1L9yfuccLRu//8hCKeFyOHK//XneFbwoLp+ZyOJA5qgYxTSZ8uj+FW
         rlgIca53MLlQ5IYRhR3318Np/pIRDXv/gT7BzGu+2oke2ojYZsWtjKXhhwUsAlRffESR
         cr8c8Hazjk8EcwNFVXf4/sYWqhzFpHYnMOgYK2E2JMXbbgLzzkmcSrCYzFLbq96PdcIt
         LvKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=GZUKCpp7xxGagrGtExZTsFbrYVMPiRchl0pqtU9wEI0=;
        b=vb9PBxRNHVr6c/FYtAS2HR5nczsJMjGTcdt0w9bJN60M3RV/1Q91RaN1+N7qt99BQN
         udyr9xWyiTfLXPS+saQUrMPFnI0aDrlwhOzJOOVcK80w8/YgBwq8ujz34Urgf4PlVwAE
         K8rkHxKxLtNBQUk8nFdUijnqzddeEZccD+QvydnBnV3kChmpfZis1cR32h61iiHBGGP8
         UY+q//vYcywkJVcXmACbbNOjR3z6M7glrHdh5KdhHRzGKWLse+ixBsy5FAKjLDGyhr60
         GAnqp4Wl25rAGzAxTOkfuVT4PNsRux8k0EMzr75bGh5qkmyPO5Qoy4VcrU9N5Q1B7Hsf
         ZNwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MmFj94Et;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h8-20020a05622a170800b002e227e437f0si439695qtk.338.2022.04.20.04.16.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Apr 2022 04:16:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MmFj94Et;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nh8KB-0007gZ-5H
	for alex.bennee@linaro.org; Wed, 20 Apr 2022 07:16:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nh7wL-00057r-P7
 for qemu-arm@nongnu.org; Wed, 20 Apr 2022 06:52:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nh7wI-0001KD-Ey
 for qemu-arm@nongnu.org; Wed, 20 Apr 2022 06:52:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650451921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GZUKCpp7xxGagrGtExZTsFbrYVMPiRchl0pqtU9wEI0=;
 b=MmFj94EtV4DhMffFVR9I7bSdrDV5E0k1UhHsf14I3OYFHs4pOd/L1NPm+jbmS8sMhGGCff
 jalh0AKvEZXg/XbAp5oNImNgSz7+YFS7DRRm9cUlKDYdbB5XpT4hINeUXgfr2aLUsQbiy2
 QEqD6O9pHTaHuDmu4EXPztHNF0mL9UQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-475-nUODevN2PxS5JzuvUcXqVA-1; Wed, 20 Apr 2022 06:51:58 -0400
X-MC-Unique: nUODevN2PxS5JzuvUcXqVA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 326A129AA3B1;
 Wed, 20 Apr 2022 10:51:58 +0000 (UTC)
Received: from gshan.redhat.com (ovpn-13-230.pek2.redhat.com [10.72.13.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9C8024047293;
 Wed, 20 Apr 2022 10:51:49 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Subject: [PATCH v7 1/4] qapi/machine.json: Add cluster-id
Date: Wed, 20 Apr 2022 18:49:06 +0800
Message-Id: <20220420104909.233058-2-gshan@redhat.com>
In-Reply-To: <20220420104909.233058-1-gshan@redhat.com>
References: <20220420104909.233058-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: lvivier@redhat.com, eduardo@habkost.net, thuth@redhat.com,
 berrange@redhat.com, shan.gavin@gmail.com, peter.maydell@linaro.org,
 Jonathan.Cameron@Huawei.com, zhenyzha@redhat.com, mst@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com, wangyanan55@huawei.com,
 marcel.apfelbaum@gmail.com, imammedo@redhat.com, ani@anisinha.ca,
 pbonzini@redhat.com, drjones@redhat.com, eblake@redhat.com, f4bug@amsat.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fBXaqKQlNiob

This adds cluster-id in CPU instance properties, which will be used
by arm/virt machine. Besides, the cluster-id is also verified or
dumped in various spots:

  * hw/core/machine.c::machine_set_cpu_numa_node() to associate
    CPU with its NUMA node.

  * hw/core/machine.c::machine_numa_finish_cpu_init() to associate
    CPU with NUMA node when no default association isn't provided.

  * hw/core/machine-hmp-cmds.c::hmp_hotpluggable_cpus() to dump
    cluster-id.

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
---
 hw/core/machine-hmp-cmds.c |  4 ++++
 hw/core/machine.c          | 16 ++++++++++++++++
 qapi/machine.json          |  6 ++++--
 3 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/hw/core/machine-hmp-cmds.c b/hw/core/machine-hmp-cmds.c
index 4e2f319aeb..5cb5eecbfc 100644
--- a/hw/core/machine-hmp-cmds.c
+++ b/hw/core/machine-hmp-cmds.c
@@ -77,6 +77,10 @@ void hmp_hotpluggable_cpus(Monitor *mon, const QDict *qdict)
         if (c->has_die_id) {
             monitor_printf(mon, "    die-id: \"%" PRIu64 "\"\n", c->die_id);
         }
+        if (c->has_cluster_id) {
+            monitor_printf(mon, "    cluster-id: \"%" PRIu64 "\"\n",
+                           c->cluster_id);
+        }
         if (c->has_core_id) {
             monitor_printf(mon, "    core-id: \"%" PRIu64 "\"\n", c->core_id);
         }
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 1e23fdc14b..ac91dfd834 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -679,6 +679,11 @@ void machine_set_cpu_numa_node(MachineState *machine,
             return;
         }
 
+        if (props->has_cluster_id && !slot->props.has_cluster_id) {
+            error_setg(errp, "cluster-id is not supported");
+            return;
+        }
+
         if (props->has_socket_id && !slot->props.has_socket_id) {
             error_setg(errp, "socket-id is not supported");
             return;
@@ -698,6 +703,11 @@ void machine_set_cpu_numa_node(MachineState *machine,
                 continue;
         }
 
+        if (props->has_cluster_id &&
+            props->cluster_id != slot->props.cluster_id) {
+                continue;
+        }
+
         if (props->has_die_id && props->die_id != slot->props.die_id) {
                 continue;
         }
@@ -992,6 +1002,12 @@ static char *cpu_slot_to_string(const CPUArchId *cpu)
         }
         g_string_append_printf(s, "die-id: %"PRId64, cpu->props.die_id);
     }
+    if (cpu->props.has_cluster_id) {
+        if (s->len) {
+            g_string_append_printf(s, ", ");
+        }
+        g_string_append_printf(s, "cluster-id: %"PRId64, cpu->props.cluster_id);
+    }
     if (cpu->props.has_core_id) {
         if (s->len) {
             g_string_append_printf(s, ", ");
diff --git a/qapi/machine.json b/qapi/machine.json
index d25a481ce4..4c417e32a5 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -868,10 +868,11 @@
 # @node-id: NUMA node ID the CPU belongs to
 # @socket-id: socket number within node/board the CPU belongs to
 # @die-id: die number within socket the CPU belongs to (since 4.1)
-# @core-id: core number within die the CPU belongs to
+# @cluster-id: cluster number within die the CPU belongs to (since 7.1)
+# @core-id: core number within cluster the CPU belongs to
 # @thread-id: thread number within core the CPU belongs to
 #
-# Note: currently there are 5 properties that could be present
+# Note: currently there are 6 properties that could be present
 #       but management should be prepared to pass through other
 #       properties with device_add command to allow for future
 #       interface extension. This also requires the filed names to be kept in
@@ -883,6 +884,7 @@
   'data': { '*node-id': 'int',
             '*socket-id': 'int',
             '*die-id': 'int',
+            '*cluster-id': 'int',
             '*core-id': 'int',
             '*thread-id': 'int'
   }
-- 
2.23.0

