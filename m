Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3394970lfm;
        Sat, 4 Jul 2020 07:57:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxylw5emmxV7kDfsCIWbhBZ6yC75LE7B7ioyHQDLHp1ylU8rIzGH0lePyG2NB3k1nTj0Gth
X-Received: by 2002:a25:7804:: with SMTP id t4mr73521543ybc.43.1593874677363;
        Sat, 04 Jul 2020 07:57:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593874677; cv=none;
        d=google.com; s=arc-20160816;
        b=zRc0PJ/Z/o6CUs/u4uVdFzjc+iP+Q8K2xvZYiQh3NTtYWET/H4ywmsFP/iMH3KpudO
         y1/1su+bZZnS1uKHHf0zM8QiUfpIiF8TrneCRRCgfssFv+x3MPPPDsCpFKfYNe7VDLdC
         CN+t66c4DJvE4fWnSYhanuIFGHvL4r2WW9Iyt3PuhIDiPXKyYlfKsyZQigmtnkXdyj9H
         mI1ctpqUOq2Om1N2rPTn1YxOC619/eWAQE08HercVqDmjJG4IvVZ3KdoPIZNrBtt+buK
         FY2vyZJ31WomYkMQI5CVcF/xvbB18bBou7fk+GbVoatjx6RXh3GQT384w8iKsGFs9Qu9
         hoLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=LIvjoiOYGW8qxH03j7d+uMoGgATq8ow1BJ8pj4MMInc=;
        b=a4xaVgxG5XR79yVj3lPc9vI5ZL8zR/QeIYRUWtEQy4Imyw0sIdnFb1FgK2yzZ61y8C
         cgobz6ukKT4gE/DCxXUl7t1ULroK/jvOrj6xclcqpTUevambMF/iRtH0w0fD7V3sgExm
         diZqSzH5igDlwgtLBB6WTAef7nsF72YapF5b/ASAy+jWev3uMzFCeuiujWu2+28hUD/b
         0FxI46AJEs5mizwzTRf2yiSsQru7Ysc2f6kdAHJvjwUF5RHnmUwrZXCKLRj5KApL0ErO
         FBkpOz1TMkleXVgB95tMuTvoM2yvcqVUFpLvRqY5MzZxcQHgL26vEPQSWswPNanGJVPc
         Kdlg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=K8OdEPUy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b74si7063410ybg.398.2020.07.04.07.57.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 04 Jul 2020 07:57:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=K8OdEPUy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:33646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jrjc4-0007l0-Mt
	for alex.bennee@linaro.org; Sat, 04 Jul 2020 10:57:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jrjUd-0001ta-OH; Sat, 04 Jul 2020 10:50:15 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:50521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jrjUc-0003gT-5M; Sat, 04 Jul 2020 10:50:15 -0400
Received: by mail-wm1-x342.google.com with SMTP id l17so34722402wmj.0;
 Sat, 04 Jul 2020 07:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LIvjoiOYGW8qxH03j7d+uMoGgATq8ow1BJ8pj4MMInc=;
 b=K8OdEPUyesQSU/S5m5qok6/IcUiWOAZO7BMajTrjGs6JPbceMxtuZf8byY8tbJEGHX
 JEhvrKsqhFGfeStk45pdmkIx1Crd26UqdfRtBkDFTF1ZcEpMz4Y9f8h/NujfAZ8zhopU
 tcgLUIVhx4SR2VngYxvbMDeifVcrfHrvzA0aQukuywYfCwQ6dqY2ovVF7OMVfTiF2YPn
 DNxSIQBEYNKYXgGw5SLUtGuykIXaIqdYUBYTZrYeQbwEa/h1m7E4cIMUq8sIDEztAFSW
 sjbJhzGGYK8GyRliwIteCXYFpst00XbTUThRJIANJG3Mz51oqbQ9X/YLHxyeR4B28a9a
 b3LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=LIvjoiOYGW8qxH03j7d+uMoGgATq8ow1BJ8pj4MMInc=;
 b=hXOxyCAn1+Z/CPaMVZprNfoPCIDoO0wqxN0gqMe/K8eSEq5XLPaYGdjov54EFc5T/N
 L/wW2qOVQ6tUh/PlMv6ILfxM5LQVPZYLacbnM+E9Rk0zTOccE4d92hF9OEEafEEMlUXY
 SZT0CKS44qodjwGZy8tEbNxTuMLofAKcjp5XuNob+YEwUy5YrJzq6q4uWLPREBUs0UX9
 G2yY0GB1u0tgqkbLra5OBeqlrioymfNu7f73hYy6bnx/NsQawfAwMVSgSRUtZfFAuoJU
 ULjZwmqZopheC3C9GdzvmRGIjpNxpuOxZhCSwgpmjVDIM9TC+8ksIEDClR+mrdF3APyA
 4++w==
