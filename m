Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp2407944lfb;
        Tue, 7 Jun 2022 13:48:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxtogCJAufQJAOa5nb11K62LRneevfAonYgyFIwywsOXdWHMwwV5uG7LtNue5k/G+MzzOFt
X-Received: by 2002:ac8:5f14:0:b0:304:fb07:5bbc with SMTP id x20-20020ac85f14000000b00304fb075bbcmr3886919qta.317.1654634892304;
        Tue, 07 Jun 2022 13:48:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654634892; cv=none;
        d=google.com; s=arc-20160816;
        b=TMyvqLmd1EGJS9I/R74qisUDhUJynJuQBxepSvfoF+dIL+vcsgeNsRqM7zJvlWcs6w
         7Dc4LIF/lt+HH4nlqf4KAGxKtJQTw+IoGkqD7cA2SEq2qqrmcgR89fId/31SWA8zmPGd
         odh4/SLrU2bbSJfTueFsaZ+n+wslASff5AwQUmBv2kjRyK26j73xfds3tKK03abpknP1
         O0bIk84NsM0RXiBqj+Nzbo7Pfeymky0Le+QH7WNLNy35db6raEUP2UrGXjl7ESX1qEMv
         GD2LEUSMj/JRrQSrPcb/odFArej5OYc0NcaCJOHmuZM/0S5uKHyib2rBagDbCRD15t53
         s4BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=OVdCbtqKJB+BGb16fkMGEP1znoVx5B0GA093B8K9G20=;
        b=vN9PLeDkg03kt2ul8p3u28D+j1wJBqluVK2ZE6gxVb6YTlGZWWVqLLeHdRgCR+FLys
         Vlnu9V4XVQ0s/Q0l58NcqIQWVrJkZo5UkfwDkDZtF7sPb7Mazul5Y+ifJtDLmjHoIf5X
         LYyPPlamGaxNZQFtVMlDYo8r3U64ID0G5x35cb3kF6dwztxDt32qgjpOpug/Z8nKzBKP
         6vhsuc5qxOEQM8IR1GA+yRnVpFVZt8xIQGWQ3QLaEFIV/fG0/UU65FG8XPU6QjIoErNw
         WCoBwZ5neew0C4JzGjiS0YlKFg2fY1ZbdsrRloDyFpxlPTJLwFZStChLoraEKDe3kzGn
         ZjZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mu92fmZF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bq30-20020a05620a469e00b006a6c699343fsi3297323qkb.373.2022.06.07.13.48.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jun 2022 13:48:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mu92fmZF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyg7X-00025m-Q2
	for alex.bennee@linaro.org; Tue, 07 Jun 2022 16:48:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyftJ-0007lZ-Pb
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 16:33:29 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:34730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyftD-0007HN-Eb
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 16:33:29 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 mh16-20020a17090b4ad000b001e8313301f1so8460118pjb.1
 for <qemu-arm@nongnu.org>; Tue, 07 Jun 2022 13:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OVdCbtqKJB+BGb16fkMGEP1znoVx5B0GA093B8K9G20=;
 b=mu92fmZFW7YpiAu2rsNYFPmj6eW/FkAnDyXoUJQ89YmLNE3BIkOXrLebH1Fc8Bm8C8
 2QNSva+iExlPDk2cIbn4ye0e7g57X19c7u1qYqEt8lE2YjKjFlh0PWwBvegY0GJLVx7U
 1EvP2wAA6z9i8s2l/uJ3V83ueS2jqqon71TN2F5c6My6B6SNUf4A8TWVJNwuppTE7HiF
 3zaZiXh2Db3mPiTcuoZnTQphOAgWD4oyIhPjh0uK7P6nrAEN8l9b3bnWuv80vCe2kFd5
 LZmVuxYO+HmXeZlcIl30HlEZkEdBH8Ju6sLM8jyMfcvDeVu4fiOFoglSQu72gQ2ltJFs
 6XDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OVdCbtqKJB+BGb16fkMGEP1znoVx5B0GA093B8K9G20=;
 b=M6gJtsFDRRMzBa/d7rgRYiyYJ2TqwyarfizmJi1Ls1m/8r0hP2fVLlHOE3Gx/AiBUZ
 ILWYLhVtqr6APGsrHng2/5zoxR1SLcloZSRpvk2ZUfgTBmS7Bz7J/FpBv4uZ116yHL9M
 WgVq3cPI/SXgbNEMK2cUczyVdKmHsIrrEs0nzXGUVwQVF4qq8ysv//WFo5/de3GmnmY2
 HxSESXhXctHzRLCdrfcHRCJsRhG+DX9UCsnKiXGybOXwq9zEISgcK/NuZoqfOrIzbVm4
 AIjjYl8Knl1DHjuJa5RwFqwXR+1sgyBfC9PVRENrJ3fkFEniCeyiC9n+bOTKfpgaqCqS
 8nbA==
X-Gm-Message-State: AOAM530YMhVTvyERkLE1hqOl3XN3f9RKAouQY3GiRHwh/mJE7jauEbuE
 QA4J+dl8Vz/6QO27RsN576Tlow==
X-Received: by 2002:a17:902:da8d:b0:165:7c1b:6803 with SMTP id
 j13-20020a170902da8d00b001657c1b6803mr30618586plx.157.1654634002145; 
 Tue, 07 Jun 2022 13:33:22 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s22-20020a17090aba1600b001d9780b7779sm4227856pjr.15.2022.06.07.13.33.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:33:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 16/71] target/arm: Use expand_pred_b in mve_helper.c
Date: Tue,  7 Jun 2022 13:32:11 -0700
Message-Id: <20220607203306.657998-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kHwlgpkeTsfY

Use the function instead of the array directly.

Because the function performs its own masking, via the uint8_t
parameter, we need to do nothing extra within the users: the bits
above the first 2 (_uh) or 4 (_uw) will be discarded by assignment
to the local bmask variables, and of course _uq uses the entire
uint64_t result.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/mve_helper.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 846962bf4c..403b345ea3 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -726,7 +726,7 @@ static void mergemask_sb(int8_t *d, int8_t r, uint16_t mask)
 
 static void mergemask_uh(uint16_t *d, uint16_t r, uint16_t mask)
 {
-    uint16_t bmask = expand_pred_b_data[mask & 3];
+    uint16_t bmask = expand_pred_b(mask);
     *d = (*d & ~bmask) | (r & bmask);
 }
 
@@ -737,7 +737,7 @@ static void mergemask_sh(int16_t *d, int16_t r, uint16_t mask)
 
 static void mergemask_uw(uint32_t *d, uint32_t r, uint16_t mask)
 {
-    uint32_t bmask = expand_pred_b_data[mask & 0xf];
+    uint32_t bmask = expand_pred_b(mask);
     *d = (*d & ~bmask) | (r & bmask);
 }
 
@@ -748,7 +748,7 @@ static void mergemask_sw(int32_t *d, int32_t r, uint16_t mask)
 
 static void mergemask_uq(uint64_t *d, uint64_t r, uint16_t mask)
 {
-    uint64_t bmask = expand_pred_b_data[mask & 0xff];
+    uint64_t bmask = expand_pred_b(mask);
     *d = (*d & ~bmask) | (r & bmask);
 }
 
-- 
2.34.1

