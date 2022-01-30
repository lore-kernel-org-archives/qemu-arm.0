Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp1871496lfk;
        Sun, 30 Jan 2022 15:12:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwgO4+X8cIBykSnXwN5ttLolUM4cqDCRoFPtCZL2hVqBavyrCH5Kf3qTxNlSn5mmA7L242H
X-Received: by 2002:a25:ad88:: with SMTP id z8mr26660434ybi.229.1643584353166;
        Sun, 30 Jan 2022 15:12:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643584353; cv=none;
        d=google.com; s=arc-20160816;
        b=IiKDCwwR+w+yen8d2nddcSOe3isJ8guvpBoAAwMGobgveHkoRiLaH1eQkzpf91TUQe
         sNF9ENDgwinQGUS+UOchc6dZLPQ60yqema0Ni0DF8hWgFifEttKMew8i1Y+3fUATmV3+
         0gfZt/WNAlPMg9XPOfePiCZfYEby70DQN75UCQiLywYxzTCVUH3D4A9FA6OcPP8xIVKb
         kmsP8dY1wzUzOJStT5qgwMLtoiKsHpzzBCuBn62GNolnqSVXRKXPWquop9YTM02cEKtO
         AZgPZ0iZZCB1DAeYgl6Aer+ZTrX6+E1X76sYmUREAHnOPlRox1NwZ3R+/bFdx/TYGH/y
         FyYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=hyWgnKcFsZbjV25ohAQeWlsgH9LfoJT09eJHJH1WZ64=;
        b=hZARdeWSJSskgB2FdcJc3gabPL5VVgTNUEtyFvE8vDT12vBzEURw7LhCwfvt3qLOoR
         PCctysSGPCJ0R+5OwGArqbRuju3YD4D/jJd39Lb1SLKHVklt8JAA+ySJM8Ue5g/SlvAI
         AuvA+jEabiZ927hAC0/c9ob4BMFOY2TiG8ADbWZ+qgH/s0Le4UNE9ASQE8x+I5cpz9ay
         m7zurHigvdtAakFzMReAShBoSGrs10/nTFBKVpPG2q6nCcz/l1ArBe665h1VeFCrikOg
         QsDVQiaGj+lzhKyKVAD3yAYyM7zna+wenwCqyu4XQu01benIiCtW68BsFqpPv8GNU9mi
         2j9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=iyXVa56N;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z204si35041266ybb.550.2022.01.30.15.12.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 30 Jan 2022 15:12:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=iyXVa56N;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nEJN1-00039R-K3
	for alex.bennee@linaro.org; Sun, 30 Jan 2022 18:12:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1nEJMq-00038B-GE; Sun, 30 Jan 2022 18:12:20 -0500
