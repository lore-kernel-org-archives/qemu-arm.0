Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp624870wrd;
        Sat, 1 Sep 2018 07:32:36 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdbUqqhjm/DJRVYPfYhr4FjmYz8T6/SpojmA67wh0gFEq3SMlvSri4RlL5Iv9uzMyfdC0UwK
X-Received: by 2002:ac8:2908:: with SMTP id y8-v6mr20083267qty.45.1535812356093;
        Sat, 01 Sep 2018 07:32:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535812356; cv=none;
        d=google.com; s=arc-20160816;
        b=xMifB0SF8DpSEB8p1sY0dExNY4LJDYjG1tMZC8G9bs0FjUd9U1As9R8lBknuaa3wpL
         4rvbNFNIuu5Xk4HGMA9QQtNPUZNDBXHSY700r1keYptBFYWx/f+VnAR0VMbdqCbQSIPy
         5XiGGsDhvPKmgQKHiPghjy3JrrO8nab+JkRSTknj2ygg/oiuKm+zHZnsv4lHHv6/iGWA
         pNNuIFPrZxd/Fz7vH+EIgKH/UDg912/fL9U9Ix7XiUbuEd0tjylge4QU/kXHwDECGBGq
         RLs0uwss+3QllNLok6StwH6bGSHneVa7UaUIM4gzlOz3bcCP3fEDZYR3EcGwm4onTMmU
         MVQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=IRvXdUIZLjQuegY1KLOvYD7s1aG3v8ttf9XcKZhf8lw=;
        b=j1XlYahE0BIFgxIr63f6u+tl9dn5YUAeLc9mGqApgs+ftI7Tz/HwokvZNE3q29lze1
         HvV4X3NhOSjS7h18DIDkNoqEqZbGdFKDGeCAP5AI7Uftwi8I6kaOxphMdHz/k94xaVGy
         7dN8tlFrXlpP6b5sYbJNzzo0y/43dgqxqDhjB+yDl0aRMG0S+52TlN2aGLVVigEE0xoS
         WBsqIceAb4Ew+x78uXXqJhy+d2E56Qh85Ahfr5o4exFf0eujAoP6jorfOkj9EXPY+FJc
         gH3o2u0Bte6e2rwGqwFfjeUW/4WVpVpbTY3wbCuePSb7+Jzgk0GdvAOEYEGyvALlmU5/
         Qwfg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o6-v6si2142114qke.175.2018.09.01.07.32.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 01 Sep 2018 07:32:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37376 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fw6x1-0004u2-HG
	for alex.bennee@linaro.org; Sat, 01 Sep 2018 10:32:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55115)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fw6qN-0006KD-DK
	for qemu-arm@nongnu.org; Sat, 01 Sep 2018 10:25:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fw6oo-0005lO-Tg
	for qemu-arm@nongnu.org; Sat, 01 Sep 2018 10:24:07 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:42830 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fw6oo-0005lA-PG; Sat, 01 Sep 2018 10:24:06 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6D27C4021715;
	Sat,  1 Sep 2018 14:24:06 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-157.ams2.redhat.com [10.36.116.157])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 926872166B41;
	Sat,  1 Sep 2018 14:24:04 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Sat,  1 Sep 2018 16:23:04 +0200
Message-Id: <20180901142312.11662-13-eric.auger@redhat.com>
In-Reply-To: <20180901142312.11662-1-eric.auger@redhat.com>
References: <20180901142312.11662-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Sat, 01 Sep 2018 14:24:06 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Sat, 01 Sep 2018 14:24:06 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC 12/20] hw/arm/smmuv3: Implement dummy replay
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
X-TUID: vB7dBaE3/Ryr

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
index 5f787bf455..ff92f802bd 100644
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

