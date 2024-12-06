Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp833209njb;
        Fri, 6 Dec 2024 05:12:26 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV4lgxUBLhsolJ0HwavTvvVQi6Y8TCC+f7F4spoAvtNOvirbN485A6lMuyU/79wCvQkqlCvbZUhEYoL3w==@linaro.org
X-Google-Smtp-Source: AGHT+IG+isNoyJskHlZ3tRswF3iAbcog1b18v3ol8lch/2d34urfxoVdqN0VNxIA+JaKjFUkEbyO
X-Received: by 2002:a05:6122:2009:b0:50d:35d9:ad5f with SMTP id 71dfb90a1353d-515fcad54f7mr3615994e0c.7.1733490746225;
        Fri, 06 Dec 2024 05:12:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733490746; cv=none;
        d=google.com; s=arc-20240605;
        b=Byf1dKP+L+du+/h2NHYso4g9D1TQke3pqm8QAE6b1asIP53TslVIo/OwBHLodhHDIm
         I1rgOAVegsDWQaz9BhmmJpnsVoGFURg0P9A3jIuu5vMaGuJpq8Mi23pjt5L9cw/VWc2x
         lzpxGLgUpBVAbFnKgAL8HNZSCaZ9A3Yp4Hy41Xz70/JhNNjwKiPdoypdROj/8JYrocZr
         bZV1+4Fc8+9WDkoeBTa9UAI+vbWA5K2WUpdvhiAxQ3Cs/05oqxZbqocpcsY9DnOlpGv+
         K5nRMtAeULajxbOzrJ0hZ5pviHVFrb7jga3KHlXinw8PQ09NrqqZEAO6FWED06Lhw3bY
         Imog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=45go0LrAT5n+9R8paT38cRmHgq3lUHQp/c/KxlNZdMY=;
        fh=ei1e+zJiwKDD88dtLodzOeteNrdJ2/nETfnIpqjbrZ4=;
        b=bmXADyDjl1fITS4/uI3hdPHwc0yFj+bowmbaID3A1ZJ06fbwotjCGwO1HmNAsNQowc
         //2ryS98a6bjuyKHOzqV2GVjhFH07QnOokNDVraAHkw7OYPeQ8acPRjBybY5q6yxRIq9
         BXY7wS5TEI/+ZKWBd1olZ9naBizw39gVsMhhLzzrFLPkuIWeKlYeSX74MuiI8V1FXe8M
         9Gp9tpddFnyoFj1BhcaRsyo3fkOOJL3CTA9Pn7C76qj0Akwo8MPcfFKirMmoyMep6mIy
         ZsMq/ugYWglKzeTF/Ykkyr8mbzbISIbi9MHfO7krtDjgoCsDR1XL9diIo/75UT26V6dE
         zxuw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=f2D7j7+4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-515eae408bdsi1052462e0c.82.2024.12.06.05.12.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Dec 2024 05:12:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=f2D7j7+4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJY7e-0003vZ-C2; Fri, 06 Dec 2024 08:11:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tJY7c-0003vF-72
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 08:11:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tJY7a-00071J-M6
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 08:11:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733490707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=45go0LrAT5n+9R8paT38cRmHgq3lUHQp/c/KxlNZdMY=;
 b=f2D7j7+4X/vnWKm3YW3XlUotRRpKZAN1W2l3Ca1gNYnfZDO0Z96VzzsgNbG+zhObSv815y
 I+VQMqYlI3dfmf7uOULIYgZs7bp5OY9CquRDYpI3oz+mx+lgz47CJSNa8cjriFF1NG484e
 AFUllso89SIB/lkgEBy7hGRm+uRIJLc=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-316-2DvmWNpxOg-4E0OBOWO0ag-1; Fri,
 06 Dec 2024 08:11:44 -0500
X-MC-Unique: 2DvmWNpxOg-4E0OBOWO0ag-1
X-Mimecast-MFC-AGG-ID: 2DvmWNpxOg-4E0OBOWO0ag
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 741481955F45; Fri,  6 Dec 2024 13:11:40 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.16])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 412371955F3F; Fri,  6 Dec 2024 13:11:34 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH 0/7] tests/functional: Split aspeed tests 
Date: Fri,  6 Dec 2024 14:11:25 +0100
Message-ID: <20241206131132.520911-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.996,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: xwJCZ09HxHv2

Hello,

All functional tests of aspeed machine are run from a single test
file. Splitting the tests will improve parallelism and allow us to
set different timeouts.

The timeout values were chosen from a (single cpu) run on a raspberry
pi4 :

  func-arm-arm_aspeed_ast1030       2.52s
  func-arm-arm_aspeed_palmetto     50.54s
  func-arm-arm_aspeed_romulus      61.81s
  func-arm-arm_aspeed_rainier     127.23s
  func-arm-arm_aspeed_ast2500     378.60s
  func-arm-arm_aspeed_ast2600     559.13s

Thanks,

C.

Cédric Le Goater (7):
  tests/functional: Introduce a specific test for ast1030 SoC
  tests/functional: Introduce a specific test for palmetto-bmc machine
  tests/functional: Introduce a specific test for romulus-bmc machine
  tests/functional: Introduce a specific test for ast2500 SoC
  tests/functional: Introduce a specific test for ast2600 SoC
  tests/functional: Introduce a specific test for rainier-bmc machine
  tests/functional: Move debian boot test from avocado

 tests/avocado/boot_linux_console.py          |  26 --
 tests/functional/aspeed.py                   |  56 +++
 tests/functional/meson.build                 |  14 +-
 tests/functional/test_arm_aspeed.py          | 351 -------------------
 tests/functional/test_arm_aspeed_ast1030.py  |  81 +++++
 tests/functional/test_arm_aspeed_ast2500.py  |  59 ++++
 tests/functional/test_arm_aspeed_ast2600.py  | 143 ++++++++
 tests/functional/test_arm_aspeed_palmetto.py |  24 ++
 tests/functional/test_arm_aspeed_rainier.py  |  64 ++++
 tests/functional/test_arm_aspeed_romulus.py  |  24 ++
 10 files changed, 463 insertions(+), 379 deletions(-)
 create mode 100644 tests/functional/aspeed.py
 delete mode 100755 tests/functional/test_arm_aspeed.py
 create mode 100644 tests/functional/test_arm_aspeed_ast1030.py
 create mode 100644 tests/functional/test_arm_aspeed_ast2500.py
 create mode 100644 tests/functional/test_arm_aspeed_ast2600.py
 create mode 100644 tests/functional/test_arm_aspeed_palmetto.py
 create mode 100644 tests/functional/test_arm_aspeed_rainier.py
 create mode 100644 tests/functional/test_arm_aspeed_romulus.py

-- 
2.47.0

