Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4713802ejb;
        Tue, 20 Dec 2022 15:05:00 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsrPdENlxgMLa6k/7s8dFsgRWmOZun8bwXt2TcNRtSoreQNOk/hyhjBlG0fk/i9vWpepE1w
X-Received: by 2002:a05:6214:82:b0:522:90b4:f6fa with SMTP id n2-20020a056214008200b0052290b4f6famr863943qvr.7.1671577500612;
        Tue, 20 Dec 2022 15:05:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671577500; cv=none;
        d=google.com; s=arc-20160816;
        b=nNjC13GO6LDUmVG0YAe8xc78X5TnBxKmYzO/h+s8FhKVTD1MDj2RGVKPYCZ4OViG6r
         v93dspHDPDDvNgZOLSWevnxGQGOrS6CJVI1M7SDBSurKcWwjQngFz1CPHWEOgLd1eJsC
         26jFURj2yitQx708UtubnHZyQ1bFzkDeHM4XOmbyTRJLdO4Yn8P6gE7XjJYHMBGMP2nq
         vA+OO8PE9kRQIW1ipno2Mu83dkuzi9eSv88NmAmA7JLA6wOquNBxiH3YwsEU/Oo0TDZi
         zJSOkWC0HwEUNb6LRPszIwfsG8PkPrHzxx5x+L6dPb49sIQVJpzzWf3cHdtCy7pf0dHV
         RJ6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=nGh5E+fg/P/KFDfr4O1Pz/zQwXifjBOiv2LnhIvfXoI=;
        b=PS6JLKJchYAXsrCritGa2gzuEjxcnctP1sT3rtVh7zx1B2AZ1XHL0Etx2FBI7qaJkt
         3v94i64+br+0C9+nu5HxklkDGkCiP1EqWSIUYx5veR2ijrFyRxoWNwZ9tDXoC7MKI39g
         wnJdmjbksC7GhTvnEm5trqMlxhqX7R/amLeTXKpbGstfpgFtw4HX6ECrJ2RzTuUr0OXd
         kfCVAMQjo9QemRsS7KiVLPofolKtbyBL+iY5K5lwDYYwdQUZKict2A42VeMTvZmxdgfQ
         +2QuoeqJ6Ez0/eUVoFOHA1Hqfw3In9K+UDAiyhENVCB/Zcj2Ke5ymg64lTBvszM38KFa
         LZLw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kl26-20020a056214519a00b004c7355396fdsi1058358qvb.142.2022.12.20.15.05.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Dec 2022 15:05:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p7lfF-0008TC-90; Tue, 20 Dec 2022 18:04:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1p7len-0008Lx-7e; Tue, 20 Dec 2022 18:04:23 -0500
Received: from mail.csgraf.de ([85.25.223.15] helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1p7lek-0007cK-0t; Tue, 20 Dec 2022 18:04:20 -0500
Received: from localhost.localdomain
 (dynamic-095-114-015-034.95.114.pool.telefonica.de [95.114.15.34])
 by csgraf.de (Postfix) with ESMTPSA id 7AD156080191;
 Wed, 21 Dec 2022 00:04:15 +0100 (CET)
From: Alexander Graf <agraf@csgraf.de>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 0/2] hw/arm/virt: Handle HVF in finalize_gic_version()
Date: Wed, 21 Dec 2022 00:04:12 +0100
Message-Id: <20221220230414.47876-1-agraf@csgraf.de>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
X-TUID: kJEwf4LLeqZb

The finalize_gic_version() function tries to determine which GIC version
the current accelerator / host combination supports. During the initial
HVF porting efforts, I didn't realize that I also had to touch this
function. Then Zenghui brought up this function as reply to my HVF GICv3
enablement patch - and boy it is a mess.

This patch set cleans up all of the GIC finalization so that we can
easily plug HVF in and also hopefully will have a better time extending
it in the future. As second step, it explicitly adds HVF support and
fails loudly for any unsupported accelerators.

Alex

Alexander Graf (2):
  hw/arm/virt: Consolidate GIC finalize logic
  hw/arm/virt: Make accels in GIC finalize logic explicit

 hw/arm/virt.c         | 199 ++++++++++++++++++++++--------------------
 include/hw/arm/virt.h |  12 +--
 2 files changed, 110 insertions(+), 101 deletions(-)

-- 
2.37.1 (Apple Git-137.1)

