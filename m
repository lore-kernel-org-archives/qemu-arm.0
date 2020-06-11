Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp1497063lfc;
        Thu, 11 Jun 2020 07:46:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJye58ZCfw0nlOdpnYTUx0bHbyacL0J0WeBg+RKKofSOSRhIxRixTzvHNLVpItoSCv8vBM/l
X-Received: by 2002:a5b:4cd:: with SMTP id u13mr3793206ybp.323.1591886764271;
        Thu, 11 Jun 2020 07:46:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591886764; cv=none;
        d=google.com; s=arc-20160816;
        b=A0HWslaPI5VwPXz29VFlNRsSJaKDGAiPHHuTsfD0qXYb5HOq0txA1wClQD+SlS2huY
         JOkSVjUKOiJQPBHcmW+6c+2n+ms6gXj9wu0wD5mkRlWYA3aFpNiGWJXbdcpFpu7BMT42
         xOJYUmk/CJ7Y0ORAaYnmagqav3Mb442+J4nKMbIonmH+ZBrTU+oatV/f3VJsY+KBe2xP
         +aS1Tm9R2GQTX9uqHh0/Uzoz/JKjl7Osh+rOUQ91Uopi9StmzSeEAp0Xrby/sJA9kDbp
         FTfy19S6ZWtsYR66KNnLyniXXZ+59Q9xh7gwhakOakj2sRlTFwcbIs917RcF63pTsUvd
         GWEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=mYq1MqrdFl5JxHZzgiamWFM2bwNZOEqA/8m/GF3wHr8=;
        b=qilw8MRoUVriO7LA4OILTpj0R5lEAi4QdJHYLw/CDqY5mAD7vagUoTCkm604cnJlj9
         4LuslYP4VDAKNI+LUzFoafJG8wLJboTPM+5P1GVo6q1m0LLq+0G82v7hJmEvyZP7BY8T
         FfHqtmHvQL60QcG9HPNWMy0g4P+bqucpmGw0NiNxlECD/819O9L/SnLtn4tsDm4qF9Vn
         /3JCab3RmbBKDM/MWs522dztwLUKGUUfTo7rTp0zxdLB2eswTQ02+ydwtXUnPdfZkIe6
         J5uQicoGpAwSI+MveSp77r8oGQdvJUeBmwvB6UizxpI1Eep3ddfti1XhZJ6VSqLAFD3p
         Izzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IROQ5Xkq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x6si2431846ybg.57.2020.06.11.07.46.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jun 2020 07:46:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IROQ5Xkq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jjOSx-0001Sk-Ad
	for alex.bennee@linaro.org; Thu, 11 Jun 2020 10:46:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jjOSg-0001Px-JG
 for qemu-arm@nongnu.org; Thu, 11 Jun 2020 10:45:46 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:37018)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jjOSd-0003n1-H4
 for qemu-arm@nongnu.org; Thu, 11 Jun 2020 10:45:46 -0400
Received: by mail-wm1-x343.google.com with SMTP id y20so5317868wmi.2
 for <qemu-arm@nongnu.org>; Thu, 11 Jun 2020 07:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mYq1MqrdFl5JxHZzgiamWFM2bwNZOEqA/8m/GF3wHr8=;
 b=IROQ5XkqbQYzopH9egWOZ1AtCMddqDhN97eJ6lhyA5NBIAzmf/WtiFjGqD+Ykx3aJc
 CcCFdYy4SB83bEdAlB3201KVrUvJTN+ixiQUcpTWumSFy0VUL1sI9Bccpeczi4H68+KQ
 VgLbSpt7Crp3NO0FKszYsWuzuYvuJECw+SxiB+PC3q6A5DRsjRKxQuR2IhQtHDSrM8G/
 aEv95BK4qzq0Y0VOTGuICAiNYdC6WYJWHp0KLzDmGx10m2pGZVSw3LEctgO1ZwfXGMiZ
 QNbWKTCbR3IfQTmE8Jt6cCF0b81fKBm/WSNgbMHImS5Ztt+rH7I3Ozu0Y12H1V8aU8xV
 xgbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mYq1MqrdFl5JxHZzgiamWFM2bwNZOEqA/8m/GF3wHr8=;
 b=KFSkYhkq2o1lYWrhjhaRw5tkBMJMRWEIILXGp7FY0jlNUOFHrbA9wpfhAshcdV2O+L
 lKeQPTunWQ4brpJxEwbDrs15UBGkOEr2Xk6W4peGtiZFIj1u6+YffL9xiy/TgfXSau8S
 SrbvH5sZyf3Ldo5rFTo8Ajt9er11gbHE4e526VrGQtgNbkYuMN5zB9ouUPHVmH0+NyMT
 zOBqF2dY5T+/G3NCpWvN0mQJBrNmogmfyrT4C+RRMg5ntwJYC9X41PRRomU77ZZM6e+o
 5JX81gGJqhhKuzOVP8j+ntPTYUirQsHygauGaFEiXIvHnGJOD5LcFR/jvbCW7m3T+hO1
 85qw==
X-Gm-Message-State: AOAM530pN/rIeLPUi+s8DZSJpe0FMqnQR/waM/1AjkSzXgrdQozwRvJm
 ElwO4dDAmNKD1EsD8bHsaxiAHq/Mb2J7+g==
X-Received: by 2002:a1c:4d11:: with SMTP id o17mr8298069wmh.37.1591886734428; 
 Thu, 11 Jun 2020 07:45:34 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id h18sm5271658wru.7.2020.06.11.07.45.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2020 07:45:33 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 01/10] target/arm: Add 'static' and 'const' annotations to
 VSHLL function arrays
Date: Thu, 11 Jun 2020 15:45:20 +0100
Message-Id: <20200611144529.8873-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200611144529.8873-1-peter.maydell@linaro.org>
References: <20200611144529.8873-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-TUID: zVubyTQY6/0V

Mark the arrays of function pointers in trans_VSHLL_S_2sh() and
trans_VSHLL_U_2sh() as both 'static' and 'const'.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-neon.inc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate-neon.inc.c b/target/arm/translate-neon.inc.c
index c2cc10913f8..7c4888a80c9 100644
--- a/target/arm/translate-neon.inc.c
+++ b/target/arm/translate-neon.inc.c
@@ -1644,7 +1644,7 @@ static bool do_vshll_2sh(DisasContext *s, arg_2reg_shift *a,
 
 static bool trans_VSHLL_S_2sh(DisasContext *s, arg_2reg_shift *a)
 {
-    NeonGenWidenFn *widenfn[] = {
+    static NeonGenWidenFn * const widenfn[] = {
         gen_helper_neon_widen_s8,
         gen_helper_neon_widen_s16,
         tcg_gen_ext_i32_i64,
@@ -1654,7 +1654,7 @@ static bool trans_VSHLL_S_2sh(DisasContext *s, arg_2reg_shift *a)
 
 static bool trans_VSHLL_U_2sh(DisasContext *s, arg_2reg_shift *a)
 {
-    NeonGenWidenFn *widenfn[] = {
+    static NeonGenWidenFn * const widenfn[] = {
         gen_helper_neon_widen_u8,
         gen_helper_neon_widen_u16,
         tcg_gen_extu_i32_i64,
-- 
2.20.1

