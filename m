Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1489958lfa;
        Sat, 24 Oct 2020 10:05:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyD1DVQf8+PqJP7az04OUvAXm5hCW2jD2BPthUGfCEF7k4gORHvcHrVP1lw0UzrLfU/jqbO
X-Received: by 2002:a37:6183:: with SMTP id v125mr8604190qkb.497.1603559141798;
        Sat, 24 Oct 2020 10:05:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603559141; cv=none;
        d=google.com; s=arc-20160816;
        b=QRgUcufd1l2aYrjcqkhwMiRd1rPb9iq7WveXdObTZIc+0+r2WK1JLYqGbVfD2uHRQ7
         JdOPkQ8P98EJaVhBfymW7iQLpiE1dMRMLw3VB6rs9kBjORry4cf4/qLFtkT2lAFfynF3
         ZD9ch6m1nEF3SkfLBzJa1dAGaXXlaOfzQbF7caBgbZAsHGGUMfw5dVoif5xeSnNviNT+
         DQr27KRoaA+AtAPn2btc2rCuk4q3K0px3SNv2mHi24oPTM4D+Gs2KHYKmp4sd4ggIgDC
         R9PYPhoHwNaTJ+PskHQguNHJ5edo0YMnSF1RAbEdu66Afj5Ilsnoc3gHR5Ag7OqVcOJG
         GzRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=8qNKLMCAe31Z+xJ2CKSlTQb107TK4jz5Yz6AAjaC7vk=;
        b=i0ycR5xDL4StUUKgaBK+56/hJpB1iv/ziCRb+7Cy34q2eg/9gKM9FPa/hDbTaT3SFy
         0BVbEZDwgCHUyA0qMKHYAvU3WDAXMhvATkH73egubECjYWs5z0RiEjwxrijXBj+NDCqn
         fc9uMwe4oxfAwvp7PuqTXonSxi1rXjCF7mT0uoa2pHkuJzAN2VDn6vzgjRkeHSVyG6oH
         0qDni28PihOHZXdN8QUPpq6TpK+8HVYZp9MpTHm01Kpy/VDMMZ99ze9r3pkB0NlwROcn
         mCd89DgBPWdual6Q9RViIeE8xOlB0aXZQnaNZ9jbRTFbDvyG+b7e4xeuXy8np5HoIMLw
         i6cw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=aPV++E4W;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e12si2845311qkl.96.2020.10.24.10.05.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 24 Oct 2020 10:05:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=aPV++E4W;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:33456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kWMz7-0002gB-6O
	for alex.bennee@linaro.org; Sat, 24 Oct 2020 13:05:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kWMvq-0008EV-27; Sat, 24 Oct 2020 13:02:18 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:32978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kWMvo-0005m3-Dz; Sat, 24 Oct 2020 13:02:17 -0400
Received: by mail-wm1-x341.google.com with SMTP id l20so2527392wme.0;
 Sat, 24 Oct 2020 10:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8qNKLMCAe31Z+xJ2CKSlTQb107TK4jz5Yz6AAjaC7vk=;
 b=aPV++E4WW8vxrkMXlbOXxcXQt8cAexhFcCZckQEFGmK+tNVxy40RisMzv0LfYJ+YeB
 3Uvjs2tRP3b9n3dJZ/uX6P7bCYKZf2iRaCIJ1vMktDRgJe33iSDB3ae0YEQ4R5pVAWEr
 ljjhE0N5SPGny6VA7Z2JU0Dp3l8elLVy7BGtlcN4TASjBNQ3rxmPgbnmTR7vgD4ckEOm
 JbaxQwcDPhkKEyzKcE/PxPPeP0CykkFKGlv6mpw6clkLDclsYxP3ZwY4tcn2PgiRtUTG
 rjiVnxVgOh+4mBKbvoWu1uS2vuCC0KF0lma9cn1FeS4oSf0dkXiQPGeFTrN9jDMlHTUD
 LuTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=8qNKLMCAe31Z+xJ2CKSlTQb107TK4jz5Yz6AAjaC7vk=;
 b=lPMxlopJ9blAlNFJm9IqNKCDaJmwPj87wo84JZ8/u4I6YonejfKw6IiUJc1qHpvU0Z
 lGzbP7HsRAcMYPAKhRbCyrZ5rnV5k6PdrDzdfsxBLugSKtiZnmoOh+JiQQ7Tnfe9hFaK
 SrdcKsNF9nJI3G6mt9h/CydNH4506+d2AWhk2MtAyvOrMtOFZXfIXk6SxS4Y8nksNlX7
 yoc3hz+YvPLA8WZ90Phj3LCdmjoCuoArOstYRviuH8GXAy6dWCpmgUix7dH+5SQsVOBh
 FxDDhIljeUxGt62FgFrobN6P1QYwP1m0vtML9hJ+ZmhyQ+/hv/lZ6REMyRtLh0lJsdVq
 B7UA==
X-Gm-Message-State: AOAM530GzwT0lntSQkkLn1NgW/MnbaBK2L+DDuXgeoT2QOXdmVKeLQ0w
 2r2Yf0CkPg5DUT7BdvZJXYMwj+zahgk=
X-Received: by 2002:a1c:2ece:: with SMTP id u197mr7903545wmu.58.1603558934595; 
 Sat, 24 Oct 2020 10:02:14 -0700 (PDT)
Received: from localhost.localdomain (237.red-88-18-140.staticip.rima-tde.net.
 [88.18.140.237])
 by smtp.gmail.com with ESMTPSA id r128sm12051439wma.20.2020.10.24.10.02.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Oct 2020 10:02:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 9/9] hw/arm/raspi: Add the Raspberry Pi 3 model A+
Date: Sat, 24 Oct 2020 19:01:27 +0200
Message-Id: <20201024170127.3592182-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201024170127.3592182-1-f4bug@amsat.org>
References: <20201024170127.3592182-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Luc Michel <luc@lmichel.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: g1U/MScE7A+u

The Pi 3A+ is a stripped down version of the 3B:
- 512 MiB of RAM instead of 1 GiB
- no on-board ethernet chipset

Add it as it is a closer match to what we model.

Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/raspi.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 0f5ea7e99b5..990509d3852 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -348,6 +348,15 @@ static void raspi2b_machine_class_init(ObjectClass *oc, void *data)
 };
 
 #ifdef TARGET_AARCH64
+static void raspi3ap_machine_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    RaspiMachineClass *rmc = RASPI_MACHINE_CLASS(oc);
+
+    rmc->board_rev = 0x9020e0; /* Revision 1.0 */
+    raspi_machine_class_common_init(mc, rmc->board_rev);
+};
+
 static void raspi3b_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -373,6 +382,10 @@ static const TypeInfo raspi_machine_types[] = {
         .parent         = TYPE_RASPI_MACHINE,
         .class_init     = raspi2b_machine_class_init,
 #ifdef TARGET_AARCH64
+    }, {
+        .name           = MACHINE_TYPE_NAME("raspi3ap"),
+        .parent         = TYPE_RASPI_MACHINE,
+        .class_init     = raspi3ap_machine_class_init,
     }, {
         .name           = MACHINE_TYPE_NAME("raspi3b"),
         .parent         = TYPE_RASPI_MACHINE,
-- 
2.26.2

