Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp937988lfq;
        Wed, 7 Oct 2020 19:42:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyx2XwtMveSFcfDInhwOmeuL5UtvCNZLB2SETmHamG+bTuZoLG9TgEIqjdRq6QhNEePNtoa
X-Received: by 2002:a25:8541:: with SMTP id f1mr7449667ybn.230.1602124938008;
        Wed, 07 Oct 2020 19:42:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602124938; cv=none;
        d=google.com; s=arc-20160816;
        b=po1zwNCQqj9+Q3fzhk8fZO39JFeQNmbfwh7t80IfYGZ7lO6rkEuQwvcqc9K0/nug9+
         UT19tP7iPO/R4JFbsG/+fOHdPqMgiebxEOnUjyp0ux/efwYP0qJ9OHehXdDlcDVeXwiK
         Lugl0D4VMkjBBOPpbZmSjgHmHPfgmpdVrA9CIKI+JeARyIg0MEUvv1KyE8FGFmWbx9rL
         JdR6LBNYRh0flptXW1X3BegAUur7iMPhSm8u3V5FWssJqRpcIjazVP4h7ZfFB2TrQ5cT
         Wbg126gWg5KxC0ILxMFZoot7UtyHdT2XyCJ7LEVRoBu2FL/NPXP2ogFFoiAm6ceXI+XC
         h4Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:message-id:date:subject:to:from
         :dkim-signature;
        bh=EPZV1pH/RlzArv33v2pbw5bERsSaihTm+0cS0Fv9mss=;
        b=rokQUsM7xZIMjGOALipMsgMOPFQas1+w9NHJ6klXkc0E3U3HzZ5ZANwn8MwcKtWQlF
         FMFuaGfsm/mm0p296rWnp4y14Z1exieY1YjFeAPi5VVIT5lH3BJV072IXjU7Wg95Ut/Z
         q6i3KGiEEIi1npqocMBYJSJsuj81Vt3/SVtYANkjZOwwfEAqkxPxQvHRUAdcMgWaKPMT
         +AgguAg5i38HAwZIMlBJUd2qQxIXBnZuh3pCP+/sQPLXADAzLeFaZb4G41RlNSKikvaZ
         WnRgzoFICcr3UXHuZNf6eg9fnofiJcuKr9Ek7bF18Xlq4jwu5QdONkY9RnwQn0y8HwKv
         LDtw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jIDyGRGc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i2si3385496ybj.397.2020.10.07.19.42.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Oct 2020 19:42:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jIDyGRGc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kQLsn-0005wr-9o
	for alex.bennee@linaro.org; Wed, 07 Oct 2020 22:42:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1kQLse-0005we-V5
 for qemu-arm@nongnu.org; Wed, 07 Oct 2020 22:42:08 -0400
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744]:36840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1kQLsd-0006tU-98
 for qemu-arm@nongnu.org; Wed, 07 Oct 2020 22:42:08 -0400
Received: by mail-qk1-x744.google.com with SMTP id q63so5499671qkf.3
 for <qemu-arm@nongnu.org>; Wed, 07 Oct 2020 19:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=EPZV1pH/RlzArv33v2pbw5bERsSaihTm+0cS0Fv9mss=;
 b=jIDyGRGc8Ww7OG9lojJ/VhjYPal30Bb/S53tb3Mzkcc7Q3+Ug2danEVGilAapVXiqV
 AZ3tAJKCGEKYkWNO/CfbNWMiDj0wvib1Zld9zjtyM/odIMMS3P8Sdio5kNo1wzR39hLp
 YWaKtZoTYFbzrjve5SWwQp6Z56crQY8d0WiFvwq0CfdJjgNzp9axH4hGq4wyrkvZXKNb
 +IP5wZZ9p5gj1HNYaEgzkAgWCa9pLnjnyOXCH2hYcgUEQGZmgKXUGn6fuqCDftJgnbcn
 xPzRrIL5XlDb2YrnBGymTxOMuwYhnUmlBFw6pSA9daSHJ7S3cEc6OJci3nGLCO9Rgo7l
 3+9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=EPZV1pH/RlzArv33v2pbw5bERsSaihTm+0cS0Fv9mss=;
 b=BZ4DpConQ4gcBdnATmVHq2a2BMmeUlC/60zW+JuMFssk9DSRS7B3DmRLbPVo1pcpiQ
 NIRdApCUvAb4AEwM3ZK/q/qxhXXzr+yC2f8PjoxdF1cye9kPf73C9EggSR/nRSmZR58L
 JomouRpCcekMG+Dn7e+qcmMgG+j2h3LlL0Oma20DjW5Y89bbKecF89+qMfr0oqWVMmuS
 tvUiECBSCKSXNTLidNJdvd5UYmrq8FslhsNpvQ+KdPpeqk8SMzPmI2c/4QQ2ccZNFZE/
 w3bGKEjZftvibY5Nbdqd57pPeBN2Qk2BbFoQ4ea4A5f5WpnHJmXVNT9Zjmv+K1qA4caF
 MKhQ==
X-Gm-Message-State: AOAM532QB/Va/N8fSYCUmzsJDzuRcyC0oHj0ngOHF2w98UkCJAREQy6W
 CcWzsHEW+s+Bd0lefiZs7zcwQA==
X-Received: by 2002:a37:aa42:: with SMTP id t63mr6084433qke.478.1602124925791; 
 Wed, 07 Oct 2020 19:42:05 -0700 (PDT)
Received: from master.ht.home ([2607:fea8:e2a0:e950::d884])
 by smtp.googlemail.com with ESMTPSA id m3sm3005031qkh.10.2020.10.07.19.42.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 19:42:05 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org,
	leif@nuviainc.com,
	rad@semihalf.com
Subject: [PATCH v3 0/2] Add watchdog support for SbsaQemu
Date: Wed,  7 Oct 2020 22:42:01 -0400
Message-Id: <20201008024203.112303-1-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.18.4
Received-SPF: pass client-ip=2607:f8b0:4864:20::744;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x744.google.com
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
X-TUID: PuAaZN/Y8ixl

This patch series adds watchdog timer support for SbsaQemu platform.

The watchdog timer has been implemented first based on the generic
watchdog timer specifications from ARM BSA v0.9 and then used 
in the SbsaQemu reference platform

Changes in v3:
  - overall functionality has been tested (using edk2)
  - included dtb creation required for virt platform 

Shashi Mallela (2):
  hw/watchdog: Implement SBSA watchdog device
  hw/arm/sbsa-ref: add SBSA watchdog device

 hw/arm/Kconfig                      |   1 +
 hw/arm/sbsa-ref.c                   |  44 ++++
 hw/watchdog/Kconfig                 |   4 +
 hw/watchdog/meson.build             |   1 +
 hw/watchdog/wdt_sbsa_gwdt.c         | 345 ++++++++++++++++++++++++++++
 include/hw/watchdog/wdt_sbsa_gwdt.h |  70 ++++++
 6 files changed, 465 insertions(+)
 create mode 100644 hw/watchdog/wdt_sbsa_gwdt.c
 create mode 100644 include/hw/watchdog/wdt_sbsa_gwdt.h

-- 
2.18.4

