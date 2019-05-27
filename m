Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp6307653wrg;
        Mon, 27 May 2019 04:43:05 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxLP1j81NCZEaPd8QmCvzRuL6eZdkFfPslw4ULeC4y2D6rbX95k6EQfpl/vHct2SPJ8wlyj
X-Received: by 2002:a0c:b0c7:: with SMTP id p7mr57441643qvc.246.1558957385868;
        Mon, 27 May 2019 04:43:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558957385; cv=none;
        d=google.com; s=arc-20160816;
        b=rsuvVNS9Jg/5DUiNsjgF+Gz3JVtDazMM31rEj6btBC6zONfP7zp6vCkwzeXptHib1D
         gBCsczi0/NeXbUA31zPhyAbxNkpxtg0DAYV1o7FHbg/hBJh/xw/1o+SoF+Al3zCjfo9E
         MdKauLho+ngeac8iE29NQBp3d/BOqK4rTMayh6bj3D9vFtex2fA/+NPeCvw+6IW+3Xcj
         G5X3OCdqeu4cxG/iEfRldvCQ+oEPwPyx/zOTL9aVjNYE94eNJ1ZgHN8dhmm8HkcgWLZ9
         4rjp96I1qkc3NH0ZRLSsoP2HK1Rx0yAY7sFsDqBj/NcNZIiFfoEG0JLlSVxJ4u5GHiCf
         DAug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=RqIvIseiTRoX1di59PxONSturiOBM06tK0fbvlZMleo=;
        b=YL6XPGxt0KZCOePmGEGzCHpk7qdLaFtAi1Bu6HuvCrseom9q7L6L6YJu8+eKfRZfAQ
         y8B65pWgq0S9L2Va1r+denmQUfWf3zZcomqpoUdtxOyIyoDjJYA1yt0isJxxsNST9JUy
         YOMqdnwaMEKTXnQWLXZberJ2lEC9q8cyu6ZnhMGFTwSXXaaKx1p0ZdWVfuU5ssZzqjOK
         3bzx0RACAQp4TULGpLUPadCvOYm5nXmeddFfiwPfJn0sgOLoDvkOS26R+kY7foIifwkP
         mfJwTn8lY7OHz24+1FrYLmdMnhN8qpvKswofGzSgN3j1mc/EK5DGw/Q4LXr3JSa7od1Z
         kY4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q39si5380922qtc.350.2019.05.27.04.43.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 27 May 2019 04:43:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:43995 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hVE1x-00031B-Aj
	for alex.bennee@linaro.org; Mon, 27 May 2019 07:43:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37696)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hVE1d-0002zh-DY
	for qemu-arm@nongnu.org; Mon, 27 May 2019 07:42:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hVE1c-00038L-Bf
	for qemu-arm@nongnu.org; Mon, 27 May 2019 07:42:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49128)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1hVE1c-00037Z-66; Mon, 27 May 2019 07:42:44 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6EEEAC057E65;
	Mon, 27 May 2019 11:42:43 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-67.ams2.redhat.com [10.36.116.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C313F5D962;
	Mon, 27 May 2019 11:42:33 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Mon, 27 May 2019 13:41:38 +0200
Message-Id: <20190527114203.2762-3-eric.auger@redhat.com>
In-Reply-To: <20190527114203.2762-1-eric.auger@redhat.com>
References: <20190527114203.2762-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Mon, 27 May 2019 11:42:43 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v4 02/27] update-linux-headers: Import iommu.h
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
X-TUID: tPcJux3DcFUg

Update the script to import the new iommu.h uapi header.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 scripts/update-linux-headers.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/update-linux-headers.sh b/scripts/update-linux-heade=
rs.sh
index f76d77363b..dfdfdfddcf 100755
--- a/scripts/update-linux-headers.sh
+++ b/scripts/update-linux-headers.sh
@@ -141,7 +141,7 @@ done
=20
 rm -rf "$output/linux-headers/linux"
 mkdir -p "$output/linux-headers/linux"
-for header in kvm.h vfio.h vfio_ccw.h vhost.h \
+for header in kvm.h vfio.h vfio_ccw.h vhost.h iommu.h \
               psci.h psp-sev.h userfaultfd.h mman.h; do
     cp "$tmpdir/include/linux/$header" "$output/linux-headers/linux"
 done
--=20
2.20.1

