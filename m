Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1168043lfa;
        Mon, 12 Oct 2020 09:02:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJws/wxkeTDdmciq4UA7JqhrGhs54NXH7AxQhCQQMt5ZewWnfKcKEeYQ0a9CTrKVG6gcMC2w
X-Received: by 2002:a25:d8c1:: with SMTP id p184mr5808254ybg.14.1602518576738;
        Mon, 12 Oct 2020 09:02:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602518576; cv=none;
        d=google.com; s=arc-20160816;
        b=DoICuXltItToJHRClkJSTraLE4wx3YRLdThq/s/h76XIP5z5yMT9mJvmFvju3rxGQ6
         6Cuk/DhbiRdZyOrv3EIllSdSuNwuRVHxmCY4fNssZn17QzdnEsb66Y0lSSWLqAIKUge7
         6RhEiv4zuluDjOegZTRfMi1apZ1G58jauPLAywMiFeMLuBEQqXcc3wp2oAH2fBBtbHBG
         C+XGIMs9RZWX/5FqXmM3a7PudVJq66/xAeuVhJ5VWq6f4Lxn7boT9eP+Imm0UZJNOf6G
         1u2APzjTqkMeSKg9Pfe+UftHyDONGyMfI9SXXbbEUEkCLa02df7q+keWSfGWec9et58m
         pwnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=WGIKi5XPkewNmleyCkypYY54M4r98inEKdT2tfEXL/0=;
        b=DTSlYZrbp96M8ivRuiDf7KXQ6XR3GPOrcmYQELmHQpbo6zH2UTAcEJw+NTdURmaf3p
         U6EUjDnf1bc7YOYHA4xkoy98xXIcnVRG9DQjbwXRgWgGX4oNv7o5cG4syTFky3NcrcRy
         qVTZtxMspGq5bjpJkMdYzZd0Jfn3mXTejUazH20N/A/tcllSxfWAbLdr8U3+1vnC5GKu
         P8ZXl+4EFEbLinz9cRTbEyyG0xitFXxRhCzFSrFDPLmiY0DREAZbAzKIlutsWM6yXZOc
         tyqyH5T1L6VZL59Zg/nsvr43FiHzX0zPQdnbAtI1lqlZRJc5D7yURRnSLuFcVOBC1Waz
         zGVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TuAH7i1O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r12si17424551ybc.497.2020.10.12.09.02.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Oct 2020 09:02:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TuAH7i1O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kS0Ho-0003B1-0J
	for alex.bennee@linaro.org; Mon, 12 Oct 2020 12:02:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRzti-0003gc-Hz
 for qemu-arm@nongnu.org; Mon, 12 Oct 2020 11:38:02 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:40891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRztf-0007m8-A4
 for qemu-arm@nongnu.org; Mon, 12 Oct 2020 11:38:02 -0400
Received: by mail-wr1-x441.google.com with SMTP id h5so9621705wrv.7
 for <qemu-arm@nongnu.org>; Mon, 12 Oct 2020 08:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WGIKi5XPkewNmleyCkypYY54M4r98inEKdT2tfEXL/0=;
 b=TuAH7i1OAguRSfZl7FwM4jqebo4oN1y474tB9WPZLLndOHpeBnzxAN7AdzrMJss4qy
 wtZqwvH1YKdk9TJd3d1+fKX3v/z+/ghmbViE38Uxj39GgdNluU1jX5hZhyCStpqLPss2
 tAhuweaAIgiscXv/y51GHcQZjhpx1ManRflBHoBOBhKMelI+SdGRV5gWEfU2a5Ns4gs2
 VROVmEjD/3fw45vBGf3BvtgNCcXYpASfnA6zmSoxKX2p06d6Wnk636Z3Lb9sOslftn4N
 BFo4N59jAy4hFBgRLi0Kj9g6BqjxmtzwW/03kN+faYDDv2cxGfN8qQ4ypkbzklpn8Qne
 NVMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WGIKi5XPkewNmleyCkypYY54M4r98inEKdT2tfEXL/0=;
 b=e6N1Q8AVwKthxXUHThOLGFUbK6N1xHgtUGbISAZenpSl9qONAXy1m2brVqO9rzMmxY
 L1/FOmvxuY0WJRh7i2TaWAoO4kuULUg9Qa33y2D/lRUY26eD+l3I+FggoaiQbNHZ9v+n
 wsT7izVz/24DaEz88DRtLdKsOiiF9S2/p/hCw1ECTnla4QEvrjHOIgabtkhFdl2S5nXl
 kNwwf6ULt7xurO490HBeLK+0ySrjcbx0H2hFAG6xBEuRGO+wKoWvL1ZD/j/X3DtlVHyt
 ly3FiDwlUk/q36NRPv6bKBrhlq4Jxh9Ex5zIj7JVRYz7sgxfAkO1kzWc6VDvY2kAr3Tm
 mtvQ==
X-Gm-Message-State: AOAM532iSmT/D1u/YJHrINYQ5i2VaFJbaqPFlosYuAiGIKg7/6G7eQyD
 8i6SbR/69X47mn0r1jhb9VP1kwCWwcV2TvDp
X-Received: by 2002:a5d:6a51:: with SMTP id t17mr14303446wrw.80.1602517074090; 
 Mon, 12 Oct 2020 08:37:54 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y66sm7095961wmd.14.2020.10.12.08.37.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 08:37:53 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 05/10] target/arm: Don't allow BLX imm for M-profile
Date: Mon, 12 Oct 2020 16:37:41 +0100
Message-Id: <20201012153746.9996-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201012153746.9996-1-peter.maydell@linaro.org>
References: <20201012153746.9996-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x441.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PEYw9NIA+L6L

The BLX immediate insn in the Thumb encoding always performs
a switch from Thumb to Arm state. This would be totally useless
in M-profile which has no Arm decoder, and so the instruction
does not exist at all there. Make the encoding UNDEF for M-profile.

(This part of the encoding space is used for the branch-future
and low-overhead-loop insns in v8.1M.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index a7923a31b56..0c35efb1014 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7880,6 +7880,14 @@ static bool trans_BLX_i(DisasContext *s, arg_BLX_i *a)
 {
     TCGv_i32 tmp;
 
+    /*
+     * BLX <imm> would be useless on M-profile; the encoding space
+     * is used for other insns from v8.1M onward, and UNDEFs before that.
+     */
+    if (arm_dc_feature(s, ARM_FEATURE_M)) {
+        return false;
+    }
+
     /* For A32, ARM_FEATURE_V5 is checked near the start of the uncond block. */
     if (s->thumb && (a->imm & 2)) {
         return false;
-- 
2.20.1

