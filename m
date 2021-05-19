Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp1687398lfm;
        Wed, 19 May 2021 10:10:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzI7Su1DTBlwBJQiu3gbdWxop/llUmZzvYUHw91t+fOwciLIvnwL8uFoXAg+zzCRVT3Mapv
X-Received: by 2002:a05:6638:270b:: with SMTP id m11mr9488600jav.59.1621444220410;
        Wed, 19 May 2021 10:10:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621444220; cv=none;
        d=google.com; s=arc-20160816;
        b=VpOka478034FqiO/sL5LN4+k32jnXt8cEbl+I2gzt4hW2mRSNeqDZZFYxXeis5OTyk
         tN4XgIa2qQprpurWmBhsfpqFndqURvATtn3+vVQjlGPPgznayJVHmzoXJvoSWg+gohbL
         /juOynm8WPJiTNlzWE0WSnEpd9Lfl1rTSLuPnVwO+oj8cAnxpxzrMgeLOxtNQf/jao3D
         NEbDqK2wNfaO8fmUt2Cwr9LBOjs7ph4p1WMrVwZtqkf73o28sB+ygpyxctttOg4mtpKm
         GK6C3c+irHhpkMikqxO1volzPiorzaSd94izHCq833an7ijEYDK00ECYXCRVormVO/CX
         4Xsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :from:subject:mime-version:message-id:date:dkim-signature;
        bh=/FPGRkIUcB5ekNXhBxpIo20xXseOE+DQDbmehl5VJ4s=;
        b=0gmeMXwycG5ZKzV1A/zPyxQXPpYhZdigfLU/ISnF1l9c23VUorpsBwOYdw74i44YU8
         eUJs0XkaqS+jRowvHftBkFqCcZfa4jG7ALANJlUN//Qn1EAR8Yc5YjgahIWF7atyWDwk
         InhJDVi7eyFEjxPk5KkuwEY1MWHhERsjETyDjIimzRJOPQcpd+tg+zjHRxmr18yZn5RK
         GQoGLojMyaGT5tXa4hD/9+WzP1CjfGCrtYSiaKrgbGonNAtSNk5n+2qF0XfZYxFrxyNR
         52Qq4i3nKjRvqJjO8kRlsyWgLCxyOt9kSNrARpE+WpK8aaw4yGebsV8/2HePSikGV5zK
         5mjg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=RB2HMs9n;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o8si201743ilu.133.2021.05.19.10.10.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 May 2021 10:10:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=RB2HMs9n;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:43556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ljPi7-0005xy-LQ
	for alex.bennee@linaro.org; Wed, 19 May 2021 13:10:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3xUGlYAYKCugdSdecbQYYQVO.MYWaOWe-NOfOVXYXQXe.YbQ@flex--titusr.bounces.google.com>)
 id 1ljPOk-0000pq-Ps
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:50:18 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a]:40748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3xUGlYAYKCugdSdecbQYYQVO.MYWaOWe-NOfOVXYXQXe.YbQ@flex--titusr.bounces.google.com>)
 id 1ljPOh-0003iQ-Le
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:50:18 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id
 e138-20020a25e7900000b029050df4b648fcso12536435ybh.7
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 09:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc
 :content-transfer-encoding;
 bh=/FPGRkIUcB5ekNXhBxpIo20xXseOE+DQDbmehl5VJ4s=;
 b=RB2HMs9n3Smqcz20Lt+kKK+nVbjJrTowAFyGZXeA5joyP6nhBtdS/p3XGySQRdgZUC
 28TgeKL9KVKfpBowmD/ym84iQP0TjPkkj6nENoZjYmd2QE2mEKYjO3qGCZPyc/NJrb7Q
 RwX+0W6qpK5SKL0XkTyhIKOwaOMvMEmeRU6MAbTH67XrPYpsOqosgJJFwNyjLjbYrO7F
 rRT0nzGGiaO6U0a5pZEsqCbZrp0THVG+Q6TjVYj37/LVRLVWLm0nMbdv1SQrJQpgkFs3
 JEQPFA5Gr7DFYxkFZrg26owjtnTJDGcsG1uxJfNeD8jWs3111LArmP15vDk43P3ODIKn
 z4Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc
 :content-transfer-encoding;
 bh=/FPGRkIUcB5ekNXhBxpIo20xXseOE+DQDbmehl5VJ4s=;
 b=XyQDckTSeBICCjwBSsF6+r/4rc1sdCUFsL2qtCw0O3jMa+sjgw9ZLwF72WPEk2aydV
 Ddqoxq/rKXgKNGQO+XfMadokZinZQrFDxTvdfkryw3AK+tx3LM2YkxHerdl8pd+LxGzx
 06/XaGA1/M/NHF138LA/V+6AesUZCnymMzcAggKP1DEJI/h0q/GK/P24hlaW8rp55SZo
 mDO5bvcXH8agG7toYjUwQSahClKfARtkPIM/8OjygmPvz8Ov/S+WFD39FiRBiCa58+wD
 +rrM4i2fSXmuf++GUkg+MAjnxAgCHDMP70jDvhtAXU0xCDomH8DNb7N9lJ8EsaOJEq0l
 8ihQ==
