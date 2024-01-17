Received: by 2002:a17:906:18b1:b0:a2e:1324:ea5c with SMTP id c17csp1392287ejf;
        Wed, 17 Jan 2024 00:05:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFp1odhpmtwJFiTwJVypjMlbHrOj6Htzxla20jKZ4eT5MVkNbDImuIjbZDWbx/H7Xo9KqdP
X-Received: by 2002:a05:620a:44c5:b0:781:b194:3be2 with SMTP id y5-20020a05620a44c500b00781b1943be2mr9583980qkp.109.1705478742201;
        Wed, 17 Jan 2024 00:05:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705478742; cv=none;
        d=google.com; s=arc-20160816;
        b=mdnnue0HLdpaUUC/Oqnyod+z3rvv2maSWwXN1iUTUE9ZJ99vI6ygKCTEGYwHrXjKt0
         Nn51OUd6M1pLxDwRLhXaEIFhX2pPUHWK945zlt9wi/D9eAjp9CFcJdYSzCZsonR80GhS
         oI15/RVqIu+0Xhfs9NDAAcQ3Lr/4rCUPf7kmn75P0+9uFhlLfHJcat3cBuhJNZvWNcoq
         C71vayoXf0zDfXa6Z7g6/KvOSHbi2ltSbrsj1n8MwgCBO7j08CGpi1hZMPVQ3nRSpKu/
         d4VODz/ynE4z7ZbJ+sOLSqk6dTBydkdQgiFQSUYHPKNoaf/Htj5wCKI7wve5KrBulB43
         aRyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=v3geESpC2ThPvLVZQCG2RlkrSjDSoLwWpI8cdplUGWA=;
        fh=E3c4Lx6w2odu/6SlG6b7ImsRAg1mlDohYwN4BQaBgGo=;
        b=y+1yKmUuGVs95tiK2GGGw6pf0K9/H67sXn4wouWYMohVLErF2xEsHUwjvNbl9+gM0R
         SUoy/pxwoRSa1f3v4hKXk6jSY2P+r53r1DljJ5iaY63XqGukCn/CZR6OUOfwDleo9xRU
         2qj5ZW0E7mWq9mxe6W7EVn8my7OVqPAEJo5d5RUSCKOTiBSICfYwrmO2M25kUPKzqoN5
         c/rXr/7+p85Sz1EXh6y0tW/P/A3pzBthp1KjnyLfD5eJLUqrcflCy4VnU3yozVyEZgas
         lShDBFUSKNplMM1BncnGZ1F3QViVskooRexJplDayqJS9Hia1IPg/eJDifELQdCwUJZq
         GdQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LEvc8l+r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k2-20020ae9f102000000b007835c11b0b9si5693828qkg.418.2024.01.17.00.05.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jan 2024 00:05:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LEvc8l+r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rQ0uo-0002MH-Bh; Wed, 17 Jan 2024 03:04:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rQ0uk-0002Gk-FG
 for qemu-arm@nongnu.org; Wed, 17 Jan 2024 03:04:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rQ0ui-00038T-Tm
 for qemu-arm@nongnu.org; Wed, 17 Jan 2024 03:04:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1705478684;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v3geESpC2ThPvLVZQCG2RlkrSjDSoLwWpI8cdplUGWA=;
 b=LEvc8l+r5L5TEflESxdU68Qz67X1jBdmAuwSTTYtfuj2szv24Q9JLzedOWkD5nbUyK+Ccg
 +4XF+7QtCu/DnCTvpVMV5zB/ZztXw2fhjLPRc/NfZMgFwUoZnTpISrOzNxA5TzXJjROOkM
 r4YCsX3Qpq5xTi01DLE9JjmNClm1Jno=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-379-gexDKdI-M7S6uHLMl43Z8A-1; Wed, 17 Jan 2024 03:04:41 -0500
X-MC-Unique: gexDKdI-M7S6uHLMl43Z8A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1833F86EB21;
 Wed, 17 Jan 2024 08:04:41 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B1A6F1BDB0;
 Wed, 17 Jan 2024 08:04:38 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, jean-philippe@linaro.org, alex.williamson@redhat.com,
 peter.maydell@linaro.org, zhenzhong.duan@intel.com, peterx@redhat.com,
 yanghliu@redhat.com, pbonzini@redhat.com
Cc: mst@redhat.com,
	clg@redhat.com
Subject: [RFC 6/7] hw/vfio: Remove memory_region_iommu_set_iova_ranges() call
Date: Wed, 17 Jan 2024 09:02:10 +0100
Message-ID: <20240117080414.316890-7-eric.auger@redhat.com>
In-Reply-To: <20240117080414.316890-1-eric.auger@redhat.com>
References: <20240117080414.316890-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.806,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: BIK4jr2+4b24

As we have just removed the only implementation of
iommu_set_iova_ranges IOMMU MR callback in the virtio-iommu,
let's remove the call to the memory wrapper. Usable IOVA ranges
are now conveyed through the PCIIOMMUOps in VFIO-PCI.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/vfio/common.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 0b3352f2a9..d88602e050 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -636,16 +636,6 @@ static void vfio_listener_region_add(MemoryListener *listener,
             goto fail;
         }
 
-        if (bcontainer->iova_ranges) {
-            ret = memory_region_iommu_set_iova_ranges(giommu->iommu_mr,
-                                                      bcontainer->iova_ranges,
-                                                      &err);
-            if (ret) {
-                g_free(giommu);
-                goto fail;
-            }
-        }
-
         ret = memory_region_register_iommu_notifier(section->mr, &giommu->n,
                                                     &err);
         if (ret) {
-- 
2.41.0

