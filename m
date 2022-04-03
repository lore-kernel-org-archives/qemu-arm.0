Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp2220042lfb;
        Sun, 3 Apr 2022 08:01:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxjTZwzlZm8Rje1KdmiQqoSh9j8E7KZaK5nvGhcdRIsOUV7/tTxKEXbmybxSvxonj4oj+X6
X-Received: by 2002:ac8:5e4d:0:b0:2e2:2bad:467d with SMTP id i13-20020ac85e4d000000b002e22bad467dmr14517670qtx.520.1648998084785;
        Sun, 03 Apr 2022 08:01:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648998084; cv=none;
        d=google.com; s=arc-20160816;
        b=zAizMQHKKgXxZVP/3zYxsbTiLxXTOqhidEgGRPEHnMH9p7PfFv0KCrpt33qPxmTYZt
         L7t+ezKIJlWbzDCzdoBL9iqAB3PzhXrimDE2/O+m/vWtCKgcdmVaAvGGiUwliMMotWVO
         5VskgwyV29hT9/EczBAswWCHRrGkAUkSgNtnzF2dFutO/XzIs8flnRO12so68URXq8nH
         GxunqWwxxG+Jd+Q8zhgmeAeqh4F8P8JJ7DMyBG+NYQilY8VRzi+ALHGh17ymGeCezzML
         YqaWFKrIzm+BxbsX2zLyyUxCV8WqmhDXx0/S/96MGW76aDoQeNX6NCjrBBgwMJ9uIjak
         PGQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=/Y0lvMfKQMuXXxk6cjxI/TdNQapGlOxdULK97Xgcn4I=;
        b=AYm/b+zcOE9DOF9bIIVQFMkECzYMpFwigeoByY1YQA3L0VE1Mvk3LUy+fI9xDTBeH6
         0PH2L9cDPXGaYbFa0BmvkY6OC5uNCDLKyiy3KtX+QzTtaX4ZjpBRETylmv6OJMm3PtuG
         S57wkU02o9MjXdaxEcBdc7qedg/lrVdExE0U2QylueztyT2FTBEqR6tf+RFbrrHUVcZn
         W80ERWYiJXwKQDyDuropIduXBHOuD8xi8PsM6wXLpi6AqaWBi8I/InBubfsYVqWcFSyT
         z14hMRgazZNXZx9cOi9jQ/3Wm/+Kx7fvTfrStIri5R6F+A7NpMznyl0W8cOiEk0q4/rE
         oLIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Wt27hB/0";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t11-20020a0cb38b000000b004412afe0e2asi2387526qve.5.2022.04.03.08.01.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Apr 2022 08:01:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Wt27hB/0";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nb1jI-0006eU-94
	for alex.bennee@linaro.org; Sun, 03 Apr 2022 11:01:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nb1iF-0005Ez-PU
 for qemu-arm@nongnu.org; Sun, 03 Apr 2022 11:00:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nb1iD-0003HH-3c
 for qemu-arm@nongnu.org; Sun, 03 Apr 2022 11:00:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648998016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Y0lvMfKQMuXXxk6cjxI/TdNQapGlOxdULK97Xgcn4I=;
 b=Wt27hB/0SIFufg17eBcJ+ECR5oI9zT9flMecObECqjcsz2LHz5RD5/fmwkEG4swJBiIj+6
 yFSrBvERCSSb21SQZLCt9KE1GbYWazMmtnf+s0RVgvVh/4h4nBIW9Qh62dwqbzXFmfq2Rx
 xyGpfkhnqhje+dtqvv2PJauqcEgrtTQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-209-6LU9vXhJP1SPhxtExwW69g-1; Sun, 03 Apr 2022 11:00:13 -0400
X-MC-Unique: 6LU9vXhJP1SPhxtExwW69g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2021F85A5A8;
 Sun,  3 Apr 2022 15:00:13 +0000 (UTC)
Received: from gshan.redhat.com (ovpn-12-82.pek2.redhat.com [10.72.12.82])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9491EC15E73;
 Sun,  3 Apr 2022 15:00:08 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Subject: [PATCH v5 1/4] qapi/machine.json: Add cluster-id
Date: Sun,  3 Apr 2022 22:59:50 +0800
Message-Id: <20220403145953.10522-2-gshan@redhat.com>
In-Reply-To: <20220403145953.10522-1-gshan@redhat.com>
References: <20220403145953.10522-1-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, zhenyzha@redhat.com, wangyanan55@huawei.com,
 shan.gavin@gmail.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AknAShUdAB9X

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
index d856485cb4..8748b64657 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -677,6 +677,11 @@ void machine_set_cpu_numa_node(MachineState *machine,
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
@@ -696,6 +701,11 @@ void machine_set_cpu_numa_node(MachineState *machine,
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
@@ -990,6 +1000,12 @@ static char *cpu_slot_to_string(const CPUArchId *cpu)
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
index 9c460ec450..ea22b574b0 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -868,10 +868,11 @@
 # @node-id: NUMA node ID the CPU belongs to
 # @socket-id: socket number within node/board the CPU belongs to
 # @die-id: die number within socket the CPU belongs to (since 4.1)
-# @core-id: core number within die the CPU belongs to
+# @cluster-id: cluster number within die the CPU belongs to
+# @core-id: core number within cluster/die the CPU belongs to
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

