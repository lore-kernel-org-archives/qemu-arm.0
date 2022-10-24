Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp3010910ejn;
        Sun, 23 Oct 2022 21:38:35 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4We4yfOBKBkws20+pJcF5muxNWNtRzAdbfzXnZktbnbxgPIRfy7wuomiT9bVqG/0aIkwcd
X-Received: by 2002:a05:6214:238e:b0:4b4:3392:ced6 with SMTP id fw14-20020a056214238e00b004b43392ced6mr25398844qvb.38.1666586304997;
        Sun, 23 Oct 2022 21:38:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666586304; cv=none;
        d=google.com; s=arc-20160816;
        b=d3ViLbKSrRcsDYuuyHP65CbJRctxIptKGiXSm8lzdpjFRpPNG+/ZJRQ8J3/T8hnt+v
         sFOD9yYKPPSdao+kU4ec+tUCfZ7dDOwx/mbdGZpWjUBc2CeJX/t81Mqu8MLblQsWGczU
         aBqm+J60WKLJS+6gdd/c+U+w20bO3cDGrf+SxIrmH299mNQTNDQcgJHoWCKvyy2SZ89u
         FGvzuPjgEloCgKt4IT6AHcqJ2GzGmWp//phge/ZAoKkoUPRfhpMLxiHeZzQyKi2WzVz0
         UaL7/M2bQAScQkQ8Fg0GAx/k1R5S7FsVyLGFa+Tj1J1wVMwIZYkNTEGKyQtDh46cpizi
         qquQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=nsP5JqLfu1xybUwbVvOVW7lKrpO9ImVl/g/gvH5NRmY=;
        b=VkrfVYBqrRG11efi+kasxloolZgk8sZfCGHc20TP5eaevX16NgQFTW/SMJehAjQ2Fc
         OARvOQ3M93LQzi1dIclEBwsblxjOJlppM30tMjIUPNo7mM0V2h8wxoWuxVzvEpY9H43V
         28dMKcrhHGjQ9YWQOz+PfqkdSfgVvfgksQGtaKZxQPYQpY4jCjPkKP5hZ/+L3lTC4n6j
         KNcnlNwe3kvwh3IZpM3RVEJYCJblcoECCxOj6zb73oZVTXvyvNSr7IxlV7MvBFj3ed4t
         8yZfs+4IRt32jNf0TjYWCTdk044Yz6wrbOgXUjmfsPy06LOJbRlgHHjS5DJq47q8sm1I
         trxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="FKb/wEx5";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 1-20020ad45b81000000b004b400eaa7f1si17670740qvp.1.2022.10.23.21.38.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Oct 2022 21:38:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="FKb/wEx5";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1omoYB-0000A4-Dc; Sun, 23 Oct 2022 23:54:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1omoY9-00005W-AS
 for qemu-arm@nongnu.org; Sun, 23 Oct 2022 23:54:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1omoY7-0000ka-OW
 for qemu-arm@nongnu.org; Sun, 23 Oct 2022 23:54:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666583691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nsP5JqLfu1xybUwbVvOVW7lKrpO9ImVl/g/gvH5NRmY=;
 b=FKb/wEx5ySyW/LoNdo1vM/ds9Y5havEq0FFrq6Cjg9zYC1jpeebi9I+zcOJYLbKdsMMhPi
 wJn8Fss82jJ3LDUUIPDaTrNr9m1aZrIjnQN2Jj+MR1ScAQm72Zwe7uAqToYn9XYNb062Uw
 xWfwnYAwawIM9vBKy5H4WWYXc9NuYrI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-439-bxTAAC7SMPey4eoqgm2uzw-1; Sun, 23 Oct 2022 23:54:46 -0400
X-MC-Unique: bxTAAC7SMPey4eoqgm2uzw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B20A0855438;
 Mon, 24 Oct 2022 03:54:45 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-29.bne.redhat.com [10.64.54.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C971E40C6F9F;
 Mon, 24 Oct 2022 03:54:42 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, eric.auger@redhat.com,
 cohuck@redhat.com, zhenyzha@redhat.com, richard.henderson@linaro.org,
 peter.maydell@linaro.org, shan.gavin@gmail.com
Subject: [PATCH v6 5/7] hw/arm/virt: Improve high memory region address
 assignment
Date: Mon, 24 Oct 2022 11:54:14 +0800
Message-Id: <20221024035416.34068-6-gshan@redhat.com>
In-Reply-To: <20221024035416.34068-1-gshan@redhat.com>
References: <20221024035416.34068-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.517,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: mM28Mg9K8+xF

There are three high memory regions, which are VIRT_HIGH_REDIST2,
VIRT_HIGH_PCIE_ECAM and VIRT_HIGH_PCIE_MMIO. Their base addresses
are floating on highest RAM address. However, they can be disabled
in several cases.

(1) One specific high memory region is likely to be disabled by
    code by toggling vms->highmem_{redists, ecam, mmio}.

(2) VIRT_HIGH_PCIE_ECAM region is disabled on machine, which is
    'virt-2.12' or ealier than it.

(3) VIRT_HIGH_PCIE_ECAM region is disabled when firmware is loaded
    on 32-bits system.

(4) One specific high memory region is disabled when it breaks the
    PA space limit.

The current implementation of virt_set_{memmap, high_memmap}() isn't
optimized because the high memory region's PA space is always reserved,
regardless of whatever the actual state in the corresponding
vms->highmem_{redists, ecam, mmio} flag. In the code, 'base' and
'vms->highest_gpa' are always increased for case (1), (2) and (3).
It's unnecessary since the assigned PA space for the disabled high
memory region won't be used afterwards.

Improve the address assignment for those three high memory region by
skipping the address assignment for one specific high memory region if
it has been disabled in case (1), (2) and (3). The memory layout may
be changed after the improvement is applied, which leads to potential
migration breakage. So 'vms->highmem_compact' is added to control if
the improvement should be applied. For now, 'vms->highmem_compact' is
set to false, meaning that we don't have memory layout change until it
becomes configurable through property 'compact-highmem' in next patch.

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Tested-by: Zhenyu Zhang <zhenyzha@redhat.com>
---
 hw/arm/virt.c         | 15 ++++++++++-----
 include/hw/arm/virt.h |  1 +
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index ee98a8a3b6..4896f600b4 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1721,18 +1721,23 @@ static void virt_set_high_memmap(VirtMachineState *vms,
         vms->memmap[i].size = region_size;
 
         /*
-         * Check each device to see if they fit in the PA space,
-         * moving highest_gpa as we go.
+         * Check each device to see if it fits in the PA space,
+         * moving highest_gpa as we go. For compatibility, move
+         * highest_gpa for disabled fitting devices as well, if
+         * the compact layout has been disabled.
          *
          * For each device that doesn't fit, disable it.
          */
         fits = (region_base + region_size) <= BIT_ULL(pa_bits);
-        if (fits) {
-            vms->highest_gpa = region_base + region_size - 1;
+        *region_enabled &= fits;
+        if (vms->highmem_compact && !*region_enabled) {
+            continue;
         }
 
-        *region_enabled &= fits;
         base = region_base + region_size;
+        if (fits) {
+            vms->highest_gpa = region_base + region_size - 1;
+        }
     }
 }
 
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 6ec479ca2b..709f623741 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -144,6 +144,7 @@ struct VirtMachineState {
     PFlashCFI01 *flash[2];
     bool secure;
     bool highmem;
+    bool highmem_compact;
     bool highmem_ecam;
     bool highmem_mmio;
     bool highmem_redists;
-- 
2.23.0

