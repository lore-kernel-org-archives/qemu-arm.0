Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2206858lfo;
        Fri, 5 Feb 2021 09:35:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy5MByI7c87oEKRc4v9n0pYAo5dEsD0JjlqSXfJ48K5iynsM/nIIXn1GLkj0CK8YnOTuE++
X-Received: by 2002:a25:5f49:: with SMTP id h9mr7913802ybm.213.1612546548184;
        Fri, 05 Feb 2021 09:35:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612546548; cv=none;
        d=google.com; s=arc-20160816;
        b=uzFbY9t1A3deXKz0JGF+on2zu7SM6P2rJ8fB3KV6M+Frqd54XNm3xsLd5sL9Vjgur1
         hjMU2blMtdpxW+4O5cSNRBUz9o29LGx2r74AeEdQZuQMP0vm1XSkY/aeSY2oARtOlSN7
         j6elku00+OLEheAUzg+5ZnYgB0wcflbqCKUBVvowYqmhVyRbKHXkAZvRWpCa98bnHuaE
         gRpa3umGe8a5pyLFmSfY4fixmsRTbTuNv2600OVh9vxq5TYjdCBMQj4dUGBVf09Wj0E/
         9fO1iaoS+5xxfZ/tL1FrD5w4l+rRa+W5aIM6FEZCH7ISl+IpVFrKln4zcmZrR5cox7zF
         jKRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=va0A81ClB5F8EaAWROYYvDbctjGQ9fM8K2ZTOurTkG4=;
        b=twBom/HeDBUdJibCAhNz0mgTS+5EOJCa01qDhV0adtSF9niz9vplbGwhzcNh8aSQzO
         LDcSPw42xCHI99xzeNJRZ8JlYbzbsw7DgVwZxWnaIGa7HSE/3unpT9sPeR+xjicbzAXI
         8mN6O3dBhmS5PCDg/hJeOA4cji+/ofbjQxXLkIqE5iApFo+THQGm/YHpmXuVSrxrxOUZ
         wzlxtaKkMgDTU3ZMzDe6sZRmpy+Uy11GFPZEm58pSnQP60ouVhYzQJTfEhdGae3UgIht
         mwntTKiZcWsUkiy0XjirFQWP8Cddd6GWpMLfnHI+hXECQzs3JjMjVrMwDwC9Cqh1+vhc
         YSeg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TTcdLbMw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p12si9901582ybl.295.2021.02.05.09.35.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Feb 2021 09:35:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TTcdLbMw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l851H-0007pM-I5
	for alex.bennee@linaro.org; Fri, 05 Feb 2021 12:35:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l84Tb-0006lN-Nd
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:01:01 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:40921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l84T8-00043L-NT
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:00:59 -0500
Received: by mail-wm1-x330.google.com with SMTP id c127so6433852wmf.5
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 09:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=va0A81ClB5F8EaAWROYYvDbctjGQ9fM8K2ZTOurTkG4=;
 b=TTcdLbMweCBfuBARQyE3SgXm8z7P6eT37kQBiei0xUACTJXkaefHx3E5pE8m9lc71t
 2T8BQNDcp2OpDguWB2iaeHOxH30YxoEXkk9idN6qxtysEJAJek3ybHj1edxmj6B43Aub
 wdmjEKQPc5n5ukAII2R7JmS/vTa7KxzZIW1osvEx3hhX5REPjdr6JBrMI+0XYTo5zYlc
 8fvOtA8YjG8KSVjwok5BVqdDN0UwwciHxved2zwOnoTVkYytqNGp1Z55Y+q8u9nsEFGD
 jHMrWMi/yBdpV12koric9YsSL4UI6QmTSqai9hj4HDJaNJYQwq0wgxAHBjAFY4N90eoy
 N6wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=va0A81ClB5F8EaAWROYYvDbctjGQ9fM8K2ZTOurTkG4=;
 b=K9caKbvW1hpMwBU75sCk1CxvpqyHK+6qPFpdwrcr+fq34mnHJK29EuSx/2+7BvrgEv
 dMIyhGH5EB1GH5vMK9ugXVjAvKlpKdiCN7Q6VPzq8cF4UuhZKY34kyoY1KEnUDxQtlD2
 Itgm0bYBzZsDzWFCuO6W2FNjpphO5w2WpV9EmfYJJArlGW+l+ofpzfuvV+hszC4TzR3j
 o+/8WrrtpCOsAU7VV1AQZsrdzwb1bqEN2m+9tRSfZiM335yH/WQnw8jEyPkyZYNosie4
 L5F/hPFSURD7r3BB1QRvs2zSweUVnqf7sByJC7v8imRO1sJtJavbjToay0z5cTkouw1s
 bSHg==
