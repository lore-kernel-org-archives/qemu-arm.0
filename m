Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp686556njb;
        Tue, 13 May 2025 10:44:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXn0d+tQB1aM7pr79v45AHXtKxivjEGkFN0jPpqRs862RdLblH8GAg/3EDkmXbt7Dvo32gArlqacmXWGw==@linaro.org
X-Google-Smtp-Source: AGHT+IFRL6PN+5Y90XD5ZTZgY4z4zjcbHFwsHT8O672C8tvnk1ijnN17izvcCD6aT6wocayoNsZF
X-Received: by 2002:a05:620a:f05:b0:7ca:cd71:2bea with SMTP id af79cd13be357-7cd2887776dmr54878785a.37.1747158292337;
        Tue, 13 May 2025 10:44:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747158292; cv=none;
        d=google.com; s=arc-20240605;
        b=WKdwpKSyuJ6rFbf1y95qH5SX9NMczSJJM6WR51VwebXmqTayGLRRpxTR7T/KSyM2Ge
         h0uXHlMrvIlO8hETNSM+QxdqSeWKs5nb3ke3TFSoS09QKeKZJVUJPC/bdfMlThp1jj1E
         JGBetFbyvjn0OU8JbdqP+ZONbmojM+vMUbCC8+Vknl0k9n1jV3gwKL0FaV4YiGCodv5o
         sx6W/WKwcwXFXqiSoppXKrDE22buJh+XJWJ30PSkqX8jZoCjjIJvNHLELdcqp9jI/riL
         PmkPcAwcKR8FfEXywq8vzkixK3rYBuwxi2reSKlE4qe1nQFokHOlijvgYLmnYelMfNAQ
         Ocow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=YZUjAMI61frHwsGBUl1u718eVkak4wUh6JhRLUE3SNU=;
        fh=Oy8dv72KUccseaSKXuESziahek/U8XqVpKqHSBYfNE0=;
        b=ffPykK1OUdman4Q9ATUSjjlkljIcIYQNDAUi3csgS78dJ67htgNjRk7q0d/JTMD8Ab
         kUjYmI1iHox0RxE/U8CWWwjAoV19OizKN3Q8daOjqI8gKq3MdhebDJVwYUoXc027R6KN
         CBQlfgBtBUmA0CIpR1EvIbFHkXl/bSUrVfgSbTF6vMtWiiJW8KJ8KN2dpM4GoKFYKkp3
         e26fE1pA8fOzMVfYQjObeiFmSNxjhus8GRib6l6pbot5JS2Bf6AQPg4gNdq6H/5Old1C
         9Jg4WR8Lf4zXrHdIj9KJr+0VHz2MyNUmKeOMgXrlV03q7BdJU9YNcWLMQG+LTAPPQrs6
         UXPA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LjFKgDxe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7cd01021351si1146660685a.593.2025.05.13.10.44.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 May 2025 10:44:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LjFKgDxe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uEtfq-0003Os-4x; Tue, 13 May 2025 13:44:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uEtbZ-0008Da-Cw
 for qemu-arm@nongnu.org; Tue, 13 May 2025 13:39:49 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uEtbX-00038X-JW
 for qemu-arm@nongnu.org; Tue, 13 May 2025 13:39:49 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43cfebc343dso39607015e9.2
 for <qemu-arm@nongnu.org>; Tue, 13 May 2025 10:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747157986; x=1747762786; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YZUjAMI61frHwsGBUl1u718eVkak4wUh6JhRLUE3SNU=;
 b=LjFKgDxeOXmbcmlYajA9+glyROi11ehKDqpeIV1Hyh2FutMmIGiDhD1LP86hej9dlN
 0spvGxCtMGD1xpU/B7RCWu0f8DJBP/EMOTBjqhMNxXsNJJtQXFYuorZz5n377w20ah+4
 l/+Uh2MU0Z/pWrAfzIh0xf4NybB4QWZtYXqle3cfPEUdmMN4h5rcB20WEhEQAV9Lf9+H
 mB7VirJ5rqRL3aHevfTv1FIZ7n1ocEuuAjul8aGHwL2iKdJvbauVX5P5vWZqXiNfC3L6
 2D/G/ehZVCXJyWndczz+MekXeUfDFaStGQ0Q0fD7uzFGsQXq5ope0h8L+fuXyYEGN3XG
 enAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747157986; x=1747762786;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YZUjAMI61frHwsGBUl1u718eVkak4wUh6JhRLUE3SNU=;
 b=uLcwkOmrM5U+Ji4LjTkz/h0AVzBL7H+4AM21RgUCjJ/5ATYRS1gfJSQ744Spxjb6Cb
 Uv7/pMCATnYbWPzSghJ4JAykSCwXm8krqN4PuL8mkVAw1s10WOLK9UyVMAlU4EA32Vrg
 CgPJ8wH1kLKRioAYZE7WdkHImex6fffIXEZdsYtsvYDFljj8EtEWzefdhgC2s8x+XHfk
 9tnXnaURQiFQY7Ih/QOQxhBpdkC1NNlfaEbFIryAOBfzUv+14fJjjPlwupC6gVcA8h+N
 nesiV/cj1t9zHUEY2+rjGSJNJjxwIllCxloHJWxZcG8/PzT6ZN+pSAd3shv7/X2maviq
 PpUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjGbUG+Bcj7rJpoZMi0ttsAQ/VdAWaiJPDFeT9v+DrWT1Yz+DDMBMU4gJd4OIajHvx9Zq1ImoaYw==@nongnu.org
