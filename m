Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp178782lfc;
        Tue, 2 Jun 2020 22:26:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHwnSFWI5k2NwXc6HLjSw2sq2t/KAOzijGXdab0/WIwwXdBDYQW9HbgbA1OOPaA9K9NaUa
X-Received: by 2002:a25:7313:: with SMTP id o19mr45658387ybc.458.1591161983484;
        Tue, 02 Jun 2020 22:26:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591161983; cv=none;
        d=google.com; s=arc-20160816;
        b=udTjAhj5XPYzkIJ9HuwNPYMmsyUoP6bp6YqWg5Lw3mFNcgACxOtYBxlJa7yTu0cRbR
         D44AqpO+mPCdmk7U2bxMTcxp4LKFS4rY70x5oQa5p88Fkq7Tb9dqID8SpK3C5KKF2Py9
         OuqRxH1LTuxuExnQT72cy6aLskAS/3r9RTEMqj2K0m/1a8PKShcYgmhwcEPbjWugldIj
         MHSpHkvKREWJG0DchEW2gWBbszVicKLxE+P35p7oE1ShcuG8E1M2cE7dWrF4j+nZnHNA
         I94VmLmUdVpr4ZZ9jBHQ0e44rpb+JJAU2nbYiQrFcbf2v34vTEm9xVpJqj7vj2cURoBm
         aIOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=zAVf0eC1i4TO3oZMCKOs1PygTBx2n4QN+KOvIE2jWCE=;
        b=JuakQlXUufFx3MItOFq9p+rQd4iie1L2ciDu2v6g9JVr0lGT/1KdxbCF4KGZ1ffJr+
         RPI3LFVjBUyykaY/zMPvz12KxXytUS60r1t2ZRqlZUeEK7UTDi1t85fMHu1IskdQZZX1
         zeksDNVZqMab/48MwGn/mUOvMW+zMxQPxlb34OTDSS6SeEXRodyxn+qr1I7lW9w43mvz
         4nQtasXRlNV87GKNV0jdaLotpdPnNBQZzemNWE68XeWdBJF0/cLH1lmDdzD0K4Gkf/X3
         9W+OmzfFedXWDmC98IA4EJ42jFbd+Ew08/TyhQJo9E9WQdQxc3yhOhOegXM1muk6eWKL
         MpmA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hoE7ifJ1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n127si865967ybc.137.2020.06.02.22.26.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jun 2020 22:26:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hoE7ifJ1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jgLuw-0000Oy-U0
	for alex.bennee@linaro.org; Wed, 03 Jun 2020 01:26:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1jgLsw-0005CK-5a; Wed, 03 Jun 2020 01:24:18 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:34007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1jgLsv-0001n5-DL; Wed, 03 Jun 2020 01:24:17 -0400
Received: by mail-pf1-x441.google.com with SMTP id z64so836214pfb.1;
 Tue, 02 Jun 2020 22:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=zAVf0eC1i4TO3oZMCKOs1PygTBx2n4QN+KOvIE2jWCE=;
 b=hoE7ifJ1CnaMm7b0C2B/35OGXnArj+qHcJ+t6LHEvO7OxEMf6f5viWFZWmd/BNbeOB
 3GBLhPPQ7REZPZz7m2SWrzxne+KpIZeFQcXtgERS0GAKZJxu5C3czpBd739YUifTkQOX
 0vhkit+xYNnA6ylkf76e8uwfcg5eLfZ2gvLOd1hwWb/K5EL7EOiHI4k+wymZUa8JkMyW
 pH8h8yGCnkGI6pGTWw9J98O7M3tUGf6dqno88kTHtgZkT7kHue3rzG1M0qxoKxNu1OzR
 v6wO8xj8J5rn1QSsSsVm4x0QoNZaAv1Ks7FrL0+96M+Bi2YpS/aXBaadQ9UD1D0TWGoN
 jJUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=zAVf0eC1i4TO3oZMCKOs1PygTBx2n4QN+KOvIE2jWCE=;
 b=RHavf/S8TTojzby6RVveH+CEYJMxTy+1oldEBCPmq+Ep0xe1g2oMUILmm7rq62Fk14
 uQeoIK29F8Fb1xswkSqm1ANLaodzMyhcZUVwJrzhsNJa4n+UJWosGWl7og21bgpaUfpH
 rUQBwhDplfWStrd8K0PbHdH3G1/RI4+Ks2KXyjYcuy+Lp6IsHErweFormuAfDG5SuZMG
 uCCA8J5EkvFO+h9peL9Xkj+buuhr5mZ2lr1OYJe7ndg9SE+eoH+IxdEZPu+qhwanpf9F
 46eKaUXHSAgMEb72n18U/+ERaPhHDL9V5dl2qbIQxYxir7WLLMB2R8yp64cI3aAxe/I0
 Kv6A==
