Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp918727wrv;
        Fri, 12 Jul 2019 06:39:52 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxNhFCpSZbimy/HPKkiAU7tDI8KXKN1AWRArd+MMpkQQ2koNcFXPYcRphEBYjRdtMffoUaY
X-Received: by 2002:aa7:cd17:: with SMTP id b23mr9375998edw.278.1562938792511;
        Fri, 12 Jul 2019 06:39:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562938792; cv=none;
        d=google.com; s=arc-20160816;
        b=vnle5gNkd7am1eRmcR+jvy4edCILL1SxKflkTsgC80D9JkJ22mt2ZESzuI5gheQlJY
         /x/yASCixt/W29HD/oW4UCuqOk0rfxKSnR9zfjf7N3LZQlakZmm/SBK1FdwxZJ+9H5Z1
         kvNba33cKpqvC0+6JSc0ZNrj+V2M0x7emVJqZKk+13lB+FNhibdkAjQvgFdKUFpzDhPX
         bWfacdSqT9Os+MxJbYq2njmZ+P760ZC1IXOwKemdqNKjD9Ps+b8qO9cTmho8iWXTFl3H
         samJDwpGJSkKxftSIwQCfVLh33o1JcXJg2u7QsRy8EAhM/e2i4OjEhukfJRjzQWSrRLJ
         EsCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=Ln6nPSwL+FtkDOqUMjEjPNIfmxsVyPKYO9yu1aJZUeI=;
        b=Qgd/jXfgABHuqI4th9L5w2RYI8UpJulBEdlTMipGUrGewBg6ZjVmgjTfPV/TJ0xE0x
         zDqrVYdxbG2MG58mbvkVJ4ruUVrjokoTTFzt64A5j6Y8se1hZBOrMbdeTeOLuxPu8pzL
         FJqtfCPXSiTkFvhtZ5LRNaV0jzoup73dU8FmNcecoezFIh7q+qasDRDuGjLqComRv/mr
         a5jdwZMdkJxyYb9m0LsLpuBuvrMwFfWNbENC3iLfjyj6LQtHnh0a1B0c8UcSG/kTVJ4F
         g5/gKG5fmB6Uhu6B5DBtHeP0OshFL73XajAUyY1uJs5yJp8wYsezawt7K676NqmK6tiW
         JWAg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t39si5178342eda.363.2019.07.12.06.39.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Jul 2019 06:39:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hlvmB-00045d-74
	for alex.bennee@linaro.org; Fri, 12 Jul 2019 09:39:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57381)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hlvm7-0003z5-Og
 for qemu-arm@nongnu.org; Fri, 12 Jul 2019 09:39:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hlvm6-0006DW-Tr
 for qemu-arm@nongnu.org; Fri, 12 Jul 2019 09:39:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46708)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hlvm6-0006Cs-OY; Fri, 12 Jul 2019 09:39:46 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 171A12F8BD1;
 Fri, 12 Jul 2019 13:39:46 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-150.brq.redhat.com [10.40.204.150])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5973619C58;
 Fri, 12 Jul 2019 13:39:43 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 12 Jul 2019 15:39:23 +0200
Message-Id: <20190712133928.21394-3-philmd@redhat.com>
In-Reply-To: <20190712133928.21394-1-philmd@redhat.com>
References: <20190712133928.21394-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Fri, 12 Jul 2019 13:39:46 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH-for-4.1 2/7] hw/usb: Bluetooth HCI USB depends on
 USB & BLUETOOTH
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
X-TUID: 8AgpZxxpF3MR

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/usb/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/usb/Kconfig b/hw/usb/Kconfig
index 564305e283..1b435ec002 100644
--- a/hw/usb/Kconfig
+++ b/hw/usb/Kconfig
@@ -82,7 +82,7 @@ config USB_NETWORK
 config USB_BLUETOOTH
     bool
     default y
-    depends on USB
+    depends on USB && BLUETOOTH
=20
 config USB_SMARTCARD
     bool
--=20
2.20.1

