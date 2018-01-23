Received: by 10.28.71.27 with SMTP id u27csp3512416wma;
        Mon, 22 Jan 2018 18:21:12 -0800 (PST)
X-Google-Smtp-Source: AH8x224GY2qTkm71qUvypJgKoJE1zuU6V60rEhwee5g+W2DejSFj6PhRwAXv9DeKkmhbSNfLRRvB
X-Received: by 10.37.70.194 with SMTP id t185mr863629yba.400.1516674072482;
        Mon, 22 Jan 2018 18:21:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516674072; cv=none;
        d=google.com; s=arc-20160816;
        b=QY/mDa1bqBqcUoax/u7lh0Xf3pq9TYEf3xaDjKjcXrIMCrGDPYkExQR4VZdaaNb9st
         u3i7fnZFOj5XNdy9lunSkXNxklzzTVfQ0lEzP1Zol5O8MSahtQP3OOW/HfwPc4WRZmaC
         ClLD4I5juKojN6EcPxdKNCYNhP5jbGb/ZQbke5y8AVS7pGuNvkbjx50CwsRJ+Py/IFTe
         OWDzXxeJCGLvCMF/TQIAtQE7u+Io++UM0gQq7P8MHdcVXWScTf3nFm/SqOPz402006ax
         MBPTdWOKqVDN9q6QsKXzA6vFWbRSgGfjc81UUUKug9ptPcgAerDBgiRX+z/uB6PHVNZe
         umuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=BRzEVMZMGJDADCbOiKZGR+JZ1Gpd7YlXCdHnfX1OUW0=;
        b=xEapTb0+ktxlmBF2wakpIsrUJM2PT7lAdij9ZlgIwm1Lz9xVGAW50mlaGONS08amw8
         RVrx8QS1o0LbyhzcmQAzUYBT/IMAzLmtVsi0OX2UbJkAIZWVlzQR+FB0bhJBk6fQzNPq
         SMz0wUTg6ZiS3K+L+KPpZa/rRqRwW0zMtxhMzTSv2WC0Gisgbp3qvTKIxR59QyYKWqhb
         KVcX5fGkdFWU5grf4u/bYMLmmlA5fDkdvDKzWBm/XuyihXLlbHxXlRcmrf2Vm26Sb/EN
         Y18MEdrt2oN1I3PUCW3tYBrFq9OdHry6d9WQbkYP/jW5/0AJ+4/lFDZlwsZxU/BRfS3A
         wWAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XL3sPPt6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z206si2344543ywg.107.2018.01.22.18.21.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 Jan 2018 18:21:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XL3sPPt6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55351 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1edoD1-0006CA-Tq
	for alex.bennee@linaro.org; Mon, 22 Jan 2018 21:21:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48884)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1edo1h-0005ne-9n
	for qemu-devel@nongnu.org; Mon, 22 Jan 2018 21:09:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1edo1g-0003kp-C1
	for qemu-devel@nongnu.org; Mon, 22 Jan 2018 21:09:29 -0500
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:35895)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1edo1g-0003ki-7F; Mon, 22 Jan 2018 21:09:28 -0500
Received: by mail-qt0-x241.google.com with SMTP id z11so26115693qtm.3;
	Mon, 22 Jan 2018 18:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=BRzEVMZMGJDADCbOiKZGR+JZ1Gpd7YlXCdHnfX1OUW0=;
	b=XL3sPPt6JFpkzzKitlMl/MRC1CA/0ZmCtGfDjO2Rul4XcMDfEXtZsMXemUgReSwDv7
	q+kT+nmCSQ8VQ4qUdXMbOzwBg1Z/JUuJKgd32aiP0BZ+pXeiqskfyyFgfwnKSfC2Q8Wc
	KRmSse5yDt8iBjNvD1cog6HS2Uo8FjBeuLEMFJr1ME7U5IIQZVkJKWZB7b9870A58jm+
	cTp8iRJahzXBQFLBwaJG3/gLGnitPc/Aq8RBQr001ihSQtr9qJXYu+F/ZupeIvBTmjmv
	s8GA7uBnICsD4rcB/3gCnUr8+oAdyGbm9ikHuZB6V6GYTYsWO3Uto3vESAvCjNaMx5TD
	8sPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=BRzEVMZMGJDADCbOiKZGR+JZ1Gpd7YlXCdHnfX1OUW0=;
	b=qvlgngHrMuHivCAFiyZ7Ywb0k6PfK23jUMvXulbwUqvlnivSWJOF5S9jNSinDDvcc/
	czq5lOmthjgm8C92akOQTWrj1m67AfmhE3dbzqE2pfS9U8bBSQnnRnjEXauPN1T2LNdH
	IRmKfU8K3FwqF3vsFaE1OzesS6Jvh8XnhTT+A5BFQNgvA/L6QGDjD0KU76UvQikkl3Tn
	uWutIJPTAa/v0OaOTNP6vbXNSguDUEFabsa1HnBm2oJmqwxpcLn1HZjMdSa96VGSoh95
	PqyAXDibKLCWTlUyUVwHmWiCnl0awMG2jOPHraftnBFeS8ngogOYQXtEN/5TjBTMDuux
	xMtw==
X-Gm-Message-State: AKwxytehJYli01/11FSgLtyA6fAkg1PNNbSUQRAuWQ1rTJZrAHw07Bw4
	kWdVGAN77Qw4fpaPHRjzzjI=
X-Received: by 10.233.239.23 with SMTP id d23mr1462468qkg.180.1516673367852;
	Mon, 22 Jan 2018 18:09:27 -0800 (PST)
Received: from x1.lan ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id j19sm6514120qtc.1.2018.01.22.18.09.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Jan 2018 18:09:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Stefan Hajnoczi <stefanha@redhat.com>
Date: Mon, 22 Jan 2018 23:08:19 -0300
Message-Id: <20180123020820.1288-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180123020820.1288-1-f4bug@amsat.org>
References: <20180123020820.1288-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-devel] [PATCH v9 15/16] hw/arm/exynos4210: add a comment
 about a very similar SDHCI (Spec. v2)
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
X-TUID: qIluVYxy0jf3

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/exynos4210.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index d89322c7ea..06f9d1ffa4 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -377,6 +377,18 @@ Exynos4210State *exynos4210_init(MemoryRegion *system_mem)
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
         qdev_prop_set_uint64(dev, "capareg", EXYNOS4210_SDHCI_CAPABILITIES);
         qdev_init_nofail(dev);
-- 
2.15.1

