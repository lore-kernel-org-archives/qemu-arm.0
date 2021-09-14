Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp612209lfp;
        Tue, 14 Sep 2021 05:07:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJySsVvVHD3SZnWqQ4r93Jkb8ppP9XcRu0TsneC21LWphFKQIEbXHja+Clflyap9wO6TibU9
X-Received: by 2002:a05:6402:1116:: with SMTP id u22mr19081290edv.262.1631621263643;
        Tue, 14 Sep 2021 05:07:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631621263; cv=none;
        d=google.com; s=arc-20160816;
        b=jZsUwXLysYdYelWHi+/kMmR/1GQVjiQmFN4ovTvvDbcVlsBb6e4X+flgyvpkGif/s7
         j57qocqDZjCG/rAjcyHadruqFYX7NJLoG9y56zUdM8JL/TtlOdlsF20lK+2qfs8RzdfO
         xkPhGpEOM8Eau0IRrNnLVlz0TitqgqbKeY0+PsXH6VnG3q5dxulu8pt8KT8g/BKW2Z6W
         l+7H5F5a8Epf7eBUohTvCPTHTWTaANDi4V/EkO8/1PG08+u52mYkzl03l14HdrzixPuQ
         RGXkcmDaM3rTxIFalZSVC6xkxF36ZBsarQnwBRQccqKr8FFoe8DhPLv49p4GD3IcWbmw
         dyxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=yVzonKb3Z2paD7vGj+uwPJ4SAE1zyLr8B8FFP9nvw3Q=;
        b=RTlqYF6Cj2xRP5VwmvOmZGEk/KqahavmkVQYjUQNa59FPv0yuBT1vMgxkV1TakNvK3
         xMG9emxp+XqBcwU9kT43lQEzTnF3G+VBoMwwOI0+orzldB6YS9J2VfP5/d8IyQq3+KGS
         MZ5I2mBHvBlnVc9d+vhCPd27lh6O2Ibb2D8X0zallPzvTLFaNops4TFlXIv+oSt1S8C1
         HM16XnB8N2/60ItIHXNB1o95NYaBYUK5wfBGtTUDm9dvmP/Rg+bM1ZpOOxsC78Pogngr
         TMqHMGOoeA44g4XlVXsZC4ttdTGCBrQYNqKDJ9AUnoSowvJK5WWGkqwbFNUzINZ4bbpz
         APXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=koEqc8RL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e1si13744858edl.348.2021.09.14.05.07.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Sep 2021 05:07:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=koEqc8RL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mQ7Dy-0000f3-Nu
	for alex.bennee@linaro.org; Tue, 14 Sep 2021 08:07:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQ7Dm-0000cx-Vr
 for qemu-arm@nongnu.org; Tue, 14 Sep 2021 08:07:30 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:33549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQ7Dl-0001H8-BX
 for qemu-arm@nongnu.org; Tue, 14 Sep 2021 08:07:30 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 192-20020a1c04c9000000b002f7a4ab0a49so1854741wme.0
 for <qemu-arm@nongnu.org>; Tue, 14 Sep 2021 05:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yVzonKb3Z2paD7vGj+uwPJ4SAE1zyLr8B8FFP9nvw3Q=;
 b=koEqc8RLIlw4ibjuiAb4v2tjremAuBp1C35vwY3T35xyS5+/f9r1PJsHb7tum+vQXv
 n+IY4ihrdNMlrOxoqRV1eVC+CfeNVYT0Kf0E5BdxbOX1FHOjMVekoNay+BoaHqbwA8HT
 AtOQ3/jPTX9vP3aq+u4gKuWp8rAXc/ODf6XHHzF9SLYvLKBm0c9lqNCmWFpVZV8Lt+AY
 bPvVniRPifWyd++x+8EUCqiIYDVtwEmZgbLrBhZP4YuXWmQgl2m7p6BgAsKhstpAKemt
 XN/y5ZVcWL4VLhd2xQwg7CJGcZ6p1eWi8PsgNN8A0D6Unh5qgqBZuHyIb5UESQUz4uud
 eKtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yVzonKb3Z2paD7vGj+uwPJ4SAE1zyLr8B8FFP9nvw3Q=;
 b=ITcbeQbOaBoeu3iOIFSHE0ILgHztym8w45c7qTPaIvHx20+/obEf/dcUNuS9cP/v1Q
 0c1uObNGl4IKd4N57Us990yYHrrHDrb1iZpV8owVYxdsw3Ck13EfJEm5jQjqtv4FODqX
 df88oVn+hPvtWqhKmsFDXDVkWRp5WXjL6wnnL73Q1v462k1nZaGS5oHrjwlcQQhTCM5F
 Ebash+l4OQp6WX1nqTBxuYgYkS5dg16MNzbYFivOuPFRFPagCRam+oLw3F6BW/A+GFOk
 XLQK86C3W+tsScC5yuejQkfBRyIF6rXS5jrqyRUVDk/AEDjFRMwsMbZ1ud0UgyQuB2XV
 3UUQ==
X-Gm-Message-State: AOAM533bw5cA6z/l91PrfwCYHCGDlrsLcVaXOXKJyXSTeT2XWif5bdr3
 xI2A2OpGLQaWAWFvNEEGJpT509EFRs9NxQ==
X-Received: by 2002:a7b:cb86:: with SMTP id m6mr1822089wmi.4.1631621247620;
 Tue, 14 Sep 2021 05:07:27 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id o10sm11472466wrc.16.2021.09.14.05.07.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 05:07:27 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/3] target/arm: Set FPSCR.LTPSIZE for user-mode
Date: Tue, 14 Sep 2021 13:07:22 +0100
Message-Id: <20210914120725.24992-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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
Cc: Christophe Lyon <christophe.lyon@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yplpFbNmZcxL

This patchset fixes https://gitlab.com/qemu-project/qemu/-/issues/613
which is a bug where we weren't setting FPSCR.LTPSIZE correctly
out of reset for the user-mode emulator. The effect is that
when using an M-profile CPU with the low-overhead-branch or MVE
extensions (ie the Cortex-M55) with the linux-user QEMU the 'LE'
instruction would take a UserFault and MVE instructions would
be incorrectly predicated.

This is the result of some over-exuberant ifdeffery in the
arm_cpu_reset() function. Patch 1 fixes that so that most of
the M-profile-specific reset handling is not ifdeffed, and
when we're in user mode we specifically set the FPU state up
cleanly. Patches 2 and 3 are just follow-on tidyup.

Christophe, if you are in a position to test this series with:
 M55 (has Security, MVE and LOB)
 M33 (has Security extension but not MVE/LOB)
 M7 or M4 (no Security, but does have FPU)
that would be ideal. I don't really have much in the way of
test cases for usermode to hand, so it's possible that I
forgot something in the init of the FPU state that might break
one of those combinations. (It does fix the test case attached
to the bug report.)

thanks
-- PMM

Peter Maydell (3):
  target/arm: Don't skip M-profile reset entirely in user mode
  target/arm: Always clear exclusive monitor on reset
  target/arm: Consolidate ifdef blocks in reset

 target/arm/cpu.c | 39 ++++++++++++++++++++++++++++-----------
 1 file changed, 28 insertions(+), 11 deletions(-)

-- 
2.20.1

