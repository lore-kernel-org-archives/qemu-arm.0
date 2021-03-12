Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1107801lfg;
        Fri, 12 Mar 2021 02:58:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyvmfYbpTL87guDGklVZVJ23Vgl6csYSVFDPxarvD8Yi2/B6qjwQWFxspJ3y3W4iLmjooif
X-Received: by 2002:a25:7613:: with SMTP id r19mr18227030ybc.212.1615546684591;
        Fri, 12 Mar 2021 02:58:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615546684; cv=none;
        d=google.com; s=arc-20160816;
        b=ImNEsGLACkphd/W6goZfVlAmaavr8voISdQQQl1ieox+T7/L7e2d4D0FiIHlb4gMs0
         RhdoWu9x9mgJBpf0fZjdnhfnG+cTGw8jF367ki5t1jxMTWoP2TshXPxVbF0AjwIPZVDi
         sv9nDMJ5sorI95F9aoZHsHNVZFBi4W92ivGwP6j1oi58hW6dL4E+W1p8Sot0aeUMfn0/
         D4KZEoAovkOkY7FcM/j7fMUPWonBu5RLG0pCRnysv03QVrfvtFd9N6bqgZtS/6OAygnL
         ak1v/vTHWh4I7eNhmEtJQyAgdqd52s2uHVcYED37IR+9oMGIRtV/ul4Me2Ms6O+A4fXT
         vQbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=y+fKGGovJ9FG6a9zvi8BipQosXAzQRGMJN4oObyTjTo=;
        b=ZAxUizMz0g4yxpImHZXi72uWpL4y/pkTBMaTnEkv7jgrgKTkuCLmH0shB+0sHqDDmv
         eI2MYjtll/ySLrLPCQdtJGNoxgvGA0GphnonJjhoGd9nk1Fw6+9d4lgtl+PPi4X2cs96
         WMGAfG+irFMFYrZ8gY2LHFPCeJqRdkRgxIfEChJFxp8x3hH1U8ilMHLs2GYKVJD5mcd1
         YCP9b36V0c2SaQzz9xfkTcmUhoEhNomGQhtTE97jRxADf21n1I8Ax06mp/uAjkshZ2s7
         IDreCRscPRBIJONrRBJ3cN7p1yzs4Lvo6oaIabjQy0GrKFS2wQQD3s16XxlQJ3q9eHaX
         3FqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UMXUvhzc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 195si5638438ybf.78.2021.03.12.02.58.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Mar 2021 02:58:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UMXUvhzc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lKfUZ-00009s-Ir
	for alex.bennee@linaro.org; Fri, 12 Mar 2021 05:58:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lKfTv-00006k-Im; Fri, 12 Mar 2021 05:57:23 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:37479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lKfTt-0003Ri-U3; Fri, 12 Mar 2021 05:57:23 -0500
Received: by mail-pl1-x635.google.com with SMTP id 30so7198680ple.4;
 Fri, 12 Mar 2021 02:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y+fKGGovJ9FG6a9zvi8BipQosXAzQRGMJN4oObyTjTo=;
 b=UMXUvhzcadOw20vLlTdP1cin/tMB268LJL6OhoFYs3QIlmR3PViw6WDgCRxtlLZ13w
 +tiY2nK4wu19NMuawPyjKbBrWatQ+Ee5qUrp0Q06Czw9wV0U00qTMIU+zZy1czKWHXRg
 v7c2aLA74rb5sKYFTmO7zJ/6d/a01GFef2uM9UmWGhA3kBAoO38uq/38yMZtMLuPW6ij
 IOW1hZY/9zP33oHn0qWsZppLpMkHFxvzcW/VMmAqvxsYmuy73lfWma9KTSMV26/WGDMF
 UezPniitxHaeVwtAL2YcR3cZx58aux4CVdqqpuAmt+8MdI1+3T0ySojNd2Quv72XtqY6
 CuRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=y+fKGGovJ9FG6a9zvi8BipQosXAzQRGMJN4oObyTjTo=;
 b=bp5mgri1/srawcjwmm5qFEAciYprK4IZ9fgx2Noj2KK0ns7bDxU5hks8y6EYRQUAfG
 buyiq2VxWBOw0QmnSzc3J53CKW6uOmEzb//9MyIaHYMA18N53iBYLVMVoQbpg/4OqH6k
 AT7jQEQl94LQ5oZ9T/Q/aJFQUXmzU8j6qqDSC6YLCyBeSywTPzdYhFPlAWZrCBM7xbIG
 XKP8+nPo7WKfHWvEjxRmSIrwoLUdqSXygHdEvgOqnbdhQ0urX14VGfpJhN7rmtj0+FY4
 0O/7nESWf3/0gwsgCouCnQG+FyRZkDHCxN2eudbKCJEZyZh7CO2nPtz2Cr1ljf4g9Dw8
 gAEw==
X-Gm-Message-State: AOAM532+rVxdmZUAtOHZYQnVABh7Q2HTJZ0n00Bh0v1WMpHJaqnQx+AI
 qxq49tTKDFxmgd/W/xLmAsQ=
X-Received: by 2002:a17:903:4093:b029:e5:b933:fab7 with SMTP id
 z19-20020a1709034093b02900e5b933fab7mr12693642plc.11.1615546640132; 
 Fri, 12 Mar 2021 02:57:20 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id p25sm5326793pfe.100.2021.03.12.02.57.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 02:57:19 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH v3 0/3] hw/misc: Model ASPEED hash and crypto engine
Date: Fri, 12 Mar 2021 21:27:08 +1030
Message-Id: <20210312105711.551423-1-joel@jms.id.au>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=joel.stan@gmail.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jZZYeXGAHfAc

v3: Rework qtest to not use libqtest-single.h, rebase to avoid LPC
conflicts.
v2: Address review from Andrew and Philippe. Adds a qtest.

This adds a model for the ASPEED hash and crypto engine (HACE) found on
all supported ASPEED SoCs.

The model uses Qemu's gcrypto API to perform the SHA and MD5 hashing
directly in the machine's emulated memory space, which I found a neat
use of Qemu's features.

It has been tested using u-boot and from Linux userspace, and v2 adds a
qtest for the model running as part of the ast2600-evb machine.

Joel Stanley (3):
  hw: Model ASPEED's Hash and Crypto Engine
  aspeed: Integrate HACE
  tests/qtest: Add test for Aspeed HACE

 docs/system/arm/aspeed.rst     |   2 +-
 include/hw/arm/aspeed_soc.h    |   3 +
 include/hw/misc/aspeed_hace.h  |  33 ++++
 hw/arm/aspeed_ast2600.c        |  14 ++
 hw/arm/aspeed_soc.c            |  15 ++
 hw/misc/aspeed_hace.c          | 312 +++++++++++++++++++++++++++++++++
 tests/qtest/aspeed_hace-test.c | 214 ++++++++++++++++++++++
 MAINTAINERS                    |   1 +
 hw/misc/meson.build            |   1 +
 tests/qtest/meson.build        |   3 +
 10 files changed, 597 insertions(+), 1 deletion(-)
 create mode 100644 include/hw/misc/aspeed_hace.h
 create mode 100644 hw/misc/aspeed_hace.c
 create mode 100644 tests/qtest/aspeed_hace-test.c

-- 
2.30.1

