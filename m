Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp365341wrx;
        Fri, 12 Apr 2019 03:09:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx5CIi6C7+id0rgiRQm7UY+irRZppMjNJAifI48vqwxp/Nb7t/aaPmJk0DleHKJqQSu2ukC
X-Received: by 2002:adf:e78e:: with SMTP id n14mr12285792wrm.14.1555063794746;
        Fri, 12 Apr 2019 03:09:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555063794; cv=none;
        d=google.com; s=arc-20160816;
        b=GrtJy6jR+6A8lBpMYCQLaFsECCAqHdnk9rrUHne15JLUaz7g5B2dzkT3r2UDPzsolG
         lMPn1N0EvKkpk6Rxuvpq1FNjZpsvJiJ+xqU2V8jhs8xKvH59InZ7RNJ1kpk2KjzsAHYQ
         W+cHMnhxbGP/QoIC/jz3elhC7byj46ennvYtWjejD3WWpiqrTxgNqqRUV6YUE9hwupm8
         JpUFJAa9YpGcPUq9JhZmWe3HEYP4nF1USsWoaXwMUcYN7d++xrmwMnHxMWeU0k9x/C5G
         AvovBKaa3pFJ8sQmBSoAG4hdERJPqafgDpdWZGt4PqyOhc2RAyJOWeQZ6MP3e8zASc0P
         /06g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=LcDFQyCX9q7z5YRXfvEmazDjfCLJscRdEHEmUikMUmE=;
        b=AYcFrkAtPGv7KIKES96yVn4X6+snxVLqU2rmr5m7JRAgztoWe9itPaGVqfUMsqlnxW
         E9IuG0DZigO6sx5PbCp+KvFUln93ET+IzcO6MRLZslPdC34dO+cZrE6Kb4EhrHSrZRT4
         jLFcuVZGvurHa3onBkbmLEUNvzxym7CiT9y26Vv0fIeZEBkLBtIUaujMOAYHxOTeMhs6
         sJ7CaqX/H6aN9icFPiXqcskboWrbdU5tW2cW8n3NfoM7EXABSOS9R/6QjqEjyhpcHqLz
         aQUixH5jmQ5GzabWu51cG0vWMntf6zTlwKTymOrq6q5umfxG0qL9cVrMjReNAgUPuFqV
         KBIw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x7si4783465wmj.16.2019.04.12.03.09.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Apr 2019 03:09:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:33574 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hEt85-0005k2-PY
	for alex.bennee@linaro.org; Fri, 12 Apr 2019 06:09:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38156)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hEt3x-0001jy-F6
	for qemu-arm@nongnu.org; Fri, 12 Apr 2019 06:05:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hEt3w-0004QO-L7
	for qemu-arm@nongnu.org; Fri, 12 Apr 2019 06:05:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54480)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1hEt3w-0004Pj-CR; Fri, 12 Apr 2019 06:05:36 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9308C3082E8F;
	Fri, 12 Apr 2019 10:05:35 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-161.ams2.redhat.com [10.36.117.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9500119C65;
	Fri, 12 Apr 2019 10:05:24 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Fri, 12 Apr 2019 12:03:41 +0200
Message-Id: <20190412100354.6409-15-eric.auger@redhat.com>
In-Reply-To: <20190412100354.6409-1-eric.auger@redhat.com>
References: <20190412100354.6409-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Fri, 12 Apr 2019 10:05:35 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v3 14/27] hw/arm/smmuv3: Fill the IOTLBEntry
 arch_id on NH_VA invalidation
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
Cc: yi.l.liu@intel.com, mst@redhat.com, jean-philippe.brucker@arm.com,
	peterx@redhat.com, alex.williamson@redhat.com, vincent.stehle@arm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nFouatkoBlwc

When the guest invalidates one S1 entry, it passes the asid.
When propagating this invalidation downto the host, the asid
information also must be passed. So let's fill the arch_id field
introduced for that purpose.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/smmuv3.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 8db605adab..b6eb61304d 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -822,6 +822,7 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
     entry.iova =3D iova;
     entry.addr_mask =3D (1 << tt->granule_sz) - 1;
     entry.perm =3D IOMMU_NONE;
+    entry.arch_id =3D asid;
=20
     memory_region_iotlb_notify_one(n, &entry);
 }
--=20
2.20.1

