Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp142452lft;
        Tue, 28 Jun 2022 20:56:49 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tTOuPaovtWUIt1D0KVcaHQXjre9svzCThy9Zu22PSjmzmBr3LNRfb1yr2JI0YCZE4tT/Ml
X-Received: by 2002:a05:620a:4e9:b0:6a7:8357:303d with SMTP id b9-20020a05620a04e900b006a78357303dmr723901qkh.105.1656475009186;
        Tue, 28 Jun 2022 20:56:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656475009; cv=none;
        d=google.com; s=arc-20160816;
        b=nSHGdn4bd2El2WnMXGb2vuSaGo50M7Eoa6gktcTRkekdOkXVmAPmK+j5qvdxH3jvPo
         KbXjArtk9srnBgAc0I43IZZt6DFTNt4WBZViPc6Y+CWiEb+3EDHU16KF2I/5GHZb41Vp
         d3sWqF6oMwEiQxfJmAxRFOmtpj2acjbaKC7uuwfjjwuJSL1tDr2DOU7Xxlg8rFK9SwYZ
         89cnjdUeL85CPI1lxxkez8HdlFRUlUXOB7BCOwoJRsvT0UJYsdFdszR8+r75Iq2dwqMP
         Wq5VcOUhRGNnbDkoQs40ZO6Oe2l12rNmxiFVMbUQ6qJnb44G6MWuCBgWBE2Agp04nWp+
         +rUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=mQ7p58dP8yL7VZt2P5gdrVm9FaK+5XRismhrco1SEZY=;
        b=sHvZj7cxRcpn7kJIDZrwakEK4msgW4G9ZjqpN/qXRPHeFazyIgfMPv8oG5VlwtZWBU
         1GahgyRQVzecK6licjtRqhANz6ynaN/b3P1kCF+vx1oAbuFwHRFBqYhfVLa051b31/ai
         ylLqW2uIGhyjFrr7r8Gks0laOaYUwREGYf9gFvsZcCSKsQjuFdRXGDFBqjU/jRi3rtNf
         k7J/CyI+lGN+8mRyhbfEZ+O6X46ANUeOSjfMncgrdGwRZR6tLDpqeMpQo0OMSU9jyubK
         PCEnLxV3fuj6HIZ0eDv2tlJFqOj3Amgv27MXUxnOltWEi8h6i1GW4fXIxoI9ky5LJl0N
         6snQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=JAGO6l5O;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f10-20020a37ad0a000000b006af33e5d580si3013452qkm.542.2022.06.28.20.56.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jun 2022 20:56:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=JAGO6l5O;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:43130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o6Ooq-0000Va-HG
	for alex.bennee@linaro.org; Tue, 28 Jun 2022 23:56:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterdelevoryas@gmail.com>)
 id 1o6OVW-0007xW-RF; Tue, 28 Jun 2022 23:36:50 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:40520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peterdelevoryas@gmail.com>)
 id 1o6OVU-0006ss-R7; Tue, 28 Jun 2022 23:36:50 -0400
Received: by mail-pg1-x52c.google.com with SMTP id 9so14058691pgd.7;
 Tue, 28 Jun 2022 20:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mQ7p58dP8yL7VZt2P5gdrVm9FaK+5XRismhrco1SEZY=;
 b=JAGO6l5OulxoENGAfU9Xfvs8kV1yVXVfRHerk3BGfNrNehuwlx7QJriuxy9ZGgx3ga
 m+4+Y2fH+1O89uPfXrRsrWY7lFrA6wM8s2XbfPi9c+BIPovNwbElC/KnFUC7+dfK1nX3
 oMSDdIDlZHSoh4eBbvXsiyv0VpfwkqQ/EqK9LxA907owk0TJ7T2hBg9wKnyDoc+z3AN8
 5R3aGyzbY6VybGy9VpgZL0k9/ejEmnKPSZJnnFYwSFfXD+Nqf4/wuClLo+6yAn6Qrivq
 o0MA9QSOEwp4KeGTzEeMjCG9vmTtIIpnHeW580mIm1zjrzOGHqVzdiI3t/RAmtyqDwKJ
 6iPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mQ7p58dP8yL7VZt2P5gdrVm9FaK+5XRismhrco1SEZY=;
 b=KfZtuBiRZ4yi47BTYb3pAtonjKB/6JI6Sv7Whda4otKIJry6mCQK5HiOTHmUcmDjYr
 KFRfDS7UCAU6qgxOe2A3iOkSfcJs3yCZgHVHd1upNYpsfSxxCsAtY7GN52ZhdiNUvb7Y
 f0BSfkJmNyuZqP4PvPm8cUcwk0FOGqGGCLsm9ToAjeHgFlbwHy3gZNwWtdxyv6scnqYM
 GiMowf968sh1DgnFszOCOiReyADaCwCJHtpxB6w4Wy25Bpj55gD6zJgJ6AcoNHEoSa9g
 9O5N3q3K3bLMJrrAPKxN4JQtG9hSl7Brn7HT5sR1RxfAxqCKauw5/Vg3rNfRy/yfL/mE
 Ywmw==
