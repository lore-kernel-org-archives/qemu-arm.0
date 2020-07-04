Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3393161lfm;
        Sat, 4 Jul 2020 07:54:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4FyPyEJDyl6Y24lXtdxmU73ms54GueSvoXUU2TTw6tOOYvXHi81qXWmU4lzE44HtXNPkn
X-Received: by 2002:a25:2e48:: with SMTP id b8mr69130709ybn.521.1593874486285;
        Sat, 04 Jul 2020 07:54:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593874486; cv=none;
        d=google.com; s=arc-20160816;
        b=BJdTlMJ+zTgfLjXl7b0h2pJFZ/16lw0VX/VHiqv4pAOSbtCvNYSSFCN3I7AzwVLLiR
         dkRpPa8TtuFqlwIeZywDOg+fbEhiT998ro6WKuhHk1XOEXoqYbCi/T8SSpTC8srg8YTq
         u4wrr+nmDSP/byg7kl5E27QMmfKshYi9a3MT+fosWBaJfRJf/2B1jDHe3hwcIBzdMAK0
         ydi/Ce+LSg+dlP0d8g41ce3DuCwsuQhSn0wB2LOG4tv6giFyXJGf/trd3zvLoWhTtAe7
         ScstLE6hjkCe9WmeGfGvUte/jocDnJUGLMUT+RDNEIAGZdcAQzcVyuz20SG1wMiTtAz5
         CXxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=8KnwDCFnDP2p4VznLGchEQ7MhbCDHoouF9hb3OmMvFo=;
        b=We63SGqW0A9YouawJCMGQ1KWPDRK5l7qfd6n5ceBbEKM1ACxMEmkN182ePoIACXnx+
         ulgW7Bb3VSAhqNeHOJMl6a4ZsnmznisjEFNL576jj8DCzpz9fTKUZqm4CsgARz/7Gq3y
         S18bPCwmuHmFRWYZMQDk77Kgi8SoS6QNcg19fzs2noHWezIDBr0RKNw94PBG0VTu6zR7
         QKIaIpyi2Bx5qc07lWm0QlcBw4I/Ozj6GRNQo9ERqMAPLD7s6Bpzyflvb8MdlAlYt9Ds
         T64kvoV5eyBAQcFV4oQHNT9zuEY0t5bDrXaoQgziHn1KvBj5iQeJkV3fyDvVFB/eIr37
         aPhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qnXK+ln5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n8si15009407ybc.320.2020.07.04.07.54.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 04 Jul 2020 07:54:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qnXK+ln5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:48676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jrjYz-00029I-LF
	for alex.bennee@linaro.org; Sat, 04 Jul 2020 10:54:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jrjUV-0001YY-Qm; Sat, 04 Jul 2020 10:50:07 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:44235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jrjUU-0003fC-6h; Sat, 04 Jul 2020 10:50:07 -0400
Received: by mail-wr1-x443.google.com with SMTP id b6so35747440wrs.11;
 Sat, 04 Jul 2020 07:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8KnwDCFnDP2p4VznLGchEQ7MhbCDHoouF9hb3OmMvFo=;
 b=qnXK+ln5rQy/kZGC3Fh2RFx/8LLRy2FzRaODh+swFw0DtexOC034PCwojAmD2p2qEc
 +xBeYKP6Sea6ucH8fkvrVNNAXzAZNbHz5N4CojECMrqUJVqYMYiMaro3hTSh93ifaaQa
 XZwymWtZAF5r5fjYDxoQfxgBDwsrJ+DJMbXURYjcQX+7tdru4xwSDdEYfIB4ftoZAWW3
 odapVHwJEugfsQL3deagFHvaMemeZ1/ffZNaL8ml9YhUlAPZWcmqAc9Ldb9FPwIY49F5
 nCg4ELh3hzoGogZjdC9IsUHrjWxHgtGLNK9IssYFB3ec8/8vdv8bxlDIDWrs/Yk59fX7
 Perw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=8KnwDCFnDP2p4VznLGchEQ7MhbCDHoouF9hb3OmMvFo=;
 b=n+wjN09AMO/DSgSbcRmkDe2EYw7fC8n9BotB80ztABkOdyO8lyoVTK+B6UFqcEB5hm
 BCIy8CFDL8UIOveXF1usQ3SfLGBW/bdkavPNSlVKBkOVZy6PTgTNiReIVe6hKZxfL+K/
 9X/nUifqFIlwtIWO/flg7uDx7MjEX31oPGlaOsxRVizW8BbPBAI7gXv1pUTF0tv0m2QM
 SzUBORpYVQCRC82GHRmeqXHl35eJ2HAdwbWORZAkJ9t+013b+p2ShPiWU9UFmqbETLcz
 93fB9HN87I+qeTJ+AnECtA6pRwf83WnmABB8E59pbA0AdJgDuhMnC/OlXhz+WXBRDnsC
 NXdg==
X-Gm-Message-State: AOAM531WmS/WicnH7D+NsbwvTHhjX9FQwYefXgEKgan895RZKuN+7JeC
 rXd/WHyykGe257LWdp7L50bbG71bajA=
X-Received: by 2002:a5d:5381:: with SMTP id d1mr41607272wrv.177.1593874204051; 
 Sat, 04 Jul 2020 07:50:04 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id r10sm17135019wrm.17.2020.07.04.07.50.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 07:50:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 08/26] hw/usb/hcd-dwc2: Restrict 'dwc2-regs.h' scope
Date: Sat,  4 Jul 2020 16:49:25 +0200
Message-Id: <20200704144943.18292-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200704144943.18292-1-f4bug@amsat.org>
References: <20200704144943.18292-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x443.google.com
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
X-TUID: 9wGdm260JhH7

We only use these register definitions in files under the
hw/usb/ directory. Keep that header local by moving it there.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 {include/hw => hw}/usb/dwc2-regs.h | 0
 hw/usb/hcd-dwc2.c                  | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename {include/hw => hw}/usb/dwc2-regs.h (100%)

diff --git a/include/hw/usb/dwc2-regs.h b/hw/usb/dwc2-regs.h
similarity index 100%
rename from include/hw/usb/dwc2-regs.h
rename to hw/usb/dwc2-regs.h
diff --git a/hw/usb/hcd-dwc2.c b/hw/usb/hcd-dwc2.c
index ccf05d0823..252b60ef65 100644
--- a/hw/usb/hcd-dwc2.c
+++ b/hw/usb/hcd-dwc2.c
@@ -34,7 +34,6 @@
 #include "qemu/osdep.h"
 #include "qemu/units.h"
 #include "qapi/error.h"
-#include "hw/usb/dwc2-regs.h"
 #include "hw/usb/hcd-dwc2.h"
 #include "hw/irq.h"
 #include "sysemu/dma.h"
@@ -43,6 +42,7 @@
 #include "qemu/timer.h"
 #include "qemu/log.h"
 #include "hw/qdev-properties.h"
+#include "dwc2-regs.h"
 
 #define USB_HZ_FS       12000000
 #define USB_HZ_HS       96000000
-- 
2.21.3

