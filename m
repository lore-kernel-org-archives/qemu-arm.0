Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp1428949lfk;
        Sun, 17 Apr 2022 19:11:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3Ik8kYPBVNqWwyT0hGhUeS8q5WuOSVQtNqu850+fqsUqcUuOXqKLswlwyZ7mD6tbU8MY9
X-Received: by 2002:a05:6214:1bc8:b0:446:65ca:8cc4 with SMTP id m8-20020a0562141bc800b0044665ca8cc4mr235454qvc.70.1650247870803;
        Sun, 17 Apr 2022 19:11:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650247870; cv=none;
        d=google.com; s=arc-20160816;
        b=aMWnoteka31vVbTbuWi9H8KJh5++NxCQEHBZqbvXXSJogwnia4H/3hsnEuKem/gTe2
         sMwXKlGhBsg0FtbdgWJPYL1u3XwnD2MGnKUeGjvnRrxV6agpfR6mn/68V6KIwBjJwvR/
         M5Lp6NKJnf/CIlZXcTmB72KGS/5RsegYVxp2Nk6FFkpRs3Xfm+5j5rnXY+GBsjXUuL15
         X2XqGz2KUH0lnnSuN2VM3ouOnlp5P1/bn+l0ZcBZ3TO0QIBgYvnx4vm1rMAhEJGMFkyT
         nhoq2QvV/AI4wsYqmu5JEs/Cm2bJzka1+anP38jt880sKM56YmWYfj465cU+pXT+SLuC
         61Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=o8rd0rTwo09TyXuo9ZI5xW74+5LJ5reVQiKP8PE5OSA=;
        b=dsNuGzs8zDs9U1s6R+gykJ1/MYGMuhZC9FYnSfn5d9+ZwG6L1cmy6u+tOPN5ibtEvh
         KZz6QZ7GaCjkldvUCRMp91YW0TN5FiYDQIOyVYsoTHfQqQIRcx1ljd847Pte6pYn3xXc
         k4eDeJ4MuJB+Gb/5z/Hvd+2JY1euU31tcWfb1I107xLw7q+DXfEc3gW5srWdTmYboIzz
         cmER1aStwlQBMGmjY3Z/zyA3VXk5WZfh6mL3F23458HSuG1i1XWQq0lVrhvOyltpCBvQ
         SNYIfm8JWSShf0vt+Nitbl3Qh/xy0O5dYtyYyzhBhnLAUoCmtMBcHTDm7DixRMJxnl2D
         1t8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="ZKvTLc/t";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g6-20020a0562141cc600b0044443be6479si2561110qvd.529.2022.04.17.19.11.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 17 Apr 2022 19:11:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="ZKvTLc/t";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ngGr8-0003cJ-9w
	for alex.bennee@linaro.org; Sun, 17 Apr 2022 22:11:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1ngGqy-0003ZE-7X
 for qemu-arm@nongnu.org; Sun, 17 Apr 2022 22:11:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1ngGqw-0000wj-H4
 for qemu-arm@nongnu.org; Sun, 17 Apr 2022 22:10:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650247857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o8rd0rTwo09TyXuo9ZI5xW74+5LJ5reVQiKP8PE5OSA=;
 b=ZKvTLc/teO9oIldPBs1BlRBW5KTYSdACqrEKVt9Ah950IlbMAIPq7a0eIp5S/R+50f2DV1
 6ePnEBzQnAgQWfONPte7+TYA1BNLbqP2RP0CknU+Fh4MHk2AfEbaW8LtPiBK6waIeTEm9o
 QAKmcgehMQRdCIMkw1qeIIaCqPjZdYI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-364-x11Mp34pMGGiRE3g-s9vXA-1; Sun, 17 Apr 2022 22:10:55 -0400
X-MC-Unique: x11Mp34pMGGiRE3g-s9vXA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 544553804067;
 Mon, 18 Apr 2022 02:10:54 +0000 (UTC)
Received: from gshan.redhat.com (ovpn-13-171.pek2.redhat.com [10.72.13.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2AA21112C063;
 Mon, 18 Apr 2022 02:10:40 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Subject: [PATCH v6 1/4] qapi/machine.json: Add cluster-id
Date: Mon, 18 Apr 2022 10:09:17 +0800
Message-Id: <20220418020920.144263-2-gshan@redhat.com>
In-Reply-To: <20220418020920.144263-1-gshan@redhat.com>
References: <20220418020920.144263-1-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: eduardo@habkost.net, peter.maydell@linaro.org, drjones@redhat.com,
 shan.gavin@gmail.com, mst@redhat.com, thuth@redhat.com, armbru@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, f4bug@amsat.org,
 wangyanan55@huawei.com, pbonzini@redhat.com, marcel.apfelbaum@gmail.com,
 Jonathan.Cameron@Huawei.com, ani@anisinha.ca, imammedo@redhat.com,
 lvivier@redhat.com, eblake@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LYv3WJs8DpZf

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
index d25a481ce4..fb855041ee 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -868,10 +868,11 @@
 # @node-id: NUMA node ID the CPU belongs to
 # @socket-id: socket number within node/board the CPU belongs to
 # @die-id: die number within socket the CPU belongs to (since 4.1)
-# @core-id: core number within die the CPU belongs to
+# @cluster-id: cluster number within socket the CPU belongs to (since 7.1)
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

