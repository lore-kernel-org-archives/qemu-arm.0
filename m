Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3392238lfm;
        Sat, 4 Jul 2020 07:53:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz5i9HBXk4iuZ9DAfWPVFOQgtO2XaRqnJ30D3z7KxoGXtVpJutbFQb7qfQS0FJu2xK07Q0g
X-Received: by 2002:a25:b948:: with SMTP id s8mr64498853ybm.487.1593874394269;
        Sat, 04 Jul 2020 07:53:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593874394; cv=none;
        d=google.com; s=arc-20160816;
        b=hYh3n71gG5F3thMGjwX1KG08aZucMJ5ves0MbyJpP8/SrpnwAo81HB4MIGmi22cP+n
         v9GCsju9v8dH+S7EuaPYNsKptFC26vymAEXgiOeElEh/hXQbBUA5cfgJrLGZofhviyQl
         vYgObO+9ER+tHbh4lglruFy6A3XYYAExt5HJeOi5JM72HQXVLhDUEoDynP/o/Y6B9rU8
         J/gyHfp2hbmNjdep15ZDI5zjj0tnsxL6WNUtb/ho1zAbuCvQXgdSqsBCB9UWeZ0mu7Ai
         dw7KUBL/upubgeFctvpujwUuMRv3YKfD/hU4PxigyQKTtmctkHUIRmlNR7asbNY96z8H
         JPWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=/SEb7i40/nbfV3CvB7T6xkytpAoG+YE52veZZ5mv5j4=;
        b=VZ950RiJlqBaOVKBpuBc/vpt0e57eMAoeb+NjHPUmKij6yJ8la5WhAZI1hvv+YKIMR
         yL0nx8mrPXyZ5eBf+7uqgFvPdOq2Ozu8IMjE5XlxIOnAWkR8UbGK2Cn1y7jUVHm50PzS
         HBRuvkJt3jLOf1hS5zZ6DnM3JYTEkOi5Q+v8fB7/wjv1g+WepmLztqgReJ/ERdLK5FKE
         9I9TXwmX36navQal7Guxi/iau97+f6n2OcKMIHRQ+xGZWZAbPDN6qopQUAuRNbb9e/K+
         w5MG0UgxXJtYdAmK3yW9ag3dUuQQXv2zYfJ2edhrUq45v2YDo3pOcRu8yWVL+FmXLdQC
         8Dsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=M86GQvVj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b5si13646594ybr.281.2020.07.04.07.53.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 04 Jul 2020 07:53:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=M86GQvVj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:40700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jrjXV-0007O0-Jg
	for alex.bennee@linaro.org; Sat, 04 Jul 2020 10:53:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jrjUT-0001TI-M3; Sat, 04 Jul 2020 10:50:05 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:33684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jrjUS-0003f0-2v; Sat, 04 Jul 2020 10:50:05 -0400
Received: by mail-wr1-x442.google.com with SMTP id f18so27701915wrs.0;
 Sat, 04 Jul 2020 07:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/SEb7i40/nbfV3CvB7T6xkytpAoG+YE52veZZ5mv5j4=;
 b=M86GQvVjqh2GOpnc8959nIEqLnIltzOWwA63YgcRTjTllNzsFeKa2AxLUplFe59nVZ
 EU5gEhxt62SSXh8q7000ETaWmRIbSKTzrgZ47MtBnXMnZm75mqtFngMn13ekv5iU3uR1
 jZH+QjvY71cexOwBR/zzvmBgICLG+ZXIDZGxG3evDVbBXwFvFbeNbh4ioXGgUGUaFauF
 lbh9Jk61RelYOfy760OtZib/qtDn/T5+sGmZ3flNc8ml4r0kTxIqEmHI5Z71CCawDYVS
 JHWip9FEybZwE41MmK/BYGDg85WJYNaGdThCFnN87eeYykN1tf2mZJKQABQuft2b5FSo
 Wb9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/SEb7i40/nbfV3CvB7T6xkytpAoG+YE52veZZ5mv5j4=;
 b=SPGsoX8aK+2Rnwj2NokFgCRSAjTkdzjrsPAcglxNXgNpdKBGOnVm4PCIbz5hC0qGTV
 aitHPi9KiE7bM6qK2vT06mfjZTYS+/RNsPGxj29q2TwzmacIvbLMQEo8wCDYEM3c4MO1
 KpjuuLe/h6gF7mkSs4kwpARbTXLbjpJy0pr4MuKHqAnMT/l/3XtFRO+75BRCBF7AyT3t
 JCPrREhNZ4+6yfr/IK+Sh6HO8ua2WQ2l9YLz9LaesCKGJcO/oFU3Nvss557j090YolNs
 BdaMX3mAJ9W0UJaIq3HJbO0KOn8TqPRsuSeWn15plvjQliWTW2+A6sWTwXKT6/PrPzNh
 xBEA==
X-Gm-Message-State: AOAM531T7RRg1GoVn/x0bAk++WM0J4ciIGFXOzeV9yQr6YvP5zYF4KD9
 dia7Rv3dSHenf2W9uvPSd+lfjHf/Roo=
X-Received: by 2002:adf:8b50:: with SMTP id v16mr43284603wra.188.1593874202076; 
 Sat, 04 Jul 2020 07:50:02 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id r10sm17135019wrm.17.2020.07.04.07.50.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 07:50:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 07/26] hw/usb/hcd-dwc2: Restrict some headers to source
Date: Sat,  4 Jul 2020 16:49:24 +0200
Message-Id: <20200704144943.18292-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200704144943.18292-1-f4bug@amsat.org>
References: <20200704144943.18292-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x442.google.com
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Huacai Chen <chenhc@lemote.com>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Paul Durrant <paul@xen.org>, Magnus Damm <magnus.damm@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Leif Lindholm <leif@nuviainc.com>,
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Q+SHuinbaurP

The header "usb/hcd-dwc2.h" doesn't need to include "qemu/timer.h",
"sysemu/dma.h", "hw/irq.h" (the types required are forward declared).
Include them in the source file which is the only one requiring the
function declarations.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/usb/hcd-dwc2.h | 3 ---
 hw/usb/hcd-dwc2.c | 3 +++
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/usb/hcd-dwc2.h b/hw/usb/hcd-dwc2.h
index 4ba809a07b..2adf0f53c7 100644
--- a/hw/usb/hcd-dwc2.h
+++ b/hw/usb/hcd-dwc2.h
@@ -19,11 +19,8 @@
 #ifndef HW_USB_DWC2_H
 #define HW_USB_DWC2_H
 
-#include "qemu/timer.h"
-#include "hw/irq.h"
 #include "hw/sysbus.h"
 #include "hw/usb.h"
-#include "sysemu/dma.h"
 
 #define DWC2_MMIO_SIZE      0x11000
 
diff --git a/hw/usb/hcd-dwc2.c b/hw/usb/hcd-dwc2.c
index 590e75b455..ccf05d0823 100644
--- a/hw/usb/hcd-dwc2.c
+++ b/hw/usb/hcd-dwc2.c
@@ -36,8 +36,11 @@
 #include "qapi/error.h"
 #include "hw/usb/dwc2-regs.h"
 #include "hw/usb/hcd-dwc2.h"
+#include "hw/irq.h"
+#include "sysemu/dma.h"
 #include "migration/vmstate.h"
 #include "trace.h"
+#include "qemu/timer.h"
 #include "qemu/log.h"
 #include "hw/qdev-properties.h"
 
-- 
2.21.3

