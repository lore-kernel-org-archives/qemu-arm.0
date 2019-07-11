Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp986919wrv;
        Thu, 11 Jul 2019 10:40:42 -0700 (PDT)
X-Google-Smtp-Source: APXvYqznxk/DkihTE41+qDoCqq4Sdzj1eDUVTCCH2SP8q2qgpxzCDOjHAbO6hIEVdri/KElNY0xD
X-Received: by 2002:a17:906:7281:: with SMTP id b1mr4403421ejl.63.1562866842851;
        Thu, 11 Jul 2019 10:40:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562866842; cv=none;
        d=google.com; s=arc-20160816;
        b=DoSKA4iF24uxw55eSfG6PlxEnp0gzJGzXm3/PLsj1BfspJX9h6k+4KwOr8rSJ5u2bH
         SCrkDbPjQIFX6og6ivj3/0vStHva9YmnTdaUZrH0Ej/ferA+mbkwpgEKxQyOher9ahst
         /fQs5rAERpcyMMCq9cb80wAqfAfts8jjgyNL/uESsJ00ciQulArrVQGtEs9hjvIxH1XF
         nfIQMgp3aOc/ZGe/OrKJmPLsqpkOGv3eidOQfiG/mZPx+OEfIrjm0eOBkR+PdJ+uMjge
         iuaOrIdkV+XJ3Zq/k9nDxdFjG9kxhyUkQpZGfJxu8Q0wzozvVIgpd8O7Xjtoahs8AhTB
         D57Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=2u2z21vXYBABnyfph1t1yVsz0Ib5DnpRO7HNBPpCNJA=;
        b=drDmboMFY4cofZ6gkEIoxW+IvMmMZWHwndQS2QW4SFOU4VuUDJeDqsRUzQeJ3A1Mtq
         DzACgFEuN21EGPnU2fR76/hT1ZGA+1opq+7U/xaQekElpaMob4pkd65zR8U/AjtYcRMP
         cTcIk3qdGIeSs4M3ldqNspPI/S7ZgAcg6ZYIZroY0Mr8a4N4dy5mZhLs/GUA+ZIxW1uZ
         KbvxaMqzJm8LbeJ6iS6BKMdLppXvePgQaYlsV8y5YvirJMh3w4TVgoYOR1ANea9pWuVq
         Utueg0vB56BEtgzroPj4tXGVjj/47apoSv/pPOimqBQDtQZaMNeudr0zlgiRIRp3SVN1
         A/vA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bq14si3331042ejb.15.2019.07.11.10.40.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jul 2019 10:40:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hld3h-0001qy-CS
	for alex.bennee@linaro.org; Thu, 11 Jul 2019 13:40:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38031)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eric.auger@redhat.com>) id 1hld3Y-0001cA-J1
 for qemu-arm@nongnu.org; Thu, 11 Jul 2019 13:40:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1hld3X-0004Jp-EQ
 for qemu-arm@nongnu.org; Thu, 11 Jul 2019 13:40:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37744)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1hld3X-0004H5-8g; Thu, 11 Jul 2019 13:40:31 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E4E1E3083392;
 Thu, 11 Jul 2019 17:40:29 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-46.ams2.redhat.com [10.36.116.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 031EF6092E;
 Thu, 11 Jul 2019 17:40:26 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Thu, 11 Jul 2019 19:39:11 +0200
Message-Id: <20190711173933.31203-8-eric.auger@redhat.com>
In-Reply-To: <20190711173933.31203-1-eric.auger@redhat.com>
References: <20190711173933.31203-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Thu, 11 Jul 2019 17:40:30 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v5 07/29] update-linux-headers: Add sve_context.h
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
X-TUID: BPD+fCcXYA2u

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

