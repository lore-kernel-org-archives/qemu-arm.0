Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp4715317wrh;
        Tue, 30 Apr 2019 06:17:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz/6BZ8ZepD1Ydil3ecFir6u4sXatkgCm5pDcK/uBFY/t2xATLmjhO0KtwWZdGdwfyQxNC5
X-Received: by 2002:adf:c788:: with SMTP id l8mr14573141wrg.143.1556630246110;
        Tue, 30 Apr 2019 06:17:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556630246; cv=none;
        d=google.com; s=arc-20160816;
        b=iW9jYy2C5itCfPHzkVloyiARzGmmLF2kdpOU4cUT3babfxXcWtukApgHNGBl+s+tce
         UR8UdQh3hEKc9qxlRF4bkAWsBxQYvXeYDID1frYC/jefXe3wiLa8U2v3UM2F1Mb8k/r7
         QlkO99oc6kH+WykV8mcaw64cj6sDQ283QGqOt+Kl951jDlQrf1X+kaYOGUM6NU0XzDxB
         NrVs8NGsto+wOxcarjIQ9gArxwgajvHlOjW4KMFAhnQAzocAfWvOe/iwh0WIu4HbBzNZ
         wegRVRDKMBBNrTKRDGtYmjQnNvdhbhkjE9aKpTnuxbQYL8DI1QlES6b7b0Xz3jO0Bhfp
         mvFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=I770HJlrpYyPcn2fSD+8YRmqIqI0uc6EiRRpIG177mg=;
        b=Qyv5D28J+z3zigfmicDm3bQT1kTtQgwBLsdapozscgJHsDsophodLxF9bKf7u9NzkS
         SM9vuE6Yn1/u1NoI4VIG+dpXu3n6SidVhbCOgJvbri2ZTkBv2e7WHZZX4SLhGixpE6Wt
         /YRWR1hJbJYmnDXeXASvEUZ76hfnHzmKonAPAajOVIEBeq6BlmIshzOeOjroUtZuf6RU
         yQlO7lPzmwgINSWwL3OyQzoABLptvINa5IlIvfCmK3Brf+bhgs443sY4UqwsM+U/mude
         mpC7RUyogwW8tWexMc3eMnjoFLzLROYpDhEWu7BDO1DfXsx+8OhPWEpvZimCdt/bnqpQ
         iMsA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tOP8JPe0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j3si2723387wrm.229.2019.04.30.06.17.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 Apr 2019 06:17:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tOP8JPe0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:47151 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hLSdR-0002Xc-3u
	for alex.bennee@linaro.org; Tue, 30 Apr 2019 09:17:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44567)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hLSat-00011F-22
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 09:14:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hLSas-0002Ci-4n
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 09:14:47 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:38670)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hLSar-0002C6-Uz
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 09:14:46 -0400
Received: by mail-wr1-x444.google.com with SMTP id k16so20992206wrn.5
	for <qemu-devel@nongnu.org>; Tue, 30 Apr 2019 06:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=I770HJlrpYyPcn2fSD+8YRmqIqI0uc6EiRRpIG177mg=;
	b=tOP8JPe0OmsP842zlxFqCldEBPL0wNOborCn+ovfk/7S+Xd1RatiuCilvKb4cpCr8D
	I8xMDb4DgZNAzBj4dgTceIqmmu/20I5CiKx4mG99HrL6K3f0ewrogSAdidxAs4kad27X
	jP46n2MjKk2doK6Vx7viTlfe4ZvsPri/R7nwKujiz86JBMGyTh9EXcEJfG8VIAH3XHic
	0Vgg89Aj1Mo4sVARzd+w4bEzFLSVwYfmhLZeTWyWjjyo2tKC/drwpeK+BJi3xoWrSqRb
	Y91jnfi6DoL4jm+D636KoZg+x7J0CZexxMOANrXu71IDF3Pq+umgW7hofG+DXcIo3kdn
	19/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=I770HJlrpYyPcn2fSD+8YRmqIqI0uc6EiRRpIG177mg=;
	b=QvsYRGxLHQqX9M52V7YjfhQGxyA1+dsYiO0xwLzvO44rNdZpqsIlvYMih2KnLzl6h/
	KvjHqXOLP02eW/LP/sfTZnDNIzRw2EXCqAYYkpQ+/XacmshuNaXwuluydPMev9zQz9sa
	lKL+25hh2vVb2XRRTxS/PlSDE6C423MGSxOiQJZRGsGUZe67mKKY0VWFhUYF3yKIOWTs
	AR7ZTlzavb/WwjYcqirYEaKhTlsVDfAQ0yL3O5ovYfa8VD2qbbJY1xT5y/y50+j4Vgab
	LxM07FsGp5hIqEieXVOkFGSAlVutf7vX8H0u2SXc5pGbeQ7Ccq2h3a/iU7fhP38Bo3kr
	bwpA==
X-Gm-Message-State: APjAAAUby5jh3ciqlVe9h3vN9yBwhOg4uhdjAvS0rb4I+KFzqJzIvPyB
	PmXcIAFlWncxpUgZGjZjhanVZN4hlSg=
X-Received: by 2002:adf:b611:: with SMTP id f17mr21213990wre.162.1556630085112;
	Tue, 30 Apr 2019 06:14:45 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	a12sm16557460wrh.46.2019.04.30.06.14.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Apr 2019 06:14:44 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 30 Apr 2019 14:14:38 +0100
Message-Id: <20190430131439.25251-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190430131439.25251-1-peter.maydell@linaro.org>
References: <20190430131439.25251-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: [Qemu-devel] [PATCH 3/4] hw/intc/armv7m_nvic: Don't enable
 ARMV7M_EXCP_DEBUG from reset
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
X-TUID: Qrs7iapFy2eR

The M-profile architecture specifies that the DebugMonitor exception
should be initially disabled, not enabled. It should be controlled
by the DEMCR register's MON_EN bit, but we don't implement that
register yet (like most of the debug architecture for M-profile).

Note that BKPT instructions will still work, because they
will be escalated to HardFault.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/armv7m_nvic.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 15cba63c964..3a346a682a3 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -2491,10 +2491,12 @@ static void armv7m_nvic_reset(DeviceState *dev)
      * the System Handler Control register
      */
     s->vectors[ARMV7M_EXCP_SVC].enabled = 1;
-    s->vectors[ARMV7M_EXCP_DEBUG].enabled = 1;
     s->vectors[ARMV7M_EXCP_PENDSV].enabled = 1;
     s->vectors[ARMV7M_EXCP_SYSTICK].enabled = 1;
 
+    /* DebugMonitor is enabled via DEMCR.MON_EN */
+    s->vectors[ARMV7M_EXCP_DEBUG].enabled = 0;
+
     resetprio = arm_feature(&s->cpu->env, ARM_FEATURE_V8) ? -4 : -3;
     s->vectors[ARMV7M_EXCP_RESET].prio = resetprio;
     s->vectors[ARMV7M_EXCP_NMI].prio = -2;
-- 
2.20.1

