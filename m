Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp588779wru;
        Wed, 25 Jul 2018 04:30:30 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdvHqpFxPaFOxaeaUtXoMcOC1k4jxt/vn958XIl6PJ8nZu1ogA6vArt39bgxtkTA734/jK6
X-Received: by 2002:ac8:17c2:: with SMTP id r2-v6mr20690019qtk.145.1532518230332;
        Wed, 25 Jul 2018 04:30:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532518230; cv=none;
        d=google.com; s=arc-20160816;
        b=Yj6ge6tggpqfKQdfh61C/03/v2IYB/6DRTJAnlBKbwQuOvi7p6OYcawuuo1bilRgfE
         tD/l/i8NFzb4J0tFspSWu4F0j6AO7BlD7WIJOBk6rMty0d4p9muccz9vRJR3Mv7DajEx
         uGeIbV3vFcmG1trzU+61E7+8I6k2SxyjanE93GfxA33tauLFfS2EJz8YCdNtq+DnYioC
         PLUZorKdmZX0S4KG859PtNiQZ5iOCMVA1ucUS66DWsv9ybJtGOudu+v+2EcZq4HC3A0U
         7QPYuxVZz5X/HU0hqYyssGxG/d1G22foaWAVaRdOdg+FGt7/Zf6ZFqtMa3RVV4mGDOWO
         bmTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=DFCnjXkPGrDre0GQAvZhQEd0cywkwGemxDp7LD0NxmY=;
        b=ywYkZU4SdRdYuRqqeFx1GaLWIYtppE8h0+jLCHWbmiEXG/nS+VWvYDyAoyk2OrDcMs
         gVdYmCLObKT/cOp8CWpnNbZgKqUXPP2L173qK9TTLRIG8HRsSc9DTac6oN0dlZQGixid
         BMywmxxiAWlu3efZour0iS9Hwmv+s/vTAtLWoOXoBI+LDwgnOBGQ8TAAiLhZZrfRN+y2
         GeOKGDOIZtFmJv93rWDG7r71kgeQ6NNBViKwaI6Xxeyy0jtWZuapxVTeoW0xbsI+BQ8I
         bPH+Y+7CD7L687M0fwQ7DtcRqzgZ7ILbmsIuq1NkY/t5M11QB7v5qJlluVRPv5JaDc6X
         cNfg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s127-v6si3757575qkh.181.2018.07.25.04.30.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 25 Jul 2018 04:30:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48238 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fiHzx-0000Ge-RA
	for alex.bennee@linaro.org; Wed, 25 Jul 2018 07:30:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55583)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <geert@linux-m68k.org>) id 1fiHze-0008At-RO
	for qemu-arm@nongnu.org; Wed, 25 Jul 2018 07:30:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <geert@linux-m68k.org>) id 1fiHzb-0000TR-RR
	for qemu-arm@nongnu.org; Wed, 25 Jul 2018 07:30:10 -0400
Received: from xavier.telenet-ops.be ([2a02:1800:120:4::f00:14]:58040)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <geert@linux-m68k.org>)
	id 1fiHzb-0000Jc-KI
	for qemu-arm@nongnu.org; Wed, 25 Jul 2018 07:30:07 -0400
Received: from ramsan.of.borg ([84.194.111.163])
	by xavier.telenet-ops.be with bizsmtp
	id EzW21y00a3XaVaC01zW2S9; Wed, 25 Jul 2018 13:30:04 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.86_2)
	(envelope-from <geert@linux-m68k.org>)
	id 1fiHzW-00020y-BX; Wed, 25 Jul 2018 13:30:02 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
	(envelope-from <geert@linux-m68k.org>)
	id 1fiHzW-0002sQ-9X; Wed, 25 Jul 2018 13:30:02 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Peter Maydell <peter.maydell@linaro.org>,
	Eric Auger <eric.auger@linaro.org>
Date: Wed, 25 Jul 2018 13:30:00 +0200
Message-Id: <20180725113000.11014-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 2a02:1800:120:4::f00:14
Subject: [Qemu-arm] [PATCH] hw/arm/sysbus-fdt: Fix assertion in
 copy_properties_from_host()
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: linux-renesas-soc@vger.kernel.org, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, Geert Uytterhoeven <geert+renesas@glider.be>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: buItYDw1TJoJ

When copy_properties_from_host() ignores the error for an optional
property, it frees the error, but fails to reset it.

Hence if two or more optional properties are missing, an assertion is
triggered:

    util/error.c:57: error_setv: Assertion `*errp == NULL' failed.

Fis this by resetting err to NULL after ignoring the error.

Fixes: 9481cf2e5f2f2bb6 ("hw/arm/sysbus-fdt: helpers for clock node generation")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 hw/arm/sysbus-fdt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/sysbus-fdt.c b/hw/arm/sysbus-fdt.c
index 0d4c75702c3ddfae..43d6a7bb48ddc351 100644
--- a/hw/arm/sysbus-fdt.c
+++ b/hw/arm/sysbus-fdt.c
@@ -107,6 +107,7 @@ static void copy_properties_from_host(HostProperty *props, int nb_props,
                 /* mandatory property not found: bail out */
                 exit(1);
             }
+            err = NULL;
         }
     }
 }
-- 
2.17.1

