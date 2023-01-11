Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp4117414ejc;
        Wed, 11 Jan 2023 08:14:05 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtkPDARkylO/RZZO9cM/OjkhvAaIHxRgpCsed3VgJ41zeOdRPCG26vX3Gcut0A/tbIS9hcM
X-Received: by 2002:ad4:4bb4:0:b0:532:3465:cde4 with SMTP id i20-20020ad44bb4000000b005323465cde4mr11104886qvw.41.1673453645642;
        Wed, 11 Jan 2023 08:14:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673453645; cv=none;
        d=google.com; s=arc-20160816;
        b=WjLL447assdnMhhBjauRnxK+/GHrQCVbHQ+sKumBMKLR7Ww2z2BSRzxLQLLwfhsKp/
         0B38nZeJdVDbtWQUvbdXcNjV3XCgC9LwaZJdoEoGYO8SKjKK6emssyEASdDeDfYPgRSk
         9L42/vx56u+L5v7GxKbsoT0a129Cs94xYXyvjfAmYsp4dSM/xV2jfi7CoRQ1A6imCNqc
         lk2sc6cSzp3IbuWOEfZWJNUcCxXzuiEwrssGCE0fQvQbRVgpQYRK25LeV6vsErbPznSF
         hgH1D4HZtzF/vGuoo16LqP0jc3xD3TJFP72ui+RERfeyFXzKI7R36v5YUE5NetAUnnmT
         CobQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=2O5r+h1JPk+X/war6I5vcdeRlO1354IkopAVvOAyb6g=;
        b=LQnetQGIOyqrXUOqLtGqEocJeHPjEHsOMF8Un+M/bkRjLXOEXCZG70TYRnqapmA5/q
         j42VnKdfnJS/tKxUGhqWOlaLQOmWD66Y6oM2x0y5TZQw5QDfxBlBZY4x4SUcxhWJkZPf
         XYSCIjyU0sNPTniTE0NJOKJwCJSgHGIGeaJvM8bsUxHj3YsWd4uQrUrCyQCebrBlDJzl
         k+WEIZmOHbYCq7lJqVuSo9d6FkaLKDU4jvY1vp7SbAFrv5/INnQSPuMQwngWRRZoqlv1
         xgqoZzS+hwX9d1spQTCpmFAVOeFiyPVrSa+ipsZZ2qnR8SOXDdWD5wyZYMsAo4S1sCCM
         Gm0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HhLMnZia;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gg4-20020a056214252400b00531a927f291si8843472qvb.490.2023.01.11.08.14.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Jan 2023 08:14:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HhLMnZia;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pFdjL-0000id-M1; Wed, 11 Jan 2023 11:13:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pFdjJ-0000hR-Ad
 for qemu-arm@nongnu.org; Wed, 11 Jan 2023 11:13:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pFdjH-0002wS-3M
 for qemu-arm@nongnu.org; Wed, 11 Jan 2023 11:13:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673453609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2O5r+h1JPk+X/war6I5vcdeRlO1354IkopAVvOAyb6g=;
 b=HhLMnZiaGU1TMbgpIpLSFIUiJ1L8hOPbrqhLDzsqqSm0DvzomSwOa3lblLJxVms8kaFHns
 XCEJ8XIBoSMszRTJgKHwN9uuMVefZ95oya4LxsPjePJ7+ethvhcrmVWlSgvWmaIsYieIa2
 KAMofouc91sJB+hABPmZSz3LVFDIocs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-410-LfMzgFZCNfqmoCbz9En3Jw-1; Wed, 11 Jan 2023 11:13:24 -0500
X-MC-Unique: LfMzgFZCNfqmoCbz9En3Jw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6E9A9280482A;
 Wed, 11 Jan 2023 16:13:24 +0000 (UTC)
Received: from gondolin.redhat.com (unknown [10.39.195.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BEF7A2026D68;
 Wed, 11 Jan 2023 16:13:21 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org,
 Eric Auger <eauger@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Gavin Shan <gshan@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v4 0/2] arm: enable MTE for QEMU + kvm
Date: Wed, 11 Jan 2023 17:13:15 +0100
Message-Id: <20230111161317.52250-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-TUID: EXsHgG/Ptokf

Here's another repost of my kvm/mte series; no substantial changes.

Changes v3->v4:
- rebase to current master
- tweak message when specifying "mte=on" for the virt machine for non-tcg
- added Thomas' ack for the qtests patch

Cornelia Huck (2):
  arm/kvm: add support for MTE
  qtests/arm: add some mte tests

 docs/system/arm/cpu-features.rst |  21 +++++
 hw/arm/virt.c                    |   2 +-
 target/arm/cpu.c                 |  18 ++---
 target/arm/cpu.h                 |   1 +
 target/arm/cpu64.c               | 133 +++++++++++++++++++++++++++++++
 target/arm/internals.h           |   1 +
 target/arm/kvm64.c               |   5 ++
 target/arm/kvm_arm.h             |  12 +++
 target/arm/monitor.c             |   1 +
 tests/qtest/arm-cpu-features.c   |  76 ++++++++++++++++++
 10 files changed, 257 insertions(+), 13 deletions(-)

-- 
2.39.0

