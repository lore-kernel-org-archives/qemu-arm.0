Received: by 10.25.159.19 with SMTP id i19csp2703340lfe;
        Wed, 10 Feb 2016 12:42:40 -0800 (PST)
X-Received: by 10.140.86.243 with SMTP id p106mr51733642qgd.1.1455136959624;
        Wed, 10 Feb 2016 12:42:39 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z2si5457661qkg.60.2016.02.10.12.42.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 10 Feb 2016 12:42:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42941 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aTbax-0008GR-50
	for alex.bennee@linaro.org; Wed, 10 Feb 2016 15:42:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58306)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <somlo@cmu.edu>) id 1aTbaB-0007AS-0f
	for qemu-devel@nongnu.org; Wed, 10 Feb 2016 15:41:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <somlo@cmu.edu>) id 1aTba9-0008OB-Vj
	for qemu-devel@nongnu.org; Wed, 10 Feb 2016 15:41:50 -0500
Received: from relay-05.andrew.cmu.edu ([128.2.157.12]:39562
	helo=relay.andrew.cmu.edu) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <somlo@cmu.edu>)
	id 1aTba6-0008LJ-5O; Wed, 10 Feb 2016 15:41:46 -0500
Received: from HEDWIG.ini.cmu.edu (HEDWIG.INI.CMU.EDU [128.2.16.51])
	by relay.andrew.cmu.edu (8.14.7/8.14.7) with ESMTP id u1AKfeYF004670;
	Wed, 10 Feb 2016 15:41:41 -0500
From: "Gabriel L. Somlo" <somlo@cmu.edu>
To: qemu-devel@nongnu.org
Date: Wed, 10 Feb 2016 15:41:40 -0500
Message-Id: <1455136900-22334-6-git-send-email-somlo@cmu.edu>
X-Mailer: git-send-email 2.4.3
In-Reply-To: <1455136900-22334-1-git-send-email-somlo@cmu.edu>
References: <1455136900-22334-1-git-send-email-somlo@cmu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.74 on 128.2.157.12
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by relay.andrew.cmu.edu id
	u1AKfeYF004670
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 128.2.157.12
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
	matt@codeblueprint.co.uk, stefanha@gmail.com,
	ard.biesheuvel@linaro.org, leif.lindholm@linaro.org,
	luto@amacapital.net, qemu-arm@nongnu.org, kraxel@redhat.com,
	pbonzini@redhat.com, imammedo@redhat.com, lersek@redhat.com,
	rth@twiddle.net
Subject: [Qemu-devel] [PATCH v7 5/5] fw_cfg: document ACPI device node
	information
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: d9Fw5yo/h0N2

Signed-off-by: Gabriel Somlo <somlo@cmu.edu>
Reviewed-by: Laszlo Ersek <lersek@redhat.com>
Reviewed-by: Marc Mar=C3=AD <markmb@redhat.com>
---
 docs/specs/fw_cfg.txt | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/docs/specs/fw_cfg.txt b/docs/specs/fw_cfg.txt
index 2099ad9..5414140 100644
--- a/docs/specs/fw_cfg.txt
+++ b/docs/specs/fw_cfg.txt
@@ -84,6 +84,15 @@ Selector Register address: Base + 8 (2 bytes)
 Data Register address:     Base + 0 (8 bytes)
 DMA Address address:       Base + 16 (8 bytes)
=20
+=3D=3D ACPI Interface =3D=3D
+
+The fw_cfg device is defined with ACPI ID "QEMU0002". Since we expect
+ACPI tables to be passed into the guest through the fw_cfg device itself=
,
+the guest-side firmware can not use ACPI to find fw_cfg. However, once t=
he
+firmware is finished setting up ACPI tables and hands control over to th=
e
+guest kernel, the latter can use the fw_cfg ACPI node for a more accurat=
e
+inventory of in-use IOport or MMIO regions.
+
 =3D=3D Firmware Configuration Items =3D=3D
=20
 =3D=3D=3D Signature (Key 0x0000, FW_CFG_SIGNATURE) =3D=3D=3D
--=20
2.4.3

