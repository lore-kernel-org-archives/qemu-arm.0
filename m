Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp1370578ejb;
        Sun, 11 Jun 2023 01:59:46 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5HU4kE6VEI3U29J0dvYmgEM78UhC1yPtWb0amHlHcVzQue95LGEx8o2deMFQvEl1dfBQUg
X-Received: by 2002:a05:6214:2021:b0:625:aa49:ceb0 with SMTP id 1-20020a056214202100b00625aa49ceb0mr6600722qvf.57.1686473986711;
        Sun, 11 Jun 2023 01:59:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686473986; cv=none;
        d=google.com; s=arc-20160816;
        b=ItxhDEM6+ChIDZfTnA76O5Fd3vL3ngB0hP1aoopyHDcQdcDDerJqZ0iHOIt1+hby//
         xFrVTFd1n6d8cYFwo10wRaASbtHUW/G7Qax3H840mhlCPJKZze7HHVaxNIxP9GXG8yjQ
         1xSG33iqVT5BuQfwf+ls7TL6aQKoi9cpX2XFOvPterlrnrJbKUEDfTqR6znFj/a6PdXO
         NIb5wNLCCii/+U4sDz4nM2USVvrMdh4AANG576jX67v88gtLbUxXl82ZMswa948FrH+L
         1uAZXD/o6g/aY9m37xCUgdK/imu5ALU0l7PO5317PS6xrye9uQqryNwZ9AeOvuSiFjVQ
         ad3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=VDBF5f6g3ss6zXACl4FvMit7Sn+wQR849UpnWHsvJfE=;
        b=nK9sj1SsS170D/z45iv5ETy3Bj+GFhj5lSmo0VCTnpTCtZB/OTIyrVibtsIV48SCk0
         8xW/bcNizgVZt3LtVaZ7dpX31hTTt1jd7D3hVdUTFiqqRfVvSlh8+g24Ulm/qMphpQ9y
         lNvCJ/VxZfamqcBxQLz2bFA8wvDHLFASpwHH8wofxclDcZc1z5rbyUDKt+bywEhCuhOM
         2LnCAEhFDC+7AlGdoHUEfZmhVCCDIUqdd+iEdAa2ZqjmsnUi6IBaGichbvBtgJ06c/K6
         +W2GEIexiaeiLMF6Rqr7bB7VQHK/HRxp5skLkUuzscL9oMXq1iWMABOB5zXrZ+kC4clI
         mf+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jCg5Bxq9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gv5-20020a056214262500b006261ac14745si4663384qvb.440.2023.06.11.01.59.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 11 Jun 2023 01:59:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jCg5Bxq9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q8GvB-000206-Vy; Sun, 11 Jun 2023 04:59:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q8GvA-0001nu-55
 for qemu-arm@nongnu.org; Sun, 11 Jun 2023 04:59:36 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q8Gv7-0003hA-Da
 for qemu-arm@nongnu.org; Sun, 11 Jun 2023 04:59:35 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f736e0c9a8so24006625e9.2
 for <qemu-arm@nongnu.org>; Sun, 11 Jun 2023 01:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686473972; x=1689065972;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VDBF5f6g3ss6zXACl4FvMit7Sn+wQR849UpnWHsvJfE=;
 b=jCg5Bxq90cv1t3gOfp2ZLsP9JY+o64XQK7AlXCqdMXBJ7i42Uc+C9EekEyJER5zcRC
 IJeQWHzBuewmvhU1VhIW0/OTf2Hy70yjlg7yG4ip5qn8kTzKgX3cL3tL7phYvbRo3eNg
 OXiRBKpfkwnQvALnIYxjGI6z6t+TfV7yT9fgSwV2qJD8ICRo/Vyrropi6f/nNBVZuvv4
 GCYRI+pnxCCPIUOmubBHSghfBA33xnZJjjW3CfceHb2ArNhfhA3V6RwMpIryiLf1i+qG
 tRa/BLzqij6KMC7gxy+zuAX9QNzMGhI5fgiTrzwyVccSji2WD8ZQoOPxxpaQM51BheG8
 9kpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686473972; x=1689065972;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VDBF5f6g3ss6zXACl4FvMit7Sn+wQR849UpnWHsvJfE=;
 b=RLfn27s5xZBKwpghfzqtF9ESfYCSGjDMBod4clN3GhLm/RT3SmEDzmn0XcIakLBTVs
 sTf9rzGc8jKVNUDCvHXep20NJh05sh31m29NP4SSgCeKD7cou+q/zSB8GHRYQ+JZJpw5
 iW0BhLdF5pJHGAQ6CdjKa3EIy4K3YEjtYvdonvA6/khHMR6AnZyTrEZ4ickxYeif+AGU
 CSl9C8L+kSmJO0xir1CMl5m3/VEw+DXijHGc08Q60Tl6YUjGjJdJ0rlnXteg9VrmvO2t
 j8WoGKi80ddi1/vu2U96JhC7yAAZKdjsWqv9SWO/SUnbwm8c8hSq/iMPlpGKaI8eZHGS
 irkg==