X-Gm-Message-State: AOAM533++ZylU3sLFS1HOTakZcft5nZxEob3QXebXex4PudP2XqC3YLM
 IA0ZjmmOqvSCbwNmL10q74k=
X-Received: by 2002:a63:6dc2:: with SMTP id
 i185mr26677561pgc.250.1591161855764; 
 Tue, 02 Jun 2020 22:24:15 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id t2sm719587pfb.64.2020.06.02.22.24.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 02 Jun 2020 22:24:15 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 2/2] hw: arm: Set vendor property for IMX SDHCI emulations
Date: Tue,  2 Jun 2020 22:24:04 -0700
Message-Id: <20200603052404.30788-3-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200603052404.30788-1-linux@roeck-us.net>
References: <20200603052404.30788-1-linux@roeck-us.net>
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=groeck7@gmail.com; helo=mail-pf1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-devel@nongnu.org,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fRBGxYKPs7Uo

Set vendor property to IMX to enable IMX specific functionality
in sdhci code.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 hw/arm/fsl-imx25.c  | 2 ++
 hw/arm/fsl-imx6.c   | 2 ++
 hw/arm/fsl-imx6ul.c | 2 ++
 hw/arm/fsl-imx7.c   | 2 ++
 4 files changed, 8 insertions(+)

diff --git a/hw/arm/fsl-imx25.c b/hw/arm/fsl-imx25.c
index cdaa79c26b..2cbd985e93 100644
--- a/hw/arm/fsl-imx25.c
+++ b/hw/arm/fsl-imx25.c
@@ -274,6 +274,8 @@ static void fsl_imx25_realize(DeviceState *dev, Error **errp)
                                  &err);
         object_property_set_uint(OBJECT(&s->esdhc[i]), IMX25_ESDHC_CAPABILITIES,
                                  "capareg", &err);
+        object_property_set_uint(OBJECT(&s->esdhc[i]), SDHCI_VENDOR_IMX,
+                                 "vendor", &err);
         object_property_set_bool(OBJECT(&s->esdhc[i]), true, "realized", &err);
         if (err) {
             error_propagate(errp, err);
diff --git a/hw/arm/fsl-imx6.c b/hw/arm/fsl-imx6.c
index f58c85aa8c..8e9a94e4d7 100644
--- a/hw/arm/fsl-imx6.c
+++ b/hw/arm/fsl-imx6.c
@@ -350,6 +350,8 @@ static void fsl_imx6_realize(DeviceState *dev, Error **errp)
                                  &err);
         object_property_set_uint(OBJECT(&s->esdhc[i]), IMX6_ESDHC_CAPABILITIES,
                                  "capareg", &err);
+        object_property_set_uint(OBJECT(&s->esdhc[i]), SDHCI_VENDOR_IMX,
+                                 "vendor", &err);
         object_property_set_bool(OBJECT(&s->esdhc[i]), true, "realized", &err);
         if (err) {
             error_propagate(errp, err);
diff --git a/hw/arm/fsl-imx6ul.c b/hw/arm/fsl-imx6ul.c
index 3ecb212da6..ce1462927c 100644
--- a/hw/arm/fsl-imx6ul.c
+++ b/hw/arm/fsl-imx6ul.c
@@ -505,6 +505,8 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)
             FSL_IMX6UL_USDHC2_IRQ,
         };
 
+        object_property_set_uint(OBJECT(&s->usdhc[i]), SDHCI_VENDOR_IMX,
+                                        "vendor", &error_abort);
         object_property_set_bool(OBJECT(&s->usdhc[i]), true, "realized",
                                  &error_abort);
 
diff --git a/hw/arm/fsl-imx7.c b/hw/arm/fsl-imx7.c
index 89c3b64c06..dbf16b2814 100644
--- a/hw/arm/fsl-imx7.c
+++ b/hw/arm/fsl-imx7.c
@@ -416,6 +416,8 @@ static void fsl_imx7_realize(DeviceState *dev, Error **errp)
             FSL_IMX7_USDHC3_IRQ,
         };
 
+        object_property_set_uint(OBJECT(&s->usdhc[i]), SDHCI_VENDOR_IMX,
+                                 "vendor", &error_abort);
         object_property_set_bool(OBJECT(&s->usdhc[i]), true, "realized",
                                  &error_abort);
 
-- 
2.17.1

