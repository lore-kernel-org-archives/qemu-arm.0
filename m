Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1153398lfa;
        Mon, 12 Oct 2020 08:42:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4pE3VhREwXqFmOcIW3JDr/EdfNHT3xPcg9fVE7IhZGpVtcGb+bhLes69OBhEdugiHL05g
X-Received: by 2002:a25:d481:: with SMTP id m123mr5608116ybf.142.1602517337140;
        Mon, 12 Oct 2020 08:42:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602517337; cv=none;
        d=google.com; s=arc-20160816;
        b=RaPZEP+k/RNktDtAU7yFEGBaBZOk8LCdyua+876Nown/6searP3q7Oxg3U+gtNBn2s
         YAoz5d5HsUCZc+qmwfZgDCWjmFLPimOvAywkt5ggdQCpWI5KHzGzWhxrVrkl+1arLivy
         ZRAjPAOiAbA0uiAKt4I+9KVf4CV+xH2Aj+KtobCCCf16/AIRB7EKTUieJP0iqDO2bE9J
         SQaXXXo3V2HOQzxgemSHOeVn9FQ3S6+O4SwGLDw8KoNuuegu36KGDaFXcpIzjl4Brw9C
         WpSvtMhsQbiVf1VOOKWbro+LT8UiM7a9rcwLVDtIHEtzy3Jyyf/nMq3YlrAuUnCGVyb4
         4tig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=+rL5y+LPIlyoU3TM7H1gns6WWZrHXRx5K1wFTm/QiuM=;
        b=D5MDxPJltV91Emk+AwLUiPERZ6PhW2RTq2EUBXGW6xEJ1RzsHTYt5QMixOgQldGcMO
         nfL3lWUnFnEI7RKxR81tgi59UZaEC1Pguui9Rdoyf2+shaAtkBBexxp6rhnXR3/9YG1u
         x77sKJe7XPXgefBMO1sLkEfBJ+QyelLA6YqKBURO/67AXrqcVzzvrQN4+ml36rrZHiyZ
         GzZmbNZDszyaYf2Y4+nZHqeamaR2nWN6Ygq8DgI/sgn5OF9FGg3Tmn6Qm5LFOD0BCAPj
         ag7BRdJmsTOcC2wdbKoIrHyKLJWGpg1AcsNaD9U54QRN/R0gkO1IEUlDVyHaSFA3stBs
         05lQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iYSLRaPq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e64si6483961yba.232.2020.10.12.08.42.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Oct 2020 08:42:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iYSLRaPq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kRzxo-0007TV-Ej
	for alex.bennee@linaro.org; Mon, 12 Oct 2020 11:42:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRzqM-00072M-9E
 for qemu-arm@nongnu.org; Mon, 12 Oct 2020 11:34:37 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:51186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRzqK-0007KH-KC
 for qemu-arm@nongnu.org; Mon, 12 Oct 2020 11:34:33 -0400
Received: by mail-wm1-x344.google.com with SMTP id 13so17525809wmf.0
 for <qemu-arm@nongnu.org>; Mon, 12 Oct 2020 08:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+rL5y+LPIlyoU3TM7H1gns6WWZrHXRx5K1wFTm/QiuM=;
 b=iYSLRaPqYYm55PYEe2u/gTksh2DYtlQokYWvM4HiWEY591jCkZjXlvE9Mz6wVNvzdj
 V7qOhCBqCi/pArufM/CE7v2jlImzg0wx76ZOQacNHpTAnJ0IBnhz9uC7sYU/GGebLldo
 e0U3FfKg4ytb0CxgMN/hzId/Y41ZdOCl9g3kUV9OKgtUmDBP1KjXuTgGcKHSf6YljeyT
 vU8p6NTtoHbUpBYKl8ighOGm7ygULVeUPcdqyFhRbEEFUxCcd4CFOFJbWbeIyB4V7xUJ
 f7Qh1svo9X+M8jEY+XB7ucnTrVmhfEgEWP2RLVUexTHUU0UnDAQEriJptvFGpt+GRcI4
 D5Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+rL5y+LPIlyoU3TM7H1gns6WWZrHXRx5K1wFTm/QiuM=;
 b=cfMMl1Dif9tmAMECsu3s7ajHFWZh3VLIpKC+IldjDwfxr1yu96VI+gvEsLESmGU8sT
 QMs9PlfCLivRMwftT47qfEZX8Rfve+qFh79kX8un9/bGBFbBzdYZDpz0WpwGFnJnCLMJ
 O2IaOMtiuv1zZP+2g0/uXEzQ23SCCSIIkSKu4som9IyEWUymr3IoSg53tajmBTz/veMt
 dYonlCMzOZRtH8mggQWZB08gDpceiQMIJSChjy4qiyKv5/ztUZAoOb8h55tUvn0xlBcF
 XSTEULmkKvVC5HTUVa5Xa1oNK5d/RE6d7et6phduPIteEB/hm+GeJI9DTGD9BQu/vBAX
 f23g==
X-Gm-Message-State: AOAM530DRfxSneiPul2QxGAbuYeTA7mOfy8nk8JeiJ+q0AFHOk81yQ8t
 0DqYdwkm3pNgXvJf5WFGpckCg/SCVLEBnBpN
X-Received: by 2002:a1c:6457:: with SMTP id y84mr11141811wmb.36.1602516871079; 
 Mon, 12 Oct 2020 08:34:31 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y10sm19675284wrq.73.2020.10.12.08.34.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 08:34:30 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] hw/timer/armv7m_systick: assert that board code set
 system_clock_scale
Date: Mon, 12 Oct 2020 16:33:41 +0100
Message-Id: <20201012153408.9747-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201012153408.9747-1-peter.maydell@linaro.org>
References: <20201012153408.9747-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /wvK1Euovt6g

It is the responsibility of board code for an armv7m system to set
system_clock_scale appropriately for the CPU speed of the core.
If it forgets to do this, then QEMU will hang if the guest tries
to use the systick timer in the "tick at the CPU clock frequency" mode.

We forgot that in a couple of our boards (see commits ce4f70e81ed23c93f,
e7e5a9595ab1136). Add an assertion in the systick reset method so
we don't let any new boards in with the same bug.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
In the longer term we should make this a clocktree input and
plumb it through the armv7m container and so on, but for the
moment this assert() improves the current situation.
---
 hw/timer/armv7m_systick.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/timer/armv7m_systick.c b/hw/timer/armv7m_systick.c
index 74c58bcf245..a8cec7eb56b 100644
--- a/hw/timer/armv7m_systick.c
+++ b/hw/timer/armv7m_systick.c
@@ -202,6 +202,14 @@ static void systick_reset(DeviceState *dev)
 {
     SysTickState *s = SYSTICK(dev);
 
+    /*
+     * Forgetting to set system_clock_scale is always a board code
+     * bug. We can't check this earlier because for some boards
+     * (like stellaris) it is not yet configured at the point where
+     * the systick device is realized.
+     */
+    assert(system_clock_scale != 0);
+
     s->control = 0;
     s->reload = 0;
     s->tick = 0;
-- 
2.20.1

