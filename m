Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1337229ejc;
        Fri, 27 Jan 2023 09:55:48 -0800 (PST)
X-Google-Smtp-Source: AK7set+wk3g/MT9WnHaRvhXg4Ttkeyip56Wpc0Mq9timcuZP9x4X1kTw5UUkQCfblnRX4TT5pTzW
X-Received: by 2002:ad4:5904:0:b0:537:6653:dbb9 with SMTP id ez4-20020ad45904000000b005376653dbb9mr20579036qvb.24.1674842148502;
        Fri, 27 Jan 2023 09:55:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674842148; cv=none;
        d=google.com; s=arc-20160816;
        b=FIhPXpRLh1zaHoGEiazTt4Y72a1SiF7BW5bQYHqaNlOeQ6R1zJam57WeW5wer+EUlD
         QMa2Sy3NDvOY8PB8HFVq9HFbqGDJVdU8t2BHFgXj1pupMhVhbZAUqBgQX4a5bbOkyv0o
         Z36y201+/j3WsR4RmGI+7KVphVO+WOvFi92Smzs1Tkt9roOVoLHO+2LYTPDL4PuPDhln
         LsYRaIJoBdfLKZkZ4TXuRwA4cCK8IjlEiUhosR1jfbCTbFJ581oTbgP7FwJ1OBUwc42T
         kV3Qp9LkFBqt3ez0YCHLOwyBI8FBrtRYwx8mw96m6gkB+Qek4Xn2g45wd+DSCI/doyOp
         VnRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=qq/IZh/lNupdEfHfwuJJO8Jpf9afj0T8EShIAYRtDBc=;
        b=AHUOhqHO0o8fYZ8V+FjTdmruXRvvKKhrgMhLIgXN17SR4F6vpVhVtTbgrG/LGbP2Cc
         CLwaeEmtWPxSoY05uOMtANVAxiWWc6SuiNDKKENUi2sZVfZBIsQnkc82ohyd9hp4zrMC
         oqt/aWVg/s9YhQAkNbRtVoRuAgMPxBfnQ70o3gUKMKQ84twyVVhWYs0CwhpIpxOg/0hT
         mS6+6vVWE7LEDiJR9jSIPuPOwHzNn3tQpLQMbGOtlR7KVWR7PrlfWzJHeLk6kp+jF3PN
         xY+14Zk1+n0XTdaPhS6c9amw4xlXq1GcxXdM1rLo8Fue/52xwmkpQQxi4pmyoKKmIDXe
         xT1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RtT0sNPr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u124-20020a376082000000b006fec2c77e8fsi2854386qkb.481.2023.01.27.09.55.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Jan 2023 09:55:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RtT0sNPr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pLSwn-0000nm-1w; Fri, 27 Jan 2023 12:55:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pLSwl-0000mp-QG
 for qemu-arm@nongnu.org; Fri, 27 Jan 2023 12:55:31 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pLSwT-0005yj-9a
 for qemu-arm@nongnu.org; Fri, 27 Jan 2023 12:55:15 -0500
Received: by mail-wr1-x42e.google.com with SMTP id b7so5691454wrt.3
 for <qemu-arm@nongnu.org>; Fri, 27 Jan 2023 09:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qq/IZh/lNupdEfHfwuJJO8Jpf9afj0T8EShIAYRtDBc=;
 b=RtT0sNPrw5d8hsn24FqjnmlYl4WkIsiIpF2fd9lmBxUuvXYRc0H1p6D3+2HGV3reM6
 XKFpMCo+PZHDAUtAGKM9TpHhpg5L1+K5m8GmvxBjr0M5l6kbacc6gbOAYiB9+ucXB0lo
 uIXh/m3D4o/kLrLdaySzEAP6GDmQrN/+pJHx9jcj3IVR0zMJxoNEu7nTYJXBgEP+VfHD
 mtXvkm1KGPxEZQFpnYbu6XGk25u9L+loGUb+PTllqTeQ4fsEdLd19UF1hEknHbUzusOW
 emhPbQXNsmizbLmuTa1gHZj0rAIni2pQcq4ulccJmzz9+3cqldmY5xtX4wldP+Ny9jia
 TEjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qq/IZh/lNupdEfHfwuJJO8Jpf9afj0T8EShIAYRtDBc=;
 b=rz8ouAYM76hwPFpDtBXAmhIjzJtlUE/Y7bIRqoDvxOUsH+sDIwG4ZB11D2JZsbHeEW
 +kM5g+UEMyXhjUttlccaCMIUf9Px3o9S9Rs6X8dfjrEDS61jEwpnlZK4ocvLEP8F0Nnx
 2/mJ6iwYLA/pnwl0iv37VUiwQNSXgEzlgLMuBV1Uv3iOal3BPd0B5khWXGEvxJ8ZHXPj
 gpa/14u5AiPNGUB8HpAfGNjMR5mR6+eRNhGmUlJjwFrIyQ4ZM452/qfyAa/kehDFmfvX
 dQHKP8nSKFzIuNKE0jil1LOy/7EvcIbOEY+i9ss8Jyz2/LzBOE4WLI03YTEVbSQSa/yC
 i1vA==
X-Gm-Message-State: AO0yUKVipPyVCvVfm5hVlHaOwnsDlmBgIDmXx6YVJrM66fes3N1y6PrV
 RZLw1FZIrf8BVhCKMxroaU0vJN5qQGjx6lyO
X-Received: by 2002:adf:f68d:0:b0:2bf:bcab:8e20 with SMTP id
 v13-20020adff68d000000b002bfbcab8e20mr8089240wrp.32.1674842111747; 
 Fri, 27 Jan 2023 09:55:11 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l13-20020adff48d000000b002366e3f1497sm4545089wro.6.2023.01.27.09.55.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 09:55:10 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 01/23] target/arm: Name AT_S1E1RP and AT_S1E1WP cpregs
 correctly
Date: Fri, 27 Jan 2023 17:54:45 +0000
Message-Id: <20230127175507.2895013-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127175507.2895013-1-peter.maydell@linaro.org>
References: <20230127175507.2895013-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: mEJP94NDl8p/

The encodings 0,0,C7,C9,0 and 0,0,C7,C9,1 are AT SP1E1RP and AT
S1E1WP, but our ARMCPRegInfo definitions for them incorrectly name
them AT S1E1R and AT S1E1W (which are entirely different
instructions).  Fix the names.

(This has no guest-visible effect as the names are for debug purposes
only.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 72b37b7cf17..ccb7d1e1712 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7734,11 +7734,11 @@ static const ARMCPRegInfo vhe_reginfo[] = {
 
 #ifndef CONFIG_USER_ONLY
 static const ARMCPRegInfo ats1e1_reginfo[] = {
-    { .name = "AT_S1E1R", .state = ARM_CP_STATE_AA64,
+    { .name = "AT_S1E1RP", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 9, .opc2 = 0,
       .access = PL1_W, .type = ARM_CP_NO_RAW | ARM_CP_RAISES_EXC,
       .writefn = ats_write64 },
-    { .name = "AT_S1E1W", .state = ARM_CP_STATE_AA64,
+    { .name = "AT_S1E1WP", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 9, .opc2 = 1,
       .access = PL1_W, .type = ARM_CP_NO_RAW | ARM_CP_RAISES_EXC,
       .writefn = ats_write64 },
-- 
2.34.1

