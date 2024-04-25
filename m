Received: by 2002:a17:906:c0c2:b0:a52:4db9:938b with SMTP id bn2csp1280795ejb;
        Thu, 25 Apr 2024 04:06:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWmNc1/aO2mUpBpsGEpUbFsl7zWZV3sKKm89hIuxArMP5RI0GhhBDIPn5sVecIZ5+4PFmWOPM+emwYIEvBrNh8yy/kwU/yD
X-Google-Smtp-Source: AGHT+IHcWGSIPhat3YYplLBqRiJ0bD1Cvb757DB8Z1xXmfLxrzgGgoHUvSFHZbXJTnO2zPAk1P2L
X-Received: by 2002:ad4:4ee9:0:b0:6a0:a06f:332b with SMTP id dv9-20020ad44ee9000000b006a0a06f332bmr1923762qvb.17.1714043171488;
        Thu, 25 Apr 2024 04:06:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714043171; cv=none;
        d=google.com; s=arc-20160816;
        b=CEqJUJcgUItSGk2WooXDdXfppytmkNE7V7OYZ3nben4eB3paJ85jB/xEffTuS8PMBB
         iYVMAGmoHCmVp78g9I9a+HKeehsSJp6Ia9lW6QEh91dRqx7cD8uBuhTIzB5EaJ8jChyG
         jTKAMdWic9/rfyQZgnazsEeFk/kJGBYjFYRZM/Lu1IzyhJ7bymkeba+XlxjsXD44rN+j
         ujNIpAPYmHnn8KsHWFxepj+J5DRpKuWorO3LSI5ii9uHAwaiqUOGYc0kyuo3DqA/07A/
         XOX9NDO4r90adSqvxlIlvRA7UF1aHFKzDh05l0f5hKQQutx27fD9R9p2rx+WDm1sj6JR
         1wMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=8bJ1N9o6y+S8lNsIITbhbB1Udo8RPNY/z42IZN8n3uY=;
        fh=0/JVPH+45iPmEYqun5BjBLfJZs9+cI7lPo8sZDfCyNA=;
        b=vC8oAUfY0DRZg3vw9FJAArhij8vQ8bqkIA5cwrFM/VhJVeJ0Hjc/6J80EwGPTLx5Hi
         oB+NPvXY061G4ujc/gMESvih4COhP11VZLr7XobcyQ0nPfq6J+klPAz8LdnjuCyWm7bc
         By+yPrNy9n4rzF7D+YTbN58BFbMC1OM1Qt2uqG4xmqyYopaE/hfh432AAMxVmEdOlg8Y
         g5ZgQ9ocO2N4+mYg2v05gWevh2YQm4gE6sG01AmNQ+0vfXQskNrUz4KBfEmKf8qbaWSP
         oBS3EhAWcHGyVa95QciwqhoykpJok757PSwCGEbV8tGVlPZY0MxJyWxwmR2ka37mH2CP
         bj7g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o9e2Jvch;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jm14-20020ad45ece000000b0069b413eafdcsi16948725qvb.130.2024.04.25.04.06.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Apr 2024 04:06:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o9e2Jvch;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rzwtz-0001p4-Cc; Thu, 25 Apr 2024 07:04:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rzwsq-000057-3r
 for qemu-devel@nongnu.org; Thu, 25 Apr 2024 07:03:38 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rzwsn-0000AB-Fr
 for qemu-devel@nongnu.org; Thu, 25 Apr 2024 07:03:19 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-41a77836f16so6566255e9.3
 for <qemu-devel@nongnu.org>; Thu, 25 Apr 2024 04:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714042994; x=1714647794; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8bJ1N9o6y+S8lNsIITbhbB1Udo8RPNY/z42IZN8n3uY=;
 b=o9e2JvchHg5dfWSh/z2SQMfNy0QkVIe91WIGmoHqe2VYBytEsQZxCyuy43VUT0Cvqg
 BOgDlE/7pATxN5NYjfW62/PeVsTPMm9SlQT4ksgbfOo5RRSGINZQBeMEx8al0LBuegIM
 SVc5Vd0glybBwHQjgzkjJqsznfmrj/z7Hmn0+obklXI2F8iShdJeskrCdmvX6cfaoabm
 R6eLWEA6UcsMFBjiIf8Bfjh1WN2Xhw6dVB3sjfhBYupFiJPtBipofJpW97qjmybVBf9O
 +9NPuqaXFYYQ+TiIj+v4OIsqTZEGbeqIVpD5t0YH3YN+Cpvt+RYx1K41qzhwL1ior+OY
 Sdrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714042994; x=1714647794;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8bJ1N9o6y+S8lNsIITbhbB1Udo8RPNY/z42IZN8n3uY=;
 b=l8Z+WVCvL7X5pPgTBSgm1CwRWEPo9v5ttnqxpZFFfGvgPFWC01zDONOEbp8rxzAwNb
 QKR4bZ0uU0pR2TO4m66+VPtaaJ7G8V+LtCRmVM5WwsnVowiScp7Pbk2VtsitcHSTc3U5
 PHGH6hJ1Zz/eZWQgw7SDehMoFLYn7twseR0twFB3ZebSOkbzRHtZSMM+KPQbg5nbDZ3n
 4GALWihaQc6mCot52MrchUpfIppz84cA2irCvOVHUwN1YWhKEbShz1rBJeg2KGIZ/nfN
 JivmTixVb06sYc9RXlQ/+KBEJ3mmZOB2Tjwt4MjusqulW0m1tz9xCTy5oPORnOgAfStE
 +w7g==
