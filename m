Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp3545304lfg;
        Wed, 26 Feb 2020 13:05:26 -0800 (PST)
X-Google-Smtp-Source: APXvYqwaEgHTz7Ix/C7pHMhWGSREkjJh+nYqgC8t1I10U1kUIEhpioDksQ1/+f2Tvj3GIixRCb15
X-Received: by 2002:a05:620a:1535:: with SMTP id n21mr1198594qkk.439.1582751126757;
        Wed, 26 Feb 2020 13:05:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582751126; cv=none;
        d=google.com; s=arc-20160816;
        b=o8rNPrgpWoBEqvx4y+i2PYuWYS3wpuVxr352oWUlbT1mihLMAMLdhosecqcLvXnz8X
         f+ax2n5FgrTJslaeXvhppAhTLcp7yyQLZE1ZgmKn9B9iBpW0wA+pscNEHZ/xfu4WgurR
         MbXVSjiEP2+hkxoJl113El2Y6YrsnqxclipvPAE+XYpFrHfA2SiwOu4iidCuwTUCDR2B
         NI6V9KLWLYZHeuhE5Q1/fQ5KbAZ9E1HP/NHNk4oKr0YTVkYIhagziMqIFfyVWSYP2qNI
         w41wh/aev/VdetH0vvYdDUyLQVLhKXU/xNFGwvhPXah3xsi7K/geRVBXxdFg8bj+nLsI
         jvVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=8xXm4j7TwKYtZiyAcQ/tren2oEWvLTLMI1I9jht7DrY=;
        b=lhIHxykxIJLPMqqHZJUhE47Mtoxg7P+s8UpHSEvYdnKCKa0IfPPfxcms4ElEXETRr/
         4H2vkWulcn/Zyz5JxC4WanBp1F1q6DcJm6TZ5dAhWSDo5TYYplHeuupzDNNj33coo3YX
         /Llnr+ffKtZrEyqZ4QBwBPaUMnnQ6yVLg96nqY6eSSaSk4bUCyJbP7JeTjunMAIPwwkY
         jPFWQcZuRMFG/Q1ZbXI3jPt+bdzWLhYdBLLhFdzfmp3d9qP0rRXq04khoHXnBc+iyEa6
         xgn2097zfGcgVzG0ePaDTlW4TGwwz1b2gHMXwpBjEnCFtuOuePLo4bGfg1i4fq1jVMHW
         BdkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=AfTNXMSK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s19si338225qkj.377.2020.02.26.13.05.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Feb 2020 13:05:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=AfTNXMSK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j73ry-0004au-4I
	for alex.bennee@linaro.org; Wed, 26 Feb 2020 16:05:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46162)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1j73nv-0008JE-Rc
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 16:01:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1j73nt-0003zi-Pa
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 16:01:15 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:34307
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1j73nt-0003yy-Lk
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 16:01:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582750873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8xXm4j7TwKYtZiyAcQ/tren2oEWvLTLMI1I9jht7DrY=;
 b=AfTNXMSKhUl97DGKLtuA0HKPLsg5BlbnmuClIQs1SQxQNlvAieR93lzxp+9vohbhlvy4zV
 fsmtCSOovaEFZ5FJ22d6pbHjpegoI4iJpTAQN11I1NkmD4G2uPeZlG3MKmIV86DdJcYrmp
 8pHJmn9e5hm4D7Q/Rn79yvj6+rSzimM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-VyYUlYW3Me63ek3UYYiuYw-1; Wed, 26 Feb 2020 16:01:12 -0500
X-MC-Unique: VyYUlYW3Me63ek3UYYiuYw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A65118B9F75;
 Wed, 26 Feb 2020 21:01:10 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-59.ams2.redhat.com [10.36.116.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F3CD463742;
 Wed, 26 Feb 2020 21:00:51 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, stefanb@linux.ibm.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
Subject: [PATCH v4 07/10] docs/specs/tpm: Document TPM_TIS sysbus device for
 ARM
Date: Wed, 26 Feb 2020 21:59:39 +0100
Message-Id: <20200226205942.11424-8-eric.auger@redhat.com>
In-Reply-To: <20200226205942.11424-1-eric.auger@redhat.com>
References: <20200226205942.11424-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: marcandre.lureau@redhat.com, lersek@redhat.com, ardb@kernel.org,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: C9s959/tkQMf

Update the documentation with recent changes related to the
sysbus TPM_TIS device addition and add the command line
to be used with arm VIRT.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>

---

v3 -> v4:
- s/later/latter
---
 docs/specs/tpm.rst | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/docs/specs/tpm.rst b/docs/specs/tpm.rst
index 2bdf637f55..da9eb39ca9 100644
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
+used with pc/q35 machine while the latter can be instantiated in the
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

