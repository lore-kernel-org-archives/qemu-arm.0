Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp7310604njc;
        Tue, 12 Nov 2024 05:03:27 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVyrZf+igl7WS1/zYeaZJMxnFKo9zfmEV9fw7mF5pd95TRZLr1QzNTmAwquAo4a5zjxmKcYmfi1hxdQTw==@linaro.org
X-Google-Smtp-Source: AGHT+IErQn6Rh+nAGyTGzI+Nb61C/AyZPM8eaAx04gZeO2d/YjU7EanswwgCZ+Uf+MjbjVeXSYFb
X-Received: by 2002:a05:6102:b0c:b0:4a3:e1de:4fd8 with SMTP id ada2fe7eead31-4aae167e9c4mr13983988137.26.1731416607264;
        Tue, 12 Nov 2024 05:03:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731416607; cv=none;
        d=google.com; s=arc-20240605;
        b=ClBFkohWyIa9fPskCGau8dn1z+3p2lfylZe+wFZ9i3ho78pM2Sy9cropvuTzBoRiOv
         6RbEesmQbAgT8HC7/k3WWLFsbARqYGrmakXtIYbUaxUObJ+RVYeA3tsUoZ4ztDrRi64f
         zAs3BXAKkGn2c0t+MUIMsBZlgG/b5bCW+cLRgfbyBRIJx69XCX6Y5Zi/zfChqwf7E0Vn
         WVPf1xPfuVCv8NmFdzO6bBT2lwc11TQhTYzMlQYF+CljxbSZuCkLmDAYxyfHZ5cDcSqC
         aGmpeSqoSHbQUJQAEkEovJzJsCO/R0weIp8/8JLVeEGTTmiQA2ucJtb+0bfyW7emb75H
         X4wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=DK53IjCHi6Qbc7tXpbI4et1d8ofBb39k/MJbVROcd/s=;
        fh=36XeOeSnsB5LbZUpSpyTPSVUP6DQSW+xMm0rZH0YiK4=;
        b=GKv19vfvQ0oJUw2FBC7LRrnukaqmtVoiX5xKRSM1dLnM6prJKRvCwI4f2D2Uf7DiLe
         V1AjHVynQuldo2j9tJpHzspzZfMExjtAKBSEAyjyxBUodCHaMszn+5CEomXBvMBHMs3l
         57QcXWUZ0KJn0RcDZ2KLH6LvnOMS/jZiUuYDF5hTb83N3caSgpKQUr/S+/LwDysS0e0P
         6Xujt2knsuqKLlzm43IBV0O9Wy4/oxDhNiseDFeGrQQS2IeZITBKjzVdXOeSaoulux+j
         Z+bbcFbe2N74MGRDFBlXoilTKwOkvtjHov8MCnDNbrsG+lwki7zkgialcc9MClw/U0U8
         6A+A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BAQWh+of;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4aa9f02fd53si2955969137.327.2024.11.12.05.03.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Nov 2024 05:03:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BAQWh+of;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tAqXz-0005Zy-8s; Tue, 12 Nov 2024 08:03:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tAqXw-0005Yt-Ot
 for qemu-arm@nongnu.org; Tue, 12 Nov 2024 08:03:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tAqXu-0003cN-9k
 for qemu-arm@nongnu.org; Tue, 12 Nov 2024 08:03:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1731416581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=DK53IjCHi6Qbc7tXpbI4et1d8ofBb39k/MJbVROcd/s=;
 b=BAQWh+ofnPfgJj7Lol2RKp6X9po0DUF9IYBIBSb8GZHm7ORzdDOGgGkjZj2Oc5gpVDnuVN
 BUjDX+8qBNb3ckGIJkPshXWsx+l3kwrX2A5ZqXrTF6feX15IqpDpuJTjLT0dGCCZQ2b85q
 jaOgjgW3XaE4XCDEgA+ls+ZOB8wvlbM=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-373-3ItCtIKQNdq6VD8HFdYuLg-1; Tue,
 12 Nov 2024 08:02:56 -0500
X-MC-Unique: 3ItCtIKQNdq6VD8HFdYuLg-1
X-Mimecast-MFC-AGG-ID: 3ItCtIKQNdq6VD8HFdYuLg
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 0A6611955EEA; Tue, 12 Nov 2024 13:02:54 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.193.48])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 6024A1955F40; Tue, 12 Nov 2024 13:02:48 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH v2 0/4] tests/functional: Finish conversion of Aspeed tests
Date: Tue, 12 Nov 2024 14:02:42 +0100
Message-ID: <20241112130246.970281-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.122,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.671,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: Z8m7febYpugt

Hello,

The first patch is a proposal to fix a long-standing issue when
capturing the console output. In some cases, the expected string does
not match in the output, causing the test to fail with a timeout. The
change introduces a _console_read() routine that processes the console
output character by character as a possible fix.

Last patches complete the conversion of the Aspeed tests and remove
the console workarounds.

Thanks,

C.

Changes in v2:

 - Redirected all console output in console.log file
 - Added a "found" prefix when an expected string is captured
 - Used a user mode network backend in SDK tests
 - Changed the expected string to "login:" in buildroot tests
 
Cédric Le Goater (4):
  tests/functional: Introduce _console_read()
  tests/functional: Convert Aspeed aarch64 SDK tests
  tests/functional: Convert Aspeed arm SDK tests
  tests/functional: Remove sleep workarounds from Aspeed tests

 tests/avocado/machine_aspeed.py         | 202 ------------------------
 tests/functional/meson.build            |   2 +
 tests/functional/qemu_test/cmd.py       |  22 ++-
 tests/functional/test_aarch64_aspeed.py |  97 ++++++++++++
 tests/functional/test_arm_aspeed.py     |  79 ++++++++-
 5 files changed, 191 insertions(+), 211 deletions(-)
 delete mode 100644 tests/avocado/machine_aspeed.py
 create mode 100644 tests/functional/test_aarch64_aspeed.py

-- 
2.47.0

