Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6376264wrt;
        Mon, 21 Jan 2019 10:51:43 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6BUu5f+vZr7szKhPjhDcaCwNe8Yrqibc40MRf8DuFYZ8+vDHM4hL6wTMwAioGEjUjyCuVa
X-Received: by 2002:a1c:4301:: with SMTP id q1mr575427wma.44.1548096703207;
        Mon, 21 Jan 2019 10:51:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548096703; cv=none;
        d=google.com; s=arc-20160816;
        b=k5Nkp7Slh+dESXJQyxEuLlu273TJYLI5hyolbNp1w+WfCeKEKwdNpmYpnhZKgRzyGu
         ngigk0dow8YD6651V36FB4UyuSnREnH/zTY1uXiK9niGrspxhYxVRgeAIIWtsR6f6Ste
         BbNU6Ohv8wluIIQ6BLUVYvfd3L4cZPKtgLNWbJq/BLNxCdFNCk8Jk5kQ3JAuirzBggcI
         JZP3bXtF9gMvwdLRbybJCrfp9LRCQghz6LglHmv6XofAwhGTTh0Oe/uPWPEw8QpbfMeJ
         ufZbdH5HBXhD0arZ7g6SeZ8EqzEIUAJvVH5weVdCbE3cXw6vuQ8T/Rs0uyfXsxDu9Aiv
         chng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=Riqos2VP4k1FpZGAuE3wK4J/sKpJkrJvi5DAGfdCgXc=;
        b=fB2C0qkclEvTa1Hfas36WQktR6ZUYQ8NbePpCxTOIcQAFAhl+24Eb3Lx3ZH7emyU2Z
         ByTqC3A/B+pD8G4xt0wnUWJJmR9dbsqJmm67AgVXrKHDyMgTJeZaKWxT4cH9MMWR75GM
         bkkhDwgY5j5uWLalOoXXZvzBNU9bE+7esS41BhyR8qCz1WINLfHCb6s5ar+C48scObO1
         nO7X5SuXzFKdImOF+UtIJMoETTHelc27ZrlnmlTfP+dMvV4//FQyfjUvWbXltfWWLepI
         +6KaaHUmwO3383u+XfBi6N1zG2MtEcmYaQuSeTb4Hgrj/lZHFYf2SJZWAWmEQtUlTL8K
         6Yyg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EvbakUOs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s20si56741680wrf.249.2019.01.21.10.51.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 21 Jan 2019 10:51:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EvbakUOs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:58066 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1glefe-0000rC-6g
	for alex.bennee@linaro.org; Mon, 21 Jan 2019 13:51:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35707)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1glefN-0000oH-2i
	for qemu-arm@nongnu.org; Mon, 21 Jan 2019 13:51:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1glefM-0002Vx-8x
	for qemu-arm@nongnu.org; Mon, 21 Jan 2019 13:51:25 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:39572)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1glefL-0002V9-Ul
	for qemu-arm@nongnu.org; Mon, 21 Jan 2019 13:51:24 -0500
Received: by mail-wr1-x441.google.com with SMTP id t27so24610591wra.6
	for <qemu-arm@nongnu.org>; Mon, 21 Jan 2019 10:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Riqos2VP4k1FpZGAuE3wK4J/sKpJkrJvi5DAGfdCgXc=;
	b=EvbakUOsiQn1dEFRXSf/ntddoYujwEmLJBVnqkFQFDYG04lBDchLWPq76KUWx6nRd3
	b0J+2Oq7JRrChIcSdsT4WVYi889yEFogbROpRP8CW1goEQ/GZkwPXqqX2pNeg0MEsG/j
	slGuUfA+u/GcZbfHIfygPLW1s4Oz9hcClk2NQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Riqos2VP4k1FpZGAuE3wK4J/sKpJkrJvi5DAGfdCgXc=;
	b=Y5ToUPzVJhLPhyn1J59FYfmjzvvP8MLGVKcWrirGLU81loPNLeTUYtbA/WgrIm47Ea
	CK4Ny197d/i5eRg85oQ6xKjh7ZAxDOuJEpQFlkSomecB3+eVJ5BY5XUmlHBUGSWCYsdb
	+ySMCHdX3QpNmCGGCQw9xTuEMc7JID0DnTBUNbP98/wSQWcSXklmAutzhK0UWnho+c8u
	Jyq5w9zUFoOay6kg9o1fwfJdQ/qKeMMl6PUJTBNDwc5K7bxKzqtSssig3kjxZ38sBeLe
	iFadL9061MkuhYKG8dC3VaUQRc17gV0zzhHgfsBnNzYarhd6emn5mE+YIsi91xgBM1J1
	Ihgw==
X-Gm-Message-State: AJcUukeR9ctoQPSW0lDtxTwa8SVZfd0uNW702ZetNlgTJGCOafBjLyie
	AYoikB7+XEuiJqFeyhbY1mUKSjPI4z4XWQ==
X-Received: by 2002:a5d:42ce:: with SMTP id t14mr29775792wrr.51.1548096682643; 
	Mon, 21 Jan 2019 10:51:22 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	n82sm50386660wma.42.2019.01.21.10.51.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 21 Jan 2019 10:51:22 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 21 Jan 2019 18:50:57 +0000
Message-Id: <20190121185118.18550-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190121185118.18550-1-peter.maydell@linaro.org>
References: <20190121185118.18550-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: [Qemu-arm] [PATCH 02/23] armv7m: Make cpu object a child of the
 armv7m container
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Dh30x7Fk9ag+

Rather than just creating the CPUs with object_new, make them child
objects of the armv7m container. This will allow the cluster code to
find the CPUs if an armv7m object is made a child of a cluster object.
object_new_with_props() will do the parenting for us.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/armv7m.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index f9aa83d20ef..0f2c8e066cf 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -158,7 +158,12 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
 
     memory_region_add_subregion_overlap(&s->container, 0, s->board_memory, -1);
 
-    s->cpu = ARM_CPU(object_new(s->cpu_type));
+    s->cpu = ARM_CPU(object_new_with_props(s->cpu_type, OBJECT(s), "cpu",
+                                           &err, NULL));
+    if (err != NULL) {
+        error_propagate(errp, err);
+        return;
+    }
 
     object_property_set_link(OBJECT(s->cpu), OBJECT(&s->container), "memory",
                              &error_abort);
-- 
2.20.1

