Received: by 2002:a17:505:917:b0:1be9:327d:8ee3 with SMTP id hq23csp703008njb;
        Thu, 22 Aug 2024 09:23:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWOSJwjAJ+lFd4rjDOg/TSlvVcXKRHnEYl4qXrr0HbQmCuFEz5j6SyuuyzVRvvOr/iZ30vxln5YOAwbsg==@linaro.org
X-Google-Smtp-Source: AGHT+IEdtxJl46RGbCF5Y0SyZuzA0jpqyYWq3LkDZ4wlWk6ckn7kahDTVt8fztlvVlMke2DGSPSg
X-Received: by 2002:a05:6102:b16:b0:498:f14d:7a52 with SMTP id ada2fe7eead31-498f14d7f26mr148826137.10.1724343830195;
        Thu, 22 Aug 2024 09:23:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724343830; cv=none;
        d=google.com; s=arc-20160816;
        b=fQnf3yJ4WtogdeAnSaIGAa3nz5V3FNsblHcMJJZudIIh7PKL5BHR9/G2TcaGNuPU2M
         /jO4IKJHUk5+H5WvzeDgsUkcdmKN8cUnRysp7prZ2JECp1kVA0lUyiWEImFlFccbDzhg
         00bsgtk8EnDi53BV59L2Uj6J8EpYOSjL+NKKLbnlPQapLGXGe4XxHaZDjLWQk8VpXHNJ
         aW+P6LP1WYiDrKrDAM/ufbMRkYvmwbcGeBmzx3ytH/euLl+/Z8rdl+sIa7AthD4/C946
         xvLzeoj5P0tpsIn1qASNwqlOonR9g31RM1FelyBOfL3DSHHVeQQU0jKpwy62KUkL8gVu
         QWmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=FMrNBgMym3Cry5MvqInQrTVyM5jytLXZKjA6eD9Kdw0=;
        fh=ccPkIv+ASOOBZ/9yqv8QUMFw2GtqYDK2ik0zYMtkoQw=;
        b=quNVk4pB4nfFLO42kn6Y7Fp+K8v+1ovuqjG/lqzkN1+unWAd5c2Qza/A3zNIKfAVyE
         pkvHLHCKuUx1ks1Jaa1cbanwN8pDG/F9+7U13g9qbHpNL3/cudeywp17kpnGiq7Q2mN0
         aj/WAjKT5UbTWosHGhs6K/pQbMWwzCv1b+jmQhRw7lAC5rdpa4unwREYMEEeBLS3FjAA
         +LN9388DKPniGhN2PmFHRFgLzMqkjJWh7H9+8RVriX5k/XkjOsQr2sLcNEPFz71LxVrV
         nPiGf8wyaUJ1Ju7FBUFjkPhbIB/u3qCIZS+7h+8WXyubEAynLPoYGiYZNxczXZ3XBr7Y
         Csdg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q+p9Lwfi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-498e48de96esi448222137.367.2024.08.22.09.23.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Aug 2024 09:23:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q+p9Lwfi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1shAb6-0006gM-0m; Thu, 22 Aug 2024 12:23:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1shAb2-0006Oh-9t
 for qemu-arm@nongnu.org; Thu, 22 Aug 2024 12:23:36 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1shAat-0007Vp-7W
 for qemu-arm@nongnu.org; Thu, 22 Aug 2024 12:23:28 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-428101fa30aso7982365e9.3
 for <qemu-arm@nongnu.org>; Thu, 22 Aug 2024 09:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724343805; x=1724948605; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FMrNBgMym3Cry5MvqInQrTVyM5jytLXZKjA6eD9Kdw0=;
 b=Q+p9Lwfi2OXES0ynzLt026Yy5WChhXdWwZDbcGeTtQOqyrvQ3Vlu3XQCclVXAIHJT4
 0oLU24dvGaHdqYX5v+kO8xhUUUmdCjLAIoUJL9ruftOQ/W+IyEpaWE+adsH9Psut7gAM
 i2coiDFAM3rhLtM5lQ1LwjUwiiAFVRC5FPB36k2A0HTkBuB8ecDgHLLe7sM/13B1Efcc
 6/GbfdXWsZHHtdLoMhi9J14YFXW55VKV4s+Pm4a0rr2y91S9kxBEyGoXX6vf/c25Hf2N
 aSp8Dg2htMTzoP6L0ys1gdZEIKEEQeu2Oey3ienkxBBugBo28okQFWwp0LHoM81Os1Ep
 W1+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724343805; x=1724948605;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FMrNBgMym3Cry5MvqInQrTVyM5jytLXZKjA6eD9Kdw0=;
 b=jN32RGn3yDSI6h0A6aErSRx0iD7YyVuhzETvliiQoYlJHnXweon26kueAKoJ7dvart
 0KCzt4IuBwMwHSxzVmRFJXTQWEklyn07r83rAck+L3+VUtzNfl7xYMRRsYYd+ywdSxLH
 m/TpA2TzFOoHM9PNAUdQBgrUmhgwetu0yYaKJhobGOF1yFfk8cjgAhrsNivGbPYDsRJd
 KCvdDYRb+oNl2cZG8yRmQOGvmP9WXHb6RpkhalyaG7CD6PCxuccwX4Fmsm8j68/uIGMy
 1g1GyyWU2FmVhcntQccMRCWSAPOHX5zTqWw7n0h2t6zrQMRd61y/2l/7WBTE2Bbj7KdJ
 4t2Q==
