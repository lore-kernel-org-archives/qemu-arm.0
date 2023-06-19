Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp2919989ejt;
        Mon, 19 Jun 2023 10:10:11 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7bhhtUUvAqZ4PU8fEubqk4kMuCxQ675yvrXo+84a5Xf+YsVKipvfLqBsYI50mwFhQkQjnM
X-Received: by 2002:a05:622a:13d1:b0:3f8:6b32:480d with SMTP id p17-20020a05622a13d100b003f86b32480dmr14159639qtk.46.1687194611000;
        Mon, 19 Jun 2023 10:10:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687194610; cv=none;
        d=google.com; s=arc-20160816;
        b=BNqDtgN7xibdqZjRQqt4ICYOKGxjkiXeenX+eAzR1yHqeHxJQ2gjaRxPHnen2H6L6l
         DkacgLoicPBgQcAaYDCIeI1oImErKcU7oNtJ0HVBCiqjYWK5ALswyY358v1NmRr4t3uf
         W79izQsyNf4u9wHO+qcENRYXYE7nz4aurBPE87QDrdMy52HH7uHEZj6NfphDRBUwKJdH
         zUNuQ/Yz5P6zqp/XCsSk20UgVi3i9LxHjz3YPQUDncGXxBBZZvOwwoIfPfh1BwfJ++ge
         YChczFiVcLdM08Goyh4H2uEqx5Z4gDMFXCbyE+8iodpIarlKMQfehotBJWRQ/rTde1l9
         HNyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=qvZDt4sgYb6C7On5VH8+3EKFJn7NoF2S7Uh6Y5GL7TM=;
        b=SR8MEbCRyJhCR0D5HuOkNSd4lUHaDpLWvYpvhUx5GtAUZqdIK1N8eLnp/UxX1Lwldb
         OIu26+q3XqJyJibt2rFpbfWRcgnGSd04ypFYiUPl16npXYG9tBELPRzAPceUXlZUZRh7
         3BWxG5zqqONf8ikmXxcPrfvImnc0CQpmckH4We71OZoVvrp1QzZfTG+W1XVU7ssrpbQR
         SKceyd8SLmg8tM/XApizGbcMUJFhOhrI5i1EBYcdamaQvRNRW5hI62DFy5iJKcm+0fBN
         MWnHsnLbzaftRhneB8jTnYqKAoiS0wfBDrlRs1AP0/E8nO1E3P3yvybqs8uyLx45VWOi
         YgPg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o13-20020a05622a044d00b003f6bb129f8esi50678qtx.808.2023.06.19.10.10.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Jun 2023 10:10:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBINm-0001Ne-K1; Mon, 19 Jun 2023 13:09:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1qBINl-0001NE-8d; Mon, 19 Jun 2023 13:09:37 -0400
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1qBINj-0000kp-Dc; Mon, 19 Jun 2023 13:09:37 -0400
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id DFE4A260ADB;
 Mon, 19 Jun 2023 19:09:31 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eafiISAUVR0d; Mon, 19 Jun 2023 19:09:29 +0200 (CEST)
Received: from applejack.lan (83.11.39.176.ipv4.supernova.orange.pl
 [83.11.39.176])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 5483126021A;
 Mon, 19 Jun 2023 19:09:29 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Shashi Mallela <shashi.mallela@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH v2 0/1] hw/arm/sbsa-ref: add ITS support in GIC
Date: Mon, 19 Jun 2023 19:09:12 +0200
Message-Id: <20230619170913.517373-1-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=213.251.184.221;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=muminek.juszkiewicz.com.pl
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: EPXJGpZXAFjC

In 2021 Shashi Mallela sent v8 of GIC ITS patchset [1]. At that time it
was decided to do platform versioning first.

1. https://lore.kernel.org/qemu-devel/20210812165341.40784-8-shashi.mallela@linaro.org/

Now we are going through our list of changes for SBSA Reference Platform
and GIC ITS is one of early ones. There was decision that there will be
no option to disable it and platform version will get a minor bump.

This is refreshed version of v8 one from 2021. GIC ITS is placed behind
GIC Redistributor in memory space to allow use of older EDK2 firmware.

New address is placed in DeviceTree for firmware to use. Due to it we
also bump platform version to 0.2 version.

Trusted Firmware will read GIC ITS address and provide to EDK2 via
Secure Monitor Call (SMC). Same way as it is done with GIC addresses
already.

Changes since v1:
- everything in one patch
- removed bogus check for kvm_irqchip_in_kernel()
- documentation about platform version changes added


Shashi Mallela (1):
  hw/arm/sbsa-ref: add ITS support in SBSA GIC

 docs/system/arm/sbsa.rst | 14 ++++++++++++++
 hw/arm/sbsa-ref.c        | 33 ++++++++++++++++++++++++++++++---
 2 files changed, 44 insertions(+), 3 deletions(-)

-- 
2.40.1

