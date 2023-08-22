Received: by 2002:a17:906:80c9:b0:9a1:ac8c:26bb with SMTP id a9csp632679ejx;
        Tue, 22 Aug 2023 04:02:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhY9HRWS/bt2ukHCkIL3LegPfGY0pRLxrGWn9dk5GhBQ9I/4HgahNsT2bsKXiS9/7KdTlM
X-Received: by 2002:a05:620a:f14:b0:76d:4252:95d2 with SMTP id v20-20020a05620a0f1400b0076d425295d2mr12493748qkl.39.1692702160874;
        Tue, 22 Aug 2023 04:02:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692702160; cv=none;
        d=google.com; s=arc-20160816;
        b=EShXDBOlabADTT5nwyaCWxuTc5Kfa27CIeYEZ5FYOZ3ahP6Tz9IG0TJ4+krav6x2a2
         9eeN7WlCWTUoWSDupVCMcSvenipNVFYOu0L+SqHwAXebto583Yx/th6HL+8fioNYM3ra
         z5sMyeK6PhTxu8vaV72nSII3YJt6OAeG5clp0m3lZgBTuwz0SlsB0YyFrOHVzdWC/9r8
         2KGfy39XyjiOfYF9f2MTaWfWBlkDAoDHyZeS3JpuJ0RHj2W7TNodXwj38M2FxIoSbBBI
         /LStxDBNiL1Ku7LQxX1/bPm1y+vhoVnAzeF292MEYBPlYwSxay5tJSvCqmxlU9DlHVtW
         ON9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Atmx7i5fRW8XnKx5xE4DtcYf6nuKJy8oiwMSi9RhaeI=;
        fh=nNMMnsLJfx+wwcL6Hpjyue2kO7c5wJkFUZ+p5f7qT8I=;
        b=z1V0ezWuHLNAYCq92/itCboYAOIPmwb6pwgkmyqlBPJhJiOe7TUIic67xMNkEw8eIM
         iDamaTFn+BikfkcU4Avk5hHNbBeqj+coDBVzXvzAMDGF7i7jBoloRS6SXe56IWl9nIlU
         CjZIhxP5Z2DXl7ljJorNjd1Tfl4hYs6FMB5yf/k2/+lFFHMEwnY6JHZd4NoIISUEw/gk
         osDbDHLRBxuZddcYHPsM4cAC9LbkvKBMSlAkhsfrbrD8f4ijEMECEFApRo4/gkzNAxRv
         n/xVA7hFlpNnYeEsq9JKws+u5PN2+sw12Z7CEu9SGt0oIZYyCmYqQl1O8W7Y9gcY+9oW
         VE8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DYorDiCC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u17-20020a05620a0c5100b0076d1ee7184asi6022277qki.584.2023.08.22.04.02.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Aug 2023 04:02:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DYorDiCC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qYP9b-0006On-DM; Tue, 22 Aug 2023 07:02:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qYP9H-0006Hm-8t
 for qemu-arm@nongnu.org; Tue, 22 Aug 2023 07:02:12 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qYP9C-0003L2-25
 for qemu-arm@nongnu.org; Tue, 22 Aug 2023 07:02:10 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3fe1fc8768aso41384955e9.1
 for <qemu-arm@nongnu.org>; Tue, 22 Aug 2023 04:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692702115; x=1693306915;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Atmx7i5fRW8XnKx5xE4DtcYf6nuKJy8oiwMSi9RhaeI=;
 b=DYorDiCC6zDmH3rqFYk/9pwrsrWWNUjRA/ght3xwkjFklcnQdpYFWvL+qkFjyrpzOR
 bK1c5yfkEibRK7NpzfOAI7nh64VO0CYbMTXp6fTu7y+Flpp3/QU3p+LHxGYrKwedSzl7
 zJiSiIHsiTVcETt2Yp96OddYsq4Qk/K9Zy2r/loZVCvWOV2ARk87BXNCru4ne7gqBENU
 CZmxnReZEM+cNSaQjFpYDUvWxFjqs4vvIOzQlUPGeRC5hvaqiijEnphH1Kr9cU16yaYh
 s5iBTFDwesNDNGKLT+EmYmZ0ymSc8Mic+yi84AlnpV6X5WXPnNiHvKuuO0OcJLGzJnir
 c3rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692702115; x=1693306915;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Atmx7i5fRW8XnKx5xE4DtcYf6nuKJy8oiwMSi9RhaeI=;
 b=J8io6kOkc18tX1/rvtFqWAdSW+AbOrFXATv19CeCvJPCJwlg6aYMKMQGWhLKop+PO2
 uaSMV6ONY/27u402P4ic7Gw8JRr5wrvl34MmeCK2jFBvOAQmaNKyey2W5UjbaJYJAl4f
 DKJWD18qes/O6iQ22um1YFNyKTEruw4dslP5EYEoBx/G5K/ns+EmwHxKZFM2ySNS4RF/
 wCgAbvfT+1A/VPEAqGIinP9cg6iXHQlCNDOovtiTM2ARGqxlgvnJpMQ0FTLHhNVw9Ptg
 cqzcpw/ot60TkypZRhWhgL5ebXMEKIrRW6dwPUPw7Wy+ZCLCXiP0O4C19AAG5SWIA/wd
 h+Mw==
X-Gm-Message-State: AOJu0YxF8AsXARnSLFwtnKEpL1Q0fJ0Zk6eARmudb4FR8UMfF74PXrCg
 Bt33S06T/1iu+l+WlTcETLrWVA==
X-Received: by 2002:a1c:7303:0:b0:3fb:f0ef:4669 with SMTP id
 d3-20020a1c7303000000b003fbf0ef4669mr7074980wmb.17.1692702115000; 
 Tue, 22 Aug 2023 04:01:55 -0700 (PDT)
Received: from localhost.localdomain ([37.19.214.4])
 by smtp.gmail.com with ESMTPSA id
 v6-20020a7bcb46000000b003fbb25da65bsm15668820wmj.30.2023.08.22.04.01.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 22 Aug 2023 04:01:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Song Gao <gaosong@loongson.cn>
Subject: [PATCH 3/6] target/microblaze: Use hswap_i32() in SWAPH opcode
Date: Tue, 22 Aug 2023 13:01:26 +0200
Message-ID: <20230822110129.41022-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230822110129.41022-1-philmd@linaro.org>
References: <20230822110129.41022-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: w61Mqwe/5LlU

Commit 46be8425ff ("tcg: Implement tcg_gen_{h,w}swap_{i32,i64}")
introduced the generic hswap_i32(). Use it instead of open-coding
it as gen_swaph().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/microblaze/translate.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index 7e7f837c63..83fd1161f0 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -608,13 +608,8 @@ DO_TYPEA0(sra, false, gen_sra)
 DO_TYPEA0(src, false, gen_src)
 DO_TYPEA0(srl, false, gen_srl)
 
-static void gen_swaph(TCGv_i32 out, TCGv_i32 ina)
-{
-    tcg_gen_rotri_i32(out, ina, 16);
-}
-
 DO_TYPEA0(swapb, false, tcg_gen_bswap32_i32)
-DO_TYPEA0(swaph, false, gen_swaph)
+DO_TYPEA0(swaph, false, tcg_gen_hswap_i32)
 
 static bool trans_wdic(DisasContext *dc, arg_wdic *a)
 {
-- 
2.41.0

