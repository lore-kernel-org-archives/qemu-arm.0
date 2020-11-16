Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3834357lfb;
        Mon, 16 Nov 2020 08:13:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyhx++PdzxpWO7yZurk/uxZw+NV81Y9okPt0gP51FZVY2fjnDKUNqHj6KEbhbdr33rfakVv
X-Received: by 2002:a25:cf95:: with SMTP id f143mr19085951ybg.216.1605543203052;
        Mon, 16 Nov 2020 08:13:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605543203; cv=none;
        d=google.com; s=arc-20160816;
        b=gnM9l+SSGV/o+48fl9HZQdcBlH0dZC5rSlAgEJJLpeFVUT2lK0oALjYB1R79XJ1MTB
         m78zn0TLKbl7yiVjyIvgPLWqta7bgWQpT8V8PAs1CwkGDShSWx1DSDCHJA5SBuORUwJu
         yV2ndfVqTq8SxGgv9X1pZ9AesoOKQchigYoUyHqhfOJiMFUF2HgicHKZ03K6oya8UIcW
         VyxZ96M3YwHw7osoqD54yg6KwQmprjactpM28pxkhxVoUItu8ccsL009CYku98pn8rg4
         JuZNK4YCrj3F8+gZvNPw29XD2tqxKzQZaouqWQYBkxQuAzgyF2MxLMYtqOZBBVFTG/Jx
         myRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=1E4/N3ngk9+sSJeoqjEEgug8EpMJh/6B7re7b8qvv04=;
        b=YbjW4tuEqIeAMSC34GU1SLsil4exuGvoxyKYAlKeFX/eELkQXTZ3bgri/03JStlFJE
         rfljR0E+sd3IDj/fsZn82Q98UB8jmumSEzzK81Fy3oTh8YBHC7wG3LxfmCX9TuVpcO8U
         kN/GGrTlSq+t7SWcDZ1RKK9cur+U3pTFEx7k+GfFbViVIcpnp/9pzyLUn/lp09Yug/yS
         AAXeTTRYA2m0XYz+pbvD7hwSZK9pdCIBYbWt7AdNf3kxQYhiOzrGUUBozR2epmSDn7St
         jeDLva5HZyOhhLsFIksPP/JVBcXKpD8kReLxonMqvUi2LZAVfFnAxozqH0wX6xWTyk+E
         urqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Sb3nrN35;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p15si20600283ybl.369.2020.11.16.08.13.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Nov 2020 08:13:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Sb3nrN35;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1keh86-0003zl-Gb
	for alex.bennee@linaro.org; Mon, 16 Nov 2020 11:13:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1keh3b-0008Nd-IO
 for qemu-arm@nongnu.org; Mon, 16 Nov 2020 11:08:43 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:38453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1keh3W-0007oJ-Rq
 for qemu-arm@nongnu.org; Mon, 16 Nov 2020 11:08:43 -0500
Received: by mail-wm1-x341.google.com with SMTP id m125so12832687wmm.3
 for <qemu-arm@nongnu.org>; Mon, 16 Nov 2020 08:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=1E4/N3ngk9+sSJeoqjEEgug8EpMJh/6B7re7b8qvv04=;
 b=Sb3nrN35EVnFe9mcgvWo0J33bwUJzveB6RdE74FyMIyw4/gglb7KGiaTlMlcnE3Qda
 /qEMzMftj3MG0iBYOlzAnGS2srbtlV8ZLZI8KZh+oVgKK6V9yslU9/Z8YiGTICgePfyS
 BWPtUjxgL0XcfrtC6ZDMW7w3Yc8MGRheBcLXeRg7ayhfRzO6yqyfHsITFj9ugX8ia+dE
 JpXlMYcEAzAxAjBM8y4lz5R0+hVRzD3kvJK+t2Sf8XFkAt+g9dNTznlwYPrTYXan6FuN
 IdTaC8uMm9I1A5sOESzySaKLcG944O9/xhNq0qBA0/8oQ/xMg71XWVAA/Shv9oERB8i1
 CHCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1E4/N3ngk9+sSJeoqjEEgug8EpMJh/6B7re7b8qvv04=;
 b=XLmeaTlhlf9fjYwluroB6hPc8msAS2HpvaI4weOjPumRGMRgnxyHZIkQtUOtTBkbbg
 m2Znjd9MrZiKnUm35rL3MbPzhXtOKXFxjW1s+OBrPHGmlCgNzC6Rz0BnNB2Qg/L7B3HK
 GFdN86Pf3a3YQVqB+muTKf6KZ7ejRlgAnIJyOcUO3SIU0ipKMixJLMXLsqFnQ+IXsoey
 L1Tggepr11k8ukvjOPcKUyyYKo1qWikfbOC7teYP8zdDMH5JscnxhDvnsEPV86IF7fKX
 yGrYBZLE7oQzrxxoKrgJ+u4SaoPOKnevVuBox+wPkbP3rXFRO5mzWtZtpx8TJ5Q6rr9n
 Y8qQ==
X-Gm-Message-State: AOAM532KQ6L4zNYuBfX4v7MDDPPtVwlDZSZNDhtVezUgNglYm1thJPng
 Ie1kOM4EaqqbEzzr24GuzdmcTdgyKHyFtQ==
X-Received: by 2002:a1c:2e48:: with SMTP id u69mr8327523wmu.30.1605542917115; 
 Mon, 16 Nov 2020 08:08:37 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g20sm20116975wmh.20.2020.11.16.08.08.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 08:08:36 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 03/15] target/arm: Don't clobber ID_PFR1.Security on M-profile
 cores
Date: Mon, 16 Nov 2020 16:08:19 +0000
Message-Id: <20201116160831.31000-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201116160831.31000-1-peter.maydell@linaro.org>
References: <20201116160831.31000-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x341.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lfdXfrXfNTdV

In arm_cpu_realizefn() we check whether the board code disabled EL3
via the has_el3 CPU object property, which we create if the CPU
starts with the ARM_FEATURE_EL3 feature bit.  If it is disabled, then
we turn off ARM_FEATURE_EL3 and also zero out the relevant fields in
the ID_PFR1 and ID_AA64PFR0 registers.

This codepath was incorrectly being taken for M-profile CPUs, which
do not have an EL3 and don't set ARM_FEATURE_EL3, but which may have
the M-profile Security extension and so should have non-zero values
in the ID_PFR1.Security field.

Restrict the handling of the feature flag to A/R-profile cores.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 07492e9f9a4..40f3f798b2b 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1674,7 +1674,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         }
     }
 
-    if (!cpu->has_el3) {
+    if (!arm_feature(env, ARM_FEATURE_M) && !cpu->has_el3) {
         /* If the has_el3 CPU property is disabled then we need to disable the
          * feature.
          */
-- 
2.20.1

