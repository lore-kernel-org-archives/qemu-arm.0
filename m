Received: by 2002:a17:906:fc12:b0:98d:b2f5:1316 with SMTP id ov18csp584503ejb;
        Fri, 28 Jul 2023 09:19:37 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGBBdKTuI4VqwCA+2cmDPn08eZJ8Jpn2gir25GxKrVZsBAMmPM8xTsUlFduN3PK7tWtvApE
X-Received: by 2002:ac8:7e84:0:b0:403:b6b0:c1d8 with SMTP id w4-20020ac87e84000000b00403b6b0c1d8mr3647289qtj.7.1690561177042;
        Fri, 28 Jul 2023 09:19:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690561176; cv=none;
        d=google.com; s=arc-20160816;
        b=SVPcVscnqb7F049sXFKifeTeUM8a47JBajhjKkz1km68QsYfS0UIb2/IIh18Mk1pwF
         sI69SEFc1DvOxDjl5rW912MiRD269s8rkLUYGb2/5aBjuwZrXjn7bkow8F/+Tx+OuLEG
         5nFQPxfy8HcGwBa/xjAhxXwBIbbAKtoU6EgIUaT31YKQPlB3RwAqhg3875mr18beO4NU
         uz9bH/fF9/ArTytpusFnBTf+1zItkIptCtJjehUJk0JOv29VlzwMMa4jq2+m5w6r5Sm+
         1veKCFs6f+fWSTek63szcQysXv6Xr1Qw2vHZBamge0xlO+vMAucqphp0nHGBJSTjvnAE
         WAww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:feedback-id:message-id:subject:cc:from:to
         :dkim-signature:date;
        bh=zQBB7Ko53fiYSwYt5uROhNcqpPSMi6i/NSWBA2hbLdU=;
        fh=51RBXPp2dGsIxW/A/2XX6J9OY4lNIg77Uvb7eAIehHk=;
        b=u8jNRExQJ7eHZ37Aubj1rT+ysmeXgXVyZSs4EQ1epq3TySPmDRZpSZRc66bEnU4YEa
         ZvUcTK30H9mVz7yiXcIgLekO6yxu3lM81BEjvfeqBCB2V60IrHHa96JdnreMxdeRJ60v
         FM/wsYxaPbkZB2gTc5S13H10EV52/q2siYJe+nY2C04+goi7c2b50dMgS5h08u7cq6hu
         TerRcwJwb1IUEQvqU95x1toS7BrHhfO+blUaVnJ15z3jwIinZNizfTH9/nuPwosFBp8f
         upUsAl1DjLa3QXgy+/lmVsupSUSYFz7wIMfFK3KU8salsZq7sL0/mxLp5/m07uvDkL3V
         zpHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@laplante.io header.s=protonmail3 header.b=dHK4WEvA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=laplante.io
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t15-20020a05622a148f00b0040399b07ccdsi2499714qtx.149.2023.07.28.09.19.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Jul 2023 09:19:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@laplante.io header.s=protonmail3 header.b=dHK4WEvA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=laplante.io
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qPPxd-0004rN-OJ; Fri, 28 Jul 2023 12:05:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chris@laplante.io>) id 1qPPxb-0004qc-RW
 for qemu-devel@nongnu.org; Fri, 28 Jul 2023 12:04:59 -0400
Received: from mail-4018.proton.ch ([185.70.40.18])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chris@laplante.io>) id 1qPPxY-0004LQ-DX
 for qemu-devel@nongnu.org; Fri, 28 Jul 2023 12:04:59 -0400
Date: Fri, 28 Jul 2023 16:04:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=laplante.io;
 s=protonmail3; t=1690560292; x=1690819492;
 bh=zQBB7Ko53fiYSwYt5uROhNcqpPSMi6i/NSWBA2hbLdU=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=dHK4WEvAJL4aG0DOOHUQ6Tmez53x9s1ufdaLOTpEZPUn14w8yHG5fNxwXj5Rb1cxG
 T21c1Uv2BzcqzUfGp+MC5fmkK76UrBU4QC1oAxzuXnu+1/GSiT08O+ojd/p44cWaKU
 n/0Dcrp3gRE6bCYD26miqzidH6JpIjzS9WAhcRMiuhgMVyo0Btx/RcvcWme2BMzrk8
 48eqOpGcghOKjW1mn82Nsf9FOaOpE/6CoHMS0BC/c4Wg7bv3l1v3y/5CnKh0Ag7Obs
 IhR+iTM99a62Mx4dK79V5ecZwGreztiUyfFgMZq0a5pw2qQVub7E+ktu30CnuLKIXr
 1AOpokfsjCqyw==
To: qemu-devel@nongnu.org
From: Chris Laplante <chris@laplante.io>
Cc: Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Chris Laplante <chris@laplante.io>
Subject: [PATCH v3 0/6] Add nRF51 DETECT signal with test
Message-ID: <20230728160324.1159090-1-chris@laplante.io>
Feedback-ID: 43500449:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=185.70.40.18; envelope-from=chris@laplante.io;
 helo=mail-4018.proton.ch
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: YC+M70hqa8am

This patch series implements the nRF51 DETECT signal
in the GPIO peripheral. A qtest is added exercising the signal.

To implement the test, named out-GPIO IRQ interception had to be added
to the qtest framework. I also took the opportunity to improve IRQ
interception a bit by adding 'FAIL' responses when interception fails.
Otherwise, it is frustrating to troubleshoot why calls to
qtest_irq_intercept_out and friends appears to do nothing.

v2: https://patchwork.kernel.org/project/qemu-devel/list/?series=3D769532

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

v3: formatting fixup (Peter)
    handle multiple named out-GPIOs, not just one (Peter)

Chris Laplante (6):
  hw/gpio/nrf51: implement DETECT signal
  qtest: factor out qtest_install_gpio_out_intercept
  qtest: implement named interception of out-GPIO
  qtest: bail from irq_intercept_in if name is specified
  qtest: irq_intercept_[out/in]: return FAIL if no intercepts are
    installed
  qtest: microbit-test: add tests for nRF51 DETECT

 hw/gpio/nrf51_gpio.c         | 14 +++++++++-
 include/hw/gpio/nrf51_gpio.h |  1 +
 softmmu/qtest.c              | 52 +++++++++++++++++++++++++-----------
 tests/qtest/libqtest.c       |  6 +++++
 tests/qtest/libqtest.h       | 11 ++++++++
 tests/qtest/microbit-test.c  | 42 +++++++++++++++++++++++++++++
 6 files changed, 110 insertions(+), 16 deletions(-)

--
2.41.0


