Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp2106721lfb;
        Sun, 3 Apr 2022 04:01:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQOUO5bRRlANSBmvbbyeQOVAdhS5IqxsnTI4uOnAF5DtJfX5RJr+FnR8oIJEvmrqvc9ShN
X-Received: by 2002:ac8:5a88:0:b0:2e1:bbda:3b21 with SMTP id c8-20020ac85a88000000b002e1bbda3b21mr13888075qtc.307.1648983694822;
        Sun, 03 Apr 2022 04:01:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648983694; cv=none;
        d=google.com; s=arc-20160816;
        b=chBqu504zdmX7haR3ecRbv4JiIgWE4z50L/i7E0QdOLzHtfnCJVA2/zVKd1+JVx+Nq
         LhvIcQsGSMd2YZIW0cfBjQQbpKQrNppJMTxsjllLGw4Hdm55Vlrja/I1pif94qkXGSjl
         Rzy0mqgzRfSgxPudqH/jSlpz4yDTUXVEFLCPoR4TDflN+mHxHi1dZAkBA5caPVXjdRdj
         7ftCfWb7GLpBoT0u83fzVS691iSiPbI4GC4iVvLwoEb+ZvZU5Iw0KnREyw1Lwp1OA8au
         myxZekS2xwSjl4n2GDT97/J5LhL2icJhCJMOqztNDgrS6s2wxMfLYzxhOgIwHY1O6NW/
         M1CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=oajsqjR8bPNJ8RgYFOKeA32YOHvDw97Kf82KabV+weA=;
        b=sKk3V0onk+IfD92M4PGIHZAvseh5ZBgJ5/WOZFiuXE0DnmZPskfcXnKo65/SacU/r0
         QRnKoyujFNQfwddESf8ptUSDzydt0NnCKWq34E5l46qSGG3o2ultAsYin4wOQOyFSjdL
         xw4jciG3Ibz7SFLhGb4GV5HmIHJKQ1X/y1iwVSat30m/QqOIGLAkIxekCWJAAdIfSFzf
         3tee34mAgC3eywSyYAiWFPSjJLtMBTzZ8xPcNoRpOmtSVg8MXJwaGEvU7AMxq8qCRkhG
         FuacuOeC7eoeXqB+aA2gno52rhaBlHnhZcAsD9TI1JV6yKxqGbawNk93snifQAc5ewxP
         MwiA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=O6bMHPIw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w84-20020a376257000000b0067e4be23825si2324375qkb.106.2022.04.03.04.01.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Apr 2022 04:01:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=O6bMHPIw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1naxzC-0004jV-B3
	for alex.bennee@linaro.org; Sun, 03 Apr 2022 07:01:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1naxyl-0004iG-NW
 for qemu-arm@nongnu.org; Sun, 03 Apr 2022 07:01:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1naxyk-0001Vb-4y
 for qemu-arm@nongnu.org; Sun, 03 Apr 2022 07:01:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648983665;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oajsqjR8bPNJ8RgYFOKeA32YOHvDw97Kf82KabV+weA=;
 b=O6bMHPIw5uqpRZYRTN0LZ/xJK3TmVJFep4Ap5eLLGWpuLZqnoIGC0ZbmsEtgniJ+LcpMF7
 X/kKi7Vl4iCdDsxCW0vwfSjQ5hUVzcV5EKBC+nm1I4FAqHO77CStz/ls6W0tReTP51cyJ1
 0OE85gr9BVAZIthywlQYZTaDIfRMtPg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-150-5AmNAiTVPwi41g3XKPFGnw-1; Sun, 03 Apr 2022 07:01:02 -0400
X-MC-Unique: 5AmNAiTVPwi41g3XKPFGnw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CDC0D811E75;
 Sun,  3 Apr 2022 11:01:01 +0000 (UTC)
Received: from gshan.redhat.com (ovpn-12-82.pek2.redhat.com [10.72.12.82])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 656E840D02E1;
 Sun,  3 Apr 2022 11:00:57 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Subject: [PATCH v4 1/3] hw/arm/virt: Consider SMP configuration in CPU topology
Date: Sun,  3 Apr 2022 19:00:34 +0800
Message-Id: <20220403110036.5531-2-gshan@redhat.com>
In-Reply-To: <20220403110036.5531-1-gshan@redhat.com>
References: <20220403110036.5531-1-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, zhenyzha@redhat.com, wangyanan55@huawei.com,
 shan.gavin@gmail.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NyFdV1qpx8WO

Currently, the SMP configuration isn't considered when the CPU
topology is populated. In this case, it's impossible to provide
the default CPU-to-NUMA mapping or association based on the socket
ID of the given CPU.

This takes account of SMP configuration when the CPU topology
is populated. The die ID for the given CPU isn't assigned since
it's not supported on arm/virt machine yet. Besides, the cluster
ID for the given CPU is assigned because it has been supported
on arm/virt machine.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 hw/arm/virt.c     | 15 ++++++++++++++-
 qapi/machine.json |  6 ++++--
 2 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index d2e5ecd234..f628e86f78 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2505,6 +2505,7 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
     int n;
     unsigned int max_cpus = ms->smp.max_cpus;
     VirtMachineState *vms = VIRT_MACHINE(ms);
+    MachineClass *mc = MACHINE_GET_CLASS(vms);
 
     if (ms->possible_cpus) {
         assert(ms->possible_cpus->len == max_cpus);
@@ -2518,8 +2519,20 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
         ms->possible_cpus->cpus[n].type = ms->cpu_type;
         ms->possible_cpus->cpus[n].arch_id =
             virt_cpu_mp_affinity(vms, n);
+
+        assert(!mc->smp_props.dies_supported);
+        ms->possible_cpus->cpus[n].props.has_socket_id = true;
+        ms->possible_cpus->cpus[n].props.socket_id =
+            n / (ms->smp.clusters * ms->smp.cores * ms->smp.threads);
+        ms->possible_cpus->cpus[n].props.has_cluster_id = true;
+        ms->possible_cpus->cpus[n].props.cluster_id =
+            (n / (ms->smp.cores * ms->smp.threads)) % ms->smp.clusters;
+        ms->possible_cpus->cpus[n].props.has_core_id = true;
+        ms->possible_cpus->cpus[n].props.core_id =
+            (n / ms->smp.threads) % ms->smp.cores;
         ms->possible_cpus->cpus[n].props.has_thread_id = true;
-        ms->possible_cpus->cpus[n].props.thread_id = n;
+        ms->possible_cpus->cpus[n].props.thread_id =
+            n % ms->smp.threads;
     }
     return ms->possible_cpus;
 }
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

