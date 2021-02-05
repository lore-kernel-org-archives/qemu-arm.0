Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2216385lfo;
        Fri, 5 Feb 2021 09:48:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx9h/yzQcgyvZRPfdL7gJzL16DErwWq32vzxg54vYxX3nKtbpDPRSvfAn4PlqbX5NFZEra6
X-Received: by 2002:a25:7e82:: with SMTP id z124mr8191042ybc.140.1612547291312;
        Fri, 05 Feb 2021 09:48:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612547291; cv=none;
        d=google.com; s=arc-20160816;
        b=nKSwAciBsmUgw/9QwUxB7Q90QK/YGWNtVe/vg7m/8kdxAiRU/3RxW+xrclKUO9rQnk
         WVT276UGxNFDxajRU7PVZQxbXacDvdCAcDrT48ohMmUg81ZZooKJ6d7vcxxCNxbX2NGm
         9R0byisVlDbbdSkKLTfAYTSdTB5AoYbg80B5iL0fq+lzpX93zsd1tENkBmNERLOqZzTM
         H3sWJ6yFdaSy/CEEMKUOLaLioiEVZGUbhb6gh/VpF9tAV7h1BBjx9c6RWgA1L3RXrbbj
         X9w2u4NCobylp0w8MeNhbXQ71MQB+1i9n+aP5nz+9dpfh2LjVTGA9xapaCzRycRT+IyB
         9Nmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=g+EZctwruwxJ+bIOTViWFK3zdYVscML+NxpdSxKPVAo=;
        b=ijNfqko147uXnLfWhxOn90vkAJsgLwOChlEdEwx2KI/xif28PsoofzPsY4t+bTi9Bn
         fc8ed+4mmGguQzFjj9p0JkeX3X8h5k9Egn/wzqTzqlnUS+7f+FfirP2RxhgungXd/Nx1
         92AALtLgRI5gQn3f7W+InfyXqhuLu8h9Cmm0WBxsQ/l4DJqJ7w3TTG1+o/Gr2DyfZZKX
         9XVj+xkoJBQtbNs3VXmHwnjkFRlPmYW8uG37kUZlFpZxv/s3zMzYSOIWM+95fUcWUp3G
         iPj0DPF3UZoMEjTijJLwb65/pNOUZxc70bf5dsHLfN59YF0sG9VCgFen3j6PtjYujT7P
         aYEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qvp1pu4u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y67si10810292yba.428.2021.02.05.09.48.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Feb 2021 09:48:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qvp1pu4u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l85DG-0002PC-L7
	for alex.bennee@linaro.org; Fri, 05 Feb 2021 12:48:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l84TF-0006be-9g
 for qemu-arm@nongnu.org; Fri, 05 Feb 2021 12:00:38 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:54634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l84T1-0003zH-Rp
 for qemu-arm@nongnu.org; Fri, 05 Feb 2021 12:00:34 -0500
Received: by mail-wm1-x32c.google.com with SMTP id w4so6563543wmi.4
 for <qemu-arm@nongnu.org>; Fri, 05 Feb 2021 09:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=g+EZctwruwxJ+bIOTViWFK3zdYVscML+NxpdSxKPVAo=;
 b=Qvp1pu4u+vQKimrApKXyxwfCm/A3lbHEMeMumikqS/kes2ckAZiLYMYis9DgDtPnuV
 sAUxp9ba40f0HUl5kqgedpLD8Rcr6YJrrYrjaEJ9OM+ftu/DC1K5s60/PRBUcDqhSSdp
 LbYmxV6TN06Z8J1GW8cbf0PbcXxeAyEcVIEorL6BoJuP4/kNUptADtLhN50z1q2b6wgx
 vw1SkZgeLe7aDBipIDUU4YMPqvno26U+mlzSVFZLt/TN+Xla4yu8N/+amQdqeUQl209c
 LvrUrfN7S2rSUH7/JjLFyn/kHDGguVo+gKT7Rl2ze2VEa/270LAWSuJYESCaf9Qn9oxD
 vp8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g+EZctwruwxJ+bIOTViWFK3zdYVscML+NxpdSxKPVAo=;
 b=cxswry3xbPy8LonSRMdH0E35FORUbSGbUvCt66NHDDZzUiCzjZiCETJ8sVAxQ8aUaf
 QO3xsH+kCUt7neDQT/MmeYUb8r/ODQu7nbFrN590DeKlWrPqToHo7Y2Clz5k0+mPZXqE
 Lq7kt0oK30ESFqMBgBb0y5gIm3h/vS9cFe5YzwjaPZHpgQvzRIip/+NK7ZhlN/6FYStv
 VjaJbO4dXPNs8ys7eeug0ug90Skh6nca7tIlpv/UL/ayU6IJegWHwnYxLz52ha/faWWV
 oXAfR1a0a1qNM48211SWgp/cEs/yQaI/gCbqPvH8u+qCSospH3NrhbJhwhUu9EdlKC/Z
 niLg==
