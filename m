Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3365531wrx;
        Mon, 15 Apr 2019 18:39:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzsOOMOhpYoQ6LdkybVYqxObpvW899DYtOAhy2PR6ELLqJCu9tvce6NxUOx6xNmS8wuw+ul
X-Received: by 2002:a5d:428c:: with SMTP id k12mr35184434wrq.279.1555378790791;
        Mon, 15 Apr 2019 18:39:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555378790; cv=none;
        d=google.com; s=arc-20160816;
        b=aIRP5FCVji+TqI7vNKQljXkRiYRfDtrw04YPjqJO3TXC5i6LcwBa16Utjnt2bFcGnb
         +DoYmPIMZs1oxhRh/asHxkEaxYOH9DeRhu2r3yu26YMWlkzP97AVMj2PA0aynaC8bcpN
         JjGuzachINmoYJkxRxAlxqpeustFvv+bLRXNRaasbfFnsBGW+W1hhpoBbNtPQSrBRLfA
         VoCXvkhe9EKMm99uGnQYju7ZWRh+sMvogKldFDHTs1ZwEHDIO2EljjEBbB9rRl8N0Omh
         3gZmRYDqn5jEF/tgp8MZOh054VAPUuxcFSYP+rk4I1pLvuzaSLTP0aLoK4JrxmExlp5y
         hJ5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=mAOovaqXC3eW8KbfZy9zueBheQL2BmRbn3rOTUCb8bM=;
        b=WEUZjzIrukvsup7yorHCpWwo04D95lp6qmspu2V4NgF+JWjm92x6BiHDWs6aICdAoY
         BBGECerpbiPcL61LwdZ1rGOf7HRaaacLJv5BleUqlMQpjG1ITk2c5l+AO/zid7YYNXOx
         yWYW7ZsJ8vpOnCvD6n/tTJrLMLxYJdSDo3Ij2n4ex5OfWHXmPq99/MkScSOjQjAjveG6
         46DDfr+sPv3gn09UCpoUY4Ysbs+TTiyv+4IGLs2T/mr5LQCPxU2mGCXxPQTjnGfRi+A6
         q6CK3Qus8R1vpkcTgOEqCfPaD+Lp9fa6ldMH67iGhmW3Yob0Pdy9yj83c2NiQ8Hm17Bo
         8leA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=B0Uvp4MH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p193si11618954wme.184.2019.04.15.18.39.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Apr 2019 18:39:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=B0Uvp4MH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:57778 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hGD4f-0006SD-QD
	for alex.bennee@linaro.org; Mon, 15 Apr 2019 21:39:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43958)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1hGD4P-0006Rg-CG
	for qemu-arm@nongnu.org; Mon, 15 Apr 2019 21:39:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1hGD4O-0007mZ-Fc
	for qemu-arm@nongnu.org; Mon, 15 Apr 2019 21:39:33 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:41511)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1hGD4O-0007lw-8r; Mon, 15 Apr 2019 21:39:32 -0400
