Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp619157wrd;
        Sat, 1 Sep 2018 07:25:12 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdZ1IZ4yOH8Ly5EI+ettWFkVhcqRlV4RLRDTYXNwwtZ5dGTDXe3Ae5yPYIKvm6HGsnh1Zm6v
X-Received: by 2002:a0c:e00b:: with SMTP id j11-v6mr18837743qvk.197.1535811912677;
        Sat, 01 Sep 2018 07:25:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535811912; cv=none;
        d=google.com; s=arc-20160816;
        b=PA6LrARyqBs4EmjgRmKgJtU8Txjfwz7q0NniImLcWke4zT959tKL83lLjwsHgePEoS
         TZ6Bpt3NyBvclrTqgI00qluhHhNPeXX017xyE8i+NU4NNvnspcubjRsIfD1qKK1Q33W0
         lwc5PhD5LvIzo8WJWF9Yyhf5ua1KbUOR0A0T6m9EKut/lF8qGjkMcJOJv25vaQQYbV+5
         nKVsyWB2wCzRTqFri2xLSeqY764bKnZ56C9YeTfCSYrwg/sSfpRdzGElO7qZ15eKbuYz
         kqHkyJ8SfqRju/jl1SxoWXXwf7cqa3/mUNregERnp/PRiLpkKq1+WfkRMdGbkTp3kSjU
         dYVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=HlyUcpvD1F9Bwa/jbmdwxfVbe7Zsxqxo6/neeGiYfx0=;
        b=D4uBcKQUOVN6LmEo8TW3y3635eGwVVnlhPGW+zFSWtyQ9ilSK0SYPptUyfsPOqn0Oh
         tQjAS4rwVJvv9Fs2JZZKiEOKWCjb8lt2bvEcEhDv6xraJOTdBT76D0qSp2FTFR5WeuCn
         IdEgFZ/7AhjzGn4MBnE4SX2GmiULKQY8HwhXp2WBkPjsStmiGceuIkz/jHJv6BeRG2H/
         3xWGBwbvHzvXCTkkOXy1ZIlL+mNZUMIrj6faQM1s1phfTUxzdQw0urajHrACjvVWleRM
         s0iLveT/ywZUCEw2OZgHMP/W84MhVgVQ60miK2rk/P4VPavnbQV5o9HiW3Va8LCv/lHc
         nDjA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q11-v6si1307897qtf.30.2018.09.01.07.25.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 01 Sep 2018 07:25:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37327 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fw6ps-0005sZ-5e
	for alex.bennee@linaro.org; Sat, 01 Sep 2018 10:25:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54953)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fw6pe-0005sK-6S
	for qemu-arm@nongnu.org; Sat, 01 Sep 2018 10:25:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fw6oS-0005TT-SR
	for qemu-arm@nongnu.org; Sat, 01 Sep 2018 10:23:49 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:51086 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fw6oS-0005T4-Nx; Sat, 01 Sep 2018 10:23:44 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5A9C685756;
	Sat,  1 Sep 2018 14:23:44 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-157.ams2.redhat.com [10.36.116.157])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 47A352166B41;
	Sat,  1 Sep 2018 14:23:35 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Sat,  1 Sep 2018 16:22:57 +0200
Message-Id: <20180901142312.11662-6-eric.auger@redhat.com>
In-Reply-To: <20180901142312.11662-1-eric.auger@redhat.com>
References: <20180901142312.11662-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Sat, 01 Sep 2018 14:23:44 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Sat, 01 Sep 2018 14:23:44 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC 05/20] hw/arm/smmuv3: Implement get_attr API to
 report IOMMU_ATTR_VFIO_NESTED
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
Cc: yi.l.liu@intel.com, cdall@kernel.org, mst@redhat.com,
	jean-philippe.brucker@arm.com, peterx@redhat.com,
	alex.williamson@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /1RulPcGyY6u

Virtual SMMUv3 requires physical nested stages for VFIO integration.
Let's advertise this.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/smmuv3.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index bb6a24e9b8..80aa4f3793 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1504,6 +1504,17 @@ static void smmuv3_notify_flag_changed(IOMMUMemoryRegion *iommu,
     }
 }
 
+static int smmuv3_get_attr(IOMMUMemoryRegion *iommu,
+                           enum IOMMUMemoryRegionAttr attr,
+                           void *data)
+{
+    if (attr == IOMMU_ATTR_VFIO_NESTED) {
+        *(bool *) data = true;
+        return 0;
+    }
+    return -EINVAL;
+}
+
 static void smmuv3_iommu_memory_region_class_init(ObjectClass *klass,
                                                   void *data)
 {
@@ -1511,6 +1522,7 @@ static void smmuv3_iommu_memory_region_class_init(ObjectClass *klass,
 
     imrc->translate = smmuv3_translate;
     imrc->notify_flag_changed = smmuv3_notify_flag_changed;
+    imrc->get_attr = smmuv3_get_attr;
 }
 
 static const TypeInfo smmuv3_type_info = {
-- 
2.17.1

