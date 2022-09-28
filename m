Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp440756ocs;
        Wed, 28 Sep 2022 10:11:23 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6RusBSOK7dzCuCPE/UOX48Zb+XDP/QJurd7SEB94PFLBX1wL25oZYQepdFnKNOYmlzNeWg
X-Received: by 2002:a05:6214:2022:b0:4ac:b001:2c75 with SMTP id 2-20020a056214202200b004acb0012c75mr26562027qvf.83.1664385083637;
        Wed, 28 Sep 2022 10:11:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664385083; cv=none;
        d=google.com; s=arc-20160816;
        b=PFEcgPdEpt5AePnixj0DJz+q7ivw2C4Di5Fb7d41f8mDemi/bZvlz4hsA03s56zCLB
         tAFEe9Lxj4SDMDJdwctt7Wy6+z77/gWbe/fREt+H9WeqQXreO3En9W3C+R0/uZamFd/A
         0o7lIlLhOIkmukz8zXtH5Z4PVvT5clsA3CkpF1lnJzTgRIufvMgGYfEbzDTHupL/bYcv
         KV/+Xa++5qEzsjxit1if3ooTdFTJrzSOm5EW7aIGjvRVZZtlRK41+xC4VK7WuVs+48Dk
         vENm34nfLvJkTpOi2hqk14xzWTT/wxTF36dFxqaq2mGen5qQ+brHsRWettxtpg3bVdzK
         Peuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=Tu0bN47V1kiTl8Z4R6vIk4Hbt38tY5OzcnSpNc8F9UU=;
        b=f9Cc9xdKmOx9HF+I+a8fh+UhjXtPjIJX3WbW+vo3G7OobO4CxrGnOlGMdmvFWzpvqg
         e3XSusujydeE7tA8RyzSPmQqxUu9Z+4Sm4Gr+QTE7EEfta7lK5NYB3YQvnbUTsINvrso
         79Nbibe785o4LW3In5Rrbbjps7+8wUdrd84kIDWu+awfXTBLrNGNviwOeXTkhO9Ax4Qt
         kZ++VdW8UeYxs/o1xMUofZoaZ6Hq6dnOOvf1WqRJMgbIeNif4IczhO2gDqIFATKmfgH4
         WKD9oBRJTm3vqMZDYxiflaU9hzUKMVGzdMyUJggb1oXwEd4AckJyfnTlEsLn02QLd1TD
         tdhg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bj24-20020a05620a191800b006cf8137d52fsi2929748qkb.436.2022.09.28.10.11.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Sep 2022 10:11:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1odaaf-0003Cj-UY
	for alex.bennee@linaro.org; Wed, 28 Sep 2022 13:11:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=OEEd=Z7=kaod.org=clg@ozlabs.org>)
 id 1odaDn-0003jH-I8; Wed, 28 Sep 2022 12:47:44 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:49729
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=OEEd=Z7=kaod.org=clg@ozlabs.org>)
 id 1odaDk-0001Hp-U9; Wed, 28 Sep 2022 12:47:43 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Md2Tz5WYFz4xGl;
 Thu, 29 Sep 2022 02:47:35 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Md2Tx3KQbz4xGT;
 Thu, 29 Sep 2022 02:47:33 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 2/2] ast2600: Drop NEON from the CPU features
Date: Wed, 28 Sep 2022 18:47:19 +0200
Message-Id: <20220928164719.655586-3-clg@kaod.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928164719.655586-1-clg@kaod.org>
References: <20220928164719.655586-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=OEEd=Z7=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jHXX6dFQT8st

Currently, the CPU features exposed to the AST2600 QEMU machines are :

  half thumb fastmult vfp edsp neon vfpv3 tls vfpv4 idiva idivt
  vfpd32 lpae evtstrm

But, the features of the Cortex A7 CPU on the Aspeed AST2600 A3 SoC
are :

  half thumb fastmult vfp edsp vfpv3 vfpv3d16 tls vfpv4 idiva idivt
  lpae evtstrm

Drop NEON support in the Aspeed AST2600 SoC.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed_ast2600.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index dcdc9bc54456..af987fd418ec 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -330,6 +330,8 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
 
         object_property_set_int(OBJECT(&s->cpu[i]), "cntfrq", 1125000000,
                                 &error_abort);
+        object_property_set_bool(OBJECT(&s->cpu[i]), "neon", false,
+                                &error_abort);
         object_property_set_link(OBJECT(&s->cpu[i]), "memory",
                                  OBJECT(s->memory), &error_abort);
 
-- 
2.37.3

