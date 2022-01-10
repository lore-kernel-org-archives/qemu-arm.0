Received: by 2002:a19:ca48:0:0:0:0:0 with SMTP id h8csp1050460lfj;
        Mon, 10 Jan 2022 10:08:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzrv6tz4gAxIxV2ekxpN5jX0OYXodlBvPPTXUCxEr6L0aQ0dxgklmR8tM8MS1w6LWuO1YY8
X-Received: by 2002:a05:6638:bcd:: with SMTP id g13mr526161jad.152.1641838107029;
        Mon, 10 Jan 2022 10:08:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641838107; cv=none;
        d=google.com; s=arc-20160816;
        b=bU1xR2jCseF+B7MdV7QXwLGBDJf5J0apwLofXnlMa2c0wBLwnFmg5pyFgP0X8pWsBy
         EX9a1aH7YF/rQF0AT0wjlqrP5EZNhS5kkrXEo9VquW0Cz8a8RVzhx4P93uTSzO/pwtJe
         Fn6rXwDOr3Ji2e49ZWClOPFT1Wh7FoohBPC6wjMiD9tPmRX9grcHM4fILYKHsx4dhE4Y
         er8sc5QQzWRV7vAMV8ywENEIUtoH6fiIcsjV6OrYzB+JHo62e3jnLez+I1wHK8Ed2kmh
         LLMGwgKMX4OAlfnVcbv7INDB/cjEIOTo8b7Tfm9LhIt4ZuEsywvNIkEKJdnzRes9hH0J
         zejw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:mime-version
         :message-id:date:dkim-signature;
        bh=eoLSUbqCHYhNBcGZNETp4ZcN5SY3q8dlJ5ePorrnr6o=;
        b=Merklni6fMqBM6nTuo/F8Rd/hOxPZIb10VXaVtysH5NWOu0csPIUYD33BDl/j7VtlG
         7P00v5dChkqF3Hajk2r4d+L/2Y43b7K+0WbUW0rF5jm8600t487pnx+nJ48i0q6N2H9+
         4rJLwKnbGLmCPOiniktqHaNKJrELLx6rJ2Q1HEy8vepg/vBMUKWnXuMBhVFcVN552ENT
         kMJcL7bEPDR/o5X0gcTNdO8d6TxtKL6k5pJxNMmz1i8+L/jQldHz2h0pTTccJVPAdFGv
         QZeAo/ToUqUtwyON7+KbA66hHzEFO023X96ooqSSnKgtj5gBnEPX1Neyj9U+chvAefie
         VXkg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=KdeScDcJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k6si3591719jad.79.2022.01.10.10.08.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Jan 2022 10:08:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=KdeScDcJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:46860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n6z5m-0000zc-DG
	for alex.bennee@linaro.org; Mon, 10 Jan 2022 13:08:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3OnPcYQcKCqccLUabYLNVVNSL.JVTXLTb-KLcLSUVUNUb.VYN@flex--venture.bounces.google.com>)
 id 1n6z23-0006WB-WB
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 13:04:36 -0500
Received: from [2607:f8b0:4864:20::b4a] (port=56140
 helo=mail-yb1-xb4a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3OnPcYQcKCqccLUabYLNVVNSL.JVTXLTb-KLcLSUVUNUb.VYN@flex--venture.bounces.google.com>)
 id 1n6z22-0007r2-MS
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 13:04:35 -0500
Received: by mail-yb1-xb4a.google.com with SMTP id
 v48-20020a25abb3000000b006113ce63ed8so4199694ybi.22
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 10:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=eoLSUbqCHYhNBcGZNETp4ZcN5SY3q8dlJ5ePorrnr6o=;
 b=KdeScDcJsHejLz/NcL9L4GlrxRzAU0Pk6D+Y85wgIiigPDIsfoPbgNXtwfhzjdb+ee
 stdd7u71oYYK/2zQQPwcEt38u55+/GvKC2zQURyqC28JbkZPCwE8adcR4HEGz2gSG+Gp
 6/GZGL6XH458aMwZW8STdFcooPW45uUJqS3YQa6KTyTiSZrMKeBopg2BMdmvnrrwEzjw
 WugLVNx69auJv+ODou2Ee6rHVa9j2H8m4VYVoJihi8O5+ppycuyREuGAAPFoOCCxYcrF
 voMl06bMgs1HF5dqa46crGj9zmfEaFVRbhvuu+dAX3hIAPxg0ZH/yr3NOMkjgGcIzfEd
 zHPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=eoLSUbqCHYhNBcGZNETp4ZcN5SY3q8dlJ5ePorrnr6o=;
 b=s6RZGX9W8+Ls5Ituq+EBRXcpp3+DWtqdGXHibUUHc34NS/qnj+FSE5PtVmAsEGYba6
 vEgBRTbkG03S/pxGTgVq/qGyderksZpitmghiWv3GRbYdm7I6gRSuECOcvX/B1Cg+Bgd
 J6IhoWBp4hWvRKtHCFucUEHt3wntYlq2Nx45DhLJGMWv5wckG8nNBUpSiTcRyNswwVlS
 0kdUsTzRtLDPMFeC6NOL48vMvyXLH1G+JDOXDGCrDkU1ZyFBklahLimJaDjiEXyPG/Uk
 pUHRUhGA43aglx7Ztxu1Wnvfo//xbOwmBrnqIxEfjy5qcket7n1k0rD09NigiRSCv/Pq
 WOkQ==
X-Gm-Message-State: AOAM5332uiab0AovhHWiX8IksbvoU9fv7Yf3ba0BSF1fHBzVGlbj1v7+
 QwdhnWfRrXjro+r9iPz/6QqfLOm/aw/s
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:55ed:4d46:15ea:437b])
 (user=venture job=sendgmr) by 2002:a25:aab1:: with SMTP id
 t46mr1053212ybi.174.1641837370768; Mon, 10 Jan 2022 09:56:10 -0800 (PST)
Date: Mon, 10 Jan 2022 09:56:05 -0800
Message-Id: <20220110175607.591401-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.1.575.g55b058a8bb-goog
Subject: [PATCH 0/2] Introduce PCI mbox module for Nuvoton SoC
From: Patrick Venture <venture@google.com>
To: hskinnemoen@google.com, kfting@nuvoton.com, peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b4a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3OnPcYQcKCqccLUabYLNVVNSL.JVTXLTb-KLcLSUVUNUb.VYN@flex--venture.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -87
X-Spam_score: -8.8
X-Spam_bar: --------
X-Spam_report: (-8.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fWohSniZUScU

The PCI mbox module connects to a host such that the host can interact with the BMC SoC as a PCI device using a chardev.  This chardev portion will be in a follow-on CL with the corresponding documentation.

Hao Wu (2):
  hw/misc: Add Nuvoton's PCI Mailbox Module
  hw/arm: Add PCI mailbox module to Nuvoton SoC

 docs/system/arm/nuvoton.rst        |   1 +
 hw/arm/npcm7xx.c                   |  15 ++-
 hw/misc/meson.build                |   1 +
 hw/misc/npcm7xx_pci_mbox.c         | 178 +++++++++++++++++++++++++++++
 hw/misc/trace-events               |   5 +
 include/hw/arm/npcm7xx.h           |   2 +
 include/hw/misc/npcm7xx_pci_mbox.h |  63 ++++++++++
 7 files changed, 264 insertions(+), 1 deletion(-)
 create mode 100644 hw/misc/npcm7xx_pci_mbox.c
 create mode 100644 include/hw/misc/npcm7xx_pci_mbox.h

-- 
2.34.1.575.g55b058a8bb-goog

