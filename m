Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp1016839lfg;
        Tue, 17 Aug 2021 18:03:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzTaeNJXGyO33Fp7Ji7bowO5/X+yWOHH4xt4VQGd6OQHNLLUEiBqe5zHsUnhOjuMhXFPJtT
X-Received: by 2002:a67:ce07:: with SMTP id s7mr5560699vsl.11.1629248609799;
        Tue, 17 Aug 2021 18:03:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629248609; cv=none;
        d=google.com; s=arc-20160816;
        b=Auo41UrwDSf5Q2MN8QoJ/O8httnRECcFKlsacmq3hcMUkeylhc4e8jtX8fHDsdfjfg
         s3P14a39lT4RNVAinCpMyw+AOMBldcAUdpw9k4i7UQyaeElecGYDmaK8i/3qiODZCP7Y
         pL6uLX9Jmg0miCeQJbyIJgqxohnkCWMN0m4mKMMWF6UHhor40/lW8NKUiPKtfNJDESYl
         yaj6ZNWMhxZ4WKZtNdlVia3n8y1190Kwu+Oat7zrcbh0Mzs46eb7Qa0+xGRF91w6DdyH
         WLWNGWOSbzuyLULNDhAyB1aHHSjRBcHRHUp1Is264HoPNEH3mPWQi4KUrOPuu/0kNJEe
         Y67w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=oK94JCVp49MDHMvJof12YEKJDZETbAsJG4e9KZDNxVw=;
        b=NKLpYl3MtPdpk5tGq97e6No3ay1Wx4FcSp02Dfe3Ts3WI3hqmH38FT2MRQHwe1iQbt
         GN3QBFc1SroxMvT9wTSdX6SZrYNbzUd+o1ZwYlhrq22D3zVbLPE622hwpXly/Gci7v2w
         +jgGxG7rb58e6PBL8RJuoBd5NaL3XSybY/IVFT/7m4vNYExoHymJEHop8Z5Qy//Hw61X
         eigFVOpbMuabsPj5zJNxDtQ1+m1jcly71qp++ARDT1oKN2MO/KDLpUmbg1uDi7SgFlpM
         TKPILBYFPViIYXlSMfiBXJNrN9vM5mAcUSGOzJHyHZa4FqpyOxKgc2NPHwTciZXBMfoO
         nNzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ih06Cs5h;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x20si2010441ual.218.2021.08.17.18.03.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Aug 2021 18:03:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ih06Cs5h;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mG9zN-0007GF-1m
	for alex.bennee@linaro.org; Tue, 17 Aug 2021 21:03:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mG9wp-00047j-7N
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 21:00:52 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:33433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mG9wk-0001KV-RJ
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 21:00:50 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 28-20020a17090a031cb0290178dcd8a4d1so4253475pje.0
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 18:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oK94JCVp49MDHMvJof12YEKJDZETbAsJG4e9KZDNxVw=;
 b=ih06Cs5hdvhFxCs4E3aTxS40EF/HFSqyyDNh/qj79ApK/9jDlvuqY7gBw7ktYesf17
 Phsg3lOpBnGO405yQgO66Q1DqXcsEerNAWEo6hq9qRYLHd161btYYuWOtsRCSuvuZS7f
 Z7kRQGP1r7jf5AgtBrDZi/zMeD5GvDjM9th6wYz9y0xJhoYlowMYfBIpJL6aXkMSwP8T
 pDj3vK7V4xCLqPYomLgalnJ3K/NBflv/Z+xL91X70HzivzWBwBT04zbeAqinbiFomYYM
 +SdC0gp4t4fvD4NIePo7pOE6ip8h5fOdT51553R8EMAyTVhMmE8TZqhWt30QqUVzr0pa
 hh7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oK94JCVp49MDHMvJof12YEKJDZETbAsJG4e9KZDNxVw=;
 b=YhBQRoxb76Wvbviy+9h0H2+MENyDKN4B0xKCZT6orXVZho7XU7rfGtbQRUOC8uxGmj
 yI2HBUA6CiSPhEYqtvKgWaseFjSWHORpkhThBMgrdj/eeHzo1IZi10Zouy4wUqX1H/hk
 TLwV7joHnLuEi7rypJ3gpTquvBn51hofgCczBF2ViKpsBZvt+srwQiGhmu7MQagrjSWd
 reTE/j+WCgjMGYOiyAN/N9T6r/5UCj0rqTFCtnoJ82GcfxcsXS/CplYc6SNKBYjw64LD
 gBikKpKkS8nqrgRCsn/t6Um/cx/mxQOHGztlLeiR7Al8wBtUCtCKQVnj4YWEQTYtNvah
 1Ymg==
X-Gm-Message-State: AOAM530Y4UZ9DP/uRB9gLj0qztkpFlmQsGTagzz3I/fDuPcdFvBBhnft
 HqBRN7KeGn9OHcvR6Cfdoe/VdpxdadX63A==
X-Received: by 2002:a17:902:748c:b029:12d:3f9a:d3a with SMTP id
 h12-20020a170902748cb029012d3f9a0d3amr4937652pll.74.1629248444599; 
 Tue, 17 Aug 2021 18:00:44 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id r13sm4567422pgl.90.2021.08.17.18.00.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 18:00:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] target/arm: Fix insn exception priorities
Date: Tue, 17 Aug 2021 15:00:37 -1000
Message-Id: <20210818010041.337010-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: B0eepZW/d7e7

As discussed earlier today at
https://lists.gnu.org/archive/html/qemu-devel/2021-08/msg02686.html

Raise pc alignment faults.
Fix single-step and pc-align priority over breakpoints.
Not yet fixing insn abort priority over breakpoints.


r~


Peter Maydell (1):
  target/arm: Take an exception if PSTATE.IL is set

Richard Henderson (3):
  target/arm: Merge disas_a64_insn into aarch64_tr_translate_insn
  target/arm: Take an exception if PC is misaligned
  target/arm: Suppress bp for exceptions with more priority

 target/arm/cpu.h           |   1 +
 target/arm/syndrome.h      |  10 ++
 target/arm/translate.h     |   2 +
 target/arm/debug_helper.c  |  23 ++++
 target/arm/helper-a64.c    |   1 +
 target/arm/helper.c        |   8 ++
 target/arm/translate-a64.c | 267 ++++++++++++++++++++-----------------
 target/arm/translate.c     |  71 ++++++++--
 8 files changed, 244 insertions(+), 139 deletions(-)

-- 
2.25.1

