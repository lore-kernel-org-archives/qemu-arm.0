Received: by 10.223.172.38 with SMTP id v35csp4649209wrc;
        Tue, 19 Sep 2017 00:59:47 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDeNQ7J04NaAsoXLz6BjBU/JnPz4Ya0oP2kViR4a+ZVk8RHuOMzSOoyttO6E7ZIB512q8T/
X-Received: by 10.55.59.136 with SMTP id i130mr655344qka.99.1505807987241;
        Tue, 19 Sep 2017 00:59:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505807987; cv=none;
        d=google.com; s=arc-20160816;
        b=ISfvxFMKwcWlY8odTnIxUcYxNl+WuO/sCnClGHU+gYH4hBpxY6hEa6COBjtf/E0nFK
         KqVytc/S44q2FApkA+6BvZ93+uBrGQfoh8fD4PksJtB55Y5mDlxD9Uq0WCWNWT3URYBB
         Y54t6aKwV73IZmE7jmQ3M9zcN3CuwzCRfO552rHTgz0zPdVVxoLr/w0lab2vPrZ7DsN0
         cO0GlBS98DqA1gV7d9rVhxTN0bWvjv1tEVmR6Rw8JbJ5K9V1kXQl7zg6jScyDcevqkmv
         SVinXmvSjGCzcV3KFfQRc+DP/uv2e1FHy648WdE1pBhPWfI5AyySpAESsX44UqDJyJTa
         uqrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=TFbL+7jltfcC6eHGiA+cybGODazVDGclKnP26zB/YLk=;
        b=QRtJuTSIikinjmpDRwTSZ0rrsY+jNoCGs9q4Oj3l9ZPP5ospW4N4MEmHwXAzAsWwTz
         5bMCFFyViD4V8HuiboOM1WOvGp/FCYTrBL3QeqvOGw+PsWDo4us2fprJhea2c7At802v
         BHlKXWZHmflQBLx1p04QsZPoHWKp1NiSBK1hQATNcznbsfpO5Wuhx9yekQOLTShAswaP
         j0W0PZTzIkCxHrufIsbVYAEkE+dE1E9hrZi4qz7Fkt3sDlnnty3pTlFU0gD5uQWh15Zo
         ML1f1EfXbelgfW1SOkiWXXCO6xzQL2h5qHg0m4C+eOWAwoHxj5qX+/AKPIWZ4ppNn3WQ
         9tbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 10si8898607qkw.110.2017.09.19.00.59.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Sep 2017 00:59:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40649 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1duDRY-0000Yd-Ug
	for alex.bennee@linaro.org; Tue, 19 Sep 2017 03:59:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48593)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1duDIh-0001ur-IQ
	for qemu-devel@nongnu.org; Tue, 19 Sep 2017 03:50:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1duDIg-00024G-N4
	for qemu-devel@nongnu.org; Tue, 19 Sep 2017 03:50:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45280)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1duDIc-00020u-27; Tue, 19 Sep 2017 03:50:30 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E630161498;
	Tue, 19 Sep 2017 07:50:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com E630161498
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain.com (ovpn-116-197.ams2.redhat.com
	[10.36.116.197])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 607A061342;
	Tue, 19 Sep 2017 07:50:21 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, mst@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, jean-philippe.brucker@arm.com
Date: Tue, 19 Sep 2017 09:46:48 +0200
Message-Id: <1505807208-9063-17-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1505807208-9063-1-git-send-email-eric.auger@redhat.com>
References: <1505807208-9063-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 19 Sep 2017 07:50:29 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v4 16/16] hw/vfio/common: Do not print error when
 viommu translates into an mmio region
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
Cc: wei@redhat.com, kevin.tian@intel.com, marc.zyngier@arm.com, tn@semihalf.com,
	will.deacon@arm.com, drjones@redhat.com, peterx@redhat.com,
	linuc.decode@gmail.com, bharat.bhushan@nxp.com, christoffer.dall@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lP5lC7Tc5QAQ

On ARM, the MSI doorbell is translated by the virtual IOMMU.
As such address_space_translate() returns the MSI controller
MMIO region and we get an "iommu map to non memory area"
message. Let's remove this latter.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/vfio/common.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 468a259..fb6f397 100644
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
2.5.5

