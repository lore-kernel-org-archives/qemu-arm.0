Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp629717lfr;
        Fri, 16 Apr 2021 11:31:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrCCbW5tq8IxlYBxCPfek4iflstW5eZuC7VL68tis+8PLDvbJg3f/h1tX043uXklJhI4hP
X-Received: by 2002:a05:6e02:58c:: with SMTP id c12mr8381849ils.152.1618597919066;
        Fri, 16 Apr 2021 11:31:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618597919; cv=none;
        d=google.com; s=arc-20160816;
        b=z9SfpOUZhrfeQ8t2w/c7YUykYOXSS8kKx4EDIjHRXlYnvJTtVfP4GkCFlZkLj4s2JA
         UEhLDKQVV4/Z9vK5jFwzH0YMGPL6fT/V/42p17sJ2PoxxDSGkJV1uqxxtXDwynBPfxct
         GSaiCTeM6AmKfD8JaLzI5HpPEbrykzx5pjkojb/t41ADiE8i9c88/pQjeTen4zhVa+o3
         HHTYknMAxSNjTNQykHcbYwCpexk6H1w6HPDu7DzazbY2TUaF7cO4Jh5Uox6tXwlcCpLt
         FnaXUQ/qvzhQ6fmq1nrY+HGmuQUM77Ata8KGBE6tJemt4Ogh36o3ibi6eiev28GxxqRY
         LooQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=MRiN8JGM9eYShplxibiJfAaD7a9FxgKLo1Lkxp1IlB0=;
        b=o/Mggyr3cG65xvX45yQLoCh69MwDP7J+Z2GMHH4SBKVogZ64wkicd/+y7QNieOFNor
         wKF0zDxLo3WsDfp9zi3S7IB39wQDDvFu83NtcHjpaCupxedOMk8gAT5mt1YQwxbrZpI4
         o6VOk45hs4BZlKdkQMmBj6yK4NRhczPCawsr/PJK4qM0cNUfTo+cwfxuVW4o7bYbHVYF
         Rt1xNSZfsr1Stbm0t/ZlRzrYbmFNXz4UlikiJblpWGRfuQPbKy3oNFy+8fzDtewWRmlp
         +tjeM0O4JImUWHX5RqG6hXjFtM23uTVtyPQbsyut3C60lJlJMDwUCsAzKavcmoVuUS05
         VuTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=si7jIqgK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z10si4909788ilp.153.2021.04.16.11.31.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 11:31:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=si7jIqgK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXTG2-0001Gx-9c
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 14:31:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXTFJ-0000g7-VZ
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 14:31:13 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:36664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXTFG-0003fF-CO
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 14:31:13 -0400
Received: by mail-pf1-x42e.google.com with SMTP id c3so90644pfo.3
 for <qemu-arm@nongnu.org>; Fri, 16 Apr 2021 11:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MRiN8JGM9eYShplxibiJfAaD7a9FxgKLo1Lkxp1IlB0=;
 b=si7jIqgKlvUT5186r8NpASDthDX/Zo+WjXR7DL/Rn0NiO/C6oLBY9zUfMe+YOa5tYe
 o0+nAx/ld0jBLJRLIj0vgpHzFYwipV6g+XBu8e0Ovozf18rZx40PhFpw5zz2sOd3YpUE
 mr+ySYON1cvP6pZA6VNaJVeDkcvEVoR1Bi1wm7rLGiBvOn2gskcuO5UqZKFf0EWXmEXc
 y6rqyQbRd9CxMgYJynAsxXlA3z+MNs6GGPa5a7tQXjGH1sm8/hY9uCxM+hl8yuBBxSGu
 PYUFqwtoUy/tjjNrILyGA0mH/aKf3NIBbTM2NibMACHq6yUGfgYbfhJNvsbGEFHoEKeM
 bjmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MRiN8JGM9eYShplxibiJfAaD7a9FxgKLo1Lkxp1IlB0=;
 b=QBP5EoajgaHwapmX4QF53JwPrWxxLp70ngaanLu553MttcGbvrgMW+gwIaGJdzmTAj
 Ia18D3Sm/zy6JbStgN9ApJSMmcsGFCgqrTnIn/c1rHK4rP2Z9Zh1lunecJfAKgHKd4Mb
 3pUuhVHyOm6KIbzKQYGd2/NEEA7NX9h72xFkY3LEODD6UbPbQYyRd4DaMqpDeUAzgOkj
 Lr/FCrtDe2TglgY/+VKAXkwDmHdmWbxwUZKt1IbyWOtzN8Br2Nsxba+UOCOkQqPZJ94/
 H34nRMrqy+DbpEgPe52GOhQ5bkad3lwpIwTsmqX/eurQnYFRJaQW2yshW98K+cngyFVs
 yLIg==
X-Gm-Message-State: AOAM530PsR2bXDnw4UxEqvpQN1BcZxvHAMoRrkdfxDYNw8gfoQqSu4iS
 7jHMiICHVaUhydBX3bLf1PC75xCGKWW/5A==
X-Received: by 2002:a63:338b:: with SMTP id z133mr370901pgz.442.1618597868677; 
 Fri, 16 Apr 2021 11:31:08 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id p18sm3057307pju.3.2021.04.16.11.31.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 11:31:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 for-6.1 0/9] target/arm mte fixes
Date: Fri, 16 Apr 2021 11:30:57 -0700
Message-Id: <20210416183106.1516563-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
X-TUID: MltFdtCKEuda

Changes for v5:
  * Rebase.  Three patches upstream and a minor conflict fixed.

Changes for v4:
  * Fix tag count computation error in mte_checkN, which when used
    by mte_check1 in patch 5, caused all sorts of KASAN failures.
  * Fix PAGE_ANON / PAGE_TARGET_1 overlap.


r~


Richard Henderson (9):
  target/arm: Fix mte_checkN
  target/arm: Split out mte_probe_int
  target/arm: Fix unaligned checks for mte_check1, mte_probe1
  test/tcg/aarch64: Add mte-5
  target/arm: Replace MTEDESC ESIZE+TSIZE with SIZEM1
  target/arm: Merge mte_check1, mte_checkN
  target/arm: Rename mte_probe1 to mte_probe
  target/arm: Simplify sve mte checking
  target/arm: Remove log2_esize parameter to gen_mte_checkN

 target/arm/helper-a64.h           |   3 +-
 target/arm/internals.h            |  11 +-
 target/arm/translate-a64.h        |   2 +-
 target/arm/mte_helper.c           | 183 ++++++++++++------------------
 target/arm/sve_helper.c           | 100 ++++++----------
 target/arm/translate-a64.c        |  22 ++--
 target/arm/translate-sve.c        |   9 +-
 tests/tcg/aarch64/mte-5.c         |  44 +++++++
 tests/tcg/aarch64/Makefile.target |   2 +-
 9 files changed, 172 insertions(+), 204 deletions(-)
 create mode 100644 tests/tcg/aarch64/mte-5.c

-- 
2.25.1

