Received: by 2002:a17:906:18b1:b0:a2e:1324:ea5c with SMTP id c17csp1392152ejf;
        Wed, 17 Jan 2024 00:05:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGFopeOt4liTuPnV33vtp6OkJ/NIEr7/79FIdpv+BjsrebbdFBAoXQtUuefhPjBcKkZ5qJK
X-Received: by 2002:a05:6808:2e92:b0:3bd:72a1:541c with SMTP id gt18-20020a0568082e9200b003bd72a1541cmr6398981oib.41.1705478726525;
        Wed, 17 Jan 2024 00:05:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705478726; cv=none;
        d=google.com; s=arc-20160816;
        b=QpF9yIFqCsRw0ZDwlLwR5RQaP98YPVrveg7YhFPWiMRGzvxiprk/xy+iXAEVF/hxHG
         GqHA2Y1E3GSCscXgGGvFJ+IQeIRkhXfQSOOfsXHatQEycRGYB7SXS8LW5KLM52WFAWs2
         xzxnx8LSxLCtwu452S9Ks1KymIFvfiNW6KwGid3jaskXClETGMYA966t0QCxe3XNS0rz
         UYf4eCcsIREIkJ3T7sHmLilZSeWGGtAQFzotkLeCigdlm+bdpM7Igemf3GLhe5Wbf1nq
         M2TA+i61sQBh7dsuQlklgIK3VkhGOCbDzpqJh5PG2KEHYLPNm3+6QctP1fc52y7ZmvkX
         EChA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=dmZJv/kbQ1MJHJydCzRe7SLGQcxXzFSj2i/ycuIN4lw=;
        fh=E3c4Lx6w2odu/6SlG6b7ImsRAg1mlDohYwN4BQaBgGo=;
        b=rGfmToimcmX3pfozxl5pvXGAVK49ChgDJ+8HhAaKYe4WzNtXmOKzO+xbdDufSECXCN
         4Sxbxkb+h1tn4wCKX4bUUozYANeZDkiwVh966jSyDNW8TmQao8EqHtK4poAOWM/SUqr0
         A0qq1VC/fSpDxIJEpnuKdJNWkOdfXm+dVb/rEtwzbATH6H/r6D1pV8G7dk0WgyB580Je
         5FAZaztqqHou11mgnnlXp4ZV1zobrPg3D24Dbr5+Ce38hfGzqTKhlcuwscA5znwzUH7P
         lilcoLlXECDyguyUpcMeXydyGSEgvyUTq2aB0d/QOWlfDmZdkl2hrODBunMLFrOJQS7D
         SekQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=A9CwIE4C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 2-20020ac85902000000b004299d40884dsi11211161qty.430.2024.01.17.00.05.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jan 2024 00:05:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=A9CwIE4C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rQ0uo-0002M9-0J; Wed, 17 Jan 2024 03:04:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rQ0ui-0002GE-Ii
 for qemu-arm@nongnu.org; Wed, 17 Jan 2024 03:04:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rQ0ug-00037B-TG
 for qemu-arm@nongnu.org; Wed, 17 Jan 2024 03:04:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1705478682;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dmZJv/kbQ1MJHJydCzRe7SLGQcxXzFSj2i/ycuIN4lw=;
 b=A9CwIE4C9zAuEPCkX593gIIF5TNRSLk1mhCsWVg3hysmhuSEVzUsNe1iDZP48fZbgYNZtU
 6SdmFGsJk+OD4Xel7C2UIW6+n5KG+XLRJdGjsw1jQ3UWJH4qv7R3uTN7K1fr6LbIoKXb8Y
 +eKYo2b4lmAfbLid/zOOMXZxP8miTWU=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-6-11Q8hggUMl60zHM85BdQMA-1; Wed,
 17 Jan 2024 03:04:38 -0500
