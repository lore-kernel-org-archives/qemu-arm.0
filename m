Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2089708wrg;
        Tue, 4 Jun 2019 09:26:05 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwTPMcnphg1BBht/fCXirsRaRNTI9AOZT6XeWgKqdTCnkblIvdG//B8leF0PXvGwSWAY0le
X-Received: by 2002:ac8:188d:: with SMTP id s13mr11801674qtj.0.1559665564821;
        Tue, 04 Jun 2019 09:26:04 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h41si3381078qta.179.2019.06.04.09.26.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 04 Jun 2019 09:26:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=wDvIKIbt;
       arc=fail (body hash mismatch);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:55007 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hYCGC-0000Ws-7i
	for alex.bennee@linaro.org; Tue, 04 Jun 2019 12:26:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39121)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1hYCFr-0000Ud-Vk
	for qemu-arm@nongnu.org; Tue, 04 Jun 2019 12:25:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1hYCFq-0003U4-V8
	for qemu-arm@nongnu.org; Tue, 04 Jun 2019 12:25:43 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:40502)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
	id 1hYCFq-0003SF-9q; Tue, 04 Jun 2019 12:25:42 -0400
Received: from kouign-amann.bar.greensocs.com (unknown [172.17.10.6])
	by beetle.greensocs.com (Postfix) with ESMTPSA id C358896F59;
	Tue,  4 Jun 2019 16:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
	s=mail; t=1559665541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=Ids2q0cvMSkPKHjRd29FbMXZAla1JGKMnzTb1AHd7kk=;
	b=wDvIKIbtw7KbHs24sz2MFMX/4p3m2tz1fdFstnYxsUllAhCp3Za3QJywjFUgf9YLKqQczh
	d3lsL5jY/W4P50DnkVhtbjyaGsdCqMqcuNzB1cTf61XXDwf5611p/yQYs8jjeXWOaUdqnF
	HPFnyZEzZ+zOsztlTfnvnE4FpFbfpvE=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Date: Tue,  4 Jun 2019 18:25:16 +0200
Message-Id: <20190604162526.10655-3-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190604162526.10655-1-damien.hedde@greensocs.com>
References: <20190604162526.10655-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
	s=mail; t=1559665541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=Ids2q0cvMSkPKHjRd29FbMXZAla1JGKMnzTb1AHd7kk=;
	b=O2yerfsa6l1tkSheTrLuMBgnNrJZRs7nO3HHO+8llpENrJLpuVcadUyJPvQu4c4H9mEYdg
	MsASPJKeRqQ08kfclszBpj+XD5njNDaFI8PsQsd+12irOvsscWHne/SlRL8oWgwDi/MnVx
	gWjqv/10hel3zq1vMdxl5rIg4LJ2/GA=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1559665541; a=rsa-sha256; cv=none;
	b=O6BoFYZx65ItStlafQplUy2dfpL2UzMVcVphlTu4TMJHnFu7LZMP1CAsBNMLX0Lul+pPIy
	hyjU2ICY8JS/Kd3rQYz/tEoBtWlr6DTDmXwMaoX+wTr5VaKypxoymRBiSu11lMM28+GXK2
	uG7y1kI+IE4nonYKDwQRAojxjx3hOTM=
ARC-Authentication-Results: i=1; ORIGINATING;
	auth=pass smtp.auth=damien smtp.mailfrom=damien.hedde@greensocs.com
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 5.135.226.135
Subject: [Qemu-arm] [RFC PATCH v2 02/12] add device_legacy_reset function to
 do the transition with device_reset
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org,
	marc.burton@greensocs.com, alistair@alistair23.me,
	qemu-arm@nongnu.org, Damien Hedde <damien.hedde@greensocs.com>,
	marcandre.lureau@redhat.com, pbonzini@redhat.com,
	philmd@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hCe9ZStZ47cD

This function has device_reset behavior and will allow to change
device_reset prototype while keeping the functionality.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 hw/core/qdev.c         | 2 +-
 include/hw/qdev-core.h | 9 +++++++--
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index f9b6efe509..90037ba70c 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -1086,7 +1086,7 @@ void device_class_set_parent_unrealize(DeviceClass =
*dc,
     dc->unrealize =3D dev_unrealize;
 }
=20
-void device_reset(DeviceState *dev)
+void device_legacy_reset(DeviceState *dev)
 {
     DeviceClass *klass =3D DEVICE_GET_CLASS(dev);
=20
diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index fa55dc10ae..537dd0054d 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -406,11 +406,16 @@ char *qdev_get_own_fw_dev_path_from_handler(BusStat=
e *bus, DeviceState *dev);
 void qdev_machine_init(void);
=20
 /**
- * @device_reset
+ * device_legacy_reset:
  *
  * Reset a single device (by calling the reset method).
  */
-void device_reset(DeviceState *dev);
+void device_legacy_reset(DeviceState *dev);
+
+static inline void device_reset(DeviceState *dev)
+{
+    device_legacy_reset(dev);
+}
=20
 void device_class_set_parent_reset(DeviceClass *dc,
                                    DeviceReset dev_reset,
--=20
2.21.0

