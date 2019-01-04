Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp472114wrt;
        Fri, 4 Jan 2019 02:49:49 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4MsSocAmQZe0IEE4BLa6D+NpAPn0fdWFIT0iEYGfbjWajqkGnCFIwltWCXqTe880uhOVVZ
X-Received: by 2002:a37:6902:: with SMTP id e2mr46412610qkc.298.1546598989731;
        Fri, 04 Jan 2019 02:49:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546598989; cv=none;
        d=google.com; s=arc-20160816;
        b=u5oyzRMcA4giNBWfQCV03GNO5JIlkgmeOFi9UZ/sm7R6nTPKyRy2p744N/34B3jwnB
         PWAcrmLja2FzjNcYxfPeYd/3CByYRqZN1AWZVA6K64FnGi+9ANKcBdvN1nZM9eBKrdBs
         5CNFhp4/d1ft6+gRnpBryAPhLdoChYK3MqAfNsND9MXFjWhFocNr+OZKoOSvmr3SFznk
         Js1OuNXH96VgVes7atB31aBWMBaBtjUJ0vEx5jzGCih6oJ1XstVxqCnCcRx8CZDVqn43
         qt7f/vPZgiEvjE8osNPyaWxeFftzRn0DGnkEQzOgmJ9rKlxULcH2ubHwhjm2OnIrIfjX
         9oHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=EepWp/NDzRBMEO2GQZVIcEc4umOS3wkI7i2w4vM6W78=;
        b=xB/IBIXIv3DSkooSr9CXHTljTJf3pNn0p7O90mBETC1mThI6XwhT/Ih2BVBT9ySBLC
         /d4l/dNdyT86nFjKXh3A1tim9K8+A7hTsZj1ERtCSPJ/MQhbHTbzqyHRJy+ImslaZlqi
         B4XrtJ9oow3vLQBZ35IMd8saqEnqOAwPH0EFsikcAeofXCPlAPCi7IAJhxHEfG90C38g
         Nz23gH6+teA59MmOj3Qx1QZ3KnBUaSARxvMXm95m+lJY0B4mAMBwBcdkvMIgGWDBPpWX
         7NZ8UpoAVXZjc5le0Q6A7yCy1NlSN8mKw5xmQbcvMvLy6rV+cCP0bODHB4Tb6vG+9lWR
         6/XQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ZyKeV6UF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id z1si53173qtc.127.2019.01.04.02.49.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 Jan 2019 02:49:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ZyKeV6UF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:34021 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gfN2z-0004s6-Ag
	for alex.bennee@linaro.org; Fri, 04 Jan 2019 05:49:49 -0500
Received: from eggs.gnu.org ([208.118.235.92]:42466)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gfN1A-0003tU-CB
	for qemu-devel@nongnu.org; Fri, 04 Jan 2019 05:47:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gfN18-0000B9-N4
	for qemu-devel@nongnu.org; Fri, 04 Jan 2019 05:47:56 -0500
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:40289)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1gfN18-0000Aq-GS; Fri, 04 Jan 2019 05:47:54 -0500
Received: by mail-lj1-x244.google.com with SMTP id n18-v6so32095919lji.7;
	Fri, 04 Jan 2019 02:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=EepWp/NDzRBMEO2GQZVIcEc4umOS3wkI7i2w4vM6W78=;
	b=ZyKeV6UFa4eX9zC4ecG1qd0tJFJO+7sPI790Ws5y5ogdJHw5YNQJ8+8mRjS1LQbw7L
	gHfKPdW9mg++5QdPPVe+ecl+4sHMgt53+TwHVnzC2LxSn3IYYl/a626kIoVSMLqCvQvA
	3YncntUCE7ADAi2gpktbPZ0wCM4r3Uyxb26UI46fwFhbccCgQpmL0wi82da1KDlMazDT
	65IUJmsigLEmIk8NEgpJDbUHQN3wn9F3G6IPyod8deIGxpYdywpYupTsXkQ7Ujj2stmC
	1nGduN1Vil+uae53Hf+vrXqAUtiu/5ckMOYVFVpFxyVHKZ+bJnjx9kvaohBcvYjCcxHn
	RLlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=EepWp/NDzRBMEO2GQZVIcEc4umOS3wkI7i2w4vM6W78=;
	b=CF4TRc1I65UTpZGRvVDyHKtuPgC+gXpfd7jugvGleLtEu/MmINJwJSRQ2eNi8xgx2B
	fq3V8FSCtb/7GhAOTtpR732BN6cnijcOPt1QFm97dW+nMs/gLsc1sUIx0mh1k4G+i7zz
	X5D0GI7bfrrM1s8LhiJlUL3DMpzchaqsspCc7PnkpWk0ccHUmfFiXSOVx23S/UI/AfHl
	kDm9QOrvO0kQo/UgIldlgRwl+m43AZ4Q2+vMi24ACD/bynDCDunCJW3UvIeEuu4osKIm
	Ti9bm8uNgYgisl2Z1uRPUpCVWyO4qyYy4OUE+5FA1KwmYy5vtP4UJxYxqiqw6fDWgWpw
	mQMA==
X-Gm-Message-State: AA+aEWbmaZ8yOrRU7np2R8yOKsbYVgROZSShEK3MJpoggYn+hsGX3kud
	i+y9QqAM0FLqwrW4NddpNu6A9S/1Zas=
X-Received: by 2002:a2e:9655:: with SMTP id
	z21-v6mr31631399ljh.136.1546598872903; 
	Fri, 04 Jan 2019 02:47:52 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
	by smtp.gmail.com with ESMTPSA id
	t18sm11002520lft.93.2019.01.04.02.47.51
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 04 Jan 2019 02:47:52 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Fri,  4 Jan 2019 11:47:49 +0100
Message-Id: <20190104104749.5314-2-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190104104749.5314-1-edgar.iglesias@gmail.com>
References: <20190104104749.5314-1-edgar.iglesias@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::244
Subject: [Qemu-devel] [PATCH v1 1/1] hw/arm: versal: Plug memory leaks
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
	edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
	frasse.iglesias@gmail.com, alistair@alistair23.me,
	frederic.konrad@adacore.com, philmd@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cNGxRLx5OmsZ

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Plug a couple of "board creation time" memory leaks.

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/arm/xlnx-versal-virt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
index c6feeac532..f95fde2309 100644
--- a/hw/arm/xlnx-versal-virt.c
+++ b/hw/arm/xlnx-versal-virt.c
@@ -130,6 +130,7 @@ static void fdt_add_gic_nodes(VersalVirt *s)
                                  2, MM_GIC_APU_REDIST_0_SIZE);
     qemu_fdt_setprop_cell(s->fdt, nodename, "#interrupt-cells", 3);
     qemu_fdt_setprop_string(s->fdt, nodename, "compatible", "arm,gic-v3");
+    g_free(nodename);
 }
 
 static void fdt_add_timer_nodes(VersalVirt *s)
@@ -364,6 +365,7 @@ static void create_virtio_regions(VersalVirt *s)
         sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic_irq);
         mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0);
         memory_region_add_subregion(&s->soc.mr_ps, base, mr);
+        g_free(name);
     }
 
     for (i = 0; i < NUM_VIRTIO_TRANSPORT; i++) {
-- 
2.17.1

