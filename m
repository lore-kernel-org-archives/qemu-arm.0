Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2969514lfy;
        Mon, 27 Jul 2020 08:46:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxG4DX8HCac2u3caRCObDBthkvk32uflTkg0PsUbeCDaDBmdc6sYJi4n+OhquoRi/awKsaP
X-Received: by 2002:a25:ce4a:: with SMTP id x71mr5816880ybe.434.1595864764452;
        Mon, 27 Jul 2020 08:46:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595864764; cv=none;
        d=google.com; s=arc-20160816;
        b=VGVekMtbzcA1Tr4vEX9/g7R/7A3Fvn910iw63e1jS+oz8ZU2f5uCkKGIMUFXET+i79
         mKi5/b8vXEoWW+zbtqx82K7Ro+KHTKXsFtZwkMff2V8jyR+DzWcom5L7rwWCDcVcng+C
         MrY0iGHCOH0RlWIKLoBUmWOXuMbpZJF1Zb0q4gS7UmqK8H5GlqdHHFTUyQNOWmz7EYbC
         c7KM3rRqy12ipCAOt6wAPm3rfRI3M3o+9xMHBBn+R+dZBrRUIy24NAlOfKWTtPfl8NN4
         L5zEJZheYSuiqgl6wzDDYWd6pQXEvKv1MCyys6giSbnXPQoebn/oXwZ6xx6eN831w9Wo
         V0GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=gRnzhB6CdonM/19XlgBuso003ocyxIuCfMZY1cNIpB4=;
        b=Hwok6JyHW8R4RKrMCbLAgxCIF876WxT4fuPGZAYAiii+QdMuKOqnFspDm7kmiBmd1R
         bCGvl8AhuhRQSO9GL5vKmAB3I/aNu+qqaroGiGTbA1njguhsmeWtPF4sRmlaY7Ms35Qa
         RPwcrgxly6pKaSxiAzUfGWiqjKEESranlM4qjSm07CvoMXZELinE2ohISehKKxB+EGzd
         8gu/X35Lm7KEDLegU+qxquCg5YHzdLIdvVMrQ/yXcxl1o6r3HBbU1tpIq7YFynqL5yD/
         9QqaJY54y042ljzlF2r8iTU1Z61YDBgDpklUjPJn+a5AeWxVl7qyzu5yMVrg9AoWaYtU
         OGlA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MHzhRB3z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s6si10260387ybk.476.2020.07.27.08.46.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jul 2020 08:46:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MHzhRB3z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k05KF-0001Me-RQ
	for alex.bennee@linaro.org; Mon, 27 Jul 2020 11:46:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k05K8-0001MD-10
 for qemu-arm@nongnu.org; Mon, 27 Jul 2020 11:45:56 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:40612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k05K6-0005lp-5t
 for qemu-arm@nongnu.org; Mon, 27 Jul 2020 11:45:55 -0400
Received: by mail-wm1-x344.google.com with SMTP id k20so7600183wmi.5
 for <qemu-arm@nongnu.org>; Mon, 27 Jul 2020 08:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gRnzhB6CdonM/19XlgBuso003ocyxIuCfMZY1cNIpB4=;
 b=MHzhRB3zfJVi4fQ+QEDgvHdNbwvR9+a0EezGwoqUqosz8anZPTHzDEG+gBO5+R5XWY
 gjdnHakmAW3TirOCIiTFiOpZHT0Qdoi+ngUCL0RYeLc28igoTGodweKV4w+fBN5YDOkW
 r6UkUvD53DHHz1BhG7yhXI79TdC3ExPi8MRkMTsRH0y6plcjqMIQdbyua1ZQrli/2Erl
 vk461tR7FHfyIcU/RHqHNQX1Ud3W247IfqO33Si+WvhJdOVb/2njakvrYsbL/AAx1zhE
 SA69B59RLuAQUmI6NRFjeOpFo8XdRmeB5F/ggk6oXIkeP2gf9CHgYWmXxTELr+8tp/KR
 K/Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gRnzhB6CdonM/19XlgBuso003ocyxIuCfMZY1cNIpB4=;
 b=hdr0AQb2iZgMd/effoNKv2sebjeMTol4pLZ4sC6tdojPD3SFBcXnvuOw3OXjoYJNuB
 ImJqIzCohF9pMAAWzo3vT2+iYks4kF/gfj3FWWjJMqGDhQEJzQpEgKNDgnG6QdwxO6Qc
 AplHGSOtU7cZ6ej9tLMv5SzeNhvzjbgRJcBVdCrxSYK7ZJSGIiGNR8wNGVbuLi7HqAVq
 fY/jFwORwQK0NFTb53n/CSUo8tnvqhneU1/3e03ReDrIC1i8c13Y5TeDw9HCj086FHMq
 NepsgZhD6sg/vxMiBwyVQyMguh0Kr6GaAMfEPodYb1mUjAQfUsghpWrkg+v1axcR5469
 waoQ==
X-Gm-Message-State: AOAM530R3YtI+kpaB0tVjwUd8nkgSKqCe6lNPtEpQzqc/1DnUPbfjNmu
 CS3adFAl7p9fcT3F/05XKl1bOF7hQ8+FbA==
X-Received: by 2002:a1c:2805:: with SMTP id o5mr21465619wmo.25.1595864752140; 
 Mon, 27 Jul 2020 08:45:52 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m126sm29155wmf.3.2020.07.27.08.45.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 08:45:51 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-5.1] hw/timer/imx_epit: Avoid assertion when CR.SWR is
 written
Date: Mon, 27 Jul 2020 16:45:50 +0100
Message-Id: <20200727154550.3409-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
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
Cc: Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bTEdVUx0C13p

The imx_epit device has a software-controllable reset triggered by
setting the SWR bit in the CR register. An error in commit cc2722ec83ad9
means that we will end up assert()ing if the guest does this, because
the code in imx_epit_write() starts ptimer transactions, and then
imx_epit_reset() also starts ptimre transactions, triggering
"ptimer_transaction_begin: Assertion `!s->in_transaction' failed".

The cleanest way to avoid this double-transaction is to move the
start-transaction for the CR write handling down below the check of
the SWR bit.

Fixes: https://bugs.launchpad.net/qemu/+bug/1880424
Fixes: cc2722ec83ad944505fe
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I don't have a test image for KZM so this is the minimal
obviously-safe change. I'm pretty sure that actually we could
add a "break" after the imx_epit_reset() call because all of
the work done by the following code is duplicating the ptimer
setup done by the reset function. But I'm not really happy making
that change without a test image...
---
 hw/timer/imx_epit.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
index baf6338e1a6..4f51e6e12da 100644
--- a/hw/timer/imx_epit.c
+++ b/hw/timer/imx_epit.c
@@ -199,15 +199,18 @@ static void imx_epit_write(void *opaque, hwaddr offset, uint64_t value,
 
     switch (offset >> 2) {
     case 0: /* CR */
-        ptimer_transaction_begin(s->timer_cmp);
-        ptimer_transaction_begin(s->timer_reload);
 
         oldcr = s->cr;
         s->cr = value & 0x03ffffff;
         if (s->cr & CR_SWR) {
             /* handle the reset */
             imx_epit_reset(DEVICE(s));
-        } else {
+        }
+
+        ptimer_transaction_begin(s->timer_cmp);
+        ptimer_transaction_begin(s->timer_reload);
+
+        if (!(s->cr & CR_SWR)) {
             imx_epit_set_freq(s);
         }
 
-- 
2.20.1

