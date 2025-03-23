Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp1518736njc;
        Sun, 23 Mar 2025 10:47:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXlKlEQsM6ybmY5H9yngd1PK/QNXoEWDA3GVSKDVJz7KZDLYQFtTscd5Xk4JYnjiqv3CSXjhG4hprdxrw==@linaro.org
X-Google-Smtp-Source: AGHT+IGA9sKJNAknxCcaH4HpkAP6WGOMZXvR+P4i8vJvSnddU+a3ybOWPNEAHg8SPxHs8hfKJizd
X-Received: by 2002:a05:620a:2a11:b0:7c5:4b91:6a42 with SMTP id af79cd13be357-7c5ba15edd1mr1342896785a.17.1742752041583;
        Sun, 23 Mar 2025 10:47:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742752041; cv=none;
        d=google.com; s=arc-20240605;
        b=h0t91h/EKVEBANk+dsIBORlhQOPjdApbyuut0PmQnCvQbg+XB1waxTGDaZPpa7dbZW
         BgiBbD7mHmiyYQb6Y14PCkOp8L/GhYQMQztUYzeuMbEG1c+GQy913JJH57WSSwgLmZki
         J1pMvnKCVSpzTJpaGTgOiUKcoD2vrS3yGVLQMSETf2nFeLlDf9/2/9I6C5pjgewGnaGX
         RDhcwiC6Zl23thK/fRZ4OFIPSaPbqWYB4vvHDTRxa9V95LHgVvWBPpIB/Tm9FNP8k/7Q
         6Ha4TH9X08k92FFbUFZUrcQtxE0F9WHypLikB+FTPbuttIM45CmzJQveCF5L+iqXRLRa
         6SVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=TgjrKvs+Rgek0Ip1Pq2Qg415rEQxe4MGbST0j3Bs/10=;
        fh=//RUmME8FDhHHOy0et2Cqja/I65gKN6UBnwN7MzepaQ=;
        b=C6pjyx6NLJmGbpxNTi4xWSElOrFxkzcVXFa6tR/p3tvppLYpN3DRutM7sX/VlVLL8i
         2nlnE0M+0Wa/nojkKpmcqIdZO64X14J2QeuxLZzYasDBuW+o0tkbpDOvdn6NEy9vKRMD
         qwB+R7pRW+gM8qsEdEctkrYEKg0mOqpwRC+cxv7W4tIoev3JId3srCGVpYcpONFDGGSd
         HhOOW0IB3ltIH3djjtHSGA0XOQY+uqOekdfHLspoLIUvsxOE63PI3xn1AQsvQwN3x6Xy
         9Sv0LSbqEr8FDCC8s/1MMfsbzRi17+Smn1YXkpmD1vrkfoNZZFRHxJKZdx/Ly9t59KAA
         ZZ5A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dwMIg6WE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c5b9356c04si603821885a.425.2025.03.23.10.47.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Mar 2025 10:47:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dwMIg6WE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1twPP5-0002vV-9g; Sun, 23 Mar 2025 13:46:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1twPOZ-0002Y2-LQ
 for qemu-arm@nongnu.org; Sun, 23 Mar 2025 13:46:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1twPOW-00040L-Jm
 for qemu-arm@nongnu.org; Sun, 23 Mar 2025 13:45:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742751955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TgjrKvs+Rgek0Ip1Pq2Qg415rEQxe4MGbST0j3Bs/10=;
 b=dwMIg6WE/3V7n4za1AVSb61hQ1YM2Y8sB9CAONG0LVzFb95QPTyk6/RDYSbN0r65WhWaoH
 MxN4MGmfZDpSgOOZyQ2dac/7Wjl6i1GPG4CR3tpi80Zr9TATilpIJRasgwLbnfNTv0f2NS
 5mzWlU9V/cL/7IjFm/pj5OI5z1AzWA0=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-66-rew5AWrSMyGFDy01fL3bNw-1; Sun,
 23 Mar 2025 13:45:52 -0400
X-MC-Unique: rew5AWrSMyGFDy01fL3bNw-1
X-Mimecast-MFC-AGG-ID: rew5AWrSMyGFDy01fL3bNw_1742751951
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id CA852196D2CD; Sun, 23 Mar 2025 17:45:50 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.44.32.3])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 2B1951956095; Sun, 23 Mar 2025 17:45:43 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 0/3] aspeed queue
Date: Sun, 23 Mar 2025 18:45:38 +0100
Message-ID: <20250323174541.406860-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.01,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: SGBvA86U17zI

The following changes since commit 527dede083d3e3e5a13ee996776926e0a0c4e258:

  Merge tag 'pull-request-2025-03-19' of https://gitlab.com/thuth/qemu into staging (2025-03-20 08:41:25 -0400)

are available in the Git repository at:

  https://github.com/legoater/qemu/ tags/pull-aspeed-20250323

for you to fetch changes up to 78877b2e06464f49f777e086845e094ea7bc82ef:

  hw/misc/aspeed_hace: Fix buffer overflow in has_padding function (2025-03-23 18:42:16 +0100)

----------------------------------------------------------------
aspeed queue:

* Fix AST2700 SoC model

----------------------------------------------------------------
Jamin Lin (1):
      hw/misc/aspeed_hace: Fix buffer overflow in has_padding function

Steven Lee (1):
      hw/intc/aspeed: Fix IRQ handler mask check

Troy Lee (1):
      aspeed: Fix maximum number of spi controller

 include/hw/arm/aspeed_soc.h | 2 +-
 hw/intc/aspeed_intc.c       | 2 +-
 hw/misc/aspeed_hace.c       | 5 +++++
 3 files changed, 7 insertions(+), 2 deletions(-)

