Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp4216087lfk;
        Thu, 27 Jan 2022 08:34:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz3b+7XNT7Gb+6XwNTpmAtzBoSrk8025wcuINsm9/UrbJP1TMNiQmsXV+SwikpadOz+5zcS
X-Received: by 2002:ac8:5f12:: with SMTP id x18mr3277149qta.497.1643301280007;
        Thu, 27 Jan 2022 08:34:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643301280; cv=none;
        d=google.com; s=arc-20160816;
        b=tKxwt8+5PFxsyIT2U37DkggVseBte4K9jmuzZpqOhQsA1SpwYC7I5mlv47NPzCZa+v
         z3EuDa0riBBREAKCz/2FZYkntDKW/yneLiTHAVxEe431j8kkwFMnaw4+o+z7c2Dz6KwE
         u7OSeSKhNr0f1RyzzP03EIBztvjQh+V8vIfQgtYREKTa5Jdnr/4nyfMzRnlrdlIRqWAL
         c7BxBLrpg1DNMOaF86fRxPJmKycrbWSQZCd5vLh1plrG+aodZ1mK0263xZ9B9ph20IRe
         DN+/F94P/0JUaGyqSvwHaC+ToGxu5AYg1lWAEWZUvNZfg5suJWdDNlx4wbQ0Hre7c82Z
         0UiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=/vGnghbsyXVm29DGZvmuMVyl3fMFFrfkrrbD0nUxv8g=;
        b=tzqlM032X+6TzFK+8lO2rRX+J2aotzVdPFD7zEfKCbA6I1zUcJJVRGXLcqs+BqtJo0
         oZdLKaZlYNM9K6WxST3fyV+zR0MXpEOdEc91LMG7rqU8UMnONNDLxMAwMf6WC2aNO8mw
         0NFtw/vfEs0J+owrmPtRpkrqKIu3sFZ/n8Dz98R9oJ0ZWNYs+huuQ2Qg5nsXcaawgnZn
         /jBEnA5FnGjDeKLHhf/IyPMxCltqv5rWIAu+653vlSkGvPuC95rNBq86r+WX21LG+5vI
         zLGEw5i1p6SeghG6bwOwedKX1E8/EIRPH7IPq5PwxvOq30JmEBM4OzDEWUDrFVkJ6oEd
         IXhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sJ77hw0u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g12si11343622ybc.719.2022.01.27.08.34.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Jan 2022 08:34:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sJ77hw0u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nD7jL-0007Vi-B8
	for alex.bennee@linaro.org; Thu, 27 Jan 2022 11:34:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nD6zT-0006od-58
 for qemu-arm@nongnu.org; Thu, 27 Jan 2022 10:47:16 -0500
Received: from [2a00:1450:4864:20::32f] (port=50809
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nD6zQ-0008OZ-Qb
 for qemu-arm@nongnu.org; Thu, 27 Jan 2022 10:47:14 -0500
Received: by mail-wm1-x32f.google.com with SMTP id r186so329179wma.0
 for <qemu-arm@nongnu.org>; Thu, 27 Jan 2022 07:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/vGnghbsyXVm29DGZvmuMVyl3fMFFrfkrrbD0nUxv8g=;
 b=sJ77hw0uqGXG62HKRfIt1W8KSQeGUdl0ZyCaKM8Lp9JvPSyAyFjiQqUidH7rtmzOT9
 Exf/WoNx/Bde8t7sKO6aRuBPJ39sD9m2/WnYS+lVgZfz7ampWgq6Tn0umLrUmuzwfHs9
 D+qmggZeVf4qkFNDstJnMjHxysuZaheL8cqP2InzJ2sF5t6e6Jhx5vjLnDFPyRWQ0zeV
 3fZZz7gQpbp5ae42gNekq6iqJEC7U+Gd2qPUR5HcpjvdIKmIIFhmdpSkkWx+3uoGwsqZ
 gY1Vk4jFHzhbfRa7QVIE2F8wmaGKt88po89S8SHS4udNEXtlDWUQSxJY06vdDX/SZGOq
 vveg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/vGnghbsyXVm29DGZvmuMVyl3fMFFrfkrrbD0nUxv8g=;
 b=msKK7Vtpf/og2V8pLK4MwjWz+P3eCjLwYhY4pNdoytWEca7j4gOtuPxo1ZoKqXHMJr
 zjE04OoYURsLnCbKJzzyy+YZo0Q8XWfqcLQYiJ9ccNTucTcaIU8fUj853COF75a5koL0
 f0EPpIjznAtnZWp3X8W0//nLAEB1B0PWcioEouyBnxL+Onx1XTqTTel8rlTj0aAKmCFv
 a/Yv3Q9NrOsLlMQVqhsbARCW5/U2NA7zEE0cZ2FyQiAEV8o6klTpeSUCJWAyEW8rVilG
 bkd22bRmGQrzsVcGAp6y9W1bk/7t6Jxvt/l/8FBWfCFZTb+8aWHoOcWG6PmZFPd0z/Nf
 CF+Q==
X-Gm-Message-State: AOAM5332hh4itlD3QimgMQYxtaJXkxiTT8HPaLff8OriVkc5QfXD9WAc
 Pw+rrLRG05fjqnTp4xX2rxazFbK8v857TQ==
X-Received: by 2002:a7b:cb54:: with SMTP id v20mr12176591wmj.2.1643298424687; 
 Thu, 27 Jan 2022 07:47:04 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id w9sm6687667wmc.36.2022.01.27.07.47.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 07:47:04 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 11/16] hw/arm/highbank: Drop use of secure_board_setup
