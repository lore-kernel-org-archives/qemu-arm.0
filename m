Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp3033688lfk;
        Wed, 20 Apr 2022 03:54:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwlPD8fq1TgN64MWnd2+KOvgqFcpspnTeNodVPWehcOuJnvvHZCK6jWq5XWIDNPiZrGYa+v
X-Received: by 2002:a05:620a:109c:b0:69e:88e4:b26b with SMTP id g28-20020a05620a109c00b0069e88e4b26bmr9831681qkk.404.1650452046247;
        Wed, 20 Apr 2022 03:54:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650452046; cv=none;
        d=google.com; s=arc-20160816;
        b=AiHDvhJvBTFAOWgUMa/VyyrGDofoqxL/GjayUU6P5IeRq3UJyaSUkMb/aOtgFaGA/k
         lUtbCx80ln+HVP//84MmaLJpbP19Jy0m8QlCVz+izma0KxuYdAjHmVTFdbZtGBdP7EuB
         6/Llut3Gla6XlL7j8pS4j6qcEh+ILr6zbe0SQJWqTkqh/lysqcEMjtNqvIcP80Ej85rf
         f4il+NleSXySDS7hvFsxtR2sAFODO6+sSPwq0oGbjEYP2vQBEQiYHr6YV60p36Bmfr/1
         WWOHBTyi6e9ch69//nPMLtTxJ78bTfR4aUEL6lPM6uuP4Pw4y7lo0d1rDuhguuhO4G5i
         gzag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=5pl/2vowPkUpsJ6JfH5IYPAqiwdXxCj0iCkTfGRGjl4=;
        b=DxTgjr8OOuLPzd6UbTUP8N91Uyj9BUIKGBH6co3d8prcVk/4U7uQm7EWG47fha93wp
         jsrJTVDR3Ioh7U56nyAkbt7jBOgGEvaEGLd5iJSaBI5zmnhPZoCauV65TjrdIeZd7UW+
         mkUZOUMQemmDkIFs7gwdHek+zgF5hJJLESdbcDpQD/Z/cCrUQaoAX/JHmiuAifZYnTHv
         QT74jT+Hk5h3s1GLgpZ3RECyT48xOMhu4wC7KHTNMJ3JAsjITRZRxaj6X0K2fGcJ5hf8
         Sa8q6bSTzOmpasVNuPiKokLkr36+X3NQCL3A+yt/qCvQMCifgKQt4H0mLQWZvUAzNyxz
         rPiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PwGTWIJK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r21-20020ac85c95000000b002ef1366d2bfsi417909qta.662.2022.04.20.03.54.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Apr 2022 03:54:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PwGTWIJK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nh7yH-0007e4-Ma
	for alex.bennee@linaro.org; Wed, 20 Apr 2022 06:54:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nh7wV-0005OJ-50
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 06:52:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nh7wT-0001LV-8f
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 06:52:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650451932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5pl/2vowPkUpsJ6JfH5IYPAqiwdXxCj0iCkTfGRGjl4=;
 b=PwGTWIJKbhdtaOfsfNRcAw5cT9n6u9/E9OVC1Rmzy2SdNqtom85FY7OxgAOCngtoNutwsW
 VvfqYv8u8PP/5JgRKD4h/sdA3WBaVW3WkhFonookkgREdar8AKuSe7V8e4k7ndicVgHIOu
 lsI/jDGJPUEUljt8C+jw5/1yOKIAwFU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-330-kDmi8u0CNzSW9MN4fBWpmg-1; Wed, 20 Apr 2022 06:52:08 -0400
X-MC-Unique: kDmi8u0CNzSW9MN4fBWpmg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A5DA5101AA42;
 Wed, 20 Apr 2022 10:52:07 +0000 (UTC)
Received: from gshan.redhat.com (ovpn-13-230.pek2.redhat.com [10.72.13.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0251F40D1B9B;
 Wed, 20 Apr 2022 10:51:58 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Subject: [PATCH v7 2/4] hw/arm/virt: Consider SMP configuration in CPU topology
Date: Wed, 20 Apr 2022 18:49:07 +0800
Message-Id: <20220420104909.233058-3-gshan@redhat.com>
In-Reply-To: <20220420104909.233058-1-gshan@redhat.com>
References: <20220420104909.233058-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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
Cc: lvivier@redhat.com, eduardo@habkost.net, thuth@redhat.com,
 berrange@redhat.com, shan.gavin@gmail.com, peter.maydell@linaro.org,
 Jonathan.Cameron@Huawei.com, zhenyzha@redhat.com, mst@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com, wangyanan55@huawei.com,
 imammedo@redhat.com, ani@anisinha.ca, pbonzini@redhat.com, drjones@redhat.com,
 eblake@redhat.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PqCJIyIiKZYD

Currently, the SMP configuration isn't considered when the CPU
topology is populated. In this case, it's impossible to provide
the default CPU-to-NUMA mapping or association based on the socket
ID of the given CPU.

This takes account of SMP configuration when the CPU topology
is populated. The die ID for the given CPU isn't assigned since
it's not supported on arm/virt machine. Besides, the used SMP
configuration in qtest/numa-test/aarch64_numa_cpu() is corrcted
to avoid testing failure

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
---
 hw/arm/virt.c           | 15 ++++++++++++++-
 tests/qtest/numa-test.c |  3 ++-
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index d2e5ecd234..5443ecae92 100644
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
+            (n / (ms->smp.clusters * ms->smp.cores * ms->smp.threads));
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
diff --git a/tests/qtest/numa-test.c b/tests/qtest/numa-test.c
index 90bf68a5b3..aeda8c774c 100644
--- a/tests/qtest/numa-test.c
+++ b/tests/qtest/numa-test.c
@@ -223,7 +223,8 @@ static void aarch64_numa_cpu(const void *data)
     QTestState *qts;
     g_autofree char *cli = NULL;
 
-    cli = make_cli(data, "-machine smp.cpus=2 "
+    cli = make_cli(data, "-machine "
+        "smp.cpus=2,smp.sockets=1,smp.clusters=1,smp.cores=1,smp.threads=2 "
         "-numa node,nodeid=0,memdev=ram -numa node,nodeid=1 "
         "-numa cpu,node-id=1,thread-id=0 "
         "-numa cpu,node-id=0,thread-id=1");
-- 
2.23.0

