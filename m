Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp4226874lfk;
        Thu, 27 Jan 2022 08:53:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwoIr1Z7tbo3FKff93Xg6byHcm2GeGI7dePVu6ouCjbr/82W+tEpvhQzWuDUUZYQhPh0Ypq
X-Received: by 2002:a05:6e02:1c8f:: with SMTP id w15mr3026809ill.69.1643302383470;
        Thu, 27 Jan 2022 08:53:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643302383; cv=none;
        d=google.com; s=arc-20160816;
        b=gFwa0SLu7PDP3wdvwoXXnnqO9fyU66Oygp8LhoU17ExgT8ONXFQFCr2qKWM3r3KQhA
         nETrL9sbwvdy1BuSCEAlfUspd4QKHP/h+RHqCcz7eNOpD+pxiqcANWQALxlRhYWEKNDD
         fCrqyBvrNKQ2pBJ/MwpNF/sX3GaG+Ic0gv1CpYbVwomlEzvkD5mdVjZqVlBVJ+PmSCPO
         +3ok8YyNdXOg6esFxz1vbGjVharJAfZG+/HmvBgez6yAHSi6ir7pzpgNfS1zHcy9+Rvg
         G6Ec9XJ+oDZZXRkYnEeBF4rr8yXJDi+vRSCWEc2Ne9a+RNekltaSVH1x40ZGsrEm6klN
         23Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=T+1ej9mTsCTQvcQ+nmnN96HZqUCNnh9Zhy+mdjh86Jk=;
        b=Bfax9SkQaaq6oTEQeV7tZShnxlvDiWIPE+fWIi0N0Ya2EKI4n9bvvNURsLCW3/Ft+u
         tMWUFACl2fYw51wtokOjlkquFmkXk4o5hjxPPk8RZWWGx4LHC8ZS9EyL/ApuoMBn2+EM
         TnFVLbeFeGKBaVtNlzBQAMtipo008p18bqHKTdWHXhBK/FfUT//F8JP1g0IDCccJu19r
         4POkTmcOcURZbN+/a9DoCwo8SlQ4HbFxlIPep7+rnIXF9HUrbMRbUQTYrE0xEAo9Wwnt
         5sJ8O6eHb+HpmuM90bHjNaQegPTc5HxMbUnyhBUHU1lOtWfvDYt1y1JbHrn3WhkQbzjx
         2H9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=THqGeUqq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d9si2376360iow.72.2022.01.27.08.53.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Jan 2022 08:53:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=THqGeUqq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nD818-0000MR-SI
	for alex.bennee@linaro.org; Thu, 27 Jan 2022 11:53:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nD6z7-000630-5R
 for qemu-arm@nongnu.org; Thu, 27 Jan 2022 10:46:53 -0500
Received: from [2a00:1450:4864:20::32f] (port=38788
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nD6z5-0008HH-Be
 for qemu-arm@nongnu.org; Thu, 27 Jan 2022 10:46:52 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 o30-20020a05600c511e00b0034f4c3186f4so6210951wms.3
 for <qemu-arm@nongnu.org>; Thu, 27 Jan 2022 07:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T+1ej9mTsCTQvcQ+nmnN96HZqUCNnh9Zhy+mdjh86Jk=;
 b=THqGeUqq2zdo2r3+m43mKWhjXoiFyvNSWIM0eo3szXW5dt6lug3y5Dx8CjH8/i87xH
 wP2vd6wKRq1dPUAPILT6LWFjni3OMnV3Nk7oHY7I2LcEv5eMZkCiFbcGZeJbhAsu6Jl5
 OUBrYJRKzmN2IrLba01we7hxr1Dh31u2haIhGHGkS1dFuZHakfaNtP3EyEzOZhMsJyaO
 emfa46nudIX/Cgx2nKX1hiAhdhGr6DHEV7Dcr9iXla9S+Be2pud7sEA94KcP4H3/sgqv
 nc+yiZzvBVpAjekiWx3KWl0rzmZAyfMc9SHsX0Svq/ODh7bFDetnOMgl3V5hEHKaSjHH
 btTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T+1ej9mTsCTQvcQ+nmnN96HZqUCNnh9Zhy+mdjh86Jk=;
 b=HL3xYMoyhboRhdpmWBlL8VhqvlVzS2NDhiz/cKsnx9GmZFgKguH1kwQlJWSosQZ+fy
 syAiotioHtn3pygyM+8Ib0/KvnDIxBuTmh2Uc5xxU3tjc8Ulrp5Uuz+6liJPFgBA+bVb
 Va3+64AuYcWkwOhn6BgCJ1pGEo/VeL2w7MmgGzDWouiINnDZygAh04jmKR8lOgFclPqs
 zPYYDmf1uLKeyGe60D+FMUq8AxhoWMyEwRFPtTv1wf5JRe5X5WcApG3RoNAPkT02hqVE
 +35tkgkQ9RD5DumF05K+R/C4VcgFVy5b7vCjZMwlE92ttSuh486r7EUGN/YdcUbo0jg1
 VA5A==
X-Gm-Message-State: AOAM5307uXN1WgMwMP8TtCj3fpj4MJf+g0qe/gtv85e6mpNtuWJmuzRq
 QGBdLYMTKSiXyZw6QpRj4sKbtNQubMfzdQ==
X-Received: by 2002:a05:600c:3005:: with SMTP id
 j5mr3697280wmh.35.1643298410046; 
 Thu, 27 Jan 2022 07:46:50 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id w9sm6687667wmc.36.2022.01.27.07.46.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 07:46:49 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 05/16] hw/arm: allwinner: Don't enable PSCI conduit when
 booting guest in EL3
