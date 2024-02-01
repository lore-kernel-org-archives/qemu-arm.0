Received: by 2002:a17:907:7006:b0:a35:eedd:80b0 with SMTP id wr6csp258481ejb;
        Thu, 1 Feb 2024 06:13:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF1blW0mXY8Enei/ED5/Za+SrmH2JmwrkgMd1ozL4OxQS6x09YhX7BZqER9gPa7yiOi2ePg
X-Received: by 2002:a05:6214:21eb:b0:68c:64d3:d993 with SMTP id p11-20020a05621421eb00b0068c64d3d993mr5298705qvj.31.1706796837310;
        Thu, 01 Feb 2024 06:13:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706796837; cv=none;
        d=google.com; s=arc-20160816;
        b=fC12l1/x238Ba5zeh+HkZvTTSnOCtw7y9mXPa8/gfyFL4s7JvQSGIbkJGAWpbJ2ND7
         dpINH5h2dpUGx/DwpRvKzXBlQxahItLgem33nsQuy12CSDiAOYKgVz4ww0vUjq2dbA5k
         sIg7DS0vz9P+1vwrc404q3PjfwwV7AY4sE57NYH68zOfWWVKzSGt7SUib4TZDhWWVs2Y
         CZOG85joo8wRAsUvnBKpLFa4Zk5Tpw7uNIicWFy3jLzby7Rrg5lXWnHvSF2F8hUr5c9y
         Q2NUXMJYL8vGQHO/SnS+XfmJ13gFHdF5KFYFQzRR7si/G0MQy3ccR6m6BTEIbT30D6+B
         RwZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=vUONdn7f/FE+0d4UqRtFrPujzHi/jBvdkBj/ZTcHCD8=;
        fh=qK6K2gIZMpklOHOBrUeBG1n1rTxQK4mxdVP5zbXEDkE=;
        b=Ciak0KqnSYZi84qEFMOFM3UvhsSM0VndSvg2Z1odmp4GzLcJAhS/DosNPvOOLF1ZDs
         Wqb5MWRenOnS4gK/oPMsWdO3LUfDznYaPTMvVue4vGTBtV4uX6p6J9c5QOEJaK/nVwIE
         clMKhfCJxp8VQOUNg7WRhJR5mWs2dCeRI9ii1RIUyj6tSfJuuKPGKyZ4Cc1Fpsr6ncrv
         SSwGRr643bzz0Xczy1C81dq7K8oIT/0YsqAMZENjwzq17eecgFWmOr/ITqUh+b6Bth+N
         VaiaX+teun9rnL+KSiNdTWx7WTOcAzinoJ6G4a3rAjHiRMDSr9KnA9steBSaVGrewrv3
         O4sg==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
X-Forwarded-Encrypted: i=0; AJvYcCUCxdrQesX88SOaGACNZvmDH7GDV/SYCYU3MxtGwxIyt4ryPoNuymj94HHstiXknDtFu9twHfhf/DJ0FErnvBiSOvuJkHLx
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u9-20020a0562141c0900b0068c3b1ade50si12931506qvc.438.2024.02.01.06.13.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Feb 2024 06:13:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rVXof-0000x5-38; Thu, 01 Feb 2024 09:13:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Qo6T=JK=kaod.org=clg@ozlabs.org>)
 id 1rVXoX-0000v6-6J; Thu, 01 Feb 2024 09:13:13 -0500
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Qo6T=JK=kaod.org=clg@ozlabs.org>)
 id 1rVXoS-0007m3-5V; Thu, 01 Feb 2024 09:13:12 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4TQgq55xyJz4wcS;
 Fri,  2 Feb 2024 01:13:05 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4TQgq35C4gz4wcM;
 Fri,  2 Feb 2024 01:13:03 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gavin Shan <gshan@redhat.com>
Subject: [PULL 02/17] hw/arm/aspeed: Remove dead code
Date: Thu,  1 Feb 2024 15:12:38 +0100
Message-ID: <20240201141253.806055-3-clg@kaod.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240201141253.806055-1-clg@kaod.org>
References: <20240201141253.806055-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=Qo6T=JK=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: BAjwoe2gFwh8

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Remove copy/paste typo from commit 6c323aba40 ("hw/arm/aspeed:
Adding new machine Tiogapass in QEMU").

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index cc59176563a8..4bc292ff84fc 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -1301,7 +1301,6 @@ static void aspeed_machine_tiogapass_class_init(ObjectClass *oc, void *data)
     mc->default_ram_size       = 1 * GiB;
     mc->default_cpus = mc->min_cpus = mc->max_cpus =
         aspeed_soc_num_cpus(amc->soc_name);
-        aspeed_soc_num_cpus(amc->soc_name);
 };
 
 static void aspeed_machine_sonorapass_class_init(ObjectClass *oc, void *data)
-- 
2.43.0

