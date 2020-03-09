Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1253709lfc;
        Mon, 9 Mar 2020 08:11:45 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuMaRIBCutI9uHHchWWX5e/6IYny0KcwNSeuqsUnVvU1fZ2hfmiPsNTtypDDRcCN0cHZm2W
X-Received: by 2002:a37:a854:: with SMTP id r81mr5155020qke.384.1583766705384;
        Mon, 09 Mar 2020 08:11:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583766705; cv=none;
        d=google.com; s=arc-20160816;
        b=E4hNHYJ4bOR5iy7HrbGBfcHYX1hJ+IHD2RBQ2CqknEyuptiIZluM5Y7XdC67kIk4fF
         ZXaPFAciIjhMox7FpJE6Mn9/OobYevDPdKN1S0QJtKGrX3aApUQaO732n4p+2Qaidkxl
         2y5hLxGim6rFwSyM6truHhpVNg53V5EwQm8AvOJpJNuGAyAxNlt6S1LruKfpCt/xr/QQ
         WeBdxzOf+RKU7FymvydkmFq/MNESCF14YHV8mqafw2M/zerjwhvApMu/Kp4Yllun0tPB
         FJ5E8My9DLG/SSRYniom+inRjMWcw+oh4x4/kKuOmE9esN4biQx4JcIuvFNr3bNGFwwZ
         /skw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=IflMpxdpbRtrFv7JNRMlLWar0K4DBT9cS77TO71kktw=;
        b=WlAsqLnL2ynNBb9yO2D/UO6Dk3AMDNoWYP+FTkKyIRPK0HZa3biAIVyRo0mxgPeq9e
         E2pgWmLYFs3CaqjzPhjcuTv7BogoTNHpo1BAs/8rfAae3SooekYNBXhyoDcMR/ImLDZU
         Y2steGFeWIDf6iYe6ChDNkRWZ6TWgBVzPel+V9FSUsYKHAIpxVBwILmNlhv95iW/ZSR3
         eATvPN5aNILYm4RL2LOXQtF8JRw2Kqi0NZb83XgaZkOZi4W/DlBlSNb1f45Hssy+R47F
         bkReWwV6P1VUh3iR1bccq3QNaeF7yl7IdufH26682ARl4wOFhSyH41jgUf3LhWFElkYR
         68JA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d12si6611710qki.177.2020.03.09.08.11.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Mar 2020 08:11:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jBK4G-0001y8-Q1
	for alex.bennee@linaro.org; Mon, 09 Mar 2020 11:11:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33462)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1jBK2Y-00083J-Ey
 for qemu-arm@nongnu.org; Mon, 09 Mar 2020 11:09:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1jBK2X-0007ky-BR
 for qemu-arm@nongnu.org; Mon, 09 Mar 2020 11:09:58 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:39435)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1jBK2X-0007ju-1I; Mon, 09 Mar 2020 11:09:57 -0400
