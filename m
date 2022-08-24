Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp2216716ejc;
        Wed, 24 Aug 2022 08:52:48 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7z872PaQEYsl0yahXnqrH5LUNWnWoMCXT0t7JiaY/7qBR122CN07mw0Sr7kV1C4E7M9Pnj
X-Received: by 2002:a05:620a:1a93:b0:6bb:59f3:460f with SMTP id bl19-20020a05620a1a9300b006bb59f3460fmr19533659qkb.349.1661356368274;
        Wed, 24 Aug 2022 08:52:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661356368; cv=none;
        d=google.com; s=arc-20160816;
        b=njY7TWdcs6p/ST/wCB7hEgHGRg6A1p/Ul/L13aR6xhaUWAlk+3yp31+TLs/a4bZ6wo
         judKmvPdcb+6YT2BoG+xDN46hzTydjaBf3KE3luy8g3sqMKEWeljheH1kq6f6rcevB36
         PQAWlxSSkV0O0QW+rKXDsPPVjeSqOxFCwOBMALapqSLqr8BlhxtH5xPovmJJ7fRNfkc3
         PdCrtE2k4tslOnQurUlFSzOhDHhklrBWXJb4OjmFgxd3ev+hhC04nK07JAiiBC4jUkxL
         h8HMSZElWLpHM94wL0aBAmbOD8M9LbjAje5yk6TjRnCF2HIT6AV2LXMGzxt/r1VyhldV
         2dlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=/BcQ7dSBdHiwkCbitP1xng11btp+1w28KnhMykfx8qg=;
        b=xo5julmXHx9Ph7X7pqQdowNeT2r2xTcK4Kw7ZQL7ftn5eSmTXAROj3ozfzXC0A5MfZ
         77u3xYbfKuf+EBBCyDA1RPy99XtONn5BhdIlglxMsI4ANl1mfSHnNSwrNAtOYAXOfSHP
         JOBxS3b+h+dEB++dczQ0x7dHlyRtYw73mJrqVQzqQNsMvVNoBsGxKqHXEnVuEUlo1Z65
         J0pGULdd8P6FXDzmlQjt5jPQF4ggtmuTxqa0lA0tNKDnKBHxt8hwL0N9iKpR37EC8TY4
         OADz8Z7czJ1GVY0IToNtADonAQVahzvagJh2yXw+x0VA65b1AN9WT+b203jnqKGJHqAv
         bTPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D5OzUPpE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z21-20020ac875d5000000b0034355646293si7795729qtq.368.2022.08.24.08.52.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Aug 2022 08:52:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D5OzUPpE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oQsgR-00032a-PF
	for alex.bennee@linaro.org; Wed, 24 Aug 2022 11:52:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1oQsf8-00029T-B0
 for qemu-arm@nongnu.org; Wed, 24 Aug 2022 11:51:27 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:34711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1oQsf3-0002Eu-PF
 for qemu-arm@nongnu.org; Wed, 24 Aug 2022 11:51:24 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 z14-20020a7bc7ce000000b003a5db0388a8so2032402wmk.1
 for <qemu-arm@nongnu.org>; Wed, 24 Aug 2022 08:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=/BcQ7dSBdHiwkCbitP1xng11btp+1w28KnhMykfx8qg=;
 b=D5OzUPpE6+MWQr8XOufZwnuPbRmcnUTudV/M7oni2t1R4Kd60J5fxAyaZZMTJ1mDP5
 55/V9NhLpID4vp/fPtuNd+W83eS1fklEorZ+NMzrCHv8OoMiD295nX6zOcteqtDbp9Fo
 P3MHeJwU6XVrGAhLUTwbPrvQlj3IKnwar9yQDnnqUnQtdatT9fRP4QFRaicTw6qoibMl
 iu/NRKP+UjWPWjczcBPSar64So4BpwihfQg3ZIstiETIDrX1VNJYdBZiS6X5d7I5vryT
 Lf3TGCIhaF6uemCjEl9eOV1s6cL1sq9MqJp4r2Qoq91CVC42+6SphzKkpDYlNypApgV7
 6sTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=/BcQ7dSBdHiwkCbitP1xng11btp+1w28KnhMykfx8qg=;
 b=rhamCDkkftl9ygAwEU4JBRApWwHeZ8asAOp2ZektsyYWKZcamuR1/wQqVX47O5hPUO
 BEPpl7X25uFE39TDQQEuK/5F7VDMQwTy+H8FRCnQl1mucRrt6HuJCPLXWLhd7cPi2qyo
 srGuDmd/fY1AOoTscSYmuRXUcPK5E3uAhCDZQQd4mSnVbF5TXgpVRp0e74kKzsG9H+u0
 GwWuU25mubzbVcqipsD2UY4M4QXxDU4BYBEtOVpjo2wm9CRPM+cc44T7+SKL8RPxvZ+E
 q/ntEJcXrbKPDXHFu07txm/vIxfMxS6mdvp5dvte7lAu1CpwE6h8n/YD4v7RGglNSt6/
 F3YA==
