Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp909146lfu;
        Wed, 27 Apr 2022 04:18:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5FCD8K/vgYx4Fe5O+9VcDbs4LoyrEpttUobC21dZREm0TXy1AAxiDb/1EXx4eGHnd7V41
X-Received: by 2002:a05:620a:108f:b0:69f:6ca0:cc43 with SMTP id g15-20020a05620a108f00b0069f6ca0cc43mr6461058qkk.663.1651058313168;
        Wed, 27 Apr 2022 04:18:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651058313; cv=none;
        d=google.com; s=arc-20160816;
        b=s4tgVMhTVYhlnSISlFKLTJkTPdCk33OEZTjIs6HmT0nsslkfkHqXTlBUt/fZMjD7Lj
         t9LXiHkyFkmd/seaEZNLKEyZyvM8eoISIMoV5+aAHIxWEHfE8DS4KTYLC1xl6SLO7fht
         RNlf6x0GxYnw0c2GOq5PdMjWytpbWciKHIjcCUC8BtII9FCTxtZAwuSoDBGrHRyEp6Vc
         fOoJ9sExsi6j2X0PHMDGx+LwWvLKRyWulS63cjQsXiK4LsSajp1S21dSabeaJJuLMyO1
         7/6bKhXaHtw6w4AucuBfpZP82T5txfztPmW8ISIBN9z+UwJooeXHg6MiTiFaE3RCQAgJ
         RoRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=A2c65tDAbj14lGL/ycGVvF4tProvIRMiix3SHQuwl20=;
        b=g6/Y+AhFKcrU+HbWtOHNgXel8lY1b1kgSGuIzdPI5xvZ9ZWRrKvmOtNF3YV1fLVLRb
         F/gPXgZY1y2p7CMU1TTrauHVo+4ePmlqdn4nP3jSRNJKM+y7W/wrOYmQmxCBl8J72M/c
         6euh/JIvBJRVP+sGplefI0xdXq6BQjfPMhV/SdnDlqRBk+jtcvix7lZ0FmlfaieqQ3hD
         BkFOyR5XuAIckhBhKrVAApvpeTMji/rYYBYYCkBnUdNEdaVs7KtZ4nm2qgXZcOTl7jWR
         +3MnOz5p9hsMQ0U6h2WvKwymuFFboETiECc1vqDyGKZLXAYka+iukj0DID0C4u/Zj2fm
         PHzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n5mo6txL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c6-20020a05622a024600b002f33eda8da5si313476qtx.465.2022.04.27.04.18.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Apr 2022 04:18:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n5mo6txL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1njfgm-00073M-D3
	for alex.bennee@linaro.org; Wed, 27 Apr 2022 07:18:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1njfgV-0006xs-O2
 for qemu-arm@nongnu.org; Wed, 27 Apr 2022 07:18:15 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:36447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1njfgU-0007Op-7M
 for qemu-arm@nongnu.org; Wed, 27 Apr 2022 07:18:15 -0400
Received: by mail-wr1-x42c.google.com with SMTP id u3so2031830wrg.3
 for <qemu-arm@nongnu.org>; Wed, 27 Apr 2022 04:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A2c65tDAbj14lGL/ycGVvF4tProvIRMiix3SHQuwl20=;
 b=n5mo6txLFhe8OVGhdEQla3hkl6qPWQGZ/btvzR/3euamLz2VPXHgqSiV0/ozaZL0LW
 UJoPoZ7j3dy04PcbFHwgGQPeP3iyWnmbNpIElkHn27QOYXlRI2j/zufNlxfqw5XQ2BDg
 xx1ezA5dCmBvhpi9PwlbR6JProuKtJLP3hKyAb3oEbXjE1frAiAVHzVlBB7ofxEkgMZD
 gOMny43ePrT9HDjSLya13qaWQxtNzrp6SnyrCE6fjdrcn91OUnqbuauIx7oIwo/1vkqX
 uA0zOqbVIIDegO2kmBsJHx/sqMX6lM9xfKwIMJLfxyMBZYqskrOUqy9UAK3dOnXbTQ+P
 txtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A2c65tDAbj14lGL/ycGVvF4tProvIRMiix3SHQuwl20=;
 b=Q2PTveW0ODExHPD0CIEdW9WBxbjisevpRZnvHxDfIeY7+6CQKS0KIkesw7e52MRj/i
 q1pPhYb3bCbNqa3Hgt2Ue9sicIbVpQboDDeqcq1QBgXuCWam0ZBXX5oR3bozdqGlmQTP
 G7saKbzfdfAlJiz+e0E5N0k2mIofe8n3FnlAO9R1nW9Wxz3ZEWZJYBxc5OV3Tng9a8Oc
 jMocdsGSsK/s9PLknkioM1N+cDqDFu2OLU2zKpyyd8Og1/e8VyaNgQJUmsiDTSmqcQk5
 Wak4hLeHKSkAuV6j8IEnKr+MI2KYmCpF4pWyKqxl1kLGg4wSTHu0kwYZ9pJGeLf8v9y4
 OSfw==
X-Gm-Message-State: AOAM5308GtcOfIAe2PIU8YPqW/WvrN1VThrAbnDf+GwcdHjPby89SNB0
 9SVOV0AgNraEdTGyVLiosqbi/mhGEqjTtL1Q
X-Received: by 2002:a5d:6da9:0:b0:20a:e1a1:7f0d with SMTP id
 u9-20020a5d6da9000000b0020ae1a17f0dmr8030547wrs.378.1651058292887; 
 Wed, 27 Apr 2022 04:18:12 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id
 d17-20020adfa351000000b0020adbfb586fsm8313104wrb.117.2022.04.27.04.18.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 04:18:11 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com
Subject: [PATCH 2/2] hw/arm/smmuv3: Add space in guest error message
Date: Wed, 27 Apr 2022 12:15:45 +0100
Message-Id: <20220427111543.124620-2-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220427111543.124620-1-jean-philippe@linaro.org>
References: <20220427111543.124620-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x42c.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yD6bOkMyQxIj

Make the translation error message prettier by adding a missing space
before the parenthesis.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/arm/smmuv3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 8b1d8103dc..3a989b09cb 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -786,7 +786,7 @@ epilogue:
         break;
     case SMMU_TRANS_ERROR:
         qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s translation failed for iova=0x%"PRIx64"(%s)\n",
+                      "%s translation failed for iova=0x%"PRIx64" (%s)\n",
                       mr->parent_obj.name, addr, smmu_event_string(event.type));
         smmuv3_record_event(s, &event);
         break;
-- 
2.35.1

