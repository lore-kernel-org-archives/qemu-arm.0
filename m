Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp1553785lfk;
        Sun, 30 Jan 2022 03:03:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz8ZpuBzDU086hPibcA1YwpCYp9Bk7QmoZntaIR1+osPbdMN32HZjA2C86/Ryg7ZJPS6kDA
X-Received: by 2002:a05:622a:14d4:: with SMTP id u20mr9784836qtx.262.1643540627340;
        Sun, 30 Jan 2022 03:03:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643540627; cv=none;
        d=google.com; s=arc-20160816;
        b=MTQEFo4ZyQ+LBCEEPayk3LeYM7Zpa6IU1g0XDJp3Jpo825IMRgBcy+Kklonkq/wWL6
         xrAzqgglQINfv7m8LY2JVI8h8inO+bkMINJuV+RH+4qaTdF2LRcJWl6rn4+P/hlcEyyo
         Ivd9rQCiVJNHw0t/YaTZxlSXlKDBPZSmOeCrvH8/CWWI/vaXibUh/33G5qLWjVx4bYOg
         VVOcOIcmH8+947vPv6Zfp8Q9TZ8SEze1ew0FaQniFAwUaT92RKCQSvtc7GPfS5FQn3oM
         8Y+Tr3J6SWYiEyzdYTSChphYTtW/bPoTAOVeAZj1ul34C/VDZEJTYya4z6ihrl+hIcXG
         ChFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=x6yLIbYspJVYvRw9HXbfG9AYHgDE7MtZasbLFHtf3z4=;
        b=vsqLkbdr3Gd4EFi2kECDoqdcJm/xopQQ/HgehuNRpA7YP8OIgIj8MTh66Pdnu906Gn
         PruRa4/8mgfxg5mc9v4Xg6BTu5y/V1I4ieAwcW2BFmQJoQP2SBGUv4UZcr0sTWjQnUjn
         ILcgpc1Ycgc/Mg+bpxDpNmBBFIf5D0adg3OkYwYYnuu9xRIBE/8PYrQ+Ok3lZ7my7OAm
         g051m28r8lJJnxOodfYqsZ+I7nYQmdcqpij1FQWUAhkjYxfplYlBjpiF75ca/EuKeTvr
         40mDwE0wRJgUop5nzBkvEeyzT1G7I21GfwZfZFkk4ONYgy/6gOR7IJL3RLbQk5Wlr8/q
         RRMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=JT1q2Qus;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k19si13877774qtx.784.2022.01.30.03.03.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 30 Jan 2022 03:03:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=JT1q2Qus;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nE7zm-0006Yb-Rf
	for alex.bennee@linaro.org; Sun, 30 Jan 2022 06:03:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1nE7zM-0006XU-E2; Sun, 30 Jan 2022 06:03:20 -0500
