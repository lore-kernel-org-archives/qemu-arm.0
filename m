Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp977947wrv;
        Thu, 11 Jul 2019 10:30:49 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyFREkIj43iBFWK3kRwBxgRctjqxWJEOLbysVx5d4V+Ul8ewSX5DQ3mT6oSGEukjPX3ElNR
X-Received: by 2002:a50:ac24:: with SMTP id v33mr4817108edc.30.1562866249422;
        Thu, 11 Jul 2019 10:30:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562866249; cv=none;
        d=google.com; s=arc-20160816;
        b=F9y9mwTHUBGkl9lUOb9oVryZMsopLWBeZoK9ME0XkYgAhHzXfaQ16q2pNvmrDBhRVs
         kUpTkdOzvJ6WIp34pY1Jmc6UiiuDEUKKHBGB9CoboKaNKXN2bxrRWvIqghYzU1nu6OGb
         08WhSuJD8MG8HjpZMLx3b8KL0HmTvFEi5hBvYZvmqlOh0YSdh+SkVop0IZ2drE4A3GhN
         3srlrqoO7KTXZXw9z9JzkcHDYZhWFFcw9O9xaXMFutmA+wl0GdAn7iGdWeyA8e82PvT5
         Xhaf63kvfzjf0GjRw4T4cXDeXIoZHJQK59nQrywpjK8MSUmCc2HEa/jBocXZaBB2L1bb
         STmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=2u2z21vXYBABnyfph1t1yVsz0Ib5DnpRO7HNBPpCNJA=;
        b=QK73aIPR2frjxn8hryQ0947p/Eu6yeefI9xuOu3YJatbRLnyKPmsfzgXk5qJTjd4lk
         QNpJb6m8/wGQw/gfV425DLN6114LcGlksvKBttO95jMIfnfrnXe+z2u+WkRk9+SrHTVN
         L42cP3Lyofy3OUDB0hEeQ9qmKc5Y46nR9OhJtY6+CJYGWU/mSkedGhCzgeM5YMRK4BUr
         z2Q7usFqpfldZqCPdIjVn8LXUb2K1uqmWQ8NCe06caEiya7r7bpEL1wDAmKgV3Zl4Sgd
         sRENcQOnYTN0CYsQ0iE8INq4YAkHZN8Di2/41K65w/Ll7eLGt3GCwGjdim75beqMFUJr
         8xgg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f23si3986767edf.439.2019.07.11.10.30.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jul 2019 10:30:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hlcu7-0000tD-Hv
	for alex.bennee@linaro.org; Thu, 11 Jul 2019 13:30:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34009)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eric.auger@redhat.com>) id 1hlctB-0005lr-GH
 for qemu-arm@nongnu.org; Thu, 11 Jul 2019 13:29:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1hlctA-0002Am-Fu
 for qemu-arm@nongnu.org; Thu, 11 Jul 2019 13:29:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:32076)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1hlctA-00029e-AN; Thu, 11 Jul 2019 13:29:48 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8F2B9308424C;
 Thu, 11 Jul 2019 17:29:47 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-46.ams2.redhat.com [10.36.116.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 98FD75C1B4;
 Thu, 11 Jul 2019 17:29:44 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Thu, 11 Jul 2019 19:28:23 +0200
Message-Id: <20190711172845.31035-8-eric.auger@redhat.com>
In-Reply-To: <20190711172845.31035-1-eric.auger@redhat.com>
References: <20190711172845.31035-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Thu, 11 Jul 2019 17:29:47 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v4 07/29] update-linux-headers: Add sve_context.h
 to asm-arm64
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
Cc: drjones@redhat.com, yi.l.liu@intel.com, mst@redhat.com,
 jean-philippe.brucker@arm.com, zhangfei.gao@foxmail.com, peterx@redhat.com,
 alex.williamson@redhat.com, vincent.stehle@arm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1xkmPTeqLm91

From: Andrew Jones <drjones@redhat.com>

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 scripts/update-linux-headers.sh | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/update-linux-headers.sh b/scripts/update-linux-heade=
rs.sh
index dfdfdfddcf..c97d485b08 100755
--- a/scripts/update-linux-headers.sh
+++ b/scripts/update-linux-headers.sh
@@ -99,6 +99,9 @@ for arch in $ARCHLIST; do
         cp "$tmpdir/include/asm/$header" "$output/linux-headers/asm-$arc=
h"
     done
=20
+    if [ $arch =3D arm64 ]; then
+        cp "$tmpdir/include/asm/sve_context.h" "$output/linux-headers/as=
m-arm64/"
+    fi
     if [ $arch =3D mips ]; then
         cp "$tmpdir/include/asm/sgidefs.h" "$output/linux-headers/asm-mi=
ps/"
         cp "$tmpdir/include/asm/unistd_o32.h" "$output/linux-headers/asm=
-mips/"
--=20
2.20.1

