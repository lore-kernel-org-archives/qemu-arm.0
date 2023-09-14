Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp577497ejb;
        Thu, 14 Sep 2023 07:58:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHp6aEyhZpOXzSXHm/7UofFabI4C0mWWXdKkNloSOHNk3cuPZocd4qLXan7ib4Cd4AYzQqu
X-Received: by 2002:a05:622a:44a:b0:413:21d0:19d4 with SMTP id o10-20020a05622a044a00b0041321d019d4mr6958489qtx.63.1694703523559;
        Thu, 14 Sep 2023 07:58:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694703523; cv=none;
        d=google.com; s=arc-20160816;
        b=gEFecIEBOPv9lqNUjQKQquO+o53f1DiJJsYlz5KeFVdzJOiyGcY0KRn1ytnhTA6q6M
         yNPJCxA18k9V+Ij9iGmuPYfcr/BwYpPBrm6o2ItxZkFcjUbMhOrAMEMuJkrBHOTY30W/
         a/qOxtPSQ/mVA3JyFo0nALHdr/uMw2OhJp32BLnrn2zfpfrrrkv0h0KiS2qwAruXVk/Z
         eOrHsas2ixAi4fvUh527DWQwGNO6KvOzkrLKpY2VQ2qsOpOmBtMwEJL6SPj6NKhDKdDt
         NbOjKhVu3RI001HILb87vQ1pjnLCVrXWoZ0g3bw+wQDMd1WR9G6R70gSFVBDpUMxtwtl
         rElw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=5tmvXXEw+PIenQIWy8ii+pQoWpYFcR+dhA762ZF8vgU=;
        fh=NY6IStX7ee+XRQ7VxbbREYpTmmSHrTCVjRm7wDQyZLI=;
        b=T75Vqg433beIKVi/NHnxyDkqc1qugBNMIHbkjsIj1KPssu1fc3tWPP/moWAhZKmW1T
         uSoeQE5V0e/5EGLFn7L5yKIcB2pak1hjQUDLBVGKLuNzLqxa7QPz1Oi1mzK5mdIOEu0+
         Jg+9JP0esZ79FF47oLGevlJlNMF4CDRl8lvQ/GydcpGP42j9gBC8H43q4Jm8zZQjslwX
         eKYO00sM/Lr6YXLcJq2kGOuKX8A2kORDoiD+NIHko9YF54klQ4AvWwaGOpVKGKsVZaQu
         1dh+2G5owuAf4ktXyRBRwLtvDKWrkuJk+8+O6Ymw5St39rqZfdEOLCRyJ3BwCblwzVFc
         DIMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yVyqLT6q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fj17-20020a05622a551100b00403cbe7e009si227346qtb.301.2023.09.14.07.58.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Sep 2023 07:58:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yVyqLT6q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qgnmM-00015z-Gc; Thu, 14 Sep 2023 10:57:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qgnmL-00014s-4B
 for qemu-arm@nongnu.org; Thu, 14 Sep 2023 10:57:13 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qgnmI-0004O7-UO
 for qemu-arm@nongnu.org; Thu, 14 Sep 2023 10:57:12 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-403012f27e1so10985195e9.1
 for <qemu-arm@nongnu.org>; Thu, 14 Sep 2023 07:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694703429; x=1695308229; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5tmvXXEw+PIenQIWy8ii+pQoWpYFcR+dhA762ZF8vgU=;
 b=yVyqLT6qz5spH23sy8LP6fT/XWzcglPhIF0vcopmtQsUH9j6qJm7+Jgq5TDIeIm4eo
 F5gsKbyf7nCUKwVzeIkaogSQgZPwUMBCWlB/RnTB1G6d2vYLZrlHBOhlIxmE1l6NS4FD
 8nWW8wtokeqQL/SGEublhpu2Fk6+Q2pvwUaRfaeab8WSBCNQfStW2krLzlbv3lNZnTKg
 jmmIcEVMzXKzxOyJ6P6AGaiZofpGtbukv+qj5YaVzj/iFv6Mnf/TQtNDKFAaDtGM4s4M
 mJjUuthDv2WiE2dEHNPO/caJJfTg25qmL8lbKoyIiOuUBEsTyHzWA26Tw6X2+MmC3lZj
 zKVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694703429; x=1695308229;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5tmvXXEw+PIenQIWy8ii+pQoWpYFcR+dhA762ZF8vgU=;
 b=T8ZcVxUt5zWOoFlk+6H8qmMUlLu1XKodmyhMX1mIsR48nhnpiVT32t7N7GiPhgjEek
 QiUHq7WFAgErbMXsEmrNBM2HSF6dEpBlkdw7MMlCt75odJnSdV2Mhs9lI1G6bEa6G307
 wEab1Xbngji2zQ285FowASDk4oV6sigyuZw8VxXNfmE7fKK4akoZehZ9Uz0f+xW+kFqj
 SERmOBCpeyLQTPYAfQ7IanuFUrQ8Q5/NBsxKlxsslBbz4nSh13BRS9QIu3FnBRhG1L1E
 diFmkniNLu7/FSRXDw2pswdjFR+uvO90Sar3JlfAnYluuZryKLUG2oWCSA48jOyqbXUS
 18Xg==
