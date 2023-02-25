Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp2539651ejc;
        Fri, 24 Feb 2023 22:38:03 -0800 (PST)
X-Google-Smtp-Source: AK7set8grvaIDYEzlNkcbbqtSSAzS/jEIWtFDapSwRtLHCgtddq3wBodK0NL1v1br514bv4yL/eX
X-Received: by 2002:a05:622a:1191:b0:3b8:2e48:921a with SMTP id m17-20020a05622a119100b003b82e48921amr33034631qtk.57.1677307083305;
        Fri, 24 Feb 2023 22:38:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677307083; cv=none;
        d=google.com; s=arc-20160816;
        b=yXMal/L3aElSpREOneRmkA8PoY5Nh5EjOioQE67NV08I2bQip23EdVwk+Rwy2EfVtt
         Fqt1bXeLlUfsX6YiR61w2I5Mj1noOmoMzjxFbYY6i7X/8oxN8ssnSGSl5X1vZWWA4zKr
         I4oVWI0o8G25NPoxWoh1kWz13ML7/kpoik8ciG++yxLCyNETkzXRhMROOcCjhT1UukzV
         XC2suG8ECClv23xojSk4BFyn2lByFMc4zjVW/p4C3qKf7j6Fgcz39nDfaLmzhFR2Wqd9
         MpqwP425TMbdr1JbAIUUCPVsx4TLn/pYD7elie+MQ7p9bvTGefEP4LRns9n+A7qpAjUM
         mJiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=AvwX+6I19q2WUJFwmfrI35ZFcd0wLfTIDvUwDVYFUtQ=;
        b=DnAyJV4JrPDxupjFJXlJgjWk3DWHQPcjzUOVGnn6mCjpsR0mFSiiDc1B8Nj7Szu8Wo
         /5AGOAy1dSKIUeS9ePQfYR4qbPCjHcHsVLjqVe88oM5DPsa3W/YDTPa2hJ3zWCUcHL7K
         tGoiFVj7JI/+8fKIJfKsKNXcqQhgpifUrdGvrtFBGTzOhD0QwOvhizsn4p5KhgYTLuG3
         f8IAwp/Jz0hLL4CqBcAf+eUErl4JcoeVroj8fGoEOXSxoXMtMD6FgcKKXC6SteLlPNtf
         KoZpNDqqqy4JyCo1xbaq2+ul5kqZCwhT4fuzfzXwqaBiVHhjt4nuVnhUCZ/CpAqEG4P2
         js9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="i/Toi4lx";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n4-20020ac85a04000000b003b9c019b131si1347354qta.57.2023.02.24.22.38.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Feb 2023 22:38:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="i/Toi4lx";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVoBQ-0000cA-Ax; Sat, 25 Feb 2023 01:37:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pVoBA-0000b2-US
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 01:37:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pVoB9-0002q3-90
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 01:37:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677307026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AvwX+6I19q2WUJFwmfrI35ZFcd0wLfTIDvUwDVYFUtQ=;
 b=i/Toi4lxlEm467j+JETLcl93XTlZz7D3DBPCuFOYiMq+uMOrFaTkhqB+B4YvIKhNaoeWCH
 kl3EOsTy0O72OmaCYiG+QUxad+2yxT8ZKkD5/a3Xlg5ZDB/vCbEcf37Y8r6qSdcrCaD0vJ
 7jWQlA3k8UrQLknmoYOqWoKAn9iV6f4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-595-AkI_uq8CPIuhE2uwEa2_AA-1; Sat, 25 Feb 2023 01:37:03 -0500
