Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp368383nji;
        Wed, 11 Sep 2024 19:43:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV3LTls7J3g2EvBv2BKhAEwYlq7Oz2tH6Mwitm/9MkCCB07mzOUOsMgLGgqtgzG72xVeAHw4eITFefffA==@linaro.org
X-Google-Smtp-Source: AGHT+IF3QYtsVIfssi04pfteNf8k3JjjQ43kHMYabyJ7CTSjeezkxD7yDTJvQNTZQLrkStOLJOFr
X-Received: by 2002:ac8:7dcd:0:b0:458:4fa9:44b5 with SMTP id d75a77b69052e-45860325dafmr22010661cf.31.1726109017432;
        Wed, 11 Sep 2024 19:43:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726109017; cv=none;
        d=google.com; s=arc-20240605;
        b=LSJ8UDSnHD9CZLIdPCIdk0lzW9ltktfutQ8bZuEKpYcEmkFH4Gh46Rk8NuwNQ5KDxL
         16VYEVYSewyG8pkmuiNnZQ7zZrslXp/cUTYA6uNoy7bPHcpM1rehBTQYT6GSvQhRtqnq
         BiHHCSdPITwrlGCXLmGV5wVQXUoArHBGCEXCEYdRL/N5LZO6aRTmWSrXC/verzZnvnqQ
         cvStJZ+/pmyqCCdyPtglwCV4j3a742YG6gGQ672ZKpVlLl3xyqclxueTCIm4+9HSOf/8
         vxFlStfFL3iPwUHaUjZfLxc80HllMbYPaZq1+7i2F92NmxFR54ZlNp/EisQ2tt+9s4Z/
         kNkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=5rSee6UFe7Lf0NZi/yepcm1lhEnnmfys1BBoL6fXN/Q=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=SHgsZsu202jIZvsC6S/+h8LfAPavgR4KxMPlNGaOnZtf9w4Oaj7cg2++j78D+nVNcY
         lp21PawmbHehgtWHKWrPrB3sA5y67j/Pvw49s2tSmRyEVdbzNfwgYkLRsOHFKujt3rtU
         t+EzFNZr6feIzwU/eTRqzi7azfY7kc9+I5xDMLWFpJIvbgDbLTLBH99qDASxrbfjcjmS
         q8c3ZQUyb9QoWcdYZ/DPyviZz1VDaFJW1Cwzw9vPmUm4LoZpecsgvn3G3oeRQDlYeqoM
         D8e8u7PKLQNxc5huNiE5WMoSQYBOyxuhYlM3qvXQDuLVg2+Bl1F+Fl4f9kmeSZCFYBev
         DS7A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jarkP0AA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45822f3de6dsi116827731cf.252.2024.09.11.19.43.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Sep 2024 19:43:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jarkP0AA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1soZlr-0002PQ-7M; Wed, 11 Sep 2024 22:41:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1soZlo-0002Ff-MJ
 for qemu-devel@nongnu.org; Wed, 11 Sep 2024 22:41:20 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1soZlm-00047H-OE
 for qemu-devel@nongnu.org; Wed, 11 Sep 2024 22:41:20 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-20543fdb7acso4003565ad.1
 for <qemu-devel@nongnu.org>; Wed, 11 Sep 2024 19:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726108877; x=1726713677; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5rSee6UFe7Lf0NZi/yepcm1lhEnnmfys1BBoL6fXN/Q=;
 b=jarkP0AAiAT4NIx+GxzwQ772FNqow2ZP7iFIYyvXXP2JKwqB59/FV+U/Mh/6m2L/kr
 brZbaI1hWktMf0yLwqq4+60pNok1pdNxUnR0IvEeWSlY/VGvG0WfgH3EO9v6jBLyxXGQ
 745dOxvdazwNZdn9qvEbtm8IMcPEo/wz6R8hO/FDOW+hPIiUXqt5JOkTkqI7huXpv7ti
 WFjDB/bJ8S3dU3PjDGVKkTt/pq+khllBlGC9jUqcwFXfn/MhcVpJN17fobiRyNoCfGLP
 W4Nr9cpWIH6ksEYcAYENbYDqEZQv6jyfK0is0X0qPjN745ccr8bzGlqd6D71vjFyS5Dv
 7bVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726108877; x=1726713677;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5rSee6UFe7Lf0NZi/yepcm1lhEnnmfys1BBoL6fXN/Q=;
 b=ptL3ejm7bJnTy/EswGxcjpSWmd6l5XNYws+OZ1Ht/iTapUJKIOeWFedGf8oi043/7p
 43imYG1Nc5J5mclaalccRitX8dNKX4WuR5UX9m2NwZWjbYa21MkdkDb5m5SA1b1wPC9F
 y7NvRUCoXZimngNyiJSqvzFpEIrAmBbbBuPo0abb4j66CnxXc0t+9ZnQf/JXYszN3OY+
 RCxJU/YwRd2fnndIaqdfnZKXjkRN5GUyFs3IY4MGUF0Jup/j4f3AHYC+5cf0Sk+k0ugX
 vnoa0w19Vo/rSgYs2t7EzEDW7LFMiczwIBCTuMOQZU5WOyI9hHSeacVqE6lslrPh+0xw
 Gi1Q==
