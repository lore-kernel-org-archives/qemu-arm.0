Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp281110lfj;
        Fri, 13 May 2022 06:15:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz24rAcGk+bYa3d4zTjHQkrktL/gvnck4lLnRSgtRYz3Kf0Ku3XXef3B4wlsMxlu2Xl9YI1
X-Received: by 2002:ac8:5ad4:0:b0:2f3:e0fb:df1c with SMTP id d20-20020ac85ad4000000b002f3e0fbdf1cmr4346938qtd.267.1652447750425;
        Fri, 13 May 2022 06:15:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652447750; cv=none;
        d=google.com; s=arc-20160816;
        b=YTOUd0Gysw04iZzfWJNjzOf/+tI+7EAnOkqxNZ0nCD8MQdlQCeqiUIjiZD6P1RfVmU
         EOZ3IPi3z6faWG6RtUs1B2ylnccFdSbaNDKTIG9DUlzdLFZK1/a3LjU30UyBDU7cGOGa
         NI0m9RhNHmjQly2z4bngjmcWhorBnWPNLcoDViLbE4cKk0GeKbekmvdO/mWxysBR46ZC
         CmTxK1M9OMWIhuYl8at1eMakixji3o40LE3NcDIPuWPihEzKCbocP+rWqj7XkZKkU4AG
         jOiegumuOe5dRLMrhHwNFHjFarIXk8kd+iv6WcjwrGL7Xn6GdnRJsCAsWrDaHLDdCeqO
         mkIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=9NZM93kg05o9Nk5CELPlexfXMMevgoe6mPGgO2E6Ams=;
        b=bpeMEGnrgsUHAfxKta8xwhKGJclxk2InwdD/vC7ZHzRHYgRxx+G9E8l+Rz3hew0Crf
         vzxFYyAs4f1U7PYPWB758wS7UzZlqDvMs8hS5MnlVm9bJEQoU6SVY761PXXhQOBgs1m+
         aJSt6U8cnLX+r2/tus3eWj1lytvh/npJzCoejD9AlDFI0US8toCGroBYMXqeqoi8xrem
         UG3B4s2BBGGpEHw3uSO2H2PyOSdSc4sPZOA7VEs4ckmI2e5fpyU6tNrRYfwvLfzcRJFR
         uJtEvK2Xet2XzcQ0JM5Ih+kVUP4LEoQiXo5AIaBpwPiRm5pn8dLP9UQwEWG0m2iTvpQe
         lrSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DQtXM3cw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b40-20020a05620a272800b0069e7a0f15d1si1579925qkp.29.2022.05.13.06.15.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 May 2022 06:15:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DQtXM3cw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1npV93-0007wW-To
	for alex.bennee@linaro.org; Fri, 13 May 2022 09:15:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1npV6l-0005hx-5M
 for qemu-devel@nongnu.org; Fri, 13 May 2022 09:13:28 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:55879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1npV6g-0007dS-Rm
 for qemu-devel@nongnu.org; Fri, 13 May 2022 09:13:25 -0400
Received: by mail-wm1-x335.google.com with SMTP id m62so4770397wme.5
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 06:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=9NZM93kg05o9Nk5CELPlexfXMMevgoe6mPGgO2E6Ams=;
 b=DQtXM3cwrs9emfA++5dJN629bY98Z1NTtRpI6MwxR0O6UFjCduav88KiXZXbxKBhKA
 CSBWK6oJU7Npc6umHZaqB9g6bxp/js9UJcoEfDY4GK/0w4uhjLhmO2D3SKJz884leD7D
 G8NYEwFuMCRZgaST8xDAzC+wkMdaijefy8mxVspdHrwGq2QPcYFj73DbCm+tzDSvpoX7
 mesy9/mRykCg12RiMfg3GH+aT3Hx/MAfNt+k20v6FWaJBrCNg6AfndyiaJfdRfMsro5s
 6PozlSlm+cLa00ci1yjxf4gcdvomSoyEsPrMeYWoIz/MmRLmxrcOrEqWenBNi0gn7fhL
 iPjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9NZM93kg05o9Nk5CELPlexfXMMevgoe6mPGgO2E6Ams=;
 b=C4P488CCXjLqhFuvoNVQyAH5BnvkgsL8XtGXBIh3ecyz1x9AGwxsi42G10gVZSmZqv
 pG8fdnLrLAdqDJbkyXa7wNLzqijbuF0R2Qz/OYHwtG0q1aloRaHS0NeJCqdyJexpgvL4
 zE8wjJY+oV31V7alOzOhG5+L9KxUn7naS6vSg05hIiCs99tkykV2f+WdH+R0I8R6hNWq
 ursUurLRft1cK+THcn2AwaBgRXklb+yZtiIi/l0+T2S+0ZCjQ8ANw+1Qgia658wQLQJ/
 rIqEvltKUQMN2cMLXLCanP2Cy/yufy/uqOPckxCHjk30pKzV+hDpSkmSRDT425S+YTrT
 oeSg==
X-Gm-Message-State: AOAM530QZBdFfV4DZqV0UQCTDW0XZ8MtaXU1DCyihSa4UUViY+VGtP8L
 ziN5yCMOKcsACtWv02zN2ovV6HczfpbzSg==
X-Received: by 2002:a05:600c:2315:b0:394:1f6:f663 with SMTP id
 21-20020a05600c231500b0039401f6f663mr14815742wmo.115.1652447600695; 
 Fri, 13 May 2022 06:13:20 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 z23-20020a1c4c17000000b0039456fb80b3sm5214887wmf.43.2022.05.13.06.13.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 06:13:20 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/2] hw/arm/virt: Drop #size-cells and #address-cells from
 gpio-keys dtb node
Date: Fri, 13 May 2022 14:13:16 +0100
Message-Id: <20220513131316.4081539-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220513131316.4081539-1-peter.maydell@linaro.org>
References: <20220513131316.4081539-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: GZNbadZV5+Rg

The virt board generates a gpio-keys node in the dtb, but it
incorrectly gives this node #size-cells and #address-cells
properties. If you dump the dtb with 'machine dumpdtb=file.dtb'
and run it through dtc, dtc will warn about this:

Warning (avoid_unnecessary_addr_size): /gpio-keys: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property

Remove the bogus properties.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 587e885a98c..097238faa7a 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -925,8 +925,6 @@ static void create_gpio_keys(char *fdt, DeviceState *pl061_dev,
 
     qemu_fdt_add_subnode(fdt, "/gpio-keys");
     qemu_fdt_setprop_string(fdt, "/gpio-keys", "compatible", "gpio-keys");
-    qemu_fdt_setprop_cell(fdt, "/gpio-keys", "#size-cells", 0);
-    qemu_fdt_setprop_cell(fdt, "/gpio-keys", "#address-cells", 1);
 
     qemu_fdt_add_subnode(fdt, "/gpio-keys/poweroff");
     qemu_fdt_setprop_string(fdt, "/gpio-keys/poweroff",
-- 
2.25.1

