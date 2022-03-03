Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp387438lfo;
        Wed, 2 Mar 2022 19:16:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxR7tQsGfJp6j2hYzFSIGUd3E9MAH59VNMz9JEBl6my5PpOOTVY6ruUtRKMUrDCaUS2ALI+
X-Received: by 2002:a25:7407:0:b0:628:97bf:39e5 with SMTP id p7-20020a257407000000b0062897bf39e5mr7301602ybc.597.1646277398351;
        Wed, 02 Mar 2022 19:16:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646277398; cv=none;
        d=google.com; s=arc-20160816;
        b=ilazK27ECJDaC7EQFuWsS0e4uqxpysD4JdWao2DkprSO+99FA1CMqxD6FAmFBTZaOy
         medtqN5jvS87xu0BJVbTL2eJx6Q8HfyCXmBMw93fqNFe6v9Uqp2B5T1qjMYVujbWvksZ
         T3rxAVLhr0j9zELF0HiNIMM904R4cINN9zMoHoD4c1dNeul9iAtL0qekdHdjwhRUQuCP
         NMV1tfGcMS+aLtnpKa8wjfAN6sCowh+Hn5yXrMVcjG89Ee+GckP3kkp38ONU9rBJ4mGc
         lIOa0cjK5u4r3EIsSXrkZZXtmgAU+YLQClGNkTIlOu1GHmRN2I59SbDrB+m3LyA2gV6T
         3aiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=L83Yt3EYQS48tkinW/PCOkmtE089EAs2S2lFeAasuZA=;
        b=kEASUgXi90lssacK69bHzWwnggHh5m/mR5Tb+30zChrGaceex2AlleIeFGlKrJO9fD
         rG3ZQ8Oc7uJqUuQD8hoTeOr2MUMuBpkSe/RPvKptkp8HPUmfBR/Oh6rObdRxpj7gDMde
         WHqnhnMhc+/pwl2u8mcxLG9Yr56X61fDWhdPtt4G6rxUoV/bMCcKfdos17v1BWZ3I6BA
         iKZKvW1RC5Y8Ux+c3bxhhPGkZ4zEWfqP4MH7JEL2yrq3GuOly+xKRQtTZ9osRQow8ze1
         LY5UXashkoC5dBxij6JmKSUWLaAJWRQt/bLovUG6iyZlfwo3YFZ0oLSnjGv9IE1F7L4X
         LXqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Q2i74tAM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u3-20020a816003000000b002d81c6802bdsi625181ywb.18.2022.03.02.19.16.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Mar 2022 19:16:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Q2i74tAM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nPbxF-00047f-Oi
	for alex.bennee@linaro.org; Wed, 02 Mar 2022 22:16:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nPbtE-0007Ut-0t
 for qemu-arm@nongnu.org; Wed, 02 Mar 2022 22:12:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nPbtC-0003e0-4K
 for qemu-arm@nongnu.org; Wed, 02 Mar 2022 22:12:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646277145;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L83Yt3EYQS48tkinW/PCOkmtE089EAs2S2lFeAasuZA=;
 b=Q2i74tAMQxzUYOWxGHfy6ZXC7VONKcy/75ewpAbWs7HM8EdmKI4qGvnfgiTo3UF3UR7fhw
 RWkEkGWtU79tSQNYCnBM2NqH8sWVkqkZiYH5ouFhUZDB5/tBIJ+PHLTk9CVqH6RfEzTuxA
 OhEfDTb9hhW6BFbXkk3GLMuBnOYIUNo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-203-cODvVe9-NN-47vSVGZY6cQ-1; Wed, 02 Mar 2022 22:12:22 -0500
X-MC-Unique: cODvVe9-NN-47vSVGZY6cQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 52D55801DDC;
 Thu,  3 Mar 2022 03:12:21 +0000 (UTC)
