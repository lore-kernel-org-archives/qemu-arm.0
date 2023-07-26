Received: by 2002:a17:906:2484:b0:98d:b2f5:1316 with SMTP id e4csp265775ejb;
        Tue, 25 Jul 2023 20:32:27 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFf/qu/Ao8Q0tW9jOY7MrVd+s5bDiK0a13Yzo8MsvntO0aNa0sfISXylGMS4HJ/wxXfn9I4
X-Received: by 2002:a05:622a:84:b0:403:b4d5:a5ec with SMTP id o4-20020a05622a008400b00403b4d5a5ecmr5298409qtw.4.1690342347688;
        Tue, 25 Jul 2023 20:32:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690342347; cv=none;
        d=google.com; s=arc-20160816;
        b=OCunzYmZzP3/TdbuQUJXPFQ3RZguk2JQy+K/SL5p/x+ltcRonzeUSrvFN1nyGWSghw
         BYiWvIGaiJ/i2b9RuDHuJtJ6ZzEvrPbDz7ZooCanv1G0SXHUvHTQZCwAQHMPPCq25FFo
         v01dgWTbxOP2+HeIfgR+q6ZnNXP7ZnDD8oZFf+KFHdAoBFQGovIDKgxK7kVh3bHmPWtN
         Wyhf+r3jkwepuKLncPbGfAOkVJJmvzbcCSaXXrM4CCZSUk0Dt8h6bs8ZyeNQZaHhNdYo
         w+hYdzI3oX6UISY6yKsyoXxhUeRVmbn1R3YTNwYgE4DV1cM1MziURKyuUQgoMNyKyMsH
         n0yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:feedback-id:message-id:subject:cc:from:to
         :dkim-signature:date;
        bh=g8QGpV02+etXYBzd+0YLtwhj+yFGubLyrpyohQAwO1w=;
        fh=51RBXPp2dGsIxW/A/2XX6J9OY4lNIg77Uvb7eAIehHk=;
        b=yKw7bGJ31dCZvvmd30ONg0cb/UfgvCU742t7dYF1mUftm2jghPPdwGjQvpqeAOuBIJ
         1O1UOpYsL3hFsVQgUCF57iz0R4vEnHdEbxPuoPB8Bc0lNASzMKJ/L1CN4W9Q7gOGnu60
         6Si7QBx+KizuPh37NV0LvA6ULzNjm+LeBAu8ax5I97H631GOxWkFl5FszpFZn+HrLOhn
         dUlK0LEWv7s4nJm8gsN0jNb6Qr9d98ccCMF/yzvsWZFVOiR2+/aQZfeWrnEKy4jyXY6g
         KVuRJVKhjrv7aizWo2HG3dlqfdylegsEJ66Cyge7DqlCZ4OMLEjRxSGoM3LsEA6Yb+OF
         vgZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@laplante.io header.s=protonmail3 header.b=I1xUjzJT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=laplante.io
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k6-20020a05622a03c600b00403cbd1ef77si7458067qtx.208.2023.07.25.20.32.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jul 2023 20:32:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@laplante.io header.s=protonmail3 header.b=I1xUjzJT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=laplante.io
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qOVG5-0005N7-Bx; Tue, 25 Jul 2023 23:32:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chris@laplante.io>) id 1qOVG2-0005MI-4r
 for qemu-arm@nongnu.org; Tue, 25 Jul 2023 23:32:14 -0400
Received: from mail-40136.proton.ch ([185.70.40.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chris@laplante.io>) id 1qOVG0-0006OG-4h
 for qemu-arm@nongnu.org; Tue, 25 Jul 2023 23:32:13 -0400
Date: Wed, 26 Jul 2023 03:31:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=laplante.io;
 s=protonmail3; t=1690342322; x=1690601522;
 bh=g8QGpV02+etXYBzd+0YLtwhj+yFGubLyrpyohQAwO1w=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=I1xUjzJTFDi3S/+fCaLzJH3VAg5xVJhLUDz/hiw+66d1jVmEQWR7+Y+5xBVEGh6sP
 NfZ9LubN08tiMey58f8NPCkPDR7kVnyYTr9SFLa50PXYPGhYOl6TbjdKCO8GXQcVSM
 M/p8wM61sFd+2H1zs1F5hBwODYj8pBabWGZtKCGA59swGN2i/I7F8y0Smh/mp1lHHt
 SpfTxbeKZwuKfTwZvdofnu2KhZkf7Hfyg1apwWSxdi9sxZtkOmcfys1pSzNkXct+/J
 kp/ne/BjfVUem48aleZ+mJuyghuTOHrCaTiUOvDtreCGP13OJ/eCTXi68M1I2W/0o3
 b8/A/1WJEYghg==
To: qemu-devel@nongnu.org
From: Chris Laplante <chris@laplante.io>
Cc: Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Chris Laplante <chris@laplante.io>
Subject: [PATCH v2 0/6] Add nRF51 DETECT signal with test
Message-ID: <20230726030450.757462-1-chris@laplante.io>
Feedback-ID: 43500449:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=185.70.40.136; envelope-from=chris@laplante.io;
 helo=mail-40136.proton.ch
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 1RKZd15/1S1x

This patch series implements the nRF51 DETECT signal
in the GPIO peripheral. A qtest is added exercising the signal.

To implement the test, named out-GPIO IRQ interception had to be added
to the qtest framework. I also took the opportunity to improve IRQ
interception a bit by adding 'FAIL' responses when interception fails.
Otherwise, it is frustrating to troubleshoot why calls to
qtest_irq_intercept_out and friends appears to do nothing.

v1: https://patchwork.kernel.org/project/qemu-devel/list/?series=3D766078

Testing
=3D=3D=3D=3D=3D=3D=3D
Passes 'make check'

Changelog
=3D=3D=3D=3D=3D=3D=3D=3D=3D
v2: factor out qtest_install_gpio_out_intercept before usage (Peter)
    renamed qtest_install_gpio_out_intercepts =3D> qtest_install_gpio_out_i=
ntercept
    don't pass DETECT to soc level (Peter)
    change qtest to use DETECT at GPIO level (Peter)


Chris Laplante (6):
  hw/gpio/nrf51: implement DETECT signal
  qtest: factor out qtest_install_gpio_out_intercept
  qtest: implement named interception of out-GPIO
  qtest: bail from irq_intercept_in if name is specified
  qtest: irq_intercept_[out/in]: return FAIL if no intercepts are
    installed
  qtest: microbit-test: add tests for nRF51 DETECT

 hw/gpio/nrf51_gpio.c         | 14 ++++++++-
 include/hw/gpio/nrf51_gpio.h |  1 +
 softmmu/qtest.c              | 56 ++++++++++++++++++++++++++----------
 tests/qtest/libqtest.c       |  6 ++++
 tests/qtest/libqtest.h       | 11 +++++++
 tests/qtest/microbit-test.c  | 42 +++++++++++++++++++++++++++
 6 files changed, 114 insertions(+), 16 deletions(-)

--
2.41.0


