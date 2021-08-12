Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp195149lff;
        Thu, 12 Aug 2021 02:42:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzgZWSjlLu0ii7BcdoTZW+2P3bsYX5IXHa437rPKZMyKS36/xbRpDseu4yaQsAjAmny4IPh
X-Received: by 2002:a05:6e02:1aa2:: with SMTP id l2mr2121274ilv.224.1628761329175;
        Thu, 12 Aug 2021 02:42:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628761329; cv=none;
        d=google.com; s=arc-20160816;
        b=EVH/nc64YLZIXJ9DlLVriFF210iqxGx1q51vYTFdFgD+dpdnzkBxQ+g6PAceHmaQ75
         PfbiT+I9EOkoNWYg3HmMyDsHex6Cfbtzl2NRT/XGR59cd/mjheWciXJnjzGtJ7E+9Mbq
         Mo88byR8VuYW17sih4N4VojR6lG3EA2vnkaZPISzCtECdcQnlbDghyg2WPxAWJc+UhHA
         O3P8ttM5arSMLEnihGvYXgu4Qm7vd7152LP0DazYA6O+Ncy8B04R4WyMS+kD+DzHx4dp
         cZaXJgK0HZCFrxPxVlQzzrH9ySXO1RuuGUV779bGjGWiXi+wCAXIcJMG+LzJAyo1+4ZO
         WUMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=xBEpy6tnaeq4pLl7s09XSomDfvd35EGGhyYCRV+jECc=;
        b=lA08aSQG+BLc/8l06TtXNR//546dhQ0k9T7SAQAFEcVoGRsJsVc6jU9+oSYAl8ajOU
         s2UBFAgW+RAXxjhTYIOjgo1SMb9GUbzMyR2Z3dz4MyFJYwTzHr7S+CMxYYh25V/6qzvq
         ibJKIl3D/Zs9wWb/Lp5KfEsQkoFbLIRnuQZlFhUuh+V8cboS5P7hzdQZFphUkUYt78O3
         oSXJDrt19djl2C4mZ4aT34pSRFD/5SQn9RBn9+juYLRYphZsf6dbDbx4JOEDULeSpjEm
         LEmXDgGeLPNyuFPRUne5HC2gULTfg14ZcKTm/rVwbNuzIx/DYzD9MfrIrchtK2zFpzfr
         1f/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zajkclg7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v20si2933566jas.98.2021.08.12.02.42.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Aug 2021 02:42:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zajkclg7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mE7E0-0004Sl-Gn
	for alex.bennee@linaro.org; Thu, 12 Aug 2021 05:42:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE76V-0005yb-LZ
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 05:34:23 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:41747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE76R-000818-F8
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 05:34:23 -0400
Received: by mail-wr1-x431.google.com with SMTP id x10so1042362wrt.8
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 02:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xBEpy6tnaeq4pLl7s09XSomDfvd35EGGhyYCRV+jECc=;
 b=zajkclg7tnMK4LOSn+oRqTVHUgYxgmFkuEMFqsXD8X8AxcJ/fNvKMdpkwKRQavNprv
 i56vxOevPTb9F83cN5d+VJmygBywK+Y43syTkmdq+EymwPkMOgvMkAIYJMHzSmARXu8M
 6DSDPayODoBZbipzJCHX7dnJx1fGHN2zX9rCStZ3G/WrfyMqgVDcmxKUXjXWbadMGvYG
 4wuI4JlvTSRq1RJqr0f1bCcTz7Mu+r2fA5QiO/gm0hVjKBxPGNpQxSVxIig3BvsXId8L
 rRRk5YwbkQZPbT840i7chnRznRcKQpecpgvI3A47cU22ap2GdmaGKgmgH8quNuafkiE7
 rI+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xBEpy6tnaeq4pLl7s09XSomDfvd35EGGhyYCRV+jECc=;
 b=MkwD+GMPCaqc2jdl3FmChzi2JhW4C0wbOb9+ICnKi1l2cWtyQcgQfswRnKHgFSF6+b
 K6UwOH5rhPnU/cMZtIwdb2kk6xwBZI0sQApgP9bPu8ODyN+S5jMvKgUH+pDP50qq+tYg
 q8ovri0f1A3oohdafgz4OH2/LuvwU6XUoHc7EQdtYRSdDGQzpoqpLwQ2TTubtSg7NC3k
 Ttp12dL+/KQPRWk3ysEtj8LXrSLXN3o2XAv9juNdx8Af32do8dcdfpHDV6oV135NlNqX
 hchKfN1oTu710M6BJLdSEnY7eMl0n0+RmDzssN0sgWivMb5XDbZVlX2OF525Dd4do2GC
 MucA==
