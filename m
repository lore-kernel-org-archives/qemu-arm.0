Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp3694465lfa;
        Mon, 7 Jun 2021 10:24:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwyNuvuKt8NVGWXCbBMZZbUeknWQ16vgJ57zPhucPD6zFtOQUqe0syhuwPMc2VxjMiofI2a
X-Received: by 2002:a6b:7947:: with SMTP id j7mr14634229iop.0.1623086668790;
        Mon, 07 Jun 2021 10:24:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623086668; cv=none;
        d=google.com; s=arc-20160816;
        b=on1ugsI8exJwW2ZuzKSFfmZOsUWpw8T++p9+JUBI9A//GAafWQJnCtoXYA4+Z51eiN
         hHJYMTS4gEHcwRNx6nEdSC3FKiESztAPKKhFJv22g6kgipQh9lGaaugExebnJHAeIUlV
         +A2NllHcZ9uki5gmHUMYNG1soJHcUyiCEPlZefhNFEHW92M9qt5Ux5O8+bM+JqzHTB7D
         d48FZ375vwZBZk8oMD+cz2ope+a00uUTDD8fm53qs8thjuPfNUaJMGk1a44H713J3rI/
         gSC/4ZFiabmk8e0d1ZiSjzI1vKROKfY/vgO262UBPlCcdIpjwRQ1T1kn3X8bryS5ky5j
         9IOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Lri0jwug/Qcj4uQxmZ9BHJPP5okkwUiX+tQt61XPaUA=;
        b=ng8d+revhYYjEFwn7gcTy2bTZ9iArJPxZburjSopPBfMmCBmHqeHlNUbHW2B/G7BKM
         pnGLkwel3E9L6PKsVfRh7++3TQDNu3ppheixCSGX3eR/hWN7QMSBeVCNOtvWh5TmJJ7E
         gLOJbgpjFONM7Pe7hHhzbGlFhGCZCAkFKiPFGVnKpWqw7cFAKBhYwA7GS0aogjQzhRkg
         tSuF/Jvu7Q2340q+yr140a7LuF4sJ2sz8W3zjEFatAUQkVvBAaK8j9rBtmkr0qwXxXTh
         qlR9d9f5Wx8TJFgtrQe/7/6TdDX8RYsXBHeQqONvGIOGsR7Mp7F4C/OV4ykxeo7dBkqn
         tEFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UQ3J8ncU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z4si12900583iod.34.2021.06.07.10.24.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Jun 2021 10:24:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UQ3J8ncU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lqIzE-0004Vb-0e
	for alex.bennee@linaro.org; Mon, 07 Jun 2021 13:24:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIav-0007iD-Kz
 for qemu-arm@nongnu.org; Mon, 07 Jun 2021 12:59:22 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:35541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIaR-00080g-Vk
 for qemu-arm@nongnu.org; Mon, 07 Jun 2021 12:59:21 -0400
Received: by mail-wr1-x42d.google.com with SMTP id m18so18443333wrv.2
 for <qemu-arm@nongnu.org>; Mon, 07 Jun 2021 09:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Lri0jwug/Qcj4uQxmZ9BHJPP5okkwUiX+tQt61XPaUA=;
 b=UQ3J8ncUsvbhWWj50rtxAjXmAqjqSdoyr0OSF26f7i/v9qZRJRrQaDYR1mpal1Rt/U
 53vXZzkScqTcB9Mci04uIiIURgaHr94bw5AuMFAQZ2Wi9BrxpDjZkaN0JvCXxwonqfun
 NTOQK2nfa5z4Q2PapT5P7Ku3aq4lJGOAG00EEPs6Y7dIyozbc8AGB6OjnRSobSk0r+4+
 I6CLU9a0BZHDP7Ng+9iKzm8mqZrq32Af/twdGkLdYzNgWRAkFTa/s3sKDXAd0QD9RSIB
 p8KyGokhgLuoYJJkQ9TzTWx3oTumGrVB+5JWs20bSdBsM9Oev3Ih+jCTAVPMyMzBY7mL
 xBRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Lri0jwug/Qcj4uQxmZ9BHJPP5okkwUiX+tQt61XPaUA=;
 b=rsq4gNugr42/ihxLo1ZXlB8oS1Jjvj3vzgFhNnXZhj9m4/ionZiopOYwvFLIGw+FdC
 ddo1g9UQJ/pAiD09uZMJ8HxkfgVkAOKRQXyfT2uwq0SUWmaQ8ArwuONW9ijRG3OxkL6m
 o7clMPbhsqxzcArx7P9oHXVvBiA6owv+R6hyzy7qca4NKeXghYdJGxAHAboeb8sf0h05
 kArMj/Cp8Ddx8x+Z6RokpK0VnXX9on89F+ws8aP3RwxzklMvkrzQ3+z/wipVEDyzL6Nc
 Yu6YJ0O0EdK9S7ZO25tRihst1Bv+q3zm2PCYE7V8a+FrBoa+uw+x7VHdrm3DOg00rmmo
 wagg==
