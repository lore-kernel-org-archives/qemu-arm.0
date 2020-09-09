Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp561796lfq;
        Wed, 9 Sep 2020 09:23:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4wRU76viRBni+Mx8DToakgIhV7pY7elCUIk3HeNT1udkyV9IOWr853aJzq+IK2TKU91+b
X-Received: by 2002:ab0:2eb8:: with SMTP id y24mr1238051uay.28.1599668624306;
        Wed, 09 Sep 2020 09:23:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599668624; cv=none;
        d=google.com; s=arc-20160816;
        b=Yu94BF0GRs+5WDgFfXOTPK1goeZOBq5S+vx0ZgW9g0EDCvO//z0lCsvI1x/h2HFnK7
         KM0R8v4Uc6fYyP1b0CdozAszwJPVJeDHf8ip9MB//Kl6eGIRVkEBq1+Kz0q981T7undt
         wgeckq3+s9PhKfXesGPphjwfEfWYiWBvxmKp2thFlSqdRxb1DCqMHcgp5AB8JUY5G3AW
         SWJYt/zfnVPqAXkVhBh/hwF/qQAC+dvZuZVbYpx61485ZdkP8m0fhSjU57tGJvJId9rf
         HJeicXhiqss9B/EZvMdHFGRZnzjMifKAVXytCT+JgbI60YbM9lc5nshKS0pIwCBROKUO
         NiKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=dIh6NerjiH44LwAXPnjVVHbLhSVLBK5aoH6ORepxJpQ=;
        b=mScCLQbcTa6epsOlRlSBJAK2qfTqyfQiB1Df+0s1Lt/i2PGN8nH+W6Rp5ZhJkD6Q9i
         CMD6VUhohfvDq9jWHv2LanNhc+T7OcqdhWsThjRHEL+XoDubzrv0dEYyQGGPGhFNkiHB
         mO6XuUp6eP3b3xK4TYflOhSKkhtCXpbEPPNb2KYdo/c2Skp9aD4bXXIzX/8wHcRoQuQ7
         KLfTBL1yxzoUqq1znozvZ91DihNne1YOr4EbzxdwB4AtDpJgqSvTxy4c8F19BxN9kAes
         yoU8h+5oBaPh9thh8/xQTbwHrykRO00vGxGzu+wjqgrKq4CfTPki1fablNihSq0bRPN9
         BdPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JAlHZAsj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t15si480656vso.220.2020.09.09.09.23.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Sep 2020 09:23:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JAlHZAsj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:34594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kG2sp-0003fl-GR
	for alex.bennee@linaro.org; Wed, 09 Sep 2020 12:23:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1kG2ki-0000ib-Te; Wed, 09 Sep 2020 12:15:20 -0400
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:38427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1kG2kg-0006YY-Pg; Wed, 09 Sep 2020 12:15:20 -0400
Received: by mail-lj1-x243.google.com with SMTP id w3so4314542ljo.5;
 Wed, 09 Sep 2020 09:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dIh6NerjiH44LwAXPnjVVHbLhSVLBK5aoH6ORepxJpQ=;
 b=JAlHZAsjTSLsjU9QXb7HDnZmYC2f3ERI/+Q+8MDJQ/1rICT8dB1/UuQFLDZnKA/8iV
 cbVQc41ySLGBzv69Z2MHj4vKzoo5Ssx7YjPWl9VqQXvX3S69Y7dgUUvuG57w5XJ4hJnP
 AS/z/sUVSsqePBP76Wr6JXpsc3aTEX20ztdVYQiSFdDzoEiht6KrN4uQ7xzzaV7mHdIO
 AzULheaoCgjbnVVGtbbZdStf/vuUA/tvYuvD4DFexc64rqNTO4dzqpJLfYOR2qcIGx8h
 O5B6GkPzEf+cOaLKwWTvcRRj4rTeTXceAIZO0IW6xqo5b3htLT2fXUwPcSlwDe9QGEST
 KCCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dIh6NerjiH44LwAXPnjVVHbLhSVLBK5aoH6ORepxJpQ=;
 b=rE6omSaa9KRtMGRhIpHyoLdP/FeLfH0s9+4W8nbtnQLNN8i8+7DihuZYhOmC5wUGM9
 znUd2DFQlJ9M4gNppN7hm62u+wp/3JUR6URDN9VvpvtFc560tVRCHGMsM3A3PNs+axi+
 dmX2RGFj8FE0TQ07RGMYygSes1nQFz3HKR8tfhWAoZOcUSz0gzxauAHEHw59B5r5dSxN
 XV2Mp/qR5YCAwDeGYdie4Xq0FnPZzHuXQe8GCUOBqr4WfHEG0vffTsxgWFKcHZEXLCfy
 fERwlr161lHgLr5dWqhc4TZt0YwI1oXTxlL/amI/5heQXej7nh4l3cGHkEAGTESf2T8O
 /bOQ==
X-Gm-Message-State: AOAM532A2MpWIrEJWrlLGobDD9wKxh4YaKb36nj+H9pmukWWBJ0daJCL
 W/WdRd+5a5u0rdPVMNxmsctzg5uRXhg=
X-Received: by 2002:a2e:814b:: with SMTP id t11mr2467712ljg.367.1599668116736; 
 Wed, 09 Sep 2020 09:15:16 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id w17sm670391lfr.31.2020.09.09.09.15.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 09:15:16 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 1/1] hw/arm: versal-virt: Correct the tx/rx GEM clocks
Date: Wed,  9 Sep 2020 18:15:14 +0200
Message-Id: <20200909161514.622998-2-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200909161514.622998-1-edgar.iglesias@gmail.com>
References: <20200909161514.622998-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::243;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x243.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FSL_HELO_FAKE=1.8, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
 edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me, frederic.konrad@adacore.com,
 qemu-arm@nongnu.org, philmd@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dPX4Dj5N1Pto

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Correct the GEMs tx/rx clocks to use the 125Mhz fixed-clock.
This matches the setup with the fixed-link 100Mbit PHY.
I also avoids the following warnings from the Linux kernel
driver:

eth0: unable to generate target frequency: 125000000 Hz

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/arm/xlnx-versal-virt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
index 4b3152ee77..43d74b850f 100644
--- a/hw/arm/xlnx-versal-virt.c
+++ b/hw/arm/xlnx-versal-virt.c
@@ -212,7 +212,7 @@ static void fdt_add_gem_nodes(VersalVirt *s)
                               s->phandle.ethernet_phy[i]);
         qemu_fdt_setprop_cells(s->fdt, name, "clocks",
                                s->phandle.clk_25Mhz, s->phandle.clk_25Mhz,
-                               s->phandle.clk_25Mhz, s->phandle.clk_25Mhz);
+                               s->phandle.clk_125Mhz, s->phandle.clk_125Mhz);
         qemu_fdt_setprop(s->fdt, name, "clock-names",
                          clocknames, sizeof(clocknames));
         qemu_fdt_setprop_cells(s->fdt, name, "interrupts",
-- 
2.25.1

