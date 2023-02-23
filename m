Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp475545ejc;
        Thu, 23 Feb 2023 00:15:09 -0800 (PST)
X-Google-Smtp-Source: AK7set/0PL4HDbF76zIBg+l7R87+1VraH3MNK/TNzWzh1jOTs50ZPLMRYBDz3UXrQayTL/V1mTxe
X-Received: by 2002:ac8:59c8:0:b0:3b8:6a20:675e with SMTP id f8-20020ac859c8000000b003b86a20675emr4379435qtf.29.1677140109798;
        Thu, 23 Feb 2023 00:15:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677140109; cv=none;
        d=google.com; s=arc-20160816;
        b=pyWZqOb1mYR2WPwCnmpFZTV82maavLwIMWvsy/FWgNXxWZhWX9BTnEnJpfBw33XQwj
         bNraPeBu5E+6ngZnh9Kq9J8B94oel7LabngpW5owOdORGkOyMFaEisnS5kHwLFyrHIyD
         aIIxhK6Aj7sfUS4wMe/vbV/WKtdjM9IDDRmT/HgnnnFBeX+V/T0JnJJTqq/hZk9dM8xP
         x3+8tXoijnwClKgmDXrweMxAyQhtzzmbdec5LQFhp1OiEFPsK+BQYbJe6ZRX6GYvniaG
         B8jA4xqT7v1H6U7fSFqf359p3oiJ9vaDZ3p2dwcu5M2QFMPLXruE7bbiriujeHg89x8t
         /Lbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=g92Td8QRvrVk+sq1KWvUB3XXi6JuTsKzLd866Am/PBk=;
        b=wrUSIAyITn96ctjYYIqKL53NAgxw6cMv1nfK9RD9HLzZg0I1sm7EXWV4AY+aVVt1sh
         QphnK+j476qPxdJwj5EQ5KlBNrejcYnrO+HqjsqOFSBxeLB5vCioXq45dwNWn5zw2JFu
         uCl5BYIZOys8phRQv407T0AT9p8ZOtVb7cjFUgg7BysA9yBdU+b1cOtqjc3sGfgiPMP3
         iT1TQFoRH2PuqCgHGcbtVS/NDoe+ER3oFGEOiecHjAlRrDsJZT61v9iT7D+3yWUuJV7V
         M1oxYtChAiv/l03Taukfr4gsoALA1PLwLFvH0oUu7W63kQ6IRP4LE5Ui9h/lzFNKpcuE
         25kg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NE6RVDDQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u9-20020ac858c9000000b003b86d5731b8si16581826qta.760.2023.02.23.00.15.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Feb 2023 00:15:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NE6RVDDQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pV6kU-0003Yk-Vi; Thu, 23 Feb 2023 03:14:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pV6kT-0003Y4-IU
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 03:14:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pV6kR-0001FE-JZ
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 03:14:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677140078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g92Td8QRvrVk+sq1KWvUB3XXi6JuTsKzLd866Am/PBk=;
 b=NE6RVDDQ4Msyi3PqkZv6AOa58SuQpdYry2w6X8jlD+6yXPvbuUmrRjsLBFe3tM+us8Pz6M
 M/9hc2QRvrc8joTxXtcnVF9NaQghWhpIYCt4vKs+ZkiQoVcR6pKP4xxfHl8g9tVFSfAd0M
 dqyFueKTvvI1MsXyP7+fC6d+Y3MY4ow=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-571-11eOUpCuMGidHF106ejm6g-1; Thu, 23 Feb 2023 03:14:37 -0500
