Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2217765lfo;
        Fri, 5 Feb 2021 09:50:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzpYfn+ElQZznsXb198QGNsEh3b5G4spp6lDa1OIl4Fwz3elxxntM2Y2MXPskGYfOqgKlAZ
X-Received: by 2002:a25:414d:: with SMTP id o74mr7641449yba.471.1612547413058;
        Fri, 05 Feb 2021 09:50:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612547413; cv=none;
        d=google.com; s=arc-20160816;
        b=HHTRD0cML8rioWkt5ZsF014elah5OXQHFx6axEyIyGF6bz9WDXpoNtI2gY+dizsAHE
         l1zDg9vQC34VsLcrONtnDanrOltElEx6vRTMkIlUItWwciffI2yCDPBwjrM1IcDEtrck
         iPYzMW2ywIZHCiLFkHdXCQByfdFXd1fE0pcyLXfK+wCGejVe9g1e4HHVCl5DYsCi4EE/
         KyyQ5I5iu+sbZDN3AQmstSQCkS98QrS/moYOYiSobczN2tiFqJXoy6DnJ2nIEUiZ3kvh
         KiaaZkkRbiHO55Ygr/hF0VaHKV0e9a+pv0tn9+d9hq2Y7GEwXDn34wpIs19hy+nM9e6T
         nIJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=jMMA1bcWT9Cf0LVPoBI3bN3FRfuppErnoBYF5x3xFs8=;
        b=V51l0NfXFPkNssT/Z0azJwEE+B1knfjLN0uJKXzfGjtO/JxsS1tLJdeG25zJB5Pxrf
         kK/D92LlA00hyBNC+c9VFz05d14l3lvw3PX3m7G/70Uk7lCTIyf1m1+DkitaTZsi4mGA
         EmTDfjELWAO32tak3MjZUJ7BGpExVXu5gt4f3ZbPvv5p0tWYAFhByTfGsh1OcSuoG04y
         Bbdqc4hRwr3p40AqWwyZsmiywGbesHkjPyGlol1aEYP11+a5VcXI9sIhHOh+wr55AeGL
         oFGelU3oKj+Pr1HN4KkZoRV51poWIgBkcsBjlSIbdLBN3s3jQgn5hoRpaN6s/6+s32qT
         yz8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BSJcvNyl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z62si8483981yba.98.2021.02.05.09.50.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Feb 2021 09:50:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BSJcvNyl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l85FE-0003I5-DO
	for alex.bennee@linaro.org; Fri, 05 Feb 2021 12:50:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l84Tz-0007AB-Lc
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:01:23 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:43544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l84TW-00048D-It
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:01:23 -0500
Received: by mail-wr1-x42f.google.com with SMTP id z6so8407581wrq.10
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 09:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=jMMA1bcWT9Cf0LVPoBI3bN3FRfuppErnoBYF5x3xFs8=;
 b=BSJcvNylWfV2OAx7I8JLY6GWD/PmR3i4voRQfrQKWyM/3t9MFuKLq4uzudSCTBIuET
 4Wa3g+TTtnbNYd3qOcAeU/AtSAAzYUU84dzVZuA2rxwkSZ9MJN+F83Rv8UapQhQoB7dL
 gBMZCirI7DMXm2QLCqvect23rgLEHDCOhZTiwsUyfmM6quzUUZYuyk1qF5mOwLB04oip
 JID+RVC99OqtNXwHF/Hu8Szl/IjtRp/FJgo4qJtO21BIiuYwOwJVsICU/Ht2LmPenfMG
 csCpH2eaaLcriYi3J1DS/vZkrlpg7D+4Y51B9v4M69kiuv5KxqQRdtyGA8XA2vTD/GZ1
 2TEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jMMA1bcWT9Cf0LVPoBI3bN3FRfuppErnoBYF5x3xFs8=;
 b=DPWv5Af/pTPec8q6xzF+C27ccSiqidraJQjR/F6crC2RkgPlstN46/KPdwfVo1Ml9B
 1o3+fd6ilpF33hKbDIXmOMKOI6S4YLp2IzVnzMYfBaxqquKM6iks4dAFogU9+yEIm7j3
 g6jffh8Q0TmIrAmhbMlas4xDfz6MMzIcSeJ/INoCjdxqdO2E4eCZmVNOHMUv1y2/8f1K
 OXYINzJk9eogC3nuWQooRNeBjVuO6wcmMI6xTUb2YyLSRi1lCx6iaI6oe3uyLyFddAUO
 hvmAl4iP4pW/QPkQ2CBvIQSy4REgqGzX6JoCttOnoYwLIO1uQBU+LKvSIj1dA168iaPY
 IdYg==
X-Gm-Message-State: AOAM531v+uBJhOq6hT3dNGw73Yfxf4Y/vq4B/WalFcnimNIRvQwshlsW
 0fKrONGCgUETDgyRdeJbq/weGRfVBnYoGQ==
X-Received: by 2002:a5d:6311:: with SMTP id i17mr5988743wru.195.1612544435474; 
 Fri, 05 Feb 2021 09:00:35 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l11sm12200010wrt.23.2021.02.05.09.00.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 09:00:35 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 17/24] hw/arm/mps2-tz: Set MachineClass default_ram info from
 RAMInfo data
Date: Fri,  5 Feb 2021 17:00:12 +0000
Message-Id: <20210205170019.25319-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210205170019.25319-1-peter.maydell@linaro.org>
References: <20210205170019.25319-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: W27BqbK+C/P+

Instead of hardcoding the MachineClass default_ram_size and
default_ram_id fields, set them on class creation by finding the
entry in the RAMInfo array which is marked as being the QEMU system
RAM.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/mps2-tz.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 1e8dde768c2..b46b32746e0 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -811,8 +811,26 @@ static void mps2tz_class_init(ObjectClass *oc, void *data)
 
     mc->init = mps2tz_common_init;
     iic->check = mps2_tz_idau_check;
-    mc->default_ram_size = 16 * MiB;
-    mc->default_ram_id = "mps.ram";
+}
+
+static void mps2tz_set_default_ram_info(MPS2TZMachineClass *mmc)
+{
+    /*
+     * Set mc->default_ram_size and default_ram_id from the
+     * information in mmc->raminfo.
+     */
+    MachineClass *mc = MACHINE_CLASS(mmc);
+    const RAMInfo *p;
+
+    for (p = mmc->raminfo; p->name; p++) {
+        if (p->mrindex < 0) {
+            /* Found the entry for "system memory" */
+            mc->default_ram_size = p->size;
+            mc->default_ram_id = p->name;
+            return;
+        }
+    }
+    g_assert_not_reached();
 }
 
 static void mps2tz_an505_class_init(ObjectClass *oc, void *data)
@@ -835,6 +853,7 @@ static void mps2tz_an505_class_init(ObjectClass *oc, void *data)
     mmc->numirq = 92;
     mmc->raminfo = an505_raminfo;
     mmc->armsse_type = TYPE_IOTKIT;
+    mps2tz_set_default_ram_info(mmc);
 }
 
 static void mps2tz_an521_class_init(ObjectClass *oc, void *data)
@@ -857,6 +876,7 @@ static void mps2tz_an521_class_init(ObjectClass *oc, void *data)
     mmc->numirq = 92;
     mmc->raminfo = an505_raminfo; /* AN521 is the same as AN505 here */
     mmc->armsse_type = TYPE_SSE200;
+    mps2tz_set_default_ram_info(mmc);
 }
 
 static const TypeInfo mps2tz_info = {
-- 
2.20.1