X-Gm-Message-State: AOJu0YzxZGWtUZGaBtrlFfCNsFaDni5iL3JzPNnP3Mcny8kHyiXZ4YZG
 DEMWmtj7Kh2Y1Rk0iGeA6ADGcIXqP5YIsjhXW2LeXXQTrYhCQWASfSpETWldXIM=
X-Gm-Gg: ASbGncvk2n+9HIQbLbxrBiYCIpiN445jm3PjcAsEQcp3R74rWflOTPjyKA/UTDJg/LB
 NDWp67oJuFQPc45SZftOv3rPCGCN2clDZjPlDY3GqNVr6WcJbYZd/CIK4wTmQBpl8CAhJ11wyBS
 zgyP1OJDt/SEqAgP2DI5liLteUQtLjAROFp3q2YzX69p278nTo3klt7Js26YpqOgW8M+07LKnO/
 g5eU+ApaOHrDNhn2crvnU4f3m7XYuHyEmag37oEtDrHULAoWp8602MXPqufpDcmBGAoVgsfUf1Z
 FpKxiqRl9dAxxW3xwYXjjQicLnh6V4E3BDgQLL6tfUx7xyqhf7R4IpyH4+i/GGfTDtlo66JwUrT
 KRlf/igwDXyWFa0FYO9m++i8UAs6j
X-Received: by 2002:a05:600c:1e89:b0:43c:fa24:8721 with SMTP id
 5b1f17b1804b1-442f210fa5emr2720075e9.17.1747157985932; 
 Tue, 13 May 2025 10:39:45 -0700 (PDT)
Received: from localhost.localdomain (110.8.30.213.rev.vodafone.pt.
 [213.30.8.110]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442cd32f331sm221365035e9.13.2025.05.13.10.39.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 13 May 2025 10:39:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 03/19] target/arm: Only link with zlib when TCG is enabled
Date: Tue, 13 May 2025 18:39:12 +0100
Message-ID: <20250513173928.77376-4-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250513173928.77376-1-philmd@linaro.org>
References: <20250513173928.77376-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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
X-TUID: iwnbvwx8NaDw

Since commit 538b764d341 ("target/arm: Move minor arithmetic
helpers out of helper.c") we only use the zlib helpers under
TCG.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/meson.build     | 1 -
 target/arm/tcg/meson.build | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index 2747f4b404c..dcba4ef3792 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -3,7 +3,6 @@ arm_common_ss = ss.source_set()
 arm_ss.add(files(
   'gdbstub.c',
 ))
-arm_ss.add(zlib)
 
 arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
   'cpu64.c',
diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 2d1502ba882..c59f0f03a1b 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -56,6 +56,8 @@ arm_system_ss.add(files(
 arm_system_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('cpu-v7m.c'))
 arm_user_ss.add(when: 'TARGET_AARCH64', if_false: files('cpu-v7m.c'))
 
+arm_common_ss.add(zlib)
+
 arm_common_ss.add(files(
   'arith_helper.c',
   'crypto_helper.c',
-- 
2.47.1