Received: from [2a00:1450:4864:20::136] (port=37810
 helo=mail-lf1-x136.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1nEJMn-0000vo-9c; Sun, 30 Jan 2022 18:12:20 -0500
Received: by mail-lf1-x136.google.com with SMTP id n8so23223338lfq.4;
 Sun, 30 Jan 2022 15:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hyWgnKcFsZbjV25ohAQeWlsgH9LfoJT09eJHJH1WZ64=;
 b=iyXVa56Nh7gQaFGKA6CmPa+29S1osWPxw9KVrEPxAp28dBJjhcGMHI0ee06RS1IsPV
 h9v2J3nstH7oGUgJjLPH3wx6xoDXXZPzN4+RPcpHksDk523PbrwfXbOhQoJiQ9bI8E5v
 LjF2G/Y5Euf3ptYHz7qKhmEdOxl0cy8CJFdbxu8TFQcFpUg/AOFySbV0xkzEwntr/xCC
 uoUDFnOXHUNpjnVbl9KL+eyCAM7185qsNc7YuzCmePxyRo2sQfNXX7r/8vVgKf1KAvSy
 S2NLrA7rn6VfNvp9v8Ui7yduySspeJOiEP4D3nQdN34iHu86BpfjNpoqPKxAb5KFEog9
 aWpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hyWgnKcFsZbjV25ohAQeWlsgH9LfoJT09eJHJH1WZ64=;
 b=XXAugRSqm7jk+6ZxAqXC7E7hi3T2lXqXq4MWEWB1jcdSjL/QkeybzZka+D9lw0itqn
 VYf6kC/MPYGu5oi1lpCjEnOOQU2cJ875cHtC42EyHkDDju0sSZKmcVB9n0ZRpQyiRRXz
 cU3rl41n6Thb9HXsfaYMtyuQ8J0NOEvEwVGx5SZXuPeR1dDTME/ggj+3QGyajtO7WJkx
 juN8mUXcB/4QFYxJHMLa9VG0I1LJPdVPbi/XCi8GQxQyrJHsPbFVLubnjtn9312SdTiX
 rHpLl3TcpwdUk7jgJa0EQpWh6qfg7NDP8vxVxv6TUdeQOzTygckxRCXgeRV6N+6HSK+4
 TNug==
X-Gm-Message-State: AOAM533xXXSXbFrZqm1lAWeq5d6J7roxuGY1MbxXZyeaPjCCunV2pPn8
 Da9PNcpxv0jWyqFlTt+mt+cXBAINftAdvQ==
X-Received: by 2002:a05:6512:32c5:: with SMTP id
 f5mr8393000lfg.361.1643584327654; 
 Sun, 30 Jan 2022 15:12:07 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id w35sm3433795lfu.273.2022.01.30.15.12.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jan 2022 15:12:07 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 0/6] hw/arm: zynqmp: Add CRF and APU control to support PSCI
Date: Mon, 31 Jan 2022 00:12:00 +0100
Message-Id: <20220130231206.34035-1-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::136
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x136.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, luc@lmichel.fr,
 sai.pavan.boddu@xilinx.com, frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, francisco.iglesias@xilinx.com,
 frederic.konrad@adacore.com, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SHD59X0JEHBj

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

This adds the necessary modeling to support some of our firmware
tests at EL3 implementing PSCI (TBM). These are the test-cases
that were previously relying on QEMU's builtin PSCI emulation.

I've only tested this on top of Peter's recent PSCI emulation fixes.

Cheers,
Edgar

Edgar E. Iglesias (6):
  hw/arm/xlnx-zynqmp: Add unimplemented SERDES area
  target/arm: Make rvbar settable after realize
  hw/misc: Add a model of the Xilinx ZynqMP CRF
  hw/arm/xlnx-zynqmp: Connect the ZynqMP CRF
  hw/misc: Add a model of the Xilinx ZynqMP APU Control
  hw/arm/xlnx-zynqmp: Connect the ZynqMP APU Control

 include/hw/arm/xlnx-zynqmp.h           |   4 +
 include/hw/misc/xlnx-zynqmp-apu-ctrl.h |  91 +++++++++
 include/hw/misc/xlnx-zynqmp-crf.h      | 209 +++++++++++++++++++
 hw/arm/xlnx-zynqmp.c                   |  45 ++++-
 hw/misc/xlnx-zynqmp-apu-ctrl.c         | 257 +++++++++++++++++++++++
 hw/misc/xlnx-zynqmp-crf.c              | 270 +++++++++++++++++++++++++
 target/arm/cpu.c                       |   7 +-
 hw/misc/meson.build                    |   2 +
 8 files changed, 879 insertions(+), 6 deletions(-)
 create mode 100644 include/hw/misc/xlnx-zynqmp-apu-ctrl.h
 create mode 100644 include/hw/misc/xlnx-zynqmp-crf.h
 create mode 100644 hw/misc/xlnx-zynqmp-apu-ctrl.c
 create mode 100644 hw/misc/xlnx-zynqmp-crf.c

-- 
2.25.1