X-MC-Unique: AkI_uq8CPIuhE2uwEa2_AA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3C76B1C05EB1;
 Sat, 25 Feb 2023 06:37:02 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-20.bne.redhat.com [10.64.54.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 25E1740C945A;
 Sat, 25 Feb 2023 06:36:53 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, rad@semihalf.com,
 peter.maydell@linaro.org, quic_llindhol@quicinc.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 thuth@redhat.com, lvivier@redhat.com, pbonzini@redhat.com,
 imammedo@redhat.com, yihyu@redhat.com, ajones@ventanamicro.com,
 berrange@redhat.com, dbarboza@ventanamicro.com, shan.gavin@gmail.com
Subject: [PATCH v3 1/3] numa: Validate cluster and NUMA node boundary if
 required
Date: Sat, 25 Feb 2023 14:35:25 +0800
Message-Id: <20230225063527.281479-2-gshan@redhat.com>
In-Reply-To: <20230225063527.281479-1-gshan@redhat.com>
References: <20230225063527.281479-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: tuyYrxZp8l6C

For some architectures like ARM64, multiple CPUs in one cluster can be
associated with different NUMA nodes, which is irregular configuration
because we shouldn't have this in baremetal environment. The irregular
configuration causes Linux guest to misbehave, as the following warning
messages indicate.

  -smp 6,maxcpus=6,sockets=2,clusters=1,cores=3,threads=1 \
  -numa node,nodeid=0,cpus=0-1,memdev=ram0                \
  -numa node,nodeid=1,cpus=2-3,memdev=ram1                \
  -numa node,nodeid=2,cpus=4-5,memdev=ram2                \

  ------------[ cut here ]------------
  WARNING: CPU: 0 PID: 1 at kernel/sched/topology.c:2271 build_sched_domains+0x284/0x910
  Modules linked in:
  CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.14.0-268.el9.aarch64 #1
  pstate: 00400005 (nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
  pc : build_sched_domains+0x284/0x910
  lr : build_sched_domains+0x184/0x910
  sp : ffff80000804bd50
  x29: ffff80000804bd50 x28: 0000000000000002 x27: 0000000000000000
  x26: ffff800009cf9a80 x25: 0000000000000000 x24: ffff800009cbf840
  x23: ffff000080325000 x22: ffff0000005df800 x21: ffff80000a4ce508
  x20: 0000000000000000 x19: ffff000080324440 x18: 0000000000000014
  x17: 00000000388925c0 x16: 000000005386a066 x15: 000000009c10cc2e
  x14: 00000000000001c0 x13: 0000000000000001 x12: ffff00007fffb1a0
  x11: ffff00007fffb180 x10: ffff80000a4ce508 x9 : 0000000000000041
  x8 : ffff80000a4ce500 x7 : ffff80000a4cf920 x6 : 0000000000000001
  x5 : 0000000000000001 x4 : 0000000000000007 x3 : 0000000000000002
  x2 : 0000000000001000 x1 : ffff80000a4cf928 x0 : 0000000000000001
  Call trace:
   build_sched_domains+0x284/0x910
   sched_init_domains+0xac/0xe0
   sched_init_smp+0x48/0xc8
   kernel_init_freeable+0x140/0x1ac
   kernel_init+0x28/0x140
   ret_from_fork+0x10/0x20

Improve the situation to warn when multiple CPUs in one cluster have
been associated with different NUMA nodes. However, one NUMA node is
allowed to be associated with different clusters.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 hw/core/machine.c   | 42 ++++++++++++++++++++++++++++++++++++++++++
 include/hw/boards.h |  1 +
 2 files changed, 43 insertions(+)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index f29e700ee4..3513df5a86 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1252,6 +1252,45 @@ static void machine_numa_finish_cpu_init(MachineState *machine)
     g_string_free(s, true);
 }
 
+static void validate_cpu_cluster_to_numa_boundary(MachineState *ms)
+{
+    MachineClass *mc = MACHINE_GET_CLASS(ms);
+    NumaState *state = ms->numa_state;
+    const CPUArchIdList *possible_cpus = mc->possible_cpu_arch_ids(ms);
+    const CPUArchId *cpus = possible_cpus->cpus;
+    int len = possible_cpus->len, i, j;
+
+    if (state->num_nodes <= 1 || len <= 1) {
+        return;
+    }
+
+    /*
+     * The Linux scheduling domain can't be parsed when the multiple CPUs
+     * in one cluster have been associated with different NUMA nodes. However,
+     * it's fine to associate one NUMA node with CPUs in different clusters.
+     */
+    for (i = 0; i < len; i++) {
+        for (j = i + 1; j < len; j++) {
+            if (cpus[i].props.has_socket_id &&
+                cpus[i].props.has_cluster_id &&
+                cpus[i].props.has_node_id &&
+                cpus[j].props.has_socket_id &&
+                cpus[j].props.has_cluster_id &&
+                cpus[j].props.has_node_id &&
+                cpus[i].props.socket_id == cpus[j].props.socket_id &&
+                cpus[i].props.cluster_id == cpus[j].props.cluster_id &&
+                cpus[i].props.node_id != cpus[j].props.node_id) {
+                warn_report("CPU-%d and CPU-%d in socket-%ld-cluster-%ld "
+                             "have been associated with node-%ld and node-%ld "
+                             "respectively. It can cause OSes like Linux to"
+                             "misbehave", i, j, cpus[i].props.socket_id,
+                             cpus[i].props.cluster_id, cpus[i].props.node_id,
+                             cpus[j].props.node_id);
+            }
+        }
+    }
+}
+
 MemoryRegion *machine_consume_memdev(MachineState *machine,
                                      HostMemoryBackend *backend)
 {
@@ -1337,6 +1376,9 @@ void machine_run_board_init(MachineState *machine, const char *mem_path, Error *
         numa_complete_configuration(machine);
         if (machine->numa_state->num_nodes) {
             machine_numa_finish_cpu_init(machine);
+            if (machine_class->cpu_cluster_has_numa_boundary) {
+                validate_cpu_cluster_to_numa_boundary(machine);
+            }
         }
     }
 
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 6fbbfd56c8..c9793b2789 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -273,6 +273,7 @@ struct MachineClass {
     bool nvdimm_supported;
     bool numa_mem_supported;
     bool auto_enable_numa;
+    bool cpu_cluster_has_numa_boundary;
     SMPCompatProps smp_props;
     const char *default_ram_id;
 
-- 
2.23.0

