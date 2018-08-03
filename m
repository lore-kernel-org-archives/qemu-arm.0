Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp2820966wru;
        Thu, 2 Aug 2018 22:23:32 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeyqnoM93MQd5FZXb3irfL81ebv/bjDEJbBEKvLZ8KmgpGijLhhdLpqyuXF2DEu85P9qF1+
X-Received: by 2002:a37:b383:: with SMTP id c125-v6mr2354594qkf.398.1533273812894;
        Thu, 02 Aug 2018 22:23:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533273812; cv=none;
        d=google.com; s=arc-20160816;
        b=t+lMMEbqoD0rnCQLUF886ZS0yEoOhXkVUYZIyiJtcUoAe8msCLiE+Rc8tVthJaAvVU
         /YHB6lchwOoUiq5WqOPAp4d5bYWXRqkgE5FEl/bWo/XswOBx45VAfZ+ikaiDZdFf77uH
         Gc3vPIbnDzSbQ2LkKQY8TXUjaVBfvaQeyCSGvWwMRKe+f25DsvxohD0HyN3bh+TZR/jG
         7eOtgTaSkVTjliTGQlGi1tgvj66FxngxRMaF8GIQNAHtFDdEBp4TP794QwgT69rTNEOS
         wEKftit74uax+GVaNTaMJe0hdgNMKCDXEepaWK5LjOLoKa8I9rjX6ezAxq6cwEIo+QA8
         Rxxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=KwnVk0FZbRL5sACB19TJDzQlDaPoBQkUgoOUVam8cLY=;
        b=kmXreKnGxATGfvYFLFZEReCEXr+zOxPdJ9tzb0kk5u+5+TaI4dpFN5aMlKRz3+xhvI
         vettV+s4ZK/5yOWrDoMyD0UcQM+YTLBbS1cfCBu89tVGtBlvBXmC+mN2Ei8Q0Ihaj70S
         QYtl9oe/rsS8iJnPBA8cg6h65q5ehAQH2mkBC7sUbOGcCQKWWpp4MLApakHDyzdHIu+Q
         iDGvZKN6D2NGefJeeEsuxEnfEQ0h59S1uk4LnXmvIgpb4e/7QibOA1bQ7cWsFtL/vfza
         VTzA3mb6ktEqnJSFXILHHFmyLGlbBwPArcrAB2r96Rj1nNwA9Jtem0pWIGwbgLOUY05X
         drkg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=IONlEmNk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b16-v6si3986338qkh.379.2018.08.02.22.23.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 02 Aug 2018 22:23:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=IONlEmNk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49004 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1flSYm-0002gC-9r
	for alex.bennee@linaro.org; Fri, 03 Aug 2018 01:23:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38931)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1flSXJ-0001d9-S6
	for qemu-arm@nongnu.org; Fri, 03 Aug 2018 01:22:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1flSXG-0004re-OH
	for qemu-arm@nongnu.org; Fri, 03 Aug 2018 01:22:01 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:35719)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1flSXE-0004qs-Q5; Fri, 03 Aug 2018 01:21:56 -0400
Received: by mail-pf1-x435.google.com with SMTP id p12-v6so2615636pfh.2;
	Thu, 02 Aug 2018 22:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KwnVk0FZbRL5sACB19TJDzQlDaPoBQkUgoOUVam8cLY=;
	b=IONlEmNk88TmkodRPAfdCYzL/ar8iEHhfeH/KTBwhDSRQokqbmnhmrLXfDbyGBJAEd
	M2Qy3ynz2VIMOGsJTYvqu1OH/GxRp2bLwZ+x9VHKDSSEC2g8lpFR5zO0hrjcAiVJncIW
	3pOscdSjcq6lwV/Ed5b7sadKSJFTN17BL4VewAfxP6hqoXM7rm5Uzq4nkUI3dtMPW+nF
	Vraa56+x8wkyUe3soQz+72DUjcSfezzKbBOOYuES7vgK8nxj60KocKyXe7jHPwrw1kql
	0WYiqXFc2rfEdIgK1tzpUNMYbqWuV4dT8r3LfOWIqt95XqJnuIh9JARUEqcWl/CB2Zdh
	oj6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=KwnVk0FZbRL5sACB19TJDzQlDaPoBQkUgoOUVam8cLY=;
	b=qemnsBw7D5q8T+rE3pTlP7GZdu8xF6+1HMrjGeAy22zoT+t05dzIV+QLk+6PYkuJSx
	4dCHkm5T+fhxZQ9Fz5qZ2sNjDjShQWu6Rcn6KFhE5oZm9BQaW/zA5pcVaGqQkS2RDCnV
	c5aRFsA1byOvqf38spjem+MVUkZmHZbST3MiW1clv6h7vl2bhY+hllV1KsFD7Fjow8hy
	QQcr+Cgor7s0MFrIEEO/Zxe9oLVS4x80sTFMz+/ZrUVsNJ1xrSP829JGfHYdFuR0HFBQ
	OrQNRjnQ9EAYBlDgvZ8DXjrHfxQwcamvYxBxW261uy86kuIwP3BRpEv5AcZ4x1Q/dFuk
	46Ag==
X-Gm-Message-State: AOUpUlGRbQN4VNfaYe0smmjVh2qcmB4s/7jCUyzVhadUX1XCc6pDlq75
	LniItnuJ2+nxWBIFA13Kebo=
X-Received: by 2002:a65:6203:: with SMTP id
	d3-v6mr2208615pgv.420.1533273715820; 
	Thu, 02 Aug 2018 22:21:55 -0700 (PDT)
Received: from aurora.jms.id.au ([45.124.203.18])
	by smtp.gmail.com with ESMTPSA id
	l127-v6sm5635688pfc.55.2018.08.02.22.21.51
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 02 Aug 2018 22:21:54 -0700 (PDT)
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
	Fri, 03 Aug 2018 14:51:48 +0930
From: Joel Stanley <joel@jms.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Fri,  3 Aug 2018 14:51:35 +0930
Message-Id: <20180803052137.10602-2-joel@jms.id.au>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180803052137.10602-1-joel@jms.id.au>
References: <20180803052137.10602-1-joel@jms.id.au>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::435
Subject: [Qemu-arm] [PATCH v4 1/3] MAINTAINERS: Add NRF51 entry
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
Cc: Stefan Hajnoczi <stefanha@gmail.com>,
	=?UTF-8?q?Steffen=20G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	Jim Mussared <jim.mussared@gmail.com>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mQvJNGNRnPge

This contains the NRF51, and the machine that uses it, the BBC
micro:bit.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v3:
  fix spelling of mailing list
  add stefan's reviewed-by
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c48d9271cf15..5a0d2e327d4a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -656,6 +656,14 @@ F: include/hw/*/*aspeed*
 F: hw/net/ftgmac100.c
 F: include/hw/net/ftgmac100.h
 
+NRF51
+M: Joel Stanley <joel@jms.id.au>
+L: qemu-arm@nongnu.org
+S: Maintained
+F: hw/arm/nrf51_soc.c
+F: hw/arm/microbit.c
+F: include/hw/arm/nrf51_soc.h
+
 CRIS Machines
 -------------
 Axis Dev88
-- 
2.17.1

