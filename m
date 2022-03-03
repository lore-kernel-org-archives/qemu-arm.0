Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp1009322lfo;
        Thu, 3 Mar 2022 12:24:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwvW5qyEIqnf2o6wPEHxIKXeMCvdoI1XdBiry+d1LpqCK9vONUgtl6aKPk6GUi0XvPLI3l3
X-Received: by 2002:a81:64a:0:b0:2dc:12fa:2bb9 with SMTP id 71-20020a81064a000000b002dc12fa2bb9mr8681915ywg.59.1646339062954;
        Thu, 03 Mar 2022 12:24:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646339062; cv=none;
        d=google.com; s=arc-20160816;
        b=uTGyxkGKrH2jOjRl8F8cvh/0LodmnVVT7mlVdgC2Pt99ZiVa8Qe1zFim9oaiUsBM6T
         rHnvbd7sQJaUn2FSw2JYr085HYQ3ddmHVVCL3LWdQ6NVQFBAJtSwNnbNrvJSFXanRtgU
         RSN1DUufphe2IO6/WsrXLMYvccCKO6qAjCqL6VcL2gMubkwTOMC/5QfC7fcjbv4suMDO
         nrhFslnsLEs5j1etm0PQAgLVrcsBPkjBeOR94FXMJ5OjYqM/PMQGKhYvLWlJ5Tp34PZi
         lVrNT57xw4paz1i4lX3rnY6k+1UHSXpSrgCzzz5qy++6SdpN7EXfvPnZkSUb09xrCAXE
         zn5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=BwQur4NZBGGWfHrVPMLWwKCyDvLwx3c9PUY0EKxgx9k=;
        b=Bj/m5kKioGkKq3+U1cES8Pwp963eNaotIc8dealoIQHXbNRIkwUgdZReLPhs/5k10k
         7VGB+yasZNyjZg3hf0cI6Nlr/VeM2tCVrEGFF0lPkBJLI68jSYc0UT1xYCgdQSm3yU5n
         VQrU6oKhpKeaf8ShMo8qcPiDHIRImKr8RidD6MIItfYgn+/YqZw+jMZ5G/mV/B31oSGK
         /GP/7uecLbvaAQtSqZM0KIjiJHD2aN3sLr51BZIH0eOBgKGdVq+cty8hcXPfoW5+k2pY
         Np46VrpDGTrs1Tp78/F195rs+JrlzJO4hqc237H4h/jHsCsMcYrMG/kC0v/rcYLlZnzn
         AALg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dnTyXeu1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 205-20020a8112d6000000b002d634d2220dsi2378768yws.523.2022.03.03.12.24.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Mar 2022 12:24:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dnTyXeu1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nPrzq-00027T-CP
	for alex.bennee@linaro.org; Thu, 03 Mar 2022 15:24:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPrzL-0001ve-1j
 for qemu-arm@nongnu.org; Thu, 03 Mar 2022 15:23:51 -0500
