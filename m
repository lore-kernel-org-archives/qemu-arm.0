Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp2095972lfk;
        Sun, 24 Apr 2022 20:32:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJynL2UGhDrtSflQcPBLZUVm/12jX7KFXsNbi8V/EMTjXEaQ66cAmBLfV7cs+HujihqaX7KV
X-Received: by 2002:a37:9487:0:b0:67e:81c3:506b with SMTP id w129-20020a379487000000b0067e81c3506bmr9011448qkd.254.1650857567839;
        Sun, 24 Apr 2022 20:32:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650857567; cv=none;
        d=google.com; s=arc-20160816;
        b=oKrjcqCb7SxefxfXkn1+UTVBf8vOXJ7LHmsUTIFNGudLp66h6IxaDwmjFRUAf7GQE+
         bQNzcax8ToUhfgAnZYNV4f/Kx7VFBZ2aiWw6SGMb0shdpvtrqdSJl1ze8W0mkl/Wq70P
         qgtOfu+XGZJ53bpeqOREuB80RStSEwx5LnHUe2UBEJL+vcOBtT+dU88Ze47d5/EzcHrp
         ZgarFnZrytm1C92q8AJFNTE5hUcic+UjXk6A4QsBY/9NzDW+KGsbuceoTXe2ORzWFlyh
         KhpUfj3L4jnHoHGJbW5A4iWZIPXIGYwaonEdCr0oKuj6qUE9mzo3eB/RzxAQSMQzrH/t
         a0XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=SN/ex92kVojKA/OkOUpDBw4NPGyT+0N4GH9m8KQ+aNQ=;
        b=JdsB9KZPVAK8FUM7/UhHqTB4i25DobC5KlIffw/iUNuHZoa0Ap5fIhkEONdsio4Jgi
         B6I+r9814TQWksjoA1+YgBwBhglIoT1xJQDN5Cy0dGUoUxoNVxcuaPftsFoc1+vS5RK5
         fOOGdi9nzLNW009D1VRV25etSZnn+PQAP4QIRS6tD+A0cCVP4OGWeBCOW8J1WxZFy/eQ
         nBFPdZ6j54UApDq9gBLURNh/GnTSfJwwamHwf1ZKEahROAYSHcSeKxIdHiE06TXGkZuJ
         B58H8p2JAcYEragg7znPlYiVagHunj4xQfcBWqre9D3WsBPXAP6GkHRmopOvmhdcKoeY
         xXQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WxxU3CHS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n10-20020a05620a294a00b0069f52c35d28si661621qkp.162.2022.04.24.20.32.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 24 Apr 2022 20:32:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WxxU3CHS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nipSx-0000Mg-BV
	for alex.bennee@linaro.org; Sun, 24 Apr 2022 23:32:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nipQE-0003aV-Px
 for qemu-arm@nongnu.org; Sun, 24 Apr 2022 23:29:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nipQB-0002Qh-Jn
 for qemu-arm@nongnu.org; Sun, 24 Apr 2022 23:29:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650857395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SN/ex92kVojKA/OkOUpDBw4NPGyT+0N4GH9m8KQ+aNQ=;
 b=WxxU3CHS0wxy2K5f1kjJ4YvZTwgbg9StWAlWH9HNR7Ux0yL9eugLHcM0SvA8hubN541F2X
 jJx4wCnmpgl8pDpMtQJaRoYN3ktAPpa/NVKEoSAGc9AZAdk5HH03KlMMb4vOdRECAG+1Xt
 XGFF8sZoVdeA5+dH2zvvF0WGYsyE1zk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-37-txbOkXomMy-FVVBIidwGnw-1; Sun, 24 Apr 2022 23:29:52 -0400
X-MC-Unique: txbOkXomMy-FVVBIidwGnw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 81D86101AA42;
 Mon, 25 Apr 2022 03:29:51 +0000 (UTC)
Received: from gshan.redhat.com (ovpn-13-230.pek2.redhat.com [10.72.13.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8CC3F145BEF7;
 Mon, 25 Apr 2022 03:29:43 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Subject: [PATCH v8 3/5] hw/arm/virt: Consider SMP configuration in CPU topology
Date: Mon, 25 Apr 2022 11:28:00 +0800
Message-Id: <20220425032802.365061-4-gshan@redhat.com>
In-Reply-To: <20220425032802.365061-1-gshan@redhat.com>
References: <20220425032802.365061-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: lvivier@redhat.com, eduardo@habkost.net, thuth@redhat.com,
 berrange@redhat.com, peter.maydell@linaro.org, armbru@redhat.com,
 mst@redhat.com, qemu-devel@nongnu.org, zhenyzha@redhat.com, drjones@redhat.com,
 pbonzini@redhat.com, shan.gavin@gmail.com, Jonathan.Cameron@Huawei.com,
 ani@anisinha.ca, imammedo@redhat.com, wangyanan55@huawei.com,
 eblake@redhat.com, f4bug@amsat.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OuuJgBWUVOgq

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
 hw/arm/virt.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 5bdd98e4a1..0fd7f9a6a1 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2560,6 +2560,7 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
     int n;
     unsigned int max_cpus = ms->smp.max_cpus;
     VirtMachineState *vms = VIRT_MACHINE(ms);
+    MachineClass *mc = MACHINE_GET_CLASS(vms);
 
     if (ms->possible_cpus) {
         assert(ms->possible_cpus->len == max_cpus);
@@ -2573,8 +2574,20 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
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
-- 
2.23.0

