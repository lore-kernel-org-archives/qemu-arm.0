Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp446961ocs;
        Tue, 27 Sep 2022 03:17:50 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5PdyToIPkC6ZMGzHWaf9gBze3VnZ+HruLJxWy0i+08Me8asivpsRg5sG09+mVZ/4ixJMs8
X-Received: by 2002:a05:620a:a17:b0:6cb:e23e:9268 with SMTP id i23-20020a05620a0a1700b006cbe23e9268mr17816003qka.333.1664273870701;
        Tue, 27 Sep 2022 03:17:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664273870; cv=none;
        d=google.com; s=arc-20160816;
        b=vC4mxCe2bgZzgdrXdLzrMAF6OJoRAf952fTDIVZlIvvVf8kFKgDES9MUakHiS3K38f
         A5CkojPqWPpax76XpomiMm80dNL9MARot+8g5vP18cMBCmUWU4GcmR5H2iTCsIT33pdk
         xRPv1JwOBxAmmqRTyIq/4xr+eFHIOVIEMzefmfeq+tvlFB62Q1y4xX356fK99zpq8fOQ
         Lb26wUqTlmsjxoISI/Rjl29Y1Rl+jsvHcv3SvsTKUKSmzlhO9xGtIa4x1Vef2rPrswiJ
         SQ8m8SzVkCYYKq3O7+ZjAIAUNjdbeqCUgPGQY3NFVBREkEMTx7aA4B9izPUS3p68eept
         iJvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=/+qe3hdCuMJ02ODpgrestqrO1u1hGDsXWeqMcbLXyck=;
        b=isjY+4/dlgUJA3InEW21uDdyz/KGRcRecdajPaYnON/TyNxPLQEPtqgEy5etMG8BQb
         yyGMjAUPi9aprgO1U7vq+wICJkkcx6pSDlhxPjMgngTU4PBAgwzaJtvtzWyNDV3jwtCy
         zVm9iK2Q/BZ0WMK2VzOmnQ5GBUq8hNGglsuJ4oxtNzMrJRau9xTyCRxEIDvhYsXoEwHu
         ltacFQR1GDv85juEHtlzJqedqsGvNwviB+93wZ9xLLMxtx/nDQt3b6I0rWIIeiDwtn+t
         xD6tJ6rN+ViY5OeHoEpzkSs2d93qwCs5omK4hid5Ksyw9IXoy7eaOZUc2uaA8dl+CVe3
         TzLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="AiW/GIg/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z6-20020a05622a060600b0033c4405412csi587029qta.429.2022.09.27.03.17.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Sep 2022 03:17:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="AiW/GIg/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1od7ew-0007iH-6C
	for alex.bennee@linaro.org; Tue, 27 Sep 2022 06:17:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1od7a8-0000so-2Y
 for qemu-arm@nongnu.org; Tue, 27 Sep 2022 06:12:53 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:44781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1od7a5-0002Ug-20
 for qemu-arm@nongnu.org; Tue, 27 Sep 2022 06:12:51 -0400
Received: by mail-wr1-x42c.google.com with SMTP id c11so14171746wrp.11
 for <qemu-arm@nongnu.org>; Tue, 27 Sep 2022 03:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=/+qe3hdCuMJ02ODpgrestqrO1u1hGDsXWeqMcbLXyck=;
 b=AiW/GIg/GjwEaAnZ2TVBmgpWRD6IsAUThqA4QnpWfreS2ukL5SPvVq9XQhOTpWa5AB
 xbg/PUPoO+Kgzmh94pJnh6/A37RFS/cf8cTvSDXvDtdMbeQfW7+It8GGHy+/CeQ+Bfwd
 Hp7oCE5nNNc1dstkW71I9LqikPzpQyhGmdqOQs0+PeHp6LOqMWdOWXehQftvPx9cGH5H
 C2ytjHnoN+m6S8q5GNJYCjUkjeRdCGKJiN1EYwTd+m8klEGvUvpp6NCPM96cuJjKI43S
 gS+mL6KPo4Zkl0hzJE4vMbOPMu27PUDRm1THBvUszhlUFY0KT9Ph1rrOyz2x06HNTyRX
 dQVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=/+qe3hdCuMJ02ODpgrestqrO1u1hGDsXWeqMcbLXyck=;
 b=A4PguDMTQu5Ib3Qp3SG6G4bk85H5pbYSF5zRcc7Zp80Wiw9VTLpJQ6M4nSPfsSU0sw
 Qrdq++vc5EGE7S8RakXuYok8Zlhj7+HWUK/kGa54QZbwVUp6yBejV9g7J8XiTilHcUgj
 gbQkybw/fjVW8lPdPgfbJMp7+k8k8Fl/JrUjc49NDB+t7fkXV0FBoisIP9lMBGsA/RkG
 ZtxUTm8JcSgZO0f7B1vpw7WJH8doRGiiWlljiO9WppPGYl/ycSWmFXQPGiENT275eeCv
 J2RzU8Wfpt7uTUacbuyvkkymATufHce1JesFZle0bYn27+8SZueiEc7KJeq50lj5u9H5
 KViQ==
X-Gm-Message-State: ACrzQf15soYjza8/LhmfPY14W3LjmlG4aia9CBjDClvg8C7ysZB9ToHM
 z/rH4iM0A6ifCZSOhYEYIRc7tA==
X-Received: by 2002:a5d:64c4:0:b0:228:e143:ddb8 with SMTP id
 f4-20020a5d64c4000000b00228e143ddb8mr15707074wri.148.1664273567527; 
 Tue, 27 Sep 2022 03:12:47 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id
 w6-20020adfd4c6000000b00223b8168b15sm1398387wrk.66.2022.09.27.03.12.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 03:12:47 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH v2 2/8] hw/arm/virt: Fix devicetree warning about the GIC node
Date: Tue, 27 Sep 2022 11:03:43 +0100
Message-Id: <20220927100347.176606-3-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220927100347.176606-1-jean-philippe@linaro.org>
References: <20220927100347.176606-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KoyFb1wEB9fo

The GICv3 bindings requires a #msi-cells property for the ITS node. Fix
the corresponding dt-validate warning:

  interrupt-controller@8000000: msi-controller@8080000: '#msi-cells' is a required property
  From schema: linux/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/arm/virt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 83ab1a37fb..ed6f1ac41e 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -487,6 +487,7 @@ static void fdt_add_its_gic_node(VirtMachineState *vms)
     qemu_fdt_setprop_string(ms->fdt, nodename, "compatible",
                             "arm,gic-v3-its");
     qemu_fdt_setprop(ms->fdt, nodename, "msi-controller", NULL, 0);
+    qemu_fdt_setprop_cell(ms->fdt, nodename, "#msi-cells", 1);
     qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg",
                                  2, vms->memmap[VIRT_GIC_ITS].base,
                                  2, vms->memmap[VIRT_GIC_ITS].size);
-- 
2.37.3

