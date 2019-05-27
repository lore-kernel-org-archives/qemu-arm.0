Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp6308856wrg;
        Mon, 27 May 2019 04:44:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqww+s91QnrkK1oovdIhDKODBVenH+3ejfRVBRF/iMfKTWZClN5pZCEGvVqcB3RKU8iDZ6LT
X-Received: by 2002:ac8:2817:: with SMTP id 23mr59619036qtq.174.1558957476855;
        Mon, 27 May 2019 04:44:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558957476; cv=none;
        d=google.com; s=arc-20160816;
        b=lR8ZLe3L8xSj33SrwGEENk7uQLcpXE7xnj5aswnH3ELsZ8s5b5jiW1vIYG+yo4wyle
         Ak0KN+7uoCMssMyJfUF31+FfUrBMfzwRbIgFtSFXTpvfXLFG5IsAYukVLN8Kqg+xpMeD
         MYtfj1rRttAyqUXVk/z57amvdZoXG9O2x3d+fcaF3relGSKE1cypRVEmotaYccBJJx0P
         afeJeKUOZet3ILAt7ifPxhf8Afiy2imPhxOX2jDwJeNUUfemwjWILswWwfRqHw3h1DBd
         OSHo43Lb90R23PPP1WMWXx36p4LUuSqeQXLTegr00lznoBjTPFfIeu42+pk4XKIcbIyJ
         lDFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=HiqzOLjxBkWzhKo8tY9kaH3h15mXdTvSt1LxpnoBumI=;
        b=poXapqWK7L6Osam3S+G6lAHLZH9TEDgMM7RFIvveCenNW9oJlvy28eaj6J5OZF3751
         kuGNc9lQfrxnZF4wb2NqeQLkrdIsKpUobaQUkOwfFHyq2roAVeyeUwd7KtfrEd8R6kYD
         MYftsXJ+/ZU9xAMeBaFiok1wsk37Q4iun9rKnRmJ6y7zgk+FaK7XldVdw7Jf/d9IUU1J
         wxgbiytQ1/XeYtu9pjIMgAgB6iLqCUPurQIsp2RBpYaPaa/MG9L7MpJmuoZX1qkid1dv
         DVDJd4hddhE1wXuOCjW49vPbn14SLDjvNJ+exzUEmzUozQkHe6+9r4dI50XXsHPQnlWf
         ok6A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a77si5231165qkb.119.2019.05.27.04.44.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 27 May 2019 04:44:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:44013 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hVE3Q-00049W-6A
	for alex.bennee@linaro.org; Mon, 27 May 2019 07:44:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37852)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hVE24-0003Ft-ID
	for qemu-arm@nongnu.org; Mon, 27 May 2019 07:43:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hVE23-0003TI-PD
	for qemu-arm@nongnu.org; Mon, 27 May 2019 07:43:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47666)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1hVE23-0003Su-Ko; Mon, 27 May 2019 07:43:11 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DDD4B3087939;
	Mon, 27 May 2019 11:43:10 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-67.ams2.redhat.com [10.36.116.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BECD85D962;
	Mon, 27 May 2019 11:43:06 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Mon, 27 May 2019 13:41:42 +0200
Message-Id: <20190527114203.2762-7-eric.auger@redhat.com>
In-Reply-To: <20190527114203.2762-1-eric.auger@redhat.com>
References: <20190527114203.2762-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Mon, 27 May 2019 11:43:11 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v4 06/27] memory: add IOMMU_ATTR_MSI_TRANSLATE
 IOMMU memory region attribute
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: drjones@redhat.com, yi.l.liu@intel.com, mst@redhat.com,
	jean-philippe.brucker@arm.com, zhangfei.gao@foxmail.com,
	peterx@redhat.com, alex.williamson@redhat.com, vincent.stehle@arm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: w5VhppsaH6UY

We introduce a new IOMMU Memory Region attribute, IOMMU_ATTR_MSI_TRANSLAT=
E
which tells whether the virtual IOMMU translates MSIs. ARM SMMU
will expose this attribute since, as opposed to Intel DMAR, MSIs
are translated as any other DMA requests.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 include/exec/memory.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 352a00169f..146a6096da 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -206,6 +206,7 @@ struct MemoryRegionOps {
 enum IOMMUMemoryRegionAttr {
     IOMMU_ATTR_SPAPR_TCE_FD,
     IOMMU_ATTR_VFIO_NESTED,
+    IOMMU_ATTR_MSI_TRANSLATE,
 };
=20
 /**
--=20
2.20.1

