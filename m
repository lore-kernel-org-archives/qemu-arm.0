Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp847032lfc;
        Fri, 23 Jul 2021 13:34:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/1jChZAAqYr1O7SfDSL1IW6jdOwRpB2+SJXht/8+/SGqwsay7Y4MYULCIyqbmAX/VFN0F
X-Received: by 2002:a67:6d05:: with SMTP id i5mr6397538vsc.23.1627072446224;
        Fri, 23 Jul 2021 13:34:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627072446; cv=none;
        d=google.com; s=arc-20160816;
        b=igTNu42qhlKlI9Q12hRZki6sDoS0D2P7mcu94hQeSpoJT2HQLW1pJrJlXFpHuLgyx3
         JXQN8BYTj1XyWAJ+GGxnixY4tvnQ9wiuP+qTjUVqvsiZsKd/86DOfIK4uJukRjMCW8Xx
         FvoapKBYhQFt7JEyu7wYxAgbNsC/H1Q45VQDDy7Y7732sU6EaRoYen9944lUvUzRyv15
         WliKoOUIraPAIw5/hbLKHUxornFJ+z5z1eMeo2MXPg++YJ2DjqNJy9UOz9Yr0chibL/6
         eZD/XX4OfKWGNfXZCBt3T4FPuTMufdo0BlzCeDDc9McHT0VUlnb4a0yartc6MKswbQof
         BPog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=94RKL2dHCWN4arLXkSKmP5N4w53Eo7Be2NyOw7kSRDg=;
        b=0yKDXl69pFJ4eLLbQ+H36WgyGMJ4+1XyKhlnZYabb+sfsq/0oO7xnu6dvB0GK9TptF
         SX2fmvTRi1NlxFpv6TzRxAO7f4nUMiFAd7daqV/P6b4TK597um/CuMzjenQFKaNjc/6f
         aG9ZS/PngEPlOCzDkj1W5Gi4/hxXxzIeaJSwKQd0acdD7doM+vg2djFtM4NiD5Iabopr
         RqBYNBjcOl8BCUq9e5sgHsWLD0qyCnOmKrP70gUHj99kJvY28h2KzkRM3Mo5TVmTOC1k
         KwNg7cVa0hBT1PU16LD0SA30DK+NEq0FHkX0YF8FAUn235UR+HsF6lxlNO8UG4gP8Ja7
         /GrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VoxlA6uZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s128si4416475vss.69.2021.07.23.13.34.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Jul 2021 13:34:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VoxlA6uZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m71rx-0000BS-Eh
	for alex.bennee@linaro.org; Fri, 23 Jul 2021 16:34:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m71rk-00006l-Oq
 for qemu-arm@nongnu.org; Fri, 23 Jul 2021 16:33:52 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:39482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m71rh-0008AY-Ax
 for qemu-arm@nongnu.org; Fri, 23 Jul 2021 16:33:52 -0400
Received: by mail-pl1-x634.google.com with SMTP id e5so2474059pld.6
 for <qemu-arm@nongnu.org>; Fri, 23 Jul 2021 13:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=94RKL2dHCWN4arLXkSKmP5N4w53Eo7Be2NyOw7kSRDg=;
 b=VoxlA6uZVEbU9RDiYFH7KK6JZBfFWwt1rYggooljZk6FRUH1uYmwF/PYbrAnXAweR7
 7AjeX11ZUGFTVTIA+sk3t6wq7f/2vrnOQIUFeb5C8DuNWi0L5GKMAF2gDY1Jk209Hyod
 h7HraWTnCnKMVZlNJ1br9MLaXQwXAKDA3TZKejRdKnCL+pFbLDMOcWd4TvKxWbFQ2fbz
 o4lTUpnzez0LUNuMYFVD3/aswHMjvWriQ8i6kUQY2N37P8aZp5+vtiejZUNN7RGBNdV+
 fdryR4W7sJSNOJvLPaKuAeku6h5t69Vnebba/GpQIGW38XSq2hXIx9/r4++zbGD2zmWM
 pAfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=94RKL2dHCWN4arLXkSKmP5N4w53Eo7Be2NyOw7kSRDg=;
 b=RIQ9NDV3u6A4s/+kGEQq7iaCA6jDatiXux7mj7FcgzE5dWPuF3znx0nqo8UAmyuaNi
 R2kGDYiXQgv9MNnbs1E2QZ6R3LqLTh92acunEw60lY3aMHnetFkHVi9W+wJ2YdzCC8cn
 fychcH41gDqvuKjU1Rf/2Vev1WIVwKwph+0dkJJLS3lGn981L2zKFTxJ7dgISvkKaOzL
 mI6GiBn7bTktqVyLPqNucNW8VMx765WNedjd1AwDKESceH47e/WKvtEP96MR9qbPcXtU
 JnbaMzxYlYsGtpsOWTUgFf7a7QcX38tMZSnOukoYXeGVgEPf8nBS+6GCibUN0H86pNV6
 QlXA==
X-Gm-Message-State: AOAM531+mDyB4qtg4kNcmOGxvHBXmwm+jHn5zm+2w2olCyecmO4ADBGh
 YLj40BV+KoX561myh+/i906kNQ==
X-Received: by 2002:a17:90b:207:: with SMTP id
 fy7mr4892969pjb.18.1627072427557; 
 Fri, 23 Jul 2021 13:33:47 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id v23sm6904754pje.33.2021.07.23.13.33.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 13:33:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] target/arm: Add sve-default-vector-length cpu property
Date: Fri, 23 Jul 2021 10:33:41 -1000
Message-Id: <20210723203344.968563-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TW2x+Mj0/dHp

This is intended to resolve #482.

Changes for v2:
  * Split out length bounding fix to new patch.
  * Use byte units for sve-default-vector-length.
  * Support undocumented -1 "maximum".
  * Add documentation.


r~


Richard Henderson (3):
  target/arm: Correctly bound length in sve_zcr_get_valid_len
  target/arm: Export aarch64_sve_zcr_get_valid_len
  target/arm: Add sve-default-vector-length cpu property

 docs/system/arm/cpu-features.rst | 11 ++++++
 target/arm/cpu.h                 |  5 +++
 target/arm/internals.h           | 10 ++++++
 target/arm/cpu.c                 | 14 ++++++--
 target/arm/cpu64.c               | 60 ++++++++++++++++++++++++++++++++
 target/arm/helper.c              |  8 +++--
 6 files changed, 103 insertions(+), 5 deletions(-)

-- 
2.25.1

