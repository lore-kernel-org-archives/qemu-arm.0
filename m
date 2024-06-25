Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp584848njc;
        Mon, 24 Jun 2024 22:09:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW/km6wRfDhWg30f5RposCRSskmqwa6MGnGydq7PlUZJG63K9V9R6J+8xse6WKxMBRvvb8ycPAfbdmuKhMlmT4de7P2VONo
X-Google-Smtp-Source: AGHT+IHx9PYIzNHTeNsqfhzLxUSYkBSH6LjPf2bawIAeL0hZ1FJ7sJvGcPF6BuklG39bfJlypC+X
X-Received: by 2002:a05:622a:a40f:b0:444:f681:f2ac with SMTP id d75a77b69052e-444f681f8b2mr8063721cf.23.1719292161936;
        Mon, 24 Jun 2024 22:09:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719292161; cv=none;
        d=google.com; s=arc-20160816;
        b=MR1n69cLxB+yQtNArv2oE+on9G+2EXdmqOGwWSDuNRhW2P41k4MZSjqX4okupbQrLl
         WQa+W7sTjWpAYoDlV8dgJeZ29raD6bavbj/qv3q0udINDmELYxUArNlAzSCDGQI1cfhb
         hyWaH8onEpW0ah5CJaV9NTGW0VmGl+PB84zKsLegB07tFUDgI32KgfjWDwV/80snGsUK
         2CE12FcGAhYW4SPV4Z8HFoeBXF/iEAmwosqzUp378UEjeCg6EQgRK7DSLZadtJg9kSOi
         9SPWtAwYDyGiC15IaxJFPxoxZSsnR5+2Os+fk87YhKOZgOh/AhXA20VeGgYN6yHLbObr
         U4YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=uuKRzX/CVCBtz4u0mZkWLcpWrMUD415m7eGI+pRHqts=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=zIv8GryXPW9qqVaotS5lpUbcb02OZSxchvQjoUBuoNNiWaB+esmS60vN8NKjykIB71
         3SoNy8XWujxWBldvOHeC1BFSw5LbTJVxeVygd06YjIZL4ZUC8kAawOYwljpXmdbJa04b
         MiY2H2XVNbA/3OVV59NLxIAWU6dd01vqhJWODhT9ht0MRjuad9uOdH+gni0dV7ZVCtb0
         xin25yLR1alTQ/ltd376BgU41fg4P+jnIhB5ZBVaybluDW7CfaE++YcruvS1yiGpBF1v
         YqZtBNym6MXx+p84hbHySSK3ADuPnRaPb7lDTLqAMwryvcRuZssMUlMZyqQYiN6AgKYM
         yTig==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OII6b7ye;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-444c2ca2cf9si95421141cf.793.2024.06.24.22.09.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Jun 2024 22:09:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OII6b7ye;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sLyPg-00011M-Vq; Tue, 25 Jun 2024 01:08:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sLyPf-00010y-KY
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 01:08:15 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sLyPd-0001V0-UR
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 01:08:15 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1fa75f53f42so618875ad.0
 for <qemu-arm@nongnu.org>; Mon, 24 Jun 2024 22:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719292092; x=1719896892; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uuKRzX/CVCBtz4u0mZkWLcpWrMUD415m7eGI+pRHqts=;
 b=OII6b7yeCPvowH5p/UwQcV2q++/gVpEMNzuhhy5FP00JsutesEWS31z4HebAHpXfik
 G/QSKpibjcXdACQMqm6G7q01Peagwrp8Q69sdItXxg10g/+GzxkoGmgkrOpw+monp/CJ
 DZLFcnnL4YMsHqy0NG22khp2uCTrXGlKVbvLg+5l/iVa5rTxFRd69tOx1rzksV00tjKZ
 Zx2jwFEBFxXMWgn+w59UyESu7OV3lIEWg9ZqEc1tQWYXrxwuX3H8Vy2hCPXboU0EX0r2
 8A2WJ1ectvcqMzoewE+RUIG7wtC09bojm6RUGN4EfpeikCsRstzzMO9cUuW2DHx3JApC
 q7OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719292092; x=1719896892;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uuKRzX/CVCBtz4u0mZkWLcpWrMUD415m7eGI+pRHqts=;
 b=OD4OaaWRkSMQt0RsA1vwRIKzCSQSNZOjfVeKdZNIUADx1t3FzPLjN6SEWOoqhoDy/z
 21S9C3FfIQNmfx5UPioXH1frtXB7BoOILnuInmUo5Uk5VEUFrjJKpvrurmPeWMAlC9K5
 9Tosa5HaSveDvN6ROwze/3K5VnzKwPWSUODxGfDnN6dhb60L9VgkcVYm3WtQfRbjCkZU
 /wLUjkUmYS29E83aazBsqYfoPfaxiYqwAeSfMiMja2j0g686LiB1VihTls9xoK7eMNGm
 00IHlT2XqS4eWNW1JfjNuKEowJloz+HKRl5tr04Q9AGQYdWRehopwt3KU+xUChzFcKzd
 ftnQ==
X-Gm-Message-State: AOJu0Yz67xBcnNPcxNFlYDV79yxc/okPLjZbXyduKF1OC7y2DEbplsQM
 Vh3c9lRvLGLUQfnWT88VXGlzqHoCg1Y/dCjy7CPCG85eThW5Qso2rqF5VZ4AVa40JIQVimEqh5f
 K
X-Received: by 2002:a17:902:e9cd:b0:1fa:bcb:3db9 with SMTP id
 d9443c01a7336-1fa23f60fdfmr51840165ad.31.1719292092195; 
 Mon, 24 Jun 2024 22:08:12 -0700 (PDT)
Received: from stoup.. (174-21-76-141.tukw.qwest.net. [174.21.76.141])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f9ebbc72e9sm70843865ad.296.2024.06.24.22.08.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 22:08:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 00/13] target/arm: AdvSIMD conversion, part 2
Date: Mon, 24 Jun 2024 22:07:57 -0700
Message-Id: <20240625050810.1475643-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
X-TUID: ZZXJBHLVdCpY

Convert another hand-full of instructions, plus fixes
for two issues that are related.


r~


Richard Henderson (13):
  target/arm: Fix VCMLA Dd, Dn, Dm[idx]
  target/arm: Fix SQDMULH (by element) with Q=0
  target/arm: Fix FJCVTZS vs flush-to-zero
  target/arm: Convert SQRDMLAH, SQRDMLSH to decodetree
  target/arm: Convert SDOT, UDOT to decodetree
  target/arm: Convert SUDOT, USDOT to decodetree
  target/arm: Convert BFDOT to decodetree
  target/arm: Convert BFMLALB, BFMLALT to decodetree
  target/arm: Convert BFMMLA, SMMLA, UMMLA, USMMLA to decodetree
  target/arm: Add data argument to do_fp3_vector
  target/arm: Convert FCADD to decodetree
  target/arm: Convert FCMLA to decodetree
  target/arm: Delete dead code from disas_simd_indexed

 target/arm/helper.h               |  10 +
 target/arm/tcg/a64.decode         |  42 ++
 target/arm/tcg/translate-a64.c    | 811 +++++++++---------------------
 target/arm/tcg/vec_helper.c       | 100 +++-
 target/arm/vfp_helper.c           |  18 +-
 tests/tcg/aarch64/test-2375.c     |  20 +
 tests/tcg/aarch64/Makefile.target |   3 +-
 7 files changed, 422 insertions(+), 582 deletions(-)
 create mode 100644 tests/tcg/aarch64/test-2375.c

-- 
2.34.1