X-Gm-Message-State: AOAM532TQRY/VkeDgKxYha3+8LYQ50RU8yLKTnAbNCDI7BbCb2fID3IU
 xHfTGJ/QS3i4F7TpfQ4XG9+dCU1WGL2Nrw==
X-Received: by 2002:a1c:2905:: with SMTP id p5mr4288589wmp.156.1612544422513; 
 Fri, 05 Feb 2021 09:00:22 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l11sm12200010wrt.23.2021.02.05.09.00.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 09:00:22 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 01/24] hw/arm/mps2-tz: Make SYSCLK frequency board-specific
Date: Fri,  5 Feb 2021 16:59:56 +0000
Message-Id: <20210205170019.25319-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210205170019.25319-1-peter.maydell@linaro.org>
References: <20210205170019.25319-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
X-TUID: 1nLREfSi08B9

The AN524 has a different SYSCLK frequency from the AN505 and AN521;
make the SYSCLK frequency a field in the MPS2TZMachineClass rather
than a compile-time constant so we can support the AN524.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/mps2-tz.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 90caa914934..82ce6262817 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -76,6 +76,7 @@ struct MPS2TZMachineClass {
     MachineClass parent;
     MPS2TZFPGAType fpga_type;
     uint32_t scc_id;
+    uint32_t sysclk_frq; /* Main SYSCLK frequency in Hz */
     const char *armsse_type;
 };
 
@@ -111,8 +112,6 @@ struct MPS2TZMachineState {
 
 OBJECT_DECLARE_TYPE(MPS2TZMachineState, MPS2TZMachineClass, MPS2TZ_MACHINE)
 
-/* Main SYSCLK frequency in Hz */
-#define SYSCLK_FRQ 20000000
 /* Slow 32Khz S32KCLK frequency in Hz */
 #define S32KCLK_FRQ (32 * 1000)
 
@@ -186,6 +185,7 @@ static MemoryRegion *make_unimp_dev(MPS2TZMachineState *mms,
 static MemoryRegion *make_uart(MPS2TZMachineState *mms, void *opaque,
                                const char *name, hwaddr size)
 {
+    MPS2TZMachineClass *mmc = MPS2TZ_MACHINE_GET_CLASS(mms);
     CMSDKAPBUART *uart = opaque;
     int i = uart - &mms->uart[0];
     int rxirqno = i * 2;
@@ -196,7 +196,7 @@ static MemoryRegion *make_uart(MPS2TZMachineState *mms, void *opaque,
 
     object_initialize_child(OBJECT(mms), name, uart, TYPE_CMSDK_APB_UART);
     qdev_prop_set_chr(DEVICE(uart), "chardev", serial_hd(i));
-    qdev_prop_set_uint32(DEVICE(uart), "pclk-frq", SYSCLK_FRQ);
+    qdev_prop_set_uint32(DEVICE(uart), "pclk-frq", mmc->sysclk_frq);
     sysbus_realize(SYS_BUS_DEVICE(uart), &error_fatal);
     s = SYS_BUS_DEVICE(uart);
     sysbus_connect_irq(s, 0, get_sse_irq_in(mms, txirqno));
@@ -403,7 +403,7 @@ static void mps2tz_common_init(MachineState *machine)
 
     /* These clocks don't need migration because they are fixed-frequency */
     mms->sysclk = clock_new(OBJECT(machine), "SYSCLK");
-    clock_set_hz(mms->sysclk, SYSCLK_FRQ);
+    clock_set_hz(mms->sysclk, mmc->sysclk_frq);
     mms->s32kclk = clock_new(OBJECT(machine), "S32KCLK");
     clock_set_hz(mms->s32kclk, S32KCLK_FRQ);
 
@@ -670,6 +670,7 @@ static void mps2tz_an505_class_init(ObjectClass *oc, void *data)
     mmc->fpga_type = FPGA_AN505;
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m33");
     mmc->scc_id = 0x41045050;
+    mmc->sysclk_frq = 20 * 1000 * 1000; /* 20MHz */
     mmc->armsse_type = TYPE_IOTKIT;
 }
 
@@ -685,6 +686,7 @@ static void mps2tz_an521_class_init(ObjectClass *oc, void *data)
     mmc->fpga_type = FPGA_AN521;
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m33");
     mmc->scc_id = 0x41045210;
+    mmc->sysclk_frq = 20 * 1000 * 1000; /* 20MHz */
     mmc->armsse_type = TYPE_SSE200;
 }
 
-- 
2.20.1

