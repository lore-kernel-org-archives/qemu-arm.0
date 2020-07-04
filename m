Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3392889lfm;
        Sat, 4 Jul 2020 07:54:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrdop0wYowY3GCrhWoUUsBIlsAfRJwQrQS/qRh2lkkJutDyrv10RG+JbKoXvOWl75u0989
X-Received: by 2002:a25:16c6:: with SMTP id 189mr9498252ybw.515.1593874460405;
        Sat, 04 Jul 2020 07:54:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593874460; cv=none;
        d=google.com; s=arc-20160816;
        b=JB8jqyBy4E3xHqyKUX3JdjEZAk3l3TW5X3DbaS2/kjGW9gyIXYQW0OfKCobOHPwFbq
         R7yYX1jbsQhl8N/BbzUsQxbVTXVwHeWtQI2NQDXoY8yk5NRV4Lh50LTrSo/D3cPC+XjD
         XuK8/dd6CM8VuwD+RcUQ0yItsoeDfObqJWBu24RG62TWFNFG+sJb67a7SfaQJS6jWi94
         4rUvKJIT27EKDsWUsfR0qwGyStCJIQ7JI9oYKADc58d5+EDTwRahEY4wHmWgnSEqyfHv
         Sgp00ELS+nfl238LPv6l/TyqqNr7VW5A21RdANKnJZzGttncqTlgZEI7iVXp7NNpEZEt
         fZ0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Ci3lKGhT7CaGmfO0merQ+/KTVofaj9NyV7u1/2UAP3w=;
        b=kyjktuGfqu3z81xqfUqSIXuMbO7cRU/I76UIWP8Zk/ID97TTYVOaG/cVOklray79cs
         y7wInNP4aICRQH0EjUYyu8M/hIYs8c53GD+AQGxKcFnUxegZgLDRofLomRdMA2xsGYM/
         y/7U9r2k2t8V4HHphR5q7HSgjFxRt7W9W5wIW+bz2kOd7qTdOdmWJfT7WKCOECWtXBve
         DPAKVVMkcY7uxF8QqekuHWnBHkhuWX03tZULrFofxx351aHGEcadwwVA2+C8I/1TWWex
         +S4K0DOAHijZqfV8WcJ0vy0i0WlKnfizzj2BCOCSL1gjZQwJRuIOOnijLMfGsZBQoRQZ
         r/WQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=HTr3GqMe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f67si15339274ybi.238.2020.07.04.07.54.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 04 Jul 2020 07:54:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=HTr3GqMe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:47552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jrjYZ-0001iQ-PB
	for alex.bennee@linaro.org; Sat, 04 Jul 2020 10:54:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jrjUR-0001O3-Jn; Sat, 04 Jul 2020 10:50:03 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:51872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jrjUQ-0003ei-67; Sat, 04 Jul 2020 10:50:03 -0400
Received: by mail-wm1-x342.google.com with SMTP id 22so34725142wmg.1;
 Sat, 04 Jul 2020 07:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ci3lKGhT7CaGmfO0merQ+/KTVofaj9NyV7u1/2UAP3w=;
 b=HTr3GqMeiMrHSFVz09gNzzyGE5/NusjcYwPUPJ9+Az6tEcg4A2YjJthJc8BKS0f3xF
 F4+ebiouyz8NRclvNRqup/GDrEN4F9p2jviH4u+BYG+0fxPmcN8XcbhSAoh6SFqU4Zw0
 FH/IpcWFj2yRtZ9xJLuf96x1ST8pDEf9hbCzZCPwmk0sO+6vtZTFj/sU4oryrL3pJ5Li
 Z1W2ONSpiFn0BO3jkg80P04ozix3y5MCMrcei0bm8NOU72QICc6nO3mwQ0RF77ptyVlN
 TnLG2rz47FkHMnveffGYGtgCStlP8At2zi6ngwyWWC2wn+upypNWXZkbAwAcNzprcGts
 BnOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Ci3lKGhT7CaGmfO0merQ+/KTVofaj9NyV7u1/2UAP3w=;
 b=Kb9v1U6mGsTXsiE3+y/DLxrVcQi6C+fuzR1X2rwiwULahaNzv+nE8yHV3ulU1cFy7T
 R8sazGRHf68MeNb+Cl0uXWIgICTSeyDG8BzNV88NiZtYqRxqpDBEtUbSe3x2BEJB/jBf
 6bpLtk7xbmJK0VZWF+/nwn+cIMoVCCTpfK84jjFvnSqmunWcYCvci6lVplB6kn1GQ2m9
 INCHcUPetfyl2hA/T/I0lb6N/6xluceskpZQ4iAPuysyCWxG2Kon/n0hFisMYK2ANrzd
 d8dgcaTwolUjpUG5W5Hei40TUZUjluMgbO7th0HKvSl+wx67biaeEJTir56U35lq9zvI
 u/rg==
X-Gm-Message-State: AOAM533v19+oeYkHUkukusKgniNY6HhXd6p2J4jIDpgoNiczizkyz+xd
 IibAOiHhC8+qtsSTUrUA2HvKOmOdvlM=
X-Received: by 2002:a1c:b386:: with SMTP id
 c128mr43397378wmf.133.1593874199940; 
 Sat, 04 Jul 2020 07:49:59 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id r10sm17135019wrm.17.2020.07.04.07.49.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 07:49:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 06/26] hw/usb/hcd-dwc2: Remove unnecessary includes
Date: Sat,  4 Jul 2020 16:49:23 +0200
Message-Id: <20200704144943.18292-7-f4bug@amsat.org>
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
X-TUID: m5fN5BXfeK5E

"qemu/error-report.h" and "qemu/main-loop.h" are not used.
Remove them.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/usb/hcd-dwc2.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/usb/hcd-dwc2.c b/hw/usb/hcd-dwc2.c
index 72cbd051f3..590e75b455 100644
--- a/hw/usb/hcd-dwc2.c
+++ b/hw/usb/hcd-dwc2.c
@@ -39,8 +39,6 @@
 #include "migration/vmstate.h"
 #include "trace.h"
 #include "qemu/log.h"
-#include "qemu/error-report.h"
-#include "qemu/main-loop.h"
 #include "hw/qdev-properties.h"
 
 #define USB_HZ_FS       12000000
-- 
2.21.3

