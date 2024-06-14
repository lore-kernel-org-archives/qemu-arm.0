Received: by 2002:a17:907:681:b0:a6f:694d:5ff8 with SMTP id wn1csp92471ejb;
        Fri, 14 Jun 2024 00:27:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVp2k20SDmEPs0/3TBZv4VgsnftuVUbNoM+hP1cka7w+9wKn928khdbrsntDKfQWcizoaJWcqXnmDFl2mwB/jUkRHbI6c3X
X-Google-Smtp-Source: AGHT+IF/3YYVv6f0GmBlkF9t8H7DGRqnCL/+KZwJ8Zhj04EE5cNLVzoCD5QSJjuo/cSU6GCGJgbA
X-Received: by 2002:a05:620a:1aa3:b0:795:5ec7:2443 with SMTP id af79cd13be357-798d258e3c1mr210844285a.55.1718350066855;
        Fri, 14 Jun 2024 00:27:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718350066; cv=none;
        d=google.com; s=arc-20160816;
        b=J6oX6MRXuBpW3yIIaB9bc455atndOZPw/SrLGvQo70jIjRCW8ramZq2+WWy6MgkU8X
         l6j3RG55t4/zhZz+O+dIP/eAdHpFDUXQPJYpqe5H/AiX5SKXtCpDAEBAHGI4Z4KMwUQb
         M9ZEg3IRwDVycWH8gOgjBbX6WBaoQ+Pm1yiwcWNQicVrKCm6gYZdzMIdL69i8ldOK35T
         NjORWS5U+JmeTUtUITMYnfUga9v9Jn3IAfSQyucxNeZeo9h4/xPtwPhSZl8cwVgnISK+
         fSSEoo34jQHVdTofDQC18lmKneRIHxyTMyuHmbGQ2sJnVb/NNiFv9KCa1t+PYt52j2Yi
         39yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=LmUK3dtZoFocAHNTXO1aZ0xYU1Vw2Shh1J7+ySA/5Sg=;
        fh=//RUmME8FDhHHOy0et2Cqja/I65gKN6UBnwN7MzepaQ=;
        b=R0SgNRdVvxpwUbR6DuSLHcM43bGSUd5KjgO024DgtXbZ1y+yyJej6enQVcaDYr4d39
         P+9S0PviN4jiCqs0Rcd/gqJ/FK2gC7/urSa5GceSTABcsxy62XzDTcvBQ1ih0gGq78Mq
         l2wkFyOjNTd19kdRypi12KBFdwJU7Heg3TrHWAddXjQNMI+rrJBrvXq42iZOA5PRYtPh
         QGYC91d4uYvvE/v77QnNyTgeucTahjjETlcAsKqkJmcDjsQJYAnXmZbipZuB+PFj5tiN
         pVdQEgOHCS/1VCj5CgNr69Vv5Pdaw1Ccbry8gclqT5vo5btx5IexXKFt0LcCIzWKzHaP
         vN9w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HSX6d9LR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-798abe62247si332488585a.663.2024.06.14.00.27.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Jun 2024 00:27:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HSX6d9LR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sI1LD-00036V-74; Fri, 14 Jun 2024 03:27:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sI1LC-000362-5a
 for qemu-arm@nongnu.org; Fri, 14 Jun 2024 03:27:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sI1LA-0000cy-EI
 for qemu-arm@nongnu.org; Fri, 14 Jun 2024 03:27:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718350033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LmUK3dtZoFocAHNTXO1aZ0xYU1Vw2Shh1J7+ySA/5Sg=;
 b=HSX6d9LRzl2iu5eTvg8OWSMHxw6MTOPiJ8SryrNpRoxLYmzKR52y+xxfAQXX8kF1MmVpWP
 03+mkD6Yf7PNFA8xU9BW08tSUYP9LMdbHKWxaQvSfsXnIfjN2CcA6ypi7wRN+dgv6CInm+
 MfZRyvsBnDjCaUL8/uaxppwMMvT0sJ0=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-263-XJomsqWPMzeNmJGoKFbA5A-1; Fri,
 14 Jun 2024 03:27:11 -0400
