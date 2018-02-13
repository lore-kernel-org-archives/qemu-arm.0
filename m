Received: by 10.28.71.27 with SMTP id u27csp687965wma;
        Mon, 12 Feb 2018 20:28:17 -0800 (PST)
X-Google-Smtp-Source: AH8x2253IT/+BEXC21TSwBSzzuTsmp623Fb8b/cZ6qwI44vMH2g9OLzQWAHqxaCxMlrI7FlbCmFp
X-Received: by 10.37.135.7 with SMTP id a7mr9937425ybl.477.1518496097805;
        Mon, 12 Feb 2018 20:28:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518496097; cv=none;
        d=google.com; s=arc-20160816;
        b=Bop2Fvpz1m5nXyjQf0I6JEEeR8dAiD7ErtPmnqNeHH0wicT7bmf7zZsgK6fwr5iSbr
         XXpvMoRHxuotUCeOEP06rnIIPp3GzvURnidBMo6jiCJtCAVQHyl8uOm81zuXS01uqPKO
         CG6TIG02Qd1Rih70A51EaKumokY5ijlhk8paTkvLXvD7uKWA62iWIXDjEoDwg1uE2mpu
         I8Nb/M2L368C8rkhtc36gSGfngn08jNWAjcawFb1y9pCkmGk8Fk1SUeHStrP4dyB2cI/
         QYh2X9bAT44gPKpvqTtEKjQtPqLmYJPgUqV3CcyZM9BTa4ZkRh6cP3I4q2NbtXiN76XG
         VKBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=Ro6NsGQE95TgqhEe4cM+3fq55Nj7p/DfcTmAK0a7k7c=;
        b=Af5HI0OtsEdM3ZE6DPh7vQJgpgV+/VkowxTXZ2jpEgOwE9xyXZATb4TGUoWkrds8Fw
         NAbbWy9ls+viKWtkyWT1vryYF2FK0+uZ5cscJdVSnNNpyw5++aTW0A2xrSqJSu5yS0n8
         IK4HAPBRJ14Bmt1grXU810IFbCVgLlI7OLJuAEmJE+wKJ1Q6whxxAY8vCeh2MKExQX7J
         rT+4rxBLHkO/ku8USPZeIBMu8K7zCVccgWLoM5ONU9i+hzYzLgYpqpVsAkd2cKxS0zdU
         SKwUTFSpdQAaDdgZYxMY9TyVvxLvyVx+atojN/Oik/dNGJwgva8x0EH5Oqg9scU0+2Ds
         vkMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=k4Q/dpW8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i9si682451ywe.304.2018.02.12.20.28.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Feb 2018 20:28:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=k4Q/dpW8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37934 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1elSCX-00011j-6R
	for alex.bennee@linaro.org; Mon, 12 Feb 2018 23:28:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53121)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1elRud-0001li-3k
	for qemu-devel@nongnu.org; Mon, 12 Feb 2018 23:09:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1elRuc-00006B-69
	for qemu-devel@nongnu.org; Mon, 12 Feb 2018 23:09:47 -0500
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:38317)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1elRuc-00005x-14; Mon, 12 Feb 2018 23:09:46 -0500
Received: by mail-qt0-x241.google.com with SMTP id k13so2229375qtg.5;
	Mon, 12 Feb 2018 20:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Ro6NsGQE95TgqhEe4cM+3fq55Nj7p/DfcTmAK0a7k7c=;
	b=k4Q/dpW885NghB5qN4hh6kUXsMWHlg5S9r0FH1MzgZMWxowi5GpbEYAoOWPABC3q9R
	TbwdMVxUDrojSjwVEBvL553n5mrXPVeNyjCpUoSQttPGqB/e9YpuF0sK8AvoyC8Bvdmq
	xxm9ABU2Yfvez4neehbLk36C2g3vh4b8VZS7VuYagSuVG0U7JBRnxIDxHIVONY2eh4vk
	yMLBMcs7RUVor+ktozv/i5hFJiBm/j4HOOEApYgeQeDOHhh8rSqesSeKyrf0InMYS9fd
	xcghC7O1rln2ysQcWne95JGOFxsMvRg6RJ+XlyHkz9+bNXhUu0YYtCTPZVFEbJ2N70TE
	JVLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=Ro6NsGQE95TgqhEe4cM+3fq55Nj7p/DfcTmAK0a7k7c=;
	b=XaHHiTEcXc28ImmiahcshXvrRtYlnzJiOGFKAPn4emL+y4iBde+QFvBkMCxzL/J/PD
	hpTyz8o50QOAbWtDsZlvWZ5zrcrN4UZ88t70jDkkeWaN/Zpz7JNLF1Bqw37SUEddzDSD
	MCBk9/xrYdPG0XNsOqVra/bfnKMmurUVOH0+cHYoNUk8T62nvfdJJUeErsPQxkkNz5nm
	IBf6y6K3ENro8uyEj3ngubLlV3ChvhTQadNX3uD8EpfEVA3mC5IrFIaweB+kymUkAAwj
	h7D5pbZykX24fmT2XNILc6cG6Xt+LPsiNco3L0J/sAQKE48mV+qwkkeDwzFZRrU6KTn9
	Ez1g==
X-Gm-Message-State: APf1xPBmWNWBvXdvLcE2+JRr/hTkmrd0EUuKtP7zIH3lrBWFyxuo3cN3
	m85dmqB1MVxFacIGabxaaWA=
X-Received: by 10.200.27.67 with SMTP id p3mr22127741qtk.254.1518494985645;
	Mon, 12 Feb 2018 20:09:45 -0800 (PST)
Received: from x1.local ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id q2sm7350435qki.10.2018.02.12.20.09.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 Feb 2018 20:09:45 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 13 Feb 2018 01:08:06 -0300
Message-Id: <20180213040809.26021-28-f4bug@amsat.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180213040809.26021-1-f4bug@amsat.org>
References: <20180213040809.26021-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-devel] [PATCH v13 27/30] hw/arm/xilinx_zynqmp: enable the
 UHS-I mode
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
	Peter Maydell <peter.maydell@linaro.org>,
	Fam Zheng <famz@redhat.com>, qemu-devel@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	"open list:Xilinx ZynqMP" <qemu-arm@nongnu.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: blLW7nVP/Clx

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

