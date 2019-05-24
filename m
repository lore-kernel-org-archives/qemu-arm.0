Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2978830wrg;
        Fri, 24 May 2019 05:43:12 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzScYjPVtoIDFZipqQPrg5ilulgx9wgxPv8dHA5SfmgY8p7MjHf3eJMgbyVfxJA7wH0or1S
X-Received: by 2002:a17:906:49ca:: with SMTP id w10mr37284817ejv.156.1558701792380;
        Fri, 24 May 2019 05:43:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558701792; cv=none;
        d=google.com; s=arc-20160816;
        b=x2eaMu3wqO4LmDZQH+kdxhc4GEtxxFsiK3d3J4H5HV9hlDHWZr/+ZK2H//KoiRwp8C
         jKWRC51/GH5mkddTHLoKKzTyQNzSF2PiN+pJiKLpq8NexG6/pBQSKPT9mh45AE+XAvMR
         PhPApBp9NdHT9aeGnNlPsdN0RYk+vcZo+QmpPJFY2ydYdkdJy31ATyGad3YBGTJ0QPiD
         EjUHkV5XCelhmZ6apXOxONAOJqWSHEcafvz0RVyBV4lGC+V8qBYmgQpWWLqxM29Ey2V8
         2VCqQ9EnpHV0V9wEzpynZUCX9qokTTtH+sB6JCXBnIzwdLFA11K5YTtgB1iqNJNjskIl
         DrvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=yMurcUMIFdpnP3p1to7MzM4fFIbcq3+mh+iTljVeSgE=;
        b=D2yq2Z7we8ud11vj7plXWn9/DD53pa5U81tOXLbLws8oWSukkl7FR6xVAL8bGL5e8y
         1gaUT07+lwZmoAgwg7ZHa4pmDbjqvOGJK0K61v7qmK6a+QCIiME6LsJoGKpxTkbtLJx9
         /GI58vByKAc0Y2iebpT3vSnohaDXPPCpWmvoXqKG9tf5QyetpsE4Uea4xOMML4BmCXAm
         00Uql6+STMAVgoPgb89MXDAwO4N9i6uF3Wet8O9mHmFGfIesPjlE1g3nL/T1INx12sEK
         g8MR49+5GWKt2/7ZjiXqTTnvdDH6C91zU6PbIWPNNV+qJ9La68ix0sT3SM5Ch5ynyTar
         FJ5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="VNxD/h6n";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c10si1851081edf.403.2019.05.24.05.43.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 May 2019 05:43:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="VNxD/h6n";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:54106 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hU9XT-0007Kc-EK
	for alex.bennee@linaro.org; Fri, 24 May 2019 08:43:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52660)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hU9XC-0007IL-HT
	for qemu-arm@nongnu.org; Fri, 24 May 2019 08:42:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hU9XB-0006LU-JN
	for qemu-arm@nongnu.org; Fri, 24 May 2019 08:42:54 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:40477)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hU9XB-0006L4-CN
	for qemu-arm@nongnu.org; Fri, 24 May 2019 08:42:53 -0400
Received: by mail-wm1-x344.google.com with SMTP id 15so9070046wmg.5
	for <qemu-arm@nongnu.org>; Fri, 24 May 2019 05:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=yMurcUMIFdpnP3p1to7MzM4fFIbcq3+mh+iTljVeSgE=;
	b=VNxD/h6nAE/YTUxcjWCj8jvSyhmCtE0GUjChyIYc1sIhZthl2+bk+B1nHta5I+S14m
	Qf9iE03/esogHzaNdbtm5R+0w93kojpcUTxJj6ucey/6tXcS7cBvc+cpU/Ur102kV+nN
	Uqn7beFzcfn7Yf6uzUnaiRAssQ/lV5rjg5OwTwJP1eLktwgkUJmqrN6rVM+1Vxz3PB60
	TKYls+541b5IRHI7kYMfbNHQnjYnOVtxBhJHBnQPdCj55zsMfcV0OS7T4aRaoIfXMmIz
	U8ud3Fb6naYRUmZuyNP7/unO+hUMp5LpgwZSAZu5iXnH909SrQaR3C8sx0JqcZ+l8lJ0
	m8tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=yMurcUMIFdpnP3p1to7MzM4fFIbcq3+mh+iTljVeSgE=;
	b=tRXw6OtV8uV9F6/g+isnE7b/FXSmFl4DZ6uMftBe3MfGXtqGdL4wwGCIrB6W1ME8qs
	YwGlQ475jmRfxjATrMQJCsbUiGg4g8M4phmVyCD2Gako+edSdH73JriDpCzb65njFhbL
	p0/ffwCj2TornjFjZeredBprtPyoYedxMHlfr9H9UG6v5TzOIKSjITE6VwOzl+zcG0/X
	bPkBd7kuPyktVUGuZ8L5Ekc3gJecs+fjdiLmmIYBeRhG6MnhtIl2iRL853FdOR2ksOWc
	mSA3OmvELsF01UWmmErLBL89yQRb7ezU2cO1x7NgOBWZ79X0y3U5U6s1YISP7tXeL9H9
	ozHA==
