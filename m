Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp450385ocs;
        Tue, 27 Sep 2022 03:25:00 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5aRY5L+KmdFs9gMfpARhxEjaO8108F6IdeBH/WaCTxZfU37ph1c82bkzt4vv1aiIRzwIss
X-Received: by 2002:a05:620a:4414:b0:6ce:610c:fe34 with SMTP id v20-20020a05620a441400b006ce610cfe34mr17676229qkp.659.1664274300252;
        Tue, 27 Sep 2022 03:25:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664274300; cv=none;
        d=google.com; s=arc-20160816;
        b=PRi/91DvGWBRuQ4+hf1ycAECreykoy4eQIctCVvszTtDU4m+39rzLuBCCbIEmnXn8D
         ERhY5m9gSC6OCi3EYzgmZ9nQqRk1D1DajhreB5cj+pGOUN9cnPRqK6PWVzuJCbJ4+Q4O
         xwAu78RFfCjPGWmE1pTQqnd3AqneP7RKqwonZNHusgYD2Cmufc+Q69nh7D03esWnOLVb
         NTSmVNF5t4tWAr+sX/6BMtsnI25ncGperK/oAeDBkGnT/ghUHmtOk9c5HrjlQbPnXj3r
         N1XAtkUjGz0bE6TCsi4gPnVnyiRx0UfTxcoqWUVfXoCigmXMv0Dnp/1Jl5VB1CAK7QS7
         AcoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=7iySBt4V5mw6rx6WYGB/cETVun6K55iadG8h/0ICVCI=;
        b=snZvQVohyoK/8oA0vjctbD+VbvGrQ4GIbBMrAw0TFCrdg1QOg5F3iW5iRehK7PqSHg
         22oyoxEGO7WnIPAcG9zt1lafmadlLHNoUJP6WBwhOQCG1EcAOK47QcED5uVbgG870HEJ
         fW2g1xFqzTu3kr8vyZUULlHhVZOBAmcCzhfJlh7NBlkEiqFOjQKnFViBCa1C2sJW4Sm1
         q1LO4XovWhVVc6ALk1LONtFuGFZ4113OX9SuZP7GiyO0CatfZc6udUIritB7/v8i2/uh
         cXuUdb7s20hkQ6fxuonogWtGxtfaOwN5vorOhj6E2oErUK7ShJJAn/oQpag5LDQjPJwd
         IUpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="wYN8Dn3/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y4-20020a37f604000000b006ce00b616edsi472108qkj.589.2022.09.27.03.25.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Sep 2022 03:25:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="wYN8Dn3/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1od7lr-00082t-P5
	for alex.bennee@linaro.org; Tue, 27 Sep 2022 06:24:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1od7a8-0000tJ-Ll
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 06:12:53 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:43823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1od7a5-0002V6-Iu
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 06:12:52 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 r3-20020a05600c35c300b003b4b5f6c6bdso5150901wmq.2
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 03:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=7iySBt4V5mw6rx6WYGB/cETVun6K55iadG8h/0ICVCI=;
 b=wYN8Dn3/POyFtgTlE+N7TwzRTylZ3vqDUce0hUQ2JyvICPMXJcg0O1QUokSDbifWwF
 k4pBmVZWraV4SYeWcd6Tm5fJTv28Dv5//Spvc2A+S+cd4ZUKfJqcjqEDeueVE7Q8/qLI
 waD8MuC/ifn0S3r9vKDmaQfrQPJZnwMo3A5IXidNH05yXthKpwPkQctLiNkdZGY2W/l8
 pSZFO2ftMfOKnaBzquylAwM/Vofnelrou6NNb3wnEfc34d7LdPiZbNFmoc8o53R7xUYM
 XYCmR7D6o6QL6Do8W44S6TUmpQgsI1k8Sym4TGd9T3yG1eO2ENabxupceNm99KavsITl
 IZ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=7iySBt4V5mw6rx6WYGB/cETVun6K55iadG8h/0ICVCI=;
 b=biFA9V0C8E+yg9DBn50NqDu8hABaNzTv5nxHiCvcbll6i+/dlg+sJQjXfMqQkmxUGO
 m9KzHf6VWsVdqPD6F6okr34jpHz417D5dsLxXtkCieLdKSmvWqfsAEHMGCCM2jd5/Lht
 Ig7RtD746dvDyy+99l7XV1LOKqWEsZQzUfbc9Txe8jpksF/4VFNzj7TMAwWUwiXEoT7Z
 TxL30yn9F5OcO2DS3awIr6Gk7kwH2V7y5xvm2a1a7Ycl+AdGhnQfIMJLv0U+79t3VCzW
 URRcyU1+zDiYG5hJ7VACKmUt3U/dYaU+spYJDaY5bdfjm4oexqH7JRPrWJ6Ck4t403Oy
 n89A==
X-Gm-Message-State: ACrzQf3GUXcTsMdzoFSZtV/HA8f71Z8T3mvwnwPskPkzwguMLT7tYTRy
 3VhksdhQ4pljazHUmowbgnaM2rIBJh2EeQ==
X-Received: by 2002:a7b:c398:0:b0:3b4:9308:ffee with SMTP id
 s24-20020a7bc398000000b003b49308ffeemr2045144wmj.51.1664273568239; 
 Tue, 27 Sep 2022 03:12:48 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id
 w6-20020adfd4c6000000b00223b8168b15sm1398387wrk.66.2022.09.27.03.12.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 03:12:47 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH v2 3/8] hw/arm/virt: Use "msi-map" devicetree property for PCI
Date: Tue, 27 Sep 2022 11:03:44 +0100
Message-Id: <20220927100347.176606-4-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220927100347.176606-1-jean-philippe@linaro.org>
References: <20220927100347.176606-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: LZOXCORu6eMB

The "msi-parent" property can be used on the PCI node when MSIs do not
contain sideband data (device IDs) [1]. In QEMU, MSI transactions
contain the requester ID, so the PCI node should use the "msi-map"
property instead of "msi-parent". In our case the property describes an
identity map between requester ID and sideband data.

This fixes a warning when passing the DTB generated by QEMU to dtc,
following a recent change to the GICv3 node:

  Warning (msi_parent_property): /pcie@10000000:msi-parent: property size (4) too small for cell size 1

[1] linux/Documentation/devicetree/bindings/pci/pci-msi.txt

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/arm/virt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index ed6f1ac41e..8605f5058a 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1489,8 +1489,8 @@ static void create_pcie(VirtMachineState *vms)
     qemu_fdt_setprop(ms->fdt, nodename, "dma-coherent", NULL, 0);
 
     if (vms->msi_phandle) {
-        qemu_fdt_setprop_cells(ms->fdt, nodename, "msi-parent",
-                               vms->msi_phandle);
+        qemu_fdt_setprop_cells(ms->fdt, nodename, "msi-map",
+                               0, vms->msi_phandle, 0, 0x10000);
     }
 
     qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg",
-- 
2.37.3