Date: Thu, 27 Jan 2022 15:46:34 +0000
Message-Id: <20220127154639.2090164-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220127154639.2090164-1-peter.maydell@linaro.org>
References: <20220127154639.2090164-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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
X-TUID: S4VO3J9NrsgN

Guest code on highbank may make non-PSCI SMC calls in order to
enable/disable the L2x0 cache controller (see the Linux kernel's
arch/arm/mach-highbank/highbank.c highbank_l2c310_write_sec()
function).  The ABI for this is documented in kernel commit
8e56130dcb as being borrowed from the OMAP44xx ROM.  The OMAP44xx TRM
documents this function ID as having no return value and potentially
trashing all guest registers except SP and PC. For QEMU's purposes
(where our L2x0 model is a stub and enabling or disabling it doesn't
affect the guest behaviour) a simple "do nothing" SMC is fine.

We currently implement this NOP behaviour using a little bit of
Secure code we run before jumping to the guest kernel, which is
written by arm_write_secure_board_setup_dummy_smc().  The code sets
up a set of Secure vectors where the SMC entry point returns without
doing anything.

Now that the PSCI SMC emulation handles all SMC calls (setting r0 to
an error code if the input r0 function identifier is not recognized),
we can use that default behaviour as sufficient for the highbank
cache controller call.  (Because the guest code assumes r0 has no
interesting value on exit it doesn't matter that we set it to the
error code).  We can therefore delete the highbank board code that
sets secure_board_setup to true and writes the secure-code bootstub.

(Note that because the OMAP44xx ABI puts function-identifiers in
r12 and PSCI uses r0, we only avoid a clash because Linux's code
happens to put the function-identifier in both registers. But this
is true also when the kernel is running on real firmware that
implements both ABIs as far as I can see.)

This change fixes in passing booting on the 'midway' board model,
which has been completely broken since we added support for Hyp
mode to the Cortex-A15 CPU. When we did that boot.c was made to
start running the guest code in Hyp mode; this includes the
board_setup hook, which instantly UNDEFs because the NSACR is
not accessible from Hyp. (Put another way, we never made the
secure_board_setup hook support cope with Hyp mode.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/highbank.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
index 048f8550cb9..a21afd178d1 100644
--- a/hw/arm/highbank.c
+++ b/hw/arm/highbank.c
@@ -48,12 +48,6 @@
 
 /* Board init.  */
 
-static void hb_write_board_setup(ARMCPU *cpu,
-                                 const struct arm_boot_info *info)
-{
-    arm_write_secure_board_setup_dummy_smc(cpu, info, MVBAR_ADDR);
-}
-
 static void hb_write_secondary(ARMCPU *cpu, const struct arm_boot_info *info)
 {
     int n;
@@ -389,8 +383,6 @@ static void calxeda_init(MachineState *machine, enum cxmachines machine_id)
     highbank_binfo.write_secondary_boot = hb_write_secondary;
     highbank_binfo.secondary_cpu_reset_hook = hb_reset_secondary;
     highbank_binfo.board_setup_addr = BOARD_SETUP_ADDR;
-    highbank_binfo.write_board_setup = hb_write_board_setup;
-    highbank_binfo.secure_board_setup = true;
     highbank_binfo.psci_conduit = QEMU_PSCI_CONDUIT_SMC;
 
     arm_load_kernel(ARM_CPU(first_cpu), machine, &highbank_binfo);
-- 
2.25.1

