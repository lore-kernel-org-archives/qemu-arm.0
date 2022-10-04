Received: by 2002:a8a:1930:0:0:0:0:0 with SMTP id be48csp41549ocb;
        Tue, 4 Oct 2022 02:27:26 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6qv97MWNqzdFH1Dk8YcK/JlD7eXcifaw4Y4JTS3v47rAnk5j5mQFP0lEmQ8wwwM8T6Ktjy
X-Received: by 2002:a05:622a:1214:b0:35d:261:779f with SMTP id y20-20020a05622a121400b0035d0261779fmr18760706qtx.47.1664875646220;
        Tue, 04 Oct 2022 02:27:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664875646; cv=none;
        d=google.com; s=arc-20160816;
        b=a3BfslBXOWKhyncz289NFC5dPqDKTRf9Vow00LOjt8Y2NWTkEbM6wq9D1gXteKna6R
         PXOvkO4Zhcp7BlcIzvch1Kd75ZpTNCD4es7DhDthKQbILpIb2iRd/6x1hsmw7PW5E7L3
         nibI46PousNnIM2ISc8lEB6+PsC/PaFwlRtFG67kKK1jwc+GKINXogYBZXGL94GNjQWl
         0QlxUv/DWEyMDxkYXSShrX3+yOBzc1kgPXGI2e2gp7Tcohu+e9VDmhfgSty8JQZoSdnV
         F7y4Cso9dG6pxUEz0XAubChvp4Or5AW2d6QlgnUPqi/LJ+C38ASaI+RYJCqLwultQgC/
         b2mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=/wY4wB/ohQK/ixOh+AwUZx64z8H5nK1+i4RzAT+ks7s=;
        b=rVn3mKWZiXV8+swVrKEUaGTG30hs8LLiW4hjdvt4L1wUyI9vYpISDwpLcA0NP4X8D6
         l1C+0xbPad7PgC8OayllK5coZLV07Yq/WYYtL+jhgu3fOQwbwrKDIWc/9M+UXb5QdjAF
         qhNUENVPx5mdYx8q5lV1gLpK4K5cr773Sa6ibrtvVwXWl4Y4ZK2e4aA0YHR9m3DQ/7zd
         0eot4SqBb8i6EuUYrtty0mt11DESt4ZrLwVr+9ZKLFY1Rwl/tP6yANGZZb51WS2AJ2Na
         wEiiHEOTOz9MyiOEc4plekkvbiiGpERqI6aIyUuaYMjrkbzj3cHZSVidHcwS2n63pVGn
         ypTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=lCu02r5w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t13-20020a05621421ad00b004ac87c2b43csi756960qvc.592.2022.10.04.02.27.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Oct 2022 02:27:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=lCu02r5w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ofeCz-0008QS-Pe
	for alex.bennee@linaro.org; Tue, 04 Oct 2022 05:27:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1ofe9v-0004Du-DH
 for qemu-arm@nongnu.org; Tue, 04 Oct 2022 05:24:15 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:46716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1ofe9o-0004NP-Nq
 for qemu-arm@nongnu.org; Tue, 04 Oct 2022 05:24:14 -0400
