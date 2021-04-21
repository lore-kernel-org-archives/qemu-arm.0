Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp646227lfb;
        Wed, 21 Apr 2021 10:44:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7X4yBLVvr0BQ4Fu2nNMpbJIUcpARDNLJ52h3bK00XnaUbFWT41qFP9JXsk4FfdNk1yz2Z
X-Received: by 2002:a1f:9b57:: with SMTP id d84mr27198226vke.6.1619027059996;
        Wed, 21 Apr 2021 10:44:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619027059; cv=none;
        d=google.com; s=arc-20160816;
        b=moLYq2gogf0D9SuTG+9K16CxwZxEjwBT7vwaruDuiPigSmWGoTAKB7UjGyFN/4sEpi
         xhedHic0WLPprSrQ6sBIELCe4gI+ob2smvCKNZvPYjor3KFcLgWekokzWChmJn8T6y7x
         xU5pGEmaZwSwggwjE3Dqto+To6q+LZw4DoJo2jg7tz6K/7C3t9A8ZsVs3nnDhkfCS50e
         0wNLL7szMivZ8K5X6Noz2XmA1mLhNQ5w1frQWqy7ToZ430K6s9A0BPHD1r1nS+UOceXM
         h4atS6vdOjniD+PwyAS+rp11zuQYOXe73rquL4vnG7c0m0bjQxNtjd0QSU3ANJp8Z8JO
         MoIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=D44JFwHmLBzd0FZ7gWb9u8teU0EpYAqSgWoqyCQw7SU=;
        b=cK10z/D8vaRMFYZ//JzEmtw0Lv+pkrazuX4zo9BhsENDuElOnLO/4/clfHZzh/yz52
         lgQ4jefPQcpTmNniV/UNWHBdBqqRWi9mP/um4wFdDBNyLHuXkCZNu4KLZAuqf+J9FFrN
         dM41bHJpej/2oJrclCbvDSEM0g7/z5Lei1/5BGX08f25jkiMZ/dyRji/VlmucCGo9YYQ
         qIZUNrjhdf2JA6id7r2swlOIDJBhoy7WnA3zCm4dUZ9rkZGq16AfSE7ag8AcjJfxvgZx
         lN1rG0bH8Y5VokdlQbymc4Srq5HPqNX0tbnhOytUR6Ko3XBRepmLdkRf8Se/QHcr6Al0
         wIpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZIDSojPr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h13si1611836uaw.256.2021.04.21.10.44.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Apr 2021 10:44:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZIDSojPr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lZGtf-0005Vk-8k
	for alex.bennee@linaro.org; Wed, 21 Apr 2021 13:44:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lZGqs-0003x2-JA
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 13:41:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lZGqn-0007Gr-Er
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 13:41:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619026877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=D44JFwHmLBzd0FZ7gWb9u8teU0EpYAqSgWoqyCQw7SU=;
 b=ZIDSojPrLxTHAa5WIwuFURv6bgZFU5PEllA9M5+Ao/ZPUcPbE1P/tWApt0Z27ix01F+nE3
 H0YtRhdTcF6/x+Myy7aw8/kTsVydTZ73xO3uHmQAXmTW9Ni+PaGtxStEWVzZHAeKHqsR6S
 UyqTjHO7dOZSP6AXgSL5PJFeIkfMw10=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-f7XAxPeaPaOgHDrYrlpvmg-1; Wed, 21 Apr 2021 13:41:14 -0400
X-MC-Unique: f7XAxPeaPaOgHDrYrlpvmg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C19C814336;
 Wed, 21 Apr 2021 17:41:13 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-115-49.ams2.redhat.com [10.36.115.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0C2F619D80;
 Wed, 21 Apr 2021 17:41:01 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, philmd@redhat.com, peter.maydell@linaro.org,
 crosa@redhat.com, wainersm@redhat.com
Subject: [PATCH v2 0/2] avocado-qemu: New SMMUv3 tests
Date: Wed, 21 Apr 2021 19:40:56 +0200
Message-Id: <20210421174058.12201-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
X-TUID: uwW1dqvb6VyK

This series adds SMMU functional tests using Fedora cloud-init
images. Compared to v1, guests with and without RIL
(range invalidation support) are tested (resp fedora 33 and 31).
For each, we test the protection of virtio-net-pci and
virtio-block-pci devices. Also strict=no and passthrough
modes are tested. So there is a total of 6 tests.

Note this allowed to identify yet another RIL issue:
[PATCH] hw/arm/smmuv3: Another range invalidation fix

This small series applies on top of Cleber's series:
- [PATCH 0/3] Acceptance Tests: support choosing specific
  distro and version
- [PATCH v3 00/11] Acceptance Test: introduce base class for
  Linux based tests.

Special thanks to Cleber for his support and for the series
this patch set depends on.

Best Regards

Eric

The series, its dependencies and the SMMU fix can be found at
https://github.com/eauger/qemu/tree/smmu_acceptance_v2


Eric Auger (2):
  Acceptance Tests: Add default kernel params and pxeboot url to the
    KNOWN_DISTROS collection
  avocado_qemu: Add SMMUv3 tests

 tests/acceptance/avocado_qemu/__init__.py |  46 +++++++-
 tests/acceptance/smmu.py                  | 133 ++++++++++++++++++++++
 2 files changed, 175 insertions(+), 4 deletions(-)
 create mode 100644 tests/acceptance/smmu.py

-- 
2.26.3

