Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp1764315lfo;
        Mon, 7 Mar 2022 12:07:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwdnQ/6j+ovzL1WXUR76DmkTGvIkD3jCUAxtXnGNzw9Rc9PryKVJ95Goe5OwjhEi7eZHvVP
X-Received: by 2002:a25:8b:0:b0:628:9774:d6f4 with SMTP id 133-20020a25008b000000b006289774d6f4mr8927089yba.545.1646683623141;
        Mon, 07 Mar 2022 12:07:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646683623; cv=none;
        d=google.com; s=arc-20160816;
        b=hiR9ntRJ0POfn6i9d7SYH3EybiQcXIb7JkaL7kwiIq4mRuL1LgiEzlpx4lDigYSZCc
         AdaW6Z0F27ZDnJOklihd8fr5aE0Qrmg5gHAxGZajwTf/FhP9IPl1mVcW88XvYSpJIoYE
         uMFnC0pb6EqHaSejp3NLCDOOpPr/U7XPtZp9fe+5LloDvpOk4GoqXiaribuAkfMrqTvu
         1kiwl+SopmBvIMgCcnamhY9Es3CYCzFGpeyG7k0MTuR7on4lGhtHj8Okw/geFFUwimBK
         Ghe3OOc+5B3Ou8bMmpVAXddX5Q9KCzA3/n17FCkHVJ3pgRg6627+0FzQ6DWoJh47dVKJ
         Mnzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:mime-version
         :message-id:date:dkim-signature;
        bh=ED0XesU2EOorz+/tkc1bsLG8fKPtIRFenTTRv8zMjw0=;
        b=ETzIN37y19qDQNO3tmIyeCcWyOgQ8Nb+3JkVJeQXb2q+nawiK7M8h1DmQCRE7C7NUO
         TZf+/CsYKbj61XjcOFVHwK+v4NSIpDtw1U/JGii5mde81vmAT+Wd0fEtWlFgX0d+HTOG
         x5vZmiK3XJYsXyqoK7ulNWYnIEoqmflbfNzkyORGDxJw2OkzXAd7PH4WDRE5Scm6jOOb
         KaeSpkG6qlNo7upaZbNKXRx4nCbTd8pRRse1l+W7VEO4KQzjpJcTF7BlKUdGh82VvK5z
         K3HBAJworJ8Go6jSK/5+QljU0YQEClJdJKG39ouRcChBxqJ012Eg1PFU9z68SSNnrHwY
         ZpRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=KBzld8kB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t18-20020a81b512000000b002d6b3d3d2c1si9464021ywh.300.2022.03.07.12.07.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Mar 2022 12:07:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=KBzld8kB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:36630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nRJdG-0006uC-IQ
	for alex.bennee@linaro.org; Mon, 07 Mar 2022 15:07:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <31WUmYgYKCFID2DECB08805y.w86Ay6E-uB678707E.8B0@flex--titusr.bounces.google.com>)
 id 1nRJd5-0006u2-QN
 for qemu-arm@nongnu.org; Mon, 07 Mar 2022 15:06:51 -0500
Received: from [2607:f8b0:4864:20::b49] (port=47017
 helo=mail-yb1-xb49.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <31WUmYgYKCFID2DECB08805y.w86Ay6E-uB678707E.8B0@flex--titusr.bounces.google.com>)
 id 1nRJd3-0006AB-IU
 for qemu-arm@nongnu.org; Mon, 07 Mar 2022 15:06:50 -0500
Received: by mail-yb1-xb49.google.com with SMTP id
 l19-20020a252513000000b00629235aacb2so5177041ybl.13
 for <qemu-arm@nongnu.org>; Mon, 07 Mar 2022 12:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=ED0XesU2EOorz+/tkc1bsLG8fKPtIRFenTTRv8zMjw0=;
 b=KBzld8kBnZKY26jrShM62gFJYsFBqztoNHuVwoI0Qxmmk/hyUAivAUgEIA/0fpjELB
 +FfUyp0r4w4Y9DzKxaXyBgUu6Bjn9ye/FkrhptBJ16TAvNs1vW0KOd/+e7VmABETWVWT
 TT6/A7at90b8KZXuH3uIFp9L0sbykUu99UPGXXoOKwcefD1F1eJDvhI8KD6TdZR8+xCL
 Sprej8n2VXOs3SBnKhUvV39OO6o6XdvA1rT1hnuRikHnOujw1yX5vjcRtcxINGR8cYfI
 zJFEyT1fWzjCrXo59uorrjMf40sYRT62vwH+ucFUfN5qUjConzN1o4d1WcsgLQCeoir6
 Ci1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=ED0XesU2EOorz+/tkc1bsLG8fKPtIRFenTTRv8zMjw0=;
 b=T5k11XiIH735CZr+904e32iPxKPtWyZzX4weJoHSh7bzOUtEDdfnlb4i+hil6HjI93
 LSNDV6Q7tQfwnwoyNIKy77pJO38STEsA5OV/0659+Huxrrer2xLnINv4DD18yFJIqvPZ
 gJDpuHgwF4Le+GDHbTLOe3yNsd8fCOGo3aDLpq14CCy/zfcQ3KfAMq3bY/2+sd3G/6q2
 dvQ64FRBTNfK4Jv9rxtJactCJ94UiUsHwhUarfz6MAZsB8H0+CYgAyqgBsmzGJN87Dp4
 XwzZnXBQceIciaxgjyRpknu8O+nIdj+VQq9UU2WgIyDATAQ4LTRMGJK3hUZGjWPRpwkb
 /+cA==