X-MC-Unique: 11eOUpCuMGidHF106ejm6g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D1298101A521;
 Thu, 23 Feb 2023 08:14:35 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-168.bne.redhat.com [10.64.54.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 96CF118EC1;
 Thu, 23 Feb 2023 08:14:28 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, rad@semihalf.com,
 peter.maydell@linaro.org, quic_llindhol@quicinc.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 thuth@redhat.com, lvivier@redhat.com, pbonzini@redhat.com,
 imammedo@redhat.com, yihyu@redhat.com, shan.gavin@gmail.com
Subject: [PATCH v2 2/4] numa: Validate socket and NUMA node boundary if
 required
Date: Thu, 23 Feb 2023 16:13:59 +0800
Message-Id: <20230223081401.248835-3-gshan@redhat.com>
In-Reply-To: <20230223081401.248835-1-gshan@redhat.com>
References: <20230223081401.248835-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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
X-TUID: hnRG3vjIzHdO

For some architectures like ARM64, multiple CPUs in one socket can't be
associated with different NUMA nodes. Otherwise, the guest kernel is confused
about the CPU topology. For example, the following warning message is observed
from linux guest with the below command lines.

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

Improve the sitation to reject the configuration where multiple CPUs
in one socket have been associated with different NUMA nodes. The
newly introduced helper set_numa_socket_boundary() is expected to
called by specific machines (boards) where the boundary is required.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 hw/core/machine.c     | 34 ++++++++++++++++++++++++++++++++++
 hw/core/numa.c        |  7 +++++++
 include/sysemu/numa.h |  4 ++++
 3 files changed, 45 insertions(+)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index f73fc4c45c..875a3fe6c4 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1174,6 +1174,36 @@ static char *cpu_slot_to_string(const CPUArchId *cpu)
     return g_string_free(s, false);
 }
 
+static void numa_validate_socket_boundary(MachineState *ms)
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
+    for (i = 0; i < len; i++) {
+        for (j = i + 1; j < len; j++) {
+            if (cpus[i].props.has_socket_id &&
+                cpus[i].props.has_node_id &&
+                cpus[j].props.has_socket_id &&
+                cpus[j].props.has_node_id &&
+                cpus[i].props.socket_id == cpus[j].props.socket_id &&
+                cpus[i].props.node_id != cpus[j].props.node_id) {
+                error_report("CPU-%d and CPU-%d in socket-%ld have been "
+                             "associated with node-%ld and node-%ld "
+                             "respectively", i, j, cpus[i].props.socket_id,
+                             cpus[i].props.node_id, cpus[j].props.node_id);
+                exit(1);
+            }
+        }
+    }
+}
+
 static void numa_validate_initiator(NumaState *numa_state)
 {
     int i;
@@ -1239,6 +1269,10 @@ static void machine_numa_finish_cpu_init(MachineState *machine)
         }
     }
 
+    if (machine->numa_state->have_socket_boundary) {
+        numa_validate_socket_boundary(machine);
+    }
+
     if (machine->numa_state->hmat_enabled) {
         numa_validate_initiator(machine->numa_state);
     }
diff --git a/hw/core/numa.c b/hw/core/numa.c
index d8d36b16d8..ebdd964ec8 100644
--- a/hw/core/numa.c
+++ b/hw/core/numa.c
@@ -460,6 +460,13 @@ void parse_numa_hmat_cache(MachineState *ms, NumaHmatCacheOptions *node,
     ms->numa_state->hmat_cache[node->node_id][node->level] = hmat_cache;
 }
 
+void set_numa_socket_boundary(MachineState *ms)
+{
+    if (ms->numa_state) {
+        ms->numa_state->have_socket_boundary = true;
+    }
+}
+
 void set_numa_options(MachineState *ms, NumaOptions *object, Error **errp)
 {
     if (!ms->numa_state) {
diff --git a/include/sysemu/numa.h b/include/sysemu/numa.h
index 4173ef2afa..160008fff4 100644
--- a/include/sysemu/numa.h
+++ b/include/sysemu/numa.h
@@ -86,6 +86,9 @@ struct NumaState {
     /* Detect if HMAT support is enabled. */
     bool hmat_enabled;
 
+    /* CPUs in one socket can't break socket boundary */
+    bool have_socket_boundary;
+
     /* NUMA nodes information */
     NodeInfo nodes[MAX_NODES];
 
@@ -97,6 +100,7 @@ struct NumaState {
 };
 typedef struct NumaState NumaState;
 
+void set_numa_socket_boundary(MachineState *ms);
 void set_numa_options(MachineState *ms, NumaOptions *object, Error **errp);
 void parse_numa_opts(MachineState *ms);
 void parse_numa_hmat_lb(NumaState *numa_state, NumaHmatLBOptions *node,
-- 
2.23.0