X-Gm-Message-State: AOAM533a79IYqrRrjw0oSB/CtqL9kiJVJpYQt9cUENZ8o+1RmT6keeqe
 lBalr2zT0nPza3pm6/qSeFC2vw7kKpveIw==
X-Received: by 2002:a1c:a9d7:: with SMTP id s206mr4469059wme.42.1612544428262; 
 Fri, 05 Feb 2021 09:00:28 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l11sm12200010wrt.23.2021.02.05.09.00.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 09:00:27 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 08/24] hw/arm/mps2-tz: Condition IRQ splitting on number of
 CPUs, not board type
Date: Fri,  5 Feb 2021 17:00:03 +0000
Message-Id: <20210205170019.25319-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210205170019.25319-1-peter.maydell@linaro.org>
References: <20210205170019.25319-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kmCXOgYxjUZw

In the mps2-tz board code, we handle devices whose interrupt lines
must be wired to all CPUs by creating IRQ splitter devices for the
AN521, because it has 2 CPUs, but wiring the device IRQ directly to
the SSE/IoTKit input for the AN505, which has only 1 CPU.

We can avoid making an explicit check on the board type constant by
instead creating and using the IRQ splitters for any board with more
than 1 CPU.  This avoids having to add extra cases to the
conditionals every time we add new boards.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
This removes the only current user of mmc->fpga_type, but we're
going to want it again later in the series.
---
 hw/arm/mps2-tz.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 94618ae54d2..4d8e42fa6b6 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -139,17 +139,14 @@ static void make_ram_alias(MemoryRegion *mr, const char *name,
 static qemu_irq get_sse_irq_in(MPS2TZMachineState *mms, int irqno)
 {
     /* Return a qemu_irq which will signal IRQ n to all CPUs in the SSE. */
-    MPS2TZMachineClass *mmc = MPS2TZ_MACHINE_GET_CLASS(mms);
+    MachineClass *mc = MACHINE_GET_CLASS(mms);
 
     assert(irqno < MPS2TZ_NUMIRQ);
 
-    switch (mmc->fpga_type) {
-    case FPGA_AN505:
-        return qdev_get_gpio_in_named(DEVICE(&mms->iotkit), "EXP_IRQ", irqno);
-    case FPGA_AN521:
+    if (mc->max_cpus > 1) {
         return qdev_get_gpio_in(DEVICE(&mms->cpu_irq_splitter[irqno]), 0);
-    default:
-        g_assert_not_reached();
+    } else {
+        return qdev_get_gpio_in_named(DEVICE(&mms->iotkit), "EXP_IRQ", irqno);
     }
 }
 
@@ -437,10 +434,12 @@ static void mps2tz_common_init(MachineState *machine)
     sysbus_realize(SYS_BUS_DEVICE(&mms->iotkit), &error_fatal);
 
     /*
-     * The AN521 needs us to create splitters to feed the IRQ inputs
-     * for each CPU in the SSE-200 from each device in the board.
+     * If this board has more than one CPU, then we need to create splitters
+     * to feed the IRQ inputs for each CPU in the SSE from each device in the
+     * board. If there is only one CPU, we can just wire the device IRQ
+     * directly to the SSE's IRQ input.
      */
-    if (mmc->fpga_type == FPGA_AN521) {
+    if (mc->max_cpus > 1) {
         for (i = 0; i < MPS2TZ_NUMIRQ; i++) {
             char *name = g_strdup_printf("mps2-irq-splitter%d", i);
             SplitIRQ *splitter = &mms->cpu_irq_splitter[i];
-- 
2.20.1