X-Gm-Message-State: AOAM530WRUvD0NZsNqnxzY59VaZrYjkoQv0xX3+SMFMYM2bffo5MNOD6
 D7Rwis4xIxmlpVGfDo4YNycXWjx4vJjKD61q
X-Received: by 2002:adf:e943:: with SMTP id m3mr18065542wrn.384.1623085127611; 
 Mon, 07 Jun 2021 09:58:47 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n10sm18891677wre.95.2021.06.07.09.58.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 09:58:47 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 30/55] target/arm: Implement MVE VMLSLDAV
Date: Mon,  7 Jun 2021 17:57:56 +0100
Message-Id: <20210607165821.9892-31-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607165821.9892-1-peter.maydell@linaro.org>
References: <20210607165821.9892-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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
X-TUID: DNp5U6eh80fp

Implement the MVE insn VMLSLDAV, which multiplies source elements,
alternately adding and subtracting them, and accumulates into a
64-bit result in a pair of general purpose registers.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    |  5 +++++
 target/arm/mve.decode      |  2 ++
 target/arm/mve_helper.c    |  5 +++++
 target/arm/translate-mve.c | 11 +++++++++++
 4 files changed, 23 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 1013f6912da..7789da1986b 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -154,3 +154,8 @@ DEF_HELPER_FLAGS_4(mve_vmlaldavxsw, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
 
 DEF_HELPER_FLAGS_4(mve_vmlaldavuh, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
 DEF_HELPER_FLAGS_4(mve_vmlaldavuw, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
+
+DEF_HELPER_FLAGS_4(mve_vmlsldavsh, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
+DEF_HELPER_FLAGS_4(mve_vmlsldavsw, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
+DEF_HELPER_FLAGS_4(mve_vmlsldavxsh, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
+DEF_HELPER_FLAGS_4(mve_vmlsldavxsw, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index bde54d05bb9..1be2d6b270f 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -145,3 +145,5 @@ VDUP             1110 1110 1 0 10 ... 0 .... 1011 . 0 0 1 0000 @vdup size=2
                  qn=%qn rdahi=%rdahi rdalo=%rdalo size=%size_16 &vmlaldav
 VMLALDAV_S       1110 1110 1 ... ... . ... x:1 1110 . 0 a:1 0 ... 0 @vmlaldav
 VMLALDAV_U       1111 1110 1 ... ... . ... x:1 1110 . 0 a:1 0 ... 0 @vmlaldav
+
+VMLSLDAV         1110 1110 1 ... ... . ... x:1 1110 . 0 a:1 0 ... 1 @vmlaldav
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 3c7a0bac3c7..1c22e2777d9 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -507,3 +507,8 @@ DO_LDAV(vmlaldavxsw, 4, int32_t, H4, true, +=, +=)
 
 DO_LDAV(vmlaldavuh, 2, uint16_t, H2, false, +=, +=)
 DO_LDAV(vmlaldavuw, 4, uint32_t, H4, false, +=, +=)
+
+DO_LDAV(vmlsldavsh, 2, int16_t, H2, false, +=, -=)
+DO_LDAV(vmlsldavxsh, 2, int16_t, H2, true, +=, -=)
+DO_LDAV(vmlsldavsw, 4, int32_t, H4, false, +=, -=)
+DO_LDAV(vmlsldavxsw, 4, int32_t, H4, true, +=, -=)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 03d9496f17d..66d713a24e2 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -497,3 +497,14 @@ static bool trans_VMLALDAV_U(DisasContext *s, arg_vmlaldav *a)
     };
     return do_long_dual_acc(s, a, fns[a->size][a->x]);
 }
+
+static bool trans_VMLSLDAV(DisasContext *s, arg_vmlaldav *a)
+{
+    MVEGenDualAccOpFn *fns[4][2] = {
+        { NULL, NULL },
+        { gen_helper_mve_vmlsldavsh, gen_helper_mve_vmlsldavxsh },
+        { gen_helper_mve_vmlsldavsw, gen_helper_mve_vmlsldavxsw },
+        { NULL, NULL },
+    };
+    return do_long_dual_acc(s, a, fns[a->size][a->x]);
+}
-- 
2.20.1