X-Gm-Message-State: AOJu0Yx9NoXh6ME7XLLFM7bZAx+lelbzZ3A73oHCx8gVJaeKXKjQEagx
 hf2ak/9yn2B6S9DEEUtY07r8Sa9qjnCiK5uCLJM=
X-Received: by 2002:a5d:6211:0:b0:31d:1833:4135 with SMTP id
 y17-20020a5d6211000000b0031d18334135mr4213971wru.28.1694703429214; 
 Thu, 14 Sep 2023 07:57:09 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y15-20020a5d470f000000b0031981c500aasm1978483wrq.25.2023.09.14.07.57.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 07:57:08 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Eric Auger <eric.auger@redhat.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: [PATCH 2/3] hw/arm/smmuv3: Sort ID register setting into field order
Date: Thu, 14 Sep 2023 15:57:04 +0100
Message-Id: <20230914145705.1648377-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230914145705.1648377-1-peter.maydell@linaro.org>
References: <20230914145705.1648377-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: XYnYSOxsmO7b

In smmuv3_init_regs() when we set the various bits in the ID
registers, we do this almost in order of the fields in the
registers, but not quite. Move the initialization of
SMMU_IDR3.RIL and SMMU_IDR5.OAS into their correct places.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/smmuv3.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 1e9be8e89af..94d388fc950 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -278,15 +278,15 @@ static void smmuv3_init_regs(SMMUv3State *s)
     s->idr[1] = FIELD_DP32(s->idr[1], IDR1, EVENTQS, SMMU_EVENTQS);
     s->idr[1] = FIELD_DP32(s->idr[1], IDR1, CMDQS,   SMMU_CMDQS);
 
-    s->idr[3] = FIELD_DP32(s->idr[3], IDR3, RIL, 1);
     s->idr[3] = FIELD_DP32(s->idr[3], IDR3, HAD, 1);
+    s->idr[3] = FIELD_DP32(s->idr[3], IDR3, RIL, 1);
     s->idr[3] = FIELD_DP32(s->idr[3], IDR3, BBML, 2);
 
+    s->idr[5] = FIELD_DP32(s->idr[5], IDR5, OAS, SMMU_IDR5_OAS); /* 44 bits */
     /* 4K, 16K and 64K granule support */
     s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN4K, 1);
     s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN16K, 1);
     s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN64K, 1);
-    s->idr[5] = FIELD_DP32(s->idr[5], IDR5, OAS, SMMU_IDR5_OAS); /* 44 bits */
 
     s->cmdq.base = deposit64(s->cmdq.base, 0, 5, SMMU_CMDQS);
     s->cmdq.prod = 0;
-- 
2.34.1

