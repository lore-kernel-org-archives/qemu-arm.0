Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3398634lfm;
        Sat, 4 Jul 2020 08:03:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMrxxwedfPl+aJvxLwbGpvlKHImQkb+KZ5hnTOVoXUf2PXirwY7rkn/TrP0JUSp/kbEU8k
X-Received: by 2002:ab0:189:: with SMTP id 9mr16912318ual.75.1593874983251;
        Sat, 04 Jul 2020 08:03:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593874983; cv=none;
        d=google.com; s=arc-20160816;
        b=x3qXfGneZQwQbS5FhTG+dNT4HrJzRIKvjvpGccI856dcXudQ7bE/ARr6IWHXRs5sa/
         W7brwhbEZum05QkFp7PJePFi28vK1GRxHCH+p4ClUuzmNb8+9XR8JIHB1J0xojNcvS5E
         tXSAMF/IfMR/tnUgKSUdB1houHSIgg43YPGfV6wZPzY4FOfHJjBqhpBLdC6BjaxnAQBy
         1ASdrUwhkABJOW470bOJR4CIF7DdsQt47jqESb/pES1sKdo4LhiKsvM2O0Xjubu65sYV
         cG97zfSI5l74v3RJxvPOg9PnqvWHCT+mWavPbhGDlcjJ+jK2oHk+VoDxFIYDxa50jSyI
         H+sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=uFl2X6lG6vil8sEXKsbieCQlkH7+teoSNXY57sY2N5o=;
        b=sDB0V884rcEmeD63Hu4wrFsNDgb57Hm+WfQoSY8el1JF5KFMoOoOvxJLdRhlF0AYI4
         7n28vYRoSPRuDK/gsUH3DQK3tFPWVyVmz9cq21kjxPLWj0G/KFf9SHcqFzEwHLJHlnZb
         pjyy4betdGC4qmFLM3y8182XDQzP60INx3naGKp9ykW3WFen+tUpPAMxj+QN8vBjuVDg
         C9yaBcKBEvrOq14CZYIdYPaefkVCn6Ug3S9CyeSlI5GaVN1aDj8vaKG4m+OzaiGHnra3
         uWV0dkyciva+wMZMJb/nbOolmFY6A9khM30fo59Kj4+UlMHa8F5FcI6YLab8eoioNKKf
         DW2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pEPq0tBt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e23si1825412vsj.252.2020.07.04.08.03.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 04 Jul 2020 08:03:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pEPq0tBt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:54174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jrjh0-00084m-G8
	for alex.bennee@linaro.org; Sat, 04 Jul 2020 11:03:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jrjV5-0002lg-9O; Sat, 04 Jul 2020 10:50:43 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:39805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jrjV3-0003wo-LD; Sat, 04 Jul 2020 10:50:42 -0400
Received: by mail-wm1-x343.google.com with SMTP id w3so24607430wmi.4;
 Sat, 04 Jul 2020 07:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uFl2X6lG6vil8sEXKsbieCQlkH7+teoSNXY57sY2N5o=;
 b=pEPq0tBtl3XW/xKrGA5imilI9ZmVHCddD6JX7pQf5W26Rrv3j0GgA9nuE3yRIkzKmh
 xHXVt9A0O2Sb6wPcOQhczgtzphR+PeHVZ4Fdijl43Nrxg+v0v2Hz13FZ7aE8sOrKMSba
 lfG8A6MMb+bM+xNdOi2/2GPMz+xyBlp2BCeJ2lrXsutgPmG7wdmm6i+UpuNi8+BMpdVg
 eiQN9k6197cbsfvPjRB78ybOhM3ezQzyqGNS+gSkzZo/tgdWfPLh9B5gQMHqP+XuG+Vf
 +5B1ATevPKzMRin82a+Fpe8eN19U96Tx56oDwDoz3bikVgrPUqsQH6eHcCsfnf4o51sH
 T5uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=uFl2X6lG6vil8sEXKsbieCQlkH7+teoSNXY57sY2N5o=;
 b=G4/oks1vyZKVosOigGfJnY9zkiwETomI8q5fuFy2ge9RLDltCcENmZNQJWNvSQMSuK
 D5z2V6zjqbHFbmCBSN+r7ee4Lao1eGHcRB4s+R23G8K4wQTSDtBcvYvfgfpevlLGeCCV
 Tqx4Fmcs/mM4LSad0++MeafZO+KhZHJiNz8mKWlS9sFmmm9yKTMRmlYZ/DH/i79Uvi4p
 UBKpZO9P0MVitrmDJTvAtAjF4JL+wP/0KOcD98Ipyo+nSEy4a8kNAnyLuaydYo2mYxDU
 5aRzNPYmoTXHWCOwDPxY1tGPSGLTZ9RwxMANeD3yNXsRKsj3sObFAWwyHE+xqcohRwy2
 AsQg==