X-MC-Unique: 11Q8hggUMl60zHM85BdQMA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6B94528AC1E9;
 Wed, 17 Jan 2024 08:04:38 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9E19C1BDB1;
 Wed, 17 Jan 2024 08:04:35 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, jean-philippe@linaro.org, alex.williamson@redhat.com,
 peter.maydell@linaro.org, zhenzhong.duan@intel.com, peterx@redhat.com,
 yanghliu@redhat.com, pbonzini@redhat.com
Cc: mst@redhat.com,
	clg@redhat.com
Subject: [RFC 5/7] virtio-iommu: Remove the implementation of
 iommu_set_iova_ranges
Date: Wed, 17 Jan 2024 09:02:09 +0100
Message-ID: <20240117080414.316890-6-eric.auger@redhat.com>
In-Reply-To: <20240117080414.316890-1-eric.auger@redhat.com>
References: <20240117080414.316890-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.806,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: +FWxkFhI7lAE

Now that we use PCIIOMMUOps to convey information about usable IOVA
ranges we do not to implement the iommu_set_iova_ranges IOMMU MR
callback.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/virtio/virtio-iommu.c | 67 ----------------------------------------
 1 file changed, 67 deletions(-)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 716a3fcfbf..1e2fc86f2f 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -1260,72 +1260,6 @@ static int virtio_iommu_set_page_size_mask(IOMMUMemoryRegion *mr,
 }
 
 
-/**
- * virtio_iommu_set_iova_ranges: Conveys the usable IOVA ranges
- *
- * The function turns those into reserved ranges. Once some
- * reserved ranges have been set, new reserved regions cannot be
- * added outside of the original ones.
- *
- * @mr: IOMMU MR
- * @iova_ranges: list of usable IOVA ranges
- * @errp: error handle
- */
-static int virtio_iommu_set_iova_ranges(IOMMUMemoryRegion *mr,
-                                        GList *iova_ranges,
-                                        Error **errp)
-{
-    IOMMUDevice *sdev = container_of(mr, IOMMUDevice, iommu_mr);
-    GList *current_ranges = sdev->host_resv_ranges;
-    GList *l, *tmp, *new_ranges = NULL;
-    int ret = -EINVAL;
-
-    /* check that each new resv region is included in an existing one */
-    if (sdev->host_resv_ranges) {
-        range_inverse_array(iova_ranges,
-                            &new_ranges,
-                            0, UINT64_MAX);
-
-        for (tmp = new_ranges; tmp; tmp = tmp->next) {
-            Range *newr = (Range *)tmp->data;
-            bool included = false;
-
-            for (l = current_ranges; l; l = l->next) {
-                Range * r = (Range *)l->data;
-
-                if (range_contains_range(r, newr)) {
-                    included = true;
-                    break;
-                }
-            }
-            if (!included) {
-                goto error;
-            }
-        }
-        /* all new reserved ranges are included in existing ones */
-        ret = 0;
-        goto out;
-    }
-
-    if (sdev->probe_done) {
-        warn_report("%s: Notified about new host reserved regions after probe",
-                    mr->parent_obj.name);
-    }
-
-    range_inverse_array(iova_ranges,
-                        &sdev->host_resv_ranges,
-                        0, UINT64_MAX);
-    rebuild_resv_regions(sdev);
-
-    return 0;
-error:
-    error_setg(errp, "IOMMU mr=%s Conflicting host reserved ranges set!",
-               mr->parent_obj.name);
-out:
-    g_list_free_full(new_ranges, g_free);
-    return ret;
-}
-
 static void virtio_iommu_system_reset(void *opaque)
 {
     VirtIOIOMMU *s = opaque;
@@ -1621,7 +1555,6 @@ static void virtio_iommu_memory_region_class_init(ObjectClass *klass,
     imrc->replay = virtio_iommu_replay;
     imrc->notify_flag_changed = virtio_iommu_notify_flag_changed;
     imrc->iommu_set_page_size_mask = virtio_iommu_set_page_size_mask;
-    imrc->iommu_set_iova_ranges = virtio_iommu_set_iova_ranges;
 }
 
 static const TypeInfo virtio_iommu_info = {
-- 
2.41.0