X-Gm-Message-State: AOAM5311VhI3Iz7Pvm7gioSLfXw8fzN8t1953ZET5OmgjsXzD5UHa3l/
 C6rWL4XqyPLvA0UfkloET/W3ugC8tCg=
X-Received: by 2002:a7b:c313:: with SMTP id k19mr26876880wmj.67.1593874211964; 
 Sat, 04 Jul 2020 07:50:11 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id r10sm17135019wrm.17.2020.07.04.07.50.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 07:50:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 12/26] hw/usb/hcd-musb: Restrict header scope
Date: Sat,  4 Jul 2020 16:49:29 +0200
Message-Id: <20200704144943.18292-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200704144943.18292-1-f4bug@amsat.org>
References: <20200704144943.18292-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Huacai Chen <chenhc@lemote.com>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Paul Durrant <paul@xen.org>, Magnus Damm <magnus.damm@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Leif Lindholm <leif@nuviainc.com>, Andrzej Zaborowski <balrogg@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <rth@twiddle.net>,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paul Zimmerman <pauldzim@gmail.com>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xiO0VCZjh9Q5

"hcd-musb.h" is only required by USB device implementions.
As we keep these implementations in the hw/usb/ directory,
move the header there.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 {include/hw => hw}/usb/hcd-musb.h | 0
 hw/usb/hcd-musb.c                 | 2 +-
 hw/usb/tusb6010.c                 | 2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename {include/hw => hw}/usb/hcd-musb.h (100%)

diff --git a/include/hw/usb/hcd-musb.h b/hw/usb/hcd-musb.h
similarity index 100%
rename from include/hw/usb/hcd-musb.h
rename to hw/usb/hcd-musb.h
diff --git a/hw/usb/hcd-musb.c b/hw/usb/hcd-musb.c
index 85f5ff5bd4..b8d8766a4a 100644
--- a/hw/usb/hcd-musb.c
+++ b/hw/usb/hcd-musb.c
@@ -23,9 +23,9 @@
 #include "qemu/osdep.h"
 #include "qemu/timer.h"
 #include "hw/usb.h"
-#include "hw/usb/hcd-musb.h"
 #include "hw/irq.h"
 #include "hw/hw.h"
+#include "hcd-musb.h"
 
 /* Common USB registers */
 #define MUSB_HDRC_FADDR		0x00	/* 8-bit */
diff --git a/hw/usb/tusb6010.c b/hw/usb/tusb6010.c
index 27eb28d3e4..9f9b81b09d 100644
--- a/hw/usb/tusb6010.c
+++ b/hw/usb/tusb6010.c
@@ -23,11 +23,11 @@
 #include "qemu/module.h"
 #include "qemu/timer.h"
 #include "hw/usb.h"
-#include "hw/usb/hcd-musb.h"
 #include "hw/arm/omap.h"
 #include "hw/hw.h"
 #include "hw/irq.h"
 #include "hw/sysbus.h"
+#include "hcd-musb.h"
 
 #define TYPE_TUSB6010 "tusb6010"
 #define TUSB(obj) OBJECT_CHECK(TUSBState, (obj), TYPE_TUSB6010)
-- 
2.21.3

