Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp6311105wrg;
        Mon, 27 May 2019 04:47:12 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzxIUfrfk04TL7EVRNtOpmVFUAKu2LCX3EuO2JZoUyxakIQg8Ow46lV2iGha8EXXsUQIbZN
X-Received: by 2002:ac8:26a4:: with SMTP id 33mr77884016qto.188.1558957632230;
        Mon, 27 May 2019 04:47:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558957632; cv=none;
        d=google.com; s=arc-20160816;
        b=ck9LjaZ9I1t+yBCWKKU8yyBWydBCvkHR/XCwg/zUy2KCydB2QizezyLf+b10Fse/Yx
         M9/n8hlD2m2KWXz2bmZJHAiCvypp/qACHiPiGz/z/6jeukJD1XzhMoZTbhJ2fQXTfrMI
         6f1ufaQP/pm48L5ZjWUAWkr7lcdInddJ3YGCSVS8Z9HHmzH4TyQeDsrD2pw3YS5knLLx
         x0ya3sVltSU02DvIWVcKthruZft0H7AUcnpJWulxP4dzGLXvWEt+DFZwHLlSEace2kZe
         dVxmjHKEUyE9VzezLNbCskcxlphoh6t+0XgExpsj+/9I1WTK4lRLaHiDWDtN6ReljfOH
         xtNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=2u2z21vXYBABnyfph1t1yVsz0Ib5DnpRO7HNBPpCNJA=;
        b=qYaQefPpGcgSKAA3Y10FAL5Y57yY0aN50RPGFHooYIvBJUVzV9jLWwGPNhGQdpIz79
         eySiwBN6vIjUzQ+9qhxexTODuk6iMfbbDwDE8gLpFFdgdLgOrbPunNHxh+IA/wqwPjRt
         ri55137SfSVIebOgLfiYzVofkETf6gR/r3cUwR0sO+LEPfH8AVHgSKIrPPuFYHf0eDjj
         NUyzmUrNWZLcFEiXYqV1/3RzrAudnyebwSNFevDtykLJXtHTaqJK/FXHUESi0nPAr+Ej
         sa1m8JEi+Rz88RceMSQQzO+eExRvNxGbLDXF8jh8jgJ8SwE5y0QXJQ5KCKFBRyhxN+Rl
         +dZA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l123si1983355qke.27.2019.05.27.04.47.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 27 May 2019 04:47:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:44063 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hVE5v-0005ll-L4
	for alex.bennee@linaro.org; Mon, 27 May 2019 07:47:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37766)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hVE1q-00035k-NS
	for qemu-devel@nongnu.org; Mon, 27 May 2019 07:42:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hVE1p-0003JQ-RD
	for qemu-devel@nongnu.org; Mon, 27 May 2019 07:42:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49206)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1hVE1i-0003ED-Jb; Mon, 27 May 2019 07:42:50 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C5F9CC059B80;
	Mon, 27 May 2019 11:42:49 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-67.ams2.redhat.com [10.36.116.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C30205D723;
	Mon, 27 May 2019 11:42:43 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Mon, 27 May 2019 13:41:39 +0200
Message-Id: <20190527114203.2762-4-eric.auger@redhat.com>
In-Reply-To: <20190527114203.2762-1-eric.auger@redhat.com>
References: <20190527114203.2762-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Mon, 27 May 2019 11:42:49 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v4 03/27] update-linux-headers: Add sve_context.h
 to asm-arm64
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
Cc: drjones@redhat.com, yi.l.liu@intel.com, mst@redhat.com,
	jean-philippe.brucker@arm.com, zhangfei.gao@foxmail.com,
	peterx@redhat.com, alex.williamson@redhat.com, vincent.stehle@arm.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: C9rFNYiOSNq2

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