X-Gm-Message-State: AOJu0Yz3rFblm9d6pbfJ8QSe7Co4WIrTvUdpfOuP1naitbNYCt0uKHfn
 8MnYneKfWVFkwaqVxaUuF2Ekc7/YwrMaCKL1nAmH3gG6+LBGA6At7xJF6JO+GReKb2aM57lVQjm
 8
X-Received: by 2002:adf:a382:0:b0:367:8e18:535c with SMTP id
 ffacd0b85a97d-372fd7240a6mr3668939f8f.43.1724343805146; 
 Thu, 22 Aug 2024 09:23:25 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37308157d1fsm2041117f8f.47.2024.08.22.09.23.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2024 09:23:24 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Radoslaw Biernacki <rad@semihalf.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH for-9.2] hw/arm/sbsa-ref: Don't leak string in
 sbsa_fdt_add_gic_node()
Date: Thu, 22 Aug 2024 17:23:23 +0100
Message-Id: <20240822162323.706382-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: cwpKXT9ayu+K

In sbsa_fdt_add_gic_node() we g_strdup_printf() two nodename
strings, but only free one.

Since the string is actually entirely constant and we don't
make any use of printf's format-string operations, we can
drop the g_strdup_printf() use entirely.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
A small once-only leak, so this is 9.2 material. Spotted
with clang leak-sanitizer.

 hw/arm/sbsa-ref.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index ae37a923015..5cd8cd705be 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -164,23 +164,20 @@ static uint64_t sbsa_ref_cpu_mp_affinity(SBSAMachineState *sms, int idx)
 
 static void sbsa_fdt_add_gic_node(SBSAMachineState *sms)
 {
-    char *nodename;
+    const char *intc_nodename = "/intc";
+    const char *its_nodename = "/intc/its";
 
-    nodename = g_strdup_printf("/intc");
-    qemu_fdt_add_subnode(sms->fdt, nodename);
-    qemu_fdt_setprop_sized_cells(sms->fdt, nodename, "reg",
+    qemu_fdt_add_subnode(sms->fdt, intc_nodename);
+    qemu_fdt_setprop_sized_cells(sms->fdt, intc_nodename, "reg",
                                  2, sbsa_ref_memmap[SBSA_GIC_DIST].base,
                                  2, sbsa_ref_memmap[SBSA_GIC_DIST].size,
                                  2, sbsa_ref_memmap[SBSA_GIC_REDIST].base,
                                  2, sbsa_ref_memmap[SBSA_GIC_REDIST].size);
 
-    nodename = g_strdup_printf("/intc/its");
-    qemu_fdt_add_subnode(sms->fdt, nodename);
-    qemu_fdt_setprop_sized_cells(sms->fdt, nodename, "reg",
+    qemu_fdt_add_subnode(sms->fdt, its_nodename);
+    qemu_fdt_setprop_sized_cells(sms->fdt, its_nodename, "reg",
                                  2, sbsa_ref_memmap[SBSA_GIC_ITS].base,
                                  2, sbsa_ref_memmap[SBSA_GIC_ITS].size);
-
-    g_free(nodename);
 }
 
 /*
-- 
2.34.1

