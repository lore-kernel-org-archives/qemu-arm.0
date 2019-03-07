Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7221281wrx;
        Thu, 7 Mar 2019 06:42:36 -0800 (PST)
X-Google-Smtp-Source: APXvYqwuCa0iHFCSkMXpZHutHMLOdy7SvaRMa65g98q6/J4CMCAtI1Oe4WU4rCOeA6ZJpG6ZX0R3
X-Received: by 2002:a25:4287:: with SMTP id p129mr11739904yba.106.1551969756685;
        Thu, 07 Mar 2019 06:42:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551969756; cv=none;
        d=google.com; s=arc-20160816;
        b=o0BSTx4KZTO76txtGf2VzA6aIt4ZMJk2iX1Fs+M0zJuDjmOUrZXVjKt1H0vrdFfck5
         BBxWXWTmgxoFcvhJ8Pbt0ah5n1xZdJhIasLdXIcnWpR7rpSXO/YM83XwkoHPGnXjrynk
         SvMkfv9h/3vfzws6+B3X2WpjbJcGLW3BF3m9SXRKfCHO8CU1ERl+t2ieu4YESgXppsjV
         vShsV38upHI0kBM3e6ycLyMz459pEStp8MUdy7m62WbiVOMLKJsesc4cTbw15YDxy6+l
         x9pBLhs7KEBNBjhvlFcp7zUd+iKUDDQ1MMbw200t5xN/L89Yd8LkDEwW8Pwao8pavf7E
         khKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=oFbu7HUn0Dolu5xer2msz9nMxqj5GvstVGKH3V3exGk=;
        b=Ck1FNAY8LdcAEEMXtUsT6pWuJb9MLmwAciyc1UgZ3qAfcxQeCedJG1FjXMrFGpZUr1
         pqgiEcJ69CcNbayFrq3Vmj0Zu52dkKUR4Fo42U2CnVUmxiq5FbCtH/ZsMNJq0B1XaB1a
         I6Jb9VtJxNaHSGaazZQlApAwkGuy+9+SgOu1fcOpI14Snj8q9/i0/x2vmQbkhs19O0qd
         7EIzZk1xF6yoRJ7TV0czg4paJNK0BplJ2/PGqHgQhhWeET0f7Xo5efvlEJMLMBxt8+Vb
         Wh/VTeSs1066mj8Ghoo/qrJSGLnXptWpcEPSUjaB5jS6M+PdFKfkkzLKH5+aL8f86nam
         P6vw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 10si2766560ybg.68.2019.03.07.06.42.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Mar 2019 06:42:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:52944 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h1uEG-0006uR-3i
	for alex.bennee@linaro.org; Thu, 07 Mar 2019 09:42:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44856)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1h1tv3-0007Pm-0Z
	for qemu-devel@nongnu.org; Thu, 07 Mar 2019 09:22:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1h1tv2-0002ih-B6
	for qemu-devel@nongnu.org; Thu, 07 Mar 2019 09:22:44 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33930)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1h1tv0-0002gI-O8; Thu, 07 Mar 2019 09:22:42 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E9CB7A737;
	Thu,  7 Mar 2019 14:22:41 +0000 (UTC)
Received: from thuth.com (ovpn-116-26.ams2.redhat.com [10.36.116.26])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D49275C5FD;
	Thu,  7 Mar 2019 14:22:37 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Thu,  7 Mar 2019 15:18:53 +0100
Message-Id: <1551968334-18982-29-git-send-email-thuth@redhat.com>
In-Reply-To: <1551968334-18982-1-git-send-email-thuth@redhat.com>
References: <1551968334-18982-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 07 Mar 2019 14:22:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v4 28/29] hw/arm: Express dependencies of the
 musca machines with Kconfig
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
Cc: Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pRwhu6MBA+DR

Dependencies have been determined with trial-and-error and by
looking at the musca.c source file.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/Kconfig | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 3a04def..7a0e0ba 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -77,6 +77,12 @@ config MAINSTONE
     select PFLASH_CFI01
     select SMC91C111
 
+config MUSCA
+    bool
+    select ARMSSE
+    select PL011
+    select PL031
+
 config MUSICPAL
     bool
     select BITBANG_I2C
@@ -429,6 +435,3 @@ config ARMSSE_CPUID
 
 config ARMSSE_MHU
     bool
-
-config MUSCA
-    bool
-- 
1.8.3.1