Received: from [2a00:1450:4864:20::12e] (port=36793
 helo=mail-lf1-x12e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1nE7zK-0008MZ-8g; Sun, 30 Jan 2022 06:03:19 -0500
Received: by mail-lf1-x12e.google.com with SMTP id z4so20976922lft.3;
 Sun, 30 Jan 2022 03:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x6yLIbYspJVYvRw9HXbfG9AYHgDE7MtZasbLFHtf3z4=;
 b=JT1q2QusY4OxtlPlg/hJKFVVnK/cZnCWfZM1zM70ODAgBW9Smg+loZWJBYsv9MtsIJ
 763q5I6RkisZjfYdusq5CZiP15uiImmk4qnm4A6sBHWjcZEZg6ofelFX1/r7a+E9jE36
 MYiMHi8hPiCFl1osh2xV/aROy8hORSTF76OZKuuQJUyv/9ty72WWRsHJNmXpmVS70cS0
 yWnOG6Wr7qorU1o7dVJfZk4Kfou4JsGJEpPmvdCm1q4YqcUQUNQpM9no1tML+3T43yJE
 EpN4YqiSNI3EKwYCQ3DHG5cC9j/lRvDsA1dSm0D8sctb4HNdMRyKp0yOEBpw95oZ9son
 nwDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x6yLIbYspJVYvRw9HXbfG9AYHgDE7MtZasbLFHtf3z4=;
 b=No7WeGmEoBXLq/aQ3b86aUKsUD4dy3xntCV1tKnZEP4yP5hmFcidmXDwOmVq7e4Ogp
 lLHihn7oKDyj0Po99NNlh08ivPXpCn+AsHlhOW/tp+7doNWLrCreLMkejYwF/IbQ0MM7
 p8ClzyTR3yd46FTmpsONI8NREmAUQExPj+v1oBr53ALOgGm3C7HYvPl8iREOWH9GW6yD
 l6QDLG8sYZAUL9F7n5ag/k7CLpD/uUCr6VWzpSGGbqAOb0JlqdUU1lt/aFef9FgmiuR3
 B9De9TCMDlPS9BjALHcKRAwVb2lX8EiQ206lyVv9aC8t4KJI6cwF4GKpgwo/ABeTKJF+
 vLog==
X-Gm-Message-State: AOAM533JOWrbGu8ul758TYZD502/1qC/ipVIB7D7oiJOZps1MP64pdRH
 XPWCLTHT5hAcPvURS0244cfc2ql+QmBp4g==
X-Received: by 2002:a05:6512:3b26:: with SMTP id
 f38mr6005958lfv.643.1643540595619; 
 Sun, 30 Jan 2022 03:03:15 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id f22sm3232271lfj.261.2022.01.30.03.03.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jan 2022 03:03:15 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 1/1] hw/arm: versal-virt: Always call arm_load_kernel()
Date: Sun, 30 Jan 2022 12:03:13 +0100
Message-Id: <20220130110313.4045351-2-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220130110313.4045351-1-edgar.iglesias@gmail.com>
References: <20220130110313.4045351-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x12e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
 luc@lmichel.fr, sai.pavan.boddu@xilinx.com, frasse.iglesias@gmail.com,
 alistair@alistair23.me, richard.henderson@linaro.org,
 francisco.iglesias@xilinx.com, frederic.konrad@adacore.com,
 qemu-arm@nongnu.org, philmd@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IDtS6zWqlLy+

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Always call arm_load_kernel() regardless of kernel_filename being
set. This is needed because arm_load_kernel() sets up reset for
the CPUs.

Fixes: 6f16da53ff (hw/arm: versal: Add a virtual Xilinx Versal board)
Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/arm/xlnx-versal-virt.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
index ef3231cdbb..7c7baff8b7 100644
--- a/hw/arm/xlnx-versal-virt.c
+++ b/hw/arm/xlnx-versal-virt.c
@@ -681,20 +681,13 @@ static void versal_virt_init(MachineState *machine)
     s->binfo.get_dtb = versal_virt_get_dtb;
     s->binfo.modify_dtb = versal_virt_modify_dtb;
     s->binfo.psci_conduit = psci_conduit;
-    if (machine->kernel_filename) {
-        arm_load_kernel(&s->soc.fpd.apu.cpu[0], machine, &s->binfo);
-    } else {
-        AddressSpace *as = arm_boot_address_space(&s->soc.fpd.apu.cpu[0],
-                                                  &s->binfo);
+    if (!machine->kernel_filename) {
         /* Some boot-loaders (e.g u-boot) don't like blobs at address 0 (NULL).
          * Offset things by 4K.  */
         s->binfo.loader_start = 0x1000;
         s->binfo.dtb_limit = 0x1000000;
-        if (arm_load_dtb(s->binfo.loader_start,
-                         &s->binfo, s->binfo.dtb_limit, as, machine) < 0) {
-            exit(EXIT_FAILURE);
-        }
     }
+    arm_load_kernel(&s->soc.fpd.apu.cpu[0], machine, &s->binfo);
 
     for (i = 0; i < XLNX_VERSAL_NUM_OSPI_FLASH; i++) {
         BusState *spi_bus;
-- 
2.25.1

