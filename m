Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7817344wrx;
        Thu, 7 Mar 2019 17:49:17 -0800 (PST)
X-Google-Smtp-Source: APXvYqwYBFJ6JOh08AiAeex2qeRyNhaAFJLCChjA6W5tJgCWXKKvLnnfcwLbzhDnGjYMFEsHJ0uv
X-Received: by 2002:a81:e4e:: with SMTP id 75mr12848807ywo.149.1552009757089;
        Thu, 07 Mar 2019 17:49:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552009757; cv=none;
        d=google.com; s=arc-20160816;
        b=lZ8HsSsUt++pvJ4xjft6cL0cJXh720cNgrKRI0IN97lzf97X4rtZAT69va7DmAtupG
         ZUhXIRuDeKiY6op9Z+iM9V/ZEe1Vr2Bij0r/1FC3mC33gqMPFMYqLQkoKdQMYeLsYPXT
         e0PmvjO7EZF6V1Ay21y8aQZ3pEvLQCj57IeKyy6MmGWRRyz9sMOq81NR1Ajr2pPmNpPn
         PWcHnQJWWxv8ZkJkW3FkH+ghZuvw4eE1cljvbSJvCsHbWQ+b3ym3dbvQ9FYERxdKCCec
         VHiCVuPcKBjTXhmmNEx9bIN9Z9dNCOG8lXL9zTKPDOf9FOgX2QxqxCcdWQaMOercWe0v
         xxEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=xrblaWhgpe0D4fLPkRoHXGZsrsswnLC7KogUkPDw5mI=;
        b=btFE2NuIXQJS+oyAfP+TIfkyEcvHPvNeRvyzRn0nFTPemgloxX2UsbMbEvelp8CDLx
         Gf09NEuZm6XpWaUmhgd3ksScx67l/+AlF9jj8VBhL1HBtHHpgWJTP1yVk3R+H3urshgW
         mVCVoSwHWjAHduzw7ID7jlBJgv8TLcVfbvOqq4RWEZcm7r4Yn36OhDL/0gt0Qjaa/3to
         +DcQ4UboNv3itxd7dq3hR/jPNE8Cu1zWuwSAHgZM2ocZHvpFLODOQQ9xGOE3Z0e6H9Pd
         EamrewoohLkK1L8ofv+xpOhJ1NxkIHkh95x5Qmal03zsUA5p1SDowPqJvFegz3xcGF6l
         JBLg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g15si4002437ybk.482.2019.03.07.17.49.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Mar 2019 17:49:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:34800 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h24dQ-0007kF-EN
	for alex.bennee@linaro.org; Thu, 07 Mar 2019 20:49:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59289)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h24QV-0004ev-Ar
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 20:35:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h24QR-0003by-Ay
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 20:35:55 -0500
Received: from mx1.redhat.com ([209.132.183.28]:50712)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1h24QR-0003Z4-2r; Thu, 07 Mar 2019 20:35:51 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6AF343089E62;
	Fri,  8 Mar 2019 01:35:48 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.206.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E8FE18977;
	Fri,  8 Mar 2019 01:35:38 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Date: Fri,  8 Mar 2019 02:32:21 +0100
Message-Id: <20190308013222.12524-18-philmd@redhat.com>
In-Reply-To: <20190308013222.12524-1-philmd@redhat.com>
References: <20190308013222.12524-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Fri, 08 Mar 2019 01:35:48 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 17/18] hw/i386: Use
 edk2_add_host_crypto_policy()
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Eric Blake <eblake@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1DFus18ymiOT

Enable the EDK2 Crypto Policy features on the PC machine.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/i386/pc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 0848cdc18f..736211d623 100644
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
@@ -1067,6 +1068,11 @@ static FWCfgState *bochs_bios_init(AddressSpace *a=
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
@@ -1666,6 +1672,7 @@ void pc_machine_done(Notifier *notifier, void *data=
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

