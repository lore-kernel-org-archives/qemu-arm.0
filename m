Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp1135418lfe;
        Fri, 20 Mar 2020 10:08:16 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvp+NiBBOfRQGomLm+/tboz1Qevc593qeX2/glrdaRaAvDqZPIQUDselQyR4dUyWoy8Mq9K
X-Received: by 2002:a37:9ec8:: with SMTP id h191mr8930706qke.260.1584724096662;
        Fri, 20 Mar 2020 10:08:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584724096; cv=none;
        d=google.com; s=arc-20160816;
        b=G82ilOabsReQxofSpgSSqhxz4CWK9FkWFdADgmKZfRWDxPNEGCabNBbmNNoYoCFPr4
         Q5zcFZ1T55So4WYAl7ABY4PTImjlXzyRRUJMuXVo6dvxmJPXGfEQIm2uLKwNFDRPG/ST
         0EL8qoMO0JkQk+m8O5uQIn5TqGCwW3qKL/2NqA3DBX7oOys4Mlxp+Hax/9zGVZVfIepR
         cXSG0YoYbEPg/OokQNodGJz88DydDAclker857H03Fve1K9CQwiA0IZI6yYIkjTc7LIT
         w24zpSYtP9oyzh3iCnMsrFztJX6fsnOTG8dd2kjC5aFIE/L2UMzDqCTo2M/wvalBIpie
         0hzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=NX8HKyEsatBbWDR9Z0wfxPmbo5XQFgUJgUXFvqqYIuY=;
        b=E0tGq2LNVd23NVMVlFku5Mf9oqX4+Ngo8BZWeCTEBtSpSIzo9D8irvzMTyiJdMfR8n
         RZk56gh+brH5xPRXw5vFt5pZ9eLIXzfiqSekPwq95xTozXlo7uOL6y//gTiKkeo1dsng
         qMwXs+eg4KWT4DFI7A74ZoS/HfVf7PCC1EQCSBcXxSbqLsmHwtKHYzboz6nQ2CFpGUXL
         aWUQFZZcndqtzIltCEv+wTznzE26SC95DAFpiCmGJ367QXTpZ0OAw2d2/jnjRTiDhCSI
         HkJE5CGCIHEyCF4pdtwt1PhedLRYPqQON/Xx+DK828nYdrPIXrKYQ2lJsFzLb335yMIe
         p9iA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Hs2xGnrw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 1si3784949qkp.355.2020.03.20.10.08.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Mar 2020 10:08:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Hs2xGnrw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56459 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jFL84-00016j-1p
	for alex.bennee@linaro.org; Fri, 20 Mar 2020 13:08:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55473)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1jFL3J-0000k8-Tj
 for qemu-arm@nongnu.org; Fri, 20 Mar 2020 13:03:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1jFL3I-00009Q-Tt
 for qemu-arm@nongnu.org; Fri, 20 Mar 2020 13:03:21 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:37629)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1jFL3I-00009E-Pg
 for qemu-arm@nongnu.org; Fri, 20 Mar 2020 13:03:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584723800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NX8HKyEsatBbWDR9Z0wfxPmbo5XQFgUJgUXFvqqYIuY=;
 b=Hs2xGnrw/TvXAj9LZivMsrZUKbJ/PdsHKyJz3VZd+rwYWzv1DrR05O+L3Ir5mts8OTI+lD
 OTULEPq8q1KcQq/sKYSumKFPygv7PxlmxBtfwrGAasSo20S4FkepsLEC87euc5A83R4fBX
 IS++oagfxeZc4ZzVUnQ40b/Q8XeinAI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-d9i-CxyIPHOl53C4nLsOUw-1; Fri, 20 Mar 2020 13:03:19 -0400
X-MC-Unique: d9i-CxyIPHOl53C4nLsOUw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E3ED2100550D;
 Fri, 20 Mar 2020 17:03:16 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-113-142.ams2.redhat.com [10.36.113.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 82AF316D22;
 Fri, 20 Mar 2020 17:03:10 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 alex.williamson@redhat.com, jacob.jun.pan@linux.intel.com,
 yi.l.liu@intel.com
Subject: [RFC v6 20/24] hw/arm/smmuv3: Fill the IOTLBEntry arch_id on NH_VA
 invalidation
Date: Fri, 20 Mar 2020 17:58:36 +0100
Message-Id: <20200320165840.30057-21-eric.auger@redhat.com>
In-Reply-To: <20200320165840.30057-1-eric.auger@redhat.com>
References: <20200320165840.30057-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
 zhangfei.gao@foxmail.com, peterx@redhat.com,
 shameerali.kolothum.thodi@huawei.com, zhangfei.gao@linaro.org,
 bbhushan2@marvell.com, will@kernel.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: y3Rtf//vVtwe

When the guest invalidates one S1 entry, it passes the asid.
When propagating this invalidation downto the host, the asid
information also must be passed. So let's fill the arch_id field
introduced for that purpose.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/smmuv3.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 1424e08c31..66603c1fde 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -838,6 +838,7 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
     entry.iova =3D iova;
     entry.addr_mask =3D (1 << tt->granule_sz) - 1;
     entry.perm =3D IOMMU_NONE;
+    entry.arch_id =3D asid;
=20
     memory_region_notify_one(n, &entry);
 }
--=20
2.20.1

