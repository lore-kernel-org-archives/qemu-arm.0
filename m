Received: by 10.223.172.38 with SMTP id v35csp4641101wrc;
        Tue, 19 Sep 2017 00:47:50 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QBANg/7Ze0YNwzQSnM9X0B3p9461HGFAFDXJ2cRvxNUOJL8cweJFivKUU6uaD+JT0rGwzBU
X-Received: by 10.55.79.68 with SMTP id d65mr735032qkb.110.1505807270705;
        Tue, 19 Sep 2017 00:47:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505807270; cv=none;
        d=google.com; s=arc-20160816;
        b=i5KVtLL9YgyO8f3QZGhtVDRmeGtUFqhPdn4WX5e8j4M/Xwa2liQHT670cQI/MpFRMn
         mIQE8rEcAfg56N37KvfPpRGCmdYGHuLQn8BAanY5SFqkh7MmqDaIicV5v5hiOMbtc/7R
         1V6FpDcEDDRKxo7Yhp+6SScF/iTKe8bmOaqrWDDFZWObGkvZ8o1nbjZcqJ+4CotKmQfY
         6Z5+mKuEujJuV0QpSNd+sIQyuYzoOsm9GubP3u0D94Uw+XOCmAjSyWJz9TxhvPRd8ZwN
         R7dFI2kjxg+GjSDMjPKJn0ciWd71Gft+215UuujfUeDLZ7c5JIUicvbQHYYoLoYQ8POz
         L99Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=axdCXrBxmXHF1T2k3vwP64bvzCg/UGbluF9AvauquHw=;
        b=QpCoblMTxWc5k+kRtcfD0I5HEwKs8tvWOf2Iai4eMzTx2PKbGJ41/iTVb90lX8L5+C
         QRkZtpsvyI5Q25xz2ZE5UyKBocgFETXm9FojICSyD+d+YZ1YE5CHmCH+80XQQZgDSD0v
         VWADFHNLdIZDXHz9RPdkmgtenqevI4YehOun5CMLR7nWFlGbQrKO00ujpfBsjAGYgmx7
         TinNe+ijWeJIGmjk4MnscZpyzDXm1+4+tJnyphR3iDBNeLYghdLKqyAxisS6Y/s6ujrL
         2VXv4R3BppEWiMFZF8i8FS1fEAwAtAHgn1SrYAV3sTOLru/+gGbnZoH8y9T9AHoKTQPR
         mScA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v53si8982827qtc.170.2017.09.19.00.47.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Sep 2017 00:47:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40585 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1duDG0-0007qY-Di
	for alex.bennee@linaro.org; Tue, 19 Sep 2017 03:47:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47076)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1duDFc-0007eC-DH
	for qemu-arm@nongnu.org; Tue, 19 Sep 2017 03:47:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1duDFb-0000V3-NM
	for qemu-arm@nongnu.org; Tue, 19 Sep 2017 03:47:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53137)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1duDFb-0000Uj-Hk; Tue, 19 Sep 2017 03:47:23 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 794117E439;
	Tue, 19 Sep 2017 07:47:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 794117E439
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain.com (ovpn-116-197.ams2.redhat.com
	[10.36.116.197])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2D72D61342;
	Tue, 19 Sep 2017 07:47:14 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, mst@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, jean-philippe.brucker@arm.com
Date: Tue, 19 Sep 2017 09:46:33 +0200
Message-Id: <1505807208-9063-2-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1505807208-9063-1-git-send-email-eric.auger@redhat.com>
References: <1505807208-9063-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 19 Sep 2017 07:47:22 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v4 01/16] update-linux-headers: import
 virtio_iommu.h
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
X-TUID: ZEgcgVmzwr48

Update the script to update the virtio_iommu.h header.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 scripts/update-linux-headers.sh | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/update-linux-headers.sh b/scripts/update-linux-headers.sh
index 2f906c4..03f6712 100755
--- a/scripts/update-linux-headers.sh
+++ b/scripts/update-linux-headers.sh
@@ -134,6 +134,9 @@ EOF
 cat <<EOF >$output/linux-headers/linux/virtio_config.h
 #include "standard-headers/linux/virtio_config.h"
 EOF
+cat <<EOF >$output/linux-headers/linux/virtio_iommu.h
+#include "standard-headers/linux/virtio_iommu.h"
+EOF
 cat <<EOF >$output/linux-headers/linux/virtio_ring.h
 #include "standard-headers/linux/virtio_ring.h"
 EOF
-- 
2.5.5

