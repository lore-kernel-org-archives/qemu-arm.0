Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp4212251lfk;
        Thu, 27 Jan 2022 08:28:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJygAb4ROQtJ3lxZXvvXHXbTCPYmsAIvcNe4+1ymuz5atr9ixJWmNA+Q7MbgQCPi6f1X7h/s
X-Received: by 2002:a05:6e02:164c:: with SMTP id v12mr2951359ilu.306.1643300924736;
        Thu, 27 Jan 2022 08:28:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643300924; cv=none;
        d=google.com; s=arc-20160816;
        b=Eng+DazWtZ32Bk3VjMgeXGtam4eIEUVFd8lzVvGS+oj1EjOTL0vBlblRrNJGV/PKwg
         KKTtMHrdjme0mRA1pZWEEAAjeMv0+ABnB8u5DppQQImp8AfJZdupXLgX/9DMV4KkWJaG
         0H6wT7L050sOSHstccPOCTcuQNukwml9eUeQf5IVIxuXcT/gFHO8y75LNT82hw6tjlMd
         y4uAWrCqW4LlCAPMuPb3Nl1+BS7IYftliw9M517w7hKV0qoK/KLP0XoLI8Jl4ZiPO+jK
         /RSvMDtL+aSPMRknuWHOZ39rNHKmyZ+2vLtipaGs2UeR/acjhINesGxZztGMLS/kHzcE
         g+5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=D6RWfoE5VlE7/bSxhmZNiy91yop7RGn51a8FgJXH+HA=;
        b=A2roWsLLw54MODMavndjoVeN2kLQwgEB2Zqc2JTQo/cQJ/9au8fL6FY/REexkMzAdu
         p7IDZZKIEONvvR1l6M5f+v664jxRVZGDnFGYbJR5XlNZHQTpVWSkLl16aN665ASNAEo6
         snaD6VH6YcvfcEHvPi5c9qsUOgyPoJPui/I74jNxoZxHGtliHjw1MtaiZdW/Qqltdmlp
         tdA4zQasqO6ln5HvuezDSl7VXodlRdX3/j6pHBMqZE9W8M9xbCq/VQ62WCJJJT+9iJOs
         L+CYEoxgJMXrYBUXREIa/N9wJ+wnoKCgDwBua5HXOKiaJzbhSbYi5YthfgEyb2Csxm5C
         HKeg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=U5Whb9jA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a5si2060759ilc.50.2022.01.27.08.28.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Jan 2022 08:28:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=U5Whb9jA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nD7db-0000jT-Mk
	for alex.bennee@linaro.org; Thu, 27 Jan 2022 11:28:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nD6zR-0006ic-IS
 for qemu-arm@nongnu.org; Thu, 27 Jan 2022 10:47:13 -0500
Received: from [2a00:1450:4864:20::331] (port=43810
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nD6zI-0008OE-6m
 for qemu-arm@nongnu.org; Thu, 27 Jan 2022 10:47:13 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 r2-20020a1c2b02000000b0034f7b261169so2154674wmr.2
 for <qemu-arm@nongnu.org>; Thu, 27 Jan 2022 07:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D6RWfoE5VlE7/bSxhmZNiy91yop7RGn51a8FgJXH+HA=;
 b=U5Whb9jAbbzMGeoPE6Mc/6dKUyD4wFt6o+4N5inscDPj1V+AwELhc5hpwuGy0dnVGI
 J4HXkFUZW8aOqlHqHQjl1E7mK3sBEegxYVwAtFsjM6o/BZtZynV4b1EldG1HkmxeRdsX
 ZHQHliLIhVliIZkM4dEtJTzs27Qx+u5rN97/NbcyiNvlS+U5ZNY9Wo/VSOm3vz2qs2vo
 qAj9WKyrEf0d694f+bu9LD1RC2qg70juSvnPSlluQEj9RMdZfg4ejT4n/pmHa6PoSgTU
 skd9IclywmGluxkLwNQ/Yvs/1/EUp5JBfjhHU3PU2+SeNMp0yaf2LWUXWGX+8KyhtNcJ
 1emA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D6RWfoE5VlE7/bSxhmZNiy91yop7RGn51a8FgJXH+HA=;
 b=KaNcZKbJCxKl1HRdXMmvyQjvIy9p2A7G1Y1LZfBLa13+1kWP2gX6yuUU81u4EqhiF3
 r7fNXrGLyxGB6He8DGdybhwJPJOFJQ4drGGDn7t/8sxDNSKbLYm0jAFd3UejzOrSHGwG
 FCptBQdL7TbyNMxLsCy3mPPxXFMfqwwT0cL1b0u4KD4PjTpmIcaiBmMZL6Q/V7ptWE9S
 NWAOecm/S47I++tUsSvbWhhYkhGBlEWNJRLfaoKn7Kar+eXaErBYIe13pusMtLXZjE+P
 q34ueG6zygvKZY1JpyMWM+eHlK6WNvSWE9cECY3V0pw2Y/eMkOiv5avh82wYeEw8ty4I
 zhPg==
X-Gm-Message-State: AOAM532Tz+oyHhTuWlF/8CwkiKU2BLsOS5IpbDPkE9M0jSUa7v1Jjqnk
 qoGR08AL6jSQ6WfI2HTuYs65glc6KknIjw==
X-Received: by 2002:a05:600c:3d06:: with SMTP id
 bh6mr12232366wmb.87.1643298421833; 
 Thu, 27 Jan 2022 07:47:01 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id w9sm6687667wmc.36.2022.01.27.07.47.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 07:47:01 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 09/16] hw/arm: highbank: For EL3 guests, don't enable PSCI,
 start all cores
