Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp2883125lfg;
        Wed, 26 Feb 2020 02:29:07 -0800 (PST)
X-Google-Smtp-Source: APXvYqxe5EChIHyZPAYsHbqUtQ7ZA0Y3HOu5mPlcg/uPC6LyoxPVc5EPbkQvB7VTQmfoE8yKC8Fd
X-Received: by 2002:ad4:4dc3:: with SMTP id cw3mr4171015qvb.130.1582712947038;
        Wed, 26 Feb 2020 02:29:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582712947; cv=none;
        d=google.com; s=arc-20160816;
        b=ZIMJRbtOwG4Ejr2rD+E/7/P9/m0tykSsAlWOPM6ucZdg/hVl9AtLzyeag90CS44eXT
         YWv+6800HrRXCEQyimD/2DssDMWulVKoI1DMViW2b/lxdd/VkDuEaindS1wOZ9UV0IgG
         SvKVBUghoHv32vQrCADvUPlGLK51f6SzVuhiyet7BM6mlmJlbK32xQViBZYn8lzELvXV
         bzcsP9j9xqmXO+9T4xvd1kY0+ridG8SDv8VtpyOUaaploHGhIHWbtK484jPLQkYkYU1e
         o53lwHNu0RuK2aIEhE/JcfkZfJGns3Z2YmPJlGjuy768banobbiFmeL5XIqZTsqukyYX
         8s+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=IwQmZv0xaQVkdsJzKqedRVySFq+XxBho2HOp8v1kkcI=;
        b=RZOyLpW4CCNNwzTvIV3j4/RTW95f8f7AisTorFyzHty8Ft6jjfDxl4OYHVUg1AwzY4
         muAHUa/dlf6nTFUJ8czDRBhL2X3jT6dnRj6Az7We343iGkCDl1G2ZO5rD287X6EtsVIN
         2ST/TOEmnyJcJfFwxvG5fCEfEq+pLihty+1F6Wwnp7t7HPTOTD8PamonJiM3srsi+856
         ezRo/iKNgUC28b6Bp+URgiytoC4zQE1VX6mISOTLFMRfLTmtnodqzrKb54srfF99YFxZ
         SDJY8x8utOvVQ8gfbQw74Ib4K/yo/iblsakIWvWSfFjNePdXkAhk0kFXLzVMMETzvDk5
         kmRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WmG7ZK4k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v54si873336qtb.404.2020.02.26.02.29.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Feb 2020 02:29:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WmG7ZK4k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6tw9-0001T7-O5
	for alex.bennee@linaro.org; Wed, 26 Feb 2020 05:29:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52240)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1j6tti-0004vF-K6
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 05:26:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1j6tth-00048y-Eq
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 05:26:34 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:40677
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1j6tth-00046a-94
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 05:26:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582712792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IwQmZv0xaQVkdsJzKqedRVySFq+XxBho2HOp8v1kkcI=;
 b=WmG7ZK4kLnFSdivqZYmcoLNMR/bJi1uHgenRgyrQXmz6I0SQPwPizwaSCrW6i0Nzmeulra
 HPmaoaTq8mmtVzb75YIq76DMUgPOHfZFtzfNPHhCtc7dJGYBbPzQyqBhdYsZSPz8KPcySM
 mCV3/d+Jmc5bG28g8bWHLL0lUjz+jdM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-CqJTAGU5PJOICpJIJRwGBw-1; Wed, 26 Feb 2020 05:26:31 -0500
X-MC-Unique: CqJTAGU5PJOICpJIJRwGBw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A98D800D54;
 Wed, 26 Feb 2020 10:26:30 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-59.ams2.redhat.com [10.36.116.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C05F860C18;
 Wed, 26 Feb 2020 10:26:27 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, stefanb@linux.ibm.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
Subject: [PATCH v3 07/10] docs/specs/tpm: Document TPM_TIS sysbus device for
 ARM
Date: Wed, 26 Feb 2020 11:25:46 +0100
Message-Id: <20200226102549.12158-8-eric.auger@redhat.com>
In-Reply-To: <20200226102549.12158-1-eric.auger@redhat.com>
References: <20200226102549.12158-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
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
Cc: marcandre.lureau@redhat.com, lersek@redhat.com, ardb@kernel.org,
 philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 681vUFa4RGzF

Update the documentation with recent changes related to the
sysbus TPM_TIS device addition and add the command line
to be used with arm VIRT.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 docs/specs/tpm.rst | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/docs/specs/tpm.rst b/docs/specs/tpm.rst
index 2bdf637f55..932cb57049 100644
--- a/docs/specs/tpm.rst
+++ b/docs/specs/tpm.rst
@@ -18,9 +18,15 @@ The TIS interface makes a memory mapped IO region in the=
 area
 0xfed40000-0xfed44fff available to the guest operating system.
=20
 QEMU files related to TPM TIS interface:
- - ``hw/tpm/tpm_tis.c``
+ - ``hw/tpm/tpm_tis_common.c``
+ - ``hw/tpm/tpm_tis_isa.c``
+ - ``hw/tpm/tpm_tis_sysbus.c``
  - ``hw/tpm/tpm_tis.h``
=20
+Both an ISA device and a sysbus device are available. The former is
+used with pc/q35 machine while the later can be instantiated in the
+ARM virt machine.
+
 CRB interface
 -------------
=20
@@ -325,6 +331,23 @@ In case a pSeries machine is emulated, use the followi=
ng command line:
     -device virtio-blk-pci,scsi=3Doff,bus=3Dpci.0,addr=3D0x3,drive=3Ddrive=
-virtio-disk0,id=3Dvirtio-disk0 \
     -drive file=3Dtest.img,format=3Draw,if=3Dnone,id=3Ddrive-virtio-disk0
=20
+In case an ARM virt machine is emulated, use the following command line:
+
+.. code-block:: console
+
+  qemu-system-aarch64 -machine virt,gic-version=3D3,accel=3Dkvm \
+    -cpu host -m 4G \
+    -nographic -no-acpi \
+    -chardev socket,id=3Dchrtpm,path=3D/tmp/mytpm1/swtpm-sock \
+    -tpmdev emulator,id=3Dtpm0,chardev=3Dchrtpm \
+    -device tpm-tis-device,tpmdev=3Dtpm0 \
+    -device virtio-blk-pci,drive=3Ddrv0 \
+    -drive format=3Dqcow2,file=3Dhda.qcow2,if=3Dnone,id=3Ddrv0 \
+    -drive if=3Dpflash,format=3Draw,file=3Dflash0.img,readonly \
+    -drive if=3Dpflash,format=3Draw,file=3Dflash1.img
+
+  On ARM, ACPI boot with TPM is not yet supported.
+
 In case SeaBIOS is used as firmware, it should show the TPM menu item
 after entering the menu with 'ESC'.
=20
--=20
2.20.1

