Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp4713233wrh;
        Tue, 30 Apr 2019 06:15:40 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzui+XjFPJzMMYFXGQEL40oAbcuIX0PN95JT6dppis6y/pCgY7ITCNBNgpFu+CvaGjEZGe/
X-Received: by 2002:a5d:6304:: with SMTP id i4mr13329899wru.251.1556630140494;
        Tue, 30 Apr 2019 06:15:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556630140; cv=none;
        d=google.com; s=arc-20160816;
        b=GfeIJRimgo1zuJl4Tu+zmiZoNRT/li5K33R/JiagVvCbhiehOHZASKrJob3JoLJkof
         YrJfV8FJKFKeKqm4kBm/4bQ3TXhdC9RfjJQ9PAjlWsMfy2HcSkE6gqqgrxRpH1WcueHV
         +ZIisVHElYTRseDkYM+O6MyG6FARG8dkj9Eni8WBa5JmCazFlHWNccOqSA98s2NfFnbh
         pkvB4Ue9jbnJ8RDJQnXrfnS5OV7S0XWhmHwhhAmqAzrmTb6eDY8MWQ/EthJT6N/FAZVZ
         aDCsTLmqaL70EZZVf6WYoPOaLeb6XkBTr5qA0Vqd5rJVTDMyEg4QKQoWLUVEBFeBxgzL
         hhBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=U/R8O7Qr7W3Gev40Mu9XCs2DcqDhxle1cGlCTNhZ1V0=;
        b=EY1GwbY4I2HkSF4s6X56dkXOVXvtit1DTLDsWExV12hbNrjRQ6O0+9juMHSizlqdu2
         wjvoGPUbsVBBUitMu+ID95d0Uwd9pAqbCNo1nzM1LIFfmoe3eA24Le3BYmVgC8GK8+AE
         SWVcUAeiToI7lx7TRy0M1IgUql/1r/fBxlV4r2oO2bv/KdpmWhWOCoEjURokcai6v1xY
         w8ogG4vCwBG0fToFhoZwRombJhiR6hspQgmfchTZqKr+xpf4NF570wVRcp8ZBBxzLjwR
         GNJH2sF9RZjFFAfBsFlyi3rYPB/d8Ji9Toa22AJjbKEle+EqGKjt3BTv+Bdc7YzXU3PY
         9B5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Q1AiOBUh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t7si1541782wmh.1.2019.04.30.06.15.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 Apr 2019 06:15:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Q1AiOBUh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:47109 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hLSbj-00011n-Em
	for alex.bennee@linaro.org; Tue, 30 Apr 2019 09:15:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44524)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hLSar-00010e-0H
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 09:14:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hLSap-0002Aw-Vu
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 09:14:44 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:38205)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hLSap-0002AJ-Pa
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 09:14:43 -0400
Received: by mail-wm1-x341.google.com with SMTP id w15so3791786wmc.3
	for <qemu-devel@nongnu.org>; Tue, 30 Apr 2019 06:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=U/R8O7Qr7W3Gev40Mu9XCs2DcqDhxle1cGlCTNhZ1V0=;
	b=Q1AiOBUhsGvl0IcKOiLai/mtenqy4Kr17qXwXw5RbT+iBk1OYQnlLt6o4LpTxPzjSd
	td87MSU842aTbeQWtWHjklKn2qP8eIJlXdswud2xVGarUy+9Jx9RtuZOcsSp1NuB3mBu
	Xf9rcgYwhP8dqWpJtLvI37VjX9iGENpCNK139NHnpcvrQ33h1tu0eJIFGmMVSyeYkTXn
	RA0nPQtup+N08tvyskTvCxzpDHGiqvUaIhTXOk67RGuNOLaLPP4pWyQpKtQnjfof3lkN
	w71P9TLydNHwbUIdZKgg6H4jvm3lmgReNUmuBa63j8NiqFJurb/Z9PFQ7UeB/w86ll0J
	ZeUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=U/R8O7Qr7W3Gev40Mu9XCs2DcqDhxle1cGlCTNhZ1V0=;
	b=DhqKi1pSZEvY4cFXZ1L6nq7K6ZOk3h3oKoJbkGDt7Uk6mm5pOWUBXQRRQRKiZvWb/7
	PSAUKJHB/eQmUL4NMUk0qWnFaTNcscXZk85a08XZqVq0UX9r631CTnMlxNXjvwhCXjJt
	veq2p4qlC5lJ7uvrBJ1ztfCeawlifY56m4j52NqWYzNMlpsAV3LcV3BLFKai0VgJjP3/
	ApKu47HLqhVL9cx2aFmNgB/1uQzkH1nJBYrBvFSe9xMKdCgEsaRI7EIwdwyX3qPxfAw/
	Dk9esSYpSFiCcTC5B8lLL+8ewQmUPTNxnnrHWQmJceP7MQi447uaOSDaNMlu7eUR1Z+G
	Czfg==
X-Gm-Message-State: APjAAAWF5a65RzQHH0RbeC+LfwTBbiwsPLgCljpB2tEQ9UKZwhet++YH
	8ZsK4B4UTEIZyKYHi3kt66AYmA==
X-Received: by 2002:a05:600c:2506:: with SMTP id
	d6mr450717wma.106.1556630082710; 
	Tue, 30 Apr 2019 06:14:42 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	a12sm16557460wrh.46.2019.04.30.06.14.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Apr 2019 06:14:42 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 30 Apr 2019 14:14:36 +0100
Message-Id: <20190430131439.25251-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190430131439.25251-1-peter.maydell@linaro.org>
References: <20190430131439.25251-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: [Qemu-devel] [PATCH 1/4] hw/arm/armv7m_nvic: Check subpriority in
 nvic_recompute_state_secure()
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JItBUI2hl1tr

Rule R_CQRV says that if two pending interrupts have the same
group priority then ties are broken by looking at the subpriority.
We had a comment describing this but had forgotten to actually
implement the subpriority comparison. Correct the omission.

(The further tie break rules of "lowest exception number" and
"secure before non-secure" are handled implicitly by the order
in which we iterate through the exceptions in the loops.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/armv7m_nvic.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index fff6e694e60..131b5938b9a 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -213,6 +213,7 @@ static void nvic_recompute_state_secure(NVICState *s)
     int active_prio = NVIC_NOEXC_PRIO;
     int pend_irq = 0;
     bool pending_is_s_banked = false;
+    int pend_subprio = 0;
 
     /* R_CQRV: precedence is by:
      *  - lowest group priority; if both the same then
@@ -226,7 +227,7 @@ static void nvic_recompute_state_secure(NVICState *s)
     for (i = 1; i < s->num_irq; i++) {
         for (bank = M_REG_S; bank >= M_REG_NS; bank--) {
             VecInfo *vec;
-            int prio;
+            int prio, subprio;
             bool targets_secure;
 
             if (bank == M_REG_S) {
@@ -241,8 +242,12 @@ static void nvic_recompute_state_secure(NVICState *s)
             }
 
             prio = exc_group_prio(s, vec->prio, targets_secure);
-            if (vec->enabled && vec->pending && prio < pend_prio) {
+            subprio = vec->prio & ~nvic_gprio_mask(s, targets_secure);
+            if (vec->enabled && vec->pending &&
+                ((prio < pend_prio) ||
+                 (prio == pend_prio && prio >= 0 && subprio < pend_subprio))) {
                 pend_prio = prio;
+                pend_subprio = subprio;
                 pend_irq = i;
                 pending_is_s_banked = (bank == M_REG_S);
             }
-- 
2.20.1

