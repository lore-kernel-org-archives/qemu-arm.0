Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp1175412ejb;
        Mon, 4 Sep 2023 01:06:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdDWPXLmT+idWwdJaF98lksTHaCk/mDtVEDA0ZOiID8/kBcobrUk4x4glR3tK2VNe2Fx30
X-Received: by 2002:a05:622a:1a11:b0:403:9fd0:d43e with SMTP id f17-20020a05622a1a1100b004039fd0d43emr16449791qtb.21.1693814803358;
        Mon, 04 Sep 2023 01:06:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693814803; cv=none;
        d=google.com; s=arc-20160816;
        b=05PVW1Dr8XtY5NB9UjaHWEK2jycdX7V3U0K88DV184kZ/b5QJtgHFadNz8uMwWUVhB
         LLgqcDWog9gtcxE4cJ3Wrk71Zm0O6YASEv0moDdE+Qvw+0CVHWsejMuEUPNl1qV5Nyke
         igpAdLzoFLOVlqkIqIEZByOnJGovv0xVofmOSb2xUEuWkle76r10y4b27d4IRc8o6PJa
         4sfbBJRFr6eiEpjPTYzsms5UyQVFAWv1v0HMIcdYqnkX4TJpE8t9DEP6InDga+q5+Plf
         z4vcioBvXjsYRNokH1LZYBIWxXvoh6CA5YI4ZlSF8RWni5Lb6of8HEJ3nkIzxTbEjDyW
         hTGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=0fClSLFNTnj1PBBeNErEhvIOOlv5XDQmnbvHzzG3f0E=;
        fh=vPp9P9nRoVzg/+h2e3p9KngL/viJb9qzJXYZDzy4B8s=;
        b=StIdLJVxiB4JA2FFXX74Vr4GSlnBmitJjVu81yMiGwRIMex5s3f95qt7+XmHxDhzcy
         JijYsKazo6yQQweOYt5l0xoi4AnZPX8YObIfTgDklSTjxYBeeuGo5w6BnI8FJpAuZml0
         HRu/4NjAqmg80NhsG4FSJUk5LOIi82lZ8PgReAih1xn9hauf3SmKZwV/EX8G21f9AXGW
         APdY27A5Pqyq1SqVWqjjDvNfJyz+MtMths1NaeV2ceDl+hLRymoMP8a66JoJZCZhEEGi
         re+9YCJK7PxFPqD16Fpp3dYCpe+1zZyA4CiLa2hsk6qN5ugulE+roEcbZ+ugf6IvS2O5
         z5rQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UQgBpjXP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d1-20020a05622a100100b0040547dc28d6si5993086qte.93.2023.09.04.01.06.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Sep 2023 01:06:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UQgBpjXP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qd4bQ-00010f-0r; Mon, 04 Sep 2023 04:06:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qd4bA-0000v5-2U
 for qemu-arm@nongnu.org; Mon, 04 Sep 2023 04:06:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qd4b7-0006A9-Eo
 for qemu-arm@nongnu.org; Mon, 04 Sep 2023 04:06:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693814772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0fClSLFNTnj1PBBeNErEhvIOOlv5XDQmnbvHzzG3f0E=;
 b=UQgBpjXPFRF9zAIbIbINQ7HN5CLSYRCXLGvXGV62iw6M0jeUwiYe7sS9/GVpqJH0C6W8Xq
 zD8QPGeQYnXzZ0BeZUP6RlH41uXEgwDnMRXpR2wn/YWnJnvIDAFcvO+wRzQkbYyBNY8zf1
 vbYl+VumzmjpAulGv5fbIu5OH3pTaXE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-295-CBDaXKdjPeGayDcBfJDI3A-1; Mon, 04 Sep 2023 04:05:02 -0400
X-MC-Unique: CBDaXKdjPeGayDcBfJDI3A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 01F0D8015AA;
 Mon,  4 Sep 2023 08:05:02 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A1592400D277;
 Mon,  4 Sep 2023 08:04:59 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, alex.williamson@redhat.com, clg@redhat.com,
 jean-philippe@linaro.org, mst@redhat.com, pbonzini@redhat.com
Cc: peter.maydell@linaro.org, peterx@redhat.com, david@redhat.com,
 philmd@linaro.org
Subject: [PATCH 02/13] memory: Introduce memory_region_iommu_set_iova_ranges
Date: Mon,  4 Sep 2023 10:03:45 +0200
Message-ID: <20230904080451.424731-3-eric.auger@redhat.com>
In-Reply-To: <20230904080451.424731-1-eric.auger@redhat.com>
References: <20230904080451.424731-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: jckmb9QfbXql

This helper will allow to convey information about valid
IOVA ranges to virtual IOMMUS.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 include/exec/memory.h | 26 ++++++++++++++++++++++++++
 softmmu/memory.c      | 15 +++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 184cb3a01b..f6fb99dd3f 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -519,6 +519,27 @@ struct IOMMUMemoryRegionClass {
      int (*iommu_set_page_size_mask)(IOMMUMemoryRegion *iommu,
                                      uint64_t page_size_mask,
                                      Error **errp);
+    /**
+     * @iommu_set_iova_ranges:
+     *
+     * Propagate information about the usable IOVA ranges for a given IOMMU
+     * memory region. Used for example to propagate host physical device
+     * reserved memory region constraints to the virtual IOMMU.
+     *
+     * Optional method: if this method is not provided, then the default IOVA
+     * aperture is used.
+     *
+     * @nr_ranges: number of IOVA ranges
+     *
+     * @iova_ranges: an array of @nr_ranges usable IOVA ranges
+     *
+     * Returns 0 on success, or a negative error. In case of failure, the error
+     * object must be created.
+     */
+     int (*iommu_set_iova_ranges)(IOMMUMemoryRegion *iommu,
+                                  uint32_t nr_ranges,
+                                  struct Range *iova_ranges,
+                                  Error **errp);
 };
 
 typedef struct RamDiscardListener RamDiscardListener;
@@ -1845,6 +1866,11 @@ int memory_region_iommu_set_page_size_mask(IOMMUMemoryRegion *iommu_mr,
                                            uint64_t page_size_mask,
                                            Error **errp);
 
+int memory_region_iommu_set_iova_ranges(IOMMUMemoryRegion *iommu,
+                                        uint32_t nr_ranges,
+                                        struct Range *iova_ranges,
+                                        Error **errp);
+
 /**
  * memory_region_name: get a memory region's name
  *
diff --git a/softmmu/memory.c b/softmmu/memory.c
index 7d9494ce70..07499457aa 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1905,6 +1905,21 @@ int memory_region_iommu_set_page_size_mask(IOMMUMemoryRegion *iommu_mr,
     return ret;
 }
 
+int memory_region_iommu_set_iova_ranges(IOMMUMemoryRegion *iommu_mr,
+                                        uint32_t nr_ranges,
+                                        struct Range *iova_ranges,
+                                        Error **errp)
+{
+    IOMMUMemoryRegionClass *imrc = IOMMU_MEMORY_REGION_GET_CLASS(iommu_mr);
+    int ret = 0;
+
+    if (imrc->iommu_set_iova_ranges) {
+        ret = imrc->iommu_set_iova_ranges(iommu_mr, nr_ranges,
+                                          iova_ranges, errp);
+    }
+    return ret;
+}
+
 int memory_region_register_iommu_notifier(MemoryRegion *mr,
                                           IOMMUNotifier *n, Error **errp)
 {
-- 
2.41.0

