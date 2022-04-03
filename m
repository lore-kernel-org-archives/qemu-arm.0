Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp2221884lfb;
        Sun, 3 Apr 2022 08:04:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHGBlbuUa7eoFZC3rXZTXcFR0ISeBNbtqE+rY27tJL00uUOwc3eEi0ZfD119qXE2vL8kaP
X-Received: by 2002:ad4:5f05:0:b0:440:ea8c:c439 with SMTP id fo5-20020ad45f05000000b00440ea8cc439mr14573068qvb.69.1648998259254;
        Sun, 03 Apr 2022 08:04:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648998259; cv=none;
        d=google.com; s=arc-20160816;
        b=G5Qd91VmaWaTc4TQqoCcKFVTX22zkw1qevd4hBTUgyUSPuU5Ar8jdNSqjarMBsJSbf
         7j33OVB8v03ZAewXjPLWxlneWBjWA0KOStB7dwlH/qZNkgKAERsQGIcC9QDPMVzHE+4k
         zaLZrdberNe3uimK3rCfQzWwApA+pWGHiFo7hEm+cKd4uV9Qp0gOis9+Zq9Rvn8Jyt/8
         OXbUVcg6MTNJaarq+Hg7CA0CXGHONUhS/LBOkEXEPMXXPRFjkkMcDTzRxARCNMRrBCGB
         TG2fL6Rp8XjqSZV+59atjJasrBGgde/kcp48/dEYeISj6bLP8wRFOBYDcWwp+a/Qt9ZP
         WqzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=O6ylnbFqxWvaIKtw/OQZfZinSRIgcgWR5K69Gk2p6ms=;
        b=PYLaaYAg7qXR3kmz2o8f+NnauywexUK7htKW/ssw5mIUUBBpG/Qd1L+Je/8/AWznO5
         ytDIpEE1CIBzUD+ezYk0Q5bs4192hR/jAdX4O+z7558f3VZ1bvChc8FW7RcWcTfVpVna
         9dX3IVIsGfXU5yRRM6uhGJxe92mwig/XCwaEgGDhyLMAMpjLYcP0lL00DPUK7xuxZ7ev
         OeSWa0IKlHYADp0Jn6Ka6fUWcFsHsgm7EMS7Xnn8FliPyuxNePMbdaolmnKPBo+qV1kq
         UsDKcx9ylQY2dg5oxwUILK0EKj0Rt3A5SvIFVtG3tR0z3WdKBOE1eVCT9wouw3uiR2cj
         QbgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JKZ1X0Jf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a13-20020a37660d000000b0067e4be237f7si2769886qkc.60.2022.04.03.08.04.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Apr 2022 08:04:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JKZ1X0Jf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nb1m6-0003hp-Oe
	for alex.bennee@linaro.org; Sun, 03 Apr 2022 11:04:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nb1iK-0005H8-64
 for qemu-arm@nongnu.org; Sun, 03 Apr 2022 11:00:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nb1iI-0003Hn-Lr
 for qemu-arm@nongnu.org; Sun, 03 Apr 2022 11:00:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648998022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O6ylnbFqxWvaIKtw/OQZfZinSRIgcgWR5K69Gk2p6ms=;
 b=JKZ1X0JfPoBFlSbZuMVDNkOjRBib+Y8eMBFGCI4XGTcahFBp1x1OQ9W/eE/9rKPZN4Nhzl
 JQIeOH8ZIxzcYiI1vuYiNXJiZKDlO1Hq6Uq1PvgRCTA1oSAFPjmkt5kpkVubdQZQf1/nm1
 AET9wkg+mKg3KR0OMBN/+B5wkFtMkWo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-250-3k4e8bS0MGeDyMqhvfOqNw-1; Sun, 03 Apr 2022 11:00:18 -0400
X-MC-Unique: 3k4e8bS0MGeDyMqhvfOqNw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6F5423806651;
 Sun,  3 Apr 2022 15:00:18 +0000 (UTC)
Received: from gshan.redhat.com (ovpn-12-82.pek2.redhat.com [10.72.12.82])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E3B50C15E73;
 Sun,  3 Apr 2022 15:00:13 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Subject: [PATCH v5 2/4] hw/arm/virt: Consider SMP configuration in CPU topology
Date: Sun,  3 Apr 2022 22:59:51 +0800
Message-Id: <20220403145953.10522-3-gshan@redhat.com>
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
X-TUID: 3f1Plm1YIuS5

Currently, the SMP configuration isn't considered when the CPU
topology is populated. In this case, it's impossible to provide
the default CPU-to-NUMA mapping or association based on the socket
ID of the given CPU.

This takes account of SMP configuration when the CPU topology
is populated. The die ID for the given CPU isn't assigned since
it's not supported on arm/virt machine yet.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 hw/arm/virt.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index d2e5ecd234..3174526730 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2505,6 +2505,7 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
     int n;
     unsigned int max_cpus = ms->smp.max_cpus;
     VirtMachineState *vms = VIRT_MACHINE(ms);
+    MachineClass *mc = MACHINE_GET_CLASS(vms);
 
     if (ms->possible_cpus) {
         assert(ms->possible_cpus->len == max_cpus);
@@ -2518,8 +2519,21 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
         ms->possible_cpus->cpus[n].type = ms->cpu_type;
         ms->possible_cpus->cpus[n].arch_id =
             virt_cpu_mp_affinity(vms, n);
+
+        assert(!mc->smp_props.dies_supported);
+        ms->possible_cpus->cpus[n].props.has_socket_id = true;
+        ms->possible_cpus->cpus[n].props.socket_id =
+            (n / (ms->smp.clusters * ms->smp.cores * ms->smp.threads)) %
+            ms->smp.sockets;
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
-- 
2.23.0

