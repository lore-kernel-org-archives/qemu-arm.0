Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp694250lfm;
        Tue, 18 May 2021 12:08:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJznLwUJFfB1FNNT7VdW+BZxRmZ91Qiv7sljBBhX8JibdKme+h3VEpROYcBnQiXNxpmUzPlE
X-Received: by 2002:a05:6638:13c4:: with SMTP id i4mr20932jaj.37.1621364883044;
        Tue, 18 May 2021 12:08:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621364883; cv=none;
        d=google.com; s=arc-20160816;
        b=edOGUn8JX2aX5YGB1uT4aA7Y6vCHbboblp8g10Y7BdQUd0gxnO/SV3NxUZNCZUyZL6
         quBuOxHSHF9Vf2Ewg7C7Nsn3tH3ms4gHcZTqeNtZg7Mr9cmem00DwxofViZs1dL1Ci1W
         AMaRtZmRGftdcy52qX2WsC6AISbTBJ/MEX5FGp2E5nW54mQs6nUtsrAxaHgbNapvYD6p
         XC9Vyj1mskuJuUV38V3xCri0mZPxei11XqU4UXd/Vmfll/HOmY9UT0Z8w3sAYjcv2ueZ
         v0kt8+ESyDcTepqKnU4kY7drt9bah+tqyCkWNN0CVz6zx+9PcYUV1pdshzQm0zKIl/5f
         odUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :from:subject:mime-version:message-id:date:dkim-signature;
        bh=/7BJw8502UhQaIpIovcHX1hAU8EOmHEhBDtrVv8IcWg=;
        b=xKoEJw3iEETkxk6f7IkSbsF5iec/pIwPT8WRURTFun3N2lSa+y7fh4dkxtQLr2us0G
         vd7abwyOM6MwmXDh7U0rkjtlpSuujRFvAQRgm2pjRDIHzaodeWfoTB1iKZ2jzhjggDfC
         Ef+7Jgy9ixllJqi35ASUE2Engqi/fOz/28DjKndzqSo4yuZ6t7Jyr09dRc31wWfTV+9B
         McF+BDNEhiEhVC3Cw9QLlxrlpWIyZbb7t8oiqRoiMbkG422UyxzKaOz028p7pcFa8aDu
         Cfci2YZfWtRkM8MoqDmuLY/ifEU5vS01eLJa+XuDqqiCw8qy/jie33ZY5Cl6tG3St9vK
         nc1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b="Ogskss3/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i16si22438145iow.64.2021.05.18.12.08.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 May 2021 12:08:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b="Ogskss3/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:35664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lj54U-0003YG-E4
	for alex.bennee@linaro.org; Tue, 18 May 2021 15:08:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3TQukYAYKCv4zoz0yxmuumrk.iuswks0-jk1krtutmt0.uxm@flex--titusr.bounces.google.com>)
 id 1lj4in-0006Kn-Ow
 for qemu-devel@nongnu.org; Tue, 18 May 2021 14:45:37 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a]:44732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3TQukYAYKCv4zoz0yxmuumrk.iuswks0-jk1krtutmt0.uxm@flex--titusr.bounces.google.com>)
 id 1lj4il-0003oq-Oo
 for qemu-devel@nongnu.org; Tue, 18 May 2021 14:45:37 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id
 u7-20020a259b470000b02904dca50820c2so14703559ybo.11
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 11:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc
 :content-transfer-encoding;
 bh=/7BJw8502UhQaIpIovcHX1hAU8EOmHEhBDtrVv8IcWg=;
 b=Ogskss3/pP4ofYzBvqqF6nZoDvyHuByBrdUlSUyQkAetsFFJjvxElbDg4GCTuhycba
 /NIoX9oll39XwpgBSKIDkW4B7L1iPKb5xhrMeIFdtnz0eYsrZLiPp9oNJ6V50sKMQult
 Q2bgXQ7376XlZYykxOc6YVtFql0W93eDOEpC6YrPRHtqSd3N6u4eG6UUozPNfF5YaWoW
 8a3HX7nwAwhACUun27hdz9Vm2BdvQQycAvSN3pWJpjiPy37dpa4pCGtruM2wgM6Ffhi3
 uozASpwGMkHqsoEbhcp7Thi9d1nuvt6M8YIUiTyA2Cs+YRqemJ+yTGGuRCjiWTFPn9Kg
 HvCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc
 :content-transfer-encoding;
 bh=/7BJw8502UhQaIpIovcHX1hAU8EOmHEhBDtrVv8IcWg=;
 b=o0+joCXBwIUlBJVB1HROVZmCa145YVLrUDOsCRLyE7KMpzsmZ/EIR300oQbwjcZ/yi
 jkXNCGF6SJiVZJP2O3iVPlmLgY5cmv6xukkAjmqBYGEZHll7mKj2n8nDzx2lg4/elxyZ
 vo8guy1cRESygxHhEDn2OFSPPowsOUq/Wixy9HnR6sSWrPYBJqrB37jqnHAUkdzykr29
 ajD19Mzi/3XhcmuKSjGsnDQZtsqleZ5vRLXT+omNKACBQsb/r4yaOK7CGFGf+rmJNzsm
 LgWJGdbuPZ1uDS2SkY9r/z5jggH26EC80KWj2TrOKDyhegYYbQcm6ZgTV76+COvNAOP7
 L7bg==
X-Gm-Message-State: AOAM5305C6VuLOH6OduRyDuFIX2WVaT3+w/ZnQsyWBeuA5hKWA4nwdi1
 RbIY6UORsAVZidyUjE1hhgmmirRTRrQ=
X-Received: from titusr.svl.corp.google.com
 ([2620:15c:2c5:13:4bf9:75f4:b656:df26])
 (user=titusr job=sendgmr) by 2002:a25:3d3:: with SMTP id
 202mr527716ybd.271.1621363533253; 
 Tue, 18 May 2021 11:45:33 -0700 (PDT)
Date: Tue, 18 May 2021 11:45:22 -0700
Message-Id: <20210518184527.1037888-1-titusr@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
Subject: [PATCH v3 0/5] Add support for PMBus in QEMU
From: Titus Rwantare <titusr@google.com>
To: Corey Minyard <cminyard@mvista.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, f4bug@amsat.org, 
 Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3TQukYAYKCv4zoz0yxmuumrk.iuswks0-jk1krtutmt0.uxm@flex--titusr.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: IoZj1MGC468s

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

 include/hw/i2c/pmbus_device.h |  506 +++++++++++
 hw/i2c/pmbus_device.c         | 1596 +++++++++++++++++++++++++++++++++
 hw/misc/adm1272.c             |  543 +++++++++++
 hw/misc/max34451.c            |  716 +++++++++++++++
 tests/qtest/adm1272-test.c    |  445 +++++++++
 tests/qtest/max34451-test.c   |  336 +++++++
 hw/arm/Kconfig                |    3 +
 hw/i2c/Kconfig                |    4 +
 hw/i2c/meson.build            |    1 +
 hw/misc/Kconfig               |    8 +
 hw/misc/meson.build           |    2 +
 tests/qtest/meson.build       |    2 +
 12 files changed, 4162 insertions(+)
 create mode 100644 include/hw/i2c/pmbus_device.h
 create mode 100644 hw/i2c/pmbus_device.c
 create mode 100644 hw/misc/adm1272.c
 create mode 100644 hw/misc/max34451.c
 create mode 100644 tests/qtest/adm1272-test.c
 create mode 100644 tests/qtest/max34451-test.c

--=20
2.31.1.751.gd2f1c929bd-goog

