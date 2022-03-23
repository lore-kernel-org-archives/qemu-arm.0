Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp2170775lfb;
        Wed, 23 Mar 2022 00:29:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwesXfBzVOkK6itHqGjp2AovxDRGDMgEoumjc4qq2aaEIgJEkA0M32Zi/eObw6LeI7ui7Ou
X-Received: by 2002:a05:620a:410b:b0:67d:d59c:13b8 with SMTP id j11-20020a05620a410b00b0067dd59c13b8mr18428996qko.449.1648020579554;
        Wed, 23 Mar 2022 00:29:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648020579; cv=none;
        d=google.com; s=arc-20160816;
        b=V4Ar+6bd0oRvSW/B3D4KwncT+dvNc2hxnHTHzag6PqltxTtM6Vmq2NBsBieyj5dXee
         lktoLGGK4MgLIh6ksnS27wJumihPsWfBlRX0vNOM/rJzRUKNGSTr0Y4fA0C3I00EFt3u
         KABC3pPvTwT9Vi+CljKyXWJniWG69QzTv6A+GWowISujaC1U18458yUiGoFgLsi0YNoc
         0CrWHHcQyexJss43lBpb/7IbwasWGbFaOHK+OmUfv4FSFmIJJ9rc1k49M5XYKM3EKxtM
         YUQYhWZhVcdxl4EHdWxPvEwE8QZbVQy0sJunffYwYBkpFuzBF6QWFIGc+t6yCTGKop7N
         4KuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Rtv9o7Oufvn3+0c0LuDGlrWeerBj5JYtg65fpCw6whI=;
        b=orWe/BDPO9cNnGERkNhdAHCSx++olSQfc1Bm0cyuIhO/qhgLJmxQO8oh2bmgB5Ws8r
         /BwchL+eai1CW1UbYjsDnT7XQFX8zsIchTfTNuZmvgnb3BqU4t5fJHxd+E5YCEcvm4yN
         8eZ9WQfzOX59lII3a+mUW2oVWB/Yl0maVESB87e+6iJUwfmE2de9b6A7wdWJEnwNLUBj
         cD3FP+13khPNFalmztP7ikqjXx0YIg1PS+aSIjlyLtiibuSnJXPr2I+qyEXXaVNgG0q4
         /Max+zLhwBpOJMn6vn8l4CYMPbemLBek7S6JRx/9LSdAhfa9P2Ed785kQK+ufmLeDLP3
         EZyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=X6Iz3X9O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s2-20020ac85cc2000000b002e1fbf3c0c1si4127749qta.690.2022.03.23.00.29.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Mar 2022 00:29:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=X6Iz3X9O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nWvR4-0000sR-Vz
	for alex.bennee@linaro.org; Wed, 23 Mar 2022 03:29:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nWvNA-00047b-4c
 for qemu-arm@nongnu.org; Wed, 23 Mar 2022 03:25:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nWvN7-0000ud-FO
 for qemu-arm@nongnu.org; Wed, 23 Mar 2022 03:25:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648020332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rtv9o7Oufvn3+0c0LuDGlrWeerBj5JYtg65fpCw6whI=;
 b=X6Iz3X9OKffOCJiRY0IgECF5XXy31fk8pefrryosCy5eZHx39a5TUgOU0YW7SyEUI3KceD
 /CqEzbStQfGB6iWsD2qdk7t5brf+upWqp4b/e+HPxtCOpCYDJkTBQ/bH/oB0eLNWNATD6m
 j7GwEkWzF2qMrkxZECeSLQdk/edbAXQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-562-jxTKAhE1OxSKiiEXvhAYhg-1; Wed, 23 Mar 2022 03:25:29 -0400
X-MC-Unique: jxTKAhE1OxSKiiEXvhAYhg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 40DF485A5A8;
 Wed, 23 Mar 2022 07:25:29 +0000 (UTC)
Received: from gshan.redhat.com (ovpn-12-33.pek2.redhat.com [10.72.12.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3C3FB2166B2D;
 Wed, 23 Mar 2022 07:25:20 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Subject: [PATCH v3 2/4] hw/arm/virt: Fix CPU's default NUMA node ID
Date: Wed, 23 Mar 2022 15:24:36 +0800
Message-Id: <20220323072438.71815-3-gshan@redhat.com>
In-Reply-To: <20220323072438.71815-1-gshan@redhat.com>
References: <20220323072438.71815-1-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: XfqOdMf3B0HJ

When CPU-to-NUMA association isn't explicitly provided by users,
the default on is given by mc->get_default_cpu_node_id(). However,
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
---
 hw/arm/virt.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 064eac42f7..3286915229 100644
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

