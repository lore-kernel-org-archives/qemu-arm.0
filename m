Received: by 10.28.71.27 with SMTP id u27csp1039794wma;
        Fri, 9 Feb 2018 07:13:26 -0800 (PST)
X-Google-Smtp-Source: AH8x2242WGO2UvLeJ6zpd+iPuEZqrnW6jiBNHs/5hOha42dXYgLFfQ4puqZBveOiaL/UiJDmahbI
X-Received: by 10.37.76.198 with SMTP id z189mr1993150yba.415.1518189206129;
        Fri, 09 Feb 2018 07:13:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518189206; cv=none;
        d=google.com; s=arc-20160816;
        b=BN1MY7gt2SsgeWo5pBsbvwS1m/9eC9mRytaCAHx0pgDV7FoBusUSA050ekiaSQF0/U
         k4pwr4NFYPf7jIWQNyd3+C4QkNr89THGVl6ZHv8HjfMZoA3mVFynDNMLeFlnZI3B3Oij
         oMmDM8lm0vo6VD41Ro4XqI2N77+Xkv5kEmZLpdvjHen+Z+rbLtY5OY4NVPgU1jfuOad+
         E56M3XES6dszbVSJBWVqtD37jJ4Xl5Pzu4uuqJYP4G92SMPlM50k5snL5KnSu6JCtBGH
         +OTuAsmUdWq9+mTWxyqmhfXy6nA0FZxEuEqjh3KxnDdYfCugEOzmv+v5WBAb9ThZGG76
         EqpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=Ro6NsGQE95TgqhEe4cM+3fq55Nj7p/DfcTmAK0a7k7c=;
        b=CHFxQxfpGennX8x/QdE7grjRzqlAI+eyONZ8zyp1wxWSK2xz+5cXFSxVff3rbmSyMI
         e4aGht+1KF2mSGITJR4CxOsFcjAdi64rx1xbpmIs3aYUYQITy61v8o93kv99Y40IJ70S
         JdiP2XBg1XC+aOfvKrkbEVMrYpnFxCdzThCdOfUuDylR8IaWtkAk0VKAHHtnOsMoF/zg
         xl9fFixc9Sy9czWfl/ygLfX3pnlRYmsqbFBnoPPxpoNQZrXmKyc/mNry4MXznMKbXoA6
         Au8OA6h8dESAPRg44cPazTt88NWs9BSqlB8qfzJluaHzANOnrKN2b2e4ZBSkB1EfC7uv
         TgHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=DT7mHXpV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l1si436862ywd.56.2018.02.09.07.13.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Feb 2018 07:13:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=DT7mHXpV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60377 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ekAMf-0000UD-G0
	for alex.bennee@linaro.org; Fri, 09 Feb 2018 10:13:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34578)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ekA5t-0002tV-8v
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 09:56:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ekA5s-0005v6-Hh
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 09:56:05 -0500
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:38047)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ekA5j-0005rP-KA; Fri, 09 Feb 2018 09:55:55 -0500
Received: by mail-qt0-x242.google.com with SMTP id z10so10828122qti.5;
	Fri, 09 Feb 2018 06:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Ro6NsGQE95TgqhEe4cM+3fq55Nj7p/DfcTmAK0a7k7c=;
	b=DT7mHXpV9PbgupSuLdMzNROwhgf6cHONcaLOUluO1NRn6tfPA6TsG/iWs+0ol32M7Q
	k/+Hc6XiA4UwCkK9uH8FbEhTAmOhaR5qlRggeSIqB/fHQogalmscBTnfS4IGiIE0+Jev
	blsy5w0SIupb6fRbFIXcbIl+m1SjlCe0ao22yYy/SXOHvp0H2c6Y1Mb5dGXrf4NIuhT+
	dx2pI5FH1MDy/q5HlexgfjioirAhEJkFj0KLjyC6XYXF93+u8kI9Wx9dErsRgm115qT8
	98rsniuHBBBORtzAwI5qG1dJi+3LeEyqi5a2yKQ3Pdmzxed/O8YeJpr/XOI1SJzJWoOw
	NCuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=Ro6NsGQE95TgqhEe4cM+3fq55Nj7p/DfcTmAK0a7k7c=;
	b=RRgIuC1Tbxw4rbW/haCszdM5neUWjGNwWKSP+rUMjy9Uj7R4dC1tDxuMS2WqvvWU5M
	PJY8cguiAM283CBUmeB95Qf2KlErqXMnwCkw0FmxNJAU0zl/s/TUC9UChBeWskSK/XfD
	jb4ChaKsocuEaEkHIMCntMzKJ9pDDZ33Moz9zbAQR5nH0j4KaSs73RwYV21N4nCnmncB
	qLUDyYzad9FZMykXdq/ZrNVnUWcThZe4CJcR/EADU4gCuFiRjyzy0SedT4kdMyO8Mm06
	X8OzhECdL5zF5u4TZIYAY+AGnuG8XozONxFuvKf3A38trc67UUwPuQKN/KJsSr2CUPOA
	ukYw==
X-Gm-Message-State: APf1xPD4sw1qRtzR+OqR/YmgBv9EV7d5qCqOWqFNAMLEKrx2WpdEBD2s
	39GjOf0vcVJc/z/I3cjTGoQ=
X-Received: by 10.200.39.241 with SMTP id x46mr4630076qtx.266.1518188155087;
	Fri, 09 Feb 2018 06:55:55 -0800 (PST)
Received: from x1.local ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id b29sm747841qkb.28.2018.02.09.06.55.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Feb 2018 06:55:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri,  9 Feb 2018 11:54:27 -0300
Message-Id: <20180209145430.26007-28-f4bug@amsat.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180209145430.26007-1-f4bug@amsat.org>
References: <20180209145430.26007-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-arm] [PATCH v12 27/30] hw/arm/xilinx_zynqmp: enable the UHS-I
 mode
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	"open list:Xilinx ZynqMP" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HXebR69CD+Ra

see the Xilinx datasheet "UG1085" (v1.7)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
---
 hw/arm/xlnx-zynqmp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index e39ad73bec..4b93a3abd2 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -400,6 +400,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
          */
         object_property_set_uint(sdhci, 3, "sd-spec-version", &err);
         object_property_set_uint(sdhci, SDHCI_CAPABILITIES, "capareg", &err);
+        object_property_set_uint(sdhci, UHS_I, "uhs", &err);
         object_property_set_bool(sdhci, true, "realized", &err);
         if (err) {
             error_propagate(errp, err);
-- 
2.16.1

