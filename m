Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp2217552ejc;
        Wed, 24 Aug 2022 08:54:35 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4AtEuV2NkwcVT5VXIFV7uCOxtIqLWWN8EP3UjozYMQYTdoiXqc0gw27qI/EhTUv/iygv0j
X-Received: by 2002:a05:6214:4011:b0:496:cfac:216c with SMTP id kd17-20020a056214401100b00496cfac216cmr17323485qvb.130.1661356475656;
        Wed, 24 Aug 2022 08:54:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661356475; cv=none;
        d=google.com; s=arc-20160816;
        b=FF2xPB5kyEnOZmKn7hd/FY8rqof2bn/wb7LnyV4ox43/trUbVRCi0gHK+2/2qDb0V6
         h3SL31A56NEsukNkZQmrU6AfBTAESHYJMYrOsqS4EbPTBXXF4cd7NRC9aQv/pqEM2ppJ
         lkd9wxd2ksEZAn/iVWt543nmaQJ0+nUZRs9Q3kHsu38e6bOhgZEL951JmW4Ra4OFuMFS
         tdJ/Ff8D/enmEbYJlZxfXMwYaa4tQncIMWqOifTL6nwmjqs0AGBXVMce37R+nF0vXL23
         4UIgNHXAqzJ4JUA5xGKiVEImOfhyv1bwcRLFs9EaX59I8DXuFeXAxYGf+3MNLaUC2vKJ
         POow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=HR8iBeFG8r8rfNyNxc67KbDEH5iNA4eSJjr7tgdBtu4=;
        b=Y2OcixA7VlDZd3Nyrz3kIYW7ifAOQJjcSH6y0Ovbik978aEwgWJ36QYJUwqAiu9L5l
         4e3n9nVpV1i8uCq/c+UxhW45BzJshlVSBuDmSkXr8JN/3AMcFmCFrzkcN9RDjRatLgBM
         M8YxBTxt44C/3JpYGcQeC+bTdpWt2yYvzLSq3EsxxG0p/4VM6ARU5QjzpwPu7dGOBUkf
         BuAVx60TzGZOm67U/n8jlRPZZHHYCDZ7GuTOaui5+bkv91dt4boDtbvk2+AiCqymsz9A
         rtQEXNbVtRTfekN2dnr/Oltb3JK37blvuPQX82TsenqbUqP/+V8ZfrL5f1t1QYH6Y+1C
         D4XQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="n2/D44lx";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r11-20020ad4576b000000b00496a88b16dbsi8535213qvx.304.2022.08.24.08.54.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Aug 2022 08:54:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="n2/D44lx";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oQsiA-0007wl-TA
	for alex.bennee@linaro.org; Wed, 24 Aug 2022 11:54:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1oQsf6-00027x-6D
 for qemu-arm@nongnu.org; Wed, 24 Aug 2022 11:51:24 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:44849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1oQsf3-0002EU-LQ
 for qemu-arm@nongnu.org; Wed, 24 Aug 2022 11:51:23 -0400
Received: by mail-wr1-x42e.google.com with SMTP id u5so13485090wrt.11
 for <qemu-arm@nongnu.org>; Wed, 24 Aug 2022 08:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=HR8iBeFG8r8rfNyNxc67KbDEH5iNA4eSJjr7tgdBtu4=;
 b=n2/D44lxhsABR8dmGzAoQrmEfOPUeBujtraAHfAxcqIFbmCsmtlJA/YFyf3irH9gMf
 +/oRcppu4syzAt0aMSCiKnOYxXQEyIcdurx9mNz+7XNw1MStHX7FxkyJI5eXr6264NNQ
 LBCJ9j4igPDnorzzQTKda4+NRvowLb5eIo2SRRzsGXWXUe3Lypdq8ILt5M7h1YDU6fqy
 1OS5aQZ8LHYCeB74PexkHGJRmvHNsM5SVapb2PzNeo8SOY3jL6MGCdoRLc158BotRuZ/
 /EaufYNkruScy6Sm+S2bE6dn3ePsGOy8VGTaZIl1vmc370MPYkg9Lp0Y8jlbZC6Dn5En
 WgzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=HR8iBeFG8r8rfNyNxc67KbDEH5iNA4eSJjr7tgdBtu4=;
 b=3sqcmm65fAABI1Nnc2gqc4xqgZlRveAge+BKTM6YpL0KbkCDz6j6X2Ys3zN8yxNWZ4
 dJd0Jrxei3y+lCiaEE4bNf3eTbY50e8eVDcgNDmdpeg4BwOL1cOEEX+Zp7lRiI01Vev2
 hktOX75rBa0iGZW+8SNXSzdjWk40HbzNdWAhXt3ArfLuXkth5i7ExTK3cdG0R+VfVoOT
 lAsnnXG5fjt9a+By9s3BXivB7Yrc3Y8q9l5uA+wddVLEfI2TYfLzyC10QrUkUk7FsnOI
 nUHikvfU1yE67W4Ct6/y9YqQV1J1u8PqhI7G3ZoyjpKG8vA5Tnh7cTIXWbDZIMgIulGB
 SgVg==
X-Gm-Message-State: ACgBeo2DpHrzyJfo7j1Qmt3aQ4W5XUppr+nv3nTyOacbl6xykeWpwJpm
 EiaHhCB84pxLazqwM0QRnoOPyw==
X-Received: by 2002:a5d:6dad:0:b0:225:6dc8:e453 with SMTP id
 u13-20020a5d6dad000000b002256dc8e453mr3245325wrs.64.1661356278859; 
 Wed, 24 Aug 2022 08:51:18 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id
 q11-20020a5d61cb000000b00223b8168b15sm17236411wrv.66.2022.08.24.08.51.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 08:51:18 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org,
 eauger@redhat.com, Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH 01/10] hw/arm/virt: Fix devicetree warning about the root node
Date: Wed, 24 Aug 2022 16:51:05 +0100
Message-Id: <20220824155113.286730-2-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220824155113.286730-1-jean-philippe@linaro.org>
References: <20220824155113.286730-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 59hLWDZVgQV/

dt-validate warns that the 'model' property is missing from the
devicetree:

  /: 'model' is a required property
  From schema: dtschema/schemas/root-node.yaml

Use the same name for model as for compatible. The devicetree
specification recommends that 'compatible' follows the format
'manufacturer,model' and 'model' follows the format
'manufacturer,model-number'. Since our 'compatible' doesn't observe
this, 'model' doesn't really need to either.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
This could be an opportunity to improve the machine print by Linux, for
example make it display "qemu,virt-7.2". I was concerned about breaking
some automated testing that may use the stable virt-x.y machines, so I
kept the same as compatible.
---
 hw/arm/virt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 9633f822f3..abcf2716bc 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -252,6 +252,7 @@ static void create_fdt(VirtMachineState *vms)
     qemu_fdt_setprop_string(fdt, "/", "compatible", "linux,dummy-virt");
     qemu_fdt_setprop_cell(fdt, "/", "#address-cells", 0x2);
     qemu_fdt_setprop_cell(fdt, "/", "#size-cells", 0x2);
+    qemu_fdt_setprop_string(fdt, "/", "model", "linux,dummy-virt");
 
     /* /chosen must exist for load_dtb to fill in necessary properties later */
     qemu_fdt_add_subnode(fdt, "/chosen");
-- 
2.37.1