X-Gm-Message-State: AOAM533ERE1m068DGgQ4tDyIn/B6BJ7nAOK3DiLa132awSw51zw+9EDb
 iVQuQK5TH6KAOXWGzRbMNStr35rE+E4=
X-Received: from titusr.svl.corp.google.com
 ([2620:15c:2c5:13:536c:7a08:da59:68a2])
 (user=titusr job=sendgmr) by 2002:a25:7a02:: with SMTP id
 v2mr614641ybc.514.1621443013488; 
 Wed, 19 May 2021 09:50:13 -0700 (PDT)
Date: Wed, 19 May 2021 09:49:57 -0700
Message-Id: <20210519165002.1195745-1-titusr@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
Subject: [PATCH v4 0/5] Add support for PMBus in QEMU
From: Titus Rwantare <titusr@google.com>
To: Corey Minyard <cminyard@mvista.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, f4bug@amsat.org, 
 Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3xUGlYAYKCugdSdecbQYYQVO.MYWaOWe-NOfOVXYXQXe.YbQ@flex--titusr.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: PnC8OIyE1+6/

Hello,

This patch series adds an interface to start supporting PMBus devices in QE=
MU.
I=E2=80=99ve included two PMBus devices: MAX34451 and ADM1272.

PMBus is a variant of SMBus meant for digital management of power supplies.
PMBus adds to the SMBus standard by defining a number of constants and comm=
ands
used by compliant devices. The specification for PMBus can be found at:

https://pmbus.org/specification-archives/

Currently, the goal for these devices is to emulate basic functionality by
reading and writing registers. Timing, and some logical operation is not
implemented. This implementation supports nearly all available registers fo=
r
PMBus including:
   - Voltage inputs and outputs
   - Current inputs and outputs
   - Temperature sensors

Unimplimented registers get passed through to the device model, and device
models can opt out of using the standard registers with flags. The included
devices make use of these fields and illustrate how to interface with the p=
mbus
class.

Datasheets for sensors:

https://datasheets.maximintegrated.com/en/ds/MAX34451.pdf
https://www.analog.com/media/en/technical-documentation/data-sheets/ADM1272=
.pdf

Since v3:
- added VMState descriptions. Adding PMBusPage info to the vmsd has proven =
to be tricky, it's a TODO for now.

Since v2:
- bump for feedback
- removed commented out code

Since v1:
- addressed Joel's comments
- split out tests into their own patches

Thanks for reviewing,

Titus Rwantare

Titus Rwantare (5):
  hw/i2c: add support for PMBus
  hw/misc: add ADM1272 device
  tests/qtest: add tests for ADM1272 device model
  hw/misc: add MAX34451 device
  tests/qtest: add tests for MAX34451 device model

 include/hw/i2c/pmbus_device.h |  517 +++++++++++
 hw/i2c/pmbus_device.c         | 1612 +++++++++++++++++++++++++++++++++
 hw/misc/adm1272.c             |  544 +++++++++++
 hw/misc/max34451.c            |  775 ++++++++++++++++
 tests/qtest/adm1272-test.c    |  445 +++++++++
 tests/qtest/max34451-test.c   |  336 +++++++
 hw/arm/Kconfig                |    3 +
 hw/i2c/Kconfig                |    4 +
 hw/i2c/meson.build            |    1 +
 hw/misc/Kconfig               |    8 +
 hw/misc/meson.build           |    2 +
 tests/qtest/meson.build       |    2 +
 12 files changed, 4249 insertions(+)
 create mode 100644 include/hw/i2c/pmbus_device.h
 create mode 100644 hw/i2c/pmbus_device.c
 create mode 100644 hw/misc/adm1272.c
 create mode 100644 hw/misc/max34451.c
 create mode 100644 tests/qtest/adm1272-test.c
 create mode 100644 tests/qtest/max34451-test.c

--=20
2.31.1.751.gd2f1c929bd-goog

