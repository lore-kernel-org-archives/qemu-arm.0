Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp4625195wrv;
        Tue, 30 Jul 2019 10:22:30 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzrEoZpjAWivbj065Y1gkXQFv1qhLNCAkduulV4nMyclNRP+41gqUiwB3334tdjZ5+Wut0C
X-Received: by 2002:a67:ee98:: with SMTP id n24mr23235867vsp.92.1564507350294;
        Tue, 30 Jul 2019 10:22:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564507350; cv=none;
        d=google.com; s=arc-20160816;
        b=Dajhd+lcOwOr4NG+yKlP3BAw96H81B+cJvkjbITFbzDutwJTnf3b5FoWTzaz972QWj
         kvV35B+Wc4s9c+1Mh+rL3GDqxhQuP+lFJmCLzyJtRJTSxMzv4mgfaC+eP1SoiXxkh5pa
         n79jBo3P7mKE17tLMoEv1rFTafpPLtJmQy81zLWk0T1ZoRIwUrelM3oZ4v4BQGQXGVz5
         ZTb1iKQyjgKk+/eQXkDw0hMGkqCUxDbqaYXO2Z4X7ECOJCXtBeT+Za3TNCMfFtpq0Bzs
         qJyGXhAiptxXA/jDnbsR7maGaavSuhTWzkPJHemAmUFLqHWVkqDNqceIEpk/kfKsES2I
         FBsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=etE1m3GDS8NLSB+ExGK78ZcHlWj1aiUyrKOJknnCZNI=;
        b=kx5AdEwBdsp/OAkPMSyou+a61594+bg6DlxMjNwo29ztJzAE2Gx8oNBeu6mHeUBMjQ
         2+9MMoCob0vLc7kZCZQFswatNacxg86A4ILQvm20XHErOm+vfA8nYZ+xDBpBEBwRzziQ
         9iAZJJJ+qSKefQw6arFM34aG4Ms1Z+c0p/wEL6933Dk+Qp7BZDTZYmPJJsT7XozcmimX
         MbdTBH9ObTAkOsLOLbkYb5XXvKWt8415z/BI1ZMfANo+DvKkZD+91y1a1B54Jk76hKNM
         w8c8PrvrNFOmLM39e0cbpFJqdawRXR/JFXNDhu69I+BNU/lwtnCvISoqpjZkEAA7LAT7
         GuJg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i129si14811210vkg.91.2019.07.30.10.22.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jul 2019 10:22:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hsVpV-0007wR-O4
	for alex.bennee@linaro.org; Tue, 30 Jul 2019 13:22:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60685)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eric.auger@redhat.com>) id 1hsVpP-0007u0-LF
 for qemu-arm@nongnu.org; Tue, 30 Jul 2019 13:22:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1hsVpO-0000VD-QG
 for qemu-arm@nongnu.org; Tue, 30 Jul 2019 13:22:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57540)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1hsVpO-0000Uh-LV; Tue, 30 Jul 2019 13:22:22 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7DFFBC04BD40;
 Tue, 30 Jul 2019 17:22:21 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-49.ams2.redhat.com [10.36.116.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B19E760C62;
 Tue, 30 Jul 2019 17:21:55 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com, peter.maydell@linaro.org,
 alex.williamson@redhat.com, jean-philippe@linaro.org, kevin.tian@intel.com
Date: Tue, 30 Jul 2019 19:21:23 +0200
Message-Id: <20190730172137.23114-2-eric.auger@redhat.com>
In-Reply-To: <20190730172137.23114-1-eric.auger@redhat.com>
References: <20190730172137.23114-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Tue, 30 Jul 2019 17:22:21 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH for-4.2 v10 01/15] update-linux-headers: Import
 virtio_iommu.h
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
Cc: tn@semihalf.com, bharat.bhushan@nxp.com, peterx@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Rq1wZ7fI2yN3

Update the script to update the virtio_iommu.h header.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 scripts/update-linux-headers.sh | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/update-linux-headers.sh b/scripts/update-linux-heade=
rs.sh
index f76d77363b..7805291ca0 100755
--- a/scripts/update-linux-headers.sh
+++ b/scripts/update-linux-headers.sh
@@ -175,6 +175,9 @@ fi
 cat <<EOF >$output/linux-headers/linux/virtio_config.h
 #include "standard-headers/linux/virtio_config.h"
 EOF
+cat <<EOF >$output/linux-headers/linux/virtio_iommu.h
+#include "standard-headers/linux/virtio_iommu.h"
+EOF
 cat <<EOF >$output/linux-headers/linux/virtio_ring.h
 #include "standard-headers/linux/virtio_ring.h"
 EOF
--=20
2.20.1