Received: by mail-pg1-x532.google.com with SMTP id 78so12210434pgb.13
 for <qemu-arm@nongnu.org>; Tue, 04 Oct 2022 02:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=/wY4wB/ohQK/ixOh+AwUZx64z8H5nK1+i4RzAT+ks7s=;
 b=lCu02r5wosrs0/79F2h83fxLHGEQkzxp2gC513SNhno/2VuUq7tfsWFJoyEfeZO3m+
 V2UKS8EsZCiIVNkV2syXpVnSfC3x0EAqJMlQ4G4uNhzZm62DoEQCW6H4+EDMQCTRPdbk
 VOfXtGzwngciR3sacGLMnkxZWemHl4ZIzttsQinoHoOm/cfGGyWD/1TfuaQy1mLlIqVw
 sURdFF2/e4vOa1g60KnM71zcNfu8g2KgMXI74bQUbp0X3V69D5OtXO8gBn5lyrrZLEL9
 93T6/MYMn7E8dH8uO85J2ddiA/r2y2QtLKk9DIkjiXjsqrzd/ac96Qf3QuybRUzqqjjs
 oc0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=/wY4wB/ohQK/ixOh+AwUZx64z8H5nK1+i4RzAT+ks7s=;
 b=Gwe8TrYS9nXAjUW+irnTo3SThzGdrQIU5GyTu/Hl8qeDyoXkUD3FzBWR96+FINIth1
 KKhGwE9E3uHwofWPy3E1DSCGIKrmhrHW/8Tez+pb679zJYRcQrfHNGc4DVqnXUGqSX1D
 BtFO6y3EjLXtJV+HoYPcguse1O8p7V12+GpchuFEAjbT8YJSg0Vh22zaRnFl6lwkBvnc
 oSKbu3mcVsfRaN9AINzTPuSsV86QGXqH91tDwcG9TQeLXvEYnGZ3r4iAuxAKnamzP2he
 BDCGowm1C4phDNAI0Snac+Q575Q/3oLtxgelIC9HEWUWWa1mVz2o2MhSS1fIkNmN/5pB
 XOsA==
X-Gm-Message-State: ACrzQf2OgUJRL62pP792hfjvCXUlsbGVFUANSsERdqnM+JdK+26Sb7aP
 sJ7rh8mWa813wH1ssprOnouZMw==
X-Received: by 2002:a63:6909:0:b0:41c:9f4f:a63c with SMTP id
 e9-20020a636909000000b0041c9f4fa63cmr23234360pgc.76.1664875447384; 
 Tue, 04 Oct 2022 02:24:07 -0700 (PDT)
Received: from localhost.localdomain ([49.206.9.142])
 by smtp.gmail.com with ESMTPSA id
 s2-20020a17090b070200b001fba4716f11sm2934551pjz.22.2022.10.04.02.24.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 02:24:07 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Sunil V L <sunilvl@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH V5 2/3] hw/riscv: virt: Move create_fw_cfg() prior to loading
 kernel
Date: Tue,  4 Oct 2022 14:53:50 +0530
Message-Id: <20221004092351.18209-3-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221004092351.18209-1-sunilvl@ventanamicro.com>
References: <20221004092351.18209-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 8aIlM9o0mHNZ

To enable both -kernel and -pflash options, the fw_cfg needs to be
created prior to loading the kernel.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/virt.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index befa9d2c26..de2efccebf 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1267,6 +1267,13 @@ static void virt_machine_done(Notifier *notifier, void *data)
                                     RISCV64_BIOS_BIN, start_addr, NULL);
     }
 
+    /*
+     * Init fw_cfg.  Must be done before riscv_load_fdt, otherwise the device
+     * tree cannot be altered and we get FDT_ERR_NOSPACE.
+     */
+    s->fw_cfg = create_fw_cfg(machine);
+    rom_set_fw(s->fw_cfg);
+
     if (machine->kernel_filename) {
         kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc[0],
                                                          firmware_end_addr);
@@ -1300,13 +1307,6 @@ static void virt_machine_done(Notifier *notifier, void *data)
         start_addr = virt_memmap[VIRT_FLASH].base;
     }
 
-    /*
-     * Init fw_cfg.  Must be done before riscv_load_fdt, otherwise the device
-     * tree cannot be altered and we get FDT_ERR_NOSPACE.
-     */
-    s->fw_cfg = create_fw_cfg(machine);
-    rom_set_fw(s->fw_cfg);
-
     /* Compute the fdt load address in dram */
     fdt_load_addr = riscv_load_fdt(memmap[VIRT_DRAM].base,
                                    machine->ram_size, machine->fdt);
-- 
2.25.1

