Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp5018220ejb;
        Wed, 21 Dec 2022 01:29:19 -0800 (PST)
X-Google-Smtp-Source: AMrXdXum8CtyxXNOPqMH15Bn+xptXGYAEtl4VBORnRqkiJ4iUtVfWKY5froFRRkoP25j6Vpb/NOR
X-Received: by 2002:ac8:7248:0:b0:3a8:43:3bb1 with SMTP id l8-20020ac87248000000b003a800433bb1mr1077392qtp.30.1671614959690;
        Wed, 21 Dec 2022 01:29:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671614959; cv=none;
        d=google.com; s=arc-20160816;
        b=idfaLZPJ3j55bNA6sqErVYMMuptQt9OKM3s0jE9CJRWCpJjcZta9D0Le9TfqjczKsz
         pIfjGdPBGKSqxMRaMGpplgTYDWjld9TWiKoe50fEOX7koACdl1NJSVJVsD2MeHOl0x4K
         7LDKJ3dRUaCnjbvQEZhKDur82s+i1GUeFnS3O40eyohKDDmm4/Rwedmy3Us7/OoDweS3
         0Mul6XMyaOsLv9vEdkw9hNkp8ILTnj5nYDaw/ODkxMDthAipje7XgjBLpSh+bi5c9xa9
         269NcxP7qqnuMQVZj1xXf9dWbjfO+xNp6f9R43NeUfdBxCJ3+MiScNxXo1r0jSmmBkuW
         y6hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=x4Bx0/6W/y+dRVgSAXProrYFQwq4BSZIUVwlhOLk6Q8=;
        b=rbeBL+Bd5vNesBIJXN7Zz5sL+IXg8m/+24if4TdtnRGzK8LqfTkAG2fhXdL0sOSEAE
         sQ2VTYTABWRtkSt09UdHmplLK1YHLxf3ljy/z4jI7KFEP+rD3wFwH8edD0Sa7I74Yka1
         igkaZMsQoHnETzCjfF606rnG2TnwU8teTQZs++TvxUHD9IQz3Y9EK/88gB8CYP/oqcpP
         JhJK9vD0boluY8OVLNdad3lfpFSGeJjpsnWQxJJdjMoEnxgocp0afaX3jvkySwdQ2jyN
         NkwFLJvkw8GjYf8XQLcgv586QXIOOvDKU9c3l19EKkn2eayGSf/71FG5sB7+xOe0HZMi
         X6rA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i6-20020a05620a248600b006fecc78e23esi4291027qkn.596.2022.12.21.01.29.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Dec 2022 01:29:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p7vPD-0005gG-Na; Wed, 21 Dec 2022 04:28:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1p7vPC-0005fs-Dv; Wed, 21 Dec 2022 04:28:54 -0500
Received: from mail.csgraf.de ([85.25.223.15] helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1p7vPA-0004fs-Sc; Wed, 21 Dec 2022 04:28:54 -0500
Received: from localhost.localdomain
 (dynamic-095-117-119-107.95.117.pool.telefonica.de [95.117.119.107])
 by csgraf.de (Postfix) with ESMTPSA id 573FF60802DD;
 Wed, 21 Dec 2022 10:28:51 +0100 (CET)
From: Alexander Graf <agraf@csgraf.de>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Zenghui Yu <yuzenghui@huawei.com>, Eric Auger <eric.auger@redhat.com>
Subject: [PATCH 0/2] hw/arm/virt: Handle HVF in finalize_gic_version()
Date: Wed, 21 Dec 2022 10:28:48 +0100
Message-Id: <20221221092850.61332-1-agraf@csgraf.de>
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
X-TUID: 7ymsG55jLHR9

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

Alexander Graf (2):
  hw/arm/virt: Consolidate GIC finalize logic
  hw/arm/virt: Make accels in GIC finalize logic explicit

 hw/arm/virt.c         | 201 ++++++++++++++++++++++--------------------
 include/hw/arm/virt.h |  15 ++--
 2 files changed, 116 insertions(+), 100 deletions(-)

-- 
2.37.1 (Apple Git-137.1)

