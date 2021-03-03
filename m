Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp4941366lfg;
        Tue, 2 Mar 2021 17:05:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxBJO4igAk5d67hMW3nsqRFvymABvxxIHmMJjk+x8yZBuEki/vQiM62USlh4LRQxaKafUXz
X-Received: by 2002:a67:8a83:: with SMTP id m125mr12924761vsd.50.1614733553194;
        Tue, 02 Mar 2021 17:05:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614733553; cv=none;
        d=google.com; s=arc-20160816;
        b=t6+4oTfo7dA2XROMHTbc8ZGBvTBU95azcjw9uGWL4i+Xta2h4wy62/x+XX161bPdtU
         pJqBfreBFuKbQgMFQ3eNQDwzeOIHvuzKEyj2qubvlqQW4eaWeFEQz9IphtPJZ3n8jpIa
         RFgT8G/nROTtys84GTJIOocl8/QzOEHInUz+vRFSQav7t2k4GifMBMS1QzROe6ubt9Fm
         mHZetff9Eghk3w89Mx7zlQatfsWhB0MGe83uiKHm/gy8MAtlIe+8HF1RlzUbTct05Ci5
         qlwNFJzNGzY/s2emco/5n7BrGtlVRYOphNnP/W+Uj/4AgRXXyp0YQzDsmfyk0yJwaNxg
         3A7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=jd5GvI+CUtHO9kj/+hMuYljebVOyggSX2d6N90WNDsE=;
        b=isVB6u7XrZFHszi706NDeyfSP37QAvZMm3aP+JCUA5B1ZujrvfekCtBMIXCyNwYCCs
         HsWGJaCpJ+55Y/3eXUbrz77FCYhGK6D5jANUEVYh9bXfW1Q6SC+PnQGHY0R3nFQHCjYr
         9AyjgA7RdXtbRvV0hS2XuUoM0NLbOBelGSXV9gBdc3flMuLIZZ4o/iZzP0TAZb6rr0SU
         /TiklhOm3F6dZKng/gcbxFTn829uhzLGfpwdlLB3MEL4Ji38k3SYS62domADqcYoLPdV
         VYGJAk0mgb6YwCrYx5EiuTBq5w3f2BON0D/6FkaLiiEWKJplWrPS44AILHXML/SessnD
         226w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Y2ZFOXX8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z20si4022550uan.139.2021.03.02.17.05.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Mar 2021 17:05:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Y2ZFOXX8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHFxY-000351-C4
	for alex.bennee@linaro.org; Tue, 02 Mar 2021 20:05:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lHFx2-00034F-Dg; Tue, 02 Mar 2021 20:05:20 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:39067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lHFx0-0001Cx-7W; Tue, 02 Mar 2021 20:05:20 -0500
Received: by mail-pg1-x52b.google.com with SMTP id x29so6845834pgk.6;
 Tue, 02 Mar 2021 17:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jd5GvI+CUtHO9kj/+hMuYljebVOyggSX2d6N90WNDsE=;
 b=Y2ZFOXX8igsaPBTNz1Qoeo5XiB9i2pCPLLGQEvqNyhr4CUytoXe5e2Whd+ya9F5CGT
 7QdKpBJklHkVmygs0cGrmhA1W1Lgto/prZHZBBX/Z64yJo/OMkK8Pdy9G9XIUn+YUq7p
 XJJhW/U9uwNYP9l39lRY9INFhc8DCj2DA+NZfXZzyNnw3wwqBVy9kxGycJg9uiHo3ZLX
 3b09ZtuurtT0J2wOhkvus7ouHk9SLejzmbpVDnuAjtD0hPs0dBd6ULuUohA1rr5h8CLl
 ltS+bxbsTvzrFzXpTwjXpJVC01A6w/7aCRTSa+Izsn48VBPZ6IbdZwaKSkXsAJu928kh
 7zMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=jd5GvI+CUtHO9kj/+hMuYljebVOyggSX2d6N90WNDsE=;
 b=aNkXbn1IAl7+Tg+juoQIWWmJ5M27LIU2sfp15RM2P7tn2wtUtifa0tVgPv3uWgnbNa
 ZiEkVa0ZHhO2xnT6j79UZnqFHHqpgr7FC7vg4xI57pIDU12r5i3vdCpmefB+dBwSfbLy
 HSx0uE0uXIsHwyx/PBI21V5r1DqLnKL0DnmnTa6TIEAq+zHA5TOzY9dGXnM0XNyoL718
 yemzvXHGEM6FqQKmvlJFcS9qJNJbzgCSzJnqpIjebFXeSSC+pnUPz+q4CTtl1/RiRN3t
 LDaUYhGGxxGmLPYIbg4pE0SVCRKe8Cl6KL2jX8b3xwKoUbtBRom8gIBYN7tJlYK/nFva
 Jwdw==
X-Gm-Message-State: AOAM530FqJ9uRB0v9APHCB0f3p9gGD0d3jCeVGS7plHgFXZThaAl6GD3
 hjeEZjLkfJPk3V5b+asHeTc=
X-Received: by 2002:a63:e608:: with SMTP id g8mr9968522pgh.433.1614733515892; 
 Tue, 02 Mar 2021 17:05:15 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id q21sm54197pfh.189.2021.03.02.17.05.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 17:05:14 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH] arm/ast2600: Fix SMP booting with -kernel
Date: Wed,  3 Mar 2021 11:35:05 +1030
Message-Id: <20210303010505.635621-1-joel@jms.id.au>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=joel.stan@gmail.com; helo=mail-pg1-x52b.google.com
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: J298Vf9qUus/

The ast2600 machines do not have PSCI firmware, so this property should
have never been set. Removing this node fixes SMP booting Linux kernels
that have PSCI enabled, as Linux fails to find PSCI in the device tree
and falls back to the soc-specific method for enabling secondary CPUs.

The comment is out of date as Qemu has supported -kernel booting since
9bb6d14081ce ("aspeed: Add boot stub for smp booting"), in v5.1.

Fixes: f25c0ae1079d ("aspeed/soc: Add AST2600 support")
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 hw/arm/aspeed_ast2600.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index bf31ca351feb..49b00763864c 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -241,8 +241,6 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
 
     /* CPU */
     for (i = 0; i < sc->num_cpus; i++) {
-        object_property_set_int(OBJECT(&s->cpu[i]), "psci-conduit",
-                                QEMU_PSCI_CONDUIT_SMC, &error_abort);
         if (sc->num_cpus > 1) {
             object_property_set_int(OBJECT(&s->cpu[i]), "reset-cbar",
                                     ASPEED_A7MPCORE_ADDR, &error_abort);
@@ -253,11 +251,6 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
         object_property_set_int(OBJECT(&s->cpu[i]), "cntfrq", 1125000000,
                                 &error_abort);
 
-        /*
-         * TODO: the secondary CPUs are started and a boot helper
-         * is needed when using -kernel
-         */
-
         if (!qdev_realize(DEVICE(&s->cpu[i]), NULL, errp)) {
             return;
         }
-- 
2.30.1

