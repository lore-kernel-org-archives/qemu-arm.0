Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp3438580njb;
        Tue, 10 Dec 2024 08:19:55 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXJkLJQHq0t46zdxyuX1UVRxL5AE2cimSQ8THeYDqGany5f1uubbxIkkUz1hH3Eagb29lvbjLqGJJYPXg==@linaro.org
X-Google-Smtp-Source: AGHT+IGae274APPuH56cJU2em/D9T8SfbN9p2SGr/6Cw4O+q3vbw7L0Pk0VuPbp4gWSk/kTc/+lD
X-Received: by 2002:a05:622a:13d1:b0:467:5cfb:bd3c with SMTP id d75a77b69052e-4675cfbc2c2mr149663421cf.20.1733847595158;
        Tue, 10 Dec 2024 08:19:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733847595; cv=none;
        d=google.com; s=arc-20240605;
        b=VTmXQ9zbg3EMgah6UKH0w010AuC5cF8RPV5VQtDUvMFbIcdJzLQT9ZMWGS5Y4opO8u
         8x/ySt0LMkARLx+BNVns8GbE9pSVZSt+5SJZpg/bE2bLfAPQZj9cEyS3+nMOU3hWTgEU
         pyeU0luvnZbBhRRulH/4XyHyp51GpPgRlxt6C6qNlBbAomCCVkwO08cKB/eNG4i0ddYT
         b9gTs3VHqb/gESdaHhvP3lhLQ5rn/sHYE0Yw4cMWAkv/3TzIKalpCkwDZDWzlhA6NWVb
         WLrK1+vzdwWCA17GcThA65ig/O8Qz1idFnzRQBxtGdR6ljYltbS8JGJxWwQCpSK9wlcM
         UDaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=fQWBBpBVBB2pYpCBMt9NLIFTJDB68D9O686ayP1ZAos=;
        fh=OZQBfL75rC14cCDy3q+1fYHCs9KjWAQ7ZJ3hTfS+5lQ=;
        b=OrRI978I6gwJN90VYKWxoLmHVCI4MZV3FHhUPQ3HL5hIrj5eila6HaY1Lo/OebZFvU
         XDbSFmWLVJ5a5jCGka04+eFREjz1gzSA6tD1JB/yZTPO2XgH6FiLXMfvfcnW2cxeKZAz
         /Di/RU3ywKnMiyjv4Bov48AfgKuBBOLbi6SSjgQMwtkwOLuE7+cKqHQZ5KcWFJC4YEEh
         nni9mexFW8ajHT60C0eGiT8u0g3e1s9Y7cK3+Pz/tV5U1OKEnDm1oFadlc4wNoISIFvZ
         3C6nXimoOUz5WXL6Z+Pqzlmp8YQmncfX1emfAHFhsNdeUC1WS8JFG7kEpB0rjLIv9UvT
         /y+Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YWnXYVc0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46729844e50si165315071cf.636.2024.12.10.08.19.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2024 08:19:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YWnXYVc0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tL2vu-0002PI-Lg; Tue, 10 Dec 2024 11:17:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tL2vl-0002Nh-DT
 for qemu-arm@nongnu.org; Tue, 10 Dec 2024 11:17:49 -0500
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tL2vj-0006FN-Mk
 for qemu-arm@nongnu.org; Tue, 10 Dec 2024 11:17:49 -0500
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-53e3a90336eso3378917e87.3
 for <qemu-arm@nongnu.org>; Tue, 10 Dec 2024 08:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733847466; x=1734452266; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fQWBBpBVBB2pYpCBMt9NLIFTJDB68D9O686ayP1ZAos=;
 b=YWnXYVc0tmd1bzs1oOkY34Rh6wvbWSkNERxRKVK6YGFH3VxG7BGASPbyqrThoyaaEk
 L4dcKaTcF5849CXBd8ZJAIlDiL+mm+AF6XtcNCem6tzZ5qKcsanIo/pYhsRR8+mbRLCl
 V3s/ar5DHNwfdYv9j+dFwpp24n9LkaWuCMN/t2GcuBojhdYBll33uAyfIXZpbb1pGKeN
 R8DmEnG5il4/dx5Vg21nYdy49xG9Eept02aYAxfQsucPNuZwCakc7AN8h8OaaL/iC3w1
 HYYQOZ1737y72mEjfncdApbmIAxBdfY6nPUKjkvkP1LR53rjQlW/f+tqVWWE5BaHdakK
 L2RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733847466; x=1734452266;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fQWBBpBVBB2pYpCBMt9NLIFTJDB68D9O686ayP1ZAos=;
 b=h3tvy3fmPvcoX0JylRuG0rHd16OioNpedTzGPLAj78yqbDrJNSkm2Nk00OmCjdYKCO
 2I4KNpehkG/PEeVJteD+xpnsu09kMQ7Odhp3NBxFuaI0wkbog+7hBne1TMBhF4qrKAi5
 JaPlOsc8ViTqDX+MUvLErKBskp6NhlHZUWXq3qq5//zCvIWzk3Ct39IndIWgpS4lah48
 trY4ijiD0WHaft9XWJBtoYINLQd2Y5dwFzuLyqZsLATpKQgeRiw9oR+oCmjYwA6K2A2D
 7B+p/8gmkwWa1MUQIwYTuQaO8ufmOYo5yU2MoWOEECRIksQcLZODpTcP9rlB5Q7js4Hu
 Pc+Q==