X-Gm-Message-State: AJIora/cnZ46Dw6l+vhqZCD/O8LcELaaEnwGvGLqr1jX/dMlo+sjKB8j
 IlZ7f/An/k+ezN+uYQrTCC0=
X-Received: by 2002:a63:6d0d:0:b0:40c:f2dc:222f with SMTP id
 i13-20020a636d0d000000b0040cf2dc222fmr1170668pgc.414.1656473807171; 
 Tue, 28 Jun 2022 20:36:47 -0700 (PDT)
Received: from localhost (fwdproxy-prn-006.fbsv.net.
 [2a03:2880:ff:6::face:b00c]) by smtp.gmail.com with ESMTPSA id
 c13-20020a170902c1cd00b0016a276aada7sm10136635plc.20.2022.06.28.20.36.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 20:36:46 -0700 (PDT)
From: Peter Delevoryas <peterdelevoryas@gmail.com>
X-Google-Original-From: Peter Delevoryas <pdel@fb.com>
To: 
Cc: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 cminyard@mvista.com, titusr@google.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, zhdaniel@fb.com, pdel@fb.com
Subject: [PATCH v2 13/13] hw/arm/aspeed: Add oby35-cl machine
Date: Tue, 28 Jun 2022 20:36:34 -0700
Message-Id: <20220629033634.3850922-14-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220629033634.3850922-1-pdel@fb.com>
References: <20220629033634.3850922-1-pdel@fb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=peterdelevoryas@gmail.com; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
X-TUID: k4rz29MUzFav

The fby35 machine includes 4 server boards, each of which has a "bridge
interconnect" (BIC). This chip abstracts the pinout for the server board
into a single endpoint that the baseboard management controller (BMC)
can talk to using IPMB.

The codename for this board is oby35-cl, which means "OpenBIC
Yosemite3.5 CraterLake". There is also a variant of the BIC called
"OpenBIC Yosemite3.5 Baseboard", which is an image built to run from the
baseboard as a replacement for the BMC, that's not included here, but
that's why the "-cl" suffix is included.

A test image can be built from https://github.com/facebook/openbic using
the instructions in the README.md to build the meta-facebook/yv35-cl
recipe, or retrieved from my Github:

    wget https://github.com/peterdelevoryas/OpenBIC/releases/download/oby35-cl-2022.17.01/Y35BCL.elf

And you can run this machine with the following command:

    qemu-system-arm -machine oby35-cl -nographic -kernel Y35BCL.elf

