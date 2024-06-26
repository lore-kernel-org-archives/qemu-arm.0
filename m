Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp922372njc;
        Wed, 26 Jun 2024 04:27:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU+4ny/QQ0idfPeMNztQoy87ZdZJ+T816Sy34AJbwcuEXvHbW2NAmKlhM2HZXPVjuXVxr8y/+Xk8WTn2ZRfE2BBlTXxtiI2
X-Google-Smtp-Source: AGHT+IHSJTBnPbkdzKKw1ibfpZ9JD/4PsCxoccIKh4hGjG9eiOCN0e57LLhTvJ06X9qG1MNu8tz/
X-Received: by 2002:a05:6830:10cf:b0:700:d023:6b31 with SMTP id 46e09a7af769-700d5bcf98dmr374854a34.18.1719401274561;
        Wed, 26 Jun 2024 04:27:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719401274; cv=none;
        d=google.com; s=arc-20160816;
        b=YDnIUlhgqxsO9P26LFKGBkykZYdaL0d/oXXSdcSp+0YQkGLWQMKfAJvCUHXKcK2lna
         WrscxXqHfGEnB7CwKWqjtkX/izbalx/JkwSCISN9OmgAE2/7wbEh3fNs3RDo1wgZxRlf
         ngEyOIuvW7DG5k9nmkERHJoeJ9xrtiU9AuJFEzYUPtENLuarwbertsOQkVJZ/idNvKjH
         gbxfmtC6Vkrlatey4BvbbOF3ycZiP/zBM28VqrcLSoAxthhy9sCOlDyKcil0bm6dy+v2
         GmAPl3mp5kzFMu5KQFgUBdAKbMx63suPISFmZLvHkSBcgbqXmg1bbCLuuXOnPuDLHJlJ
         SyoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:in-reply-to:references
         :message-id:content-transfer-encoding:mime-version:subject:date:from
         :dkim-signature;
        bh=BSj5UfHR8CwIYmczT5ogPQso3k+OuOQGUbx+sqgpj6I=;
        fh=c2VRnSpESGsGjPrM5rLS4cVnVaUf5QloU0sTPhH1r5o=;
        b=RFwOTlf5wBVP4hGhXoZCoVqJX2dVbDRQuUjF41uQgKfwHk1vGxkVftWEZ8/8swYlif
         1Ydlc9bWCtGJLjIeWPnimebNqgfxl3YitbQwLe9p+E1POKiTWJzdUOHHQ3Hil26Ztsa5
         8aNPCKocmEKN9WmBJp7oqiYIih8OX+QLcLyPG9NJZSu9B2MakdXBmU/RB4Yyye3iDhij
         JD7JZqibbJIchj+SA0b/od36i4oRjSLeJ2mlxEL9nx1HVZWisElc0cEXJkTfBUFtfzZH
         4JQgjzkIj7rg0rktrpXjOa1pka/bztISn9ambdEV2xY58fEvwBirPJOgAhlpEDAgJFjx
         +Zdg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=s629ktp9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b51ecf2479si131410116d6.99.2024.06.26.04.27.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Jun 2024 04:27:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=s629ktp9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sMQo1-0002bp-JP; Wed, 26 Jun 2024 07:27:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1sMQo0-0002av-76
 for qemu-arm@nongnu.org; Wed, 26 Jun 2024 07:27:16 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1sMQnv-0001tz-FP
 for qemu-arm@nongnu.org; Wed, 26 Jun 2024 07:27:15 -0400
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-700cd2cba7bso702877a34.0
 for <qemu-arm@nongnu.org>; Wed, 26 Jun 2024 04:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1719401224; x=1720006024;
 darn=nongnu.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=BSj5UfHR8CwIYmczT5ogPQso3k+OuOQGUbx+sqgpj6I=;
 b=s629ktp9EQqkEQ6LSBi7/ErphD1Ojr4Mv0wV6yY03EplYc944gdn4ftFFusDsUFaf4
 S5HMKFztC7lEq1vnkd/lqCxQesEPZN/XccmLrLcO2ilVfKfF1drLbBEt/PHHclUDIdLN
 UumQonkaI4nDy2YUFU7CX/na3z6MhVbpe9RSulICG3+CeJGcB6oxftqkQucJ+3gyNrCQ
 2vr98ufYuDDBJ17kft2Cz92igtK3IJIhOaI45ys0PAibOIugR+hR6o6SHxCJsOVYqKwi
 UaVJoYkMbEZ0AkWWYyjFEhO7KrB2efw2wG4MuDzL77NHi+yOD/trbSBP68d8k7Hz5Bc5
 jLWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719401224; x=1720006024;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BSj5UfHR8CwIYmczT5ogPQso3k+OuOQGUbx+sqgpj6I=;
 b=qu08wjALAsZYi567gNPkfTwYN7Y6xBZnH7jYCt9bt8seW72SDdRezd4MgnZG8xNY55
 nBU0uT/qdXjHor7384F3NByh1bcCXExagmIeuCBQxVp6ya4G+edNi3SMt62agqDJ+bue
 C9Ebhb0XCcqqgz6CLdv+uMd+tNC3dU00h++DJUy/ntAB9/0rxHjORMLHIlhMoIDxAnSi
 bODpdccyhgoT7PsKT127itGaZ3V3uu79VVAomSx7p7wlrIZVabTlNaXbgH0nnxYmyy74
 UCHIBOqINApxhuFGFYQcPRup97oHMBrUE1xuN/JxJBpU/oiHJLLHTHQuyF1DWdaliHSV
 rKTA==
