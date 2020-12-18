Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2164073lfq;
        Fri, 18 Dec 2020 02:41:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyo8XdFyWtxrjSq03pI0D0uTvWAp+PGCKGoXjF+eJQQL/Wn9XrhuD+WCxL2gYJPXnbyItiW
X-Received: by 2002:a25:3102:: with SMTP id x2mr4923982ybx.495.1608288117646;
        Fri, 18 Dec 2020 02:41:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608288117; cv=none;
        d=google.com; s=arc-20160816;
        b=tAW2ULx5ikjZR31C4FtVqos+NTNU+otGo9nLCmWiV8gtENMUs2kSRc2sbmVvhj6zxB
         1ZG6gQ5AH1CpCOFTZ0dUN0T9AhsGtw4mMeTcsFvJ5qdKMWEoVQN+u9B5Lu82bY60LOov
         +RFFGfNhY1OQZIBAe1acFo6YjWydaP8LUHzqQ7It/ZvEPoWACH7QFaxRdLG2BOJP9KjO
         IaFXURYO/QkFDBA7kQzcNWrgDtFycv436TEHU27cQ5tG0clMO1XJqg4ehsh+AbhoNVSg
         SglSdAecqxcZbVWMQ84cXVdLqdqZRFU1IFoYU5bnm3YPo4ew/ApaBDOv3wydK6G+tnr2
         NEbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:organization:message-id:date:subject:to:from;
        bh=g4URfNLf3ozb8quEgUtw8whOmknBHVIlquAxdZMZ/is=;
        b=SOTfLtjL0MRDT6Ix833zMCs+EqeVSjRZCxWLqsLhsrZnnOk7BA73PrKhC0YrQel0Lz
         cLmcYuX0tRi/lqfkNf9VXnVcDWptQb2YeVAa1vjFklAJJoYwnHjZukxpwaEJqPm3bBzw
         Iq0YWEFZdaaKaJeG7C1nhU4iuMq2JFy8auhJpFAjMdYb6WvPYxZU0tvfnyI5IVZ3R7q3
         Pc8K2KltT1XvrpT1cxy6uTRM3bO6+Kw1cRY/F+q/iSAd3UT2/yxHJQOHB7axSKbsmSUg
         faoi/EvkM4ziKOYV0vchvioMGh8KVr0HmbT9skJXxY3sSfIk+QxThRfYJHVMwLTCmlF0
         CyGA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l84si9183993ybc.325.2020.12.18.02.41.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Dec 2020 02:41:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kqDCv-0003Fu-0p
	for alex.bennee@linaro.org; Fri, 18 Dec 2020 05:41:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kqD8W-0005Ms-65; Fri, 18 Dec 2020 05:37:24 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:55232
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kqD8T-00036A-Vo; Fri, 18 Dec 2020 05:37:23 -0500
Received: from basile.remlab.net (dzyqn8ypzhx7l91mxjsvy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:a01a:be01:9434:f69e:d553:3be2])
 (Authenticated sender: remi)
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTPSA id 32FE25FA93;
 Fri, 18 Dec 2020 11:37:18 +0100 (CET)
From: =?ISO-8859-1?Q?R=E9mi?= Denis-Courmont <remi.denis.courmont@huawei.com>
To: qemu-arm@nongnu.org
Subject: [PATCHv4 00/18] ARMv8.4-A Secure EL2
Date: Fri, 18 Dec 2020 12:37:17 +0200
Message-ID: <3337797.iIbC2pHGDl@basile.remlab.net>
Organization: Huawei Technologies, Finland
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fzmpyAvJoF+V

	Hi,

The following changes since commit af3f37319cb1e1ca0c42842ecdbd1bcfc64a4b6f:

  Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' i=
nto staging (2020-12-15 21:24:31 +0000)

follow.

Changes since version 3:
=2D Drop unnecessary changes of arm_mmu_idx_is_stage1_of_2() prototype.
=2D Fix RegimeEL() for S-EL0 on 32-bit.
=2D Translate NS bit after stage 2, not before it
  - Should fix bizarre configurations of V(S)TCR.(N)S{A,W} bits.
=2D Don't hard-code the list of stage 1 of 2 regimes.

=2D---------------------------------------------------------------
R=C3=A9mi Denis-Courmont (18):
      target/arm: remove redundant tests
      target/arm: add arm_is_el2_enabled() helper
      target/arm: use arm_is_el2_enabled() where applicable
      target/arm: use arm_hcr_el2_eff() where applicable
      target/arm: factor MDCR_EL2 common handling
      target/arm: declare new AA64PFR0 bit-fields
      target/arm: add 64-bit S-EL2 to EL exception table
      target/arm: add MMU stage 1 for Secure EL2
      target/arm: add ARMv8.4-SEL2 system registers
      target/arm: handle VMID change in secure state
      target/arm: do S1_ptw_translate() before address space lookup
      target/arm: translate NS bit in page-walks
      target/arm: generalize 2-stage page-walk condition
      target/arm: secure stage 2 translation regime
      target/arm: set HPFAR_EL2.NS on secure stage 2 faults
      target/arm: add ARMv8.4-SEL2 extension
      target/arm: enable Secure EL2 in max CPU
      target/arm: refactor vae1_tlbmask()

 target/arm/cpu-param.h     |   2 +-
 target/arm/cpu.c           |  10 +-
 target/arm/cpu.h           |  93 ++++++++--
 target/arm/cpu64.c         |   1 +
 target/arm/helper-a64.c    |   8 +-
 target/arm/helper.c        | 419 ++++++++++++++++++++++++++++++-----------=
=2D---
 target/arm/internals.h     |  36 ++++
 target/arm/op_helper.c     |   4 +-
 target/arm/tlb_helper.c    |   3 +
 target/arm/translate-a64.c |   4 +
 target/arm/translate.c     |   6 +-
 target/arm/translate.h     |   1 +
 12 files changed, 410 insertions(+), 177 deletions(-)

=2D-=20
=E9=9B=B7=E7=B1=B3=E2=80=A7=E5=BE=B7=E5=B0=BC-=E5=BA=93=E5=B0=94=E8=92=99
http://www.remlab.net/