X-Gm-Message-State: ACgBeo1TxS9iO8GBFqHmVenah93LD/o5qrOeLKZCP4Cz/tD6lB+TLqGw
 ZSeLE24UWhVd5YOg+2P9tunrlQ==
X-Received: by 2002:a05:600c:1551:b0:3a6:2f4d:aeca with SMTP id
 f17-20020a05600c155100b003a62f4daecamr5549190wmg.100.1661356280200; 
 Wed, 24 Aug 2022 08:51:20 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id
 q11-20020a5d61cb000000b00223b8168b15sm17236411wrv.66.2022.08.24.08.51.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 08:51:19 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org,
 eauger@redhat.com, Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH 03/10] hw/arm/virt: Fix devicetree warnings about the GIC node
Date: Wed, 24 Aug 2022 16:51:07 +0100
Message-Id: <20220824155113.286730-4-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220824155113.286730-1-jean-philippe@linaro.org>
References: <20220824155113.286730-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tODoVWOkry1w

Fix three dt-validate warnings about the GIC node due to invalid names
and missing property:

  intc@8000000: $nodename:0: 'intc@8000000' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
  intc@8000000: 'its@8080000' does not match any of the regexes: '^(msi-controller|gic-its|interrupt-controller)@[0-9a-f]+$', '^gic-its@', '^interrupt-controller@[0-9a-f]+$', 'pinctrl-[0-9]+'

  interrupt-controller@8000000: msi-controller@8080000: '#msi-cells' is a required property
  From schema: linux/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/arm/virt.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index abcf2716bc..b6aa311d8c 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -481,12 +481,13 @@ static void fdt_add_its_gic_node(VirtMachineState *vms)
     MachineState *ms = MACHINE(vms);
 
     vms->msi_phandle = qemu_fdt_alloc_phandle(ms->fdt);
-    nodename = g_strdup_printf("/intc/its@%" PRIx64,
+    nodename = g_strdup_printf("/interrupt-controller/msi-controller@%" PRIx64,
                                vms->memmap[VIRT_GIC_ITS].base);
     qemu_fdt_add_subnode(ms->fdt, nodename);
     qemu_fdt_setprop_string(ms->fdt, nodename, "compatible",
                             "arm,gic-v3-its");
     qemu_fdt_setprop(ms->fdt, nodename, "msi-controller", NULL, 0);
+    qemu_fdt_setprop_cell(ms->fdt, nodename, "#msi-cells", 1);
     qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg",
                                  2, vms->memmap[VIRT_GIC_ITS].base,
                                  2, vms->memmap[VIRT_GIC_ITS].size);
@@ -499,7 +500,7 @@ static void fdt_add_v2m_gic_node(VirtMachineState *vms)
     MachineState *ms = MACHINE(vms);
     char *nodename;
 
-    nodename = g_strdup_printf("/intc/v2m@%" PRIx64,
+    nodename = g_strdup_printf("/interrupt-controller/v2m@%" PRIx64,
                                vms->memmap[VIRT_GIC_V2M].base);
     vms->msi_phandle = qemu_fdt_alloc_phandle(ms->fdt);
     qemu_fdt_add_subnode(ms->fdt, nodename);
@@ -521,7 +522,7 @@ static void fdt_add_gic_node(VirtMachineState *vms)
     vms->gic_phandle = qemu_fdt_alloc_phandle(ms->fdt);
     qemu_fdt_setprop_cell(ms->fdt, "/", "interrupt-parent", vms->gic_phandle);
 
-    nodename = g_strdup_printf("/intc@%" PRIx64,
+    nodename = g_strdup_printf("/interrupt-controller@%" PRIx64,
                                vms->memmap[VIRT_GIC_DIST].base);
     qemu_fdt_add_subnode(ms->fdt, nodename);
     qemu_fdt_setprop_cell(ms->fdt, nodename, "#interrupt-cells", 3);
@@ -1651,7 +1652,7 @@ void virt_machine_done(Notifier *notifier, void *data)
      * while qemu takes charge of the qom stuff.
      */
     if (info->dtb_filename == NULL) {
-        platform_bus_add_all_fdt_nodes(ms->fdt, "/intc",
+        platform_bus_add_all_fdt_nodes(ms->fdt, "/interrupt-controller",
                                        vms->memmap[VIRT_PLATFORM_BUS].base,
                                        vms->memmap[VIRT_PLATFORM_BUS].size,
                                        vms->irqmap[VIRT_PLATFORM_BUS]);
-- 
2.37.1

