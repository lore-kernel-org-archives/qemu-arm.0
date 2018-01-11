Received: by 10.28.173.206 with SMTP id w197csp1016932wme;
        Thu, 11 Jan 2018 13:07:18 -0800 (PST)
X-Google-Smtp-Source: ACJfBot0TGUtTtiS5JypoOH041WtHz3FuHnAUQSnH2kF7BV5uKiQNLBmo30BKuLP6K3xtzIxR5MU
X-Received: by 10.37.184.200 with SMTP id g8mr21983950ybm.30.1515704838562;
        Thu, 11 Jan 2018 13:07:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515704838; cv=none;
        d=google.com; s=arc-20160816;
        b=x1VGdYtI7XC/41en7XkXkuW+vg0k3HmomT9vnayY3DQnegr6BPiaKpPx6uh/cxKsJf
         +hFxMLIf59TW1Ie/t/w6JMD+AU78B77V7XY0ye4FG40hhgn0pEMDLUI0+nbmyYvOONB3
         Y+Uu2ZX6ziAeCjmwltZmh2FhCQhOBqrkN2PsLI2JXi4l2KF1t614PV5bwPAcRbokGqKu
         RlpXGg8Q2qVDAZYu1MNeOqtc8CrLMGrBmodzm6C8cxKi2NEdzMS4dbSJcUN92PBXD1L+
         ovakZE0ulV45LHoWHMXm4r43PZfVvIkq4O6F5+OmkPFb2tntmu+AaASXM3+C0/htj4PG
         QXHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=vSz663hxt9kCgV2WJCKUifLEv6n3AWYNiInFUzwPrDE=;
        b=kL0CdHdBqGt7f4qmgbLQbBwQIiUXhc9gjQYhVbRUxLIEhwKMfYnl0vTazQR/8KPALc
         tLUg/fNLsR1je2Q3f06SNjK2YeHbnyp3IoV85xUkg9PhXkqgPZRBOrrTdJOSZA7hputg
         U44shviVDJS0pGPWAyKuLer8mmqSS65HDnjxithYcPF7GYwtufk7dIuZzYqMnOyJZMSY
         MjII09+aPJgxN65L5rnngraKPSYVCCR4Z8Toj5MdquiTlN7LiUYkTdC8l1JiC1Iacnf6
         3JElsymyL1yiAZEAEnXofrAPKFTBeOIp1SATnCUjSZ60aRQ1QGasaFsM3DuJpT78NoY2
         SK6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=QoTA68Qf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m30si946055ywh.359.2018.01.11.13.07.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Jan 2018 13:07:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=QoTA68Qf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42409 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eZk4D-0005xX-UE
	for alex.bennee@linaro.org; Thu, 11 Jan 2018 16:07:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59437)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eZjvA-0006QT-P3
	for qemu-devel@nongnu.org; Thu, 11 Jan 2018 15:57:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eZjvA-0002wN-0q
	for qemu-devel@nongnu.org; Thu, 11 Jan 2018 15:57:56 -0500
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:46866)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eZjv9-0002w9-T5; Thu, 11 Jan 2018 15:57:55 -0500
Received: by mail-qt0-x241.google.com with SMTP id r39so3553181qtr.13;
	Thu, 11 Jan 2018 12:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=vSz663hxt9kCgV2WJCKUifLEv6n3AWYNiInFUzwPrDE=;
	b=QoTA68Qf6Jrkhknqh2vr7wcX+bidQaLq4gsr9nZ5vVX8ykpC+Cfg2tI3TQMueFPw+p
	Xp5VajHNH1FZgYad38LQVc7k9Lml7dOOIyXTZZhArfbx8NZwMH8KDrdH0Rwgd8UXysju
	Pid3mmgBGBBEAWcezHJxD502Ok7UyRseez+X9OYnX4VQ/p/xkRc+iAHhf2Ce0UyBmFtx
	AjOsiq9BOPWv90CAM6YkrWKIKYNXbYPBGm+XoWQRpB4tIMSuF+Wj7WDEBadOI0FPNQQ0
	z8ch4kLqr3Der+W/AeEucFhamfXAwVtmJYW/8a0xSf5AQjNQeGSZGS7lMMYhUotU9eMZ
	cbpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=vSz663hxt9kCgV2WJCKUifLEv6n3AWYNiInFUzwPrDE=;
	b=bXBOHUkqPlKNzEkIyLRYCYBdybxZPt9HDIL3y87k0nHjhEJ9lfIjebY4A//vlrhR0E
	kNlr4teGdyylQOhH63WJAKVhGh8K/t/QTripr9VL9PmYfT6p0cj6ZjblKEfJZV4CDukV
	qQbkLjEGePejfVO4XmlqgkHXAbqyor+Xm1f8yhL9dtf0TGwIKCIex8jd7G56UwPMTaMF
	vFEUF6KVB5nnwFjqLtXi4QfqLyg4zOf3Y0eZrvOG7Ra5RMumq1+wEFacSLyPZN84nup1
	nHH9i7PXj5FMqA/j8JNl0OL0CwhW7frn8Dp33R9DaMZYEOZrReDaMV+nGkUmBmOG71oZ
	MscQ==
X-Gm-Message-State: AKwxytcVkKiC5R4Xf68/XGV3oR3hinfHNqavcbjzuEY3sxQzKFs2XD1z
	Tcun773eFUElGWxYxgyK+XM=
X-Received: by 10.200.58.228 with SMTP id x91mr33712397qte.323.1515704275375; 
	Thu, 11 Jan 2018 12:57:55 -0800 (PST)
Received: from x1.local ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	c1sm12818399qta.52.2018.01.11.12.57.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Jan 2018 12:57:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>
Date: Thu, 11 Jan 2018 17:56:19 -0300
Message-Id: <20180111205626.23291-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180111205626.23291-1-f4bug@amsat.org>
References: <20180111205626.23291-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-devel] [PATCH v6 14/21] hw/arm/fsl-imx6: implement SDHCI Spec
 v3
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
	Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3oHiT6iCy2A1

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/fsl-imx6.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/hw/arm/fsl-imx6.c b/hw/arm/fsl-imx6.c
index b0d4088290..e7d13d54e6 100644
--- a/hw/arm/fsl-imx6.c
+++ b/hw/arm/fsl-imx6.c
@@ -348,6 +348,19 @@ static void fsl_imx6_realize(DeviceState *dev, Error **errp)
             { FSL_IMX6_uSDHC4_ADDR, FSL_IMX6_uSDHC4_IRQ },
         };
 
+        /* UHS-I SDIO3.0 SDR104 1.8V ADMA */
+        object_property_set_uint(OBJECT(&s->esdhc[i]), 3, "sd-spec-version",
+                                 &err);
+        object_property_set_uint(OBJECT(&s->esdhc[i]), 52, "timeout-freq",
+                                 &err);
+        object_property_set_uint(OBJECT(&s->esdhc[i]), 52, "max-frequency",
+                                 &err);
+        object_property_set_bool(OBJECT(&s->esdhc[i]), true, "adma1", &err);
+        object_property_set_bool(OBJECT(&s->esdhc[i]), true, "1v8", &err);
+        if (err) {
+            error_propagate(errp, err);
+            return;
+        }
         object_property_set_bool(OBJECT(&s->esdhc[i]), true, "realized", &err);
         if (err) {
             error_propagate(errp, err);
-- 
2.15.1

