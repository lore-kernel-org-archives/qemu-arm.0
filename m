Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1453079lfq;
        Thu, 8 Oct 2020 08:39:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyhN8HEJnkBynRMQyOeTUXzT4nRfl55bZ686rtzJiYfHdEe9xoJczh/rRFmrUrHwYR+7AWl
X-Received: by 2002:a25:5bc5:: with SMTP id p188mr11650640ybb.283.1602171594015;
        Thu, 08 Oct 2020 08:39:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602171594; cv=none;
        d=google.com; s=arc-20160816;
        b=hpdKTxY8cDgyaTlceerOWU+AiGrMCEvc/caR5l+uVq8VIKSWhqLFqof1xbW2xKLCmr
         nfdcu0TvcrK0kDWQMHF6MAVnqvnB+bPMTOzfeYNy4pUVS6F8BScaoto0sT2fcobEVx9/
         +D04Chf0354Z4R7DRE01x6DjBrTlS/NVOgIvW5JxyEa1XJR4tVLpEWp0MRLir+kA+L1P
         Qr0gCIok0o3EDpZWBE3aUK7By3maOSOQTgahFpbQXoPaxkW0wPB8Jv6t3ln0dBlzjdVZ
         z8WZ0fKaIVYMLx8VbAZ0IBXkAbjjwHlLO/ES0ldDlTP5Adp6LpNYy6wBDoQTA7wbMDRv
         yg3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:message-id:date:subject:to:from
         :dkim-signature;
        bh=tC+strVV+B+K5HjAihiX4yitBIFB+2qfVBtZ+9OjiTQ=;
        b=k2IWQ1FGxJXq5FNvAu57EI7w4570guYxTgWel23UVOLjt31QSr4OwuWkHf45b3EPDS
         Z9h/ewCUEwAeiy+1dCp2N/CqNi+cO8Gsv7ajJyx6LtkmI1Nc1ZRU/PzE5nsSzVIRVQNA
         r0UIR71UKx1RPakADHJ2rVR8xY/jzdEnVpTY8FO0HJjb+iraOBfHVjq8GC+1gRrwtU1M
         SuvCFh69/Ty8eQXUn87E0KeQJ+uXxWhzRvkVQ7OgfJ5+7T9+KOVxO5KR8mhGB5Y2Tj4w
         cyaQJSAX3ibRZt7T3W5nJqaFwoqvbrsDZzb1PMqGUgyJ2W+cMRxmLYXrpyezB9xLbz8u
         vQoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NOlmXW8j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h188si5447536yba.388.2020.10.08.08.39.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Oct 2020 08:39:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NOlmXW8j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kQY1J-0006VO-E8
	for alex.bennee@linaro.org; Thu, 08 Oct 2020 11:39:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1kQXyx-0004JI-Vy
 for qemu-arm@nongnu.org; Thu, 08 Oct 2020 11:37:28 -0400
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742]:35654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1kQXys-0000Uj-Gv
 for qemu-arm@nongnu.org; Thu, 08 Oct 2020 11:37:27 -0400
Received: by mail-qk1-x742.google.com with SMTP id 140so5719755qko.2
 for <qemu-arm@nongnu.org>; Thu, 08 Oct 2020 08:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=tC+strVV+B+K5HjAihiX4yitBIFB+2qfVBtZ+9OjiTQ=;
 b=NOlmXW8j1FNLs+EF0SboO9o25gLy3tiNVyH4ggxJygLBFWnZejLtJScDtDBDpXk//x
 O/BM4Jz/O5c497nBC+OhH6pEh0NxldSdUo9Y15aK5wHR1A9fmpvnb6DaXs/rrV8mFq3e
 wrAhLeuchfroKY4V/qx9JwO9A0O4rs+yR7qamn9bv5Bh/jPSPkg8T4GDFwWw0xlOQDys
 YCepBh03gMrc3IioFs7txZEEi22qWoY5e2eqIO/iaaTRl4huUrgM6qSPoen8sVDq8GUo
 bV4ZYCdpiy9v6cUUSQloGf1m371U08ldN8ugAMT2bQkxP6bi2e4pFuZ9OfGFhbvBiSBV
 3iMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=tC+strVV+B+K5HjAihiX4yitBIFB+2qfVBtZ+9OjiTQ=;
 b=nOASHrpPWHjHLtPp9l5Sf0eJXO4BDUCijQMgd4k1oYhGJBO2GcO4y8MJo6hoYX/Py9
 q56cajNakKSjUcKdHQ2hMfLtUMp40IBtLIVrmQZ12h3uiD+S4wRp8hAroDwg1AAR+WbE
 LUgN4sslj5ra+QaVgJc1DyLa+bRnLiEWOOOqpw1WUhL+6OyzLsEIvfuw6mmxmH+Iullq
 CuX0Y6P2ioN42ynHGTw5wC0Lm0ihl58cZ0lKwLDqodq/ZTdvKX++y6TwRTRO7Iqwt7W7
 NNugP6GqObBb6Qku8URUtN6uTdrwzUnDpd+czPuUBd61vZ0HEptkdD4oXUXssJ0mQdbT
 cagg==
X-Gm-Message-State: AOAM531WCasqKzjEiZgrdUgpANOzYGhI0OIzzcHoBRbFN5LsMGzOVpKZ
 TYxYjaYxOiU660/hAAjQ9O7Wvw==
X-Received: by 2002:a37:7d44:: with SMTP id y65mr1518461qkc.2.1602171440944;
 Thu, 08 Oct 2020 08:37:20 -0700 (PDT)
Received: from master.ht.home ([2607:fea8:e2a0:e950::d884])
 by smtp.googlemail.com with ESMTPSA id t186sm4170533qkf.48.2020.10.08.08.37.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Oct 2020 08:37:19 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org,
	leif@nuviainc.com,
	rad@semihalf.com
Subject: [PATCH v4 0/2] Add watchdog support for SbsaQemu
Date: Thu,  8 Oct 2020 11:37:16 -0400
Message-Id: <20201008153718.20143-1-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.18.4
Received-SPF: pass client-ip=2607:f8b0:4864:20::742;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x742.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: yJenJ4hCHhLq

This patch series adds watchdog timer support for SbsaQemu platform.

The watchdog timer has been implemented first based on the generic
watchdog timer specifications from ARM BSA v0.9 and then used 
in the SbsaQemu reference platform

Changes in v4:
- addressed review comments(interrupt no. added to dtb)

Shashi Mallela (2):
  hw/watchdog: Implement SBSA watchdog device
  hw/arm/sbsa-ref: add SBSA watchdog device

 hw/arm/Kconfig                      |   1 +
 hw/arm/sbsa-ref.c                   |  49 ++++
 hw/watchdog/Kconfig                 |   4 +
 hw/watchdog/meson.build             |   1 +
 hw/watchdog/wdt_sbsa_gwdt.c         | 346 ++++++++++++++++++++++++++++
 include/hw/watchdog/wdt_sbsa_gwdt.h |  70 ++++++
 6 files changed, 471 insertions(+)
 create mode 100644 hw/watchdog/wdt_sbsa_gwdt.c
 create mode 100644 include/hw/watchdog/wdt_sbsa_gwdt.h

-- 
2.18.4

