Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp3786240wrm;
        Sun, 20 Oct 2019 15:58:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwkuOxrvFw8B9vcBTFhU+Dnqa7D3ABuiQsg8fjt/REdFJSgZ+GM97uJnPjVsH1Uh2W3kvKw
X-Received: by 2002:ac8:82e:: with SMTP id u43mr21929219qth.176.1571612301841;
        Sun, 20 Oct 2019 15:58:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571612301; cv=none;
        d=google.com; s=arc-20160816;
        b=Vrnb9mpWzMeZSFK9XovFp59J6KS3ZzbXx5OiBmtHKS7AgwwQ9hndxiUsfEtBQYOe+f
         VtPnmkqfb9NY4L10cQT6qavieS4cleIgkCSwlVI3iZ0lHwHLoHrb+vwm5cYZGJXdDy1b
         qqvEr59/2/nLAnkIT+Q/uU1rmhLO7VkWCEShUpu3g2zWknHgI0FPjC1eF+ytw8dGMyjH
         9hgNVf5Ag1Dk65IoL+e+MbF3YrPESe4mfaOSoOQlBx19nhjAuv6cVQpmnp6wqZuAVE22
         IsJC4yTunGYsdeaVjaGPMx1nG8sN0uuJRBD+GRf2ovpYa1KtVM6KTEM/okFLWbRAtTAV
         Gy2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ZiO2C5es1NYJxD/UQgZc/eWnlcXJHpGVMpR68/XdhKU=;
        b=d1zucDNN0bmPttaLt2qRzg0OqD+rzYNfaTDOcmISVSpXNVE2Z1cLZ3bk5KxbQaNrFW
         4d7z+aqavVwlNI6Dnpl4JkorcqklCe1GvRY+CEI/zJsrpPIRed0zwj3kV8hLm/1TZBPo
         +nFgTZg2+7Lw0EI3r8w6Q/q5f2Qms0PL0YxH8SY26+Dq6dsBoM3k442Wma8WuT2KMs80
         6ijgkZsxUBHmzUy8S8496xPqJc8/qCl9KaAj0QDj8V9mg06y2NA8jpT2oJJPHsBe30pF
         oGrTtxrXgSK0OnvWPqb+JWc6lW0+qhyQNeFh2tEbaoD3iBpa++n6S8GiDec0uAP/txfv
         T1QQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=gUw4eJLu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n55si12958893qvc.19.2019.10.20.15.58.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 20 Oct 2019 15:58:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=gUw4eJLu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iMK9U-00073f-Ro
	for alex.bennee@linaro.org; Sun, 20 Oct 2019 18:58:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34369)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iMK93-00071y-JX
 for qemu-arm@nongnu.org; Sun, 20 Oct 2019 18:57:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iMK91-0000UM-KW
 for qemu-arm@nongnu.org; Sun, 20 Oct 2019 18:57:53 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:32665
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iMK8z-0000Sw-Mx
 for qemu-arm@nongnu.org; Sun, 20 Oct 2019 18:57:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571612268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZiO2C5es1NYJxD/UQgZc/eWnlcXJHpGVMpR68/XdhKU=;
 b=gUw4eJLurWPl6MEnxBDI+CGrPbnpqrXwXE0JV4KQJktsaXuS/hgyEStmEB6q8aMtDYsVjo
 t2w/41hJD5gqDOGmAcfmi8MvpQXM8P5v1TNc+OY6EyQXW9Qm1+2PBSej+Xkmu0IBKnAivv
 WCPCqMdBfgnQlxR+zy/nl7I94luR+Hs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-uy8zh8NwOQ2uo6L-XeNDjw-1; Sun, 20 Oct 2019 18:57:44 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BCF285EC;
 Sun, 20 Oct 2019 22:57:34 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-40.brq.redhat.com [10.40.204.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7FFF360F88;
 Sun, 20 Oct 2019 22:57:15 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH 01/21] hw/arm/xilinx_zynq: Use the IEC binary prefix
 definitions
Date: Mon, 21 Oct 2019 00:56:30 +0200
Message-Id: <20191020225650.3671-2-philmd@redhat.com>
In-Reply-To: <20191020225650.3671-1-philmd@redhat.com>
References: <20191020225650.3671-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: uy8zh8NwOQ2uo6L-XeNDjw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Paul Burton <pburton@wavecomp.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Leif Lindholm <leif.lindholm@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 KONRAD Frederic <frederic.konrad@adacore.com>, Rob Herring <robh@kernel.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>, Andrzej Zaborowski <balrogg@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Fabien Chouteau <chouteau@adacore.com>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 Thomas Huth <huth@tuxfamily.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, Andrew Jeffery <andrew@aj.id.au>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>, Jan Kiszka <jan.kiszka@web.de>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vpWG4irYa6Kh

IEC binary prefixes ease code review: the unit is explicit.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/arm/xilinx_zynq.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index c14774e542..3a0fa5b23f 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -16,6 +16,7 @@
  */
=20
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "cpu.h"
 #include "hw/sysbus.h"
@@ -194,7 +195,7 @@ static void zynq_init(MachineState *machine)
     memory_region_add_subregion(address_space_mem, 0, ext_ram);
=20
     /* 256K of on-chip memory */
-    memory_region_init_ram(ocm_ram, NULL, "zynq.ocm_ram", 256 << 10,
+    memory_region_init_ram(ocm_ram, NULL, "zynq.ocm_ram", 256 * KiB,
                            &error_fatal);
     memory_region_add_subregion(address_space_mem, 0xFFFC0000, ocm_ram);
=20
--=20
2.21.0

