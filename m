Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1264630lfc;
        Mon, 9 Mar 2020 08:22:09 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuvrRxzuwgpSkTtZjXrtLPf6KyCAhOfIpJ2qUYd7zj4taTSb5DqVRcsHxUrPlw5B0LF02jt
X-Received: by 2002:a37:52d5:: with SMTP id g204mr15822192qkb.401.1583767328863;
        Mon, 09 Mar 2020 08:22:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583767328; cv=none;
        d=google.com; s=arc-20160816;
        b=RSslico3xKIQxm/XFA9He28/2WZjqqhdiMncNLEHje/saRDiedBdM0ivPMvRYLmqIJ
         ORXi2XrcwjAgRA85wCY9/ctp6JWhhJHsU6DZ7xzl5/7dpZW/60IQIWQD/B2dmQvzBBZK
         6hSa7QhqWukzvuhZTzlKx1gyS+eMyX3uSEBIxB1kyR2GFePTdvpx7mfACgu5qkHOOB1j
         JJxodnbeyruR/iLuYqETCWuJvaV/CiQglhW1nDFquKE8ZTLrQ3uq7FhRMX+tmJ3AzW4w
         F8ia+rNGBCG5xkLZH0lX6y4kd/+meuicCosHpHib8wX91gnpvdfcUCQUk2KVgdrCla/0
         QhoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=HhgxekuAy2dWE9AKEEvb7MqaXKqMSCyHxk9SikLqCdA=;
        b=c8NZssdbdE9bkCxgFaP0q+ivCi2BqX49z1HWxRjoLN4v5P9OCrIo8tajR6qKAMaQZL
         cH8Ix+Z2h0FB0zFGAUeTicrwzXuAUMmxHFc/OXqhZz0E7M2siz+f7XkhubRpEpbCsvmu
         m+vprCFYpiHOIZpsXF+mHqb7JijwDomzFTUXYa47BVWKigBIHyTUik8SgKd8LulajQTt
         HGEKdwC47bItqxytHWkDPJoLZeXORr7rq0BbSvhxs51Tf2gUW7TAeN4bfxn8P5qmj99h
         DDprwIaXx8iJjcs82xHCiRB25EmHJfcm+2QRlweg5LWMmW9ZE1GWXBTZBwn/FphnKA9m
         zN0g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t25si5857477qtr.245.2020.03.09.08.22.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Mar 2020 08:22:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jBKEK-0000wJ-5p
	for alex.bennee@linaro.org; Mon, 09 Mar 2020 11:22:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33765)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1jBK2v-0000DG-D9
 for qemu-arm@nongnu.org; Mon, 09 Mar 2020 11:10:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1jBK2m-0007yp-2K
 for qemu-arm@nongnu.org; Mon, 09 Mar 2020 11:10:14 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:45891)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1jBK2j-0007wA-AA; Mon, 09 Mar 2020 11:10:09 -0400
Received: from localhost.localdomain ([82.252.135.106]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MA7Su-1j4CU42fhi-00BePM; Mon, 09 Mar 2020 16:09:22 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 17/33] hw/acpi/cpu_hotplug: Include "hw/pci/pci.h"
Date: Mon,  9 Mar 2020 16:08:21 +0100
Message-Id: <20200309150837.3193387-18-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200309150837.3193387-1-laurent@vivier.eu>
References: <20200309150837.3193387-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:S3Pxp97NJqxzqXNktaGYJQ8nZy3lTVUpo6FHg9n/lfsaCvu/jCM
 RKXtM+9/sl1lC2UU6z7Enz4ywq6EsJjd8jmR99TVnhXddFlNXJAfZ4rY8qlWfkvFQEKXdRg
 c7cUkeAM5h7ge/pao0QIN67+RJChKjZud8czO47cpDyjw3l3mCHTLkZROLm8cPqoP7SiOci
 rc5taa+9BnG+goLi7rNZw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:kUTho+sfP00=:/RR78Ov2r4fg9Mqs6/P7t4
 QgRnn/05kM+qVunwSFPMYuoO5Br0L0OTVPvk1DS676JqeEV56ko4pVlxa1kvlYpLNvDqPEZnJ
 EODUyOZ0j+XugzoxYTuWhM/rSTm4gf0BIyDTaQ0AHRxpvt8Zc0wObIL5maaRB8bRN5ZQ5vS5A
 FThsEhNNb17Jbm7slqX9UcIgU+Cwkl96gUY/fdObfmxgpfIf4D1GEQN0EqGJbr9qTPCtIj5WB
 CtiioVkafDYGjbZF0cmKKn7ofELdaMPv5UvesCCkCbV3R3CTaLqWIJhCCYqOKlQwnpn44Ah7y
 PM8W0pnKFKHCqwBVmObIaXLjatJPiF9Om2kqBDWtBPeE1JbJ2fmyyPtrhZ/lXdhiqECEMi6PN
 vCjR/VkUlgIIdI6eFw/dMWGCS76yRPRvbr5FsoCrYRzysysWyugFKiiG2zDIaaTSbsz02kt1I
 kIYiHF/Oy1Zh8ZCXs3FiDTiRRoI3BGPZ5MJFeYGJle33GiiiV1zOtOspmbZ5eJXlXjyjxxs1z
 +9KU9V4FXQZe7WLyT3WDbbzZVa+/ucWq7eLub7mlARtam/W1qxY/A7ba1zELPDxlSCoHwiDGJ
 N74YEd4habXjkT7oN8S1PndzYEQd5LUsAVn1vVBiKy43OGA/Qe9ofUsXDYi3KOau1H552s72j
 UEQFI8vq603b0sgjyoJjYVsdKzT6cd9t89f0pzhWTt3kNZgjf13BF3GP1GwKUvv1MbsSJtMsW
 CTfGXauFq86rDTjUyWZ6Le1A7oTqq9ssGDrTLFmn5Gnkmo+JOc6ea5S6vc1t8205n1gq9YUoK
 D4Stg6L6QqvSDiFVeQWV6BKsghc9C+sMS/0o+ndV7aa5OcaH6acMjEgSon+7ZKpowbkUo/l
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.10
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
X-TUID: Gs7NRAq70hQr

From: Philippe Mathieu-Daudé <philmd@redhat.com>

hw/acpi/cpu_hotplug.c calls pci_address_space_io(). Include
"hw/pci/pci.h" which declares it.

This fixes (when modifying unrelated headers):

  hw/acpi/cpu_hotplug.c:103:28: error: implicit declaration of function 'pci_address_space_io' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
      MemoryRegion *parent = pci_address_space_io(PCI_DEVICE(gpe_cpu->device));
                             ^

Acked-by: John Snow <jsnow@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20200228114649.12818-11-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/acpi/cpu_hotplug.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/acpi/cpu_hotplug.c b/hw/acpi/cpu_hotplug.c
index 9c3bcc84de56..3e687d227a65 100644
--- a/hw/acpi/cpu_hotplug.c
+++ b/hw/acpi/cpu_hotplug.c
@@ -14,6 +14,7 @@
 #include "qapi/error.h"
 #include "hw/core/cpu.h"
 #include "hw/i386/pc.h"
+#include "hw/pci/pci.h"
 #include "qemu/error-report.h"
 
 #define CPU_EJECT_METHOD "CPEJ"
-- 
2.24.1