X-Gm-Message-State: AC+VfDzSwUjoeNYT1gapNCBSfASD2qfPlr0+1ZGbGSuSTK2jiNk2cgv1
 kjv8SbpZia5qX/myS6+2vnyq5A==
X-Received: by 2002:a5d:4c4f:0:b0:30a:e4f0:40f7 with SMTP id
 n15-20020a5d4c4f000000b0030ae4f040f7mr2637709wrt.2.1686473972018; 
 Sun, 11 Jun 2023 01:59:32 -0700 (PDT)
Received: from localhost.localdomain (91-163-26-170.subs.proxad.net.
 [91.163.26.170]) by smtp.gmail.com with ESMTPSA id
 m19-20020a7bcb93000000b003f7e75b053dsm7908106wmi.34.2023.06.11.01.59.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 11 Jun 2023 01:59:31 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 10/26] target/arm/tcg: Extract VFP definitions to
 'helper-vfp.h.inc'
Date: Sun, 11 Jun 2023 10:58:30 +0200
Message-Id: <20230611085846.21415-11-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230611085846.21415-1-philmd@linaro.org>
References: <20230611085846.21415-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: i/ixyBMLfTdl

helper.h is used by all units, but not all require the VFP
definitions. Move them to a new header; the next commit will
remove it from the common helper.h.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
TODO check recpe/rsqrte/rint* are VFP
---
 target/arm/helper.h             | 155 +-----------------------------
 target/arm/tcg/helper-vfp.h.inc | 163 ++++++++++++++++++++++++++++++++
 2 files changed, 164 insertions(+), 154 deletions(-)
 create mode 100644 target/arm/tcg/helper-vfp.h.inc

diff --git a/target/arm/helper.h b/target/arm/helper.h
index dd12fee107..cdc453f040 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -103,155 +103,8 @@ DEF_HELPER_FLAGS_2(rebuild_hflags_a64, TCG_CALL_NO_RWG, void, env, int)
 
 DEF_HELPER_FLAGS_5(probe_access, TCG_CALL_NO_WG, void, env, tl, i32, i32, i32)
 
