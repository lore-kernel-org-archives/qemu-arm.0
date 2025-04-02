Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp3752083njd;
        Wed, 2 Apr 2025 15:24:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW76vL0NV1TH1HV/u67J6YlF1BnkWc9vSU14jJ7KUVCfksJlmpHPcUz3SifqEReIXjdk+ztrUmMej7h9g==@linaro.org
X-Google-Smtp-Source: AGHT+IFKUdSxmqiWUMg+r2rUcesOd7/bczgsCLVJ/Qy0Om1AFIflGb7zlDVkflFTEq6Yp2xb/VST
X-Received: by 2002:a05:6214:19ca:b0:6e8:f9e6:c4e2 with SMTP id 6a1803df08f44-6eed61da111mr269986016d6.32.1743632696009;
        Wed, 02 Apr 2025 15:24:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743632695; cv=none;
        d=google.com; s=arc-20240605;
        b=eiBGrah4Nf+WYMyIvNLABrM8aMVlC6M7+ug20hXwNW3VEhAPKvUfOudZaxKKVGl4yW
         EUIoYizKqPLuMqvvlTIl2MtTbS6AXBwqcaLbl6DuU5+oa6YyXMTwBRjWd40XoDTdU9Jm
         7gAIxkp5uO5caKjmWKfg+eBPu+lulA307QoRLOyV5MMQ8ElqAVQE52UOajcN/HfShuus
         RLfGPhUeKY129JdktX1jcnrym/ddvx9LDnY+yabJ6EOGDiNTR3zmsE7ydXvdPp/AH7gq
         t0hbNrMrYOE8fyg3OL4PuHO7BkxAFH+nWlIwpQDOeEv1mXVOlF5n35rKd6pYm2E1gWvR
         5RmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=bumN4/Pb+TslNnZNvPYQc/X9CuHJhfIAJHquLppK698=;
        fh=ILu9n9UJYyGKJ+F9rVBU1LrxK5aJ3ihMVgUEh7OR7WA=;
        b=iQILpC2vKn0WuI51eIXA0Fgh0+R+ck9Yn2IDySk2QG25Q8meQXp6tGEOXm7npchKdL
         +N6R28ziXXS7ANCYp+hlwFk8bUIwNcuvpZlWS8Q0WCqhQxRXqQ/j3oJVsSqEqP8zkxbU
         oHqfNQy5IT/zbddcmQYNzRi2CM2LsqmRl1Wnvdr8r2fHklEnFG1CGUL2bWECCvPOTpJU
         zUGqQ5CRyGfCZ0ChmjMeB2j2QZwmdafGMljF6Ezel2vOMV/PfFn6h8tQ9WbkT5/QM2Mx
         ChgYLL1lmgAbJ8PHgZqoU3oa0tPYAB+CxS8XLGuqeJAQCjXVMPM09P2xiqj4bIvxsRo4
         W0zw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="n+Fna2/+";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c76eaba888si3316085a.489.2025.04.02.15.24.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Apr 2025 15:24:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="n+Fna2/+";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u06V6-0004fZ-Vf; Wed, 02 Apr 2025 18:24:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u06V5-0004ew-5W
 for qemu-arm@nongnu.org; Wed, 02 Apr 2025 18:23:59 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u06V3-0002P5-FF
 for qemu-arm@nongnu.org; Wed, 02 Apr 2025 18:23:58 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43ea40a6e98so1940695e9.1
 for <qemu-arm@nongnu.org>; Wed, 02 Apr 2025 15:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743632636; x=1744237436; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bumN4/Pb+TslNnZNvPYQc/X9CuHJhfIAJHquLppK698=;
 b=n+Fna2/+t8qjKhit74mpD9Cqe6AtVirLI5Ybr3pib0BBIuM2EH6kS7Nmf4wiZMJ2op
 EauMxRSwsAzcpOwzRtH/ZNylemdB3g/pc+1lpmGTruV24hv7g7lCSt6K24h9Ri7VQUA8
 5ZuGqzqrnNmblgN6uoP7rxVbW0dGNo/gHSnt6fR1AyVHsnO430Jw9N/QwsE0aGkcyhuo
 ImQVTWuwcNjDiHXRIJ6RGKbO2my63KIHEb36d3/x0xco9SV+GJcvXhR64XRw4zJaxD07
 PdijCeKGju3ucgYtczJ+apKLgGMWsLfSWWGGN8mJoqvFpcKmBD2JXgho/htvLW+tgsGG
 /Rqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743632636; x=1744237436;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bumN4/Pb+TslNnZNvPYQc/X9CuHJhfIAJHquLppK698=;
 b=pz/3HgwrdCA2j56bU17xftXhIsz0z6yjnoI7662yuT9OVLCGb4chQ/d8R2wMxCkiv2
 B/RpD3DHdqeKPncH1zrIts3a6mvROMuh+vFEYaQVMAvnSEe1WKzDFEngtugqw1TPIx4w
 G9lft0iaq3UUSBmnhH9C+N48om6le+NCykooZKfjaPC5TtZBH6/C3drjxrAr47dMq1YT
 vy/fLopSavJniHVSS2+0f8o2mHgkpgBNdqCSuCrz6SBVX6z0fo893cgtllOfSsYFCMO/
 Th/mdESfhMv8lEqwF+nQ3X4NRaF+3RPRYxgAkhs6M/QU1R47LEDvaX+XEYpBgmM7bsfi
 jVig==
