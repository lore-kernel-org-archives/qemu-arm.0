Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp1176504ejb;
        Mon, 4 Sep 2023 01:09:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8rVYouG+4eRLXykn8buZ2d4CU62daskIhKzEuZV0xlVoAkzYnZuJL7dCWPhl6cZiawqrR
X-Received: by 2002:a0c:dc92:0:b0:62d:eda3:4335 with SMTP id n18-20020a0cdc92000000b0062deda34335mr7839318qvk.29.1693814946994;
        Mon, 04 Sep 2023 01:09:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693814946; cv=none;
        d=google.com; s=arc-20160816;
        b=QL2e9VE895FFI1xUKtrUITmmrrzBQliFljFH37RASZZfiE4UwJTfdIKDJ49y0RscX5
         0Mg4y7pOx0XW39m/1NGh5NcQMSaPxIcNcWXatZ774DLxn0G75NSzo73ZetH4rG5hyJpd
         lyfRThQePWbpzM38KYMM4hnZAFsdACRUBms5UWv+F0e4YHeFh8MR0FE6/IyKhW7mTyhV
         gykYmaF+/Rw2ejmwt3k02zxcwiMNKJ3xES8acvIi+bVAY02agf+373Pm6xPz/ZA7Miy2
         +QP0is5PtOkyaZr9MiLzb3TYTmut1y7PnRDyYWAoUmE3w6yBBK8idZ44Ym5PWpeGBzak
         rq0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=9XjeJbiDNaXUaAllo9WuRHroYJyNuZaKG8WZqJbDNBw=;
        fh=vPp9P9nRoVzg/+h2e3p9KngL/viJb9qzJXYZDzy4B8s=;
        b=dtWQMBFczsvzIiLEuKv/1aoy260tdk0jY+A46Osm6aC89HDxoy1Rm/K7ZUIoYpjyOP
         N1E9n0PPhpUll8iC9kvjd/28sXOHLvD5z/sJOWI0prPqu+wc1DmI24YeP8Rj60Ds3VOU
         GmuGt3tvFjlydUShgCMIAxmtbObT+Uyf1RIocH+HGYqNuoFbaw/3C2F4Nsyyqv6JT8U2
         r0EafZgFPJ5rKniS0Ww5hJYnRmvuZFtLxzVkM2n3bgElrabG/IBlzq4xnaADRu9WKfz+
         MiH/XXd4jPF+vvUjnGwlUfy1zqpXOmUTu/q7O/3G/aKC1xgCbcsCzTspPlh/lRXnwGKC
         gZ7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="D/LyQ6vT";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w25-20020a0ca819000000b0064737c4bc5csi6105549qva.42.2023.09.04.01.09.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Sep 2023 01:09:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="D/LyQ6vT";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qd4c1-0002CP-1q; Mon, 04 Sep 2023 04:07:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qd4by-00022w-7d
 for qemu-devel@nongnu.org; Mon, 04 Sep 2023 04:07:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qd4bt-0006Wz-UP
 for qemu-devel@nongnu.org; Mon, 04 Sep 2023 04:07:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693814821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9XjeJbiDNaXUaAllo9WuRHroYJyNuZaKG8WZqJbDNBw=;
 b=D/LyQ6vT0QnOwh9zaHv9dSsaN+nx4f6TYr5ZuIvz/e/ccBEgNqw6FrkFtjSscCsSe/jhpp
 2o5XQrKzCNxZkNMniyqc22goxLlSmt5rmY7BVJhL0uUxemIMxFdj3UqJzCwkTt6TV/6+LG
 PgT44p17pjPGnjitD04PEie5rNhSmjw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-501-744gbhUMPsG4Gi2DiD6G9w-1; Mon, 04 Sep 2023 04:05:33 -0400
X-MC-Unique: 744gbhUMPsG4Gi2DiD6G9w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CE6D9925FC9;
 Mon,  4 Sep 2023 08:05:32 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C3F6340D2962;
 Mon,  4 Sep 2023 08:05:29 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, alex.williamson@redhat.com, clg@redhat.com,
 jean-philippe@linaro.org, mst@redhat.com, pbonzini@redhat.com
Cc: peter.maydell@linaro.org, peterx@redhat.com, david@redhat.com,
 philmd@linaro.org
Subject: [PATCH 12/13] virtio-iommu: Resize memory region according to the max
 iova info
Date: Mon,  4 Sep 2023 10:03:55 +0200
Message-ID: <20230904080451.424731-13-eric.auger@redhat.com>
In-Reply-To: <20230904080451.424731-1-eric.auger@redhat.com>
References: <20230904080451.424731-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: BtK4dB7Fl+Ce

By default the virtio-iommu MR has a 64b span. As we intend to
remove the VFIO assumption of 64b IOVA, let's make sure the MR
is resized according to the actual GAW of the physical IOMMU.
Otherwise we will get a failure on vfio vfio_find_hostwin().

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/virtio/virtio-iommu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index d260235078..d877119df1 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -1180,8 +1180,14 @@ static int virtio_iommu_set_iova_ranges(IOMMUMemoryRegion *mr,
                                         Error **errp)
 {
     IOMMUDevice *sdev = container_of(mr, IOMMUDevice, iommu_mr);
+    uint64_t max_iova;
+
     assert(nr_ranges);
 
+    max_iova = range_upb(&iova_ranges[nr_ranges - 1]);
+    if (max_iova < UINT64_MAX) {
+        memory_region_set_size(&mr->parent_obj, max_iova + 1);
+    }
 
     range_inverse_array(nr_ranges, iova_ranges,
                         &sdev->nr_host_resv_regions, &sdev->host_resv_regions);
-- 
2.41.0

