Received: by 10.28.71.27 with SMTP id u27csp1052108wma;
        Wed, 7 Feb 2018 10:29:24 -0800 (PST)
X-Google-Smtp-Source: AH8x2279S+Y55rvPtr5leH24Yiu4PghxVPsZaNyH0J9WogwIYLT/IKACrtOxJZSIxeBoYWu3x6Jq
X-Received: by 10.129.73.142 with SMTP id w136mr4576218ywa.437.1518028164195;
        Wed, 07 Feb 2018 10:29:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518028164; cv=none;
        d=google.com; s=arc-20160816;
        b=VCI2iKVuvD39VSy8BfrlLDKAT1r7ZnOxIePNrtZuR5VupK1EUbjcSco+APpgUhQdvo
         rlipaw59tL3C2v5jcuVoWW0kQRbQDnbSYnRyhxdmXqTcRZ88eWGXZALU6XyHEWfXrvFW
         8NJi1aYeF+dhn/LAGXqtVopAu67wtczmSvurIYahe7JiznK8yTIozqrsyjb+4SSzC8TL
         GTrblkwexlES2dfnYpXM7htkzNVJvbO4m6TFNGsvEHi9Ik8H51H/euSMhpHbv2QqoP/T
         Gj5e06w0ZZQU4kOQTZLaYS/3/gD6rB17XHgS3FJxevyey+tf5EV+mMJsT6mn/EDYveof
         A1YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=wY//D2TOSIUxA/+3Tz/qnHcjRg6V0zzmBzdlX6DyMlw=;
        b=xCYoDX1wTrIaqFqpytlqxKG9nVO4BX/1iNJZYmQgv9Yr8izlZr9qH1IqTM50TXRw1v
         wtXKdK7WclJCjd/tkEKKlaSmPI6zEVeYOJL+LZlP96noNM5mlrHvE7yq18G+hVcX3sDP
         /NmGc0L5TVdCXNUxPbGePt8OIkkYVi9cUPvsWX7IdGzrfHWVBIIYXNvFuN75orRyKsGI
         P1OAhx0rK0YIT3w81Bm0kPaoxwGKKgIk2KBW+yhUn9vOMV056nUDANWRyDf3/F3BkhNe
         whI1izi694OXsX74lIpiS9shZKuvj6GXQhbD+vzthPNO+cPxMciRycbgr6BYPgtUb/rp
         WyRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=V3/gXe9a;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r206si361280ywe.629.2018.02.07.10.29.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Feb 2018 10:29:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=V3/gXe9a;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42238 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ejUTD-0001dZ-H9
	for alex.bennee@linaro.org; Wed, 07 Feb 2018 13:29:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34039)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ejUKW-0002QY-3a
	for qemu-devel@nongnu.org; Wed, 07 Feb 2018 13:20:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ejUKV-0005Fe-7S
	for qemu-devel@nongnu.org; Wed, 07 Feb 2018 13:20:24 -0500
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:45167)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ejUKV-0005FR-3I; Wed, 07 Feb 2018 13:20:23 -0500
Received: by mail-qt0-x244.google.com with SMTP id x27so2869535qtm.12;
	Wed, 07 Feb 2018 10:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=wY//D2TOSIUxA/+3Tz/qnHcjRg6V0zzmBzdlX6DyMlw=;
	b=V3/gXe9a/lwduyV4hHBd7RFU5Ttcw1gdz0GM0XIduOtdjcsyaTjWMK3e2sEHDQ1n0l
	7GB0Du9gj+mjA70oVbeWqPuNgo1118QxQGA2xFRQowdXGnR+TmbCqJrWNNJjUkmiozp4
	uGLPGPmZmrToWIqWnM2RHmRyP5K/M5Lm9DGAHQIglym0wdTxV0S3ksRlTFGXhOfjiU9h
	qTzRAtvYY0UvV+ZhPV/ZzmKtKJkWkuXrS1E/dP1TATaFyaeRuriy91hYbGAbEOpUEdP/
	/+oHOA6PjE79NPKS52CmGSVPE9ZOe6d7LJe1Kq2HwXU3vpG3AGMXcqJLIS7DRDTPlX1h
	Bh6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=wY//D2TOSIUxA/+3Tz/qnHcjRg6V0zzmBzdlX6DyMlw=;
	b=C3e5+XHjP5tQxA3IbUyVkK4w5D3GIXGIHmj0wKEcYVWBjz7576tEQv9+wPafXarK6m
	QOfzs4zhMOepqEtLzBndeS3rj0dBSkB9hIco4BFP47sXR8c0y4jtUYXQz+/Kl2eV+E8E
	nZ3DdhDo/tScWpB5RVk1VooNM9AZAw2u3NCcYGpHeWwpT3cmYrtr3L+jh2p2bbBtry+T
	xKT7h0s9xIqbOlmRz6Oq4ESQ0sTjdGA2Lymif055FLteZBD/lSsTKsgp2eImKpnPUdyr
	nFNzvTXD4gGgGeguxGZwG+JAofgK7w+trRTB8dxDlL88K+gIziH3kVznFuvyFyAmn/S5
	a3Ig==
X-Gm-Message-State: APf1xPBnCaiW4tMxSpKL2oE7UCzOKotJ1saVvdu501QkSdB/f6IfcnMK
	F1z5Z+dWCSRTSTZGf12KmUA=
X-Received: by 10.237.38.101 with SMTP id z92mr10358047qtc.62.1518027622702;
	Wed, 07 Feb 2018 10:20:22 -0800 (PST)
Received: from x1.local ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id f7sm1426248qtm.21.2018.02.07.10.20.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Feb 2018 10:20:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Wed,  7 Feb 2018 15:19:27 -0300
Message-Id: <20180207181929.8701-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180207181929.8701-1-f4bug@amsat.org>
References: <20180207181929.8701-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-devel] [PATCH v10 14/16] hw/arm/exynos4210: access the 64-bit
 capareg with qdev_prop_set_uint64()
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>, qemu-devel@nongnu.org,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	"open list:Exynos" <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5VkIoM29GYqY

We only set a 32-bit value, but this is a good practice in case this
code is used as reference.

(missed in 5efc9016e52)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
---
 hw/arm/exynos4210.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index e8e1d81e62..d89322c7ea 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -378,7 +378,7 @@ Exynos4210State *exynos4210_init(MemoryRegion *system_mem)
         DriveInfo *di;
 
         dev = qdev_create(NULL, TYPE_SYSBUS_SDHCI);
-        qdev_prop_set_uint32(dev, "capareg", EXYNOS4210_SDHCI_CAPABILITIES);
+        qdev_prop_set_uint64(dev, "capareg", EXYNOS4210_SDHCI_CAPABILITIES);
         qdev_init_nofail(dev);
 
         busdev = SYS_BUS_DEVICE(dev);
-- 
2.16.1

