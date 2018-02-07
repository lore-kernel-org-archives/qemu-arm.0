Received: by 10.28.71.27 with SMTP id u27csp1058103wma;
        Wed, 7 Feb 2018 10:34:48 -0800 (PST)
X-Google-Smtp-Source: AH8x227dpnXYTa4P0csxGfeinZ+BM4zjj0nbKdSmXu3WA6Yzc+FBS5rPChjsXSoj5UZ+R2JPbBUw
X-Received: by 10.13.250.3 with SMTP id k3mr4651941ywf.21.1518028488501;
        Wed, 07 Feb 2018 10:34:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518028488; cv=none;
        d=google.com; s=arc-20160816;
        b=SiSVV8omHMzOAu2QSkPbgn74owDGsCquQLBp4EdXpnFwAT2J3P0du7VnyugqYOuXBR
         iTQoJ9R1ESW3KSvMyLGKkJLI7LaJzyDozIbq3lj4zD1A/PLogkWSAoAhSIXxKGt2O6wG
         1KHgg9g8gZlDgADOiEsOEHt8/746raQTCpBgmqI/gUBmUK+UXdJ0hhckUf42ukR7hlyj
         tnBKcJlzuJpDBuWqxTCnlcl7jjfS2t+xztyB/d5w+H5Ua26FWya1rXxyUBuF42ZkYFtz
         i+ycZnFxr7KBeuQDkPT3QuFwNEFb1onfryf5eMaWzrPUTiYb9SG2QaDWUXrrnPAR79ul
         /DaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=sZp8aF6avIv4FuO7MfmdU5DFjxinRjlcQGqTNkIJbBA=;
        b=p64ahslyqAxhmmxuaby76v0cAtcRqgM+iliR/r+Ypb6NvPkt++A7pFFnL6e61Im3TF
         TVdRWHJz3/GhUWdZkG//OqBm8NUlwxyKJZujfdzg+3uGjhI6Cg10oLUeLT5mS3jz0ZwK
         goxgx5ksfP8vNoxCDRWX4nosc1Ifxf0Y2vHRdqC6lM7W4BUaKYZ8hdmY5f9EUTrWJw0e
         RMGWz+ZWAqnI+qdqYsvo8qL9llQ5VpRxY2kyeiDgESEA4idqAZ6EXRTvXv00Otb+f0Vj
         PYzse6cgpG4wvnie8IlXDzEeUpUcajME/fVEspSyVDhExYlw234RVoRUQkYasBHD6LU0
         +c8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=gltfbpzk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h15si360024ybm.368.2018.02.07.10.34.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Feb 2018 10:34:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=gltfbpzk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42822 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ejUYR-0007OA-Ty
	for alex.bennee@linaro.org; Wed, 07 Feb 2018 13:34:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34077)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ejUKc-0002WH-7L
	for qemu-arm@nongnu.org; Wed, 07 Feb 2018 13:20:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ejUKb-0005Ih-Cx
	for qemu-arm@nongnu.org; Wed, 07 Feb 2018 13:20:30 -0500
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:39478)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ejUKY-0005HH-Ai; Wed, 07 Feb 2018 13:20:26 -0500
Received: by mail-qk0-x244.google.com with SMTP id d72so2314389qkc.6;
	Wed, 07 Feb 2018 10:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=sZp8aF6avIv4FuO7MfmdU5DFjxinRjlcQGqTNkIJbBA=;
	b=gltfbpzkF1/mICmxFK7nNRp6CoJp+7nBrLgypKJlm0K5xtycAeg+CoKR92I/sUOF1O
	XpNUadsX50yz+FUBa6a63jsICOyqLgVfSljm/GoCjvknrCQmJRm8+tVCzHFBzNgnlTiu
	O96TuohZOPXhG9XV9DoQAB4Ed7Bjfmhbwaq65/uxqe/MQg/GQvl0yUShUYQfT3tyPbbm
	N6fFJDtloWux1R2FcRjmSN9ObTzHtTdYZ8sWnefRvjrjmJWqvbhpIgfYTJm8nolIIN+S
	Ii9IJbpI5Z1EaL8eOLXhoVDaj36V1ubNFWg+QqJ59MT99IGwrdfpMTYL6n7V9BRaPKWW
	sICQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=sZp8aF6avIv4FuO7MfmdU5DFjxinRjlcQGqTNkIJbBA=;
	b=eRNbRFaBroO8Vqbb8eR+5rLS25RdR3PPXO+d0f0ls1Vn1E+lNPYgfFJCOvPmMu+tod
	7ISsedj8CkL6M04Es67OcoHLwXvJFUhKFutKK6iMOiYuDb4WkCEUqcplrkFLrc3qVmmb
	UI23fru4nphxYxpePSg63NH6PtYwD4uSw5FgUSKsm78BlB8c79KL8z4S0f/VxN6CXdAE
	IMOLGS6aQOJg0iGvKJ311mSeP26iyZ0bmiqDnx0zuwYQG/mbGb/eUR1+akLCmsbvnEzb
	tlEXLI6ZmjlFwQj8bnzS/dbG8AKNtDV9YSyWwazdd1UtaargqCnSTYzc0y6vBOATO2rE
	tiIw==
X-Gm-Message-State: APf1xPB+Izg/1TTsgQ4bEA7ih7IRjbXs6wfZiqDZ0lOpcvbhTHtVQru0
	g5FIKLJYDwg3DadcMWAA2Ws=
X-Received: by 10.55.188.199 with SMTP id m190mr10442827qkf.92.1518027625910; 
	Wed, 07 Feb 2018 10:20:25 -0800 (PST)
Received: from x1.local ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id f7sm1426248qtm.21.2018.02.07.10.20.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Feb 2018 10:20:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Wed,  7 Feb 2018 15:19:28 -0300
Message-Id: <20180207181929.8701-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180207181929.8701-1-f4bug@amsat.org>
References: <20180207181929.8701-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-arm] [PATCH v10 15/16] hw/arm/exynos4210: add a comment about
 a very similar SDHCI (Spec. v2)
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>, qemu-devel@nongnu.org,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	"open list:Exynos" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: imlEm0mjaRF7

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Alistair Francis <alistair.francis@xilinx.com>
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
2.16.1

