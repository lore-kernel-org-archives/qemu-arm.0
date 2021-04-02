Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1745432lfg;
        Fri, 2 Apr 2021 14:42:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRm5IDCRP3J9vF0szXnr0oPd2VGwwxjed7+w6mCLWeE7LigQIUnzNrvi1ggayZDt2julIM
X-Received: by 2002:a25:74d2:: with SMTP id p201mr22230131ybc.406.1617399756453;
        Fri, 02 Apr 2021 14:42:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617399756; cv=none;
        d=google.com; s=arc-20160816;
        b=JrQi5uVBlY606d+xC30S+uqOA9gtXrbFtOjzypA6yF5vgYf14YSnqeZFy3OkSn2Rpr
         hD+RbPCRwMMUM7P/7DRztgyQ/97AaxpxEoXHx62yg5hZyLWX6IK+SmYbabRdC8jOXuX7
         X1StGNQcaainB915tBsN+Oag1NbnY59ABlE7/CfRcj4Z5oDU9mV4vH8FDMr74v0mg81D
         fRvfNGgqno6W3qUop+sUmjOSfub/LJPNr0Yfmh4dZDsbn9Q1AXpnUxl0NndNOU0kR1xN
         FwuNKGJ3cftwFJINWttqgOxvwqGHtv6kSLVmfxjrORPDLpzTV4JygxjnzrsaNR0yhXpa
         kxXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=my/oizYOfGSKHjqFxgz12b0sXRSUCcnmLjwztszRaTU=;
        b=EI/dP+66s/uYVbqp0v7NVy3/zyGjG7EcLgGjUGiuWjFP87P1sMbIjFPvVzy1xRVrNT
         m1GlYp+TaR8lkobXK30G2bZwy8Iw4YGaQSOoeiE0kKGdtvnhhKaT2yg4sVp2kPDSKIkh
         crXGASneJg736kSRi8mS9w0jqSuFwyR4tca4y2PwBZEIhKvWFXD6JZqi5aTRK0ITlkBI
         SAbLqPRtIs0iN1KkdgHihJ0dx9/NwZF/0sM12St6uGwptBa5dgiOfjHXwPK13oipCmA8
         7c+qghhYGi+BPFfTVpnP4wKaeVHW1oNA6lYUl4dAPEFR1Rhi0i5Wip5bU86bpLdvFFUb
         GPkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o+Dedswh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 129si8460034ybi.428.2021.04.02.14.42.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Apr 2021 14:42:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o+Dedswh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lSRYp-0000D7-Jx
	for alex.bennee@linaro.org; Fri, 02 Apr 2021 17:42:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSRYe-0000Cc-9J
 for qemu-arm@nongnu.org; Fri, 02 Apr 2021 17:42:24 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:47056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSRYb-0007ec-LY
 for qemu-arm@nongnu.org; Fri, 02 Apr 2021 17:42:23 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 q6-20020a17090a4306b02900c42a012202so3085497pjg.5
 for <qemu-arm@nongnu.org>; Fri, 02 Apr 2021 14:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=my/oizYOfGSKHjqFxgz12b0sXRSUCcnmLjwztszRaTU=;
 b=o+DedswhFh64UOZRWa8ZDzOkY4AboQ9SjPcJrxTk+bH2jQCI0OdTW66zJsafs9Pu3H
 SuhVjV1u0BkD6oWEc0m4L8nKmV1e2hf61jr0ul5tsCGMIylkzmhHCnSNBYQp3o91AhA+
 nJvYlfI67vgqw5MLIi53cbfeew3cGcg0SIOkZlNa5uCfP+IM3xe0dJ9MSfpGAafViYK5
 CQZQSkvjFHcOvXK2ZGkKNnir+CQ78XAOBIjpLFCT1xyJFYLuWWBnwSJ34d3ERfDxQ8jh
 8Qoe13qytOC39C11In849TvPapoLm8Sxe4aFdsk412JGRWILA3RH7DPJdbFs3MtM2/xW
 3FTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=my/oizYOfGSKHjqFxgz12b0sXRSUCcnmLjwztszRaTU=;
 b=Bp0zBlUB8V65xDt94MAmLund94ux5CABtJmGkOqi4qyyhLWEA6Hjx5kG8tTKjXYVYt
 +Ft/MurPd3HUg+wLhMind43tNnEuYbHBJ+oznk/CqboIrgB83aa2hno6e42h36XL6usR
 VVG6PfO5iedi9e3GtAIBOAJyeyzs0/m6epi8m8FS63Jqwz0SgxupnDiE44H6Vd7H0gdE
 W5nvn3jR7cDze/7QnlgkKpcS8I9pC0c070BKpCPtiAAjJ+Be+tDDfzhzqOhR7bP8kqBY
 N7B3ioiVKwY8sfSVWLBnZ8PdwsLCEFgaCx33zNLeO32zpc2OkFqnDbFshy7O/Ao01mJi
 FUkw==
