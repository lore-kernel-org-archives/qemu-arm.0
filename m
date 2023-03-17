Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp539899ejb;
        Thu, 16 Mar 2023 23:28:52 -0700 (PDT)
X-Google-Smtp-Source: AK7set9BraeM/d+VELXyBEKbeaNuWSuZJMmslks6PeTm26bQTAls36xDaUaqPIww26uhDleZj2T1
X-Received: by 2002:a05:6214:224a:b0:56b:f061:c3c6 with SMTP id c10-20020a056214224a00b0056bf061c3c6mr37978331qvc.33.1679034532438;
        Thu, 16 Mar 2023 23:28:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679034532; cv=none;
        d=google.com; s=arc-20160816;
        b=RSlFyZiJ6H6tb1MMKdOmQLOL9ZKpTc4iiAzp50kiO7wlheC41IoZS9KBCkf3O8l09f
         hgZr7zofdFsyboyeJG3Awubx+YzA92U1rK9A9xcz/pcjBi/7CwrsZignhvY/HtkJfyQ5
         jf3tfviDuVYXID8D/kIeNWDbWBNp0bbiuc0zZI97rqZ0pkt0gioUKKGDhivjQPU8aFMq
         5eHiI2tlcd1R1OlZ+ovzz4cUq6hVTQP6Ms2iKMh8Cno17XDt86Autsj4UzDQ+E+SA3dI
         dGVk2oW8FSHIYepTFsj7S9JyJ/GzSj5wj/XTQIN2PdYLr36/Bg9JvsmTG25ekdEv4pNs
         Mgtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:dkim-signature;
        bh=DUaA0w6Hlg4CnGtrq1U81HdQH9x+ppG61WKlaTQh/wY=;
        b=pef1ZX+GDMuG8PMMSH9kBYxHmxPLO6WqFrjVC4ezzTCk0GHC7cOTP1Nr88BspQr4FE
         jHPEsmsON2+AyuUeLSiWQ0RijAD4khYtwPYZr5d/TEXaBKfBoDP1flOMqVFOT02JRIuJ
         k/5ZasKpyjJCJp2VX3huigrs6iNh9sSVuo7HNzHXD9wec1sO0252qsZ+me3ijqSA909y
         Vr+vj4oUXpWkVFjnLDlEI8+tVRK46Byr3DKi1Hn+9figtcqQEI/AxW5nQonWQ61/6ev/
         GgSAiIlEbR+LOyNJ9GUezbRoYsmde8z9o55xA/g01DqFN7u+9loz6Ly1DyUH+FwgPoCv
         fVtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UsuDNCct;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t23-20020a37ea17000000b006fcaae20037si961286qkj.741.2023.03.16.23.28.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Mar 2023 23:28:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UsuDNCct;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pd3YX-0001fi-CJ; Fri, 17 Mar 2023 02:27:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pd3YR-0001ew-53
 for qemu-arm@nongnu.org; Fri, 17 Mar 2023 02:27:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pd3YM-0002tC-PM
 for qemu-arm@nongnu.org; Fri, 17 Mar 2023 02:27:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679034422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:mime-version: content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DUaA0w6Hlg4CnGtrq1U81HdQH9x+ppG61WKlaTQh/wY=;
 b=UsuDNCctali3luY39e5tie95Kml4xv4kxi5L/VBIV8iwG73ZiZbond8ha6poewpe6YfGeS
 dU5ZM1jJ1hId0ZkwAemKpQeV1OiFq1vcYCnCxvBTBDDgBlS2YS/65643BMuj6eQ4RkVytD
 Q7rehOdejKk7CwJXEs/MAUopU6Zk0pc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-279-gyotC7bbNkuTC8Ti9_PSZw-1; Fri, 17 Mar 2023 02:26:58 -0400
X-MC-Unique: gyotC7bbNkuTC8Ti9_PSZw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 46F5D3822DF6;
 Fri, 17 Mar 2023 06:26:57 +0000 (UTC)
Received: from gshan.redhat.com (ovpn-12-80.pek2.redhat.com [10.72.12.80])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6CD042166B26;
 Fri, 17 Mar 2023 06:26:47 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, rad@semihalf.com,
 peter.maydell@linaro.org, quic_llindhol@quicinc.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 thuth@redhat.com, lvivier@redhat.com, pbonzini@redhat.com,
 imammedo@redhat.com, ajones@ventanamicro.com, berrange@redhat.com,
 dbarboza@ventanamicro.com, yihyu@redhat.com, shan.gavin@gmail.com
Subject: [PATCH v4 1/3] numa: Validate cluster and NUMA node boundary if
 required
Date: Fri, 17 Mar 2023 14:25:40 +0800
Message-Id: <20230317062542.61061-2-gshan@redhat.com>
In-Reply-To: <20230317062542.61061-1-gshan@redhat.com>
References: <20230317062542.61061-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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
X-TUID: m7oQolRepbu3

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
Acked-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/core/machine.c   | 42 ++++++++++++++++++++++++++++++++++++++++++
 include/hw/boards.h |  1 +
 2 files changed, 43 insertions(+)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 45e3d24fdc..a2329f975d 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1255,6 +1255,45 @@ static void machine_numa_finish_cpu_init(MachineState *machine)
     g_string_free(s, true);
 }
 
+static void validate_cpu_cluster_to_numa_boundary(MachineState *ms)
+{
+    MachineClass *mc = MACHINE_GET_CLASS(ms);
+    NumaState *state = ms->numa_state;
+    const CPUArchIdList *possible_cpus = mc->possible_cpu_arch_ids(ms);
+    const CPUArchId *cpus = possible_cpus->cpus;
+    int i, j;
+
+    if (state->num_nodes <= 1 || possible_cpus->len <= 1) {
+        return;
+    }
+
+    /*
+     * The Linux scheduling domain can't be parsed when the multiple CPUs
+     * in one cluster have been associated with different NUMA nodes. However,
+     * it's fine to associate one NUMA node with CPUs in different clusters.
+     */
+    for (i = 0; i < possible_cpus->len; i++) {
+        for (j = i + 1; j < possible_cpus->len; j++) {
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
+                             "respectively. It can cause OSes like Linux to "
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
@@ -1340,6 +1379,9 @@ void machine_run_board_init(MachineState *machine, const char *mem_path, Error *
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