Received: from localhost.localdomain ([82.252.135.106]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1N3Kc8-1jJg4w01ac-010J9Q; Mon, 09 Mar 2020 16:09:04 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 09/33] hw/southbridge/ich9: Removed unused headers
Date: Mon,  9 Mar 2020 16:08:13 +0100
Message-Id: <20200309150837.3193387-10-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200309150837.3193387-1-laurent@vivier.eu>
References: <20200309150837.3193387-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:He56TwfhJa52GOGz0EJqZEjoGZlFdNLZsoH3h/kooJRBmO3UGxH
 tKyYkftvnQTlB+T1skORNFDy8AzTmEPvISinUrtkUNnNj45ZqRv2R7bSrs3ee3Cnx5cT0WI
 YGYoZAhBpGPOwmc5FGBsBGyk8uJKJc2HOrkXlVlO1n3vR1bcnjFftYXy63DXylETT2vk1EQ
 kj11Rtk709JH9zDXwjusA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:nkohTncFmnU=:X8IHw1mNLvGEWBqMFnaX5Y
 Q1CvPz3i/rGpm7UY2HJlWtdWiMMccEFNdmxNyYsPtBR10fUnC7QXg+IykaTAjlJDO85a0+YLm
 PTJS8WiCnIvMT8h9rbKLZEyMvkwRaBmLzDHgfRFKjFKEef/UawYHvuIs9zLbao7gHResGUcof
 HSySVUlY1rFX7pm/BQ9rdcpW40AVPRKalvEETCU3m4zJbWj0xEkD/dKMpL7ZXaNwtRE15npsy
 itvmFfF+OVpVcj6Zs9m0LuHyTGnmnnhY6PVVpKdHIrXpODm06dPYsGUC5BN6fiHvfDkJKbSAU
 TElOp5Vds0k4cM8ol6aK8XeJQe/dIuzHoWaJQgJ7SBzcb+oOI0HK2KtfVOBlgoCWx33LdAM7O
 sYQCHNCezbeOxlNJNnA5FzPZQZmXiJkNbH5b5vDygWhiBRG9fKSsYkUwR6VmxSsmdrsxd5kaK
 ZWJvUpwycNp5tALkXiCsJX/IUbER+DasVzZ0tjAL0wqHYfB84yPxugjH0uC+eP61dFPw2Kax7
 tHHptPy+nUmKyEXSqbXgIPtcGs9oP8fPRtQqEe+L/+wN1j7bDNoP/4ukKPMSfmrJRBHGRFRyC
 /JEqkc2ZmCL3YmhWRCR+OhTXgIIYuNHVAXICwJh3Eq/2HwlXRzeTwBvMOgR//tZ2Fnvn3agLY
 sQ99S4XvwSGTtuZ8ayxyU3xKe2dR9VkPC13yTHJcjxB7HBqTWP/MRNRdyTOWftguhMfrADiDl
 FaVzu0JsLwDDI6hqXjJCMndVvdz/LKv3DgHT+GWGExDbi870hyEq2orl/FdIsykPpbGbKE8ut
 ADNHx6UurIWeSmhdi9OEDkFr9wyZ67jsbaAJ8V9UJZq6Cg5GDV+wFqy9eikoKHPLHnfQg/P
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.73
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, Helge Deller <deller@gmx.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Andrzej Zaborowski <balrogg@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zdAui488QIgt

From: Philippe Mathieu-Daudé <philmd@redhat.com>

The ICH9 chipset is not X86/PC specific.

These files don't use anything declared by the "hw/i386/pc.h"
or "hw/i386/ioapic.h" headers. Remove them.

Reviewed-by: John Snow <jsnow@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20200228114649.12818-3-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/acpi/ich9.c         | 1 -
 hw/isa/lpc_ich9.c      | 1 -
 include/hw/i386/ich9.h | 1 -
 3 files changed, 3 deletions(-)

diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
index 2034dd749edc..fdd0a6c79e11 100644
--- a/hw/acpi/ich9.c
+++ b/hw/acpi/ich9.c
@@ -27,7 +27,6 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qapi/visitor.h"
-#include "hw/i386/pc.h"
 #include "hw/pci/pci.h"
 #include "migration/vmstate.h"
 #include "qemu/timer.h"
diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index f85b484eac63..cb79616cede8 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -37,7 +37,6 @@
 #include "migration/vmstate.h"
 #include "hw/irq.h"
 #include "hw/isa/apm.h"
-#include "hw/i386/ioapic.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_bridge.h"
 #include "hw/i386/ich9.h"
diff --git a/include/hw/i386/ich9.h b/include/hw/i386/ich9.h
index 72e803f6e2e0..a98d10b252df 100644
--- a/include/hw/i386/ich9.h
+++ b/include/hw/i386/ich9.h
@@ -5,7 +5,6 @@
 #include "hw/sysbus.h"
 #include "hw/i386/pc.h"
 #include "hw/isa/apm.h"
-#include "hw/i386/ioapic.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/pcie_host.h"
 #include "hw/pci/pci_bridge.h"
-- 
2.24.1