X-Gm-Message-State: AOAM530KQNBSLSCFO7Brp3KkYpqmx0lDfPBlKvuxr1epYDzfI1ENfi4R
 QQ+YBSfALW90+oljGJ+A8ukPAyPfe8QxxQ==
X-Received: by 2002:a17:903:18a:b029:e6:7fc1:1c2a with SMTP id
 z10-20020a170903018ab02900e67fc11c2amr14202455plg.5.1617399740136; 
 Fri, 02 Apr 2021 14:42:20 -0700 (PDT)
Received: from localhost.localdomain
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id f16sm7923329pfj.220.2021.04.02.14.42.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Apr 2021 14:42:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/11] target/arm mte fixes
Date: Fri,  2 Apr 2021 14:42:06 -0700
Message-Id: <20210402214217.422585-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rQSNRCwv4P0H

Changes for v3:
  * linux-user mprotect fix moved to start, just to get it out
    of the way while I reworked the others.

  * Patch 2, the fix for unaligned accesses, has been split into 9.
    Hopefully these are much easier to review than previously.

    Technically only patches 1-6,11 are required for bug fixing.
    Patches 7-10 are only cleanups, but I think they're important
    for clarity post bug fixing.


r~


Richard Henderson (11):
  accel/tcg: Preserve PAGE_ANON when changing page permissions
  target/arm: Check PAGE_WRITE_ORG for MTE writeability
  target/arm: Fix unaligned mte checks for mte_checkN
  target/arm: Split out mte_probe_int
  target/arm: Fix unaligned checks for mte_check1, mte_probe1
  test/tcg/aarch64: Add mte-5
  target/arm: Replace MTEDESC ESIZE+TSIZE with SIZEM1
  target/arm: Merge mte_check1, mte_checkN
  target/arm: Rename mte_probe1 to mte_probe
  target/arm: Simplify sve mte checking
  target/arm: Remove log2_esize parameter to gen_mte_checkN

 target/arm/helper-a64.h           |   3 +-
 target/arm/internals.h            |  10 +-
 target/arm/translate-a64.h        |   2 +-
 tests/tcg/aarch64/mte.h           |   3 +-
 accel/tcg/translate-all.c         |   9 +-
 target/arm/mte_helper.c           | 169 ++++++++++++------------------
 target/arm/sve_helper.c           | 100 ++++++------------
 target/arm/translate-a64.c        |  22 ++--
 target/arm/translate-sve.c        |   9 +-
 tests/tcg/aarch64/mte-5.c         |  44 ++++++++
 tests/tcg/aarch64/mte-6.c         |  43 ++++++++
 tests/tcg/aarch64/Makefile.target |   2 +-
 12 files changed, 216 insertions(+), 200 deletions(-)
 create mode 100644 tests/tcg/aarch64/mte-5.c
 create mode 100644 tests/tcg/aarch64/mte-6.c

-- 
2.25.1

