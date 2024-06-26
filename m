Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp879917njc;
        Wed, 26 Jun 2024 01:28:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXuHwHsVszYbkPbZ57lmAm+HZRncMODVVsEA9LUkfyG0xxOKG+IX3HUmbuqlejb9N6P3lXKMkos2djwfQfcA2VykNYnH8eH
X-Google-Smtp-Source: AGHT+IGf6CNJVsoJWG+W93BDQ0sj4oEvgT/yv67PQUj24SUg5MSr4SDFemTV7brjv/lQJI973myo
X-Received: by 2002:a05:622a:54d:b0:444:fed8:a815 with SMTP id d75a77b69052e-444fed8a9bbmr39503491cf.16.1719390524962;
        Wed, 26 Jun 2024 01:28:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719390524; cv=none;
        d=google.com; s=arc-20160816;
        b=qKtIVxoeTdRwfHS+kXiwPXh0M+kl3aq/04LuRR5QHy/gKZaEJ18FePE+lCjlGhrKst
         amlXj3HWLKNk+nVED0ZDYS0pjtvM0gWsqhvXt1sqJeNGCDS1NU2iZqrPwgHYA9pmkMU0
         nD3usnY1LnHUB+tvezmlurGY8AK6B5ptV+Qd03fNacP+iG6X4muFesYjUqaU+qnd1/Rs
         I/vjvNNIzI+QUucrtf016n6yK20lYmZWbLMJUYdrMGMJ6MnkybKLCgYcVVrF970Y3yJA
         OYVHSpMewajFajuDX5x2Vo6kHo0JCpsaLQg3Ny+42xW17x/VW7BOzjbwtGwLH4ps0F22
         wDmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=I0KLPOuTDMTxkK4QreGWaRVWTuh4m0WBW5E4iSJbcTU=;
        fh=7BmF12x8JIX7i2ysPViD3oS3tFYG9mZ+u60lEXguOKc=;
        b=b7vPF+/U4uoYeJIgPeCf6oElrC0Le0bAcv7WvF817FHXGqy8UL8zwPpnalmxss5U26
         Uv4/T7ehZtyz+yXgbmZN8KLXAUtZmwsju2tryZ2iSkqsI0Ue4i7sF6B4BnDrWRrBdR4v
         D8tOObrvKLRvjYKf5E/Wcet8hYWTvjvBoQJE7HD+jCOBz+QYlVPBq6SqqzevBAAl0Thj
         KBD/LDdTQAVeA5BGXFmYz90Ur2hNbSa/XYO9LyIeWvqY+ssKMfMf0FOfLhwcpwd0CX7P
         /4iyW1XgvPx8wLQ4oHRPLjgNzalSV0WTaovVwIJb9AWODRm3pFig0889f4Gzi2v4kEAJ
         C1YQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dBJgcSjJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-444c2ca10absi135856791cf.731.2024.06.26.01.28.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Jun 2024 01:28:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dBJgcSjJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sMO0l-0007Q4-Vs; Wed, 26 Jun 2024 04:28:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sMO0i-0007Lk-16
 for qemu-arm@nongnu.org; Wed, 26 Jun 2024 04:28:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sMO0g-0007Cf-BB
 for qemu-arm@nongnu.org; Wed, 26 Jun 2024 04:28:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719390489;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I0KLPOuTDMTxkK4QreGWaRVWTuh4m0WBW5E4iSJbcTU=;
 b=dBJgcSjJLQL4vQUoCP3DAfSyKBKN7sS5t8MpMNvoSwLy6HgvV5iaaszpV0WokzxoEomf/O
 rw3ueCBcbgvqKV4lO+7jsJUWoT2b9GfIMAnoyx/lmPEWvb7Flz9PHbqcN/wtPUuC/nJLZG
 xivQxU5cUB1SnvU9OI9nFpfZSFW8RMA=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-339-pU6ox6fWPqeSXoePb38__w-1; Wed,
 26 Jun 2024 04:28:06 -0400
X-MC-Unique: pU6ox6fWPqeSXoePb38__w-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 2481919560AD; Wed, 26 Jun 2024 08:28:03 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.193.191])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id B47441956087; Wed, 26 Jun 2024 08:27:59 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com, jean-philippe@linaro.org,
 peter.maydell@linaro.org, clg@redhat.com, yanghliu@redhat.com,
 zhenzhong.duan@intel.com, alex.williamson@redhat.com
Subject: [PATCH 5/7] virtio-iommu : Retrieve page size mask on
 virtio_iommu_set_iommu_device()
Date: Wed, 26 Jun 2024 10:26:50 +0200
Message-ID: <20240626082727.1278530-6-eric.auger@redhat.com>
In-Reply-To: <20240626082727.1278530-1-eric.auger@redhat.com>
References: <20240626082727.1278530-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.151,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: Sr848hCT178v

