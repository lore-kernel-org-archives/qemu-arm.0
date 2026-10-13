Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EEB7CC6B13
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 08:46:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGY9S-00018S-El; Tue, 13 Oct 2026 04:46:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY4e-0001nn-O5
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:41:30 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY4d-0008K7-1X
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:41:28 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4a16bc2278aso18560155e9.1
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 01:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791880886; x=1792485686; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=FPolPi2JhiZ7Lq5RQip9zpX4wzM5RDqIgiaQzEcR81k=;
 b=ih8Szau5j9BzcU8de1V2Bj5v9QGrsgK3dUXtdAC5vg6aJqt9dN6et4hHZ9dXHoqpmp
 HI7HHFELYz7RexxIoEby3ROnhmW/eO66ylh8LPCuWu4bCTejYgmmXOlrCJKe+XnyN+jI
 7AfYYi0v8Qi1vf3TwBNmoIoKJJzD1pvukCzRivUGLScehEwaCRq69R2cjIvsglg6qGu/
 9RFYm15w4yIDG7FtVpT3NlRROKVmkRFyDdQZ4K5fnTGzpMx8TcsYvZZPKO67ZpVJ1Z0i
 h9UlPo6jvy3fgvMurlSq+p5hPIQ8Sxtprs6YqxXyFJoOO8Z/oQ6quSXTxQrK7rkbw4D0
 w9Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791880886; x=1792485686;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=FPolPi2JhiZ7Lq5RQip9zpX4wzM5RDqIgiaQzEcR81k=;
 b=dSkVa3FK+FG6rH10qEjun9QBu/YgpuXKb4o/mPE2RAoq8gHzB5OWYWj4q8aL20Bvii
 ogR1hxOb3GhGRmHLUg35CTzFTA5kfZ8e+QX2Eg+L62KFY4VccY2cXgxnoxYq34Y5y4GF
 EXVsrj4AqBB0Pxj7/73caQEKaE69GmKkiBeAgSXor91rlcitLes7IiAniSb8xIqy4mRc
 B+ctwo78AKdwSPWB2p8/PxTEsOuuLiLbnP3KNsc+VhK3hW6wszAbKHF7EuIxvAkHLlPI
 oB6R2xyXTw2+47Gq2yE+VIKMLIqyBA08WYd3C/RIQJPbE5KVlA9DZrmHGQpyZZdVkc8W
 Hh5A==
X-Gm-Message-State: AFq9FYI8/W0EnNgMY4zeFRLdZHt4LK7CoioJ16hGF32gh6UYRlhlgNTJ
 tt2jK3rSpZWGkFDg/T2HhZZqHRMeOFXkwuLSTzakz9pxS/T83fgFFyo3GRJzR4oV98gb+BMfBc+
 ckGWW9zw=
X-Gm-Gg: AYBFou3zJxa2LH64iANcM4kNZg4PTI2eb0kQ9mCMrF4QF70PTS8x2vgbHLhcnoQyqKp
 8HWwcDHOIkNZT8oRIT0/jQe+5rBrPGLjX9yGLbm3F6gs8z3c7UzHh9nDGMWgYsNtcITwGy1kLdB
 DPas6p6BhGdZaDHO3ZsI8PZSHE5xDWkIKpe0STQnJR/xkaP9IVMeyvH9NVf6p8/oxbWEbzfmmhA
 xa+tLbHJnrjiRBsBtPGGnJPqle19xzXnoBPrlZ5kL4v3foBo2Pkv8EUmN+fzcrMUAjHooTH8VPK
 PzLlndrvJ/EilqH+X5amBoKW5tbqqGQT+PJ9MYQYeSnzmVJM4NX5s580GHrAPmXBtD9s9dDNl9v
 ihtjqjChFUmBzsOBLYBvIzY9OwPmHeh95Tj7FxCFh2AbZ3OvlsoGmZcfEXpaXRqL9Q5TMcRqWdy
 7nm+lkaDJBjH3C/bXlJhjuIJCNb0HYh92EPfnHsVI6jO6R5Gq2ipwOFGhItxTZ5SYD4+J7FqyfN
 uD04u/1Dhz71lSeyM9sZjGKsJRBd3sEgS5LqCm0CMLm55/ICQyNcU8dr3TyMUt0MV8z9a7bc70t
 MtDeZtCaBGRTuw==
X-Received: by 2002:a05:600c:6990:b0:4a0:1ea1:477a with SMTP id
 5b1f17b1804b1-4a18e4d8bbamr204086655e9.27.1791880885616; 
 Tue, 13 Oct 2026 01:41:25 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18be96549sm495086735e9.6.2026.10.13.01.41.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 01:41:24 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 86/86] hw/arm/virt: allow virtualization=on with gicv5
Date: Tue, 13 Oct 2026 09:39:33 +0100
Message-ID: <20261013083933.1024405-87-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013083933.1024405-1-peter.maydell@linaro.org>
References: <20261013083933.1024405-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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

Now that the GICv5 implementation supports virtualization, we can
remove the check in the virt board that prevented you from
using 'virtualization=on' with 'gic-version=x-5'.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 9d192515d85..51554619fd5 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -3015,9 +3015,8 @@ static void machvirt_init(MachineState *machine)
         exit(1);
     }
 
-    if ((vms->virt || vms->secure) &&
-        vms->gic_version == VIRT_GIC_VERSION_5) {
-        error_report("mach-virt: GICv5 currently supports EL1 only");
+    if (vms->secure && vms->gic_version == VIRT_GIC_VERSION_5) {
+        error_report("mach-virt: GICv5 currently supports EL1 and EL2 only");
         exit(1);
     }
 
-- 
2.43.0


