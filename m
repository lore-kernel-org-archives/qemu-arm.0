Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp2156965lfm;
        Sat, 2 May 2020 13:36:15 -0700 (PDT)
X-Google-Smtp-Source: APiQypKjTABrXaDM334mz1ves1uw1oL8KzP+PUo1CJU331SQValCmv/FRu4WPaSb/f6PpeVhj5hT
X-Received: by 2002:a05:620a:c89:: with SMTP id q9mr9234475qki.375.1588451775084;
        Sat, 02 May 2020 13:36:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588451775; cv=none;
        d=google.com; s=arc-20160816;
        b=FIUenMfKUibDNRXr+Um9meJ0F8lpnetI+MDOOR6i4dicENs6tBhOhnHGB0p8VS3Xcp
         jyUZ7zLFwEnUJQ9u8TB/YO3f4S9GeVZr76RAGUzyIuCAKmJTva81KcYXvrd/9b6A1rlx
         VfWXioGmVtrRV5FWcVNbqNhz5QZ9guw1QwrCfmzXsOQMSXJAMk1B9bFQTV0JeiX5ozV1
         rPdeSVaBVPDHlzUYAVI+jsfCraiyLR+aFwbTg0DvamqiekniIzoialFuFmM4kGmNAps5
         MWG+gz+TVoY/ySGNREGL0sHkqJskyI/BWWiqqIPYRugeZoagdsErIBJ9VgyIySZeQ7yg
         Bqbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=/ZkwrtF/bP/f6NIy006ewNhyBujezKdvG5zAeAtfZTk=;
        b=GSDN90rN1EbHrGNeG0+0hDPxqKMlhms/j+lU9+U41lvRT9DRxWRz1h5tY95rarWaZN
         je3suIhW2lS7JebN/ARdIJOi2PpxD++u+iafD9xI7sJqG+stPKveIIafBkQol4IcQF+P
         TaOJhpoyWOUh2scr9efRAZBkRCEQasJFmXmVjC2gt0m5HO8KTHoM1GL5b0NxE/v57Hny
         JkcbJxsx4EskrKTZkIu6hKcQEabYBS5glDu9S0XSnlEn4DKr1uUCfG6kNpooxAnaJorJ
         HDxJEs8gs4Z5kkZ35xVeLsNSpVTKtMjMShgTJT0tU51GIx8wTyhQis+jxgFWOQgFmHzw
         NcEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MEpXcpvA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id j13si3941949qtk.73.2020.05.02.13.36.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 02 May 2020 13:36:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MEpXcpvA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jUyru-0002B2-Gp
	for alex.bennee@linaro.org; Sat, 02 May 2020 16:36:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jUyrl-0002Am-FK
 for qemu-arm@nongnu.org; Sat, 02 May 2020 16:36:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1jUyrj-0003OZ-AX
 for qemu-arm@nongnu.org; Sat, 02 May 2020 16:36:04 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:29037
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jUyri-0003M6-MM
 for qemu-arm@nongnu.org; Sat, 02 May 2020 16:36:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588451761;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/ZkwrtF/bP/f6NIy006ewNhyBujezKdvG5zAeAtfZTk=;
 b=MEpXcpvAVQQaIkyRHGo+U8k/gPvAcKXCBmnTVWz7uH7XKHKwCnwmBMU26/ZAg0N0IFXuUJ
 jBIuETaClYXzbuMKldxyvFsd1RzHKJ74sRkZBWboZqV/GSVdO9klQXwtq2jGvNc6IyjPty
 jX8CyUHmxQrth4qKUOQMpqdA+5RnEdA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-PP02HeioPu-F5zFUpQgXBw-1; Sat, 02 May 2020 16:35:56 -0400
X-MC-Unique: PP02HeioPu-F5zFUpQgXBw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4180D80183C;
 Sat,  2 May 2020 20:35:55 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-58.ams2.redhat.com [10.36.112.58])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E2EF1001B2C;
 Sat,  2 May 2020 20:35:41 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, stefanb@linux.ibm.com,
 peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 imammedo@redhat.com, shannon.zhaosl@gmail.com, mst@redhat.com
Subject: [PATCH 0/2] vTPM/aarch64 ACPI support
Date: Sat,  2 May 2020 22:35:34 +0200
Message-Id: <20200502203536.15011-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.120;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/02 16:36:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: marcandre.lureau@redhat.com, drjones@redhat.com, gshan@redhat.com,
 lersek@redhat.com, ardb@kernel.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6sq7zJbf+bW8

Those 2 patches bring MMIO TPM TIS ACPI support in machvirt.  =20
The TPM2.0 table is added and the TPM2 device object is described
in the DSDT.

Many thanks to Ard for his support.

Tested with LUKS partition automatic decryption.

Best Regards

Eric

This series can be found at:
https://github.com/eauger/qemu/tree/v5.0-tpm-acpi-v1

Eric Auger (2):
  arm/acpi: TPM2 ACPI table support
  arm/acpi: Add the TPM2.0 device under the DSDT

 include/sysemu/tpm.h     |  2 ++
 hw/arm/virt-acpi-build.c | 70 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 72 insertions(+)

--=20
2.20.1

