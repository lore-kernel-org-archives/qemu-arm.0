Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FB2DD116F3
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Dec 2025 06:10:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vQg3u-00054k-Kj; Wed, 03 Dec 2025 01:10:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vQg3t-00053U-2C
 for qemu-arm@nongnu.org; Wed, 03 Dec 2025 01:10:01 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vQg3r-0000kb-JR
 for qemu-arm@nongnu.org; Wed, 03 Dec 2025 01:10:00 -0500
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-42e2e167067so1805388f8f.2
 for <qemu-arm@nongnu.org>; Tue, 02 Dec 2025 22:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764742198; x=1765346998; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cHfjTNJ4DNmllXF9FNZFtldAjCRS1zE4NJobhra0HGY=;
 b=l2XigEqQdz92EICntFS7uhYFuWKDekkNXp4+Vm3ukZIMM8Jp2mcLJ9tpZVZ6A6EbGm
 G0bctUVU9OiTZnyPfVw7EP9HzoRaSeJVnYdwLokypPGvYQ7KdJVvM2GkZ2noc3qAkBav
 XEdxuH/L0oFV+ZRAueVzasMUv0R9M/pQI3QuOWgE/QrXHLfdzCWNhDXwDUxixv8ua9mv
 dE2ABc6adSs7O/sMPRhA/Mat7sE+w/ut4kxzqsJXyp8Q07gW5uTvBpXXW5MnWJ/D1acW
 89WN4XFJF0hEfr46GNE7vBVH8LzRFBUaaENlxSahJFMN4Et6cq7Z7OwFWZ9oJQjPSKhI
 t2+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764742198; x=1765346998;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=cHfjTNJ4DNmllXF9FNZFtldAjCRS1zE4NJobhra0HGY=;
 b=Kzub9flf0C682VLGPUhNTIw/inrjfIRRFC0lBHhtgNFY55i6vII+xSrBdmInwR/M04
 1JhEOvFMHlZqcgrc5rV5vkhinPhYPgGL6DGkHNgnEGHbqYpx6My9M3wArXaTGi91A0vW
 DufRWCxi3ExzpNVJGCtQlhWB6YFNr3w6V/sE68tvqBAnzn0WIBAYfnriOs3/pmNc9hId
 LwxvtBFHYi+2i+YNe+b+AwVa/iGGY7loLs62ZxBTpJvdq0Mnv7VhEN17RWGoFvEegWj2
 FHrTG9ug8RglSg8qKeWXZIm/pOC88WHX0uTcR+m0c5almlEGIHfSbJzMfuwXAYPv4lzd
 Kldw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVgR0FdkepADXFcKhD88LviYiNNzEa84bpRWAWWeekh3HXlu/4AhFcFL/lFpAhd74NDuISt2xnLg==@nongnu.org
X-Gm-Message-State: AOJu0YwlTkh5bGiDuy/8Qf7KWSX4zPKWXZ1aNJ49w+EdJ2TY67jQX45P
 2X8/6tQ0ue5iRz/JS3SLKF0HlfrBr0MtcFLljB4WiGEWw/cwzHJNoDOfznQvHRRLQ/c=
X-Gm-Gg: ASbGncuOFIPH6PcjpFIW7zpNpAtPyLVPvaPksyr9lqVqin1cMJo9/z1wZTDBjnntIhe
 n0k5aRYfvHhm18u6N2HhUz+IES49ZF9juKYSWwnU9Itcr2dUTH9q2zH01w6ZUwmz6FAnL54HkOL
 sXr4cfw2W4lUwwXxiKvCJKC5E2VWKNt1Euf2hpcmgRlc7Noh4/Se0iODwksEglWpn4xlM8CLIBc
 koQ7+ykPYZC/NWxAXR7Xk0vph0F06yv9VguBYc+Ldq6onOnquEOvItUSWGWvRVKLC/VjSj05lFN
 4f42SaGC7JxuQT/MGcpUzhBiw8xKM6RS2EtlY7tvyQtq8hzYpBwHmNulvZ6wdiqW+9jh1pqEJt2
 wK9tAepOJkVfr3uOGxJK5nv/gy/316FxGHG/K0Z11FoZyKuEkBNuIeu2puMyvAr2z4Uqt3w9/JP
 1iiMoX/qas6kc+okBy/KKeDimcJqWXi0LWQkW0mAqqxnYtkMjNLePwMv2yLrXU
X-Google-Smtp-Source: AGHT+IEXrG8Si7AT2Cc6U+aSqmTwXk/o9+TllQfQZrLykuMH28UNBbl33EUUCCsdH3rcHz/u08XJnQ==
X-Received: by 2002:a05:6000:184a:b0:42b:4185:e590 with SMTP id
 ffacd0b85a97d-42f731d18f4mr829824f8f.58.1764742198168; 
 Tue, 02 Dec 2025 22:09:58 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42e1c5d6133sm40172746f8f.16.2025.12.02.22.09.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 02 Dec 2025 22:09:57 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Zhao Liu <zhao1.liu@intel.com>,
	qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Xiaoyao Li <xiaoyao.li@intel.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Subject: [PATCH-for-11.0 v6 02/13] hw/sparc/sun4m: Use fw_cfg_init_mem_nodma()
Date: Wed,  3 Dec 2025 07:09:30 +0100
Message-ID: <20251203060942.57851-3-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251203060942.57851-1-philmd@linaro.org>
References: <20251203060942.57851-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Use fw_cfg_init_mem_nodma() instead of open-coding it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/sparc/sun4m.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index 53d7ae08ae9..85c8d727594 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -1051,17 +1051,7 @@ static void sun4m_hw_init(MachineState *machine)
         ecc_init(hwdef->ecc_base, slavio_irq[28],
                  hwdef->ecc_version);
 
-    dev = qdev_new(TYPE_FW_CFG_MEM);
-    fw_cfg = FW_CFG(dev);
-    qdev_prop_set_uint32(dev, "data_width", 1);
-    qdev_prop_set_bit(dev, "dma_enabled", false);
-    object_property_add_child(OBJECT(qdev_get_machine()), TYPE_FW_CFG,
-                              OBJECT(fw_cfg));
-    s = SYS_BUS_DEVICE(dev);
-    sysbus_realize_and_unref(s, &error_fatal);
-    sysbus_mmio_map(s, 0, CFG_ADDR);
-    sysbus_mmio_map(s, 1, CFG_ADDR + 2);
-
+    fw_cfg = fw_cfg_init_mem_nodma(CFG_ADDR, CFG_ADDR + 2, 1);
     fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, (uint16_t)smp_cpus);
     fw_cfg_add_i16(fw_cfg, FW_CFG_MAX_CPUS, (uint16_t)max_cpus);
     fw_cfg_add_i64(fw_cfg, FW_CFG_RAM_SIZE, (uint64_t)machine->ram_size);
-- 
2.51.0


