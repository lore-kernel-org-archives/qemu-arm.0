Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp1866877wrt;
        Thu, 27 Sep 2018 04:55:36 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61hLCJS0d4VzNkZ3MewQA7CFjmR+QgipmJPhG1s31ufx3SOHFRRmDI18MA+2A9nMltarUrV
X-Received: by 2002:ac8:4993:: with SMTP id f19-v6mr7899096qtq.79.1538049335992;
        Thu, 27 Sep 2018 04:55:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538049335; cv=none;
        d=google.com; s=arc-20160816;
        b=E2oF9bHCAFUz4/1dvR3p0Q1b9O+GeO0QX5JeR/fh0XCblIxRmBUkTIa2a0RIfbJUFE
         d+iU8z866z/30EYzTvG9w7WsjVwDtUi5N0p5antCksp+B/Qg+IhvA2gmuIr4PBNxSskD
         nZMZF0XdPIh+xpE3tJLqYVftBs2BSmpKtu+R1d9ikNNuzqlG22NvcGw9Dn/CNInMWW95
         zUwiFLLVlnGmaOMtyUWt/kD1jSwcsW8DUDEBnMEIbrTItN7tJTsYisr5wG6FW8I1XRXI
         nhUmCUg5zh4Ymu9982FG3DegHQhgRH79dswXrtMSQjYXOiSGyVN2JA6oBUBllD5tQ/H3
         RGFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=ovtmDzDS5GkBx1gAdr8J2BiPiPoCLcajgzMyPjUIlo8=;
        b=zeeE41tYp3P+Oto459nemDZj3N7JbVFv88UgtkzNiVw63EyhXOg1paVwY9V58fIBgM
         QgZXA4fya6t8BSvLHeiPHfvdLHpiPIpeCPL5JUXG7cPY1SPpXS5v2x7ubG7GrU+kqmBz
         n8Bg/OUfS3YUPv/cqUEzJUsCVqu+HAtbObtS9UCOKgBlqedlwn0AkQJ/e+xK4USD0MOG
         wPxZS/SNVs1EuFzdBoxhj6D1fNxAQTw36ygdqS8YOd7kvhWmA9arP9oydA4143dN5vBA
         /iXtJJDXG4x3F4jUNNPRbg5NDucU4EDQ5Df3vF0X+2yA5DNQBtyrgpYcEyczaS0TZZZ1
         3tVw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g11-v6si1346931qke.47.2018.09.27.04.55.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 27 Sep 2018 04:55:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35216 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g5UtL-0004oj-J5
	for alex.bennee@linaro.org; Thu, 27 Sep 2018 07:55:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40645)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <geert@linux-m68k.org>) id 1g5Usq-0004jO-V5
	for qemu-devel@nongnu.org; Thu, 27 Sep 2018 07:55:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <geert@linux-m68k.org>) id 1g5Usn-0000vR-MR
	for qemu-devel@nongnu.org; Thu, 27 Sep 2018 07:55:04 -0400
Received: from baptiste.telenet-ops.be ([2a02:1800:120:4::f00:13]:40468)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <geert@linux-m68k.org>)
	id 1g5Usn-0000tu-BP
	for qemu-devel@nongnu.org; Thu, 27 Sep 2018 07:55:01 -0400
Received: from ramsan.of.borg ([84.194.111.163])
	by baptiste.telenet-ops.be with bizsmtp
	id gbux1y00W3XaVaC01buxVZ; Thu, 27 Sep 2018 13:54:58 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.86_2)
	(envelope-from <geert@linux-m68k.org>)
	id 1g5Usj-0001cs-7B; Thu, 27 Sep 2018 13:54:57 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
	(envelope-from <geert@linux-m68k.org>)
	id 1g5Usj-0008CW-61; Thu, 27 Sep 2018 13:54:57 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Peter Maydell <peter.maydell@linaro.org>,
	Alex Williamson <alex.williamson@redhat.com>
Date: Thu, 27 Sep 2018 13:54:54 +0200
Message-Id: <20180927115454.31471-4-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180927115454.31471-1-geert+renesas@glider.be>
References: <20180927115454.31471-1-geert+renesas@glider.be>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 2a02:1800:120:4::f00:13
Subject: [Qemu-devel] [PATCH qemu v5 3/3] hw/arm/virt: Allow dynamic
 vfio-platform devices again
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
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Magnus Damm <damm+renesas@opensource.se>, qemu-devel@nongnu.org,
	linux-renesas-soc@vger.kernel.org,
	Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dj/2/5Z9VCmf

Allow the instantation of generic dynamic vfio-platform devices again,
without the need to create a new device-specific vfio type.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Tested-by: Eric Auger <eric.auger@redhat.com>
---
v5:
  - Drop reference to commit 6f2062b9758ebc64 ("hw/arm/virt: Allow only
    supported dynamic sysbus devices"),
  - Add Reviewed-by, Tested-by,

v4:
  - s/sysbus/vfio-platform/ in patch description,

v3:
  - Drop RFC state,

v2:
  - Restrict from TYPE_SYS_BUS_DEVICE to TYPE_VFIO_PLATFORM, as
    suggested by Eric Auger.
---
 hw/arm/virt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 0b57f87abcbfd54b..e33f7776c72fa9d0 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1758,6 +1758,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_CALXEDA_XGMAC);
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_AMD_XGBE);
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_PLATFORM);
     mc->block_default_type = IF_VIRTIO;
     mc->no_cdrom = 1;
     mc->pci_allow_0_address = true;
-- 
2.17.1