X-Gm-Message-State: AOJu0Yy9l/E6q38fXm9DZ27lWKoeuZAuLgNp+iScC1EtKO9hFj0bT6uA
 LtJeej1XbKSuZqby/FcAEDKHyrGdNWu15c9JCACwALBABEJHwW89gCxRvBCOvTnnBjP9f5K5DtV
 p
X-Received: by 2002:a05:600c:35c7:b0:418:a7a7:990f with SMTP id
 r7-20020a05600c35c700b00418a7a7990fmr4300251wmq.13.1714042994514; 
 Thu, 25 Apr 2024 04:03:14 -0700 (PDT)
Received: from localhost.localdomain ([92.88.170.77])
 by smtp.gmail.com with ESMTPSA id
 fc19-20020a05600c525300b00418981b59d4sm31049322wmb.10.2024.04.25.04.03.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 25 Apr 2024 04:03:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>, Fan Ni <fan.ni@samsung.com>
Subject: [PULL 13/22] hw/cxl/cxl-cdat: Make ct3_build_cdat() return boolean
Date: Thu, 25 Apr 2024 13:01:46 +0200
Message-ID: <20240425110157.20328-14-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240425110157.20328-1-philmd@linaro.org>
References: <20240425110157.20328-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: uJGIUGyQhAC0

From: Zhao Liu <zhao1.liu@intel.com>

As error.h suggested, the best practice for callee is to return
something to indicate success / failure.

So make ct3_build_cdat() return boolean, and this is the preparation for
cxl_doe_cdat_init() returning boolean.

Suggested-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Message-ID: <20240418100433.1085447-3-zhao1.liu@linux.intel.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/cxl/cxl-cdat.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/cxl/cxl-cdat.c b/hw/cxl/cxl-cdat.c
index b3e496857a..e7bc1380bf 100644
--- a/hw/cxl/cxl-cdat.c
+++ b/hw/cxl/cxl-cdat.c
@@ -44,7 +44,7 @@ static void cdat_len_check(CDATSubHeader *hdr, Error **errp)
     }
 }
 
-static void ct3_build_cdat(CDATObject *cdat, Error **errp)
+static bool ct3_build_cdat(CDATObject *cdat, Error **errp)
 {
     g_autofree CDATTableHeader *cdat_header = NULL;
     g_autofree CDATEntry *cdat_st = NULL;
@@ -58,7 +58,7 @@ static void ct3_build_cdat(CDATObject *cdat, Error **errp)
     cdat_header = g_malloc0(sizeof(*cdat_header));
     if (!cdat_header) {
         error_setg(errp, "Failed to allocate CDAT header");
-        return;
+        return false;
     }
 
     cdat->built_buf_len = cdat->build_cdat_table(&cdat->built_buf,
@@ -67,14 +67,14 @@ static void ct3_build_cdat(CDATObject *cdat, Error **errp)
     if (cdat->built_buf_len <= 0) {
         /* Build later as not all data available yet */
         cdat->to_update = true;
-        return;
+        return true;
     }
     cdat->to_update = false;
 
     cdat_st = g_malloc0(sizeof(*cdat_st) * (cdat->built_buf_len + 1));
     if (!cdat_st) {
         error_setg(errp, "Failed to allocate CDAT entry array");
-        return;
+        return false;
     }
 
     /* Entry 0 for CDAT header, starts with Entry 1 */
@@ -109,6 +109,7 @@ static void ct3_build_cdat(CDATObject *cdat, Error **errp)
     cdat_st[0].length = sizeof(*cdat_header);
     cdat->entry_len = 1 + cdat->built_buf_len;
     cdat->entry = g_steal_pointer(&cdat_st);
+    return true;
 }
 
 static bool ct3_load_cdat(CDATObject *cdat, Error **errp)
-- 
2.41.0

