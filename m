Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp878311ejc;
        Fri, 26 Jan 2024 05:35:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEK5s22pTMkYE3t4e9pC39j90zlw7h176Cgk48qfwgMCKWUvggmk3HLIMzCqxoxavp72pc2
X-Received: by 2002:ac8:5a92:0:b0:42a:524d:fd0f with SMTP id c18-20020ac85a92000000b0042a524dfd0fmr1491512qtc.92.1706276142148;
        Fri, 26 Jan 2024 05:35:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706276142; cv=none;
        d=google.com; s=arc-20160816;
        b=YVqVFS4b+qmBOvqvDCCUL9ooDoZmu0Q/4KT9Tl/Ov6w9mGxdFykXhqJ2wj8BExGwBp
         lG1uTqlgLJ0jcRaQRAuBidKXxMLWsF40SNyHmWJrRlcfa63nOEiFHz1fh6poLXZ5wKLY
         iB/+/sHOR/KaDZio5NqSENauq4IHQGgDjkJ9SSF2QBaGjiSAcM5o+bUzoUMuqVeZxWKO
         U3RytffNbcwJOrQx0+gMdbkl8jkePTOYO8nLgR6U3XDyOahsSfFiZWEN4GQH9dTER6Kh
         8sFmU5xeT1GkRLKPOxo4kCTMdy43TjiQ+wMe1GX5I/DbSkKrtkMcu3VSnnVZsDT2LwlO
         yWLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=vUONdn7f/FE+0d4UqRtFrPujzHi/jBvdkBj/ZTcHCD8=;
        fh=bVphFuusNWIgqYv/5Ts2TRQEiVyLsGj1TQub5fSYeWw=;
        b=E3qqEnlBytEmXx+wTZe+G7gwhFvPIJZpp6GSLsJGCvl2cMP2Mh1i8TbLwZ4GJKRcok
         tEd6k6iJzurKDRvLte8oqshXOFe+jLvsY4CfQOkwufJhXfsHrRDKrkYa6Z6x/5NeGi3M
         lqYSBt00prRYwU24kPJnInYXzr7JvAf9ql96AshMwK65vSlc01LGd77o2+6nU26LoayK
         pcAWJDDjz497Qzw+O/idBfLMYevGlkPp3wbQMxTVT12INGemFJnbzJBDsuC+zx2NEjAS
         uZBXv4nohP3MqwW45FDWa3mZeP2mNKQdIfUvozqG4D/NqortZ0d4VTiX5F8ZJ/UectyE
         kL4g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o19-20020a05622a009300b0042a8638c736si272574qtw.339.2024.01.26.05.35.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jan 2024 05:35:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rTMK4-00036m-1w; Fri, 26 Jan 2024 08:32:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5gEp=JE=kaod.org=clg@ozlabs.org>)
 id 1rTMJv-0002gs-AR; Fri, 26 Jan 2024 08:32:35 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5gEp=JE=kaod.org=clg@ozlabs.org>)
 id 1rTMJt-0007zF-Cc; Fri, 26 Jan 2024 08:32:34 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4TLzC14kCDz4wxZ;
 Sat, 27 Jan 2024 00:32:29 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4TLzBz4Mngz4wx5;
 Sat, 27 Jan 2024 00:32:27 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gavin Shan <gshan@redhat.com>
Subject: [PULL 02/17] hw/arm/aspeed: Remove dead code
Date: Fri, 26 Jan 2024 14:32:01 +0100
Message-ID: <20240126133217.996306-3-clg@kaod.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240126133217.996306-1-clg@kaod.org>
References: <20240126133217.996306-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=5gEp=JE=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: JJoSHGoAm0s3

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

