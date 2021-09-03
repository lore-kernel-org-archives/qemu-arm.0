Received: by 2002:a0c:ec8e:0:0:0:0:0 with SMTP id u14csp747778qvo;
        Fri, 3 Sep 2021 08:18:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxd2nO+f4ayzv9h8Y33vTUEawZHCZRsdeyaqy1oB096dWSZuVcw0cwDyxzxnsczja1AAiiY
X-Received: by 2002:a5d:4a08:: with SMTP id m8mr4755948wrq.263.1630682305501;
        Fri, 03 Sep 2021 08:18:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630682305; cv=none;
        d=google.com; s=arc-20160816;
        b=sfRMuY3XLaHoi0hRx27/8G6dXxgXDviccDDqyeGlK2YHtLIV18FSCH0ENOGWpCzngD
         EU4OXJbjK0u+aDSdVOUukc5Hx4Z7HjSd6c0cIVunBLz9KIB8x7uBpzdU+8l4/52grvK1
         tGVsPHowTGRZCUTxL00aKJ5625zTE/A8CouIv5VTWxMAZl2h4BIENInhtguR3hVAfXdz
         VLt5mcuxtKlPgnU9ppZjNZMEjoPYbBm4hyJxbMulgDvsAyyXMs+HPHFlp5GGbQpSPO6Y
         ROUS/7F5gPedl3lj/PGLQEZ676Iy2ZXdS8C5v3wrGoGcblZTBs4PkhcGu16qr6p2+Rce
         57CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Mxdg4WBcVbUdsRcZMoLQ96Hj5pGJaTJATreG10LOYTE=;
        b=cHlACd9c8GKq+yIMv7lWAyos3r/+wT8XUXtkMzJUqrmZGK8MEw9hXchTiJNf6hlwQF
         /6gwVYvcQXa38KDHWnjN7ZfcmGHySes1L8fb3ymJRS+DgjOejhLnX0RqdjMA6eXxJrYI
         PYH6LN3zt9uosUla6siu+JbZLNSYFumw+hSWcixHjacRd4te/QHE6ktoUamUJjWjRUlc
         6TDEOmHrvYiTHMLyO3yIuMEa5W0YymxAfoaCQDQJgH8HNuN8gNOKl3Twzms0IJIRJ2zO
         JAlY3kWNdUz99ocUj6x0tut3uFJNnVFpsGRlMwtGzRzz2DOyGLs6k9MIW/Lv8lgooWC9
         ipPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HWaGAy+O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n6si5348158wmk.204.2021.09.03.08.18.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Sep 2021 08:18:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HWaGAy+O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mMAxU-0001T3-FR
	for alex.bennee@linaro.org; Fri, 03 Sep 2021 11:18:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mMAty-0004g0-2v
 for qemu-arm@nongnu.org; Fri, 03 Sep 2021 11:14:46 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:38522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mMAtv-0007Rd-N4
 for qemu-arm@nongnu.org; Fri, 03 Sep 2021 11:14:45 -0400
Received: by mail-wr1-x42b.google.com with SMTP id u16so8702423wrn.5
 for <qemu-arm@nongnu.org>; Fri, 03 Sep 2021 08:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Mxdg4WBcVbUdsRcZMoLQ96Hj5pGJaTJATreG10LOYTE=;
 b=HWaGAy+ODu+VetBKHsWRZ8RzjD91FDOkTsBg2bYVP/KIDBIUG2e05pHCyaE2tyxFzV
 OIBjmt4TxquIeRdWDw+dSthE0O+iGynN2XD+6AVFdXCWb2FB7Ngx8SscIOr94bVQCFiP
 iyOLwUapHA86iCe989KP53u+eE3AYPxGcSFKbMqii1HnAf7ae2rP+KiE53d32mx+xA/D
 Grbtza//f5WV39WfpVgZ+aU0KQj1ZBpJLvc4tWwVk7pZ9Um32g7osSPOHc3TuX5kn2SB
 KEZmdTIqTvL8t7aOZMH6GJ+b4rfhMcx75tnuVUKTXJ8Ns2cd20hv0q9S7VSocuahqLLW
 oLmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Mxdg4WBcVbUdsRcZMoLQ96Hj5pGJaTJATreG10LOYTE=;
 b=r8baaWIyCCXNaK2E30t0H4c5/yK+27SLfkacfuZOGsEopxclFkYNjUtvjq+vKWLnD8
 q4fQYepQDNF82GQ7opvji9RnXFJ2tyQaBDYFdRCvVWE6IGgcK0ex0pLO8XuQmelyJ9sx
 O+f/P9lo7Y7F3enI3WB+J4pe8wphRW0RKk2JdnsfEfNgVaPOmOerMn3RTiLfv/yuTsou
 lwVufiIghmbgCDq3JE4zYU9ODkcpGXct30Up0WRBTHn9TC/hOJ4u+BnvwaqHcJzuuWpl
 xS7aYzuCbEXoZ9Rr4UoHFXmhBiRKIMMk+g+3c0J04x/9Fe9fFufn24RxIJAmclrjGEdU
 xQFg==
X-Gm-Message-State: AOAM5331EehF21mLRZr9mKGcp+g9Dl0iEsptVJTy8X+fbEMImLbiP/c0
 AjUFqdP3D2ky6IGp2sVGyK7UdhmTHmB7vg==
X-Received: by 2002:a5d:4285:: with SMTP id k5mr4829659wrq.131.1630682082344; 
 Fri, 03 Sep 2021 08:14:42 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y21sm4737780wmc.11.2021.09.03.08.14.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 08:14:42 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 4/4] hw/arm/mps2.c: Mark internal-only I2C buses as 'full'
Date: Fri,  3 Sep 2021 16:14:35 +0100
Message-Id: <20210903151435.22379-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210903151435.22379-1-peter.maydell@linaro.org>
References: <20210903151435.22379-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +fLddK9tr+HN

The various MPS2 boards implemented in mps2.c have multiple I2C
buses: a bus dedicated to the audio configuration, one for the LCD
touchscreen controller, and two which are connected to the external
Shield expansion connector.  Mark the buses which are used only for
board-internal devices as 'full' so that if the user creates i2c
devices on the commandline without specifying a bus name then they
will be connected to the I2C controller used for the Shield
connector, where guest software will expect them.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/mps2.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
index 4634aa1a1ca..bb76fa68890 100644
--- a/hw/arm/mps2.c
+++ b/hw/arm/mps2.c
@@ -428,7 +428,17 @@ static void mps2_common_init(MachineState *machine)
                                          0x40023000,    /* Audio */
                                          0x40029000,    /* Shield0 */
                                          0x4002a000};   /* Shield1 */
-        sysbus_create_simple(TYPE_ARM_SBCON_I2C, i2cbase[i], NULL);
+        DeviceState *dev;
+
+        dev = sysbus_create_simple(TYPE_ARM_SBCON_I2C, i2cbase[i], NULL);
+        if (i < 2) {
+            /*
+             * internal-only bus: mark it full to avoid user-created
+             * i2c devices being plugged into it.
+             */
+            BusState *qbus = qdev_get_child_bus(dev, "i2c");
+            qbus_mark_full(qbus);
+        }
     }
     create_unimplemented_device("i2s", 0x40024000, 0x400);
 
-- 
2.20.1