Received: from gshan.redhat.com (ovpn-13-119.pek2.redhat.com [10.72.13.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 564131006854;
 Thu,  3 Mar 2022 03:12:17 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Subject: [PATCH v2 1/3] hw/arm/virt: Fix CPU's default NUMA node ID
Date: Thu,  3 Mar 2022 11:11:50 +0800
Message-Id: <20220303031152.145960-2-gshan@redhat.com>
In-Reply-To: <20220303031152.145960-1-gshan@redhat.com>
References: <20220303031152.145960-1-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, zhenyzha@redhat.com, wangyanan55@huawei.com,
 shan.gavin@gmail.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: J5Z1PH5FMri/

The default CPU-to-NUMA association is given by mc->get_default_cpu_node_id()
when it isn't provided explicitly. However, the CPU topology isn't fully
considered in the default association and it causes CPU topology broken
warnings on booting Linux guest.

For example, the following warning messages are observed when the Linux guest
is booted with the following command lines.

  /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64 \
  -accel kvm -machine virt,gic-version=host               \
  -cpu host                                               \
  -smp 6,sockets=2,cores=3,threads=1                      \
  -m 1024M,slots=16,maxmem=64G                            \
  -object memory-backend-ram,id=mem0,size=128M            \
  -object memory-backend-ram,id=mem1,size=128M            \
  -object memory-backend-ram,id=mem2,size=128M            \
  -object memory-backend-ram,id=mem3,size=128M            \
  -object memory-backend-ram,id=mem4,size=128M            \
  -object memory-backend-ram,id=mem4,size=384M            \
  -numa node,nodeid=0,memdev=mem0                         \
  -numa node,nodeid=1,memdev=mem1                         \
  -numa node,nodeid=2,memdev=mem2                         \
  -numa node,nodeid=3,memdev=mem3                         \
  -numa node,nodeid=4,memdev=mem4                         \
  -numa node,nodeid=5,memdev=mem5
         :
  alternatives: patching kernel code
  BUG: arch topology borken
  the CLS domain not a subset of the MC domain
  <the above error log repeats>
  BUG: arch topology borken
  the DIE domain not a subset of the NODE domain

With current implementation of mc->get_default_cpu_node_id(), CPU#0 to CPU#5
are associated with NODE#0 to NODE#5 separately. That's incorrect because
CPU#0/1/2 should be associated with same NUMA node because they're seated
in same socket.

This fixes the issue by populating the CPU topology in virt_possible_cpu_arch_ids()
and considering the socket index when default CPU-to-NUMA association is given
in virt_possible_cpu_arch_ids(). With this applied, no more CPU topology broken
warnings are seen from the Linux guest. The 6 CPUs are associated with NODE#0/1,
but there are no CPUs associated with NODE#2/3/4/5.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 hw/arm/virt.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 46bf7ceddf..dee02b60fc 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2488,7 +2488,9 @@ virt_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
 
 static int64_t virt_get_default_cpu_node_id(const MachineState *ms, int idx)
 {
-    return idx % ms->numa_state->num_nodes;
+    int64_t socket_id = ms->possible_cpus->cpus[idx].props.socket_id;
+
+    return socket_id % ms->numa_state->num_nodes;
 }
 
 static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
@@ -2496,6 +2498,7 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
     int n;
     unsigned int max_cpus = ms->smp.max_cpus;
     VirtMachineState *vms = VIRT_MACHINE(ms);
+    MachineClass *mc = MACHINE_GET_CLASS(vms);
 
     if (ms->possible_cpus) {
         assert(ms->possible_cpus->len == max_cpus);
@@ -2509,6 +2512,18 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
         ms->possible_cpus->cpus[n].type = ms->cpu_type;
         ms->possible_cpus->cpus[n].arch_id =
             virt_cpu_mp_affinity(vms, n);
+
+        ms->possible_cpus->cpus[n].props.has_socket_id = true;
+        ms->possible_cpus->cpus[n].props.socket_id =
+            n / (ms->smp.dies * ms->smp.clusters *
+                ms->smp.cores * ms->smp.threads);
+        if (mc->smp_props.dies_supported) {
+            ms->possible_cpus->cpus[n].props.has_die_id = true;
+            ms->possible_cpus->cpus[n].props.die_id =
+                n / (ms->smp.clusters * ms->smp.cores * ms->smp.threads);
+        }
+        ms->possible_cpus->cpus[n].props.has_core_id = true;
+        ms->possible_cpus->cpus[n].props.core_id = n / ms->smp.threads;
         ms->possible_cpus->cpus[n].props.has_thread_id = true;
         ms->possible_cpus->cpus[n].props.thread_id = n;
     }
-- 
2.23.0