Retrieve the Host IOMMU Device page size mask when this latter is set.
This allows to get the information much sooner than when relying on
IOMMU MR set_page_size_mask() call, whcih happens when the IOMMU MR
gets enabled. We introduce check_page_size_mask() helper whose code
is inherited from current virtio_iommu_set_page_size_mask()
implementation. This callback will be removed in a subsequent patch.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/virtio/virtio-iommu.c | 55 ++++++++++++++++++++++++++++++++++++++--
 hw/virtio/trace-events   |  1 +
 2 files changed, 54 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index b8f75d2b1a..631589735a 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -598,9 +598,39 @@ out:
     return ret;
 }
 
+static bool check_page_size_mask(VirtIOIOMMU *viommu, uint64_t new_mask,
+                                 Error **errp)
+{
+    uint64_t cur_mask = viommu->config.page_size_mask;
+
+    if ((cur_mask & new_mask) == 0) {
+        error_setg(errp, "virtio-iommu reports a page size mask 0x%"PRIx64
+                   " incompatible with currently supported mask 0x%"PRIx64,
+                   new_mask, cur_mask);
+        return false;
+    }
+    /*
+     * Once the granule is frozen we can't change the mask anymore. If by
+     * chance the hotplugged device supports the same granule, we can still
+     * accept it.
+     */
+    if (viommu->granule_frozen) {
+        int cur_granule = ctz64(cur_mask);
+
+        if (!(BIT_ULL(cur_granule) & new_mask)) {
+            error_setg(errp,
+                       "virtio-iommu does not support frozen granule 0x%llx",
+                       BIT_ULL(cur_granule));
+            return false;
+        }
+    }
+    return true;
+}
+
 static bool virtio_iommu_set_iommu_device(PCIBus *bus, void *opaque, int devfn,
                                           HostIOMMUDevice *hiod, Error **errp)
 {
+    ERRP_GUARD();
     VirtIOIOMMU *viommu = opaque;
     HostIOMMUDeviceClass *hiodc = HOST_IOMMU_DEVICE_GET_CLASS(hiod);
     struct hiod_key *new_key;
@@ -623,8 +653,26 @@ static bool virtio_iommu_set_iommu_device(PCIBus *bus, void *opaque, int devfn,
                                                 hiod->aliased_devfn,
                                                 host_iova_ranges, errp);
         if (ret) {
-            g_list_free_full(host_iova_ranges, g_free);
-            return false;
+            goto error;
+        }
+    }
+    if (hiodc->get_page_size_mask) {
+        uint64_t new_mask = hiodc->get_page_size_mask(hiod);
+
+        if (check_page_size_mask(viommu, new_mask, errp)) {
+            /*
+             * The default mask depends on the "granule" property. For example,
+             * with 4k granule, it is -(4 * KiB). When an assigned device has
+             * page size restrictions due to the hardware IOMMU configuration,
+             * apply this restriction to the mask.
+             */
+            trace_virtio_iommu_update_page_size_mask(hiod->name,
+                                                     viommu->config.page_size_mask,
+                                                     new_mask);
+            viommu->config.page_size_mask &= new_mask;
+        } else {
+            error_prepend(errp, "%s: ", hiod->name);
+            goto error;
         }
     }
 
@@ -637,6 +685,9 @@ static bool virtio_iommu_set_iommu_device(PCIBus *bus, void *opaque, int devfn,
     g_list_free_full(host_iova_ranges, g_free);
 
     return true;
+error:
+    g_list_free_full(host_iova_ranges, g_free);
+    return false;
 }
 
 static void
diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index 3cf84e04a7..599d855ff6 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -132,6 +132,7 @@ virtio_iommu_notify_map(const char *name, uint64_t virt_start, uint64_t virt_end
 virtio_iommu_notify_unmap(const char *name, uint64_t virt_start, uint64_t virt_end) "mr=%s virt_start=0x%"PRIx64" virt_end=0x%"PRIx64
 virtio_iommu_remap(const char *name, uint64_t virt_start, uint64_t virt_end, uint64_t phys_start) "mr=%s virt_start=0x%"PRIx64" virt_end=0x%"PRIx64" phys_start=0x%"PRIx64
 virtio_iommu_set_page_size_mask(const char *name, uint64_t old, uint64_t new) "mr=%s old_mask=0x%"PRIx64" new_mask=0x%"PRIx64
+virtio_iommu_update_page_size_mask(const char *name, uint64_t old, uint64_t new) "host iommu device=%s old_mask=0x%"PRIx64" new_mask=0x%"PRIx64
 virtio_iommu_notify_flag_add(const char *name) "add notifier to mr %s"
 virtio_iommu_notify_flag_del(const char *name) "del notifier from mr %s"
 virtio_iommu_switch_address_space(uint8_t bus, uint8_t slot, uint8_t fn, bool on) "Device %02x:%02x.%x switching address space (iommu enabled=%d)"
-- 
2.41.0

