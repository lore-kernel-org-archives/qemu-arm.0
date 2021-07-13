Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp595001lfc;
        Tue, 13 Jul 2021 06:38:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyc4tOn62/THJ7Ig41iDVh0O4YEc4rUJkj5SV0zMVRx2Qq+i9PXm9aJ85aMRVOPY9mHBKsL
X-Received: by 2002:a67:7dd0:: with SMTP id y199mr5991877vsc.11.1626183489517;
        Tue, 13 Jul 2021 06:38:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626183489; cv=none;
        d=google.com; s=arc-20160816;
        b=BgCtfzY3luNIv1LMCdj4rhDQZRz4xGr4IlNN7tcI8Tp7gEeYe86qDW7ttUWz4/XwpX
         OQpCGaYCVC09/z6mKtsXrOY7hEMOqIQm5E6lQSG6A7KTRmf9k0PaJOu8YEnbmSuj0GWs
         5/VF27iCkqLpBSMtSvftG3M4d1sqvWB18Jc+tu57L5bLCUiGqxTcM1U8isjxIERi3fKz
         MpRvUKmC15V4DNa2mw8bHn5SvM0tJqV1JzMp5Le976GXXPR/csGv03W7qgvxRtWDUjEp
         /1sEg6ekrir/jlNvdaEzbB5cGD1eTp9qQalgVZtOQG5pvtnOmbBWoBk2DuBhVp6XdXIn
         Isvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=5FuhIcPQ8dqLKfYvxbInQRrJHkLhIPar3p6mkfICIW0=;
        b=kavz8kMNXC2XkWQJEouyYuXFmyVR3xUWgGqIHDZ7/eYdBotv1E9FJWfd7+JwEMcbxz
         cjl3LwGyR/7ac0ea0H3+7Br2BxzwzKYAHD3Jlj2P5VrxsOCCGEMdrzej/ZoEWcqI26yr
         FLLFLmw2QLCtFByy0Lq6iAvwWPlLlBddOQuHSuTdDdjTloPSeGyJQSmk0pwSYpQxtocW
         7Q71dg9h/9erWn4fTYDFZGhmZUdHNyuFHkLa/hsHoVSa2UeiDnmCOdpTf2bWXy1YNLGw
         Ysml9up9cDbRyfRea2npzIq0Jrf2TAX915wxnyD2osY856FukHa2EiResW7bUFVTg2VK
         6PjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XJhNEyiu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u196si1239402vkb.14.2021.07.13.06.38.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Jul 2021 06:38:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XJhNEyiu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m3Ibw-0008HH-MW
	for alex.bennee@linaro.org; Tue, 13 Jul 2021 09:38:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3IbN-0008F3-J1
 for qemu-arm@nongnu.org; Tue, 13 Jul 2021 09:37:36 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:36508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3IbL-0003aZ-Jc
 for qemu-arm@nongnu.org; Tue, 13 Jul 2021 09:37:33 -0400
Received: by mail-wr1-x42f.google.com with SMTP id v5so30524934wrt.3
 for <qemu-arm@nongnu.org>; Tue, 13 Jul 2021 06:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=5FuhIcPQ8dqLKfYvxbInQRrJHkLhIPar3p6mkfICIW0=;
 b=XJhNEyiucku7u8UM6V38+9h7Q5Hyad6ta8uLbCnbwn62ovCSz7KmKa7g095ws9Z8HP
 phq8j57Ms7ZEiSPy5i3GoP2UJwiYYizZywJxZ4iTt/ijI5edjMbpV5HUY5uGmzqCbDK9
 Xdf7rqAXaKpY4+Nvw8yWCmT1qhCxvneinW7Qe2W50JKcMLET3mJJELcfSq5aOAHA3jBr
 TtmZnoK7Qs+JgylXrPEKn90AUeLVAPfXCobXXoAP64C3wp2nyVnr1mFwsevyGjA/AA52
 3VzhodbApH7eC8WME7j+BD+jZShRai0UTaMlm1q0f4wU/eyjWfxhFqrbyF4jh6+8CpGc
 n2vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5FuhIcPQ8dqLKfYvxbInQRrJHkLhIPar3p6mkfICIW0=;
 b=GuG/+iLOn3EFGlHs+NHDxg+2HIMAmSXl0xSzlvflfs6ntMJ0IqEwCSST3E+GSYVkc+
 +I/t+6g/x6EHa+6deOehoCzgxUqcyce/Z5vkTsFX59O6NkIf69504q/FwOPYO5TUdVAi
 Kn/JUgVH+Qhe7XNUre4o4DZ7SDSKTjZPqtFzyrMTzVkuEXD7UKHszuzn/193hXHvCMEg
 qalE+tGg4lnJ/pS6iA7gN3hwf95yab7QXiOlnSl4DwsCMYzAVXAD1jz0IsJRAMTM3PaS
 eW343c5k0HCsM2IR1jcjdAPQklk5V7Uda26yEGMpD9i4EbqU01ja3LomkF0RJ9WD2Xfj
 Z9ww==
X-Gm-Message-State: AOAM533q0fcp9dmjtS3NxzfGdemtGqzx1BUN2Z3P4ym0+fbSvMlgi40T
 m+NA9Csgs4WyVCLlucrtwnLA0x3bjbYOvu46
X-Received: by 2002:adf:de84:: with SMTP id w4mr5876809wrl.104.1626183450436; 
 Tue, 13 Jul 2021 06:37:30 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j6sm9827443wrm.97.2021.07.13.06.37.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 06:37:30 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 02/34] target/arm: Print MVE VPR in CPU dumps
Date: Tue, 13 Jul 2021 14:36:54 +0100
Message-Id: <20210713133726.26842-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210713133726.26842-1-peter.maydell@linaro.org>
References: <20210713133726.26842-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7/0sZdy5q4jo

Include the MVE VPR register value in the CPU dumps produced by
arm_cpu_dump_state() if we are printing FPU information. This
makes it easier to interpret debug logs when predication is
active.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 9cddfd6a442..6d6b8888037 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1016,6 +1016,9 @@ static void arm_cpu_dump_state(CPUState *cs, FILE *f, int flags)
                          i, v);
         }
         qemu_fprintf(f, "FPSCR: %08x\n", vfp_get_fpscr(env));
+        if (cpu_isar_feature(aa32_mve, cpu)) {
+            qemu_fprintf(f, "VPR: %08x\n", env->v7m.vpr);
+        }
     }
 }
 
-- 
2.20.1

