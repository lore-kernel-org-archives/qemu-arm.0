Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp248906lfg;
        Thu, 25 Feb 2021 03:08:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyVU7nf/y3jma5YLJAvoNx0pKIF+U3+c4MpCozR47nmXpydCYexOmvugg/qtYV4QCMzb847
X-Received: by 2002:a05:6602:2287:: with SMTP id d7mr2203793iod.42.1614251331668;
        Thu, 25 Feb 2021 03:08:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614251331; cv=none;
        d=google.com; s=arc-20160816;
        b=Wx1D9/aYgop3+Li9aTOaxVw7Y9fkK5ZLKTkzdeG5luJOtotX8r7W0kjfqwXSqrLJQM
         jZ8ewB3oCMoGDlHD4I3xWq5SDqNPaKrSWPk5tmEB4OfavOnPnn/7RR0WTnI4Dj2yXKDg
         q+Tze8rVR1silvQdmT90wfzIAQtrYvYNpj4ZvJDgoaETyDWSJNR7BLiSLT5K9Hu3Ajwl
         r5OrBVN6/xGkWrz3aYOZpr3TqOM98MwzmtBlvshEn1qcwTXf1WCv72rvC0jRGHBRRcVw
         0E0qj173OfxA/RP8MxWOR2BhQPlUigihobIg+K8TA5rS04V1ChEnJVioHs9eMq7crE/k
         8fsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=bywwfZowjmPR810yseCg0HtdO6oVwqcPsCFDNHc8k7w=;
        b=oYQSQUDieIMTwrhUyc+NuzUhRsUEGPKoO1skVR8hw9XAxgHDZ88o8cobGwG1SbM+0L
         eyqb1cgt2UQOC8xPAyPcRQezt2QfHDCQT4A/5IDSRkD0n21F5KeQot2VEzl+R7TOHwrZ
         gRj2YwRz+suwwRjBMPQkRH/Raf7Dj0GNBwtRTprzXQ7+87WmC5k8hMcstLhouI3rfriQ
         FFUMVBWQy3fUMFcmlrsgURybxKAC7VmPD5es4B9YwIyKXbuf00nMbSOqBYaHTTboLeX4
         MLfHptZIJq/MSogOTaMqcJ4PyWukIIxgCF9RVJpS+sORZ+AgOTP1Lu/iT8/7jd3C3zj+
         j79A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=FmMtZSgA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z90si4194736jah.109.2021.02.25.03.08.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Feb 2021 03:08:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=FmMtZSgA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lFEVm-0003Gf-UJ
	for alex.bennee@linaro.org; Thu, 25 Feb 2021 06:08:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lFEHl-0006er-GR
 for qemu-arm@nongnu.org; Thu, 25 Feb 2021 05:54:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lFEHj-0005Fn-SY
 for qemu-arm@nongnu.org; Thu, 25 Feb 2021 05:54:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614250459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bywwfZowjmPR810yseCg0HtdO6oVwqcPsCFDNHc8k7w=;
 b=FmMtZSgAa4NnM3ImZM7JVrX0KQJNNR21/1pNxhrodTQ6ewJZPRkwjb39kQxTMZ3BwyKL8E
 Fpls9ieAFGo1cyoxETglMgpQ5a36l1d6OTSLh8Y9oGW8Z8IwHSvienQvwqF5eLl6E3oQft
 Pm1Q7CwuNGiYClNdYLAUwrmhPXnf3pY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-540-IC_hA1jMOXGwAgZpJmeR1A-1; Thu, 25 Feb 2021 05:54:17 -0500
X-MC-Unique: IC_hA1jMOXGwAgZpJmeR1A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 371EBC298;
 Thu, 25 Feb 2021 10:54:15 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-150.ams2.redhat.com [10.36.112.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 09F8C5D9D7;
 Thu, 25 Feb 2021 10:54:09 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 alex.williamson@redhat.com, jacob.jun.pan@linux.intel.com,
 yi.l.liu@intel.com
Subject: [RFC v8 07/28] memory: Add IOMMU_ATTR_MSI_TRANSLATE IOMMU memory
 region attribute
Date: Thu, 25 Feb 2021 11:52:12 +0100
Message-Id: <20210225105233.650545-8-eric.auger@redhat.com>
In-Reply-To: <20210225105233.650545-1-eric.auger@redhat.com>
References: <20210225105233.650545-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eric.auger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: jean-philippe@linaro.org, tnowicki@marvell.com, maz@kernel.org,
 jiangkunkun@huawei.com, zhangfei.gao@foxmail.com, peterx@redhat.com,
 shameerali.kolothum.thodi@huawei.com, yuzenghui@huawei.com,
 zhangfei.gao@linaro.org, will@kernel.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: D4TbbixKE5Lz

We introduce a new IOMMU Memory Region attribute, IOMMU_ATTR_MSI_TRANSLATE
which tells whether the virtual IOMMU translates MSIs. ARM SMMU
will expose this attribute since, as opposed to Intel DMAR, MSIs
are translated as any other DMA requests.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 include/exec/memory.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 04c75f13c2..ad6c807262 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -275,6 +275,7 @@ typedef struct MemoryRegionClass {
 enum IOMMUMemoryRegionAttr {
     IOMMU_ATTR_SPAPR_TCE_FD,
     IOMMU_ATTR_VFIO_NESTED,
+    IOMMU_ATTR_MSI_TRANSLATE,
 };
 
 /*
-- 
2.26.2

