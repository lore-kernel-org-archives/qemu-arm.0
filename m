Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp1021545wrp;
        Tue, 12 Feb 2019 10:22:11 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZH12/IHJZmxDPqWK5bglkLMo/bQmV+ivlUeQacQbb9UAl0N7Ku1nEk/7lkEQIbslgz1TGF
X-Received: by 2002:a25:c207:: with SMTP id s7mr4025366ybf.37.1549995731089;
        Tue, 12 Feb 2019 10:22:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549995731; cv=none;
        d=google.com; s=arc-20160816;
        b=nEFBElrpnXzCr/KeLNDaaF6YNeklDsE8If+zZQjCejei8vzll6vNW+/d76U7rcsOJk
         k0eTgk7QEq+eleWd0/rLERl2CNAtrWbqO7gutbxfEzqWw2/Vrxzw2N23fBYgj8ZpZGfC
         XPwOUGYirwJfDx2WLa3gd8/3WpycIUDLggiM8OfXNAEAg67iv19JbZQGZyKC9fD1BzMs
         yNY+Mn0dOM7DBYwVL7inrEJ69GG5hyQFkUJz3iszbJzBZlnXjIoP/dn9ZS1Vdv0vkd0a
         9PmlZsfD6Z5AZdRjgvOuwWGPlDBIYA4ilkTUUPJGa8TcbsPNsg8b/YKL26HHSxT85DRJ
         dmjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=TJJbCexAnaygb5NbSxOchbhUl0UTuJ20W+GAJCoo3jc=;
        b=RwBDh5MV5PcV36b+YlkfU3/p31svqVqsIx4kaT/BsBx/shC5NXruby29Iv64oJiVF9
         oc45T3ksH24eFrdxflejZaC1XgMOBjQRHBN9HGkTCX1J791Ck6M3t/07stg/WC1ejPxy
         y1QQ4uRnZx4QYN6zTZvk9U2qHuK2hGaj/cGY0R6MuRZ1Xs9ilcO3PPYgMXvKvXKzZu31
         1ul/KQWV3zA77EbnJnAe7BoJp3R0enGC51WCnnDhQVVTd1TfjQkD1KIm6JUx4ohW6BgG
         oC+l3vUafah4HvCHlQgxKpD4wIypzR6GpyRJyXA8n9SgVFUrrW4zKlHyPdDNBMbvxcYR
         tiXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EOn8V89V;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w4si6244433ywi.342.2019.02.12.10.22.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Feb 2019 10:22:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EOn8V89V;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:43859 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gtch8-0006m1-HR
	for alex.bennee@linaro.org; Tue, 12 Feb 2019 13:22:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36713)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gtcf1-0005eK-M1
	for qemu-devel@nongnu.org; Tue, 12 Feb 2019 13:20:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gtcey-0005IQ-Ta
	for qemu-devel@nongnu.org; Tue, 12 Feb 2019 13:19:57 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:37387)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gtcey-0004cI-Co
	for qemu-devel@nongnu.org; Tue, 12 Feb 2019 13:19:56 -0500
Received: by mail-wm1-x342.google.com with SMTP id x10so4063967wmg.2
	for <qemu-devel@nongnu.org>; Tue, 12 Feb 2019 10:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=TJJbCexAnaygb5NbSxOchbhUl0UTuJ20W+GAJCoo3jc=;
	b=EOn8V89VnvvT8EAq1/o8XzC+UFuzrR7Z5rB1wNSUbDsMw2hteOV1RmHpJp30s/zJEo
	mBocajNuUSoSrX1cmVUUGHs5k2B4HeWQYEz/B96lq4/h9DW79ZH7/ad2lmB6WUtpJrP7
	s3GjZe5cmIRX1AmNjHnLFDjLiUnLs8lukCK+yKD/lVtYKkiztG+3PuJHpbiEqA9ln7Yr
	AXGhdtAjSNzeSvE6uC9bhTPLsq7c9htY22iTGQZ7tgiapV03pm2ajqndw43/7v+kactw
	1XVC7/YOvy6CNmEXABM5y2VwPyUeY0DHRL7uDIGUg2OsQTry+dJBX54ULo2trzuFcZXW
	l9GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=TJJbCexAnaygb5NbSxOchbhUl0UTuJ20W+GAJCoo3jc=;
	b=IeeBI9DHg0uIuz7PMgVEj53woePIT/djpTJeRILq4QjKc4bBhTRPc5Temkj0ghNUl7
	KKSPgnHSi4IZbbk42Y+bAFrQ73sBXHvw8wpHcOsdm+d3xhmQUdgY3bBfcsG95WE+M/4h
	sUfNmOd/yO6wKQp96KEJbrPjl2ytKF50gGiXzHp2XzLVkm9sMGMHqWu4dz72lhJ6N4pV
	v0FuM/TeKKuEDb+Jay9qo7tfCc7sz4GeMR9U3x/frXLAAd271Ej/Kt/LccTOtK67+ztV
	hgRiApVYWk8PlCJI1eF8xAc/08RGUytNdH0iJJnLK6j6I5aOpuOdt3GQ7lN/4tlfPmo1
	U+hQ==
X-Gm-Message-State: AHQUAubnSBpo1Ut/KjOIPEknh1r8z4fqL7zoqOPuEgpBQgOu9RGZP4/A
	MVK4UmV8jBu77xG4n52ek/nepA==
X-Received: by 2002:a1c:4301:: with SMTP id q1mr156670wma.44.1549995559920;
	Tue, 12 Feb 2019 10:19:19 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id n6sm6212848wmk.9.2019.02.12.10.19.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Feb 2019 10:19:19 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 12 Feb 2019 18:19:17 +0000
Message-Id: <20190212181917.8322-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: [Qemu-devel] [PATCH] hw/intc/armv7m_nvic: Allow byte accesses to
 SHPR1
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
Cc: Julia Suvorova <jusual@mail.ru>, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iEpvHIlvUxAE

The code for handling the NVIC SHPR1 register intends to permit
byte and halfword accesses (as the architecture requires). However
the 'case' line for it only lists the base address of the
register, so attempts to access bytes other than the first one
end up in the "bad write" default logic. This bug was added
accidentally when we split out the SHPR1 logic from SHPR2 and
SHPR3 to support v6M.

Fixes: 7c9140afd594 ("nvic: Handle ARMv6-M SCS reserved registers")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
The Zephyr RTOS happens to access SHPR1 byte at a time,
which is how I spotted this.
---
 hw/intc/armv7m_nvic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 790a3d95849..2fd40f9dc4c 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -1956,7 +1956,7 @@ static MemTxResult nvic_sysreg_write(void *opaque, hwaddr addr,
         }
         nvic_irq_update(s);
         return MEMTX_OK;
-    case 0xd18: /* System Handler Priority (SHPR1) */
+    case 0xd18 ... 0xd1b: /* System Handler Priority (SHPR1) */
         if (!arm_feature(&s->cpu->env, ARM_FEATURE_M_MAIN)) {
             return MEMTX_OK;
         }
-- 
2.20.1

