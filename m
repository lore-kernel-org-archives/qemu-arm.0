Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2954940lfg;
        Tue, 9 Mar 2021 08:20:56 -0800 (PST)
X-Received: by 2002:a05:6830:3152:: with SMTP id c18mr24695296ots.191.1615306856237;
        Tue, 09 Mar 2021 08:20:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615306856; cv=none;
        d=google.com; s=arc-20160816;
        b=abx2tKAOm5Wy/ub/sx4ADwu3g9vyBwYoCAyMuIqzrEyJye/FJfi5ZILjGoHSFlLCOR
         0/MELQeTu3fX6dI4ctVYon705GVBpC5cXbNezK9DLvrMH4wBpnfx+z2N35wwM+ucL+31
         dunKY6W1nnM014cUDjgTzG3Xs2pJduq24Aq7DSBd0mz9syXpEW5VGelGmCNoeaxulDZH
         qTa3dvq15JFibfEDIOGTqsypo7qyyDThGy5JnKIaWBcxrcH+h9dvBiUifhNH8ewdDb3d
         /EKFQoqc8nBXGxGz02RtAArwovFzQiKwkeaHPVDfhMyXGWQi+/qOLVIBrnQ40fMfVPpm
         0X3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=MBA7VlgaL7sj30xRXq/QblNTMSN0MmjXoz+f7WQsSFg=;
        b=QyWIBE6gLylIJnL0va8scJLCmh6eEC7/4BNzJhy3U4BJtxS15pPSQ2R5ujCiTR7/T0
         pee/Ze9DSv7O3tPRH60amex1Jmuk/fFnTckUJTVSpQzXwW60qy3k2t+GPCQzUpQOGXGg
         rDCzTfSBHblnxbzYKwZw1fu6BXbf5B7GatS6CXGXs+0zS4nOI0FSvbFS1caxiodb22qe
         Xv+mldw0x8ZykLMjNxbMCZ5BMyOrPs8UnELyaVaRP/aEKIGRf0tRPW7s5kBEh02c5ojm
         xQuBNmCMyo8CBCm1NGggTfpO9yr1oOSAy7sLLFCXGF6OTAw2fFcrIYBaES5ej7b+D9lr
         PAow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=j7w3w+yK;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a14sor2069688otr.137.2021.03.09.08.20.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Mar 2021 08:20:56 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=j7w3w+yK;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MBA7VlgaL7sj30xRXq/QblNTMSN0MmjXoz+f7WQsSFg=;
        b=j7w3w+yKwBoa+bodyFP8uP5Pk8rlksQZUAZGaZcI/erPHCXHpQBQ2hsyjSphBqW1/o
         1t5n4LecC96y55LAsoLB7SvIrSmYfakWlqZDAluT+cZPT4V9xJgKnKrwpSSNhWKCezGE
         cWVEtsg013kc8cLSwawfITEG0frpBh04D+rQ+uQvo7SgHn0P5psIxnY/VuAN0hLyqGx2
         pwVpSzHN0vAuUlLMxIZUxVIWBBFSUfK0zsVqs3w5T4Rn+ZbvaJYVNuA0ywiM/Vk+I1U3
         u8cWgw4uySBVttH75BA1XrTJ5g3HFBRsZ/T21U3NgTr+6pUmARa+fFh+G25IeHvAvS2x
         0IoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MBA7VlgaL7sj30xRXq/QblNTMSN0MmjXoz+f7WQsSFg=;
        b=EVlhHj2FGUrUDuZyMIxBan9bdwBaXuoVm3LYa0ytQltxtUgNIbnPcO8X4kUfF+nKHs
         A3v6WKspOmF/6f1SFp2IuRbtPoTqNaMXc4UYvOvkVkjlN7bXuGoYsVitSMAB5USdPRdr
         eT/aXnGKUBbnpVaWZ1tj0kQuOuDKiTTpR6OK7oi6LPcjsOVzbkEuLfIgh/rB9aN48Z06
         YavE27KiJ7d046QJg1VT9THhRrJgNZ6m8RNj9KYVvuvWxqIgMZ80job1N2d+jwPQijmU
         VKJYJozoyXX5EvniWuvNInzNW2OfTlXOu7KHfNTNVuydN8PM0zggt3mVkcS/uu6739iW
         UVUQ==
X-Gm-Message-State: AOAM533ea9y31YVi1iT4rWEb10owPkVo7+LiiaIkRqdj2VmPoYOrOV/o
	YfsYR8ZKO6Euk8+qiaBJOT1lo1UCihoMiAW0qUs=
X-Google-Smtp-Source: ABdhPJzbhyYIuHudUpLkHuz6yTg+VCw/jmUqinpNHJihm6t49MmObiJckCqm49LBzQTM2oLklM4Clg==
X-Received: by 2002:a9d:823:: with SMTP id 32mr23535685oty.306.1615306855811;
        Tue, 09 Mar 2021 08:20:55 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id v23sm2516474ots.63.2021.03.09.08.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 08:20:55 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v4 11/78] target/arm: Implement SVE2 integer add/subtract interleaved long
Date: Tue,  9 Mar 2021 08:19:34 -0800
Message-Id: <20210309162041.23124-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: LwRS9XkQ4eNV

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      | 6 ++++++
 target/arm/translate-sve.c | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index fbfd57b23a..12be0584a8 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1178,3 +1178,9 @@ SABDLB          01000101 .. 0 ..... 00 1100 ..... .....  @rd_rn_rm
 SABDLT          01000101 .. 0 ..... 00 1101 ..... .....  @rd_rn_rm
 UABDLB          01000101 .. 0 ..... 00 1110 ..... .....  @rd_rn_rm
 UABDLT          01000101 .. 0 ..... 00 1111 ..... .....  @rd_rn_rm
+
+## SVE2 integer add/subtract interleaved long
+
+SADDLBT         01000101 .. 0 ..... 1000 00 ..... .....  @rd_rn_rm
+SSUBLBT         01000101 .. 0 ..... 1000 10 ..... .....  @rd_rn_rm
+SSUBLTB         01000101 .. 0 ..... 1000 11 ..... .....  @rd_rn_rm
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index b94561b92b..105c70dc8c 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6017,3 +6017,7 @@ DO_SVE2_ZZZ_TB(SABDLT, sabdl, true, true)
 DO_SVE2_ZZZ_TB(UADDLT, uaddl, true, true)
 DO_SVE2_ZZZ_TB(USUBLT, usubl, true, true)
 DO_SVE2_ZZZ_TB(UABDLT, uabdl, true, true)
+
+DO_SVE2_ZZZ_TB(SADDLBT, saddl, false, true)
+DO_SVE2_ZZZ_TB(SSUBLBT, ssubl, false, true)
+DO_SVE2_ZZZ_TB(SSUBLTB, ssubl, true, false)
-- 
2.25.1