X-Gm-Message-State: AOJu0Yyhj4UEX/r5U6RMSkkPl128rpkipkEHVK9LO9yaO7mxldq7B8Vh
 aBlFNn5Ga3sgwTSwSdPj1zphG0OsHpsBgeWKsB3odkeImJa2T6da57PjkZGr4fA=
X-Received: by 2002:a05:6358:7e88:b0:1a4:617d:6fea with SMTP id
 e5c5f4694b2df-1a4617d7377mr491649455d.6.1719401224319; 
 Wed, 26 Jun 2024 04:27:04 -0700 (PDT)
Received: from localhost ([157.82.204.135])
 by smtp.gmail.com with UTF8SMTPSA id
 41be03b00d2f7-7183c48e59esm7745940a12.3.2024.06.26.04.27.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jun 2024 04:27:04 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Wed, 26 Jun 2024 20:26:27 +0900
Subject: [PATCH 6/6] tests/tcg/arm: Manually bit-cast half-precision
 numbers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240626-tcg-v1-6-0bad656307d8@daynix.com>
References: <20240626-tcg-v1-0-0bad656307d8@daynix.com>
In-Reply-To: <20240626-tcg-v1-0-0bad656307d8@daynix.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.14-dev-fd6e3
Received-SPF: none client-ip=2607:f8b0:4864:20::332;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-ot1-x332.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: W9DsL6QKGeuO

clang version 18.1.6 does not allow specifying an integer as the value
of a single-precision register. Manually bit-cast into float with vmov
first.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 tests/tcg/arm/fcvt.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/tcg/arm/fcvt.c b/tests/tcg/arm/fcvt.c
index 157790e67961..14c9bb669c91 100644
--- a/tests/tcg/arm/fcvt.c
+++ b/tests/tcg/arm/fcvt.c
@@ -355,7 +355,9 @@ static void convert_half_to_single(void)
 
         print_half_number(i, input);
 #if defined(__arm__)
-        asm("vcvtb.f32.f16 %0, %1" : "=w" (output) : "x" ((uint32_t)input));
+        float tmp;
+        asm("vmov %0, %1" : "=w" (tmp) : "r" (input));
+        asm("vcvtb.f32.f16 %0, %1" : "=w" (output) : "x" (tmp));
 #else
         asm("fcvt %s0, %h1" : "=w" (output) : "w" (input));
 #endif

-- 
2.45.2