X-Gm-Message-State: AOAM531g3Hx2WTGvv8eW2CIn+FFYQFqy1BlO2I23vLX3lp37ZgHFKx3R
 Y+TbaUNqY89YkugiggcCG5XyfU0oVrc=
X-Received: by 2002:a7b:c44d:: with SMTP id l13mr43119938wmi.66.1593874239587; 
 Sat, 04 Jul 2020 07:50:39 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id r10sm17135019wrm.17.2020.07.04.07.50.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 07:50:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 25/26] hw/usb/usb-hcd: Use XHCI type definitions
Date: Sat,  4 Jul 2020 16:49:42 +0200
Message-Id: <20200704144943.18292-26-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200704144943.18292-1-f4bug@amsat.org>
References: <20200704144943.18292-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x343.google.com
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
X-TUID: UQMrCXIhyvq/

Various machine/board/soc models create XHCI device instances
with the generic QDEV API, and don't need to access USB internals.

Simplify header inclusions by moving the QOM type names into a
simple header, with no need to include other "hw/usb" headers.

Suggested-by: BALATON Zoltan <balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/usb/hcd-xhci.h        | 2 +-
 include/hw/usb/usb-hcd.h | 3 +++
 hw/ppc/spapr.c           | 2 +-
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/usb/hcd-xhci.h b/hw/usb/hcd-xhci.h
index f9a3aaceec..b6c54e38a6 100644
--- a/hw/usb/hcd-xhci.h
+++ b/hw/usb/hcd-xhci.h
@@ -23,9 +23,9 @@
 #define HW_USB_HCD_XHCI_H
 
 #include "usb-internal.h"
+#include "hw/usb/usb-hcd.h"
 
 #define TYPE_XHCI "base-xhci"
-#define TYPE_NEC_XHCI "nec-usb-xhci"
 #define TYPE_QEMU_XHCI "qemu-xhci"
 
 #define XHCI(obj) \
diff --git a/include/hw/usb/usb-hcd.h b/include/hw/usb/usb-hcd.h
index c9d0a88984..56107fca62 100644
--- a/include/hw/usb/usb-hcd.h
+++ b/include/hw/usb/usb-hcd.h
@@ -30,4 +30,7 @@
 #define TYPE_VT82C686B_USB_UHCI     "vt82c686b-usb-uhci"
 #define TYPE_ICH9_USB_UHCI(n)       "ich9-usb-uhci" #n
 
+/* XHCI */
+#define TYPE_NEC_XHCI "nec-usb-xhci"
+
 #endif
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index db1706a66c..d8b3978f24 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -2961,7 +2961,7 @@ static void spapr_machine_init(MachineState *machine)
         if (smc->use_ohci_by_default) {
             pci_create_simple(phb->bus, -1, TYPE_PCI_OHCI);
         } else {
-            pci_create_simple(phb->bus, -1, "nec-usb-xhci");
+            pci_create_simple(phb->bus, -1, TYPE_NEC_XHCI);
         }
 
         if (spapr->has_graphics) {
-- 
2.21.3

