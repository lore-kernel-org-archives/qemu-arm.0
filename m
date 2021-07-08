Received: by 2002:ac2:5fca:0:0:0:0:0 with SMTP id q10csp403097lfg;
        Thu, 8 Jul 2021 07:55:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJys12VVeb/p5D1juWi/Ch/Zf9xPhLlALwggXCYnhgGjEsHOiWa3B1avd5x/k4djBD6BIonk
X-Received: by 2002:a05:6402:c13:: with SMTP id co19mr6266290edb.64.1625756153447;
        Thu, 08 Jul 2021 07:55:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625756153; cv=none;
        d=google.com; s=arc-20160816;
        b=UQGO7zAQ6IzcqATLH8mMrhffUM5ntmc5HKQ6M1+Sk5ywWBHXa5kXhwOy7LwoWSwvrc
         u6Uyq6GzGAOwKXqPo8tmKoY9ZMFTfzbJNeA1X0WFAssrqm2IpDQXrlfKz+tg+ilnpofD
         v27zFHX+sLJA7Wae09xCxJH14k3iHjfwidk5SvgeqqRRSZdgxM809PD72v0Oib920FnI
         2iOkesu7ZKm9KfO8+IT6LakznScYEGBPAm/gUgrO5ABnEyq45LFfL7KxJu53ognRm7/0
         X9fhGN/zJstPVDv5+IJZ4c3ThO8fb58pNNM6AJ7g6CsTDkbKvjOI2iWvrAc9HMlsjmgd
         sboQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=scw2wo0mPwJC6QGG0i72m5GJBT0VX1Nv3M7vQANUqmY=;
        b=QE73uoQWgv3ZnfQDH6TChKixOmYKhnu0wg9sE3ETnrxZLv/ihnmiMIT5+AS1/Any3B
         RJDbSXaxc78cBFZBOuKCWC0kwA3WLwW9Cl4XUBQ5YXeCuPv35g+VTCHURFr2qmqmva0Q
         9PhGoq5Df+M0b09/7UYK0fS5xpGCm8EdM2Hc6nQqmhcgga4gM5qTr5fxnPiWFSnYgNB5
         6nkOmrsQNFMTsOcNr9SDBcPs6ZF68h+SKnD3Zo747rmNFbTrqGE6tKHHKpz7WTeSWzgf
         fQJrZ75MdVwC2/WUUB077epwYvAipNrix6xH8IYq6vK7vAKNWnbydkymFvp06ha6pjh9
         Z0pg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ocBscwA6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id er20si3328989ejc.153.2021.07.08.07.55.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Jul 2021 07:55:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ocBscwA6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m1VRQ-0005qR-HQ
	for alex.bennee@linaro.org; Thu, 08 Jul 2021 10:55:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m1VR2-0005mk-OZ; Thu, 08 Jul 2021 10:55:29 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:41581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m1VR1-0000fS-0V; Thu, 08 Jul 2021 10:55:28 -0400
Received: by mail-wr1-x432.google.com with SMTP id k4so1605541wrc.8;
 Thu, 08 Jul 2021 07:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=scw2wo0mPwJC6QGG0i72m5GJBT0VX1Nv3M7vQANUqmY=;
 b=ocBscwA6tvIiy91K/dWyI7vvH5XYwRAEmt+BZ24F3bDuM7GjZsT7/pUtZF3UirMn/x
 IpbUW3sjFpAzoehYVzfILSydD7IlQakGrmMpBATwXqBXPUwSwC6WLJfZHRrXvc7XEGzl
 p/o7bAoBJI6Jxb4zeqgD4yjf+UEmTWpe0hgfZWT6N0tFnsZn/dhQDddQIXRvY58ZClVI
 Mk+86dI2VyBrXxUw4o+363I8cPb3IeMCRmA5VckQ8LURgg0rKwv2rDzoCyYfKEZQyA4J
 K908JI4Yyb+VTRYC/Xt3R7JxZlKYAJ7+LIXuKhH2+YNM2pqOXxOlv3KuF/FYzrXQSi40
 kRbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=scw2wo0mPwJC6QGG0i72m5GJBT0VX1Nv3M7vQANUqmY=;
 b=EBRKtzShVFvTIXcUsDOcApZV5D6GUnlbqanOgmy30lS8n1eJNnUj2uC1psznqWB4hn
 uYR0ZKgbVc+8+AJH+qCNgOKLDRJKH+iXrfNuWCuiBrp7xzPujbrWxoBVnx+LHF00Iq8x
 l+fnY2ahlMd3zXfr42hdbZQb21NcYj/Uk7T+wPtvXBOKQmJ/8NGVIbKtbaFXm+byec4t
 ZKY4dWPPzI4gMTedzjSHXIQMaC9UyoBn6iVV9IZlWPsvMQyLW/1xHX9S0lMsA5I/gaYg
 u9pvkmDaH4Q2z5eY5w3YiedmIQC9yDkAiMHbmhElxhRpklcbzNA25nIXo83g8nZL8i20
 PmWw==