-DEF_HELPER_1(vfp_get_fpscr, i32, env)
-DEF_HELPER_2(vfp_set_fpscr, void, env, i32)
-
-DEF_HELPER_3(vfp_addh, f16, f16, f16, ptr)
-DEF_HELPER_3(vfp_adds, f32, f32, f32, ptr)
-DEF_HELPER_3(vfp_addd, f64, f64, f64, ptr)
-DEF_HELPER_3(vfp_subh, f16, f16, f16, ptr)
-DEF_HELPER_3(vfp_subs, f32, f32, f32, ptr)
-DEF_HELPER_3(vfp_subd, f64, f64, f64, ptr)
-DEF_HELPER_3(vfp_mulh, f16, f16, f16, ptr)
-DEF_HELPER_3(vfp_muls, f32, f32, f32, ptr)
-DEF_HELPER_3(vfp_muld, f64, f64, f64, ptr)
-DEF_HELPER_3(vfp_divh, f16, f16, f16, ptr)
-DEF_HELPER_3(vfp_divs, f32, f32, f32, ptr)
-DEF_HELPER_3(vfp_divd, f64, f64, f64, ptr)
-DEF_HELPER_3(vfp_maxh, f16, f16, f16, ptr)
-DEF_HELPER_3(vfp_maxs, f32, f32, f32, ptr)
-DEF_HELPER_3(vfp_maxd, f64, f64, f64, ptr)
-DEF_HELPER_3(vfp_minh, f16, f16, f16, ptr)
-DEF_HELPER_3(vfp_mins, f32, f32, f32, ptr)
-DEF_HELPER_3(vfp_mind, f64, f64, f64, ptr)
-DEF_HELPER_3(vfp_maxnumh, f16, f16, f16, ptr)
-DEF_HELPER_3(vfp_maxnums, f32, f32, f32, ptr)
-DEF_HELPER_3(vfp_maxnumd, f64, f64, f64, ptr)
-DEF_HELPER_3(vfp_minnumh, f16, f16, f16, ptr)
-DEF_HELPER_3(vfp_minnums, f32, f32, f32, ptr)
-DEF_HELPER_3(vfp_minnumd, f64, f64, f64, ptr)
-DEF_HELPER_1(vfp_negh, f16, f16)
-DEF_HELPER_1(vfp_negs, f32, f32)
-DEF_HELPER_1(vfp_negd, f64, f64)
-DEF_HELPER_1(vfp_absh, f16, f16)
-DEF_HELPER_1(vfp_abss, f32, f32)
-DEF_HELPER_1(vfp_absd, f64, f64)
-DEF_HELPER_2(vfp_sqrth, f16, f16, env)
-DEF_HELPER_2(vfp_sqrts, f32, f32, env)
-DEF_HELPER_2(vfp_sqrtd, f64, f64, env)
-DEF_HELPER_3(vfp_cmph, void, f16, f16, env)
-DEF_HELPER_3(vfp_cmps, void, f32, f32, env)
-DEF_HELPER_3(vfp_cmpd, void, f64, f64, env)
-DEF_HELPER_3(vfp_cmpeh, void, f16, f16, env)
-DEF_HELPER_3(vfp_cmpes, void, f32, f32, env)
-DEF_HELPER_3(vfp_cmped, void, f64, f64, env)
-
-DEF_HELPER_2(vfp_fcvtds, f64, f32, env)
-DEF_HELPER_2(vfp_fcvtsd, f32, f64, env)
-DEF_HELPER_FLAGS_2(bfcvt, TCG_CALL_NO_RWG, i32, f32, ptr)
-DEF_HELPER_FLAGS_2(bfcvt_pair, TCG_CALL_NO_RWG, i32, i64, ptr)
-
-DEF_HELPER_2(vfp_uitoh, f16, i32, ptr)
-DEF_HELPER_2(vfp_uitos, f32, i32, ptr)
-DEF_HELPER_2(vfp_uitod, f64, i32, ptr)
-DEF_HELPER_2(vfp_sitoh, f16, i32, ptr)
-DEF_HELPER_2(vfp_sitos, f32, i32, ptr)
-DEF_HELPER_2(vfp_sitod, f64, i32, ptr)
-
-DEF_HELPER_2(vfp_touih, i32, f16, ptr)
-DEF_HELPER_2(vfp_touis, i32, f32, ptr)
-DEF_HELPER_2(vfp_touid, i32, f64, ptr)
-DEF_HELPER_2(vfp_touizh, i32, f16, ptr)
-DEF_HELPER_2(vfp_touizs, i32, f32, ptr)
-DEF_HELPER_2(vfp_touizd, i32, f64, ptr)
-DEF_HELPER_2(vfp_tosih, s32, f16, ptr)
-DEF_HELPER_2(vfp_tosis, s32, f32, ptr)
-DEF_HELPER_2(vfp_tosid, s32, f64, ptr)
-DEF_HELPER_2(vfp_tosizh, s32, f16, ptr)
-DEF_HELPER_2(vfp_tosizs, s32, f32, ptr)
-DEF_HELPER_2(vfp_tosizd, s32, f64, ptr)
-
-DEF_HELPER_3(vfp_toshh_round_to_zero, i32, f16, i32, ptr)
-DEF_HELPER_3(vfp_toslh_round_to_zero, i32, f16, i32, ptr)
-DEF_HELPER_3(vfp_touhh_round_to_zero, i32, f16, i32, ptr)
-DEF_HELPER_3(vfp_toulh_round_to_zero, i32, f16, i32, ptr)
-DEF_HELPER_3(vfp_toshs_round_to_zero, i32, f32, i32, ptr)
-DEF_HELPER_3(vfp_tosls_round_to_zero, i32, f32, i32, ptr)
-DEF_HELPER_3(vfp_touhs_round_to_zero, i32, f32, i32, ptr)
-DEF_HELPER_3(vfp_touls_round_to_zero, i32, f32, i32, ptr)
-DEF_HELPER_3(vfp_toshd_round_to_zero, i64, f64, i32, ptr)
-DEF_HELPER_3(vfp_tosld_round_to_zero, i64, f64, i32, ptr)
-DEF_HELPER_3(vfp_touhd_round_to_zero, i64, f64, i32, ptr)
-DEF_HELPER_3(vfp_tould_round_to_zero, i64, f64, i32, ptr)
-DEF_HELPER_3(vfp_touhh, i32, f16, i32, ptr)
-DEF_HELPER_3(vfp_toshh, i32, f16, i32, ptr)
-DEF_HELPER_3(vfp_toulh, i32, f16, i32, ptr)
-DEF_HELPER_3(vfp_toslh, i32, f16, i32, ptr)
-DEF_HELPER_3(vfp_touqh, i64, f16, i32, ptr)
-DEF_HELPER_3(vfp_tosqh, i64, f16, i32, ptr)
-DEF_HELPER_3(vfp_toshs, i32, f32, i32, ptr)
-DEF_HELPER_3(vfp_tosls, i32, f32, i32, ptr)
-DEF_HELPER_3(vfp_tosqs, i64, f32, i32, ptr)
-DEF_HELPER_3(vfp_touhs, i32, f32, i32, ptr)
-DEF_HELPER_3(vfp_touls, i32, f32, i32, ptr)
-DEF_HELPER_3(vfp_touqs, i64, f32, i32, ptr)
-DEF_HELPER_3(vfp_toshd, i64, f64, i32, ptr)
-DEF_HELPER_3(vfp_tosld, i64, f64, i32, ptr)
-DEF_HELPER_3(vfp_tosqd, i64, f64, i32, ptr)
-DEF_HELPER_3(vfp_touhd, i64, f64, i32, ptr)
-DEF_HELPER_3(vfp_tould, i64, f64, i32, ptr)
-DEF_HELPER_3(vfp_touqd, i64, f64, i32, ptr)
-DEF_HELPER_3(vfp_shtos, f32, i32, i32, ptr)
-DEF_HELPER_3(vfp_sltos, f32, i32, i32, ptr)
-DEF_HELPER_3(vfp_sqtos, f32, i64, i32, ptr)
-DEF_HELPER_3(vfp_uhtos, f32, i32, i32, ptr)
-DEF_HELPER_3(vfp_ultos, f32, i32, i32, ptr)
-DEF_HELPER_3(vfp_uqtos, f32, i64, i32, ptr)
-DEF_HELPER_3(vfp_shtod, f64, i64, i32, ptr)
-DEF_HELPER_3(vfp_sltod, f64, i64, i32, ptr)
-DEF_HELPER_3(vfp_sqtod, f64, i64, i32, ptr)
-DEF_HELPER_3(vfp_uhtod, f64, i64, i32, ptr)
-DEF_HELPER_3(vfp_ultod, f64, i64, i32, ptr)
-DEF_HELPER_3(vfp_uqtod, f64, i64, i32, ptr)
-DEF_HELPER_3(vfp_shtoh, f16, i32, i32, ptr)
-DEF_HELPER_3(vfp_uhtoh, f16, i32, i32, ptr)
-DEF_HELPER_3(vfp_sltoh, f16, i32, i32, ptr)
-DEF_HELPER_3(vfp_ultoh, f16, i32, i32, ptr)
-DEF_HELPER_3(vfp_sqtoh, f16, i64, i32, ptr)
-DEF_HELPER_3(vfp_uqtoh, f16, i64, i32, ptr)
-
-DEF_HELPER_3(vfp_shtos_round_to_nearest, f32, i32, i32, ptr)
-DEF_HELPER_3(vfp_sltos_round_to_nearest, f32, i32, i32, ptr)
-DEF_HELPER_3(vfp_uhtos_round_to_nearest, f32, i32, i32, ptr)
-DEF_HELPER_3(vfp_ultos_round_to_nearest, f32, i32, i32, ptr)
-DEF_HELPER_3(vfp_shtod_round_to_nearest, f64, i64, i32, ptr)
-DEF_HELPER_3(vfp_sltod_round_to_nearest, f64, i64, i32, ptr)
-DEF_HELPER_3(vfp_uhtod_round_to_nearest, f64, i64, i32, ptr)
-DEF_HELPER_3(vfp_ultod_round_to_nearest, f64, i64, i32, ptr)
-DEF_HELPER_3(vfp_shtoh_round_to_nearest, f16, i32, i32, ptr)
-DEF_HELPER_3(vfp_uhtoh_round_to_nearest, f16, i32, i32, ptr)
-DEF_HELPER_3(vfp_sltoh_round_to_nearest, f16, i32, i32, ptr)
-DEF_HELPER_3(vfp_ultoh_round_to_nearest, f16, i32, i32, ptr)
-
 DEF_HELPER_FLAGS_2(set_rmode, TCG_CALL_NO_RWG, i32, i32, ptr)
 