X-MC-Unique: XJomsqWPMzeNmJGoKFbA5A-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 80C92195608C; Fri, 14 Jun 2024 07:27:10 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.49])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id F2A623000219; Fri, 14 Jun 2024 07:27:07 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 00/19] aspeed queue
Date: Fri, 14 Jun 2024 09:26:01 +0200
Message-ID: <20240614072620.1262053-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.145,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: Mw104blTN5Ld

The following changes since commit 046a64b9801343e2e89eef10c7a48eec8d8c0d4f:

  Merge tag 'pull-request-2024-06-12' of https://gitlab.com/thuth/qemu into staging (2024-06-13 07:51:58 -0700)

are available in the Git repository at:

  https://github.com/legoater/qemu/ tags/pull-aspeed-20240614

for you to fetch changes up to d9f6311f5393da897e73be8a29c261125d0c1ac2:

  MAINTAINERS: Add reviewers for ASPEED BMCs (2024-06-14 07:36:09 +0200)

----------------------------------------------------------------
aspeed queue:

* Add AST2700 support

----------------------------------------------------------------
Cédric Le Goater (1):
      aspeed/smc: Reintroduce "dram-base" property for AST2700

Jamin Lin (18):
      aspeed/wdt: Add AST2700 support
      aspeed/sli: Add AST2700 support
      aspeed/sdmc: remove redundant macros
      aspeed/sdmc: fix coding style
      aspeed/sdmc: Add AST2700 support
      aspeed/smc: correct device description
      aspeed/smc: support dma start length and 1 byte length unit
      aspeed/smc: support 64 bits dma dram address
      aspeed/smc: support different memory region ops for SMC flash region
      aspeed/smc: Add AST2700 support
      aspeed/scu: Add AST2700 support
      aspeed/intc: Add AST2700 support
      aspeed/soc: Add AST2700 support
      aspeed: Add an AST2700 eval board
      aspeed/soc: fix incorrect dram size for AST2700
      test/avocado/machine_aspeed.py: Add AST2700 test case
      docs:aspeed: Add AST2700 Evaluation board
      MAINTAINERS: Add reviewers for ASPEED BMCs

 MAINTAINERS                      |   3 +
 docs/system/arm/aspeed.rst       |  39 ++-
 include/hw/arm/aspeed_soc.h      |  30 +-
 include/hw/intc/aspeed_intc.h    |  44 +++
 include/hw/misc/aspeed_scu.h     |  47 ++-
 include/hw/misc/aspeed_sdmc.h    |   5 +-
 include/hw/misc/aspeed_sli.h     |  27 ++
 include/hw/ssi/aspeed_smc.h      |   3 +
 include/hw/watchdog/wdt_aspeed.h |   3 +-
 hw/arm/aspeed.c                  |  32 ++
 hw/arm/aspeed_ast27x0.c          | 648 +++++++++++++++++++++++++++++++++++++++
 hw/intc/aspeed_intc.c            | 360 ++++++++++++++++++++++
 hw/misc/aspeed_scu.c             | 306 +++++++++++++++++-
 hw/misc/aspeed_sdmc.c            | 220 +++++++++++--
 hw/misc/aspeed_sli.c             | 177 +++++++++++
 hw/ssi/aspeed_smc.c              | 347 +++++++++++++++++++--
 hw/watchdog/wdt_aspeed.c         |  24 ++
 hw/arm/meson.build               |   1 +
 hw/intc/meson.build              |   1 +
 hw/intc/trace-events             |  13 +
 hw/misc/meson.build              |   3 +-
 hw/misc/trace-events             |  11 +
 hw/ssi/trace-events              |   2 +-
 tests/avocado/machine_aspeed.py  |  62 ++++
 24 files changed, 2350 insertions(+), 58 deletions(-)
 create mode 100644 include/hw/intc/aspeed_intc.h
 create mode 100644 include/hw/misc/aspeed_sli.h
 create mode 100644 hw/arm/aspeed_ast27x0.c
 create mode 100644 hw/intc/aspeed_intc.c
 create mode 100644 hw/misc/aspeed_sli.c

