Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1841463lfm;
        Thu, 2 Jul 2020 13:57:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzVk+8tuuXSzgCSkrSCeGfBqRnmVTJFss4nhgfD6mk/vkhPEr0DRRmi9Wuh+lt1Zu3o0dgN
X-Received: by 2002:a05:6902:4e9:: with SMTP id w9mr51513302ybs.299.1593723477110;
        Thu, 02 Jul 2020 13:57:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593723477; cv=none;
        d=google.com; s=arc-20160816;
        b=N+crBRgKmX6tb0Vbda5EYBibOe9zXFzFDkQHtId7m6/dCVY4QOjPru3+3qS8zYc/IP
         Cqjn3gYUNmHUzFDzzRlBJ3g9lCbxlkmYfXA/rxhuC5ftABhcbgnwZo4doHoCGHye067l
         Bp+i4og8AoLe8HeEc6s2MJLgqi6Qwa43frwUSqLQhBGzERFeg3AIeJENlJcxIcQlY0Zu
         VgHR2eM9OBArzEITWoRTKFCqW16i2Rk2EcJYV3fb5CedN6lR+8/PthPMTrDgXSi4i7fP
         uJ8arKhmSzTQgrgAa/mEdCLNSNURYqsQvdYuV+fd2rU4w82WrZ1QOIDUWI1rZHmkYiFa
         dXUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=WRQFF1Ean5S7aC9TWsKn+9OiHTseT6Iuu52pMwLAYM4=;
        b=R2/Hb4EqqHcqniTwtW3Tq4t2m/0DrLLiki5rE/CKu8uGmAKn6kcsBD4iyIjW/AYBel
         2gyWU1jJrdEXcfx1RzpmWh6XluNiotm/4YKlcXg9oEggPiWY6x7RmNlLc1i/lzsDQLaA
         g4EnEHaK6VmE6mhKiSZjA0tbrwX5Bc6t0GgCsn4HYOvJsglyCp0YCPmXSy6EIRy5wDqp
         qQi+kVCRm5CUCo71zSMkL6UKlOAg7+50Ya6pHrvjr4eogC+nF9f0qc4nxE/bg7W4XPHS
         g0xue2etChm9KXIC+bJuOCd/nEcWNb7D5pSUp+9DufjinCI9/h8tqkOjY2/Q/JSRhN0a
         bcXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SB7lTprt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h13si5986723ybp.497.2020.07.02.13.57.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jul 2020 13:57:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SB7lTprt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jr6HL-0002TD-OO
	for alex.bennee@linaro.org; Thu, 02 Jul 2020 16:57:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jr69K-0004wG-5a
 for qemu-arm@nongnu.org; Thu, 02 Jul 2020 16:49:38 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:20331
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jr69C-0003aX-GG
 for qemu-arm@nongnu.org; Thu, 02 Jul 2020 16:49:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593722969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=WRQFF1Ean5S7aC9TWsKn+9OiHTseT6Iuu52pMwLAYM4=;
 b=SB7lTprt45olPquqNeSe7i7J8wWEF36GIND0uCC8XZzG+UhH8eFimbrDk2+YjrC3I+PUnL
 WJwVzuInxZdRNls57rzJv4VnyOgYso5QvFJ0lKabBk/t4fTdQDJcMhnyjsj7In2Da4B7+U
 E+3oM0mJPlNM90z30tL17E4UV3IPb4I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375-5_xydxvzPmyYquW_YrXV3Q-1; Thu, 02 Jul 2020 16:49:28 -0400
X-MC-Unique: 5_xydxvzPmyYquW_YrXV3Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EAAE78014D7;
 Thu,  2 Jul 2020 20:49:25 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-62.ams2.redhat.com
 [10.36.112.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 20B4173FE9;
 Thu,  2 Jul 2020 20:49:15 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 44ED131EE4; Thu,  2 Jul 2020 22:49:00 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 11/21] microvm/acpi: use seabios with acpi=on
Date: Thu,  2 Jul 2020 22:48:49 +0200
Message-Id: <20200702204859.9876-12-kraxel@redhat.com>
In-Reply-To: <20200702204859.9876-1-kraxel@redhat.com>
References: <20200702204859.9876-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=207.211.31.81; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/02 04:18:28
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tExzHx1JWpzp

With acpi=off continue to use qboot.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/i386/microvm.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index 1bcd57a6fd80..ac605d92b984 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -52,6 +52,7 @@
 #include "hw/xen/start_info.h"
 
 #define MICROVM_QBOOT_FILENAME "qboot.rom"
+#define MICROVM_BIOS_FILENAME  "bios-microvm.bin"
 
 static void microvm_set_rtc(MicrovmMachineState *mms, ISADevice *s)
 {
@@ -174,7 +175,9 @@ static void microvm_devices_init(MicrovmMachineState *mms)
     }
 
     if (bios_name == NULL) {
-        bios_name = MICROVM_QBOOT_FILENAME;
+        bios_name = x86_machine_is_acpi_enabled(x86ms)
+            ? MICROVM_BIOS_FILENAME
+            : MICROVM_QBOOT_FILENAME;
     }
     x86_bios_rom_init(get_system_memory(), true);
 }
-- 
2.18.4