Date: Thu, 27 Jan 2022 15:46:32 +0000
Message-Id: <20220127154639.2090164-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220127154639.2090164-1-peter.maydell@linaro.org>
References: <20220127154639.2090164-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Rob Herring <robh@kernel.org>,
 Andrew Jeffery <andrew@aj.id.au>, Andre Przywara <andre.przywara@arm.com>,
 Tyrone Ting <kfting@nuvoton.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Yanan Wang <wangyanan55@huawei.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, Alexander Graf <agraf@csgraf.de>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: R3YfRgeNIbyZ

Change the highbank/midway boards to use the new boot.c functionality
to allow us to enable psci-conduit only if the guest is being booted
in EL1 or EL2, so that if the user runs guest EL3 firmware code our
PSCI emulation doesn't get in its way.

To do this we stop setting the psci-conduit and start-powered-off
properties on the CPU objects in the board code, and instead set the
psci_conduit field in the arm_boot_info struct to tell the common
boot loader code that we'd like PSCI if the guest is starting at an
EL that it makes sense with (in which case it will set these
properties).

This means that when running guest code at EL3, all the cores
will start execution at once on poweron. This matches the
real hardware behaviour. (A brief description of the hardware
boot process is in the u-boot documentation for these boards:
https://u-boot.readthedocs.io/en/latest/board/highbank/highbank.html#boot-process
 -- in theory one might run the 'a9boot'/'a15boot' secure monitor
code in QEMU, though we probably don't emulate enough for that.)

This affects the highbank and midway boards.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/highbank.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
index 4210894d814..048f8550cb9 100644
--- a/hw/arm/highbank.c
+++ b/hw/arm/highbank.c
@@ -271,12 +271,6 @@ static void calxeda_init(MachineState *machine, enum cxmachines machine_id)
         object_property_set_int(cpuobj, "psci-conduit", QEMU_PSCI_CONDUIT_SMC,
                                 &error_abort);
 
-        if (n) {
-            /* Secondary CPUs start in PSCI powered-down state */
-            object_property_set_bool(cpuobj, "start-powered-off", true,
-                                     &error_abort);
-        }
-
         if (object_property_find(cpuobj, "reset-cbar")) {
             object_property_set_int(cpuobj, "reset-cbar", MPCORE_PERIPHBASE,
                                     &error_abort);
@@ -397,6 +391,7 @@ static void calxeda_init(MachineState *machine, enum cxmachines machine_id)
     highbank_binfo.board_setup_addr = BOARD_SETUP_ADDR;
     highbank_binfo.write_board_setup = hb_write_board_setup;
     highbank_binfo.secure_board_setup = true;
+    highbank_binfo.psci_conduit = QEMU_PSCI_CONDUIT_SMC;
 
     arm_load_kernel(ARM_CPU(first_cpu), machine, &highbank_binfo);
 }
-- 
2.25.1

