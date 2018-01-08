Received: by 10.28.173.206 with SMTP id w197csp2617511wme;
        Mon, 8 Jan 2018 07:50:37 -0800 (PST)
X-Google-Smtp-Source: ACJfBot0qya2YIkzzXoQXZ7taH7NLpq76+q2y+HpOoDDkRF/oH0LfldrpEcL0ZwdhfqOM2FvQRMP
X-Received: by 10.13.232.204 with SMTP id r195mr4068248ywe.177.1515426637558;
        Mon, 08 Jan 2018 07:50:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515426637; cv=none;
        d=google.com; s=arc-20160816;
        b=Dy8XpmvQuaZFsdefxuNOLTb6BrlrrG+51bOQMzOl/hM04tTJ5zyNss65QvgEJD/Xtr
         Az2fMdcONvm+//Gh0Cd5gnABtGVkJYNKMg9rcaGjEcSI2QXHwtDHhKICRds2wo/bf1Hy
         jFrXgB5UCgjoL4asruaRpwcjWaAlMeuz3MRrs/vFZl1GpUuvk+AnmzqG1xn11YxgTpo1
         eihzbvs496XZYO2YHIN8ty2BumfZKhHVBWGn8ztYVAKoc8Z06s/9z1OemtYf1O6L1+QC
         5IWU9WV/wjxnICQxmL+HORQ1fG09pgCtLHUCExRFv/K5nSQadBsPZfyGs0806/3U1jeF
         EBwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=JWZ8HlKLq+8kAy3ZqkdbutRr3Hy1eGe4GtaKz3+J8fY=;
        b=eGX/b2e9pqb0iKdm3NiccFtddNbndR71RZzwRG+K0U7NnPdsCZk/+cQK0Vs860lwx2
         Oaipwxz6o/Nyv+jAVsht2T1JvhR4yF0oZjaj1nK7OtQMsxt/syWwlOBvFmaBjv7uxoJb
         C7YuV/uYn2DfNDl04CxU1qXDVX7jQMaIUyQ+Yaw7CmELICkSywBx81pKZthobNArY3GL
         OaIKOzodldKFwEdk/mMcUV6mKIWaFmupt0oNr3fWxF5Dv6JbZJxlsGyuJoYlC34pEhmY
         GBXjPHugD1CMm6HTiyEUUKgMRFSo0+zk5+Fyq2xr8T8feo8p/V9UGSx0lacb1J2Lk8B6
         mSJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KyEaMtNd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f8si358066ywb.774.2018.01.08.07.50.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Jan 2018 07:50:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KyEaMtNd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41302 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYZh7-0007A4-0b
	for alex.bennee@linaro.org; Mon, 08 Jan 2018 10:50:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41924)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZav-0001ka-G1
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 10:44:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZau-0007SG-CS
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 10:44:13 -0500
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:40851)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZal-0007Mb-ML; Mon, 08 Jan 2018 10:44:03 -0500
Received: by mail-qk0-x242.google.com with SMTP id d18so4237163qke.7;
	Mon, 08 Jan 2018 07:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=JWZ8HlKLq+8kAy3ZqkdbutRr3Hy1eGe4GtaKz3+J8fY=;
	b=KyEaMtNdEY/BNq5turANAMpipT3nZ/QL5VCGuulNUNJxkk0jD0SQrhbbwmtyXauKHy
	M4kMNzjXnpPEmZWjM6Jwng/1Gt3uE7SwM+7nSWgZ4fGTtove48ZjHMsM8II1/BFkY6pl
	oA6zdCoe4m5QrT5zemuigF2kO5BFdoUbrjRrJtt38Ldk6aPJHqLZTAF1LnrU9xcvGYAc
	9vp2ZcciMhiLH3fh99/eMfHZkAizjSfR+PfSfsK/tkp5P83RkN+Zbqu/nXbJsoSwceX9
	HJjE5NUrfzz3DrfR9EjIp7jv+U5U3fRsPmf9j5DqY8NPLdSuygB+THrZIIJDdtkav6EO
	WD9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=JWZ8HlKLq+8kAy3ZqkdbutRr3Hy1eGe4GtaKz3+J8fY=;
	b=oRuaHIA+sLAkvOXuY5TKCCXoqfrxDIF5+Wnink+zXhDe9y7jq6XTtx9186zmbmyGci
	bpPdbp3Z5tvmVinBGdsQ3zyHq6zOdKDaS/FTawOGJRl8mQ+RTzRcx4VYw1da4xQrwZwE
	vNCi+XslmN8jPXcLTVY3HiLpRJAVEtjlY2tUQwPltFzMKVwZPvcBB393fMiN32xvREcs
	46A2NerM73Mps3TJfCfvNBTthFQ3iNVCNpjluIq/wVjhh3jivX7OHAlOu3mjo4R6J7EQ
	pEiOLcx32eftPcJcBxgh1UCL42B4E/xr0UUVUnKFL/rzkYMG7OWG4SxO4lG9UDMIcPTE
	J5Cw==
X-Gm-Message-State: AKwxytd0Qo5WXYJ5GUhhiYc59bw5F3eS1kaipqkOzdC7e91UgcnAlWuY
	LDZJScCilPgZkXyvvxeSBC0=
X-Received: by 10.55.113.197 with SMTP id m188mr17415641qkc.15.1515426243182; 
	Mon, 08 Jan 2018 07:44:03 -0800 (PST)
Received: from x1.local ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	u36sm7832382qtc.58.2018.01.08.07.43.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Jan 2018 07:44:02 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>
Date: Mon,  8 Jan 2018 12:42:40 -0300
Message-Id: <20180108154303.6522-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180108154303.6522-1-f4bug@amsat.org>
References: <20180108154303.6522-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-arm] [PATCH v5 08/31] hw/sd: clean/reorder the Makefile
 adding few comments
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
	Prasad J Pandit <pjp@fedoraproject.org>,
	=?UTF-8?q?Gr=C3=A9gory=20Estrade?= <gregory.estrade@gmail.com>,
	qemu-devel@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Sai Pavan Boddu <saipava@xilinx.com>, qemu-arm@nongnu.org,
	Clement Deschamps <clement.deschamps@antfield.fr>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 00LCxd1xNIml

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/Makefile.objs | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/sd/Makefile.objs b/hw/sd/Makefile.objs
index c2b7664264..0fe2501017 100644
--- a/hw/sd/Makefile.objs
+++ b/hw/sd/Makefile.objs
@@ -1,9 +1,14 @@
+# SD/MMC subsystem core
+common-obj-$(CONFIG_SD) += core.o
+
+# SD/MMC host adapters
 common-obj-$(CONFIG_PL181) += pl181.o
 common-obj-$(CONFIG_SSI_SD) += ssi-sd.o
-common-obj-$(CONFIG_SD) += sd.o core.o
 common-obj-$(CONFIG_SDHCI) += sdhci.o
-
 obj-$(CONFIG_MILKYMIST) += milkymist-memcard.o
 obj-$(CONFIG_OMAP) += omap_mmc.o
 obj-$(CONFIG_PXA2XX) += pxa2xx_mmci.o
 obj-$(CONFIG_RASPI) += bcm2835_sdhost.o
+
+# emulated SD/MMC devices
+common-obj-$(CONFIG_SD) += sd.o
-- 
2.15.1

