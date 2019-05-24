Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2978818wrg;
        Fri, 24 May 2019 05:43:11 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyrFoLudJLgVZHtnIJcOKWt1QyU2/slAzKK0jtAdANFZB0mGt+163dY9yAuft3hBRXgvbr/
X-Received: by 2002:a50:9470:: with SMTP id q45mr104969869eda.269.1558701791553;
        Fri, 24 May 2019 05:43:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558701791; cv=none;
        d=google.com; s=arc-20160816;
        b=iN3aEgUQTvzoU63vej3NTbBBYaPZVS9gfRANOJiO187hLk1m2+2M8MxZ3o2+UewemI
         Mm6O5ZRxR0e++3NjfcaQuRnPFb16UPZXlWGHQsDQe8Hc5hHhsc3yL+u9X+A6uONgrYhL
         zfYPsLXwnZpU02ukWOZ5JkNBSDiQtlSIoJookpMSeJdOUggxX1/iLXPA9SxEreyMa5OV
         T52I3JjbTBq41ipBwZ7qm3NsvC7lyb2Q3ojpFkMVMF4XKYL55VH//b6u2qedMI0+TpF7
         KFSL14mUUGvVUEmckg44WOgRJ9YvIs2bdpZ9Si0JtV4+geVD4CN1wha9u0GFCnKj2Zib
         PO9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=FTfH2Bmgd6/uhQsHPCYg8B8J/1/AvPfs4Sq0ZaLk7QE=;
        b=uW4qzGaCXva+Wu9uz7FNRAaFl3UMjvN31t+g3XriQ8xeVB1kAG1sExMnLZSzXpvRj1
         gLPr3HIBtVfkGYPA+yrNxTiLTcAd1AEeNkNzRJhwkHK0Xj1bP/FBHO//3iizT1w+vNhy
         XPJEysYN9SWYdTVQWK3iMS4P4DnMRm3lI6nHVs0d0O0eu8e0Gh8jERdB/3pfTwrSmYPj
         4NBHmL28Zc95X1B6x7xwo1o5k5O71Ed8/Z13tk5H13lHgkRSEMI1bJ+cWhRKMAFiwlIR
         Kdn9iO2ArasH5R074xmd3BVZjATq9otlMssX8744rprc2IcBjqKxsRr1nO7HQGYxbFH/
         zVzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MRsWERed;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u8si1556600ejr.211.2019.05.24.05.43.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 May 2019 05:43:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MRsWERed;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:54108 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hU9XS-0007Kk-Io
	for alex.bennee@linaro.org; Fri, 24 May 2019 08:43:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52681)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hU9XD-0007J4-IO
	for qemu-arm@nongnu.org; Fri, 24 May 2019 08:42:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hU9XC-0006ML-GE
	for qemu-arm@nongnu.org; Fri, 24 May 2019 08:42:55 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:46505)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hU9XC-0006Lk-AN
	for qemu-arm@nongnu.org; Fri, 24 May 2019 08:42:54 -0400
Received: by mail-wr1-x442.google.com with SMTP id r7so9856932wrr.13
	for <qemu-arm@nongnu.org>; Fri, 24 May 2019 05:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=FTfH2Bmgd6/uhQsHPCYg8B8J/1/AvPfs4Sq0ZaLk7QE=;
	b=MRsWERedJmlAtH7x9EnKJlj24vxFVZ4aWLWYqrZf39ujjK9k+NR56LU5Gde2Ti/pXi
	8Z8mWzrKhrd7ZPeWEriV/cA9v2wUGvzu5OYMFe0UkNMYVLEcN8eaZZ4svNKBJyVTeUE8
	eQmZgEeH7gp6+ld6It/4mSjT83JNJuH434UOEAoEBnK5PNJ24JSWrJ+SQ0JBXfB58Zna
	B4aClMXCJcw2ffkxpiJunqUPhLilOtBxqZ8SepEume1s0soSmvG6AbTlHI9nC58szNZR
	gZZ+Z3PzrkbvMEL+hPyL7PCB/6c2GspGbzvX+woktX+hXEbYqCaMPgz/hRDCayVhjTSP
	8IHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=FTfH2Bmgd6/uhQsHPCYg8B8J/1/AvPfs4Sq0ZaLk7QE=;
	b=t2AF9AiR5oTc030YZvztjAz9OA3TVgRZ7bGK5psA93FwxmW5hHTa+bRceecYeti2AX
	RDtRtK3qO7c4LNVwENZQ+Jfk97BnqlaoyzhfimPPEZt3NMcNlJBb6IKiH2BvPjaLtiio
	xE3IsNOtaIqvipPMiOrpf4MywaHmc2PQh8kl+sTxkVkh2iPQ5OXtnFPL9HXQuoPA4K08
	AZOuhCLOeYDnYurArrFEupfnwQZKVJ7RjJbv51wUYf4LsuXYIJUtoeY0uRmbhhh71Kqz
	hFoNylBiuocX6fELU24nV4OW8ll3ARAiY9/8Z0zNgX84qqJ/5bNukJ/TWXzElD3joBQ5
	mo8Q==
X-Gm-Message-State: APjAAAW+uCnGXfn1DzY8FMnUIoAzMInvfKeb56hmNjCDXxgm6s45XdCM
	VvDfXJrewqNYQxywkbD2efSx77MnjoOrZQ==
X-Received: by 2002:a5d:4d92:: with SMTP id b18mr63645779wru.212.1558701773214;
	Fri, 24 May 2019 05:42:53 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id t12sm2969854wro.2.2019.05.24.05.42.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 24 May 2019 05:42:52 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 24 May 2019 13:42:48 +0100
Message-Id: <20190524124248.28394-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190524124248.28394-1-peter.maydell@linaro.org>
References: <20190524124248.28394-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: [Qemu-arm] [PATCH v2 2/2] hw/intc/arm_gicv3:
 GICD_TYPER.SecurityExtn is RAZ if GICD_CTLR.DS == 1
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
X-TUID: G4Y1bE+a3Kkg

The GICv3 specification says that the GICD_TYPER.SecurityExtn bit
is RAZ if GICD_CTLR.DS is 1. We were incorrectly making it RAZ
if the security extension is unsupported. "Security extension
unsupported" always implies GICD_CTLR.DS == 1, but the guest can
also set DS on a GIC which does support the security extension.
Fix the condition to correctly check the GICD_CTLR.DS bit.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_dist.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/intc/arm_gicv3_dist.c b/hw/intc/arm_gicv3_dist.c
index e6fe4905fd3..b65f56f9035 100644
--- a/hw/intc/arm_gicv3_dist.c
+++ b/hw/intc/arm_gicv3_dist.c
@@ -378,8 +378,14 @@ static MemTxResult gicd_readl(GICv3State *s, hwaddr offset,
          * ITLinesNumber == (num external irqs / 32) - 1
          */
         int itlinesnumber = ((s->num_irq - GIC_INTERNAL) / 32) - 1;
+        /*
+         * SecurityExtn must be RAZ if GICD_CTLR.DS == 1, and
+         * "security extensions not supported" always implies DS == 1,
+         * so we only need to check the DS bit.
+         */
+        bool sec_extn = !(s->gicd_ctlr & GICD_CTLR_DS);
 
-        *data = (1 << 25) | (1 << 24) | (s->security_extn << 10) |
+        *data = (1 << 25) | (1 << 24) | (sec_extn << 10) |
             (0xf << 19) | itlinesnumber;
         return MEMTX_OK;
     }
-- 
2.20.1

