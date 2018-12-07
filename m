Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp734510wrt;
        Fri, 7 Dec 2018 09:10:02 -0800 (PST)
X-Google-Smtp-Source: AFSGD/WOC+MxhHk7XOdEqkB03lEnNbhlMuRaUMUbviS7EKzX+hKwQRwiRLQGlmsQQXRUxvokPibt
X-Received: by 2002:ac8:25d0:: with SMTP id f16mr2904039qtf.129.1544202602293;
        Fri, 07 Dec 2018 09:10:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544202602; cv=none;
        d=google.com; s=arc-20160816;
        b=MrKJSQTKxAmGJD9/23jMQyvz0+mG0aFoXuQiDQe1GEHI3K96Qe1Xl8PvlHlp71FsbL
         pWAfNeJlOCYvTjit9ocKO4zJlrtftG4DVg+Soxwklgbkaj3/wQzqGV/kmnJu10dH7dGR
         AzYZiSX4HrP6jKifi/rhQBsuTGpG4JRaZU0shjiMW4d2+yrHrrw1M7RBr+Lqj0Z+Xct1
         x/uJmVnvPNzpcs/AG1h8TzQnv9WioPcJj2dpJwh5FrCAXnDwMIvAIXjVl66epej3QnO/
         Sycwt8Wss+LBwIbi2T2gGGdhGrzby27rqG9r9p5adcBkv7w0bHnZeekw+xdKqLVQUa9g
         l5Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=PvuXRvjhIS9pooiq2aPnjavKsZ/LoGB28XIKbiWPuME=;
        b=dIrM55OycuB9I8XapV7oSWSMYWph4ShWmngkIYwlgzfU+1WH8RwntwluK1Nwxv9EB1
         fcXMhKAnuTC7LlSIGuD790L4sqDiIib78geYDscI4jQGKU3fq5oJpXIIok1kPXKikN/9
         MR3gFTDCwPb3M7Y+7DRDKvDmvF9AgvYIfHhW/5tawTzDTZjqIwRKY5WUfUTicIpj+qNv
         +lxMdbediUO3EnCSCTHUYrMvbczb4TU3cA5GOKMlmxHf9aBUs4Z2z3uIYEfIEbMgosX2
         /JeeaiHiWhd8TbLWtM6835X0Azce42/ntJTv0yY7XSJwc4V579bX9XjKbevgDDK1+iHo
         Qeug==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o5si374864qtg.188.2018.12.07.09.10.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 07 Dec 2018 09:10:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47304 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gVJdZ-0003sB-Nc
	for alex.bennee@linaro.org; Fri, 07 Dec 2018 12:10:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58457)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gVJY9-0005IB-Bo
	for qemu-arm@nongnu.org; Fri, 07 Dec 2018 12:04:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gVJY7-0004vE-Lf
	for qemu-arm@nongnu.org; Fri, 07 Dec 2018 12:04:25 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56398)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1gVJY7-0004uD-Ee; Fri, 07 Dec 2018 12:04:23 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 96AA0C04959B;
	Fri,  7 Dec 2018 17:04:22 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.154])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C4372B453;
	Fri,  7 Dec 2018 17:04:19 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: "Michael S . Tsirkin" <mst@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Fri,  7 Dec 2018 18:03:55 +0100
Message-Id: <20181207170400.5129-2-philmd@redhat.com>
In-Reply-To: <20181207170400.5129-1-philmd@redhat.com>
References: <20181207170400.5129-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Fri, 07 Dec 2018 17:04:22 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 1/6] hw/arm/virt: Remove null-check in
 virt_build_smbios()
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Xok29svXtHOt

Since af1f60a4022, the fw_cfg field is always created in machvirt_init().
There is no need to null check it.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/arm/virt.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index f69e7eb399..36303ed59c 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1279,10 +1279,6 @@ static void virt_build_smbios(VirtMachineState *vm=
s)
     size_t smbios_tables_len, smbios_anchor_len;
     const char *product =3D "QEMU Virtual Machine";
=20
-    if (!vms->fw_cfg) {
-        return;
-    }
-
     if (kvm_enabled()) {
         product =3D "KVM Virtual Machine";
     }
--=20
2.17.2

