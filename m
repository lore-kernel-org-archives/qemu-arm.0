Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp1354893ejc;
        Fri, 25 Aug 2023 05:21:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHr8pW2JYuz4GFj46JA8IwaFyO4fJMmdiWv32inFrdmpiVSkywRnFZRTchlr+z3XjVpnhEX
X-Received: by 2002:adf:f291:0:b0:318:c108:67b0 with SMTP id k17-20020adff291000000b00318c10867b0mr13529411wro.48.1692966101877;
        Fri, 25 Aug 2023 05:21:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692966101; cv=none;
        d=google.com; s=arc-20160816;
        b=HgIoIgKZFsgtqx44je1RsnmLSCB6788U3XDTF/OACAy2hn1EFB3lgBQ4a0YKjHJjQI
         8GSQXwFio2/0K8dz8ynVEjeNNk10hhC1/SQjBLwLDt8d7XJy8qLeff/dzBkqvPCj4Ag8
         POejFhLZ5ZvQjrtIKlz2YKOdhvK39bSYRPwZONoC01ygLGQWu0CudNWRkIsP27pzHz6u
         mc6g/vBItY8stXLCoCu9Nl90ahqkj8XSSMHo7JSiUlU6x0BZDLOQVDbkxw2e5pAMUIp5
         GG+mXpe1WoNONOrH/5PpmASb1O+JVm/NIeJfKkNsecP3tvZSY26N7Dca4whNp2zmQnCS
         elOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=7hroIl8Exfa+JddhNiJX4xNUTIb4aGR9hfDiAdXUclA=;
        fh=kHl+ykYmH+sp39y94etEF/slFRRxb6k9dC2SJ6bxnkk=;
        b=pfvfaTn2y15wy0yP+ds5ZXYRw+8aSr2jx2u1vXf4GNLjLaqZICIguFlbsDuCCIr0hn
         nDWx9/jAIQ84shZOA9ZjHn+z4Ya0aJ4W0P9x9K6oU30CxsKyWk8zJSlgx2EezMsj+6xg
         AhnU0yFVAbOKe+VIQw/N66r/ZHGAjblNMaS7mrEfTK2bnvB4X44v7kgUd5ETHZ13u+nt
         yKRo9BCAc1/IQDet2xdWQuOLe2rhFfhbfEZG9eIwmxxaN4wDX+gr5xPsh4oCIVUX2+0j
         qaPly3C0yZUAy3m1RP0T7IR3+Wfp3HkuC+6wl8fMrIXorD8uUuArpYTxtk2i6q6MWpFN
         LOEg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n13-20020a5d51cd000000b00317b0aaaed0si764080wrv.504.2023.08.25.05.21.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 25 Aug 2023 05:21:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qZVog-0003wh-1T; Fri, 25 Aug 2023 08:21:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1qZVoT-0003vw-Mo; Fri, 25 Aug 2023 08:21:22 -0400
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1qZVoP-0004v8-Ib; Fri, 25 Aug 2023 08:21:17 -0400
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3C14460003;
 Fri, 25 Aug 2023 12:21:06 +0000 (UTC)
From: Jean-Christophe Dubois <jcd@tribudubois.net>
To: qemu-arm@nongnu.org
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>,
	qemu-devel@nongnu.org
Subject: [PATCH v4 0/6] Complete i.MX6UL and i.MX7 processor for bare metal
 application.
Date: Fri, 25 Aug 2023 14:20:50 +0200
Message-Id: <cover.1692964891.git.jcd@tribudubois.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: jcd@tribudubois.net
Received-SPF: pass client-ip=2001:4b98:dc4:8::223;
 envelope-from=jcd@tribudubois.net; helo=relay3-d.mail.gandi.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 5+RdORYLngeM

This patch adds a few unimplemented TZ devices (TZASC and CSU) to
i.MX6UL and i.MX7 processors to avoid bare metal application to
experiment "bus error" when acccessing these devices.

It also adds some internal memory segments (OCRAM) to the i.MX7 to
allow bare metal application to use them.

Last, it adds the SRC device to the i.MX7 processor to allow bare
metal application to start the secondary Cortex-A7 core.

Note: When running Linux inside Qemu, the secondary core is started
by calling PSCI API and Qemu is emulating PSCI without needing access
to the SRC device. This is why Linux is using the 2 cores in Qemu
even if the SRC is not implemented. This is not the case when running
bare metal application (like u-boot itself) that do not rely on the
PSCI service being available.

Changes since v3:
* Add a specific patch to remove IOMUXC GPR device from i.MX6UL
* remove unimplemented IOMUXC GPR device frome i.MX7D
* move the initialisation of PWM devices 5 to 8 to 3rd patch
* put the init of i.MX7d devices in previous order to ease review
* Remove device memory size from header file when the device is actually
  implemented in QEMU (the device implementation defines the memory
  size it manages).

Changes since v2:
* use GiB, MiB, KiB constant defined in qemu/units.h after code review

Changes since v1:
* split the i.MX6UL patch into a refactor patch and an addon patch.
* Split the i.MX7 patch into a refactor patch and an addon patch.
* Fix SRC code after few comments in code review.

Jean-Christophe Dubois (6):
  Remove i.MX7 IOMUX GPR device from i.MX6UL
  Refactor i.MX6UL processor code
  Add i.MX6UL missing devices.
  Refactor i.MX7 processor code
  Add i.MX7 missing TZ devices and memory regions
  Add i.MX7 SRC device implementation

 hw/arm/fsl-imx6ul.c         | 174 ++++++++++++-------
 hw/arm/fsl-imx7.c           | 201 +++++++++++++++++-----
 hw/misc/imx7_src.c          | 276 +++++++++++++++++++++++++++++
 hw/misc/meson.build         |   1 +
 hw/misc/trace-events        |   4 +
 include/hw/arm/fsl-imx6ul.h | 136 +++++++++++++--
 include/hw/arm/fsl-imx7.h   | 334 +++++++++++++++++++++++++++---------
 include/hw/misc/imx7_src.h  |  66 +++++++
 8 files changed, 995 insertions(+), 197 deletions(-)
 create mode 100644 hw/misc/imx7_src.c
 create mode 100644 include/hw/misc/imx7_src.h

-- 
2.34.1