Date: Thu, 27 Jan 2022 15:46:28 +0000
Message-Id: <20220127154639.2090164-6-peter.maydell@linaro.org>
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
X-TUID: HpbCKfbWlr67

Change the allwinner-h3 based board to use the new boot.c
functionality to allow us to enable psci-conduit only if the guest is
being booted in EL1 or EL2, so that if the user runs guest EL3
firmware code our PSCI emulation doesn't get in its way.

To do this we stop setting the psci-conduit property on the CPU
objects in the SoC code, and instead set the psci_conduit field in
the arm_boot_info struct to tell the common boot loader code that
we'd like PSCI if the guest is starting at an EL that it makes sense
with.

This affects the orangepi-pc board.

This commit leaves the secondary CPUs in the powered-down state if
the guest is booting at EL3, which is the same behaviour as before
this commit.  The secondaries can no longer be started by that EL3
code making a PSCI call but can still be started via the CPU
Configuration Module registers (which we model in
hw/misc/allwinner-cpucfg.c).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
If anybody knows for definite that the secondaries should be
powered-down at startup for guest firmware, we can delete the TODO.
The allwinner-cpucfg.c code makes the reset value for the
REG_CPU*_RST_CTRL registers "CPUX_RESET_RELEASED", which might
suggest otherwise, but that could easily just be a QEMU error.
---
 hw/arm/allwinner-h3.c | 9 ++++-----
 hw/arm/orangepi.c     | 1 +
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c
index f9b7ed18711..f54aff6d2d2 100644
--- a/hw/arm/allwinner-h3.c
+++ b/hw/arm/allwinner-h3.c
@@ -235,11 +235,10 @@ static void allwinner_h3_realize(DeviceState *dev, Error **errp)
     /* CPUs */
     for (i = 0; i < AW_H3_NUM_CPUS; i++) {
 
-        /* Provide Power State Coordination Interface */
-        qdev_prop_set_int32(DEVICE(&s->cpus[i]), "psci-conduit",
-                            QEMU_PSCI_CONDUIT_SMC);
-
-        /* Disable secondary CPUs */
+        /*
+         * Disable secondary CPUs. TODO: check whether this is what
+         * guest EL3 firmware would really expect.
+         */
         qdev_prop_set_bit(DEVICE(&s->cpus[i]), "start-powered-off",
                           i > 0);
 
diff --git a/hw/arm/orangepi.c b/hw/arm/orangepi.c
index e7963822367..68fe9182414 100644
--- a/hw/arm/orangepi.c
+++ b/hw/arm/orangepi.c
@@ -105,6 +105,7 @@ static void orangepi_init(MachineState *machine)
     }
     orangepi_binfo.loader_start = h3->memmap[AW_H3_DEV_SDRAM];
     orangepi_binfo.ram_size = machine->ram_size;
+    orangepi_binfo.psci_conduit = QEMU_PSCI_CONDUIT_SMC;
     arm_load_kernel(ARM_CPU(first_cpu), machine, &orangepi_binfo);
 }
 
-- 
2.25.1