-DEF_HELPER_FLAGS_3(vfp_fcvt_f16_to_f32, TCG_CALL_NO_RWG, f32, f16, ptr, i32)
-DEF_HELPER_FLAGS_3(vfp_fcvt_f32_to_f16, TCG_CALL_NO_RWG, f16, f32, ptr, i32)
-DEF_HELPER_FLAGS_3(vfp_fcvt_f16_to_f64, TCG_CALL_NO_RWG, f64, f16, ptr, i32)
-DEF_HELPER_FLAGS_3(vfp_fcvt_f64_to_f16, TCG_CALL_NO_RWG, f16, f64, ptr, i32)
-
-DEF_HELPER_4(vfp_muladdd, f64, f64, f64, f64, ptr)
-DEF_HELPER_4(vfp_muladds, f32, f32, f32, f32, ptr)
-DEF_HELPER_4(vfp_muladdh, f16, f16, f16, f16, ptr)
-
-DEF_HELPER_FLAGS_2(recpe_f16, TCG_CALL_NO_RWG, f16, f16, ptr)
-DEF_HELPER_FLAGS_2(recpe_f32, TCG_CALL_NO_RWG, f32, f32, ptr)
-DEF_HELPER_FLAGS_2(recpe_f64, TCG_CALL_NO_RWG, f64, f64, ptr)
-DEF_HELPER_FLAGS_2(rsqrte_f16, TCG_CALL_NO_RWG, f16, f16, ptr)
-DEF_HELPER_FLAGS_2(rsqrte_f32, TCG_CALL_NO_RWG, f32, f32, ptr)
-DEF_HELPER_FLAGS_2(rsqrte_f64, TCG_CALL_NO_RWG, f64, f64, ptr)
-DEF_HELPER_FLAGS_1(recpe_u32, TCG_CALL_NO_RWG, i32, i32)
-DEF_HELPER_FLAGS_1(rsqrte_u32, TCG_CALL_NO_RWG, i32, i32)
 DEF_HELPER_FLAGS_4(neon_tbl, TCG_CALL_NO_RWG, i64, env, i32, i64, i64)
 
 DEF_HELPER_3(shl_cc, i32, env, i32, i32)