X-Gm-Message-State: APjAAAVtrTYQWT1bX6hz2wi0iVijznmMPe7RDfp2nVF7XANhaQi0G+JY
	1jkzRLFII+mFR9LJCpzdFyN32nQkbtkCDQ==
X-Received: by 2002:a1c:be0b:: with SMTP id o11mr16583199wmf.63.1558701772160; 
	Fri, 24 May 2019 05:42:52 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id t12sm2969854wro.2.2019.05.24.05.42.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 24 May 2019 05:42:51 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 24 May 2019 13:42:47 +0100
Message-Id: <20190524124248.28394-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190524124248.28394-1-peter.maydell@linaro.org>
References: <20190524124248.28394-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::344
Subject: [Qemu-arm] [PATCH v2 1/2] hw/intc/arm_gicv3: Fix decoding of ID
 register range
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YTJubgjNY843

The GIC ID registers cover an area 0x30 bytes in size
(12 registers, 4 bytes each). We were incorrectly decoding
only the first 0x20 bytes.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_dist.c   | 4 ++--
 hw/intc/arm_gicv3_redist.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/intc/arm_gicv3_dist.c b/hw/intc/arm_gicv3_dist.c
index 53c55c57291..e6fe4905fd3 100644
--- a/hw/intc/arm_gicv3_dist.c
+++ b/hw/intc/arm_gicv3_dist.c
@@ -533,7 +533,7 @@ static MemTxResult gicd_readl(GICv3State *s, hwaddr offset,
         }
         return MEMTX_OK;
     }
-    case GICD_IDREGS ... GICD_IDREGS + 0x1f:
+    case GICD_IDREGS ... GICD_IDREGS + 0x2f:
         /* ID registers */
         *data = gicv3_idreg(offset - GICD_IDREGS);
         return MEMTX_OK;
@@ -744,7 +744,7 @@ static MemTxResult gicd_writel(GICv3State *s, hwaddr offset,
         gicd_write_irouter(s, attrs, irq, r);
         return MEMTX_OK;
     }
-    case GICD_IDREGS ... GICD_IDREGS + 0x1f:
+    case GICD_IDREGS ... GICD_IDREGS + 0x2f:
     case GICD_TYPER:
     case GICD_IIDR:
         /* RO registers, ignore the write */
diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index 3b0ba6de1ab..8645220d618 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -233,7 +233,7 @@ static MemTxResult gicr_readl(GICv3CPUState *cs, hwaddr offset,
         }
         *data = cs->gicr_nsacr;
         return MEMTX_OK;
-    case GICR_IDREGS ... GICR_IDREGS + 0x1f:
+    case GICR_IDREGS ... GICR_IDREGS + 0x2f:
         *data = gicv3_idreg(offset - GICR_IDREGS);
         return MEMTX_OK;
     default:
@@ -363,7 +363,7 @@ static MemTxResult gicr_writel(GICv3CPUState *cs, hwaddr offset,
         return MEMTX_OK;
     case GICR_IIDR:
     case GICR_TYPER:
-    case GICR_IDREGS ... GICR_IDREGS + 0x1f:
+    case GICR_IDREGS ... GICR_IDREGS + 0x2f:
         /* RO registers, ignore the write */
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid guest write to RO register at offset "
-- 
2.20.1

