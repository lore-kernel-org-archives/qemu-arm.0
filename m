Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp4360539eje;
        Fri, 14 Jul 2023 16:27:44 -0700 (PDT)
X-Google-Smtp-Source: APBJJlH6+BMf2YqTz/VrVcv8sLi8T9BPwi/jPLIdzqpWevv2T4y8s7O0/Xp3Jf6SNg+vsSSg/wE9
X-Received: by 2002:a05:622a:1a1e:b0:400:9d1a:a8eb with SMTP id f30-20020a05622a1a1e00b004009d1aa8ebmr7997600qtb.15.1689377263803;
        Fri, 14 Jul 2023 16:27:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689377263; cv=none;
        d=google.com; s=arc-20160816;
        b=oHdJaQH8aYnRGLXAuei3VvHG7igbPliHlnKwxATc/7jHR6bbINpp5B9uj3XVoSI3HI
         DDqK3ig4lPAZ5Ix3bxCAzo9ZgEVUUy1/XL5+jLdOg07XaMKeDNTRIWeisZqhtRVHKK5t
         78O+Gs8Kz3ASdwdYgAaCODOq0Fj21O9WGFMkx5yfqEoTngqQxhLylc9nBObCL3Fyf0AN
         VmZ8BXNIRdzVzdFdZMlteXC8NNngx+lGEHWYpHMFTcjE6MIa9cPJpp1M/ByIVa1CxlpX
         6s04rhByEVZOWGFrjKzoKzmoUPLWL3H5jGb32tkT4eyZujRpfHh2yFmwdVpFMq06WSaN
         ICHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:feedback-id:message-id:subject:cc:from:to
         :dkim-signature:date;
        bh=Qfo6lq/LbSAZX8skPpnL1wCmTjfPNfbiPFkFqV48zqU=;
        fh=51RBXPp2dGsIxW/A/2XX6J9OY4lNIg77Uvb7eAIehHk=;
        b=io5Psx5SBisoITm3wKPnCS2B5pt5afgEVoGdATuu70vX/JmGFAlKskpwrRMOQgn4I/
         JbMg9ColbW4bYAlz7rlfaUvpDWlu+IQ33XLwsc+G07iU3X1MEiPoRGgt12hZ30TAo20G
         YqDl1hNafEOjA+qBEUaQ/REcigGOu5CDm+MXInabAAQDR4JYylW2+OSiV2SpU8ROyrSa
         zw2GsJIdS8CFh1IDRmwuNdA83h6TXFVZcF3rxlYGLtqrJJYlnzh9P6OmN/RH92eLZzX/
         Zqyy4CKNNU/oy4GlOdMaLWD+4n3ftVWN2s8oHOXHqBiBrHdao2kKK5th3TdAfss0NCxV
         3o4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@laplante.io header.s=protonmail3 header.b=BdXrUBO8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=laplante.io
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d15-20020ac85acf000000b00403c3fb27d8si4154502qtd.678.2023.07.14.16.27.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Jul 2023 16:27:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@laplante.io header.s=protonmail3 header.b=BdXrUBO8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=laplante.io
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qKSC9-0000ic-OT; Fri, 14 Jul 2023 19:27:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chris@laplante.io>)
 id 1qKSC8-0000iO-Q0; Fri, 14 Jul 2023 19:27:29 -0400
Received: from mail-4317.proton.ch ([185.70.43.17])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chris@laplante.io>)
 id 1qKSC6-0003yL-MB; Fri, 14 Jul 2023 19:27:28 -0400
Date: Fri, 14 Jul 2023 23:27:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=laplante.io;
 s=protonmail3; t=1689377242; x=1689636442;
 bh=Qfo6lq/LbSAZX8skPpnL1wCmTjfPNfbiPFkFqV48zqU=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=BdXrUBO8GS4GfBwML2GPF2TausdS84GZd7daRCRLOzzNFpLm+LqcPPiKNWopjJAVc
 NMJXolpq6Yf0EpyNlaXfPc8kfsH+bj+7qaNPkbwiWwGEmY64h+mfly6Jrqri7na+4s
 FSQtEDXHc3TzUJoSKSginG4MDKrXVRNbH8+Yj/rYJUboFzUnkDtiaHF5Z0DTnhgc6Y
 qVkj0bq2XGPRsRhcoBV3Wv06RDi5mRWj848vrJZK6yyvUKB/4BUOnq0WOik2rgdIra
 5ZLYzSnxry/7Viddvdidf4+7syoqEFWn5ZLkQcdlbEjMbIZlJur3TnI18OR3CSdws9
 KHd/EDguW0vCQ==
To: qemu-devel@nongnu.org
From: Chris Laplante <chris@laplante.io>
Cc: Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Chris Laplante <chris@laplante.io>
Subject: [PATCH 0/6] Add nRF51 DETECT signal with test
Message-ID: <20230714232659.76434-1-chris@laplante.io>
Feedback-ID: 43500449:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=185.70.43.17; envelope-from=chris@laplante.io;
 helo=mail-4317.proton.ch
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 6XWEgf/Kg5ie

This patch series implements the nRF51 DETECT signal
in the GPIO peripheral. A qtest is added exercising the signal.

To implement the test, named out-GPIO IRQ interception had to be added
to the qtest framework. I also took the opportunity to improve IRQ
interception a bit by adding 'FAIL' responses when interception fails.
Otherwise, it is frustrating to troubleshoot why calls to
qtest_irq_intercept_out and friends appears to do nothing.

Chris Laplante (6):
  hw/gpio/nrf51: implement DETECT signal
  qtest: implement named interception of out-GPIO
  qtest: bail from irq_intercept_in if name is specified
  qtest: factor out qtest_install_gpio_out_intercepts
  qtest: irq_intercept_[out/in]: return FAIL if no intercepts are
    installed
  qtest: microbit-test: add tests for nRF51 DETECT

 hw/arm/nrf51_soc.c           |  1 +
 hw/gpio/nrf51_gpio.c         | 14 ++++++++-
 include/hw/gpio/nrf51_gpio.h |  1 +
 softmmu/qtest.c              | 56 ++++++++++++++++++++++++++----------
 tests/qtest/libqtest.c       |  6 ++++
 tests/qtest/libqtest.h       | 11 +++++++
 tests/qtest/microbit-test.c  | 42 +++++++++++++++++++++++++++
 7 files changed, 115 insertions(+), 16 deletions(-)

--
2.39.2


