Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1859611wrg;
        Thu, 20 Jun 2019 05:27:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzQtTTo7txCnTaEoa+KxoZGghMRKwpyiDDhpB25tYfyIj15BuQXCG0vCetM+BNzY2+yeXss
X-Received: by 2002:a17:906:76c8:: with SMTP id q8mr106764851ejn.229.1561033656711;
        Thu, 20 Jun 2019 05:27:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561033656; cv=none;
        d=google.com; s=arc-20160816;
        b=JdSIYEyBTXHae8nE+BG1kX6IQbEbq3rA9StOlfVNj9O3oyxE5l2DGGWPRuIbzn7mYL
         tL5sgdXLJJHofQ9PYLM/QGRitAwnL9mdciOrvCL2jp1+8kXN5Y0A/3EebtzB3kJPJkN9
         CfsMKhEhg4qO2BfmzgE9f6SRNbT3VTKSZ2Ds/u5MEm4yZsdTE5+/Xam6G0408AWV4P3K
         ttThu8nFBWFWaEHAY+Z4qZGmVP/NlF9NFdd1uqEY6NELETup6uvbqgYLyrD57Efq7NoA
         vkmeH7H1Aya0y6mS5wUEvHW5M+ynbJAMAwgOAgeGW1O06KtQTPPEI0oZPr0uzCZ98uOO
         CVSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=3oWvo8U5nSkeq0s+IzozgSZGfNwkPggvXpCQWRNLepY=;
        b=Ugua6VMGQSqbJqqFFLL+vfG4WJkls1OPmnzt2+qEa2EB7kcopNjfwqtoCCrT25YaQE
         U7wea8+y0TGa7yOlTw6dPBUMhYdbBH8ZuKWgmGQn4E1ObEKeqvTLSHaY3bZ1kiajPa0l
         tGQG4VD6BvBDHFcXRdyFUKBvEc51dr5DqKo01/pER7Y+HTZqxmWHc9bRKG9oI6tCUOP8
         NjOaCGIq//c+w4FFSUicK67OXHqAGDt6kiJDbOQWbCd0N4fqekSmZX+2t1J58eaqNOz8
         VywWdVWagDl2ll5CaBYTi0tv12+Wb14eEtcjCtdFvvADG5OTnPAZX4gQ9NDaaCBm/eHU
         Ryfg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n29si16024494edd.66.2019.06.20.05.27.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Jun 2019 05:27:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47300 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hdwAB-0007xe-P7
	for alex.bennee@linaro.org; Thu, 20 Jun 2019 08:27:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34906)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hdw4r-0004EM-Ki
 for qemu-arm@nongnu.org; Thu, 20 Jun 2019 08:22:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hdw4o-0007Ol-Px
 for qemu-arm@nongnu.org; Thu, 20 Jun 2019 08:22:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48924)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hdw4i-0007AQ-Nm; Thu, 20 Jun 2019 08:21:58 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 551777FDF4;
 Thu, 20 Jun 2019 12:21:48 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-106.brq.redhat.com [10.40.204.106])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 62FB35D9C6;
 Thu, 20 Jun 2019 12:21:45 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Laszlo Ersek <lersek@redhat.com>
Date: Thu, 20 Jun 2019 14:21:31 +0200
Message-Id: <20190620122132.10075-3-philmd@redhat.com>
In-Reply-To: <20190620122132.10075-1-philmd@redhat.com>
References: <20190620122132.10075-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Thu, 20 Jun 2019 12:21:48 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v5 2/3] hw/i386: Use edk2_add_host_crypto_policy()
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ee0dH+JPX7nh

Enable the EDK2 Crypto Policy features on the PC machine.

Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/i386/pc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 2c5446b095..fe99ebfe3d 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -39,6 +39,7 @@
 #include "hw/nvram/fw_cfg.h"
 #include "hw/timer/hpet.h"
 #include "hw/firmware/smbios.h"
+#include "hw/firmware/uefi_edk2.h"
 #include "hw/loader.h"
 #include "elf.h"
 #include "multiboot.h"
@@ -1049,6 +1050,11 @@ static FWCfgState *bochs_bios_init(AddressSpace *a=
s, PCMachineState *pcms)
     return fw_cfg;
 }
=20
+static void pc_uefi_setup(PCMachineState *pcms)
+{
+    edk2_add_host_crypto_policy(pcms->fw_cfg);
+}
+
 static long get_file_size(FILE *f)
 {
     long where, size;
@@ -1653,6 +1659,7 @@ void pc_machine_done(Notifier *notifier, void *data=
)
     if (pcms->fw_cfg) {
         pc_build_smbios(pcms);
         pc_build_feature_control_file(pcms);
+        pc_uefi_setup(pcms);
         /* update FW_CFG_NB_CPUS to account for -device added CPUs */
         fw_cfg_modify_i16(pcms->fw_cfg, FW_CFG_NB_CPUS, pcms->boot_cpus)=
;
     }
--=20
2.20.1