X-Gm-Message-State: AOJu0YxsiHeG17Bk3Pk90R3lIHfiQh+BIO41He3OH2GUtQkznlz8xYap
 hDbxeDqRPiYVfOjbcWg1DNKmUlfgofsKTyJS8yo7RdjRtHcPVqX2SnS+ANF+t6iqjE/i328iJ1l
 0
X-Received: by 2002:a17:902:db12:b0:205:80e7:dcab with SMTP id
 d9443c01a7336-2076e35e3e2mr21568145ad.18.1726108876342; 
 Wed, 11 Sep 2024 19:41:16 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2076afe9c61sm5635915ad.231.2024.09.11.19.41.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2024 19:41:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 00/29] target/arm: AdvSIMD decodetree conversion, part 4
Date: Wed, 11 Sep 2024 19:40:45 -0700
Message-ID: <20240912024114.1097832-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: XlGx4VNrZFqy

Changes for v3:
  - Zero-extend results in Widen NeonGenNarrowEnvFn return to 64 bits

Only patch 26 needs review.

r~

Richard Henderson (29):
  target/arm: Replace tcg_gen_dupi_vec with constants in gengvec.c
  target/arm: Replace tcg_gen_dupi_vec with constants in translate-sve.c
  target/arm: Use cmpsel in gen_ushl_vec
  target/arm: Use cmpsel in gen_sshl_vec
  target/arm: Use tcg_gen_extract2_i64 for EXT
  target/arm: Convert EXT to decodetree
  target/arm: Convert TBL, TBX to decodetree
  target/arm: Convert UZP, TRN, ZIP to decodetree
  target/arm: Simplify do_reduction_op
  target/arm: Convert ADDV, *ADDLV, *MAXV, *MINV to decodetree
  target/arm: Convert FMAXNMV, FMINNMV, FMAXV, FMINV to decodetree
  target/arm: Convert FMOVI (scalar, immediate) to decodetree
  target/arm: Convert MOVI, FMOV, ORR, BIC (vector immediate) to
    decodetree
  target/arm: Introduce gen_gvec_sshr, gen_gvec_ushr
  target/arm: Fix whitespace near gen_srshr64_i64
  target/arm: Convert handle_vec_simd_shri to decodetree
  target/arm: Convert handle_vec_simd_shli to decodetree
  target/arm: Use {,s}extract in handle_vec_simd_wshli
  target/arm: Convert SSHLL, USHLL to decodetree
  target/arm: Push tcg_rnd into handle_shri_with_rndacc
  target/arm: Split out subroutines of handle_shri_with_rndacc
  target/arm: Convert SHRN, RSHRN to decodetree
  target/arm: Convert handle_scalar_simd_shri to decodetree
  target/arm: Convert handle_scalar_simd_shli to decodetree
  target/arm: Convert VQSHL, VQSHLU to gvec
  target/arm: Widen NeonGenNarrowEnvFn return to 64 bits
  target/arm: Convert SQSHL, UQSHL, SQSHLU (immediate) to decodetree
  target/arm: Convert vector [US]QSHRN, [US]QRSHRN, SQSHRUN to
    decodetree
  target/arm: Convert scalar [US]QSHRN, [US]QRSHRN, SQSHRUN to
    decodetree

 target/arm/helper.h             |   34 +-
 target/arm/tcg/translate.h      |   14 +-
 target/arm/tcg/gengvec.c        |  121 +-
 target/arm/tcg/neon_helper.c    |   76 +-
 target/arm/tcg/translate-a64.c  | 2081 +++++++++++++------------------
 target/arm/tcg/translate-neon.c |  179 +--
 target/arm/tcg/translate-sve.c  |  128 +-
 target/arm/tcg/a64.decode       |  257 ++++
 target/arm/tcg/neon-dp.decode   |    6 +-
 9 files changed, 1393 insertions(+), 1503 deletions(-)

-- 
2.43.0

