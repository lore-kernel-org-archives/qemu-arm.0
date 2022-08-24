Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp2216608ejc;
        Wed, 24 Aug 2022 08:52:31 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6v+mvn4D/T5kc5SSwfJikuOUOAsLmVHySENg0QreQOP8S8da9Diz6fMIX9bHAyP57pU6lZ
X-Received: by 2002:ac8:5753:0:b0:344:7fb3:3fa4 with SMTP id 19-20020ac85753000000b003447fb33fa4mr25061201qtx.504.1661356351455;
        Wed, 24 Aug 2022 08:52:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661356351; cv=none;
        d=google.com; s=arc-20160816;
        b=sbmVYXY8z73U1rd/GjTwuChRokRlqfbs0BugEobISUMYBlbP8RJCs5NrJExRnvfZ/X
         tlrQCsJF3AykcRUtINGht/cWK5if24PWpRL7oLG56sxw+8gNsfd2btH1dKmtI56u7HO0
         K9DapDSXn529iPTWr/6EVgK2iaV/N6dMDIeDpZkaEvQPjFiv9QvA0JFUA80hl3RGm2RR
         eb12ODHBbwujKtR5MZCTlLQoXWkaQTo2DIG5xH/VthkxiS7WubwFVUomSqBPAvDBSQR5
         nTQgwPuNEXGO2vxs/6/GJNM5Ou9nmnxiXGPWHts1/uUInYQFBEDr2DOcXPZg9b6amBLz
         x5ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=/MVk+AlNPESRV7EYaPRLcDW6Y3EIh0quCranMNr0U+k=;
        b=lqQ19oTE/fYE/GCcN1XL47L2zA//OhfjYjyRv3y3k1KS3/GnjTtEX+6RPMP9hzaVde
         tYiekhkaUzc6PvBEMBWSP7kCN4jLjASy4/25I8U73BO2kP7+um4+2YUYIPYgtj2hMISr
         Mwp6hXWe4KOxSFkml+0AtIJo/RViRvWWspCu470vo5VKfs9YFhoOCN9m/M+ZNzkbjuNH
         Bry/yTAfOJcyDO5Tg8qx7TySu32iqc/ZLXIgKoyVguNIBrt4xFwsWu1yd+BCdvbs3sFH
         KOmyY0xpmdKNdDUSdRk7r6B9yvjO7rccEAd+Er21trjKti5g/Jgtd55UqPbxIuzdViA/
         JIWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SISAXUmD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i8-20020a05622a08c800b00339d37c7c94si8311698qte.41.2022.08.24.08.52.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Aug 2022 08:52:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SISAXUmD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oQsgA-00029W-W7
	for alex.bennee@linaro.org; Wed, 24 Aug 2022 11:52:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1oQsf6-00027r-5h
 for qemu-arm@nongnu.org; Wed, 24 Aug 2022 11:51:24 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:38679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1oQsf3-0002Eg-P2
 for qemu-arm@nongnu.org; Wed, 24 Aug 2022 11:51:23 -0400
Received: by mail-wr1-x42f.google.com with SMTP id b5so17006606wrr.5
 for <qemu-arm@nongnu.org>; Wed, 24 Aug 2022 08:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=/MVk+AlNPESRV7EYaPRLcDW6Y3EIh0quCranMNr0U+k=;
 b=SISAXUmDEEha4rf3ux+5+6Aj7LWGpWdc7eTG9yXHLEAycCrVN344SK4HXyw10Da1L+
 nB+DurBeZF6AN900e3pW5Iu2XMkL4Yx8HZHyR5QICYpZYjTjeRMHH8xSX1pgGSv5Wq17
 epTNxZgt+1pxLt/5//dlocfCJKPv6ELe4kKizibwVntaOuWGFdW8szx4uiHJpy50MULx
 FN6COSQOvEpH5ePzdAW92rUt+3zy458VX66T+y5qHZghrqGlI9xALHDK/yz4DOxRhoxt
 8LN0oPNiiBMSganwFlZJDPyC/EHDFDydYINNh+erZuckjlhf2bk51yJRKXDd9tRS8tq/
 uXIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=/MVk+AlNPESRV7EYaPRLcDW6Y3EIh0quCranMNr0U+k=;
 b=rvasPeuaS+lSPIo9nmjTrZS8HOtfEATwTvIW5L+urperesGtqbNs4RbIlDgM8PSGVT
 yBwx/2CV4MhZjyCMWp+Tyr176WNJOX1+S/rdlUlBjl3xfeV/D+fkpoVrSPuDRAsLyEhj
 tBZUo/caPHW7lizck7o8w6sl1VoKaUs6mCtY4HcIfJLkI8Nkstq+lIwBJWD/WrPBve41
 SZnf+w401zHVytbV3CxdQWlD1YnGN9MFDY1sVmxFjefxOWXMbK/DvfdGGX7stYaXwjxr
 g169ZDWD8SODpCL6PvVKm+wSIqd5wBuaZwiGZbrYR6w4W4fG4xChvJDl4MQ5ZmMYliFx
 K87w==
X-Gm-Message-State: ACgBeo2f76TGm2ltVcbV0X8kmqfm6ymzPdhchEG8MBsZmYVivFUQ3ep3
 /dP7eq9IL+IMHjOdEV4kg136sQmWHqTmGsmf
X-Received: by 2002:a5d:6f11:0:b0:225:735f:e9b0 with SMTP id
 ay17-20020a5d6f11000000b00225735fe9b0mr1609169wrb.709.1661356279563; 
 Wed, 24 Aug 2022 08:51:19 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id
 q11-20020a5d61cb000000b00223b8168b15sm17236411wrv.66.2022.08.24.08.51.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 08:51:19 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org,
 eauger@redhat.com, Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH 02/10] hw/arm/boot: Fix devicetree warning about the PSCI node
Date: Wed, 24 Aug 2022 16:51:06 +0100
Message-Id: <20220824155113.286730-3-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220824155113.286730-1-jean-philippe@linaro.org>
References: <20220824155113.286730-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 6ukLy3fgUQbD

dt-validate warns that an implementation compatible with arm,psci-1.0
shouldn't have arm,psci in their compatible string.

  psci: compatible: 'oneOf' conditional failed, one must be fixed:
	['arm,psci-1.0', 'arm,psci-0.2', 'arm,psci'] is too long
  From schema: linux/Documentation/devicetree/bindings/arm/psci.yaml

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/arm/boot.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index ada2717f76..527918227e 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -493,7 +493,7 @@ static void fdt_add_psci_node(void *fdt)
             const char comp[] = "arm,psci-0.2\0arm,psci";
             qemu_fdt_setprop(fdt, "/psci", "compatible", comp, sizeof(comp));
         } else {
-            const char comp[] = "arm,psci-1.0\0arm,psci-0.2\0arm,psci";
+            const char comp[] = "arm,psci-1.0\0arm,psci-0.2";
             qemu_fdt_setprop(fdt, "/psci", "compatible", comp, sizeof(comp));
         }
 
-- 
2.37.1

