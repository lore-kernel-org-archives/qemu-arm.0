Received: by 10.223.150.237 with SMTP id u100csp4139501wrb;
        Fri, 10 Nov 2017 11:54:03 -0800 (PST)
X-Google-Smtp-Source: AGs4zMby2YsQVSJauCgDXnR2X7Ufhf6j4dVWXEXl9v5E3fQNpPa/Kyi36ECc3VnwtPKZT1DC9ZKK
X-Received: by 10.37.98.18 with SMTP id w18mr1012409ybb.290.1510343643772;
        Fri, 10 Nov 2017 11:54:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510343643; cv=none;
        d=google.com; s=arc-20160816;
        b=cWZpO2kVZeuun0YHTMDP1sh5aAlw/4VMB6YdK9AJxl6ypmJTJZctLmGEFJlHz0lK2Y
         1o2kC6NzodmZxL6MT31dq8eGABWNDfXxjobYBbitX6h0uV/URDNFhkXdUMRa/IHvHgbk
         sT14WPE8eCGC1XrXb7+EUfrzmEiy/2HCoSS4Z1YJQvKsjX4PG2z4aPLFKGJ2PHe+NheZ
         EacOVTjVHIt0UsB/B8xNxMlfdP0xl6uCrXxwx3k+V47C8QgaAjHc+4UxJwzuKkZfkljH
         CZw5/HxxG3kUlBIlA8LPzoYcMpMsbCrRC07opcVw2jhntTk6X9BrSVGnPoru1Vxf3GAg
         FOxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=r88MF40W9pSEe97d+djRzbpw1Fbz7r9nHuOys0gZuDI=;
        b=XwaJAfxtDzfa0sPHHGHgwSJT2xcJMRQ1iBPlcmcvLD5o9jLvjIJQS8nssuUS8aMxtJ
         Ne6J/37O1BBaIsnI7OYcJYaRC0/g2thqjYQn5TtIbrdK1iInxTl6KntPAvmQO3jKksNb
         a5mOqegBNMOyzim70Fios0tjg4ASYmhNC9y7XbRRKzQ4nRarvqnAdADnMHXPJVcLj70V
         tW4B/XG0142Q2VzJ4RIgIN1mfTkoPIfKh/2nbqpRIoo2qTHCH2aJ74U3FPdWRawIayD5
         SXql3+AI0NoO681HTH1jE/wIgWvamSS2/R9EK7SC1Cn+cLKR0svIiBCnqPlTy4hzLcBF
         gynQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@braap.org header.s=mesmtp header.b=Q0rlqhn6;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=iPu7qDar;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 67si2281213ybi.678.2017.11.10.11.54.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 Nov 2017 11:54:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@braap.org header.s=mesmtp header.b=Q0rlqhn6;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=iPu7qDar;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43237 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eDFNL-0005Mj-4W
	for alex.bennee@linaro.org; Fri, 10 Nov 2017 14:54:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47280)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1eDFNA-0005Lh-3z
	for qemu-arm@nongnu.org; Fri, 10 Nov 2017 14:53:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1eDFN5-0006BL-Sr
	for qemu-arm@nongnu.org; Fri, 10 Nov 2017 14:53:50 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:60233)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cota@braap.org>)
	id 1eDFN5-0006B6-Lw; Fri, 10 Nov 2017 14:53:47 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 43A81212C8;
	Fri, 10 Nov 2017 14:53:47 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
	by compute4.internal (MEProxy); Fri, 10 Nov 2017 14:53:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:date:from:in-reply-to:message-id:references:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc; s=mesmtp; bh=r88MF40W9pSEe9
	7d+djRzbpw1Fbz7r9nHuOys0gZuDI=; b=Q0rlqhn6PmwKhGiRpAPBT4JlZWrk26
	j+3TJMTn/X8sPx1htI6jd3S1SjD5HyzI6MGZ26g33rY1+qosVbjVb9mjjBOowBAZ
	t5QgwBQGhiAM568T+YdzmHtWb+RKfMFUa23D22Utx5qJR4rQ0Tl/CwTQ78L9fq8D
	XcyZdRpC6F6w4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; bh=r88MF40W9pSEe97d+djRzbpw1Fbz7r9nHuOys0gZuDI=; b=iPu7qDar
	9hL3Klm4xzbLfAhE8fMgjjDKdk576IsSJ29qwhCG6mXk0V5mxvlS5hwYeQ3sYecu
	MwcOExVPik4laVpZQ17WGgIvQ+Pxrj4id+fBeTGOfa6nIa93J1WUfwcbPBBEwjca
	eYjpNs1lu2pBmF6uPB6DiYB8KNpoEKdx2OO8iQ4TjEB5z8m1ldPGe+47xkWL8XmW
	yr56Z1lc7MWEa6hK8v328W2iaBImeoLuSOT4xwEY4QVnFNezUI5UaoaJJw9LUL1p
	J7tVlwntYKWaoRfkAIjgfnVqF9YVfUffPRLG1JNFY+Blr2hEOsNAEn47TCBFn6w1
	5jczUhqTq4XIbA==
