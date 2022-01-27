Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp4247024lfk;
        Thu, 27 Jan 2022 09:22:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzjT85mN/FsFzr9cm67Z8aUKGPNLSICpRDYRJM5oVdBmWh9EWg9QMYZg0y5qNslP/6ospfD
X-Received: by 2002:a02:69c6:: with SMTP id e189mr2284675jac.137.1643304140283;
        Thu, 27 Jan 2022 09:22:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643304140; cv=none;
        d=google.com; s=arc-20160816;
        b=YUbbGRw3CciuEzG/L2OEDV1rrI0iD3YvW+4GGGNLd750w/+usILoFf5Fl5I8jplvnz
         B2KK9UchGGputu9/5r6BdZN3QqsBHj+sSJigAq+e8MsypNF3D19p5pp0lZAlIH68DQL4
         tmv5OjIqz04Y33j4WF3Sdf4a0PI3j6iuxfT4+NamJlA3LjiGQ7PFOvVsSFRFbzzEUUZX
         XBa6T/42rK7lndh+P/hXbBretOnCJeX6X9Vdx+sveN4UDUaDfIGkwIPMEqyHUATaqCpi
         JkNeBAtV467kHUlrJDnlzVGityTNZC09z/SpwzKGIKuhE8RLrKiU30JsH8+zPBObPYeq
         adAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=GFkNt2ByvuaZ+sNn2Dl4tejBkKkrraxOjreg3A2I/28=;
        b=hsiuXxZ2Sc89n4cMlzFtiQKfTsmFO+rQZH91oT50EpFhLpJQ3KFAdXRIbLcEz0TGoH
         4KUiseNHLxo6FQD2rZBz+kqsXXoQUycAPgf6chq3P+5HKH/0gdJI9YsMFsSOn9Dp8MBA
         C/fycJZlhduMIrAJ9SQFyckxwAUEEwIslgG6hvZ0dojYLo6ka2dUHH4qox7/Crlk3o3d
         cpjX0LuhK5F7eyXQIzh+ilKCvDuTYbzMIhcZItN0nebl6NlYOYaZOXoCQyFo9wBS2w0w
         u6HZtJ8uXTLQW9XPjaPIaPFz6akbxJTDoCtgludMHkTq1j7WeXBEP1mIVInQT4SMIrKV
         B7Lw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VJyYlQLk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t4si2091203iom.88.2022.01.27.09.22.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Jan 2022 09:22:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VJyYlQLk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nD8TT-0003Hy-LW
	for alex.bennee@linaro.org; Thu, 27 Jan 2022 12:22:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nD6zN-0006f4-O9
 for qemu-arm@nongnu.org; Thu, 27 Jan 2022 10:47:09 -0500
Received: from [2a00:1450:4864:20::42b] (port=35483
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nD6zG-0008O3-46
 for qemu-arm@nongnu.org; Thu, 27 Jan 2022 10:47:03 -0500
Received: by mail-wr1-x42b.google.com with SMTP id e2so5605236wra.2
 for <qemu-arm@nongnu.org>; Thu, 27 Jan 2022 07:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GFkNt2ByvuaZ+sNn2Dl4tejBkKkrraxOjreg3A2I/28=;
 b=VJyYlQLkRJR3hiFtNhNE9Sqa5UhLsbl7Sg+cQfZyDL2jpHbGRMsuSQXEtf9TzYfr/C
 kBLsbUWb5+rD/eOW2FpatYn6dGPSmUC4MGM7mnVVTrbuExGMmCA9sK9c1CnWObYKQ2YY
 3Bsy1DADB6gVpv2R2jrbCsqb1bld8Z7iwXrxtAVl3NT5Ut2etYoDf8IL5iFsqBxpTO4Q
 PxHqPZ6aw77ho1tq5BKR8Ez9tox8uD9DXmTpMcUPisUjknkWhhhAccL+3/39c2gEJPzV
 uacMEaly61oRC4FZdJ+uyqKc5gJO+dtXV5V7ukYVkcxDkDbBGupKXqE0j65V3cDSH4xn
 D/Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GFkNt2ByvuaZ+sNn2Dl4tejBkKkrraxOjreg3A2I/28=;
 b=2Z2wOQCNY/FDvyOeQ8s5FDTXdkXQ4uC+fvLEx/VH7JkJPBmhU4v1t12VvXxuydGXs8
 o7eLITRzs8uVsVooymKPg8KtSOhgRjc179zdYS7N6+Yn7X0D8FfcyX8lWxKuJpphpxce
 s1AVKQWGHnPs1Izb8utixRw85Du75TBy1NMwVNk+45KoO36aHOBCOxvoxn4NlFFbZHj1
 EgYjE3/MnrJdq7Ekzqo6+3XJZ8IW2g2ecrjoUKphOrwMQtFmXOZe8i0Qz2ejNd8nlAl4
 LTaTyKQpeF0FxUFl+CcFkDmAiBVVVVqy+Ub4EhmSJTvUTXB9/H6GDeU9Y7eXP//Vb0T9
 2bDg==
X-Gm-Message-State: AOAM5337fySJi7gTwoxNCi854zQAYgqnNiijNdk0OJVF+uxD5ia0KQtF
 erSFgd8aPIU8Nq9DMektJ7QLzUY1VBtnSA==
X-Received: by 2002:adf:f981:: with SMTP id f1mr3486934wrr.651.1643298420401; 
 Thu, 27 Jan 2022 07:47:00 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id w9sm6687667wmc.36.2022.01.27.07.46.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 07:46:53 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 08/16] hw/arm/virt: Let boot.c handle PSCI enablement
Date: Thu, 27 Jan 2022 15:46:31 +0000
Message-Id: <20220127154639.2090164-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220127154639.2090164-1-peter.maydell@linaro.org>
References: <20220127154639.2090164-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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
X-TUID: ipNDMUDvxGlu

Instead of setting the CPU psci-conduit and start-powered-off
properties in the virt board code, set the arm_boot_info psci_conduit
field so that the boot.c code can do it.

This will fix a corner case where we were incorrectly enabling PSCI
emulation when booting guest code into EL3 because it was an ELF file
passed to -kernel or to the generic loader.  (EL3 guest code started
via -bios or -pflash was already being run with PSCI emulation
disabled.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 141350bf215..398145a7180 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2088,17 +2088,6 @@ static void machvirt_init(MachineState *machine)
             object_property_set_bool(cpuobj, "has_el2", false, NULL);
         }
 
-        if (vms->psci_conduit != QEMU_PSCI_CONDUIT_DISABLED) {
-            object_property_set_int(cpuobj, "psci-conduit", vms->psci_conduit,
-                                    NULL);
-
-            /* Secondary CPUs start in PSCI powered-down state */
-            if (n > 0) {
-                object_property_set_bool(cpuobj, "start-powered-off", true,
-                                         NULL);
-            }
-        }
-
         if (vmc->kvm_no_adjvtime &&
             object_property_find(cpuobj, "kvm-no-adjvtime")) {
             object_property_set_bool(cpuobj, "kvm-no-adjvtime", true, NULL);
@@ -2246,6 +2235,7 @@ static void machvirt_init(MachineState *machine)
     vms->bootinfo.get_dtb = machvirt_dtb;
     vms->bootinfo.skip_dtb_autoload = true;
     vms->bootinfo.firmware_loaded = firmware_loaded;
+    vms->bootinfo.psci_conduit = vms->psci_conduit;
     arm_load_kernel(ARM_CPU(first_cpu), machine, &vms->bootinfo);
 
     vms->machine_done.notify = virt_machine_done;
-- 
2.25.1

