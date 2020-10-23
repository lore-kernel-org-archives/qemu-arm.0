Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp674167lfa;
        Fri, 23 Oct 2020 09:41:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGjrAs/phfJg4jNl65IzcL6MYd+YBTN/yN0tlCTiGRCqozaycFBSmdRDT5EhAK8u9LkQXS
X-Received: by 2002:a05:6214:146e:: with SMTP id c14mr3259424qvy.22.1603471285810;
        Fri, 23 Oct 2020 09:41:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603471285; cv=none;
        d=google.com; s=arc-20160816;
        b=fxgKYZIEWb8wpAlHQydFQOOmh3wLPErppsFl8YN9cyUveY9kqmzzrm/uihL5KzQJ83
         ye1lX9uFWI7RN30SttPqqpgmr8JTHsn0Y2/0c3ncSs1IjsmkehJSxeUCm7UzgMSZTLU8
         nK0fisFX+d63RrAKyQTHwzqco3QqP8XP+ZOMkZYcKmaMRjYXOLtdhYWd2akLmqeS6zc9
         +TbiBdGITQrNckNUgXQ/1Na/TQr1zUNu8V+FtTKmXhR4Vf1mHqcdmUjO8WY6qNcv7SgS
         urXOo12ezBInHvPqJb+rqOHCyuML9X+tq2G8wc2Kb5LXYDQWSonJg/BxpMxyQH4KSLoV
         8lfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:message-id:date:subject:to:from
         :dkim-signature;
        bh=x3HzKkx6lPNCdrtmHwZ5BJWLYIYYeagcYSVMA3RXMcA=;
        b=zl8eTQyr70RUSTsYOftZb4vb0k3eyXm7NwP1sburHtGTB0o+hcqORR9RMoZlb+AuTK
         HYu9C8V12zK0sZIu0hCI1l7/cLCKLwaJEBTlawYs3AwsUNH7qZ5S/gZE6TrCAn8s5/1S
         HeSrm32V0Co8AkpEBuMdBhkrOaClLXpcp1pmPlvN7bHCxk3WKF79O/vAInLxLZy8hr0E
         6rvQBRCV/M3f2Li0CG80taLkaiOzmbAsU3diTN/yOa0j6MCIfVHZtqWDb/kfdEVnYn7U
         U5KN/7EKFxYaazwGGQCHS3tyqXjoZoMIAlFJCAj9R8KFOblVYOXqW3msGpmHFCdv+GQb
         9zlg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wDP8OxwN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x63si927008qtd.351.2020.10.23.09.41.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Oct 2020 09:41:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wDP8OxwN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kW085-0004BR-8o
	for alex.bennee@linaro.org; Fri, 23 Oct 2020 12:41:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1kVzV4-0007Bk-8C
 for qemu-arm@nongnu.org; Fri, 23 Oct 2020 12:01:07 -0400
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831]:46715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1kVzUy-0005vO-SV
 for qemu-arm@nongnu.org; Fri, 23 Oct 2020 12:01:05 -0400
Received: by mail-qt1-x831.google.com with SMTP id r8so1284489qtp.13
 for <qemu-arm@nongnu.org>; Fri, 23 Oct 2020 09:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=x3HzKkx6lPNCdrtmHwZ5BJWLYIYYeagcYSVMA3RXMcA=;
 b=wDP8OxwNIeAXUJuWCP7EsiXcZhCe7nIFfLx1apvyceO7UdZ9QJlA0an/XyQkNsYCgP
 bIG3yKvi44wCMUBhSlXkn7O2eqMxtDLZHKCxc554Ms29KxEYyV98OOZWyrq8InTVNIqE
 oY2p3+cBiHJQf7ftWfmvYPExppQf9VIwolkOJht+n0Agwkx+tPDV3CU/wTOplXmGroZB
 mFxlCkwS95QhaxwFmyaS/VE4ZMr1QTtxAC6vj/+UxndrzGxds9ngLJN7KFhqGNqn1CIV
 5Bv+RSG2y1I9jg89gRVfx35/US/kpfCibc3R4d/VI54awyNdC2S8EadKGU5I08Mlzokw
 i0sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=x3HzKkx6lPNCdrtmHwZ5BJWLYIYYeagcYSVMA3RXMcA=;
 b=Lq0TY5+N8D2Ts2h2SP6I1pmK0B3pHK0RNLuIlfQRNQmuHNDUBQxgVtiTNkV+t1BfUc
 SQ0zKduwwCAkhTmEMLd+++8S6V+pWkZfF5s0ndqbfuetlPZS5M7rglLzSASlgNte3gN6
 TobHVqnHBCBX3DwPmGJNJ7dhYCCiVt5gzPnRICxfn958Ck0BqB6MoFbvLU5j5srtBx+a
 XPUg3myUZuMK+H2OukToa2kbeJwc0nz9tpAmTJKErx+b234mF0cyQAQlkqqeAV62Xb24
 PeAWiHjDmov7SRzYS+WX7ZDX0uef1OMRQBrsc5PH2TRHyBMxqPbmcUxRLF2ANQ/42PjZ
 9ijA==
X-Gm-Message-State: AOAM5334Yx0utiyxPDyEjSyGzPejze92iRHPveXwdHD/pO9rZ+bu6K6t
 nzcmKnH5N7+3N6+kwtYTNd0ygg==
X-Received: by 2002:ac8:64d:: with SMTP id e13mr2914214qth.23.1603468859525;
 Fri, 23 Oct 2020 09:00:59 -0700 (PDT)
Received: from localhost.localdomain
 (stsvon1503w-lp130-06-174-91-97-36.dsl.bell.ca. [174.91.97.36])
 by smtp.googlemail.com with ESMTPSA id k16sm1144957qtu.45.2020.10.23.09.00.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2020 09:00:58 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org,
	leif@nuviainc.com,
	rad@semihalf.com
Subject: [PATCH v7 0/2] Add watchdog support for SbsaQemu
Date: Fri, 23 Oct 2020 12:00:55 -0400
Message-Id: <20201023160057.21543-1-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.18.4
Received-SPF: pass client-ip=2607:f8b0:4864:20::831;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qt1-x831.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AYkA+bB4L3O0

This patch series adds watchdog timer support for SbsaQemu platform.

The watchdog timer has been implemented first based on the generic
watchdog timer specifications from ARM SBSA v6.0 and then used 
in the SbsaQemu reference platform

Changes in v7:
- review comments addressed

Shashi Mallela (2):
  hw/watchdog: Implement SBSA watchdog device
  hw/arm/sbsa-ref: add SBSA watchdog device

 hw/arm/Kconfig                  |   1 +
 hw/arm/sbsa-ref.c               |  23 +++
 hw/watchdog/Kconfig             |   3 +
 hw/watchdog/meson.build         |   1 +
 hw/watchdog/sbsa_gwdt.c         | 304 ++++++++++++++++++++++++++++++++
 include/hw/watchdog/sbsa_gwdt.h |  79 +++++++++
 6 files changed, 411 insertions(+)
 create mode 100644 hw/watchdog/sbsa_gwdt.c
 create mode 100644 include/hw/watchdog/sbsa_gwdt.h

-- 
2.18.4

