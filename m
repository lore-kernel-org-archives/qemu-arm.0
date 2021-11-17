Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp261745lfk;
        Tue, 16 Nov 2021 22:58:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyQOYJfXBLqendtXfUyBwztgF63pmxmx7QGH+8Vx+3Cd9bD3wqlckunZXxvRz5S6wW7Xxli
X-Received: by 2002:a67:c90a:: with SMTP id w10mr54874868vsk.22.1637132328247;
        Tue, 16 Nov 2021 22:58:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637132328; cv=none;
        d=google.com; s=arc-20160816;
        b=Ps1b1aYodHyb/SQLsLfw84Zb3rHCeNYUjc5bOZDXv9VSp1gZWbO8KrE0aGLcvVOww1
         zEwQd0KutIevuQ6ddCwe0EdUmMJcNGzaoqddvpOijO9Jffv08yUrCwbyoev0A9egqU7J
         tHnqdIpMcNgcwCbSEWNcSyEhZVALOKV4+v+bPieosdAqU9v8mNVLmMTb6B2dIVrI0UX7
         XmB0MM7yrzH+shcRlS2Bz0baS4UsxkMo7n9vjD9drQe+WaCzoImZ7PawoPUKipFaggaI
         d0D2t9MWu1jtvLier/eGaItzwUGSa75VDatSLNL/e7uMwXpWlh1hixIGy9pnEwDH16va
         fj5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=jj2TxrYIZkkNgjx/8vtmRWzq2ea9PiKONmxpwxgAhDY=;
        b=t2HvBGMrKojnn9cQ72gelnT6buIuOLVuqbaamGoljiW+sh70LsfVE0P21eYp8xHz3H
         X7AjO0cUQdjCsPv1Iq/DQ5ug9qlMhla4j32vJIuvwWZPhDRZCNDlHHC/7FYxk+PlD41B
         7+7Yv2pHRYs1t7ZkRgyXXtkicIf0vTPc9y+a+asWChfbMwNh4J8n+a2fjdTS+rYX928b
         9W6fnYIoRUPU0YrtATFP7D4CSMCnLPgjzNUheRQSBfIT3P8I5FCW57yiLoUX5M0wDDf2
         /rmf9cZdvDH446mwIQtCZnRregNuyZYy3z5BGRa0Z0DL+CKIcxG3wPDEKex1cz86+RUq
         xPHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=BnVr06S4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q9si47627824vsh.46.2021.11.16.22.58.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Nov 2021 22:58:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=BnVr06S4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mnEu7-0004oh-Gf
	for alex.bennee@linaro.org; Wed, 17 Nov 2021 01:58:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1mnEtQ-0004o8-Rb; Wed, 17 Nov 2021 01:58:04 -0500
Received: from [2607:f8b0:4864:20::52c] (port=33462
 helo=mail-pg1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1mnEtN-0005a1-TN; Wed, 17 Nov 2021 01:58:04 -0500
Received: by mail-pg1-x52c.google.com with SMTP id 136so1469598pgc.0;
 Tue, 16 Nov 2021 22:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jj2TxrYIZkkNgjx/8vtmRWzq2ea9PiKONmxpwxgAhDY=;
 b=BnVr06S4ERMIxYe1cRfE3MtTo13gktvHZew95IKpT1/VcYvNZvSMUIr7GUTnXrVEiq
 yE8PYF86ZcRKHQTUjcYYkhhWqn9qfa00JDGvy5SDKQ2qJs+YoAyjuvVvuawvNSNFSsZV
 vsgeQKurZQbWMDN5S1U4WKpyizz34xQPRS38qQNFaVs7t/kzH39rfkE5E/KWJeJkiZ6a
 ErbgeWKmC9zdrzSUYrBHDpY7Cwtu7QGoYBsc8lbDUy/YYv2S092agA2+ydTDLMBLQwes
 XHHMqdO8TjiOy93h1CwNEaD88VPY3wK8mbU+WU+gv7DRk4k4De7vISVNcMvETOic+m6j
 p0bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=jj2TxrYIZkkNgjx/8vtmRWzq2ea9PiKONmxpwxgAhDY=;
 b=JrVmTNKiTpy6gUEMRNcSMJFSHgsrG3PKEeBN5D8jncU3mQ9VbaQybajpCdAkUyTGl1
 W0yp1/xdm/thmNhRMrt6+9wfkhXFh7g18flkszSoU/o1TzT39QSUW1qdROP1ZOFpAplk
 UYyfTIUD7VJ9zyOVpwS/dFVBNg0hrG14GEUuRnH1U9d1KD/NdGLeMkPJsDeBg5KlMva3
 fweHotbtM7W/urXEPLMy+8u377vgLltSIZjsuQSAYtvYyoQr5OkDERpqn/BCBlTQPy09
 z/3T+1XE5wKxhcAj7VoN5KLOsPfJMvy/szOnDcHAOkIqBgIb9iY1Yq1Y+Cf/6GWiPeZw
 YVPg==
X-Gm-Message-State: AOAM530tSfYeLectUhEZQbdzZU2YvnKC4+vH220jiCWTARqCH1Jy9DKD
 C4CDrLhPrHJrIuJnsgMIZxw=
X-Received: by 2002:a05:6a00:99b:b0:49f:eab4:4e7e with SMTP id
 u27-20020a056a00099b00b0049feab44e7emr5031478pfg.63.1637132280099; 
 Tue, 16 Nov 2021 22:58:00 -0800 (PST)
Received: from voyager.guest.fluxperth.local
 (210-10-213-150.per.static-ipl.aapt.com.au. [210.10.213.150])
 by smtp.gmail.com with ESMTPSA id d13sm21914618pfu.196.2021.11.16.22.57.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 22:57:59 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 0/4] docs: aspeed: Minor updates
Date: Wed, 17 Nov 2021 14:57:48 +0800
Message-Id: <20211117065752.330632-1-joel@jms.id.au>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=joel.stan@gmail.com; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uGyMtBeoeJl9

Here are some small updates to the aspeed docs.

v2: Tweak board changes, add patch to move ADC to the supported list

Joel Stanley (4):
  docs: aspeed: Add new boards
  docs: aspeed: Update OpenBMC image URL
  docs: aspeed: Give an example of booting a kernel
  docs: aspeed: ADC is now modelled

 docs/system/arm/aspeed.rst | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

-- 
2.33.0