X-ME-Sender: <xms:ywMGWokFMFmTSwzsvdvihNm7HnCs4okoL5uIQTDwSIGZQia5u-IGpQ>
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 0BDEA24631;
	Fri, 10 Nov 2017 14:53:47 -0500 (EST)
From: "Emilio G. Cota" <cota@braap.org>
To: qemu-devel@nongnu.org
Date: Fri, 10 Nov 2017 14:53:44 -0500
Message-Id: <1510343626-25861-4-git-send-email-cota@braap.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1510343626-25861-1-git-send-email-cota@braap.org>
References: <1510343626-25861-1-git-send-email-cota@braap.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.111.4.28
Subject: [Qemu-arm] [PATCH for 2.11 3/5] xlnx-zcu102: Add an info message
 deprecating the EP108
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
	Eduardo Habkost <ehabkost@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm@nongnu.org, Marcel Apfelbaum <marcel@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iGoyKD/d9cYX

From: Alistair Francis <alistair.francis@xilinx.com>

The EP108 was an early access development board that is no longer used.
Add an info message to convert any users to the ZCU102 instead. On QEMU
they are both identical.

This patch also updated the qemu-doc.texi file to indicate that the
EP108 has been deprecated.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Reviewed-by: Emilio G. Cota <cota@braap.org>
---
 qemu-doc.texi        | 7 +++++++
 hw/arm/xlnx-zcu102.c | 3 +++
 2 files changed, 10 insertions(+)

diff --git a/qemu-doc.texi b/qemu-doc.texi
index 8c10956..d383ac4 100644
--- a/qemu-doc.texi
+++ b/qemu-doc.texi
@@ -2537,6 +2537,13 @@ or ``ivshmem-doorbell`` device types.
 The ``spapr-pci-vfio-host-bridge'' device type is replaced by
 the ``spapr-pci-host-bridge'' device type.
 
+@section System emulator machines
+
+@subsection Xilinx EP108 (since 2.11.0)
+
+The ``xlnx-ep108'' machine has been replaced by the ``xlnx-zcu102'' machine.
+The ``xlnx-zcu102'' machine has the same features and capabilites in QEMU.
+
 @node License
 @appendix License
 
diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
index 7ec03da..adddd23 100644
--- a/hw/arm/xlnx-zcu102.c
+++ b/hw/arm/xlnx-zcu102.c
@@ -164,6 +164,9 @@ static void xlnx_ep108_init(MachineState *machine)
 {
     XlnxZCU102 *s = EP108_MACHINE(machine);
 
+    info_report("The Xilinx EP108 machine is deprecated, please use the "
+                "ZCU102 machine instead. It has the same features supported.");
+
     xlnx_zynqmp_init(s, machine);
 }
 
-- 
2.7.4

