Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2860905wrd;
        Fri, 21 Sep 2018 01:29:55 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdZaNXWuh1TumZ4Bq7ZkNYvDveAyXWd2IfDjdlJ5wozxs2ACG1t/57rebA9wmMS3eug0+fMg
X-Received: by 2002:a37:dc41:: with SMTP id v62-v6mr30331306qki.109.1537518595149;
        Fri, 21 Sep 2018 01:29:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537518595; cv=none;
        d=google.com; s=arc-20160816;
        b=TaVIkPKkiadDj9QgnZcI6q9fjHLkCH6/ZrXSuJecTEurfzoATS4rFpKVcMjlZeiTo+
         +OhmL01SAUrd5oBLK6ERA57wNJqZwO/axkhP/6Itzo9UWMuLAmyT9SM54Lz06p7w9DqQ
         eObz9+BkYdUWX+TuJziuY4NifXsteoLofTKTHqyrx9sYJwP8iPWCWbvQA0aU5QkYeh6z
         m8GWhTOVPCVd9QSrY1FhGAKQPJW1+MSKddKuhImh6Mf6lBjcdyTm8D3Tq3T/2KLCilCo
         kHkxA3UF8Us7boxYM8H782bAJGLgepFJ5HkzWAyN2cQvbev3VBUUkRtXEZmLqxcQP2/6
         eKIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=xlDsMgRuPhsinsQnZea5rOG9YQ2Wr4ubjuIP/8vCgGw=;
        b=L6qshNmgJmude+9/IZbkdjsao5pzyA6JpTtdRadm9bYWzq4grGk42i2JUuqbdPr99l
         DhvHoeGHcem98DpvpZVVm1yus9HU1IESVP718U/UQNdurqgRUcrGMtU7TZL9qGff2CF2
         MVCULiIvvdvFXVmaNAYotRlnYVM007ZzdhN+1JqDa+/exzZq2M5CRBeRtgVtLG0dN/yh
         LijYcmbmqTV5IE4Pbyp8kxkqM5WYXpgL49Hg5EkRdqZAiaUNn16Rtk/j5vN33HaZJ3cX
         JXlo0ZtVUCL4R91QY3KLV76hscIDpPUBEgjrB+U34fQ+RHcHJX4pgjTRzjEmgpPhnUWv
         lp2A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 51-v6si3188428qvq.273.2018.09.21.01.29.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 21 Sep 2018 01:29:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54414 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g3Gp0-0005Y6-Jz
	for alex.bennee@linaro.org; Fri, 21 Sep 2018 04:29:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48033)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1g3Gg4-00055L-1j
	for qemu-devel@nongnu.org; Fri, 21 Sep 2018 04:20:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1g3Gg1-0005On-7p
	for qemu-devel@nongnu.org; Fri, 21 Sep 2018 04:20:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38346)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1g3Gft-00055N-E7; Fri, 21 Sep 2018 04:20:29 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EFAB3C04AC51;
	Fri, 21 Sep 2018 08:20:27 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-87.ams2.redhat.com [10.36.117.87])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 397CF7D665;
	Fri, 21 Sep 2018 08:20:12 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Fri, 21 Sep 2018 10:18:05 +0200
Message-Id: <20180921081819.9203-15-eric.auger@redhat.com>
In-Reply-To: <20180921081819.9203-1-eric.auger@redhat.com>
References: <20180921081819.9203-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Fri, 21 Sep 2018 08:20:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v2 14/28] hw/arm/smmuv3: Implement dummy replay
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: yi.l.liu@intel.com, cdall@kernel.org, mst@redhat.com,
	jean-philippe.brucker@arm.com, peterx@redhat.com,
	alex.williamson@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JeyY+oHCPyrw

The default implementation of memory_region_iommu_replay() shall
not be used as it forces the translation of the whole RAM range.
The purpose of this function is to update the shadow page tables.
However in case of nested stage, there is no shadow page table so
we can simply return.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/smmuv3.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index afe1758830..d609038724 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1516,6 +1516,11 @@ static int smmuv3_get_attr(IOMMUMemoryRegion *iommu,
     return -EINVAL;
 }
 
+static inline void
+smmuv3_replay(IOMMUMemoryRegion *iommu_mr, IOMMUNotifier *n)
+{
+}
+
 static void smmuv3_iommu_memory_region_class_init(ObjectClass *klass,
                                                   void *data)
 {
@@ -1524,6 +1529,7 @@ static void smmuv3_iommu_memory_region_class_init(ObjectClass *klass,
     imrc->translate = smmuv3_translate;
     imrc->notify_flag_changed = smmuv3_notify_flag_changed;
     imrc->get_attr = smmuv3_get_attr;
+    imrc->replay = smmuv3_replay;
 }
 
 static const TypeInfo smmuv3_type_info = {
-- 
2.17.1

