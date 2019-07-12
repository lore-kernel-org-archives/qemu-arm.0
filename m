Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp918676wrv;
        Fri, 12 Jul 2019 06:39:49 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyMwmQeGBJRdOQiNNSNpR4zEDquUm0FAqSo+Ai3NVIAIOw0AJTP1TgwV5hSBHAztL1+1anV
X-Received: by 2002:a50:9468:: with SMTP id q37mr9225042eda.163.1562938789261;
        Fri, 12 Jul 2019 06:39:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562938789; cv=none;
        d=google.com; s=arc-20160816;
        b=gm384B/GqbeJiGkxrw4zjYkebo13hiAKCxBL3yqMnJ122dK997aXyvFpJPcUX72AMR
         XEDF/dqOV4AYYDTlVZxNSgr2W6A7S7dfTOGLLbxxuP8bexWyBdF4Ff2rCyZjadgu0dN4
         /jDH0x+ZnVp7tEgmaHfdZrDYs2QQztef1sQoE4MM3/cEpqK6KxQwFqSK5e00Y2YKNrXe
         X5zYp7XjXNg/ql+lSNjd5EY799A0ZDtsTsjFpwUX88VoceJbl5jBdmpPnPU6vz/S+9lL
         rli4tHzZvenYGKBtbgK64qoaUWm4noA6gJK/AEFhUhAdSJGeJWCPsCYtB3fqaYP3bVHY
         7Qxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=LQG8BqEJoWEy82Fh3amgWG75X5pe5iYAfYityyxXFFU=;
        b=jWXmVM1MgAkaZkmldomUidcu6mncZIMyeWtNoEBoYzSkyHyFIRRigiqy/iYYGvxJpc
         69EdL3VF+JLA9WKRvr/phftcyYKg0MCJDdRUvgDD8OnKrFZSV0GXBVER1rid3IBLBuq4
         X5Y2Dpy9FpEEfv+p1Qs22BQJW2LYf2+TM7XlRh3+XUD3uQQlXRuwuD0y3qhHoPmCGH0F
         j6CAqQdE7Hu/XbnwGJtQD/bg5JX4Jbx/kbWI+5V6TP/4ktDx9kEZA4DbVosvJ43hQG3E
         VPP3LnhgiLxvv2Wb2sRKbp80eh2/zgr+Dfhs5OmLrLWb46DS/tfp/DnzLvqnSu0vYRTI
         cMdA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i4si5492560edg.136.2019.07.12.06.39.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Jul 2019 06:39:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hlvm8-0003ta-Cv
	for alex.bennee@linaro.org; Fri, 12 Jul 2019 09:39:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57336)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hlvm4-0003oe-If
 for qemu-arm@nongnu.org; Fri, 12 Jul 2019 09:39:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hlvm3-00069B-NW
 for qemu-arm@nongnu.org; Fri, 12 Jul 2019 09:39:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45436)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hlvm3-00067S-Hl; Fri, 12 Jul 2019 09:39:43 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id CA79A59466;
 Fri, 12 Jul 2019 13:39:42 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-150.brq.redhat.com [10.40.204.150])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AE44E19C67;
 Fri, 12 Jul 2019 13:39:39 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 12 Jul 2019 15:39:22 +0200
Message-Id: <20190712133928.21394-2-philmd@redhat.com>
In-Reply-To: <20190712133928.21394-1-philmd@redhat.com>
References: <20190712133928.21394-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Fri, 12 Jul 2019 13:39:42 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH-for-4.1? 1/7] hw/arm: Nokia N-series tablet
 requires Bluetooth
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Miroslav Rezanina <mrezanin@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nwEjJyHW3SUq

Missed in 4826ac6d192 because the Bluetooth devices are
currently always enabled.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index ab65ecd216..11195251f3 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -106,6 +106,7 @@ config NSERIES
     select LM832X   # GPIO keyboard chip
     select TWL92230 # energy-management
     select TUSB6010
+    select BLUETOOTH
=20
 config OMAP
     bool
--=20
2.20.1