Received: by mail-pf1-x429.google.com with SMTP id 188so9522595pfd.8;
	Mon, 15 Apr 2019 18:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=mAOovaqXC3eW8KbfZy9zueBheQL2BmRbn3rOTUCb8bM=;
	b=B0Uvp4MHidxmn1CzZFKEJJmu4P3IKq9j7g4bQ9NfDvTQGhTH/jPqfshiIeaeUX9Vkx
	+QsC1YuvANTEV8L68r/KYog2U++BHuwDBlNzIkB50aAsegzF5UGtYZU+Ocr8QY8EF9My
	ju7UujWCCbmteXtaLN7uNyZVSz90lkoX5gIaYm4vqhQI39W5A+MovgQQzqKZQksIKaaq
	KundtRgSryWIwDH7nz67YtbdWLiAiziW7axYA0pU4R5v4AC8Z6ZCG0Jd8Vpqs0ijsrkt
	PdhanK/zVwCEMnBdyyVDnJcvu+cL4hjaW1KqSO8gbNKKvWGosvGEn8OXi6R+34Dlj0Ra
	OjYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=mAOovaqXC3eW8KbfZy9zueBheQL2BmRbn3rOTUCb8bM=;
	b=fzypunVzdEtdm+atPWpy+Tpacz3xLntmU6zdkvq9vRrReBjc+vGIo94AJlSDH9ASlH
	uGSCk4f+z3L0SzbRlR6tFlY7mJs4inRfyVB4ZNLZjYnRpZZJeIg87dsqcUcjXk4drrj7
	72Gby5YmZzoGwhl+FYub1v9rfYK71kqO5qv9VDFMqbLWgO6DnHluZZizb/BMf2A/RqnY
	/sBbyN8rG8vHOYTzKUZZu8M8lfAhdgsH9FwxsoxAxVaefTII4X1ldEhMNYLl2IvzSUus
	qfzX/iEDiQB3NVD6cTwEEP4uF6KzDrWnJpaE7kimm5ffQlJh63v4rGbZ7miUJNMQRiwN
	9VWg==
X-Gm-Message-State: APjAAAVs6UlmGu4A7XRxbdmDSDNOxrGMe28g1ZekY/o/ao4K/dVcwBpE
	R2kgWtCxkooFph1VEnPZZ8jClw7S
X-Received: by 2002:a63:115c:: with SMTP id 28mr44654575pgr.270.1555378770144; 
	Mon, 15 Apr 2019 18:39:30 -0700 (PDT)
Received: from squirtle.lan (c-24-22-235-96.hsd1.wa.comcast.net.
	[24.22.235.96]) by smtp.gmail.com with ESMTPSA id
	v20sm74710362pfn.116.2019.04.15.18.39.29
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 15 Apr 2019 18:39:29 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon, 15 Apr 2019 18:38:58 -0700
Message-Id: <20190416013902.4941-2-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190416013902.4941-1-andrew.smirnov@gmail.com>
References: <20190416013902.4941-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::429
Subject: [Qemu-arm] [PATCH 1/5] i.mx7d: Add no-op/unimplemented APBH DMA
 module
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	"Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tlKDXaWDpwy9

Instantiate no-op APBH DMA module. Needed to boot latest Linux kernel.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
---
 include/hw/arm/fsl-imx7.h | 3 +++
 hw/arm/fsl-imx7.c         | 6 ++++++
 2 files changed, 9 insertions(+)

diff --git a/include/hw/arm/fsl-imx7.h b/include/hw/arm/fsl-imx7.h
index d848262bfd..aae4f860fc 100644
--- a/include/hw/arm/fsl-imx7.h
+++ b/include/hw/arm/fsl-imx7.h
@@ -179,6 +179,9 @@ enum FslIMX7MemoryMap {
     FSL_IMX7_PCIE_REG_SIZE        = 16 * 1024,
 
     FSL_IMX7_GPR_ADDR             = 0x30340000,
+
+    FSL_IMX7_DMA_APBH_ADDR        = 0x33000000,
+    FSL_IMX7_DMA_APBH_SIZE        = 0x2000,
 };
 
 enum FslIMX7IRQs {
diff --git a/hw/arm/fsl-imx7.c b/hw/arm/fsl-imx7.c
index 7663ad6861..1abfa5910c 100644
--- a/hw/arm/fsl-imx7.c
+++ b/hw/arm/fsl-imx7.c
@@ -526,6 +526,12 @@ static void fsl_imx7_realize(DeviceState *dev, Error **errp)
      */
     create_unimplemented_device("lcdif", FSL_IMX7_LCDIF_ADDR,
                                 FSL_IMX7_LCDIF_SIZE);
+
+    /*
+     * DMA APBH
+     */
+    create_unimplemented_device("dma-apbh", FSL_IMX7_DMA_APBH_ADDR,
+                                FSL_IMX7_DMA_APBH_SIZE);
 }
 
 static void fsl_imx7_class_init(ObjectClass *oc, void *data)
-- 
2.20.1

