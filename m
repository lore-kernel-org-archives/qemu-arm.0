Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp2013200lfp;
        Thu, 6 Feb 2020 14:52:45 -0800 (PST)
X-Google-Smtp-Source: APXvYqwixRgiGUEI5yFY2IVN6u1tyIPh4DbvQxgGzGnLuqOCcooHI4/G5tJY6r8hNkYmptHPDeB8
X-Received: by 2002:a05:620a:2104:: with SMTP id l4mr4305453qkl.240.1581029565486;
        Thu, 06 Feb 2020 14:52:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581029565; cv=none;
        d=google.com; s=arc-20160816;
        b=eBQUcAnFUxy2UngwN7RNc5CDYADV1WAfSrvp0lgFsGwwhrotBbXdY9icxFyo2kFzcW
         7YGIMWF9iYe3dtrVc2vIYLLctHpjp/xuJixzXP5M+xRizxE3crAF4HiS6G8xRgKxfmVC
         issBlbqojY4MeHdx+h4qcIifJAhnrAkQXRSJ0KiOImrQmVftnCi6QyKNJACYfsnAiIf3
         pNy22RAzwNTsoh8MSARvSj6byeOdihGH9z4J+pkz9ybIUnoTWojUHMuEDZajs8eQcYxQ
         1GWJfhKEq3n4RX9f2EpwqficzbpUxlzwYGFbKfd7vb7OEdypgzaCM+jFsTWjBG06oZyC
         t67A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=rfxbtLv3nyFV5kvFEdieiC214Sc9ruKEs0GT8H7hyVA=;
        b=qvULQUJkIspdreXdScVhdZDxVH7l65Fy4F/CzudaHF+VdSRo4i6Gu7qImEz9GJVuUo
         WDDxARsYEs9p8771fWghUJxgDKycC97PGUsEFj78qmY3HZKk7QMZwYRDYZyqz5Zs3I2z
         zq+E9uEGYJAUE38fYlwIS/zjW42doZPcDA3IBS4H5ERP9XQgRxp9CQtqeN941H12ADBe
         KoxTEgSG+L74UST+uaMhtDRe6yIRM0xWwLeo98EJCFXRl5St8Hjwrg2Z+GeceeecwmUO
         pzwxOsQmZ2ydJR9NJqHA4aQul99pwy7yz6uFXyrmR4AVUO0u15Zs8GxC5UEcZeSsjkV6
         0PRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="SJe/4r7o";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o8si455676qtm.272.2020.02.06.14.52.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2020 14:52:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="SJe/4r7o";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1izq0q-0004kk-Qr
	for alex.bennee@linaro.org; Thu, 06 Feb 2020 17:52:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60725)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1izq0C-0004C5-8x
 for qemu-arm@nongnu.org; Thu, 06 Feb 2020 17:52:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1izq0A-0005jn-UX
 for qemu-arm@nongnu.org; Thu, 06 Feb 2020 17:52:04 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:37275
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1izq0A-0005er-Qw
 for qemu-arm@nongnu.org; Thu, 06 Feb 2020 17:52:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581029519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rfxbtLv3nyFV5kvFEdieiC214Sc9ruKEs0GT8H7hyVA=;
 b=SJe/4r7ovsVFOtiTL45SR5fhK3OG3nE2zf4C3mYN9mrnTxrAitNolRHzSa522bLa22WJxs
 OOPpvRkO/0fMv7AcFmklYgTyQ4i6RQLbYCOqrZ/cRmKqqTCblgDg6Vxnh5PFGfcESrtLUJ
 /nFK7T//zUJpLoUW971UqEu6X1uO4yY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-riRaxIBAMuOQF4w3N0rwXA-1; Thu, 06 Feb 2020 17:51:55 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DAA6C8010D6;
 Thu,  6 Feb 2020 22:51:54 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-120.brq.redhat.com [10.40.204.120])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BE28D60BF7;
 Thu,  6 Feb 2020 22:51:50 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Andrew Jones <drjones@redhat.com>
Subject: [PATCH v2] docs/arm-cpu-features: Make kvm-no-adjvtime comment clearer
Date: Thu,  6 Feb 2020 23:51:48 +0100
Message-Id: <20200206225148.23923-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: riRaxIBAMuOQF4w3N0rwXA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ++FLzRInMFFk

The bold text sounds like 'knock knock'. Only bolding the
second 'not' makes it easier to read.

Fixes: dea101a1ae
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
v2: Removed unrelated hunk
---
 docs/arm-cpu-features.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/arm-cpu-features.rst b/docs/arm-cpu-features.rst
index dbf3b7cf42..fc1623aeca 100644
--- a/docs/arm-cpu-features.rst
+++ b/docs/arm-cpu-features.rst
@@ -185,7 +185,7 @@ the list of KVM VCPU features and their descriptions.
=20
   kvm-no-adjvtime          By default kvm-no-adjvtime is disabled.  This
                            means that by default the virtual time
-                           adjustment is enabled (vtime is *not not*
+                           adjustment is enabled (vtime is not *not*
                            adjusted).
=20
                            When virtual time adjustment is enabled each
--=20
2.21.1

