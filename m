Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp1003685wrs;
        Tue, 12 Mar 2019 15:57:33 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzB9vieQahlGo9WJiSNbcBsvKZcuAz+sGOYvk2enfM8i/FPUWFYNn/qFerQg0WFKtY8Z+Us
X-Received: by 2002:a25:3b07:: with SMTP id i7mr33142755yba.343.1552431453623;
        Tue, 12 Mar 2019 15:57:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552431453; cv=none;
        d=google.com; s=arc-20160816;
        b=apBVDYI97MdLo9tPK178PDNHLkIeew5rXDxjNVQ9Gzd/ZroCgJvHzZbYayx2JLB8tN
         HvQxk9O5rwQVqrkdlcFd1TdrJ6DxhWD0OC8UIo6BcU2NxlPmgmyPxiJ62IuRrj4RGsGn
         HpoHaorDljPTOflnj0udDeJ2IQuKHgVjkoa/X+/qjXAnFhHHKy+YT6qXMBi+g/gkqCOW
         2kvnXrWctkABh9MGDtZLSAX6NHcaakjfKJIjXAQhTyIEx9oxD67ZzX2pO9oEvKvadTyJ
         D5Gj0hTvgYMfhlhhmVzvM96vHCculnfW7SXXojr92AyjbVyWo6NyUEoyi6K4dyeZ6ZHh
         zLHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=Jelna1Z3fNkCUiQTwLS0ltYoiKSH9uQpexDwtLBIFHo=;
        b=x7jeThxV9CG8USbduRYoE1vEf9+Qu1lbhh+uAITw+t8TVmJ8XSP/wOI9YRIUUuv0Bd
         vLqr3YxQwvIH/UdElVok5fzd+Y82kgPmMVh642Z2Nf4XLfttZAIbltnVBreH+u5ZH+Er
         ZbmQAu7wyfl9MK5tltii36cHcyMkfgg3jvxGAJGDMz7zMWXzLVzm+DfSdpDFPCHD5o6b
         VHaQPb8nn6DhEGeb9rYPdTd8vZDy19hRDcL2fCOKP9ZEElE7IbszWHUhrykXpF77BayW
         e7pKaQYCiQwDhBeuugZ/JF/VudA0HiigNEGhwDiIAByURoTsYUwQNqmGToW6n8csmv1c
         pyUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 203si5558612ywz.26.2019.03.12.15.57.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Mar 2019 15:57:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:34690 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3qKz-0001wf-6Y
	for alex.bennee@linaro.org; Tue, 12 Mar 2019 18:57:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48774)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h3qKq-0001wL-KJ
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 18:57:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h3qKp-00065u-Jd
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 18:57:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37010)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1h3qKp-00065O-CZ; Tue, 12 Mar 2019 18:57:23 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9B9F33091799;
	Tue, 12 Mar 2019 22:57:22 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-23.brq.redhat.com [10.40.204.23])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C8D769190;
	Tue, 12 Mar 2019 22:57:08 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 12 Mar 2019 23:56:31 +0100
Message-Id: <20190312225632.29777-4-philmd@redhat.com>
In-Reply-To: <20190312225632.29777-1-philmd@redhat.com>
References: <20190312225632.29777-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Tue, 12 Mar 2019 22:57:22 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v4 3/4] hw/i386: Use edk2_add_host_crypto_policy()
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9AxvEvLB37Lu

Enable the EDK2 Crypto Policy features on the PC machine.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/i386/pc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 1cdaff5f4d..f0bef84ccf 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -38,6 +38,7 @@
 #include "hw/nvram/fw_cfg.h"
 #include "hw/timer/hpet.h"
 #include "hw/firmware/smbios.h"
+#include "hw/firmware/uefi_edk2.h"
 #include "hw/loader.h"
 #include "elf.h"
 #include "multiboot.h"
@@ -1047,6 +1048,11 @@ static FWCfgState *bochs_bios_init(AddressSpace *a=
s, PCMachineState *pcms)
     return fw_cfg;
 }
=20
+static void pc_uefi_setup(PCMachineState *pcms)
+{
+    edk2_add_host_crypto_policy(pcms->fw_cfg, &error_fatal);
+}
+
 static long get_file_size(FILE *f)
 {
     long where, size;
@@ -1651,6 +1657,7 @@ void pc_machine_done(Notifier *notifier, void *data=
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