@@ -259,13 +112,6 @@ DEF_HELPER_3(shr_cc, i32, env, i32, i32)
 DEF_HELPER_3(sar_cc, i32, env, i32, i32)
 DEF_HELPER_3(ror_cc, i32, env, i32, i32)
 
-DEF_HELPER_FLAGS_2(rinth_exact, TCG_CALL_NO_RWG, f16, f16, ptr)
-DEF_HELPER_FLAGS_2(rints_exact, TCG_CALL_NO_RWG, f32, f32, ptr)
-DEF_HELPER_FLAGS_2(rintd_exact, TCG_CALL_NO_RWG, f64, f64, ptr)
-DEF_HELPER_FLAGS_2(rinth, TCG_CALL_NO_RWG, f16, f16, ptr)
-DEF_HELPER_FLAGS_2(rints, TCG_CALL_NO_RWG, f32, f32, ptr)
-DEF_HELPER_FLAGS_2(rintd, TCG_CALL_NO_RWG, f64, f64, ptr)
-
 DEF_HELPER_FLAGS_2(vjcvt, TCG_CALL_NO_RWG, i32, f64, env)
 DEF_HELPER_FLAGS_2(fjcvtzs, TCG_CALL_NO_RWG, i64, f64, ptr)
 
@@ -949,4 +795,5 @@ DEF_HELPER_FLAGS_5(gvec_uclamp_d, TCG_CALL_NO_RWG,
 #include "tcg/helper-sme.h.inc"
 #endif
 
+#include "tcg/helper-vfp.h.inc"
 #include "tcg/helper-mve.h.inc"
diff --git a/target/arm/tcg/helper-vfp.h.inc b/target/arm/tcg/helper-vfp.h.inc
new file mode 100644
index 0000000000..31b58568e8
--- /dev/null
+++ b/target/arm/tcg/helper-vfp.h.inc
@@ -0,0 +1,163 @@
+/*
+ * ARM VFP helper definitions
+ *
+ * Copyright (c) 2007 CodeSourcery.
+ * Written by Paul Brook
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+DEF_HELPER_1(vfp_get_fpscr, i32, env)
+DEF_HELPER_2(vfp_set_fpscr, void, env, i32)
+
+DEF_HELPER_3(vfp_addh, f16, f16, f16, ptr)
+DEF_HELPER_3(vfp_adds, f32, f32, f32, ptr)
+DEF_HELPER_3(vfp_addd, f64, f64, f64, ptr)
+DEF_HELPER_3(vfp_subh, f16, f16, f16, ptr)
+DEF_HELPER_3(vfp_subs, f32, f32, f32, ptr)
+DEF_HELPER_3(vfp_subd, f64, f64, f64, ptr)
+DEF_HELPER_3(vfp_mulh, f16, f16, f16, ptr)
+DEF_HELPER_3(vfp_muls, f32, f32, f32, ptr)
+DEF_HELPER_3(vfp_muld, f64, f64, f64, ptr)
+DEF_HELPER_3(vfp_divh, f16, f16, f16, ptr)
+DEF_HELPER_3(vfp_divs, f32, f32, f32, ptr)
+DEF_HELPER_3(vfp_divd, f64, f64, f64, ptr)
+DEF_HELPER_3(vfp_maxh, f16, f16, f16, ptr)
+DEF_HELPER_3(vfp_maxs, f32, f32, f32, ptr)
+DEF_HELPER_3(vfp_maxd, f64, f64, f64, ptr)
+DEF_HELPER_3(vfp_minh, f16, f16, f16, ptr)
+DEF_HELPER_3(vfp_mins, f32, f32, f32, ptr)
+DEF_HELPER_3(vfp_mind, f64, f64, f64, ptr)
+DEF_HELPER_3(vfp_maxnumh, f16, f16, f16, ptr)
+DEF_HELPER_3(vfp_maxnums, f32, f32, f32, ptr)
+DEF_HELPER_3(vfp_maxnumd, f64, f64, f64, ptr)
+DEF_HELPER_3(vfp_minnumh, f16, f16, f16, ptr)
+DEF_HELPER_3(vfp_minnums, f32, f32, f32, ptr)
+DEF_HELPER_3(vfp_minnumd, f64, f64, f64, ptr)
+DEF_HELPER_1(vfp_negh, f16, f16)
+DEF_HELPER_1(vfp_negs, f32, f32)
+DEF_HELPER_1(vfp_negd, f64, f64)
+DEF_HELPER_1(vfp_absh, f16, f16)
+DEF_HELPER_1(vfp_abss, f32, f32)
+DEF_HELPER_1(vfp_absd, f64, f64)
+DEF_HELPER_2(vfp_sqrth, f16, f16, env)
+DEF_HELPER_2(vfp_sqrts, f32, f32, env)
+DEF_HELPER_2(vfp_sqrtd, f64, f64, env)
+DEF_HELPER_3(vfp_cmph, void, f16, f16, env)
+DEF_HELPER_3(vfp_cmps, void, f32, f32, env)
+DEF_HELPER_3(vfp_cmpd, void, f64, f64, env)
+DEF_HELPER_3(vfp_cmpeh, void, f16, f16, env)
+DEF_HELPER_3(vfp_cmpes, void, f32, f32, env)
+DEF_HELPER_3(vfp_cmped, void, f64, f64, env)
+
+DEF_HELPER_2(vfp_fcvtds, f64, f32, env)
+DEF_HELPER_2(vfp_fcvtsd, f32, f64, env)
+DEF_HELPER_FLAGS_2(bfcvt, TCG_CALL_NO_RWG, i32, f32, ptr)
+DEF_HELPER_FLAGS_2(bfcvt_pair, TCG_CALL_NO_RWG, i32, i64, ptr)
+
+DEF_HELPER_2(vfp_uitoh, f16, i32, ptr)
+DEF_HELPER_2(vfp_uitos, f32, i32, ptr)
+DEF_HELPER_2(vfp_uitod, f64, i32, ptr)
+DEF_HELPER_2(vfp_sitoh, f16, i32, ptr)
+DEF_HELPER_2(vfp_sitos, f32, i32, ptr)
+DEF_HELPER_2(vfp_sitod, f64, i32, ptr)
+
+DEF_HELPER_2(vfp_touih, i32, f16, ptr)
+DEF_HELPER_2(vfp_touis, i32, f32, ptr)
+DEF_HELPER_2(vfp_touid, i32, f64, ptr)
+DEF_HELPER_2(vfp_touizh, i32, f16, ptr)
+DEF_HELPER_2(vfp_touizs, i32, f32, ptr)
+DEF_HELPER_2(vfp_touizd, i32, f64, ptr)
+DEF_HELPER_2(vfp_tosih, s32, f16, ptr)
+DEF_HELPER_2(vfp_tosis, s32, f32, ptr)
+DEF_HELPER_2(vfp_tosid, s32, f64, ptr)
+DEF_HELPER_2(vfp_tosizh, s32, f16, ptr)
+DEF_HELPER_2(vfp_tosizs, s32, f32, ptr)
+DEF_HELPER_2(vfp_tosizd, s32, f64, ptr)
+
+DEF_HELPER_3(vfp_toshh_round_to_zero, i32, f16, i32, ptr)
+DEF_HELPER_3(vfp_toslh_round_to_zero, i32, f16, i32, ptr)
+DEF_HELPER_3(vfp_touhh_round_to_zero, i32, f16, i32, ptr)
+DEF_HELPER_3(vfp_toulh_round_to_zero, i32, f16, i32, ptr)
+DEF_HELPER_3(vfp_toshs_round_to_zero, i32, f32, i32, ptr)
+DEF_HELPER_3(vfp_tosls_round_to_zero, i32, f32, i32, ptr)
+DEF_HELPER_3(vfp_touhs_round_to_zero, i32, f32, i32, ptr)
+DEF_HELPER_3(vfp_touls_round_to_zero, i32, f32, i32, ptr)
+DEF_HELPER_3(vfp_toshd_round_to_zero, i64, f64, i32, ptr)
+DEF_HELPER_3(vfp_tosld_round_to_zero, i64, f64, i32, ptr)
+DEF_HELPER_3(vfp_touhd_round_to_zero, i64, f64, i32, ptr)
+DEF_HELPER_3(vfp_tould_round_to_zero, i64, f64, i32, ptr)
+DEF_HELPER_3(vfp_touhh, i32, f16, i32, ptr)
+DEF_HELPER_3(vfp_toshh, i32, f16, i32, ptr)
+DEF_HELPER_3(vfp_toulh, i32, f16, i32, ptr)
+DEF_HELPER_3(vfp_toslh, i32, f16, i32, ptr)
+DEF_HELPER_3(vfp_touqh, i64, f16, i32, ptr)
+DEF_HELPER_3(vfp_tosqh, i64, f16, i32, ptr)
+DEF_HELPER_3(vfp_toshs, i32, f32, i32, ptr)
+DEF_HELPER_3(vfp_tosls, i32, f32, i32, ptr)
+DEF_HELPER_3(vfp_tosqs, i64, f32, i32, ptr)
+DEF_HELPER_3(vfp_touhs, i32, f32, i32, ptr)
+DEF_HELPER_3(vfp_touls, i32, f32, i32, ptr)
+DEF_HELPER_3(vfp_touqs, i64, f32, i32, ptr)
+DEF_HELPER_3(vfp_toshd, i64, f64, i32, ptr)
+DEF_HELPER_3(vfp_tosld, i64, f64, i32, ptr)
+DEF_HELPER_3(vfp_tosqd, i64, f64, i32, ptr)
+DEF_HELPER_3(vfp_touhd, i64, f64, i32, ptr)
+DEF_HELPER_3(vfp_tould, i64, f64, i32, ptr)
+DEF_HELPER_3(vfp_touqd, i64, f64, i32, ptr)
+DEF_HELPER_3(vfp_shtos, f32, i32, i32, ptr)
+DEF_HELPER_3(vfp_sltos, f32, i32, i32, ptr)
+DEF_HELPER_3(vfp_sqtos, f32, i64, i32, ptr)
+DEF_HELPER_3(vfp_uhtos, f32, i32, i32, ptr)
+DEF_HELPER_3(vfp_ultos, f32, i32, i32, ptr)
+DEF_HELPER_3(vfp_uqtos, f32, i64, i32, ptr)
+DEF_HELPER_3(vfp_shtod, f64, i64, i32, ptr)
+DEF_HELPER_3(vfp_sltod, f64, i64, i32, ptr)
+DEF_HELPER_3(vfp_sqtod, f64, i64, i32, ptr)
+DEF_HELPER_3(vfp_uhtod, f64, i64, i32, ptr)
+DEF_HELPER_3(vfp_ultod, f64, i64, i32, ptr)
+DEF_HELPER_3(vfp_uqtod, f64, i64, i32, ptr)
+DEF_HELPER_3(vfp_shtoh, f16, i32, i32, ptr)
+DEF_HELPER_3(vfp_uhtoh, f16, i32, i32, ptr)
+DEF_HELPER_3(vfp_sltoh, f16, i32, i32, ptr)
+DEF_HELPER_3(vfp_ultoh, f16, i32, i32, ptr)
+DEF_HELPER_3(vfp_sqtoh, f16, i64, i32, ptr)
+DEF_HELPER_3(vfp_uqtoh, f16, i64, i32, ptr)
+
+DEF_HELPER_3(vfp_shtos_round_to_nearest, f32, i32, i32, ptr)
+DEF_HELPER_3(vfp_sltos_round_to_nearest, f32, i32, i32, ptr)
+DEF_HELPER_3(vfp_uhtos_round_to_nearest, f32, i32, i32, ptr)
+DEF_HELPER_3(vfp_ultos_round_to_nearest, f32, i32, i32, ptr)
+DEF_HELPER_3(vfp_shtod_round_to_nearest, f64, i64, i32, ptr)
+DEF_HELPER_3(vfp_sltod_round_to_nearest, f64, i64, i32, ptr)
+DEF_HELPER_3(vfp_uhtod_round_to_nearest, f64, i64, i32, ptr)
+DEF_HELPER_3(vfp_ultod_round_to_nearest, f64, i64, i32, ptr)
+DEF_HELPER_3(vfp_shtoh_round_to_nearest, f16, i32, i32, ptr)
+DEF_HELPER_3(vfp_uhtoh_round_to_nearest, f16, i32, i32, ptr)
+DEF_HELPER_3(vfp_sltoh_round_to_nearest, f16, i32, i32, ptr)
+DEF_HELPER_3(vfp_ultoh_round_to_nearest, f16, i32, i32, ptr)
+
+DEF_HELPER_FLAGS_3(vfp_fcvt_f16_to_f32, TCG_CALL_NO_RWG, f32, f16, ptr, i32)
+DEF_HELPER_FLAGS_3(vfp_fcvt_f32_to_f16, TCG_CALL_NO_RWG, f16, f32, ptr, i32)
+DEF_HELPER_FLAGS_3(vfp_fcvt_f16_to_f64, TCG_CALL_NO_RWG, f64, f16, ptr, i32)
+DEF_HELPER_FLAGS_3(vfp_fcvt_f64_to_f16, TCG_CALL_NO_RWG, f16, f64, ptr, i32)
+
+DEF_HELPER_4(vfp_muladdd, f64, f64, f64, f64, ptr)
+DEF_HELPER_4(vfp_muladds, f32, f32, f32, f32, ptr)
+DEF_HELPER_4(vfp_muladdh, f16, f16, f16, f16, ptr)
+
+DEF_HELPER_FLAGS_2(recpe_f16, TCG_CALL_NO_RWG, f16, f16, ptr)
+DEF_HELPER_FLAGS_2(recpe_f32, TCG_CALL_NO_RWG, f32, f32, ptr)
+DEF_HELPER_FLAGS_2(recpe_f64, TCG_CALL_NO_RWG, f64, f64, ptr)
+DEF_HELPER_FLAGS_2(rsqrte_f16, TCG_CALL_NO_RWG, f16, f16, ptr)
+DEF_HELPER_FLAGS_2(rsqrte_f32, TCG_CALL_NO_RWG, f32, f32, ptr)
+DEF_HELPER_FLAGS_2(rsqrte_f64, TCG_CALL_NO_RWG, f64, f64, ptr)
+DEF_HELPER_FLAGS_1(recpe_u32, TCG_CALL_NO_RWG, i32, i32)
+DEF_HELPER_FLAGS_1(rsqrte_u32, TCG_CALL_NO_RWG, i32, i32)
+
+DEF_HELPER_FLAGS_2(rinth_exact, TCG_CALL_NO_RWG, f16, f16, ptr)
+DEF_HELPER_FLAGS_2(rints_exact, TCG_CALL_NO_RWG, f32, f32, ptr)
+DEF_HELPER_FLAGS_2(rintd_exact, TCG_CALL_NO_RWG, f64, f64, ptr)
+DEF_HELPER_FLAGS_2(rinth, TCG_CALL_NO_RWG, f16, f16, ptr)
+DEF_HELPER_FLAGS_2(rints, TCG_CALL_NO_RWG, f32, f32, ptr)
+DEF_HELPER_FLAGS_2(rintd, TCG_CALL_NO_RWG, f64, f64, ptr)
-- 
2.38.1

