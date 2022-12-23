Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp252240ejb;
        Fri, 23 Dec 2022 01:01:25 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtfWtE3PZYj7MhKsu8S2zRxRpdpGJ4bYz3OscmdAZRsqaSUZZI6uE7qg56LJ+FAT68rvb4C
X-Received: by 2002:ac8:541a:0:b0:3a7:e809:1fe3 with SMTP id b26-20020ac8541a000000b003a7e8091fe3mr11230497qtq.49.1671786084870;
        Fri, 23 Dec 2022 01:01:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671786084; cv=none;
        d=google.com; s=arc-20160816;
        b=w9BpW0skq9UjzhPOMvMadNtdlgMkJ/2OX1Jp6mtOee/vqjTeU03XdYLh27oc0dsswE
         jnnIPzk9FdJd8K4g9TWMTPNQLJ+LxjIxIN+kWCTiVOTkcDbcilqvEVJH2FnJtg2pP3/N
         puM786r8C4gij5HPOjkVCZ+xPz0KCSwj52sN+YA4hZc0wT4Uh+D5kvxAufi/G5OsueW7
         Hh0ibVg1/YSxJtsllTVEu7NN/HNFXr56W7RzMEmGOTeVXiflsdWEZy8ArtXQor8+dmHh
         URtBFZquWdCMKjuxKNJPPkrJmlAajUxjoB7b63jlysX1J7YD77fcvYSp36zTBGf9YG0W
         wcmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=BZqJ0vbYgXnuHElKqHIYgLQvb6GBzf9ySfqPZm3wxow=;
        b=FwsxGEnDnHkHwFxI5Z9mrlR/jfPEPU5aUTUGTv6XELBt9PR2xzb0VIp+zQM7kwqSFt
         5D1GWTDImb49Tx+XqPh8NwXXOQ6u4QZPI8lvqJuu+prCK8hSJwlhhKSxXRZq2w7TH19F
         0O8gazo5U2Y+EHqPZNdkfGeFgVusGldzApEigtyJ4F5YMadreQ0xuU8Acx2Ck+cNk2JI
         W23gymggS/JGhVfrT9Qc2p/uzG5sTvNftwnDzyackaUEUGrvEyjl7o9n7C5OdW5eyLTk
         Y7ndMFLswwh/3S3c9ti6h+PPQCw3DzPMrPa75Qp13XuuEUy/X0yr5u7f0HNt7l0JYrQk
         leQw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bb9-20020a05622a1b0900b003a51c7c0403si1055651qtb.526.2022.12.23.01.01.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Dec 2022 01:01:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p8dvX-0002S5-PY; Fri, 23 Dec 2022 04:01:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1p8dvU-0002R6-Ml; Fri, 23 Dec 2022 04:01:12 -0500
Received: from mail.csgraf.de ([85.25.223.15] helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1p8dvS-0001Ou-ME; Fri, 23 Dec 2022 04:01:12 -0500
Received: from localhost.localdomain
 (dynamic-095-118-065-151.95.118.pool.telefonica.de [95.118.65.151])
 by csgraf.de (Postfix) with ESMTPSA id CFD6E608042C;
 Fri, 23 Dec 2022 10:01:07 +0100 (CET)
From: Alexander Graf <agraf@csgraf.de>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Zenghui Yu <yuzenghui@huawei.com>, Eric Auger <eric.auger@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v3 0/2] hw/arm/virt: Handle HVF in finalize_gic_version()
Date: Fri, 23 Dec 2022 10:01:05 +0100
Message-Id: <20221223090107.98888-1-agraf@csgraf.de>
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
X-TUID: 8/aH16gI3kMt

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

v1 -> v2:

  - Leave VIRT_GIC_VERSION defines intact, we need them for MADT generation
  - Include TCG header for tcg_enabled()

v2 -> v3:

  - Fix comment
  - Flip kvm-enabled logic for host around

Alexander Graf (2):
  hw/arm/virt: Consolidate GIC finalize logic
  hw/arm/virt: Make accels in GIC finalize logic explicit

 hw/arm/virt.c         | 200 ++++++++++++++++++++++--------------------
 include/hw/arm/virt.h |  15 ++--
 2 files changed, 115 insertions(+), 100 deletions(-)

-- 
2.37.1 (Apple Git-137.1)