X-Gm-Message-State: AOAM533wAPCFr+M1H1Y7BY8RC8A/IgaA7U/NYh9kYRrH6KhsE08uRLU6
 YNpptsi8QX0DeGc65UPUkfJJqg==
X-Received: by 2002:adf:db83:: with SMTP id u3mr2991184wri.363.1628760858040; 
 Thu, 12 Aug 2021 02:34:18 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l38sm8158506wmp.15.2021.08.12.02.34.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 02:34:17 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 20/25] hw/arm/msf2-soc: Wire up refclk
Date: Thu, 12 Aug 2021 10:33:51 +0100
Message-Id: <20210812093356.1946-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210812093356.1946-1-peter.maydell@linaro.org>
References: <20210812093356.1946-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
 Alistair Francis <alistair@alistair23.me>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 72y5yHYDhjLv

Wire up the refclk for the msf2 SoC.  This SoC runs the refclk at a
frequency which is programmably either /4, /8, /16 or /32 of the main
CPU clock.  We don't currently model the register which allows the
guest to set the divisor, so implement the refclk as a fixed /32 of
the CPU clock (which is the value of the divisor at reset).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/msf2-soc.h |  1 +
 hw/arm/msf2-soc.c         | 23 +++++++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/include/hw/arm/msf2-soc.h b/include/hw/arm/msf2-soc.h
index 01f904cec47..ce417a6266a 100644
--- a/include/hw/arm/msf2-soc.h
+++ b/include/hw/arm/msf2-soc.h
@@ -59,6 +59,7 @@ struct MSF2State {
     uint64_t esram_size;
 
     Clock *m3clk;
+    Clock *refclk;
     uint8_t apb0div;
     uint8_t apb1div;
 
diff --git a/hw/arm/msf2-soc.c b/hw/arm/msf2-soc.c
index 0a1e594aee6..dbc6d936a76 100644
--- a/hw/arm/msf2-soc.c
+++ b/hw/arm/msf2-soc.c
@@ -76,6 +76,7 @@ static void m2sxxx_soc_initfn(Object *obj)
     object_initialize_child(obj, "emac", &s->emac, TYPE_MSS_EMAC);
 
     s->m3clk = qdev_init_clock_in(DEVICE(obj), "m3clk", NULL, NULL, 0);
+    s->refclk = qdev_init_clock_in(DEVICE(obj), "refclk", NULL, NULL, 0);
 }
 
 static void m2sxxx_soc_realize(DeviceState *dev_soc, Error **errp)
@@ -92,6 +93,27 @@ static void m2sxxx_soc_realize(DeviceState *dev_soc, Error **errp)
         return;
     }
 
+    /*
+     * We use s->refclk internally and only define it with qdev_init_clock_in()
+     * so it is correctly parented and not leaked on an init/deinit; it is not
+     * intended as an externally exposed clock.
+     */
+    if (clock_has_source(s->refclk)) {
+        error_setg(errp, "refclk must not be wired up by the board code");
+        return;
+    }
+
+    /*
+     * TODO: ideally we should model the SoC SYSTICK_CR register at 0xe0042038,
+     * which allows the guest to program the divisor between the m3clk and
+     * the systick refclk to either /4, /8, /16 or /32, as well as setting
+     * the value the guest can read in the STCALIB register. Currently we
+     * implement the divisor as a fixed /32, which matches the reset value
+     * of SYSTICK_CR.
+     */
+    clock_set_mul_div(s->refclk, 32, 1);
+    clock_set_source(s->refclk, s->m3clk);
+
     memory_region_init_rom(&s->nvm, OBJECT(dev_soc), "MSF2.eNVM", s->envm_size,
                            &error_fatal);
     /*
@@ -115,6 +137,7 @@ static void m2sxxx_soc_realize(DeviceState *dev_soc, Error **errp)
     qdev_prop_set_string(armv7m, "cpu-type", s->cpu_type);
     qdev_prop_set_bit(armv7m, "enable-bitband", true);
     qdev_connect_clock_in(armv7m, "cpuclk", s->m3clk);
+    qdev_connect_clock_in(armv7m, "refclk", s->refclk);
     object_property_set_link(OBJECT(&s->armv7m), "memory",
                              OBJECT(get_system_memory()), &error_abort);
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->armv7m), errp)) {
-- 
2.20.1

