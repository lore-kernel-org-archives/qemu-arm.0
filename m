Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp365885ejc;
        Wed, 9 Aug 2023 19:36:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzH1mvwmHT80EIONhA9TNCPqDBAc1z6QSZrRgtZjJxaEPUnRAkp35/hOzqaw6msNszGYyG
X-Received: by 2002:a05:622a:108:b0:40f:dcda:ea2f with SMTP id u8-20020a05622a010800b0040fdcdaea2fmr1259007qtw.29.1691634963691;
        Wed, 09 Aug 2023 19:36:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691634963; cv=none;
        d=google.com; s=arc-20160816;
        b=0HWorAGtNSSMWDYfrpRIcr+H1AMhYuiUowyj9uP9BazKFuCBbJVCQHbpJ7Aipd/beV
         MBnd/a6KHTVl+vEN5jwb35DJKqZmJzWH/LrweBZnGKY+0L0TdyVppejIK1Wp9YKAkZNO
         2bdDAM33psc7VQGa7WXffO0CoHltb4jISqTzKzoDjjDZ87/TlnTR4ISj78Tp9MbtwxHu
         rR8SSFptycASa4kOZY/1ksy6gbaHOWzZdtXc01QVCXXx+16DFl90vkLz67UnATwq9oBc
         tvOSxVzbD3G7y/qOVZ2KFADslAgA5P842sxidNYiwPFULWQda5esP72ZycTs0ocMurFA
         Ef1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=CpX0550wKMCux/3GBST6e64zt0DiUd6H3+LGhoX5Le4=;
        fh=oweadga+1U1BKjDqlK8hSmEWEC1EUfcsKuPkDinEDsU=;
        b=gphqkuDIZ08Sk/YtHFBNl3a9nuYGTTcd3EhtCw49D2dPPtHa8/NngPsM+bpuysGCMX
         WptAaMEPNFE/eHihsHJQrhhQgzIHnQgVML6zm5tyv0IBPcUv8mJaJt1cAa7e/w4c0zC3
         1TTjfobQd0jCW1lyZfZPl4TNPvpr1hgEHE8ChhInFXVMOeuChGjMkHr24jSkZrGZFfOP
         z4YuP/+glsTYjhh0wfGNdFb1nthCcSnYaFgEwTyNake1aUOGKrHBwx9GiDtcJOfWNyHI
         aN1yyEN6xi4LXLx2XPBwiuJQePAj1V9bg00D1/9C32qhupxlKEdMtUIGfUjJ7kV5L63p
         MzAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nxE6HNRC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t29-20020a05622a181d00b00403f05ae952si326610qtc.578.2023.08.09.19.36.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Aug 2023 19:36:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nxE6HNRC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qTvWm-0000wn-2w; Wed, 09 Aug 2023 22:35:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTvWj-0000uT-N0
 for qemu-arm@nongnu.org; Wed, 09 Aug 2023 22:35:53 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTvWh-0004x0-Ov
 for qemu-arm@nongnu.org; Wed, 09 Aug 2023 22:35:53 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-686ed1d2594so396091b3a.2
 for <qemu-arm@nongnu.org>; Wed, 09 Aug 2023 19:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691634950; x=1692239750;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CpX0550wKMCux/3GBST6e64zt0DiUd6H3+LGhoX5Le4=;
 b=nxE6HNRCusB6fZYY6XNCichRSFLYz/wJ+Z80eX+cTtzkebnHEr7zNV/9ryCAMh/VX9
 xa9dGe5ZUocQ1flZzigcxXUPIFGccTSyLGesSW4yFyd6kA+GF+FV0XZi6h4x6+P2Pmyy
 nDenJJBTgak0vLbieRfJqbJh+zUOBmW0olwE4qBVYhcwtwLb6366JA1RzdjRfbBVYtlP
 KT/Fo/Y/usHC8XJxEhcjEeO4RcKBGJxJDOYUwayOfy64lOl67qzOTMiQBPvXwZ727lwU
 JXpXyiOO58QRMER1Y5U08BrjpUw7xNBA0/wX335ELzn11snWJvp36BvIBqiBXFySH3FF
 YOHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691634950; x=1692239750;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CpX0550wKMCux/3GBST6e64zt0DiUd6H3+LGhoX5Le4=;
 b=fbg5+b6w8KVCRJbSXh63FqlHewNcerF/4XesvP+HHSCux5WXZX1B4Z69pLt0Lg0Kp+
 hA/fj7jYrD/d9APwcTlpHL932Fj+w03maFVgSb7/BkPltafQbc9F36VhhsF6eM+SASg3
 BZAWBB+qB8P+iIYW65m5ZJQdfrWL76xAlFxynA+x8kc5zBRG1493PuPx+D2X8SIBZSt7
 4WEQZZWfJZfCvCs7YaNjDWnezqBia6aNxd4SaTimQ9ocvjUoPKMA0GlAmfpRWTeN8JTn
 pux/xQr9b0GUXLTvQAuOYi/oyy/0k7lFX4vSBt8mAsCF33Gm3QDb0ZkCbMQ2fYQjn0BB
 KN3A==
X-Gm-Message-State: AOJu0YyEgQF/6bK7ZcmPY1QbWlpTF6TlDk728stcWDQHlgmM7GqFpyLH
 QSk6yfiKvQSuH4hm9epm2V+O4A==
X-Received: by 2002:a05:6a20:1583:b0:11d:8a8f:655d with SMTP id
 h3-20020a056a20158300b0011d8a8f655dmr1541785pzj.4.1691634950092; 
 Wed, 09 Aug 2023 19:35:50 -0700 (PDT)
Received: from stoup.. ([2602:47:d483:7301:6bf0:9674:6ac4:f74c])
 by smtp.gmail.com with ESMTPSA id
 z7-20020aa791c7000000b0066ebaeb149dsm287283pfa.88.2023.08.09.19.35.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Aug 2023 19:35:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH for-8.2 0/5] target/arm: Implement cortex-a710
Date: Wed,  9 Aug 2023 19:35:43 -0700
Message-Id: <20230810023548.412310-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: cW0+1Fx30gpc

This is one of the first generation Armv9 cores, and gives us something
concrete to test in that area.  Notably, it supports MTE.

The first patch is a bug fix of sorts for neoverse-v1, as we don't,
and won't, support FEAT_TRF.

The only thing missing for the a710 is FEAT_MPAM.  I haven't looked
at that properly, and I believe that there may already be some work
done on that within Linaro -- even if a stub implementation.


r~


Richard Henderson (5):
  target/arm: Disable FEAT_TRF in neoverse-v1
  target/arm: Reduce dcz_blocksize to uint8_t
  target/arm: Allow cpu to configure GM blocksize
  target/arm: Support more GM blocksizes
  target/arm: Implement cortex-a710

 docs/system/arm/virt.rst       |   1 +
 target/arm/cpu.h               |   5 +-
 target/arm/internals.h         |   6 --
 target/arm/tcg/translate.h     |   2 +
 hw/arm/virt.c                  |   1 +
 target/arm/helper.c            |  11 ++-
 target/arm/tcg/cpu64.c         | 172 ++++++++++++++++++++++++++++++++-
 target/arm/tcg/mte_helper.c    |  91 ++++++++++++++---
 target/arm/tcg/translate-a64.c |   5 +-
 9 files changed, 263 insertions(+), 31 deletions(-)

-- 
2.34.1

