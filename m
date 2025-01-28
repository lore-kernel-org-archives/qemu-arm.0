Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp3393917njk;
        Tue, 28 Jan 2025 13:42:51 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU/vm45PiSpgsamK3BYMKGzYtDw5GOW19TbPRwRUewrSFwYz5UrxWPV8ImZWkKOY2POiM2SYVa34Ws+BA==@linaro.org
X-Google-Smtp-Source: AGHT+IHJ85C6ccx11aVDdoO7w9Y470sxGvPeJDEQUA8NIVmSg+LjKX9ejhoO7Z7dihJnpMXxdi+h
X-Received: by 2002:a05:620a:19a0:b0:7b6:e47a:8e13 with SMTP id af79cd13be357-7bffcd449camr81507585a.31.1738100571691;
        Tue, 28 Jan 2025 13:42:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738100571; cv=none;
        d=google.com; s=arc-20240605;
        b=fwCalWSJXjXND6T7OvvvwYNfR5utZEUZqUEwgFUPIvoNdbNan8W7iSGvyR5HtIK++X
         ZyHHBuj3qq2vbsWRxmKi74ojxhruz8cikxhb0kzKiSxX12NbfaQnpuTC70UZzyR9Qfkk
         N2+AqjZWLqi02SzZ8wNlmJttg+28n70oV2qbJLSLHnAQ1jewjkaC+XRm1rentEblc7Dl
         CCh5tYppLLfOcAOV9C6WgS4o9zO7uAk/X0bC9wF5+07BYMdDRbUrIJbD3m/kEc1r6gAd
         T+5uG1VwYYbcQZnxEGFWqRORymQUnYUJonyteD20O/LfQSskYOcp7w9zhP3CKIWde8wN
         aOTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=hSJhqbeXD9zbKyqqhYGAQOG/peWfx4J88UGcHCQtZDA=;
        fh=XEUWnmNUzgDVltOtMw+UmOaRtoK2L8C0I2oKK3mImI4=;
        b=KLl2a4JALM7oYA2Q60rHs6Yq7xeAg4m2hXHbujbltHSIOReCOLDQvfZBcRpMn7EGEo
         25bLJKpd7+2NwCGuRZQxnKS+qnWSuMeO0DEH/Pc02XbX7kyR8EzvBa7gW5Rs+UKeGD8e
         YX1AolfAc6pLYdrcMUWuIKvg7FeADxh+JidI8MnGenpa6j8mU8gUYjOk60K5fYKaexkk
         eE+7oQBuqOMqYcEixQB6ZEB5x+NwM/SGoPq6b2abIcd0/XkkPdztW9zphEIEDWBOU9Wj
         czJE3+onm3ZGGmuBaEblbimmnEHS2IwyKo+3bvjysjFjMlZyOcupxzbz5soicD50C1Zu
         JvEQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HoImNFTp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be9ae81c2dsi1349959885a.44.2025.01.28.13.42.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jan 2025 13:42:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HoImNFTp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tctLL-0004c1-Cw; Tue, 28 Jan 2025 16:41:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tctLI-0004be-8A
 for qemu-devel@nongnu.org; Tue, 28 Jan 2025 16:41:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tctLG-0008RQ-Om
 for qemu-devel@nongnu.org; Tue, 28 Jan 2025 16:41:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738100513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hSJhqbeXD9zbKyqqhYGAQOG/peWfx4J88UGcHCQtZDA=;
 b=HoImNFTpwCNQ0PsG+UdBgQCGcPtO5p/CENTTf8GKMRKUe5Rf1x+9j7IE0PVMgEa5YSico9
 vd1QGQw/77zcNRm/tBeBjLYLqiDGteo2y/nlqxeBZFjp5jlGFVmnBOXHQuw2VLs8yb0srh
 2VBvkcr+jH8yWXhjoYYNtZadiLhyrLQ=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-605-iL7aCDAgNk6aPp2_XtkVZg-1; Tue,
 28 Jan 2025 16:41:49 -0500
X-MC-Unique: iL7aCDAgNk6aPp2_XtkVZg-1
X-Mimecast-MFC-AGG-ID: iL7aCDAgNk6aPp2_XtkVZg
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 980C219560BA; Tue, 28 Jan 2025 21:41:47 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.63])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id E979319560A3; Tue, 28 Jan 2025 21:41:35 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Troy Lee <troy_lee@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH 0/5] tests/functional: Update Aspeed OpenBMC images
Date: Tue, 28 Jan 2025 22:41:00 +0100
Message-ID: <20250128214100.1196243-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.3,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 5rvMgktbC064

Hello,

This series updates the OpenBMC firmware images to the latest version
for existing tests and also adds 2 new tests for Aspeed machines which
were not tested before : witherspoon and bletchley.

Thanks,

C.

Cédric Le Goater (5):
  tests/functional: Introduce a new test routine for OpenBMC images
  tests/functional: Update OpenBMC image of palmetto machine
  tests/functional: Update OpenBMC image of romulus machine
  tests/functional: Introduce a witherspoon machine test
  tests/functional: Introduce a bletchley machine test

 tests/functional/aspeed.py                    | 20 +++++++++-------
 tests/functional/meson.build                  |  4 ++++
 tests/functional/test_arm_aspeed_bletchley.py | 24 +++++++++++++++++++
 tests/functional/test_arm_aspeed_palmetto.py  | 12 +++++-----
 tests/functional/test_arm_aspeed_romulus.py   | 12 +++++-----
 .../functional/test_arm_aspeed_witherspoon.py | 24 +++++++++++++++++++
 6 files changed, 75 insertions(+), 21 deletions(-)
 create mode 100755 tests/functional/test_arm_aspeed_bletchley.py
 create mode 100755 tests/functional/test_arm_aspeed_witherspoon.py

-- 
2.48.1

