Received: by 10.25.208.211 with SMTP id h202csp1295870lfg;
        Fri, 19 Feb 2016 10:20:40 -0800 (PST)
X-Received: by 10.55.74.9 with SMTP id x9mr17797417qka.81.1455906040048;
        Fri, 19 Feb 2016 10:20:40 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x198si15447509qka.46.2016.02.19.10.20.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Feb 2016 10:20:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54451 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aWpfS-0004cP-UT
	for alex.bennee@linaro.org; Fri, 19 Feb 2016 13:20:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54812)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <somlo@cmu.edu>) id 1aWpfQ-0004Yr-6k
	for qemu-arm@nongnu.org; Fri, 19 Feb 2016 13:20:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <somlo@cmu.edu>) id 1aWpfN-0006VR-2R
	for qemu-arm@nongnu.org; Fri, 19 Feb 2016 13:20:36 -0500
Received: from relay-06.andrew.cmu.edu ([128.2.157.21]:47165
	helo=relay.andrew.cmu.edu) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <somlo@cmu.edu>)
	id 1aWpfM-0006V8-Sf; Fri, 19 Feb 2016 13:20:32 -0500
Received: from HEDWIG.ini.cmu.edu (HEDWIG.INI.CMU.EDU [128.2.16.51])
	by relay.andrew.cmu.edu (8.14.8/8.14.8) with ESMTP id u1JIKTk8008851;
	Fri, 19 Feb 2016 13:20:30 -0500
From: "Gabriel L. Somlo" <somlo@cmu.edu>
To: qemu-devel@nongnu.org
Date: Fri, 19 Feb 2016 13:20:29 -0500
Message-Id: <1455906029-25565-6-git-send-email-somlo@cmu.edu>
X-Mailer: git-send-email 2.4.3
In-Reply-To: <1455906029-25565-1-git-send-email-somlo@cmu.edu>
References: <1455906029-25565-1-git-send-email-somlo@cmu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.74 on 128.2.157.21
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by relay.andrew.cmu.edu id
	u1JIKTk8008851
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 128.2.157.21
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
	matt@codeblueprint.co.uk, stefanha@gmail.com,
	ard.biesheuvel@linaro.org, leif.lindholm@linaro.org,
	luto@amacapital.net, qemu-arm@nongnu.org, kraxel@redhat.com,
	pbonzini@redhat.com, imammedo@redhat.com, lersek@redhat.com,
	rth@twiddle.net
Subject: [Qemu-arm] [PATCH v9 5/5] fw_cfg: document ACPI device node
	information
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: VvUYrIuezNYi

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