It should produce output like the following:

    [00:00:00.008,000] <inf> usb_dc_aspeed: select ep[0x81] as IN endpoint
    [00:00:00.009,000] <inf> usb_dc_aspeed: select ep[0x82] as IN endpoint
    [00:00:00.009,000] <wrn> usb_dc_aspeed: pre-selected ep[0x1] as IN endpoint
    [00:00:00.009,000] <wrn> usb_dc_aspeed: pre-selected ep[0x2] as IN endpoint
    [00:00:00.009,000] <inf> usb_dc_aspeed: select ep[0x3] as OUT endpoint
    *** Booting Zephyr OS build v00.01.05  ***
    Hello, welcome to yv35 craterlake 2022.25.1
    BIC class type(class-1), 1ou present status(0), 2ou present status(0), board revision(0x1)
    [init_drive_type] sensor 0x14 post sensor read failed!
    [init_drive_type] sensor 0x30 post sensor read failed!
    [init_drive_type] sensor 0x39 post sensor read failed!
    ipmi_init
    [set_DC_status] gpio number(15) status(0)
    [set_post_status] gpio number(1) status(1)

    uart:~$ [00:00:00.249,000] <inf> kcs_aspeed: KCS3: addr=0xca2, idr=0x2c, odr=0x38, str=0x44

    [00:00:00.255,000] <err> spi_nor_multi_dev: [1216][spi1_cs0]SFDP magic 00000000 invalid
    [00:00:00.255,000] <err> spi_nor_multi_dev: [1456]SFDP read failed: -22
    [00:00:00.249,000] <inf> kcs_aspeed: KCS3: addr=0xca2, idr=0x2c, odr=0x38, str=0x44

    [00:00:00.255,000] <err> spi_nor_multi_dev: [1216][spi1_cs0]SFDP magic 00000000 invalid
    [00:00:00.255,000] <err> spi_nor_multi_dev: [1456]SFDP read failed: -22
    uart:~$ BIC Ready

Signed-off-by: Peter Delevoryas <pdel@fb.com>
---
 hw/arm/aspeed.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index a06f7c1b62..75971ef2ca 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -1429,6 +1429,50 @@ static void aspeed_minibmc_machine_ast1030_evb_class_init(ObjectClass *oc,
     amc->macs_mask = 0;
 }
 
+static void oby35_cl_i2c_init(AspeedMachineState *bmc)
+{
+    AspeedSoCState *soc = &bmc->soc;
+    I2CBus *i2c[14];
+    I2CBus *ssd[8];
+    int i;
+
+    for (i = 0; i < 14; i++) {
+        i2c[i] = aspeed_i2c_get_bus(&soc->i2c, i);
+    }
+    get_pca9548_channels(i2c[1], 0x71, ssd);
+
+    i2c_slave_create_simple(i2c[0], "fby35-sb-cpld", 0x21);
+    i2c_slave_create_simple(i2c[1], "tmp105", 0x48);
+    i2c_slave_create_simple(i2c[1], "tmp105", 0x49);
+    i2c_slave_create_simple(i2c[1], "tmp105", 0x4a);
+    i2c_slave_create_simple(i2c[1], "adm1272", 0x40);
+    i2c_slave_create_simple(i2c[1], "tmp421", 0x4c);
+    i2c_slave_create_simple(i2c[2], "intel-me", 0x16);
+    i2c_slave_create_simple(i2c[4], "isl69259", 0x76);
+    i2c_slave_create_simple(i2c[4], "isl69259", 0x62);
+    i2c_slave_create_simple(i2c[4], "isl69259", 0x60);
+
+    for (int i = 0; i < 8; i++) {
+        i2c_slave_create_simple(ssd[i], "tmp105", 0x6a);
+    }
+
+    /*
+     * FIXME: This should actually be the BMC, but both the ME and the BMC
+     * are IPMB endpoints, and the current ME implementation is generic
+     * enough to respond normally to some things.
+     */
+    i2c_slave_create_simple(i2c[6], "intel-me", 0x10);
+}
+
+static void aspeed_machine_oby35_cl_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
+
+    mc->desc = "Meta Platforms fby35 CraterLake BIC (Cortex-M4)";
+    amc->i2c_init = oby35_cl_i2c_init;
+}
+
 static const TypeInfo aspeed_machine_types[] = {
     {
         .name          = MACHINE_TYPE_NAME("palmetto-bmc"),
@@ -1494,6 +1538,10 @@ static const TypeInfo aspeed_machine_types[] = {
         .name           = MACHINE_TYPE_NAME("ast1030-evb"),
         .parent         = TYPE_ASPEED_MACHINE,
         .class_init     = aspeed_minibmc_machine_ast1030_evb_class_init,
+    }, {
+        .name          = MACHINE_TYPE_NAME("oby35-cl"),
+        .parent        = MACHINE_TYPE_NAME("ast1030-evb"),
+        .class_init    = aspeed_machine_oby35_cl_class_init,
     }, {
         .name          = TYPE_ASPEED_MACHINE,
         .parent        = TYPE_MACHINE,
-- 
2.30.2