X-Gm-Message-State: AOJu0Yx5BnWCZDj0dIccaudK8qXVBSLksriaXHaplCcxvldEAHRwboeM
 EVG/9QISIviZIbtSDMEozt+Nz3M8N0hAtIVQ1SnH+k1JzcoLUQdFr1rrk43WH64=
X-Gm-Gg: ASbGncucD/JFsdVPoBB0hQ0NdhX8IZgI0IpR64EGjctc7wjBynk7VlO5ApBnejZlMJc
 fhDm3pbv4VGLaWZgMwMMJDAQk0peBbMop1rN9HB6VWXRWhW7AxGu1oPviW71F7wAS6Rw3t6TthA
 339u47rf6R3BHkcnFgO5ox8Gh9J/fuMHPO7c+CCYjffe8I1KDYNQ2VLOOJTe1kohLv8eD1UMyUw
 1YXKXA876hDep4Oo0aagnZIeGBHI2nQXH8Wl3U7+mY5TK9m+a6MlOKB1oU=
X-Received: by 2002:a05:6512:230b:b0:540:2022:e3c8 with SMTP id
 2adb3069b0e04-5402410762dmr1996437e87.41.1733847465740; 
 Tue, 10 Dec 2024 08:17:45 -0800 (PST)
Received: from stoup.. ([91.209.212.80]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53f93377eefsm1026343e87.67.2024.12.10.08.17.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2024 08:17:45 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 01/69] target/arm: Add section labels for "Data Processing
 (register)"
Date: Tue, 10 Dec 2024 10:16:25 -0600
Message-ID: <20241210161733.1830573-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241210161733.1830573-1-richard.henderson@linaro.org>
References: <20241210161733.1830573-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x12c.google.com
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
X-TUID: OD7sIPk8l8LN

At the same time, use ### to separate 3rd-level sections.
We already use ### for 4.1.92 Data Processing (immediate),
but not the two following two third-level sections:
4.1.93 Branches, and 4.1.94 Loads and stores.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/a64.decode | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 331a8e180c..d28efb884d 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -161,7 +161,7 @@ UBFM            . 10 100110 . ...... ...... ..... ..... @bitfield_32
 EXTR            1 00 100111 1 0 rm:5 imm:6 rn:5 rd:5     &extract sf=1
 EXTR            0 00 100111 0 0 rm:5 0 imm:5 rn:5 rd:5   &extract sf=0
 
-# Branches
+### Branches
 
 %imm26   0:s26 !function=times_4
 @branch         . ..... .......................... &i imm=%imm26
@@ -291,7 +291,7 @@ HLT             1101 0100 010 ................ 000 00 @i16
 # DCPS2         1101 0100 101 ................ 000 10 @i16
 # DCPS3         1101 0100 101 ................ 000 11 @i16
 
-# Loads and stores
+### Loads and stores
 
 &stxr           rn rt rt2 rs sz lasr
 &stlr           rn rt sz lasr
@@ -649,6 +649,21 @@ CPYP            00 011 1 01000 ..... .... 01 ..... ..... @cpy
 CPYM            00 011 1 01010 ..... .... 01 ..... ..... @cpy
 CPYE            00 011 1 01100 ..... .... 01 ..... ..... @cpy
 
+### Data Processing (register)
+
+# Data Processing (2-source)
+# Data Processing (1-source)
+# Logical (shifted reg)
+# Add/subtract (shifted reg)
+# Add/subtract (extended reg)
+# Add/subtract (carry)
+# Rotate right into flags
+# Evaluate into flags
+# Conditional compare (regster)
+# Conditional compare (immediate)
+# Conditional select
+# Data Processing (3-source)
+
 ### Cryptographic AES
 
 AESE            01001110 00 10100 00100 10 ..... .....  @r2r_q1e0
-- 
2.43.0

