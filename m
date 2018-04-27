Received: by 10.28.4.212 with SMTP id 203csp620050wme;
        Fri, 27 Apr 2018 04:02:02 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZrpZt1D3c83OIsqFByq3eN5uUAcePklFDE5WZEPWdooNny5YkGYONbhi2wF67LzA7AX0wLM
X-Received: by 2002:ac8:3f0c:: with SMTP id c12-v6mr1473548qtk.19.1524826922546;
        Fri, 27 Apr 2018 04:02:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524826922; cv=none;
        d=google.com; s=arc-20160816;
        b=JcA0UMGkbdGfmr/vui4VjDK1MlrlDeeF8dz5Xr5hJvZI5aOwCPL5w4zFDl+hXdawgs
         10F7vtF6KlBfsq1SjGIXW8MJSl7EgJlhG2lh0i+uiX2nr8NKiMaK0oZcp6FtZBdYPTti
         ESVP33F2T9F9nr8Onn2f7e31kPlK8LVEP4MlrKltICJKgAjVQUcxGQZ/vFiTx7d5ngM0
         ek199YV4/S3P7DwBDX3HOx9QengWTT3naYpapIoQZCECGn+FyH3luLSke4370106fPC9
         lt/nwFdJZEOA1kxLKUMtG3Ev7WaH1O5fDeppQjGZX1UKxPQ0IL2142amgUcBvLsWFe/K
         zZ2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=swn1lAurhaZm4XlQrh6g36MlL8Tfx/eZZyJoe0auG+Q=;
        b=FdlGn38Z7VUi677gP4zPm4S2SpA5JtVeo/UDu+2zFLtfHKqyJtvkg4D+rc4/iAIIQ+
         iAkX1FYQMAjXb6lreE1ZCfW8+/KTzRrNVwm6kvuDjqnqsTFRe23pgsbidWsVYHWuy3rW
         pmrrsaDL022bPlvv11f9zMOLthiOJdxmjEJtJ84cS25lqVrcRKXVpxyT8IrXq9BJOdcF
         LzT4vzwpadn7JC4R1rLtFZjyXLkgW+VrknghKOF+rmodpa3o7tWJz2TqD5lukx4tZMmb
         +adA3ewWHOaVCRetwHxodXNvws/rbNr0zg+vKvyvt6AUtwTXVDhdjOZHKERYGHHzjQCa
         d25g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y58-v6si1078865qtb.234.2018.04.27.04.02.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Apr 2018 04:02:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47300 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fC18c-0003gu-26
	for alex.bennee@linaro.org; Fri, 27 Apr 2018 07:02:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56821)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fC18O-0003gd-UB
	for qemu-arm@nongnu.org; Fri, 27 Apr 2018 07:01:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fC18O-0003N3-71
	for qemu-arm@nongnu.org; Fri, 27 Apr 2018 07:01:49 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:41194)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fC18O-0003Lf-0T; Fri, 27 Apr 2018 07:01:48 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fC18E-0001BU-EW; Fri, 27 Apr 2018 12:01:38 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 27 Apr 2018 12:01:37 +0100
Message-Id: <20180427110137.19304-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH] hw/arm/iotkit.c: fix minor memory leak
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
X-TUID: ZDwCAudO57Si

Coverity (CID1390573) spots that we forgot to free the
gpioname strings in a loop in the iotkit realize function.
Correct the error.

This isn't a significant leak, because this function
only ever runs once.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/iotkit.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/iotkit.c b/hw/arm/iotkit.c
index c5f0a5b98a..234185e8f7 100644
--- a/hw/arm/iotkit.c
+++ b/hw/arm/iotkit.c
@@ -517,6 +517,7 @@ static void iotkit_realize(DeviceState *dev, Error **errp)
                               qdev_get_gpio_in(DEVICE(&s->ppc_irq_orgate), i));
         qdev_connect_gpio_out_named(DEVICE(ppc), "irq", 0,
                                     qdev_get_gpio_in(devs, 0));
+        g_free(gpioname);
     }
 
     iotkit_forward_sec_resp_cfg(s);
-- 
2.17.0

