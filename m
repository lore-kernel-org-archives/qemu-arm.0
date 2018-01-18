Received: by 10.28.173.206 with SMTP id w197csp6865412wme;
        Thu, 18 Jan 2018 10:38:34 -0800 (PST)
X-Google-Smtp-Source: ACJfBotJ6wO7IGzpcteseR3DYhfr+HjsnIkTKEFktmahcr1SghIwQtGLnaIiB0SvOn25atbErpsC
X-Received: by 10.37.160.144 with SMTP id y16mr37509243ybh.260.1516300714245;
        Thu, 18 Jan 2018 10:38:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516300714; cv=none;
        d=google.com; s=arc-20160816;
        b=mJNWWK49Qnd14aUM+UbbmIEIF8LemMqSppLBhPR5lmIEj5jepJv9Uy/0hcNDoAJHEX
         eM/8djfgNhYS0Vt3SRoktBk918sm8gtyaqy+vv+tzOd505eDOP9Sy3ldpkbWFVR0ho1M
         d1DcAvYfHopoPNDdkeOSFkAqSGwqOvTiqmy98vdTWYiIyB8tXRCk14MLu5SZDTyVjbDL
         LY2FU00iN+HkOKq8Qssc8UnHiwp8osLH2OaRllzUMbnUhjTX4eCzCUa+mnjF3cOnHhvW
         rPnZMwIjBjNe/szP9fryUznUPHcCrRCKz+1Ai/TqSOR2rcEbKZflZvnUmMy54gjSNAMg
         yP8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :references:in-reply-to:message-id:date:to:from:dkim-signature
         :arc-authentication-results;
        bh=w4cF8nBWMgtYO8vYeoe5XnN1zsLEoTSdpZMqL5PVRxQ=;
        b=C/qdWxNy2k7+Dk7RX5u+CFrPlmhBVSUZ5FKWE8B9i+lNVoc2H8qXC2Q1HOsCdtUIS7
         Eh0MDz1ADGpkFV3L/qB/kCNSM+DNzM35BgCFgCA6P/lWJIxWg8/eoguaXWezR9D/7l0B
         xvwAejJdcFdZac/ZOm9Okq9lKTdp7kd6itnKIDkhy3KljhE+qIh3hSbmPNGiKGyx1RYp
         DYVAC1I4td285PATlIXc0VO1p3S/6Ie6DLXTkyxniflXbshJB6YESte7ExNDraojvEwm
         rTtHX4Pbvf5pkFoAGBzWpuVNOjJ7Gs0UcAZe4QS0fQuyu4szaflIj5HrgnSes4Dere1Z
         PwLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KjrHioNR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c126si1843481ywe.179.2018.01.18.10.38.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Jan 2018 10:38:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KjrHioNR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46824 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ecF57-0003m2-Jx
	for alex.bennee@linaro.org; Thu, 18 Jan 2018 13:38:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38268)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ecEzU-0007ZD-3o
	for qemu-devel@nongnu.org; Thu, 18 Jan 2018 13:32:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ecEzT-0003cu-1D
	for qemu-devel@nongnu.org; Thu, 18 Jan 2018 13:32:43 -0500
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:44366)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ecEzS-0003co-Sm; Thu, 18 Jan 2018 13:32:42 -0500
Received: by mail-qt0-x241.google.com with SMTP id m59so32643207qte.11;
	Thu, 18 Jan 2018 10:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=w4cF8nBWMgtYO8vYeoe5XnN1zsLEoTSdpZMqL5PVRxQ=;
	b=KjrHioNR0n6NXSjAuzwb5HeqBqOxCPUVymZ8U63PxipSNTSwW8oH2SRa/QJCjAzD8c
	9Z9ltDMh7ro1yskl7Cd0YZZGzeSuUGapQaeL9uEp58NSU+B6uBliU5lGAvhbv5TB86xl
	reW+tsPUdmeCm3euslle0NORATpim4RhV1dT2yxoi1mowsGskcaNJeU/QbaurPUVxHIr
	0AO2KWuxe56/ACh3hqV+HP6GP4qOwY+hd3ATbsN+g/LxjdslNpIFJNlCH1BoLyV7OJPv
	7R8MidGlS/Z2HW8d3uSEZ/PMnGvhkJThIxXTAYMIuObDdhHUTAWLeAS5m1FVOcKWtOaU
	Kz3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=w4cF8nBWMgtYO8vYeoe5XnN1zsLEoTSdpZMqL5PVRxQ=;
	b=LuSrlCQpL6Bqtp41N9UxRWnM6ajKS+3zRIN2RYjFRUJT9f1PUex9WVEzAWUoaYzXfo
	iiTsoOfnb6BAATOKaiHmpCM6M70EwxIIch+q3KQ02uUwQtx7DSJn5HtxVvrnbfFDORvm
	Hmn3WQ3Zr3sTg0bt0QOl689g8n5xlne0tDqJX5TWVrU2atL1DkmJlh7+vONMSY4KexZW
	03+9Gxg2z18QpXpm4PmZqMZOiu78MHL50pB2KRWca3XlKDm4mCoQxVleQth6tf51wa3o
	i+ZXBAA+QfXlmtVgqCKV0oWdm7UBgXyUMdAq5DGfR74iW669T6XEDnpL1tOUlDF0b1j3
	5E9A==