X-Gm-Message-State: AOAM532w0f3He4D9YOVvIIcjiHF7Hv8U8UjCbuoxwoBhZ2N0vlGp/m3H
 Kp6sj0b1/yoSDykY3ZZgPghw3nP7e7k=
X-Received: from titusr.svl.corp.google.com
 ([2620:15c:2a3:201:3c4a:fc8b:1418:53ce])
 (user=titusr job=sendgmr) by 2002:a25:5090:0:b0:628:b76b:b9d3 with SMTP id
 e138-20020a255090000000b00628b76bb9d3mr9692826ybb.128.1646683605304; Mon, 07
 Mar 2022 12:06:45 -0800 (PST)
Date: Mon,  7 Mar 2022 12:05:56 -0800
Message-Id: <20220307200605.4001451-1-titusr@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.1.616.g0bdcbb4464-goog
Subject: [PATCH v4 0/9] Fixups for PMBus and new sensors
From: Titus Rwantare <titusr@google.com>
To: Corey Minyard <minyard@acm.org>, 
 "=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=" <f4bug@amsat.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b49
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=31WUmYgYKCFID2DECB08805y.w86Ay6E-uB678707E.8B0@flex--titusr.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -81
X-Spam_score: -8.2
X-Spam_bar: --------
X-Spam_report: (-8.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: w+oQvKbY2J5H

This patch series contains updates to PMBus in QEMU along with some PMBus
device models for Renesas regulators.
I have also added myself to MAINTAINERS as this code is in use daily,
where I am responsible for it.

v2:
  - split PMBus commit with updates into individual fixes
  - renamed isl_pmbus[.ch] adding _vr for voltage regulators

v3:
  - split uint refactor commit and removed commit renaming files
  - rename rolled into preceding commits
  - update commit description for uint refactoring change

v4:
  - responding to reviewer suggestions
  - added PMBUS_ERR_BYTE for consistent error returns

Shengtan Mao (1):
  hw/i2c: Added linear mode translation for pmbus devices

Titus Rwantare (8):
  hw/i2c: pmbus: add registers
  hw/i2c: pmbus: fix error returns and guard against out of range
    accesses
  hw/i2c: pmbus: add PEC unsupported warning
  hw/i2c: pmbus: refactor uint handling
  hw/i2c: pmbus: update MAINTAINERS
  hw/sensor: add Intersil ISL69260 device model
  hw/sensor: add Renesas raa229004 PMBus device
  hw/sensor: add Renesas raa228000 device

 MAINTAINERS                      |  13 +
 hw/arm/Kconfig                   |   1 +
 hw/i2c/pmbus_device.c            | 112 +++++++-
 hw/sensor/Kconfig                |   5 +
 hw/sensor/isl_pmbus_vr.c         | 279 ++++++++++++++++++
 hw/sensor/meson.build            |   1 +
 include/hw/i2c/pmbus_device.h    |  25 +-
 include/hw/sensor/isl_pmbus_vr.h |  52 ++++
 tests/qtest/isl_pmbus_vr-test.c  | 474 +++++++++++++++++++++++++++++++
 tests/qtest/meson.build          |   1 +
 10 files changed, 949 insertions(+), 14 deletions(-)
 create mode 100644 hw/sensor/isl_pmbus_vr.c
 create mode 100644 include/hw/sensor/isl_pmbus_vr.h
 create mode 100644 tests/qtest/isl_pmbus_vr-test.c

-- 
2.35.1.616.g0bdcbb4464-goog

