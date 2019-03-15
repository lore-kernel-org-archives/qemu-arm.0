Received: by 2002:adf:f011:0:0:0:0:0 with SMTP id j17csp1566548wro;
        Thu, 14 Mar 2019 20:39:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxCAqQsXuUGs8YtesAeCVPx10jx6uZpMf8A2iwQxgYgVsjmhdrASKzuatJXtSlg07MSnCB4
X-Received: by 2002:a7b:c309:: with SMTP id k9mr507863wmj.62.1552621190855;
        Thu, 14 Mar 2019 20:39:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552621190; cv=none;
        d=google.com; s=arc-20160816;
        b=GpmEMXTl3ekENOV28kp5F4GrMWDMHATwOG7Y03GzOSEGX3oY8UNwMrlntYVO37qb1r
         J2CvZgULn9ZOvVVLkMDiM49arcvTv3kvcFKpS2OGw0gs7tkw6/pAUqCfgPj+1OzAceHJ
         tosCBxZugHuRtzLgpZF7rMD6f7+yOkp4Sj+mNa/DwdYvBRNb6sMWnTkMxqB0AdTwVMPn
         QiWBcpFA8l7XmBetELC0aYc0oLrCVWDIUht2ZK3XS1TRWT9y8EgZh6ipaDlIOEhnQVcF
         YTTSCpX7RB+CgKuz0PNMaCEsn8gwxc2efM5198HuozrzQOgHVpeEA8ia//+fXCbGqLg0
         CkXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=40dndFEh1rhwW/qt+1fjHft74TzjNjRDxNO1+LXr9wE=;
        b=iRLpUPCXBbblLqNBNNWk4WzZuyTxI76/ucbE15PZOaMpV/O10AsSi9mVRh8z6vDCB8
         pT6I+bvpeXkUW6XT/8gaL1MQV+l2b0VruxV/mUtBK2kfKAZSrNJrusSSwiNQEzqO4so1
         130H1TpHXwND8veANB/ZdzFMR7Xp8fcj2Lm3TwNO2DJJf4xTdFz4v4kxKVjS6hju3Mdt
         A+MO8vFmcBEshGVyHfzRTNXMV4mcWIudxtbzzFcPvujMg88npJKy0huOnoN0mmFkbNp7
         SMcrFYdtDh6Go22XmrOpL5O5yCSDnkJPqp5KRxJcBowJeEisbh7dmXJviHqlCzh+ccie
         ILPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CElIfdGm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s8si368104wmc.178.2019.03.14.20.39.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Mar 2019 20:39:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CElIfdGm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:48736 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h4dhF-00006o-Sh
	for alex.bennee@linaro.org; Thu, 14 Mar 2019 23:39:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43825)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1h4dcJ-0005BE-70
	for qemu-devel@nongnu.org; Thu, 14 Mar 2019 23:34:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1h4dUl-00033v-DP
	for qemu-devel@nongnu.org; Thu, 14 Mar 2019 23:26:56 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:37579)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1h4dUl-000328-77
	for qemu-devel@nongnu.org; Thu, 14 Mar 2019 23:26:55 -0400
Received: by mail-pg1-x532.google.com with SMTP id q206so5414355pgq.4
	for <qemu-devel@nongnu.org>; Thu, 14 Mar 2019 20:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=40dndFEh1rhwW/qt+1fjHft74TzjNjRDxNO1+LXr9wE=;
	b=CElIfdGmPne/v85S7uvHoo+rC75WrJUtTc2v2CGF+exW2XWwDkSLkwUeCfvH6LU2+B
	X118oR5cpp7GM8+q6hYz+T2UXGPGNs8MHFfC2AzvkLorMv89ftqeiyKf2abFqyEh5oPA
	xPQz5LjG/hdV+qbF+y5h02oQuMsZqKsfIy1IpvYpXrZq3dVbxBgKHhU/vuUk0dih7Ika
	cygEiP8lKcdLlWSTCQXiYJEaXYqh8cSMMEjlYc2LwDKbvBpYoMmeSLNE371zTG260X9A
	G54+OeOf/8T41M5zjL8jZCcer21BI2UbklnjqCQgcWuA06Ur0HzY6oVo6HdrqQmnAZmI
	FXhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=40dndFEh1rhwW/qt+1fjHft74TzjNjRDxNO1+LXr9wE=;
	b=RpcbWatv1ifcEut1rCk87BE/ku/x/BzSuJqDfQODr9nt/Y0NCgYDV0G791yMsskvo1
	+iOHyjTpdljzVq6EcX4XgojJO4TQkzfWE8Ho0mkZD00oXdyO+3VH39c9QNxuzsNsO3j2
	pz0C4/dXjqw73CBPzwpjt4VDLJVwAqTIjjMUop6llOzd+LRAM5KfTpo/ZqorRqgSAtwC
	hmb2WxBbQu9D/vMYJO9lw0iDfxGYz671HXhZrCtqzXRxzpbP7zYQsYy8fUFkf9KL5l0F
	uekjWyPjga0MBryBCyR8aBhXUB2Z+mkU4159XYp7yFTx95pY9FUUoe6RGPtMiijSyZNG
	zCBw==
X-Gm-Message-State: APjAAAU/bhfmZ92LyWqm6+QXkQjvCljkoXCI9KZDavG+ntPMIXk0BR3x
	ITvpTMPPf5jf9aPJCvHnQKE+UVSi44Y=
X-Received: by 2002:a17:902:8a96:: with SMTP id
	p22mr1783432plo.113.1552620414022; 
	Thu, 14 Mar 2019 20:26:54 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82])
	by smtp.gmail.com with ESMTPSA id d26sm690816pfn.86.2019.03.14.20.26.52
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 14 Mar 2019 20:26:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu, 14 Mar 2019 20:26:23 -0700
Message-Id: <20190315032629.21234-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190315032629.21234-1-richard.henderson@linaro.org>
References: <20190315032629.21234-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::532
Subject: [Qemu-devel] [PATCH v3 17/23] hw/misc/nrf51_rng: Use
 qemu_guest_getrandom_nofail
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
Cc: qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: x/mElZczsBt6

The random number is intended for use by the guest.  As such, we should
honor the -seed argument for reproducibility.  Use the *_nofail routine
instead of error_abort directly.

Cc: qemu-arm@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/misc/nrf51_rng.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/misc/nrf51_rng.c b/hw/misc/nrf51_rng.c
index d188f044f4..3400e90a9b 100644
--- a/hw/misc/nrf51_rng.c
+++ b/hw/misc/nrf51_rng.c
@@ -14,7 +14,7 @@
 #include "qapi/error.h"
 #include "hw/arm/nrf51.h"
 #include "hw/misc/nrf51_rng.h"
-#include "crypto/random.h"
+#include "qemu/guest-random.h"
 
 static void update_irq(NRF51RNGState *s)
 {
@@ -145,7 +145,7 @@ static void nrf51_rng_timer_expire(void *opaque)
 {
     NRF51RNGState *s = NRF51_RNG(opaque);
 
-    qcrypto_random_bytes(&s->value, 1, &error_abort);
+    qemu_guest_getrandom_nofail(&s->value, 1);
 
     s->event_valrdy = 1;
     qemu_set_irq(s->eep_valrdy, 1);
-- 
2.17.2

