Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp2221071lfb;
        Sun, 3 Apr 2022 08:02:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIBqBdJzGHn6biddXr7YkOhJ2vfXuGfhpZhtFzAAQPwupPgd61YcZyFV7Edvx7PWoF2uFS
X-Received: by 2002:a05:6214:1bcb:b0:441:759e:84b9 with SMTP id m11-20020a0562141bcb00b00441759e84b9mr43136149qvc.19.1648998179425;
        Sun, 03 Apr 2022 08:02:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648998179; cv=none;
        d=google.com; s=arc-20160816;
        b=CIs7JV0v7RBn00zLTf4tMbG7iSDPEx1t9DCoyK5YChDs1w1JN0t5QNslHQLaFEERDT
         Re5Ci4iD2swOLRcjOvnyGi7jquTU3bMa97bY8/W3YbUiOlCljXGKZFBtwnytjGUDuHrM
         77M1aWc6ZM/+DHdLKO6tJKkjfWRIw1gWt2Ut+WnQJsbrHrBvwg+jJbcHKds/DOHZHeiW
         7l0RFMy8UoYhvFiJVWlEmNUGzzUQqVmGZbwPQEewXY7YoXoCqYOHU+8VBmZUl6nVGGF4
         ldG5hV1qssSYjOqforCg+EKeoIT23jut5hLdRDc3hMTjGP8Yi2+qzx+EnsF7YPzKO31S
         rz7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=FIDWKgza0gEgTPcXPEkTIi+2n7hdo7Sn9t1ArMvBgTg=;
        b=RE1aWpLDkgDQlRJWrPsDzoQo66QFhYd9ufldaMz0gjHEbb0O8DWJrL/5JqX9eFJQo1
         5PmQ9KyQC8/OlMAV4pxa1ZiePpFzxC+VgKu2H1pb0zKWAEcAUE0REDbusYlUBTqnfLsN
         l2VI3SZ9hcvB27NOFswjN3wdMiqFaABQQp1OB7FuvpFWeZ2aSbJL5A3vrlV4Mzs5bIgT
         hO8AUZktJY6IOWtANhgxffWdER6L/NPera5QUtPlReTgExV8JbUuOmMBVnAAIxvfmXWF
         t8NMFMDtrTEyI9bL7v7sl0Jv+/zrrrWv+hjxgiPdHOVwxQXHL20Rpuldt6VcEHh86wNa
         iIcA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HDQeSAZm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w4-20020ac84d04000000b002e227eff876si2400254qtv.668.2022.04.03.08.02.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Apr 2022 08:02:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HDQeSAZm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nb1ko-00013T-Kg
	for alex.bennee@linaro.org; Sun, 03 Apr 2022 11:02:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nb1iP-0005Jn-Rj
 for qemu-devel@nongnu.org; Sun, 03 Apr 2022 11:00:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nb1iO-0003IQ-52
 for qemu-devel@nongnu.org; Sun, 03 Apr 2022 11:00:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648998027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FIDWKgza0gEgTPcXPEkTIi+2n7hdo7Sn9t1ArMvBgTg=;
 b=HDQeSAZmuDt/ua25fw3/MOEh8S0S0GKX3skQjCCEEo8wnzVBRF/nGTlE6OHYl2LYNNkCmR
 DVaE8ww5+Fn6jPxFem7nVagO+mv/qLDr3AW/gJTkh9C0tNOMWGsI2H5es/wVaVqs+AJkY2
 2GbbFbbpK323AxGxOT8Emv0CE6V+AOQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-492-EtSqnSEyOJGB--1nWdbLMA-1; Sun, 03 Apr 2022 11:00:24 -0400
X-MC-Unique: EtSqnSEyOJGB--1nWdbLMA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BF3B33C0218E;
 Sun,  3 Apr 2022 15:00:23 +0000 (UTC)
Received: from gshan.redhat.com (ovpn-12-82.pek2.redhat.com [10.72.12.82])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 401A3C15E73;
 Sun,  3 Apr 2022 15:00:18 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Subject: [PATCH v5 3/4] hw/arm/virt: Fix CPU's default NUMA node ID
Date: Sun,  3 Apr 2022 22:59:52 +0800
Message-Id: <20220403145953.10522-4-gshan@redhat.com>
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, zhenyzha@redhat.com, wangyanan55@huawei.com,
 shan.gavin@gmail.com, imammedo@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OTgXAJk/WzrP

When CPU-to-NUMA association isn't explicitly provided by users,
the default one is given by mc->get_default_cpu_node_id(). However,
the CPU topology isn't fully considered in the default association
and this causes CPU topology broken warnings on booting Linux guest.

For example, the following warning messages are observed when the
Linux guest is booted with the following command lines.

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

With current implementation of mc->get_default_cpu_node_id(),
CPU#0 to CPU#5 are associated with NODE#0 to NODE#5 separately.
That's incorrect because CPU#0/1/2 should be associated with same
NUMA node because they're seated in same socket.

This fixes the issue by considering the socket ID when the default
CPU-to-NUMA association is provided in virt_possible_cpu_arch_ids().
With this applied, no more CPU topology broken warnings are seen
from the Linux guest. The 6 CPUs are associated with NODE#0/1, but
there are no CPUs associated with NODE#2/3/4/5.

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
---
 hw/arm/virt.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 3174526730..d8b621ef79 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2497,7 +2497,9 @@ virt_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
 
 static int64_t virt_get_default_cpu_node_id(const MachineState *ms, int idx)
 {
-    return idx % ms->numa_state->num_nodes;
+    int64_t socket_id = ms->possible_cpus->cpus[idx].props.socket_id;
+
+    return socket_id % ms->numa_state->num_nodes;
 }
 
 static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
-- 
2.23.0

