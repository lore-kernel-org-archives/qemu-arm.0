Received: by 10.28.71.27 with SMTP id u27csp232600wma;
        Mon, 12 Feb 2018 11:30:21 -0800 (PST)
X-Google-Smtp-Source: AH8x224XrKbOW8tjKG18j7Z+KyjvEoWpLooSM84w0IKH8KDohof0D9H53uCez4cdNq4/VIoZ8zHb
X-Received: by 10.13.217.7 with SMTP id b7mr1815142ywe.477.1518463821149;
        Mon, 12 Feb 2018 11:30:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518463821; cv=none;
        d=google.com; s=arc-20160816;
        b=oTFn9KCrBbIYxcFKymlIihI8cp1AQbAuisPtKcsyYGVg+Y6K0oRy6VVJSkYVbJubxy
         TLr7Qx0ARWHP5/i2tA1M1aOP/xSkL0Sxpn1nO872ivDyH3cz5lcxI3lmtsBaC7UitO1+
         nXYSh+4Z0wJfkPeGPl3IK/dtJ5LoOK+O3VjnH/7+roBMuE/zBmi2LhzyFNAcsYcU3F6r
         hqou03Wh1WKzG2P460MIVXWGfy6XWtoRgzNWpSdiIbiIhkeXuiVkJ72rqsQ7MT1Z83I9
         zLaS7CuhNqkZmYzS3TZ0O/XYcZxxB7bmOlK7LMzf7xCbtYRIpGEkGg+1g2MJs6JFvVfW
         oyKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=MnZcxlsTjKV85yO7rLc7ryIUwGDMNzHeFLQL3weo6BY=;
        b=Y+sRPzaxCVGPQWdqfHKCAACc6VPdnPYMMa4MigGDpjKAYtZ+shNqNfwos4poV8h31V
         9qz8vrhtUCl/hnTNbajFrhLo7Ep4hYR5L5zdfcBsU6zdia/DxEwpLtPLNPYCUks1Wzhi
         dpemnuCWwMeT0jbTR9n9BGUfU7IuAOcZsnrdIT+Blp+q41g+iuqJhmIDA2vcLfeilUO7
         74EA8xOAkJVRKE6Z99KOT49aQm/dUoW9v6LIfUuvFuJ2vT4gojIjj5HZyDh3NvXnj5bQ
         NUphVfU07aAcg7ohNbRdRS9AWNn6rrzVUsoTT1dYac7Vp4lOQQxfHt70Gp7ULHAizO7x
         1hrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 202si1591066ywp.313.2018.02.12.11.30.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Feb 2018 11:30:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42560 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1elJnw-0002pr-LJ
	for alex.bennee@linaro.org; Mon, 12 Feb 2018 14:30:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49313)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1elJLl-00028e-4P
	for qemu-arm@nongnu.org; Mon, 12 Feb 2018 14:01:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1elJLg-0006VO-Fe
	for qemu-arm@nongnu.org; Mon, 12 Feb 2018 14:01:13 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:56062 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1elJLg-0006UW-Bu; Mon, 12 Feb 2018 14:01:08 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C06B040FB636;
	Mon, 12 Feb 2018 19:01:07 +0000 (UTC)
Received: from AMD.redhat.com (ovpn-116-182.ams2.redhat.com [10.36.116.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3DB821006ED7;
	Mon, 12 Feb 2018 19:00:59 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, mst@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, jean-philippe.brucker@arm.com
Date: Mon, 12 Feb 2018 18:58:24 +0000
Message-Id: <1518461904-5305-23-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1518461904-5305-1-git-send-email-eric.auger@redhat.com>
References: <1518461904-5305-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Mon, 12 Feb 2018 19:01:07 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Mon, 12 Feb 2018 19:01:07 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC v6 22/22] hw/vfio/common: Do not print error when
 viommu translates into an mmio region
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
Cc: kevin.tian@intel.com, marc.zyngier@arm.com, tn@semihalf.com,
	will.deacon@arm.com, drjones@redhat.com, peterx@redhat.com,
	linuc.decode@gmail.com, bharat.bhushan@nxp.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aPAqzQ3O6i93

On ARM, the MSI doorbell is translated by the virtual IOMMU.
As such address_space_translate() returns the MSI controller
MMIO region and we get an "iommu map to non memory area"
message. Let's remove this latter.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/vfio/common.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 8f3fa0c..1fc8e28 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -326,8 +326,6 @@ static bool vfio_get_vaddr(IOMMUTLBEntry *iotlb, void **vaddr,
                                  iotlb->translated_addr,
                                  &xlat, &len, writable);
     if (!memory_region_is_ram(mr)) {
-        error_report("iommu map to non memory area %"HWADDR_PRIx"",
-                     xlat);
         return false;
     }
 
-- 
1.9.1

