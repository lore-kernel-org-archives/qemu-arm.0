Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2648516ejf;
        Tue, 27 Feb 2024 04:53:40 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWtBzBiKV/LIvIukv1IV5eyppvSkJsSld8ptq3iH8vBwsa+dqees135fPdqajiQjiEsEW8yTOP4FrV6SdPOJ6HPgALZnQ5+
X-Google-Smtp-Source: AGHT+IHCUoo3iR5LCi4B/32dbgV1B21HA0Tihe25QEtltj5yQlWYdVjQ77UwI6wwJr+s9gc7LXvx
X-Received: by 2002:a81:ff17:0:b0:608:2d21:7193 with SMTP id k23-20020a81ff17000000b006082d217193mr1831618ywn.44.1709038420533;
        Tue, 27 Feb 2024 04:53:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709038420; cv=none;
        d=google.com; s=arc-20160816;
        b=FJondSbs/tKMWhykVP/WtsIdrT+QcFUIoSknQKcoo/Jp7xAAiH8eBQnqyLIkWCWBBz
         gogvpz32NIWTMp+WSS/ejGE1jogldhmzK6ZG4Chb+jCg+RKhgaqO/XAPfLhms6V1u6me
         tRjPwk+TG/ij6cM7d/vwjGTk6VmsuQKHYv1knV1fCjtPhRR6msdtnhZFXiwyHV6nxBC6
         GvFetGmVh4KW/pyl3HVTDWcGrG0P8zJiLPanWuXP2zJCeQf+JFa/FufI3kBzCsQzDycg
         EuvF7ueHxUH6uM+zo7HYMzhoElHZvTODU6bcPpq01VQZB4mcRscmE/nfbYejTkjgB03M
         a/Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=jnKukjGRpdWVrNIc5QKRNlP7ghIMJuO+dlQ8EUZTwH0=;
        fh=U/0C24lFKzzomuy67bTtM+LZKjwyWOJtFrkAZXiyaww=;
        b=Bcj2LTXwTjMKBLi84qj/ev6aNuVk1fyU5gbqrh5JnKrkDkXSQXKJaGA7ViopPQ+WB/
         RkPeSQO5xydShNk1FEmwHbagCW0lSxqNPMD3oaWuG+wmu+5IZwtN4cICNSX0zeIj5+n4
         Da98DLPjOoh7+iFXxWrjxqRMErq4ADCN+EHcMI7M/VuhaM81LNHIN1r07rv+QL99efwt
         /0Cs+re+ptJfuIZ6WVkP0zichiSNP/GizbHP8b0uV0soRgD36z4NhXv9WFSCtNopltCM
         SQ17gXQKcHOVQdP3GW/sbNogHWijq8Ufk49zVKkK7Cr7JwgMM8K8WJEe3zWvMCioYvts
         GLhg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h4-20020ac87d44000000b0042c68ba44d7si7706812qtb.803.2024.02.27.04.53.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Feb 2024 04:53:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rewwZ-0008Vh-I3; Tue, 27 Feb 2024 07:52:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=hhKj=KE=kaod.org=clg@ozlabs.org>)
 id 1rewwX-0008Un-Q2; Tue, 27 Feb 2024 07:52:21 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=hhKj=KE=kaod.org=clg@ozlabs.org>)
 id 1rewwV-0002iN-U2; Tue, 27 Feb 2024 07:52:21 -0500
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Tkcnj6PgDz4wcF;
 Tue, 27 Feb 2024 23:52:09 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Tkcnh1YsSz4wc1;
 Tue, 27 Feb 2024 23:52:07 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 0/2] aspeed queue
Date: Tue, 27 Feb 2024 13:51:59 +0100
Message-ID: <20240227125201.414060-1-clg@kaod.org>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=hhKj=KE=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: 3cA/PgUkIbsX

The following changes since commit 1b330dafcdc34315f6837ff3af34dbb4b3106373:

  Merge tag 'edk2-stable202402-20240226-pull-request' of https://gitlab.com/kraxel/qemu into staging (2024-02-26 21:28:11 +0000)

are available in the Git repository at:

  https://github.com/legoater/qemu/ tags/pull-aspeed-20240227

for you to fetch changes up to db052d0eafe86c336d512dba99a1ec7c5c553f63:

  aspeed: fix hardcode boot address 0 (2024-02-27 13:47:05 +0100)

----------------------------------------------------------------
aspeed queue:

* Add support for UART0, in preparation of AST2700 models

----------------------------------------------------------------
Jamin Lin (2):
      aspeed: introduce a new UART0 device name
      aspeed: fix hardcode boot address 0

 include/hw/arm/aspeed_soc.h | 19 +++++++++++++++++--
 hw/arm/aspeed.c             | 17 +++++++++++------
 hw/arm/aspeed_ast10x0.c     |  1 +
 hw/arm/aspeed_ast2400.c     |  6 ++++--
 hw/arm/aspeed_ast2600.c     |  3 ++-
 hw/arm/aspeed_soc_common.c  |  6 ++++--
 6 files changed, 39 insertions(+), 13 deletions(-)
