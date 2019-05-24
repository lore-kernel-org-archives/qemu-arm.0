Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2984082wrg;
        Fri, 24 May 2019 05:49:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwsvzkepCOrJasiiRAmFpecsADI88TKbaqay3qvlikvHDs4VhI3uj6ay4Q8+0LLE3yUf/GL
X-Received: by 2002:a67:f34d:: with SMTP id p13mr48344270vsm.95.1558702142966;
        Fri, 24 May 2019 05:49:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558702142; cv=none;
        d=google.com; s=arc-20160816;
        b=jTqLz0VAOlsrdOr9cKQe1aL+78wVZSvILhPe1U4CuwwjxLhgsD7gpobr9kAw4AjxwN
         3y9c5UDoHKmm6QtO+NsUU3IuLpkbpVy9aQGfDEAPc7RlitF329Ds0YCQ+Nl1TFgdS4aU
         qtVApmFO0Lr7AVG+SiQuVMGtlJ4jxdv57ILTgoq+/PVJbvSmMF7eeh7v9HgxIuN1ld5c
         nHSQNwn/VZTZWugCatXnO72FOu6Rx9F6J29RF50mTkoVkeYGd+aeWAUM7um5M2whE+xm
         EOS+4ivu6/HymRf8Cmiq72ZCDMvsM+nHHByLvmjnW0ltQqSsKarv7rR2TaoPZlRpGTI5
         TAcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=4bPrPkcdlNMENU+gORaJCbbqtxXSHOYr8ie8Cov/r1c=;
        b=uJ/DdG9qSPMFZ/tLvR02YuY3cHJIuerRArWQLtVrTAvTJ32KKRjkEd3aTNWn2bjwDE
         r706GoBofy0EJtV71Q36pvROHsJrX+2DZPQpo21ibxaVpHry4/7IlYENbS9Q3ukgJq7C
         v6Fw6IxBuoNgSjYQVUwLH5SFli//+DV3I/+R4aigrvsO6EAGKH0rxN870idcdyn9q2G7
         DaPLu0Lb2PjxxSjxtBYnCbTL5yZjEJDFoYat9l53cModpRdhFyIRI+Fqnw/tkKEdIQrl
         35mVMLAG2WHMdG9uoOksUmXwW6KVgVCKFdHTh9oZRVwW9Mj1JzZ0SYj8u8YuIJ6NHS9w
         6VaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vuHQMANa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u125si418370vsu.366.2019.05.24.05.49.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 May 2019 05:49:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vuHQMANa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:54200 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hU9d8-0002WX-8f
	for alex.bennee@linaro.org; Fri, 24 May 2019 08:49:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54819)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hU9ci-0002Qu-28
	for qemu-arm@nongnu.org; Fri, 24 May 2019 08:48:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hU9cg-0001iD-PX
	for qemu-arm@nongnu.org; Fri, 24 May 2019 08:48:36 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:34979)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hU9cg-0001h6-ER
	for qemu-arm@nongnu.org; Fri, 24 May 2019 08:48:34 -0400
Received: by mail-wm1-x342.google.com with SMTP id w9so2990012wmi.0
	for <qemu-arm@nongnu.org>; Fri, 24 May 2019 05:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4bPrPkcdlNMENU+gORaJCbbqtxXSHOYr8ie8Cov/r1c=;
	b=vuHQMANadARa4pXL6PgQoXBIIqufxvi2z9M/QVI7mk0C2sz+K/WVAwriaz2P3TTdW+
	zSCBxKRxtH8GaDV2lUzXZ6FSx3PnzNYFdMfeBOX0W9lQobZlSBTYB0RHtMuhpc9tIuvw
	YMaTxjaCqaWqvav7UjrpUSrxR8KFqDxCFptIBSNk+EQKL+/KndF5+blnjsGdwPgaehM7
	w+BYWNAW9eafZv8IRCikS4dqG/A7ur+YmcdfsIlKOpPvWFxr69OS16iP4A6XPpdrah/h
	W7ylRL12h0Hmu91hvMQIW0mHYe8WX8qvxWJzceIrCax+BWcj0EjVht9JYKimRQNKS21u
	JMsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4bPrPkcdlNMENU+gORaJCbbqtxXSHOYr8ie8Cov/r1c=;
	b=iZWY0vwlAsX/fRNE+VspJTdsx7V6HFYIdRnBalFftWqKWvMi1yAPbAUmuKSAvhtGje
	9QVRDztLAuMDQo+6a5zxWzeMZ9w1ajdxCg95qNRla06xCupxlNH9jZREzjSBAJgxGte/
	MKvzfbIYiRpY8jhH6J9gzSrOFswg1dD2+ZFkUOTpk5/Xf+SngJoTVSIafaCUUuRWik73
	IXcoCmXB/A0vYb5YEB0BuA02IbCNdY9XNAuT2x+rSy59LWDd0T4ugpmf3AANiij7Yv+z
	qrRV1+WrYeRFj1ahg0+58uBCE5vPNoiq08M6I0U7RQqAvFv+pcwdXJk/iuRuRreaHqf3
	RDCg==
X-Gm-Message-State: APjAAAVnBwhT389CWoCQS788Hy2gSIFynFXkByDg4d3JE1pdJA66eR6U
	mjlezXEAeARMJmXvE4G/2zIgLBCF3I8Bvg==
X-Received: by 2002:a1c:d14b:: with SMTP id i72mr16015899wmg.4.1558702111920; 
	Fri, 24 May 2019 05:48:31 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id o4sm3053445wmo.20.2019.05.24.05.48.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 24 May 2019 05:48:31 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 24 May 2019 13:48:29 +0100
Message-Id: <20190524124829.2589-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: [Qemu-arm] [PATCH] hw/arm/smmuv3: Fix decoding of ID register range
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
Cc: Eric Auger <eric.auger@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4L6gIxZN76LF

The SMMUv3 ID registers cover an area 0x30 bytes in size
(12 registers, 4 bytes each). We were incorrectly decoding
only the first 0x20 bytes.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/smmuv3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index fd8ec7860ee..e96d5beb9a8 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1232,7 +1232,7 @@ static MemTxResult smmu_readl(SMMUv3State *s, hwaddr offset,
                               uint64_t *data, MemTxAttrs attrs)
 {
     switch (offset) {
-    case A_IDREGS ... A_IDREGS + 0x1f:
+    case A_IDREGS ... A_IDREGS + 0x2f:
         *data = smmuv3_idreg(offset - A_IDREGS);
         return MEMTX_OK;
     case A_IDR0 ... A_IDR5:
-- 
2.20.1

