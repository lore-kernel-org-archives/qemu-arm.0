Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp519745wrp;
        Fri, 15 Feb 2019 03:37:23 -0800 (PST)
X-Google-Smtp-Source: AHgI3Ia9owppRUl6plabnQg4jq292jdUojvhLZY9PNE6bSwqVx9uAaS7ud4ZYJ0sV2VFhV3kQNtV
X-Received: by 2002:a81:a091:: with SMTP id x139mr7728153ywg.164.1550230643306;
        Fri, 15 Feb 2019 03:37:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550230643; cv=none;
        d=google.com; s=arc-20160816;
        b=fXMdOWjX82ph7S2Rh+J1Z0lJSIKYnWDwgT5mFyxS3g676BEuBYVzDx3dxbzf3FSIiI
         LUicUsxEtY4EnSWYYkk7QtO3ZcC68y8yS3m7MgELHHt/KlGBpDt6rNBXc+uE6s/8jex0
         49aIsbDegpvRyoAMBNmr20LEvrHuhKnY/3KqNwCo94rpFoOQdJBjGOh8Bs+1VrZt+MEe
         A+MW0G5qWX9WLlvssiuSG4Xo6trkv4mftgy9KnVFf/KF/I2vlsu6MG81MMdy/cuIpMYQ
         aT3G17Am8cU2sgPyYxQJLLSxodvJnQdffFxcthtS5B637dQOUOD0Qp60eVzN3fZy2Rzh
         Iong==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=JbtA9SjEOJBmRGzQlLurF30tCcXLHHn0SJIaZcXvfRE=;
        b=b4LtPoUihaolZghbG2cthvBfC88A3oMkkLlSDt0jTm1mtCf9UppLD9CsCcLrtGc6ZH
         GSdK7MRnBNnYuaU0h11uOcyXGYC1HRwvb4R15CsZamwJBm5tr7f5z5KS58SZy0onFjcH
         4Xx8jRLJCwB+eom2J1pNu3K1iuDTu1Ch7YQ/KFgGx0qrIqi9S9GFj1cbqoD2Qs2OT967
         1u2PbW3ovgrJDtOVaDi0GIozLLyNYPKxbmtww+ttWJ+HbLzwgP3cznHX0iBW1SvqDP0d
         R9o/Y2CAUWK9jLpl5Q9aIVJYekLUsCuq3BLnfdr8+xPEFBVve65jOpPpKRdjKtsguASW
         1nBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XJ8uZHLw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x32si873908ybi.308.2019.02.15.03.37.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Feb 2019 03:37:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XJ8uZHLw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:37867 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gubo2-0003GA-P4
	for alex.bennee@linaro.org; Fri, 15 Feb 2019 06:37:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50054)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gubnt-0003Fg-Ap
	for qemu-arm@nongnu.org; Fri, 15 Feb 2019 06:37:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gubns-0001me-EQ
	for qemu-arm@nongnu.org; Fri, 15 Feb 2019 06:37:13 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:53844)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gubns-0001l8-7L
	for qemu-arm@nongnu.org; Fri, 15 Feb 2019 06:37:12 -0500
Received: by mail-wm1-x342.google.com with SMTP id d15so9622560wmb.3
	for <qemu-arm@nongnu.org>; Fri, 15 Feb 2019 03:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=JbtA9SjEOJBmRGzQlLurF30tCcXLHHn0SJIaZcXvfRE=;
	b=XJ8uZHLwgCW3J/0Hm02guE5H2wU2uMts05Tb7c968HxAUdRxyE40DfpogWnwfJjL3S
	1q0bd5RKQYt7E+NpG/ZXGNQJFc444T4NBJdkv4tWcO+xDlFsqdc30Pi8MJ5UxkYHqKh5
	40b5eTwb/jpmy3D4zZuv1H7qUFAXbCkdvjc+PmzDC6xvUa4m6NO1Izoy49lIN1sFrZRH
	fg48FYHS8lWRSRQrlR4UUMUEX6QKta9rk0yCab5O74pq3c8BUKNHDJClziwSDYhnH3sv
	lMH6Qy2C68lp2M4pq+9PXsSMBPSjr/njXPz1h74ST/gqcM2CEwE7mwhuFMpXOlkXUEsj
	aBDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=JbtA9SjEOJBmRGzQlLurF30tCcXLHHn0SJIaZcXvfRE=;
	b=LWSDZ7cyhUa3zkrA8hlMvTDsM7S5olxcoWMkBnVrZT2mbdKNQjaISW1y/oUEDBXvnO
	TffJBxF6tD5vlPsaIREfKIp1gBhtH094P0bCG+LxGOOQPACGevrqptVrEo9zn3Xh7azs
	51Mak8u8mzclVXhGLDC6gdHDLQ5o4dPli3qBP1RDZP1kcYEohOB2qtG2JkuBVEZ6N2Mb
	Ca4+8HGxlTWjMPP9pUrymTKpMGDc/pgsN+U1BYAYcYkgDyrXffQ5ujreWDgv2PaHWbWs
	dgKaP3EEdL8dPiAdQaIJp2z3Qs1MFwKVb5wA0AHd7LFZBxkeSHqHrS3YGFT02EMEUL/C
	AKjw==
X-Gm-Message-State: AHQUAubJdRhA7KUMVXFsuOIzTmodAFH39EdlLY+i8ukdfgn3d8DKPE4Q
	GMTC3HKxAGTUqk68DdOY4nuOt12epc3uTQ==
X-Received: by 2002:a1c:e71a:: with SMTP id e26mr6103879wmh.111.1550230630145; 
	Fri, 15 Feb 2019 03:37:10 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id c8sm3023010wrx.6.2019.02.15.03.37.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Feb 2019 03:37:09 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 15 Feb 2019 11:37:07 +0000
Message-Id: <20190215113707.24553-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: [Qemu-arm] [PATCH] hw/arm/armsse: Fix memory leak in error-exit path
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
X-TUID: uqOIB6jIMeJM

Coverity points out (CID 1398632, CID 1398650) that we
leak a couple of allocated strings in the error-exit
code path for setting up the MHUs in the ARMSSE.
Fix this bug by moving the allocate-and-free of each
string to be closer to the use, so we do the free before
doing the error-exit check.

Fixes: f8574705f62b38a ("hw/arm/armsse: Add unimplemented-device stubs for MHUs")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/armsse.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index 9a8c49547db..d0207dbabc7 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -762,26 +762,28 @@ static void armsse_realize(DeviceState *dev, Error **errp)
 
     if (info->has_mhus) {
         for (i = 0; i < ARRAY_SIZE(s->mhu); i++) {
-            char *name = g_strdup_printf("MHU%d", i);
-            char *port = g_strdup_printf("port[%d]", i + 3);
+            char *name;
+            char *port;
 
+            name = g_strdup_printf("MHU%d", i);
             qdev_prop_set_string(DEVICE(&s->mhu[i]), "name", name);
             qdev_prop_set_uint64(DEVICE(&s->mhu[i]), "size", 0x1000);
             object_property_set_bool(OBJECT(&s->mhu[i]), true,
                                      "realized", &err);
+            g_free(name);
             if (err) {
                 error_propagate(errp, err);
                 return;
             }
+            port = g_strdup_printf("port[%d]", i + 3);
             mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->mhu[i]), 0);
             object_property_set_link(OBJECT(&s->apb_ppc0), OBJECT(mr),
                                      port, &err);
+            g_free(port);
             if (err) {
                 error_propagate(errp, err);
                 return;
             }
-            g_free(name);
-            g_free(port);
         }
     }
 
-- 
2.20.1