X-Gm-Message-State: AOAM532kAQCwu41NAiFZcucAmMreestbdYaBO8mRrdgsM5qikTUEtupt
 nDeTZ0d1E0KbvBtkBx7XCeUQmmIVeZQ=
X-Received: by 2002:adf:e488:: with SMTP id i8mr35235594wrm.285.1625756124971; 
 Thu, 08 Jul 2021 07:55:24 -0700 (PDT)
Received: from x1w.redhat.com (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id m5sm9074658wmq.2.2021.07.08.07.55.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 07:55:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] hw/arm/raspi: Remove deprecated raspi2/raspi3 aliases
Date: Thu,  8 Jul 2021 16:55:14 +0200
Message-Id: <20210708145514.1751773-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708145514.1751773-1-f4bug@amsat.org>
References: <20210708145514.1751773-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SXmJFHyGu3x8

Remove the raspi2/raspi3 machine aliases,
deprecated since commit 155e1c82ed0.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 docs/system/deprecated.rst       | 7 -------
 docs/system/removed-features.rst | 7 +++++++
 hw/arm/raspi.c                   | 2 --
 3 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 70e08baff62..516a926d76a 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -207,13 +207,6 @@ this CPU is also deprecated.
 System emulator machines
 ------------------------
 
-Raspberry Pi ``raspi2`` and ``raspi3`` machines (since 5.2)
-'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
-
-The Raspberry Pi machines come in various models (A, A+, B, B+). To be able
-to distinguish which model QEMU is implementing, the ``raspi2`` and ``raspi3``
-machines have been renamed ``raspi2b`` and ``raspi3b``.
-
 Aspeed ``swift-bmc`` machine (since 6.1)
 ''''''''''''''''''''''''''''''''''''''''
 
diff --git a/docs/system/removed-features.rst b/docs/system/removed-features.rst
index 2b21bd39ab9..d6fe2899933 100644
--- a/docs/system/removed-features.rst
+++ b/docs/system/removed-features.rst
@@ -349,6 +349,13 @@ This machine has been renamed ``fuloong2e``.
 These machine types were very old and likely could not be used for live
 migration from old QEMU versions anymore. Use a newer machine type instead.
 
+Raspberry Pi ``raspi2`` and ``raspi3`` machines (removed in 6.1)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+The Raspberry Pi machines come in various models (A, A+, B, B+). To be able
+to distinguish which model QEMU is implementing, the ``raspi2`` and ``raspi3``
+machines have been renamed ``raspi2b`` and ``raspi3b``.
+
 
 linux-user mode CPUs
 --------------------
diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index b30a17871f7..533bfb8cbce 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -340,7 +340,6 @@ static void raspi2b_machine_class_init(ObjectClass *oc, void *data)
     MachineClass *mc = MACHINE_CLASS(oc);
     RaspiMachineClass *rmc = RASPI_MACHINE_CLASS(oc);
 
-    mc->alias = "raspi2";
     rmc->board_rev = 0xa21041;
     raspi_machine_class_common_init(mc, rmc->board_rev);
 };
@@ -360,7 +359,6 @@ static void raspi3b_machine_class_init(ObjectClass *oc, void *data)
     MachineClass *mc = MACHINE_CLASS(oc);
     RaspiMachineClass *rmc = RASPI_MACHINE_CLASS(oc);
 
-    mc->alias = "raspi3";
     rmc->board_rev = 0xa02082;
     raspi_machine_class_common_init(mc, rmc->board_rev);
 };
-- 
2.31.1

