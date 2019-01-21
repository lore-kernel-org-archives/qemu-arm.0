Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6378081wrt;
        Mon, 21 Jan 2019 10:54:03 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6XTe4/GoRWS0CluRCeWf2wKi6cSN3uXbajz9PsFAXtvdpV30FbSy7PDO/AipM/KWu10KzL
X-Received: by 2002:a1c:1d8e:: with SMTP id d136mr555177wmd.98.1548096843835;
        Mon, 21 Jan 2019 10:54:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548096843; cv=none;
        d=google.com; s=arc-20160816;
        b=ikTY8aSU15p6JFMAazs5uvprlKHdV0XdUHfNjEsDBvwXupufZrvSz8p+4mQk1Vp53j
         fSQcPdDJv+jfy5BzwvlBv1WsYLhd85Cxp2YlpERdiaMLYZrPZyiajG8V0pNr53H5glRi
         ZDvKqbJelfTPW4Iv0f6EB/LgkAduTkRv49zRDQ0iXwjqKLD9r71J2Pb7/G3kN1QhFPAg
         aiLe8k6zB6nNi0ibXkPDhquaRyA+1eydP7uA1NSJpSTv40f6WDBTooMSyZiGzYxApoXn
         iKzWe0QAaQUBh9P2oRkj0OC4H6sYa+6J7clLN66rBRQTz75Qez6+v8hL2vlPOoWr0/PN
         CwAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=BudMfJPXXih/S5U7jqBZwz9zkq27ugNQSCi2J5JSPGU=;
        b=LedZ+suS8CVPSEM3u0T/tZF4CiAF9KiJYiPLCHfXiE3K8NdhJ4t202HP8CnMAw68sP
         M8hMeckEr3u2a1U9pxZZw1Aav34ns7JzMF7GJ+SacFqamJP6DBKjxublJfUIvn+0vr6t
         8P/F5HmMUe+tYDJOnbYRhaVSrGmDoCNxfEnaknLmjYSiSlte5+e4iUre5tI2QHHqBlCG
         A9Z7rsY8sd4wn9u3zigmrutigR3eCb+xPfVuUsjGNUXhT2TBpMWwPh+eC1ygN8Qs5mFS
         NvS0xR0dlAbs+cK/zcebvyqWkGambt9z1yGH0WnUmA9oAYfJevjUfG6TKRrToN6I1TPA
         LeTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XGzQP9dE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 18si33359567wml.176.2019.01.21.10.54.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 21 Jan 2019 10:54:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XGzQP9dE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:58090 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1glehu-0002Ge-SO
	for alex.bennee@linaro.org; Mon, 21 Jan 2019 13:54:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35715)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1glefN-0000oN-5H
	for qemu-devel@nongnu.org; Mon, 21 Jan 2019 13:51:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1glefM-0002W6-9s
	for qemu-devel@nongnu.org; Mon, 21 Jan 2019 13:51:25 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:54296)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1glefL-0002Ue-Ut
	for qemu-devel@nongnu.org; Mon, 21 Jan 2019 13:51:24 -0500
Received: by mail-wm1-x343.google.com with SMTP id a62so11833785wmh.4
	for <qemu-devel@nongnu.org>; Mon, 21 Jan 2019 10:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=BudMfJPXXih/S5U7jqBZwz9zkq27ugNQSCi2J5JSPGU=;
	b=XGzQP9dEvABjlLxrY/+/pZ/MQQI8uNCahT7MkkBNCbeGAYlBVVnNTWqUxZqbOioDx2
	DPrEyzLGeU+PumTbco9Pj9sbKuO+/xtnqD4ZI35xnJQw+Nw9htZ7VIfhPZ1M7mLh3Mig
	Jhy4GdPtL7l4afGLwQnDQtaA7XBGoN8f2bVo4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=BudMfJPXXih/S5U7jqBZwz9zkq27ugNQSCi2J5JSPGU=;
	b=mUtk5blq5vEFecdvF3/yjr0sy0b9YsEQQcVZpsdrqyc1SMtDZ1NjJqR8E4sH9KlPms
	O5NHn3pNhJl8OFwH4C+7hFyOMQ8bSA0KHHt8eX8ySnFlWImWkO5wvumDnLwOyCDVdeIl
	2h9hexdP0SHPgk9KUMei63U2brTEp86QQ16OU9xZE+A8HC/2VoOs3bKMzh1D+ByaU3vX
	rWJuBJytMEptvHZ6KHaXQxcW/Tj3oaUp6wRu8yaBl4oaiYpJnbQqXgVty7dWHT1VT3Bm
	SSOpTjUyewuLoZjc85sKB4xCe5I6iFbmHewg65cwty6jv0QdfH0FOlKddbeBl3ZnNMGO
	sajw==
X-Gm-Message-State: AJcUukcoDhW2oW1eFZY5B4LtIt00bYweN52qVj1cipf9UCV5CvNuE7b/
	o39Sk7+v9BWvQgltOEFLR4NoxthjBm7IQg==
X-Received: by 2002:a1c:5984:: with SMTP id n126mr555831wmb.62.1548096681581; 
	Mon, 21 Jan 2019 10:51:21 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	n82sm50386660wma.42.2019.01.21.10.51.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 21 Jan 2019 10:51:20 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 21 Jan 2019 18:50:56 +0000
Message-Id: <20190121185118.18550-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190121185118.18550-1-peter.maydell@linaro.org>
References: <20190121185118.18550-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::343
Subject: [Qemu-devel] [PATCH 01/23] armv7m: Don't assume the NVIC's CPU is
 CPU 0
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
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hOdmD3Qg8dSY

Currently the ARMv7M NVIC object's realize method assumes that the
CPU the NVIC is attached to is CPU 0, because it thinks there can
only ever be one CPU in the system. To allow a dual-Cortex-M33
setup we need to remove this assumption; instead the armv7m
wrapper object tells the NVIC its CPU, in the same way that it
already tells the CPU what the NVIC is.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/armv7m.c       | 6 ++++--
 hw/intc/armv7m_nvic.c | 3 +--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index f4446528307..f9aa83d20ef 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -178,10 +178,12 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
         }
     }
 
-    /* Tell the CPU where the NVIC is; it will fail realize if it doesn't
-     * have one.
+    /*
+     * Tell the CPU where the NVIC is; it will fail realize if it doesn't
+     * have one. Similarly, tell the NVIC where its CPU is.
      */
     s->cpu->env.nvic = &s->nvic;
+    s->nvic.cpu = s->cpu;
 
     object_property_set_bool(OBJECT(s->cpu), true, "realized", &err);
     if (err != NULL) {
diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 0beefb05d44..790a3d95849 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -2274,8 +2274,7 @@ static void armv7m_nvic_realize(DeviceState *dev, Error **errp)
     Error *err = NULL;
     int regionlen;
 
-    s->cpu = ARM_CPU(qemu_get_cpu(0));
-
+    /* The armv7m container object will have set our CPU pointer */
     if (!s->cpu || !arm_feature(&s->cpu->env, ARM_FEATURE_M)) {
         error_setg(errp, "The NVIC can only be used with a Cortex-M CPU");
         return;
-- 
2.20.1

