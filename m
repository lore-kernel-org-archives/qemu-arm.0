Received: by 10.25.221.202 with SMTP id w71csp2358470lfi;
        Fri, 4 Aug 2017 10:33:20 -0700 (PDT)
X-Received: by 10.55.95.194 with SMTP id t185mr3730832qkb.61.1501868000394;
        Fri, 04 Aug 2017 10:33:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501868000; cv=none;
        d=google.com; s=arc-20160816;
        b=cCJ2+MRFjEtdXFsremjBh1zdKy7WKTiGJAOGXth/dvZ1iT3n9Opjkbok6JveVSoNLQ
         2RRpVVTZSs92L5z2v3AZuJzkgFGxgtC5Dy/ZCpkKDleLRBhoTGp6qLY9XGw/59IZQwbP
         F9KRk8NCDk9n+Kf1cPPX0p2EqXntOCX6PXihonJViX1rUC4+f2lxcJIy+H231JVKEHVW
         r9tZyTcMWSbmthfB9Nv3/FEjuKq29zcgYx1CThABjgb2o4nbkdKecB/o8zzRYAfGo9SI
         SfY0MaUuo20/zXnGmBqNIYL266F4ksc6O9lZjM39h/9xSXykOKzzIdWgqajaYC4VQq5v
         OAqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=21P/7GRc+QbbnGboiwSNmTbF/6iO5S9DKxlYFbSWIb4=;
        b=AMHfQnVizVqYqTdb0/y01aHFRpytjdKS5x/1QlM+VfqZHcsAhQTkgkdN2LH8gvnKre
         eix45itKXzktPF9wr9HkdLDb36plpNEmdplBFy9GyvHpN3MxoO48sD7P0iJUmHf8rqn7
         zOBBUHL3yRDXY3WeV7ObobXeU8ni89IM9OQQhLlehLs0ijlBgrxGD3dPWnsxt6OsII0/
         Yz6AMplcnd4bpmkog7iq1fXTCiEO25jHlwdGZOT+ubucQuDVfZTx4P003ogJ1CHmg3eG
         7hIPv56M8b1t1wc0UzQfGI6nR/nAtjFaFLCwoR8w+2AT1ALHi1GhSbf7qWhsJ5SPGFho
         +zFA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c185si2352360qka.342.2017.08.04.10.33.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 Aug 2017 10:33:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40465 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ddgTN-0007Ty-Kx
	for alex.bennee@linaro.org; Fri, 04 Aug 2017 13:33:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46901)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1ddgTC-0007TC-SR
	for qemu-arm@nongnu.org; Fri, 04 Aug 2017 13:33:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1ddgTB-0001ht-O1
	for qemu-arm@nongnu.org; Fri, 04 Aug 2017 13:33:06 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37805)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1ddgTB-0001gy-H3; Fri, 04 Aug 2017 13:33:05 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1ddgHL-0006sR-8c; Fri, 04 Aug 2017 18:20:51 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri,  4 Aug 2017 18:20:43 +0100
Message-Id: <1501867249-1924-3-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1501867249-1924-1-git-send-email-peter.maydell@linaro.org>
References: <1501867249-1924-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 2/8] cpu: Define new cpu_transaction_failed() hook
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <rth@twiddle.net>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2gZUvci3C6oW

Currently we have a rather half-baked setup for allowing CPUs to
generate exceptions on accesses to invalid memory: the CPU has a
cpu_unassigned_access() hook which the memory system calls in
unassigned_mem_write() and unassigned_mem_read() if the current_cpu
pointer is non-NULL.  This was originally designed before we
implemented the MemTxResult type that allows memory operations to
report a success or failure code, which is why the hook is called
right at the bottom of the memory system.  The major problem with
this is that it means that the hook can be called even when the
access was not actually done by the CPU: for instance if the CPU
writes to a DMA engine register which causes the DMA engine to begin
a transaction which has been set up by the guest to operate on
invalid memory then this will casue the CPU to take an exception
incorrectly.  Another minor problem is that currently if a device
returns a transaction error then this won't turn into a CPU exception
at all.

The right way to do this is to have allow the CPU to respond
to memory system transaction failures at the point where the
CPU specific code calls into the memory system.

Define a new QOM CPU method and utility function
cpu_transaction_failed() which is called in these cases.
The functionality here overlaps with the existing
cpu_unassigned_access() because individual target CPUs will
need some work to convert them to the new system. When this
transition is complete we can remove the old cpu_unassigned_access()
code.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/qom/cpu.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/include/qom/cpu.h b/include/qom/cpu.h
index 25eefea..fc54d55 100644
--- a/include/qom/cpu.h
+++ b/include/qom/cpu.h
@@ -85,8 +85,10 @@ struct TranslationBlock;
  * @has_work: Callback for checking if there is work to do.
  * @do_interrupt: Callback for interrupt handling.
  * @do_unassigned_access: Callback for unassigned access handling.
+ * (this is deprecated: new targets should use do_transaction_failed instead)
  * @do_unaligned_access: Callback for unaligned access handling, if
  * the target defines #ALIGNED_ONLY.
+ * @do_transaction_failed: Callback for handling failed memory transactions
  * @virtio_is_big_endian: Callback to return %true if a CPU which supports
  * runtime configurable endianness is currently big-endian. Non-configurable
  * CPUs can use the default implementation of this method. This method should
@@ -153,6 +155,10 @@ typedef struct CPUClass {
     void (*do_unaligned_access)(CPUState *cpu, vaddr addr,
                                 MMUAccessType access_type,
                                 int mmu_idx, uintptr_t retaddr);
+    void (*do_transaction_failed)(CPUState *cpu, hwaddr physaddr, vaddr addr,
+                                  unsigned size, MMUAccessType access_type,
+                                  int mmu_idx, MemTxAttrs attrs,
+                                  MemTxResult response, uintptr_t retaddr);
     bool (*virtio_is_big_endian)(CPUState *cpu);
     int (*memory_rw_debug)(CPUState *cpu, vaddr addr,
                            uint8_t *buf, int len, bool is_write);
@@ -837,6 +843,21 @@ static inline void cpu_unaligned_access(CPUState *cpu, vaddr addr,
 
     cc->do_unaligned_access(cpu, addr, access_type, mmu_idx, retaddr);
 }
+
+static inline void cpu_transaction_failed(CPUState *cpu, hwaddr physaddr,
+                                          vaddr addr, unsigned size,
+                                          MMUAccessType access_type,
+                                          int mmu_idx, MemTxAttrs attrs,
+                                          MemTxResult response,
+                                          uintptr_t retaddr)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+
+    if (cc->do_transaction_failed) {
+        cc->do_transaction_failed(cpu, physaddr, addr, size, access_type,
+                                  mmu_idx, attrs, response, retaddr);
+    }
+}
 #endif
 
 #endif /* NEED_CPU_H */
-- 
2.7.4