X-Gm-Message-State: AOJu0YyoKv3Fqq0CkRv7q53xUXR1AxhIfUM/HcXlOeu0uv8/A5uVZKZv
 lbwXYn7jbJYL+ZRRiGOxCbuylk95BjtuG8UeZiNckn70ceFk9i5akYHJOBQaYkVek+HOcz8+gV+
 X
X-Gm-Gg: ASbGncvOU4AQh+vIBr/uzts22MneZycpppPepQ5VUSDnurP0GtGJN69dj1dcQm88anX
 pRXrLUvTTRFk5BhtP2Ym345y5JWjqIsKB+aXBoULqfjw0vSuIx8504etodA6KReSBQzgtAlrJ0/
 EeO3zsyCisoGJfcGaaCIbx07Yj9Gluk/nseb3+Z8/IpU3po0GORV/pnmvo4xpS/9omEDVjYREkH
 I3K+hvK9UhBwe7F7bfwGM0Ap9mFIbZQlb6CGSnTJAJ8SCdYPkW4NhcGhayfwpSiFClaJactFakP
 MWaYBRpjA2IiH4xWTVYpz9w8KF9RPDfiIEKNOMhsHZ4QhEFuLrAaZ76/SHI1qzgr2HlcrAiRWOY
 /ZTHNt3TUZUfOE66MdYw=
X-Received: by 2002:a05:600c:1d88:b0:439:9e13:2dd7 with SMTP id
 5b1f17b1804b1-43eb5c180b8mr45591705e9.2.1743632635736; 
 Wed, 02 Apr 2025 15:23:55 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec3669d0fsm158475e9.36.2025.04.02.15.23.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 02 Apr 2025 15:23:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.1 04/13] target/arm/hvf: Include missing 'cpu-qom.h'
 header
Date: Thu,  3 Apr 2025 00:23:24 +0200
Message-ID: <20250402222334.66511-5-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250402222334.66511-1-philmd@linaro.org>
References: <20250402222334.66511-1-philmd@linaro.org>
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
X-TUID: sn4yz3Fp9pnd

ARMCPU typedef is declared in "cpu-qom.h". Include it in
order to avoid when refactoring unrelated headers:

  target/arm/hvf_arm.h:23:41: error: unknown type name 'ARMCPU'
     23 | void hvf_arm_set_cpu_features_from_host(ARMCPU *cpu);
        |                                         ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/hvf_arm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/hvf_arm.h b/target/arm/hvf_arm.h
index 26c717b3826..ee5545f2d10 100644
--- a/target/arm/hvf_arm.h
+++ b/target/arm/hvf_arm.h
@@ -11,7 +11,7 @@
 #ifndef QEMU_HVF_ARM_H
 #define QEMU_HVF_ARM_H
 
-#include "cpu.h"
+#include "target/arm/cpu-qom.h"
 
 /**
  * hvf_arm_init_debug() - initialize guest debug capabilities
-- 
2.47.1