Received: from [2a00:1450:4864:20::32e] (port=51876
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPrzI-0001a0-Gw
 for qemu-arm@nongnu.org; Thu, 03 Mar 2022 15:23:50 -0500
Received: by mail-wm1-x32e.google.com with SMTP id q20so1505376wmq.1
 for <qemu-arm@nongnu.org>; Thu, 03 Mar 2022 12:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=BwQur4NZBGGWfHrVPMLWwKCyDvLwx3c9PUY0EKxgx9k=;
 b=dnTyXeu1Yaiit8GnHMv0BTLnhMuUWGKjNnwyZ6lmKiSXTrd+TuVV72sNBvqSS0Ag2A
 FpRdeJ8+7KgV5TH1M+5jE3/WhiWhRkN6Z0eS5SMiq7U7HC6uI7qA0Tnia6vZjdYYD/ug
 m2o+ls1iCbirTUg2um/VeaHHHRsySaA0pjQLLgXpWLtO/lAYbHKpq1dbt9hi1mtHSXRW
 vwm2Xy32mAsNEY92jj66Op34Ml06WTblylElZNSXPYGwQ8q8Rkom21gNc30fTkt/sdBV
 QKViKUiamVLpiHg5ViTa3hY7QYuTho/Esctg/cDBGPZBYu4FdDK4FwEFV/QjApQw4n1c
 RERw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BwQur4NZBGGWfHrVPMLWwKCyDvLwx3c9PUY0EKxgx9k=;
 b=ZTyUAehGE+zEIuk5y5fbPp1MFZQ1Z9Hoks64wbcdLWlvCjgBXjwPm8XyKrJjQUGpRS
 q5cbEwEhu8QezuGApN3aqpbtY95/QcgHTdOokMb+lT4X6jZ+xjTgivGhqco4R65AEn5f
 zcqs6NKKbCVLhIPu6blLPhpYIWu+EnbEwYD23UQI4tSWJWPoHH8Sdb6SXww+wU3R6GF4
 ajjrMOqk8lq1jzY2gzo6tKFb6w6+nFdKtzPQpmh3e95ihUG9lgnHkAl4FqNkCdLQoeFt
 zj66hnT+viMi53Fyu30ey0KXqFLra4OnG0pMkbLQr3h3ffSkV3Ww+q01jooEWYrcMIYV
 640w==
X-Gm-Message-State: AOAM5326UJJ04HIRZjB6XIo2d6DH4dWyHIPJdeAWFwQBD+Ref5x6yLWy
 XvOenEJzDyCvfaSds5+y4tH8j0s97b48aA==
X-Received: by 2002:a05:600c:3d0b:b0:382:aa17:8f16 with SMTP id
 bh11-20020a05600c3d0b00b00382aa178f16mr5025218wmb.82.1646339027128; 
 Thu, 03 Mar 2022 12:23:47 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 t5-20020adff045000000b001f0684c3404sm517060wro.11.2022.03.03.12.23.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 12:23:46 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 3/5] hw/intc/arm_gicv3: Specify valid and impl in
 MemoryRegionOps
Date: Thu,  3 Mar 2022 20:23:39 +0000
Message-Id: <20220303202341.2232284-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303202341.2232284-1-peter.maydell@linaro.org>
References: <20220303202341.2232284-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: Q3Ex43dGSoXu

The GICv3 has some registers that support byte accesses, and some
that support 8-byte accesses.  Our TCG implementation implements all
of this, switching on the 'size' argument and handling the registers
that must support reads of that size while logging an error for
attempted accesses to registers that do not support that size access.
However we forgot to tell the core memory subsystem about this by
specifying the .impl and .valid fields in the MemoryRegionOps struct,
so the core was happily simulating 8 byte accesses by combining two 4
byte accesses.  This doesn't have much guest-visible effect, since
there aren't many 8 byte registers and they all support being written
in two 4 byte parts.

Set the .impl and .valid fields to say that all sizes from 1 to 8
bytes are both valid and implemented by the device.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/intc/arm_gicv3.c b/hw/intc/arm_gicv3.c
index 6d3c8ee231c..0b8f79a1227 100644
--- a/hw/intc/arm_gicv3.c
+++ b/hw/intc/arm_gicv3.c
@@ -369,11 +369,19 @@ static const MemoryRegionOps gic_ops[] = {
         .read_with_attrs = gicv3_dist_read,
         .write_with_attrs = gicv3_dist_write,
         .endianness = DEVICE_NATIVE_ENDIAN,
+        .valid.min_access_size = 1,
+        .valid.max_access_size = 8,
+        .impl.min_access_size = 1,
+        .impl.max_access_size = 8,
     },
     {
         .read_with_attrs = gicv3_redist_read,
         .write_with_attrs = gicv3_redist_write,
         .endianness = DEVICE_NATIVE_ENDIAN,
+        .valid.min_access_size = 1,
+        .valid.max_access_size = 8,
+        .impl.min_access_size = 1,
+        .impl.max_access_size = 8,
     }
 };
 
-- 
2.25.1