X-Gm-Message-State: AKwxytdvI5Qj5vqpUWGpEKmaKWAtEFmc9YzhlMx1vbcANn38mUljoaEa
	KxxdZV3bdVMtjoCXIF7lvn8=
X-Received: by 10.200.40.194 with SMTP id j2mr9552786qtj.154.1516300362452;
	Thu, 18 Jan 2018 10:32:42 -0800 (PST)
Received: from x1.local ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id g9sm446661qtg.90.2018.01.18.10.32.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Jan 2018 10:32:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Stefan Hajnoczi <stefanha@redhat.com>
Date: Thu, 18 Jan 2018 15:31:07 -0300
Message-Id: <20180118183108.16009-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180118183108.16009-1-f4bug@amsat.org>
References: <20180118183108.16009-1-f4bug@amsat.org>
In-Reply-To: <20180118182510.15630-1-f4bug@amsat.org>
References: <20180118182510.15630-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-devel] [PATCH v8 16/17] hw/arm/exynos4210: implement SDHCI
 Spec v2
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
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Krzysztof Kozlowski <krzk@kernel.org>, qemu-devel@nongnu.org,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Kevin O'Connor <kevin@koconnor.net>,
	"open list:Exynos" <qemu-arm@nongnu.org>,
	Marcel Apfelbaum <marcel@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Q8v1TD6CzPH7

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Alistair Francis <alistair.francis@xilinx.com>
---
Krzysztof kindly checked those values with Manaul, the Samsung datasheet :)

 hw/arm/exynos4210.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index e8e1d81e62..e70e234f58 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -75,7 +75,6 @@
 #define EXYNOS4210_INT_COMBINER_BASE_ADDR   0x10448000
 
 /* SD/MMC host controllers */
-#define EXYNOS4210_SDHCI_CAPABILITIES       0x05E80080
 #define EXYNOS4210_SDHCI_BASE_ADDR          0x12510000
 #define EXYNOS4210_SDHCI_ADDR(n)            (EXYNOS4210_SDHCI_BASE_ADDR + \
                                                 0x00010000 * (n))
@@ -377,8 +376,26 @@ Exynos4210State *exynos4210_init(MemoryRegion *system_mem)
         BlockBackend *blk;
         DriveInfo *di;
 
+        /* Compatible with:
+         * - SD Host Controller Specification Version 2.0
+         * - SDIO Specification Version 2.0
+         * - MMC Specification Version 4.3
+         * - SDMA
+         * - ADMA2
+         *
+         * As this part of the Exynos4210 is not publically available,
+         * we used the "HS-MMC Controller S3C2416X RISC Microprocessor"
+         * public datasheet which is very similar (implementing
+         * MMC Specification Version 4.0 being the only difference noted)
+         */
         dev = qdev_create(NULL, TYPE_SYSBUS_SDHCI);
-        qdev_prop_set_uint32(dev, "capareg", EXYNOS4210_SDHCI_CAPABILITIES);
+        qdev_prop_set_uint8(dev, "sd-spec-version", 2);
+        qdev_prop_set_uint8(dev, "timeout-freq", 0);
+        qdev_prop_set_uint8(dev, "max-frequency", 0);
+        qdev_prop_set_bit(dev, "suspend", true);
+        qdev_prop_set_bit(dev, "sdma", true);
+        qdev_prop_set_bit(dev, "adma1", false);
+        qdev_prop_set_bit(dev, "adma2", true);
         qdev_init_nofail(dev);
 
         busdev = SYS_BUS_DEVICE(dev);
-- 
2.15.1

