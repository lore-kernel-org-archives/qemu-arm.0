Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp9421499wrv;
        Wed, 24 Jul 2019 07:36:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwky3JKQj1WpHDHxT0Apc8+WbmTksOjLbEI6otnlTsrfsKKThh7jboO4/iERpiTNAkiWNDj
X-Received: by 2002:a17:906:318e:: with SMTP id 14mr63448241ejy.85.1563978977021;
        Wed, 24 Jul 2019 07:36:17 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g28si9146827edc.275.2019.07.24.07.36.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jul 2019 07:36:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="Y+3i/bif";
       arc=fail (body hash mismatch);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hqINM-0002wH-3x
	for alex.bennee@linaro.org; Wed, 24 Jul 2019 10:36:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60420)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <damien.hedde@greensocs.com>) id 1hqINJ-0002vx-0U
 for qemu-arm@nongnu.org; Wed, 24 Jul 2019 10:36:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.com>) id 1hqINI-0008MW-1v
 for qemu-arm@nongnu.org; Wed, 24 Jul 2019 10:36:12 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:44366)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
 id 1hqINH-0008Jp-C1; Wed, 24 Jul 2019 10:36:11 -0400
Received: from kouign-amann.bar.greensocs.com (unknown [172.16.11.117])
 by beetle.greensocs.com (Postfix) with ESMTPS id 11EFB96F51;
 Wed, 24 Jul 2019 14:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1563978968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=KUurv/KQaHtXORkxGqb0dU1d7NJ5+71uYGLwWNlG2hI=;
 b=Y+3i/bif+o99Uor3vTkcEH7yR9iWCWLrUjYaQAeYq0L0fd2vlDQX0xtWpV9cXa/TFYmf6l
 w+ypNuzmqq6IMUV+2tVJ4IiJtTf0SbgH4Kitukm6b0/OBm+tShRCidTsJXYNEpnMnzS7hT
 Xk8oqeuEpjY8xMNcHQiMahISyl2mxdo=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Date: Wed, 24 Jul 2019 16:35:53 +0200
Message-Id: <20190724143553.21557-1-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1563978968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=KUurv/KQaHtXORkxGqb0dU1d7NJ5+71uYGLwWNlG2hI=;
 b=4wpMEr021XD0hMVbulDG6wTO+FlpLQVrxdJ94hueM2/mTsASn7pQYSYoKoeYWoJvHb6v/p
 lzWEiPsamiN6fHXe8CNT94m6UUhmtVp7eLm0T8IySZEfAjInGzwt+vkUZolk9LRQh5DPO+
 kAhWhIHshrKPIlf/aqUgREfzhI8v00w=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1563978968; a=rsa-sha256; cv=none;
 b=ic1ek3cXPpEdtxhEagFf9PbCZYG3bOhv/BvA2RYQwHK3j07IyJXznAKIBTPTQkDyj77PXE
 LrucliYHki1kH3lhVtFmaN16qfHef5NqHB2NwaNvtlfg/YOl1afw1825VrYdvsOa2fuZ5A
 wMMiUfqqd/ymyNJBDqWZ4HCkXKyHj1U=
ARC-Authentication-Results: i=1;
	beetle.greensocs.com;
	none
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 5.135.226.135
Subject: [Qemu-arm] [PATCH for 4.1?] pl330: fix vmstate description
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, peter.maydell@linaro.org,
 qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tD69GZpCaXxt

Fix the pl330 main and queue vmstate description.
There were missing POINTER flags causing crashes during
incoming migration because:
+ PL330State chan field is a pointer to an array
+ PL330Queue queue field is a pointer to an array

Also bump corresponding vmsd version numbers.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---

I found this while working on reset with xilinx-zynq machine.

I'm not sure what's the vmsd version policy in such cases (for
backward compatibility). I've simply bumped them since migration
was not working anyway (vmstate_load_state was erasing critical part
of PL330State and causing segfaults while loading following fields).

Tested doing migration with the xilinx-zynq-a9 machine.

---
 hw/dma/pl330.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/hw/dma/pl330.c b/hw/dma/pl330.c
index 58df965a46..a56a3e7771 100644
--- a/hw/dma/pl330.c
+++ b/hw/dma/pl330.c
@@ -218,11 +218,12 @@ typedef struct PL330Queue {
=20
 static const VMStateDescription vmstate_pl330_queue =3D {
     .name =3D "pl330_queue",
-    .version_id =3D 1,
-    .minimum_version_id =3D 1,
+    .version_id =3D 2,
+    .minimum_version_id =3D 2,
     .fields =3D (VMStateField[]) {
-        VMSTATE_STRUCT_VARRAY_UINT32(queue, PL330Queue, queue_size, 1,
-                                 vmstate_pl330_queue_entry, PL330QueueEn=
try),
+        VMSTATE_STRUCT_VARRAY_POINTER_UINT32(queue, PL330Queue, queue_si=
ze,
+                                             vmstate_pl330_queue_entry,
+                                             PL330QueueEntry),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -278,12 +279,12 @@ struct PL330State {
=20
 static const VMStateDescription vmstate_pl330 =3D {
     .name =3D "pl330",
-    .version_id =3D 1,
-    .minimum_version_id =3D 1,
+    .version_id =3D 2,
+    .minimum_version_id =3D 2,
     .fields =3D (VMStateField[]) {
         VMSTATE_STRUCT(manager, PL330State, 0, vmstate_pl330_chan, PL330=
Chan),
-        VMSTATE_STRUCT_VARRAY_UINT32(chan, PL330State, num_chnls, 0,
-                                     vmstate_pl330_chan, PL330Chan),
+        VMSTATE_STRUCT_VARRAY_POINTER_UINT32(chan, PL330State, num_chnls=
,
+                                             vmstate_pl330_chan, PL330Ch=
an),
         VMSTATE_VBUFFER_UINT32(lo_seqn, PL330State, 1, NULL, num_chnls),
         VMSTATE_VBUFFER_UINT32(hi_seqn, PL330State, 1, NULL, num_chnls),
         VMSTATE_STRUCT(fifo, PL330State, 0, vmstate_pl330_fifo, PL330Fif=
o),
--=20
2.22.0

