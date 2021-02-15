Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp5556392lfc;
        Mon, 15 Feb 2021 04:00:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwdYbc3jzh+jbXEdyweUsHCqh7n+6OmyLNetXOkctF7RPULobG9H2wEtV6xkJk2Uf/n2gvU
X-Received: by 2002:a5b:1c3:: with SMTP id f3mr11528236ybp.438.1613390405059;
        Mon, 15 Feb 2021 04:00:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613390405; cv=none;
        d=google.com; s=arc-20160816;
        b=Yvqdxa1sDuBelev6twwX+W5M7EF0XZ0pBNx+DgF2eWae234iLS4/cPqxKLPFRGOeOz
         iFxCoDMBOuxX7Np+ofrE0IHzZL5UOkzWZDJ8mx+ZXMHJmTP52iDH3DsJ8ZH5cEr/TUGE
         PzvdIsBYCD5jHzW0FR1LOSTWHk6+qvcLbqamjKfUSbom0/aNxymmca/39JFguHBfxWtO
         TRyJoZmVy8tLIW8PqgeKB5fkoqUlpaMWuTir3KQieOyBPmkP1ktJpoT8+VU7x7QlABJt
         wI52OsNCnfhqrLYxge5SOdNUiUwNjvZVv4yOJaYtNNa+Z6HMgFAOPth5Bw15/3OI4Qsy
         JtMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=SKNE8HC09qZegLpjoVlF4jaNo0rqYYfYydVh0a/tGNg=;
        b=jiIwcpbUDJ/SMZs7Bsdnej9UJPkJlcDgZr6UrrzT7wFEhGgh/fos45zjocw1xnoVVP
         uOnDOlhN6UpiJcW2tYoHC4dAAMHl2jqefNFA/VFXQMWsxzlRBvwav1Ie5OX/gBQtO08t
         AhYfv7txOp1LGj7I5EZe0Qy1E5RbjhUOEn0DKVB683bz0ywanR4LblZxYedxs/H/ivqr
         ORuBXmDZag9PxlLV7gT7CAKZue+dF/vLcF4pnVlBJjuaY0AsXL8r6nuXc/ft3sQ26Ful
         KLer5bTl565YrX+cbxVKt+p9mfToxV0TD5gRA1nKuAoskoyoxhqr+gr+cAPVaaEMrV3z
         DQwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ItvzkFsz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e9si15942105ybj.300.2021.02.15.04.00.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Feb 2021 04:00:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ItvzkFsz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lBcXs-0002Z5-DD
	for alex.bennee@linaro.org; Mon, 15 Feb 2021 07:00:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBcQO-0007HH-LJ
 for qemu-arm@nongnu.org; Mon, 15 Feb 2021 06:52:20 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:34508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBcQM-0003w9-At
 for qemu-arm@nongnu.org; Mon, 15 Feb 2021 06:52:20 -0500
Received: by mail-wr1-x431.google.com with SMTP id n4so5526103wrx.1
 for <qemu-arm@nongnu.org>; Mon, 15 Feb 2021 03:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SKNE8HC09qZegLpjoVlF4jaNo0rqYYfYydVh0a/tGNg=;
 b=ItvzkFszLoSbG0DF64GJ/LUAgzbrGCYSy/c30EJVyn90bIwZeajLSYtPJyVZkuwtCi
 S7qBcu/si6MbtAijXdaXJamj/iEP/I5uCeJ7JVq3goxbsLIh1d64Va+6sfCajivGs/02
 i9Vq0Naaz4J0eSEzWA2aOBvwaAr30g/De/9XxHRqGYwJKaPI8y3AYhAfInNKhYfT3mTA
 CkPEzlrOTuCtEPCeRIYOTZ0Ykr1cYjMmW2D5m/+Y9it0sgxtLUApYi9CDYpWkaXqG2vt
 E7JfYWREfTj26Prx5J+M5Luv1DdJ+k7BQGBD0b+zMuoxt/Bws4vd3tnQ1z85k7HCThIb
 /rmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SKNE8HC09qZegLpjoVlF4jaNo0rqYYfYydVh0a/tGNg=;
 b=RS9Ams84+cWRJEDq5gvRW3jKxfZ5FKIWh0PYMzpo7epzb+4hAzqF3HkJpPulPxaw6k
 1gTj7cyqMaqFd6Ge5cJ+LBkthSi7rKjqjNvMe/nPZrT5g73s0BEk7vK2jbNMNLsm2BmC
 4F91an7dEgfzdNq+tLyy9/hEIEfDFQZjdIXVy/2jS4kJ055QseArvyDiMC4nTjRZE7zq
 NA0zxHvHxK8usty6kwslIg0FlOD98T5TyZ4GaIGejAQlMEZaB+Es7VCT/0GCxQN0Yb/t
 4y5NvtMca1lvBsQ/SBC3sjWXWc/6gzzvou0IyAzpQkSvPt9c1QqxvV1UZzCbF58Ogugh
 lO5w==
X-Gm-Message-State: AOAM530ijkVlTvLKKoD4u0JSgsg55gblIC3zNflui9lBJEC9uft1sIHd
 sjwZYyj/r6qIaNXjhMhK7BRnhp06k7Y6sw==
X-Received: by 2002:adf:f54c:: with SMTP id j12mr18144770wrp.175.1613389936989; 
 Mon, 15 Feb 2021 03:52:16 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l83sm25574812wmf.4.2021.02.15.03.52.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 03:52:16 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 08/24] hw/arm/mps2-tz: Condition IRQ splitting on number of
 CPUs, not board type
Date: Mon, 15 Feb 2021 11:51:22 +0000
Message-Id: <20210215115138.20465-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210215115138.20465-1-peter.maydell@linaro.org>
References: <20210215115138.20465-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hfgiVzDsVdil

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
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/mps2-tz.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 6e345cf1f09..5561c30b126 100644
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

