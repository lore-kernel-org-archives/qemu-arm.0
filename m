Received: by 2002:a17:906:9417:b0:98e:baa:bd63 with SMTP id q23csp1910568ejx;
        Wed, 28 Jun 2023 04:09:54 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5gA8SpALwg9Har777L00h/j874Ck476xx188TUDIvvTqdhQ2dv/AIEp+QUfakGnXOPhKgV
X-Received: by 2002:ac8:5a46:0:b0:3ff:3018:8d9c with SMTP id o6-20020ac85a46000000b003ff30188d9cmr29280987qta.17.1687950594149;
        Wed, 28 Jun 2023 04:09:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687950594; cv=none;
        d=google.com; s=arc-20160816;
        b=TyBUc9++YpWlFW8EZmHtF3pyEyKI/roXvH5FtR1uz2R1jUkpkzAt+CnlFNc/jzo5IV
         DmQZo+d0e00TjJJFAI1eVLOTOKM6JQNwhvLLINxzF5y2NOpn73YDf7XvuG9Rd2xjZNBz
         AplQxMFiX5mYd/rUFXGtoDMdaks5iDN98wrnekfGrOMuFUT47ozqe/XGQi+PBteW/VA7
         FYRaY+EikxdyUndkB4IWzMRRzdPND4zJv7gE66pgQtZPYXiQa84a/BvQ505wmzNhxFtt
         emqPNiIrY/YWGukr1/DOB71bswWCg8S9f1AkCihC/I2thBo7GcOntGccm9r4io91HJZV
         zgSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=pxqYwFZlQDRcPvSRMEkOuNG+LRfYsTu2FiTLUQDOseY=;
        fh=8quqTUxZq+EZTja61PyGoPney1uv3gfizqw1vd6StpU=;
        b=UbKifucM4iZBVXBQ927rXTt3P/m/KrRGcEx3TDJFfZLl44rYAu/Q9sZ7wG/z9XH6Zn
         9VRklSbOlMlIvCHQfNZaBLojAXe1VECbAuMECE+fvn0QhiqZoulWQlj/32p1NvXEjiYP
         xOel411DK/yptOa5tj0E/L9ETw4KnRyBsLrpR7Q9aM523dAbn/C5gnqQks50v6Uid64/
         A8YIW3WFAL1Tsv3JCiT+3W1arlatmBaaVW1+LjhJWdQPeQgKqGQVAEJZKMI6VE99r4JQ
         /cNQXrm6w5eyx+V7dssu/+/MsDrIDnCnZNSSHBFVxl7I8sm/K+PBcH6oP7Ogl8gUX0NS
         ojIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b="0OoE/b+4";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q6-20020a05622a030600b003f528ced1basi4278217qtw.301.2023.06.28.04.09.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Jun 2023 04:09:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b="0OoE/b+4";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qET35-0002rl-Lq; Wed, 28 Jun 2023 07:09:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qET34-0002mI-F9
 for qemu-arm@nongnu.org; Wed, 28 Jun 2023 07:09:22 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qET2x-000121-D8
 for qemu-arm@nongnu.org; Wed, 28 Jun 2023 07:09:19 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1b80f2ed810so17231645ad.0
 for <qemu-arm@nongnu.org>; Wed, 28 Jun 2023 04:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1687950552; x=1690542552;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pxqYwFZlQDRcPvSRMEkOuNG+LRfYsTu2FiTLUQDOseY=;
 b=0OoE/b+4Ut+rto1yqBLS4JOvmzyt/9/0DMCe40VyIBW8E8/YnWZ//nXSbucDMwFhJK
 wKFXKG5P1v9R/DYTLuXzwoONwOFsQlH+zkIqpsWCDgGDGOl4CyoLgGRySRqfLfU2CH2G
 eF0LCn/JUIdlSJtGUWlRnaPzGb2hHXb/9Ss9Nmqyxd8UgqC/X9RhxitF8bNRvnS8R2fM
 x35r0pUKqB34lpE6BJojOHR2UYO5awogT8Qn9LYpksyF7pj2eU9M7Z9aft9wFPmjUcs9
 mMeeBWykZkdmx7f80pqZHLVLw/jJ3R1G8nS+lBoamXyaxUqjhw1t8XwlFE2SUZb2RY7A
 InVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687950552; x=1690542552;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pxqYwFZlQDRcPvSRMEkOuNG+LRfYsTu2FiTLUQDOseY=;
 b=EDY7bNXLXlg6jWSAYDZCtfACv9jMn0eALuEpnNJBvUD+/3v3cz/uwUyjjMAKoS3sqU
 Ui3954z7P6AigWVsA7ut5k/6GzYGXiiWCQomzGTix+ukb0TBtU4bM64kVuUa4RKrjKEK
 dQeMAcjchi8RFIAUvt9hgtg+h/K8LbP/7t09TxU5A+Md1hHsTvTm4nQRSBHZ503nvyKB
 pQm74xun/LR5BUKcNBmR4fw5gATmqm5gFiXLkQE3qHIdNBMcKshtz2tTv7tq6r84T5gi
 yrhKN+aVrNS837G7+LVM3HGye1WxMM1G2TMd4BIEUEY0S/U4sGguu3G7Bn1WkuoGyT2L
 S44Q==
X-Gm-Message-State: AC+VfDyDCrjlIzVixue+vMvMD4efM8FuM+AbLO6JXxXRocYUFLDNWnY2
 UaEzRwOPR93SlbBja2flt16r1A==
X-Received: by 2002:a17:902:f7c1:b0:1b3:7de7:f83f with SMTP id
 h1-20020a170902f7c100b001b37de7f83fmr7665549plw.26.1687950552198; 
 Wed, 28 Jun 2023 04:09:12 -0700 (PDT)
Received: from alarm.. ([157.82.204.253]) by smtp.gmail.com with ESMTPSA id
 n10-20020a170902d2ca00b001b3cac25f82sm7461198plc.139.2023.06.28.04.09.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jun 2023 04:09:11 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH] hw: arm: allwinner-sramc: Set class_size
Date: Wed, 28 Jun 2023 20:09:03 +0900
Message-ID: <20230628110905.38125-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62b;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: krLhpS1Y4wmJ

AwSRAMCClass is larger than SysBusDeviceClass so the class size must be
advertised accordingly.

Fixes: 05def917e1 ("hw: arm: allwinner-sramc: Add SRAM Controller support for R40")
Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/misc/allwinner-sramc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/misc/allwinner-sramc.c b/hw/misc/allwinner-sramc.c
index a8b731f8f2..d76c24d081 100644
--- a/hw/misc/allwinner-sramc.c
+++ b/hw/misc/allwinner-sramc.c
@@ -159,6 +159,7 @@ static const TypeInfo allwinner_sramc_info = {
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_init = allwinner_sramc_init,
     .instance_size = sizeof(AwSRAMCState),
+    .class_size    = sizeof(AwSRAMCClass),
     .class_init    = allwinner_sramc_class_init,
 };
 
-- 
2.41.0

