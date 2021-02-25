Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp241017lfg;
        Thu, 25 Feb 2021 02:57:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw90j3Bp1Ko7JOS5sSg3uwfd0WK359/JaBl5dYB/LL6w5yVeSqF1xkq2xOWTn1kgOHCC7z/
X-Received: by 2002:a92:3647:: with SMTP id d7mr2088292ilf.264.1614250678084;
        Thu, 25 Feb 2021 02:57:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614250678; cv=none;
        d=google.com; s=arc-20160816;
        b=tNO+t5Yi5kj3vBoqCbrFsq3Ndhg+3mSXbdV1xffRfYx1sVUk0TotobnwR0zSnAF1Bw
         jO5RcU850Zl3yC5r3/9PAUDHXgUlrDPT5xCZGnOEpSFVJc9SwrEUZvPw0aKgFj4WLqHB
         pNR/aFCu87zlw9cU9XqytalGIaIq8zzoqC/AJx1Z1NeafPus+7RRULcuINKyWEin/A4T
         T5Ouqv8sqK8vuGSW1qlgsX3fcdmNrf8Mp+zO+CMnbxUD/XSd/B9i7qC4w7uXth5ZexjX
         R7vFSh4daC+Yc9VdnxZ4t5c0GczjNOPEeSv/8yMa3/wUHbsahk5lCLQS4TpQW7+Ff3oC
         oEqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=TdiR+jKNXYR2S2JEqfaPyrG169gt0kCOhn4quaH3XiA=;
        b=rqrwU4y8jfkHTPp1ovVzWfqzcx9gp5HnlHoBo4je9QN/7dA4Bm97/Tw9KhPRv7VWFC
         cpByUmuJluB3+f0yWmFpQiY9mYwDZD/1v34PFlhYyGt1cEa/AOEMlhcT52OStEe889U7
         aZEy2ynprTpjf8HBvWBbGQzm7E8mHCpU3lMS04CjsXQkKTlSivnSXRyBT/3VJA3w41+y
         nyebUY0nVvuRmj1MHQGzIWhkCwyRpDGUoDtyeNxHgj7r0af0P1PIHdJkaWEZgPQrwonB
         OYhr0UUNWLj0INwXUFVd6lONdqCeT7jMNH9mms/VN0ybn/3OdObu8WfMw1X7UZ68Q8hf
         xoYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="XyjLW4u/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z26si61011jao.38.2021.02.25.02.57.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Feb 2021 02:57:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="XyjLW4u/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lFELF-0003q1-Ap
	for alex.bennee@linaro.org; Thu, 25 Feb 2021 05:57:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lFEHB-0005rG-GL
 for qemu-arm@nongnu.org; Thu, 25 Feb 2021 05:53:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lFEGv-0004yX-9x
 for qemu-arm@nongnu.org; Thu, 25 Feb 2021 05:53:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614250408;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TdiR+jKNXYR2S2JEqfaPyrG169gt0kCOhn4quaH3XiA=;
 b=XyjLW4u/0iK8RYWv9tsgx5rf1Y0HiE9qUQSoal+n20sn+exOx4hX112/qIr50HzZk3uPrE
 3De3zm94GPywGk+rr0ocx7pjntJ0vd1BMZ/jA7AWZK7bZ+/3BOvxrYEQsNvn01MGhvOZX/
 S0kqBPipr7QaIHDwzvdU3RUyNZJrskw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-Um09Et97OFmg72V9wCgSQQ-1; Thu, 25 Feb 2021 05:53:24 -0500
X-MC-Unique: Um09Et97OFmg72V9wCgSQQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 671DAC294;
 Thu, 25 Feb 2021 10:53:22 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-150.ams2.redhat.com [10.36.112.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0F35D5D9D7;
 Thu, 25 Feb 2021 10:53:03 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 alex.williamson@redhat.com, jacob.jun.pan@linux.intel.com,
 yi.l.liu@intel.com
Subject: [RFC v8 02/28] update-linux-headers: Import iommu.h
Date: Thu, 25 Feb 2021 11:52:07 +0100
Message-Id: <20210225105233.650545-3-eric.auger@redhat.com>
In-Reply-To: <20210225105233.650545-1-eric.auger@redhat.com>
References: <20210225105233.650545-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
 jiangkunkun@huawei.com, zhangfei.gao@foxmail.com, peterx@redhat.com,
 shameerali.kolothum.thodi@huawei.com, yuzenghui@huawei.com,
 zhangfei.gao@linaro.org, will@kernel.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pTY9kylXAZI1

Update the script to import the new iommu.h uapi header.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 scripts/update-linux-headers.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/update-linux-headers.sh b/scripts/update-linux-headers.sh
index fa6f2b6272..f588678837 100755
--- a/scripts/update-linux-headers.sh
+++ b/scripts/update-linux-headers.sh
@@ -142,7 +142,7 @@ done
 
 rm -rf "$output/linux-headers/linux"
 mkdir -p "$output/linux-headers/linux"
-for header in kvm.h vfio.h vfio_ccw.h vfio_zdev.h vhost.h \
+for header in kvm.h vfio.h vfio_ccw.h vfio_zdev.h vhost.h iommu.h \
               psci.h psp-sev.h userfaultfd.h mman.h; do
     cp "$tmpdir/include/linux/$header" "$output/linux-headers/linux"
 done
-- 
2.26.2

