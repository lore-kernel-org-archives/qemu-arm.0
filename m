Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4296347ejc;
        Sun, 26 Feb 2023 21:41:45 -0800 (PST)
X-Google-Smtp-Source: AK7set9GoXZr44WkQAKqRTMsWU71i6ydI17rJRZMCetNarjGlwmgNV0rveUtuCF7XVG5kfnKum9x
X-Received: by 2002:ad4:4ee4:0:b0:56e:b4f7:114f with SMTP id dv4-20020ad44ee4000000b0056eb4f7114fmr42150883qvb.21.1677476505317;
        Sun, 26 Feb 2023 21:41:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677476505; cv=none;
        d=google.com; s=arc-20160816;
        b=Z2Y++85UrGfL349MUjF5lzy52KLRk6B/h5kzhgzNO6TVebIHSF0fHCE7cKiE4cwaby
         F8c660vyqRYWHdqRYP7jT+YbZEEYQ6jJAnriR2SWTRXGZOlFX9/0bEWQ1hn6lPKAeTX2
         PRwbAdGOLaJG+aWlQlLr5WxDL7bDEzb7gCXPg8JtpeSpZ1qG0BATaci0zLy5jk36h9ds
         rNQHt5F/3q+GF6NQ2OvRvvWzFXKoPE11kefDMECmpBIDC/hoiZBbMvswdLVe+9AMMJsF
         kw2ijG7eZIGJP8AT0PyhBqIMoU+BwwhGzpt5Z3GgPLuTQ1m17EFkN5WkZvoICARQxFyl
         R1ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=2x/6xSpCKlYJ34/8OxjWcHuDhp8kikr1JE7fyXvIhlE=;
        b=AFRGDBt69MJFnpGi4hqd1mSVDwyeDy11zdY8oLYTo2g/eFWY2e17QZKx8VlNtxiPNA
         rTeE9c4AouYC86Hk94NKAL82ZMB+beVZNTKJCCHKWxIiGcO+rCQNGItiYDPPoUaMF9Sw
         IB5p8Xm58TgrsiDhqpGiSX9KMTjPERM6DOpiJYFnAuZLdnllimtJ/TXBgGBtGfzhSyF8
         sQuhoFiu00lieMiEMdDq6BrAl3v9FItDwRN4BREHE+/SY9QPJyEube/MzxVSxuSzQJ9m
         BrA46cwKNogVykrZ4H/nULSe8JwvKz5xJVBCeS4gwm4ZOKcNgfl52BYQQzLhZOxUPE+X
         mTCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hx4WLylA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fh6-20020a0562141a0600b0056eb1291e3csi6342321qvb.141.2023.02.26.21.41.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 21:41:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hx4WLylA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWWFT-0004AF-6B; Mon, 27 Feb 2023 00:40:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWDL-0003Wq-IL
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:38:22 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWDG-00032s-2C
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:38:16 -0500
Received: by mail-pf1-x434.google.com with SMTP id n5so2774722pfv.11
 for <qemu-arm@nongnu.org>; Sun, 26 Feb 2023 21:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2x/6xSpCKlYJ34/8OxjWcHuDhp8kikr1JE7fyXvIhlE=;
 b=hx4WLylA/qHlDu5kQdj1q9ukeWDj6boWQxzuqLWxHTPD0v7tbmSLymQx3gbFnBaVC2
 dvtB+Ye1qIQp2J3dCH4MMJH9fwTl21r635hRtqHtrJyc50heVS/3yefF2ud4NUAHzpwP
 zwO/5P0212rBNhtelilOS8swj9WYl/yUVNAsQ6U0ai9dqL9ssKVzpzTbV2yjtqCoU00a
 DRK3z+r7XdE+3sN3lc9v3U3pyaaCBqOr76DX/eZtBM8oSTTFk07fhv9bv9FtePH8fe5e
 AaXOPM2X8aU3ohzS+odFo5yd52h6a08E2w/AOXru0H5PWxunfMkmeP800L1WkOolyFW9
 6cMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2x/6xSpCKlYJ34/8OxjWcHuDhp8kikr1JE7fyXvIhlE=;
 b=L33IQzVvXL5IV1XuxIVTOJgBXiX5tiiwDdhSjLwVmDdhUHbjIpfx6+S/h+NWXiwmBx
 3FHsjFAiwf0D/WrG1H05OhLp2EvBoYK16iEazeirqxWplK54il8aHZwsXpoin10DvxXC
 WpAj5dZA9tO/HA52i5aTcQ8go79M+xeziMZ6+FQjR1hIbQfxbufL0VlpTbsH43oS35RH
 IfWacr17IOA5VqmGixp2SdSsqskW6bvCoInjP0r8rlGMOGN8BNeiWHWBNt97A3dAPDoU
 Ehg61xEYU8jmQ8zt1YY8niR643kyeh6UdCc7XEJTNgcLTLfgXcZ1iUj2fR6XW2RSsUZu
 f2rQ==
X-Gm-Message-State: AO0yUKVD4gpVsFTYlf7tjXm35mBVF2P4+AH0GHzWRruHCozBjFG87s+2
 gsP9qOeXKn+T//6sPXmqrsxjaA==
X-Received: by 2002:a62:7bce:0:b0:5ce:ef1b:a86 with SMTP id
 w197-20020a627bce000000b005ceef1b0a86mr16749443pfc.2.1677476291613; 
 Sun, 26 Feb 2023 21:38:11 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 k12-20020aa792cc000000b005a7c892b435sm3342137pfa.25.2023.02.26.21.38.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:38:11 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 24/31] target/hppa: Don't use tcg_temp_local_new
Date: Sun, 26 Feb 2023 19:36:54 -1000
Message-Id: <20230227053701.368744-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227053701.368744-1-richard.henderson@linaro.org>
References: <20230227053701.368744-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
X-TUID: ORCKcWYTJ1mw

This wasn't actually used at all, just some unused
macro re-definitions.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hppa/translate.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/target/hppa/translate.c b/target/hppa/translate.c
index 0102cf451b..cee960949f 100644
--- a/target/hppa/translate.c
+++ b/target/hppa/translate.c
@@ -35,7 +35,6 @@
 #undef TCGv
 #undef tcg_temp_new
 #undef tcg_global_mem_new
-#undef tcg_temp_local_new
 #undef tcg_temp_free
 
 #if TARGET_LONG_BITS == 64
@@ -59,7 +58,6 @@
 
 #define tcg_temp_new         tcg_temp_new_i64
 #define tcg_global_mem_new   tcg_global_mem_new_i64
-#define tcg_temp_local_new   tcg_temp_local_new_i64
 #define tcg_temp_free        tcg_temp_free_i64
 
 #define tcg_gen_movi_reg     tcg_gen_movi_i64
@@ -155,7 +153,6 @@
 #define TCGv_reg             TCGv_i32
 #define tcg_temp_new         tcg_temp_new_i32
 #define tcg_global_mem_new   tcg_global_mem_new_i32
-#define tcg_temp_local_new   tcg_temp_local_new_i32
 #define tcg_temp_free        tcg_temp_free_i32
 
 #define tcg_gen_movi_reg     tcg_gen_movi_i32
-- 
2.34.1

