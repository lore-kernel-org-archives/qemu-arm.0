Received: by 10.28.173.206 with SMTP id w197csp2628665wme;
        Mon, 8 Jan 2018 08:01:46 -0800 (PST)
X-Google-Smtp-Source: ACJfBotGhvLoJ9tpg6X8foiLG7GPb4xRe5yu8NDF+QH+xgUYDsFzsxjSYInzbEyoLTqss57VRQ4E
X-Received: by 10.37.187.206 with SMTP id c14mr11495288ybk.282.1515427305903;
        Mon, 08 Jan 2018 08:01:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515427305; cv=none;
        d=google.com; s=arc-20160816;
        b=MrxpqHxBl++DRGVIhPTQ89DWKbv0Os0/A9mNeDq2ZD4C9xhObmakF4eAzywifW7r5G
         YbV8SIE7nRrvAB+itJ1yBjdV0eIB/qab9AjH+NFKHOKiwUaleX9ZKxLIynK3345A4ebc
         OsPunHN2XF2EKg5lnuYKnI6Ot/YsJ/G6hB6jEJZtvpsqyEfp531suzB+2j3YzJ5GkcT4
         QZ/r3BpjMeZtryOk7Do3FxB1kb5dfRvz28IJmeI6AK8WqqajkYN4/5KGai40LZqnluzX
         XQKjSIBuFAk0odO9qRpkcQnl+Ub/zR2OdMN5DvGv87t2U/UiDe7xyCQQbmGAtDJ6Z3aZ
         zT/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=OTlRvqDP8Lqevmy46I/QnaSIws0g2YzsJeazxRLC+Yo=;
        b=YY/I5BELWUnBdvVPWGzmAM4KXVckgg1R9cOZ+uRXaE/VxTj9wjsavbGCOLTX8iN6vq
         /it9MQ5ozRTl2BqdctkopqweQ2Lot2rtlbHcRje5FC53AvEB5UFeH7mlugqDXH9rOFCs
         eAJp0XOANr7Y3mw/9+3M9FjBjEAqdZRtU0R0bKTLxDvSlO7DSGAZ2icWFnFJCv3qhygJ
         Q2ziqHktSP96MopVkHLSbSxsIpN3yhyh7mqn9E6Q0x6z5akYDZyheOzaRChFNkVumLI4
         Ya9l4n9lDKK2BPq8uImxAmY0zItg/ago/RXNw/GtxSp1zdOIio9zjvUv1xlJIKZRaDXu
         UY2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YcMTOKQf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y126si2521187ywc.162.2018.01.08.08.01.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Jan 2018 08:01:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YcMTOKQf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41425 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYZrt-0000CY-8y
	for alex.bennee@linaro.org; Mon, 08 Jan 2018 11:01:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42687)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZc6-0002wW-1A
	for qemu-devel@nongnu.org; Mon, 08 Jan 2018 10:45:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZc4-0008SY-Uk
	for qemu-devel@nongnu.org; Mon, 08 Jan 2018 10:45:25 -0500
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:37225)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZc4-0008Rw-Mn; Mon, 08 Jan 2018 10:45:24 -0500
Received: by mail-qk0-x241.google.com with SMTP id p13so14639285qke.4;
	Mon, 08 Jan 2018 07:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=OTlRvqDP8Lqevmy46I/QnaSIws0g2YzsJeazxRLC+Yo=;
	b=YcMTOKQfMVP7UxVZMjMlEYxTFfGjOAXnxZ/QrmMZh0agKwDFGPbkiZbgBX2GXo/WRx
	zzjCdtDXx3NRgFxqav4pycmZRBC0OqK7FZqFCR3csOxJLtkwB2k+vDoW5A/6X7GKVv6v
	X8f53jE4xWHYDRqQiYWAHEdlrQDRI3/1h5cQWkoCoQLBtYBTb0c2CBDoYl8fQi4uU5fC
	qQZyBb8h4r2sJRBvbi6PR9j827X/5vN2T4urRzw1G1C2kPvqqppKovZVav5IPoLBYIQj
	dFBzvMo2/Mg85eM//DeF4x0GPxuf041e2ienFBymf+yUiXJaO/ImfoPsuKw+PLdzWXyb
	e+Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=OTlRvqDP8Lqevmy46I/QnaSIws0g2YzsJeazxRLC+Yo=;
	b=KxrhheIfh/lUU63ECnqi/RurmCF++dIKjO4Pzhz6Lr+Hf8Trf3948iw2Im5C/oD3pY
	8RMCR3NiEg9SBHvOulVGbLHCSDBnl2HIWQkH+KoeZxmbTlDN3Hiiitb7O9Oxkt9YvVtf
	HslHJVmLG0aCTEeoUoozW0L2C+mBNSgW8XzX8r7HkSTDtkc6Zydzp86ees/n/4H7stxk
	v2E5tjyjaovh8cAKrIBnm/0/z7+b+g7tboDttM/1Rq+PZo/xiefDsRgf6zdEHWrioMst
	1IOkoF0l7EMqBeRYsqVUq4d+AbkgCSd/xB5BrS2I0FOOrdabHqLEegBnug5dIgEX1S4H
	QJig==
X-Gm-Message-State: AKwxytd7NJCrr0AVNugE738nmYbBlrmsHOwYp162Nf4Ut6MBQeMTXTmp
	1U9XtIJX6/BD/SWeBX++Ouk=
X-Received: by 10.55.110.67 with SMTP id j64mr16071115qkc.88.1515426324139;
	Mon, 08 Jan 2018 07:45:24 -0800 (PST)
Received: from x1.local ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	u36sm7832382qtc.58.2018.01.08.07.45.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Jan 2018 07:45:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>
Date: Mon,  8 Jan 2018 12:42:56 -0300
Message-Id: <20180108154303.6522-25-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180108154303.6522-1-f4bug@amsat.org>
References: <20180108154303.6522-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-devel] [PATCH v5 24/31] sdhci: let the SYSBUS_SDHCI type be
 abstract
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	=?UTF-8?q?Gr=C3=A9gory=20Estrade?= <gregory.estrade@gmail.com>,
	qemu-devel@nongnu.org, Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Sai Pavan Boddu <saipava@xilinx.com>, qemu-arm@nongnu.org,
	Clement Deschamps <clement.deschamps@antfield.fr>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: maeixPh5HPAv

all boards previously using it now use a SYSBUS_SDHCI child.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sdhci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index d7e247cb48..34bda73b66 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -1463,6 +1463,7 @@ static void sdhci_sysbus_class_init(ObjectClass *klass, void *data)
 }
 
 static const TypeInfo sdhci_sysbus_info = {
+    .abstract = true,
     .name = TYPE_SYSBUS_SDHCI,
     .parent = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(SDHCIState),
-- 
2.15.1

