Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1333514ejc;
        Fri, 13 Oct 2023 00:59:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGY1/ITFIe8HoY2POwrmOwpXhg/yeS9NkCGIKQUsR7P+xcP5VDC/DkZau8mzjPJc+2coF0I
X-Received: by 2002:a05:620a:4251:b0:775:a44b:6513 with SMTP id w17-20020a05620a425100b00775a44b6513mr29926449qko.16.1697183943971;
        Fri, 13 Oct 2023 00:59:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697183943; cv=none;
        d=google.com; s=arc-20160816;
        b=ujdUOQa5WRg92Bcrc3CYlVPl9R+j+MLhCEsq0UoJ1v9UcGdOIJb53XvuvmRY3CFp7h
         ifdJp8Ep21m2dCT0qO2PY64H3TtlX4p7XXnVh+bKi5VgW/+bKsKPezBG4iqDLX5nlqSw
         QFg5RwZXnzHdHV60/mt87BIgdLMNgpHVNWFFlz+l0QlHeqnHpSi4ojbJV/kcyGlirbqH
         p0U2+u+HSQEycvyqhxM2gEDLW7e+u8L1QZMQSfYlFVKKPdSfVtGDabJl2hgn/zFAwWjH
         w2XRzjABnR3ujTzSBV6JaykVZK7/T//WZgE5im7i5la5UUVnLm3NMaFRyM8ofoU8lCww
         uIpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=3ONrF169gffnN0Ooe5lkieW/R6eKM+PaGfalQnkEes4=;
        fh=+ZsZUTuyxoQ5ZtM1/3hdknpz4V7RB/CRpE4IdMKqcXk=;
        b=vLxyjJj+Ti5+pXP0gb+DcFKfiJv4v520bu47VUXTg73IIJkX9mmLLsNSazVOL18nmJ
         75YmGiQt9jWrREOzHRJZhMg2fK816bnKWzePz02NWVLHTod4iFkiJILbRhYtCpmM/p+I
         ppdvNyrSgm2QkssjrWI+OiYrwMdBc1mlgBg/wLT108WgpZEgIfTRMVN+ZVueBiXcO26y
         IrsLTpJBllvNaxgbKhwee+puv1zML//8JYwwkdDIHqG/Z5/rA60KFZoYZlJeRwwsljQz
         ZwXtMMquEgUJcUfjkxSGpszaeHSYZdw4cYzEJusNqg8pE5kdt9wE3dAt98x6TloUPnax
         SftQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tSz06HzQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id qs1-20020a05620a394100b00773bb585660si842145qkn.348.2023.10.13.00.59.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Oct 2023 00:59:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tSz06HzQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qrCwM-0004of-1y; Fri, 13 Oct 2023 03:50:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrCwJ-0004eC-AF
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 03:50:31 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrCw3-0004Oo-4a
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 03:50:30 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4054496bde3so18740415e9.1
 for <qemu-arm@nongnu.org>; Fri, 13 Oct 2023 00:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697183413; x=1697788213; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3ONrF169gffnN0Ooe5lkieW/R6eKM+PaGfalQnkEes4=;
 b=tSz06HzQQ6QR448WPVxneN7xc6R5E5UnD67EZNJN6FQCeS9fjnrVDsKSdVfBeThUK0
 zATIuiwqtoyuxxpR1TpaZHYhICi9p9PYHIJp6cT5MebkXI4ksIYnBGreyF2+x0WEGvUB
 YlN3kMP5tU8kRzxncBl8wHJMxf3D7yybUNueP0wmV5GkBSGrG8yJc8BVN97Okga6bfc/
 mVaxk8T7znfNDO1wr8VNAExG6v+sT5YnnBUDpduNqULfBX0YpxMDJMRYW86wgSnxFxUI
 rt2L7uvo16takADkz+/djIQG+MQtl/pNAoO1ShccWJaJz613+p/NyaYa2u90E0wfFPjv
 Nqnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697183413; x=1697788213;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3ONrF169gffnN0Ooe5lkieW/R6eKM+PaGfalQnkEes4=;
 b=kEP3rR9sl/TUnKj1qJ6wHCnsF0Oqiwy+TUIAwC0iz/nfQxsxlPo+YYQOvOede8ybJq
 Wovry1mBcArSg73y6wnSE9RTikN4h36hwwfje5zWzkOfxEvHBkQ0/3RNW5dZkzHSxk2h
 DF65iOeflvnLR7M5SNUKioJIqe5NmZ2k9fZDwCLAu9qnnAkX16IuFGd8ysEqx/uBjHKM
 a2WB24/5YNJ3zYj7WnpXRSvioU7Rw1qjS3CeeSDkjn4wCzFNHq4ZoZ1bRuFAz5FtfAKp
 +HXHkW0UlLxGoPsb7+FqiDPMpXlPC0AhkhIkyawhBZ/R/F4inPiZOnQqDglxDj/v6bbn
 cPSg==
X-Gm-Message-State: AOJu0YyA5UoG2BH5ZfR0GrsaiPYEi6PG0SH183jwdiyE7gig1jkKNnoI
 C9JFiQkGsn34ts1HLqNaRJ6xaA==
X-Received: by 2002:a5d:5b1b:0:b0:329:6e92:8d73 with SMTP id
 bx27-20020a5d5b1b000000b003296e928d73mr20173227wrb.67.1697183413740; 
 Fri, 13 Oct 2023 00:50:13 -0700 (PDT)
Received: from localhost.localdomain (adsl-170.109.242.226.tellas.gr.
 [109.242.226.170]) by smtp.gmail.com with ESMTPSA id
 m8-20020adfa3c8000000b0032d7fde2d3csm7990663wrb.79.2023.10.13.00.50.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 00:50:13 -0700 (PDT)
From: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-block@nongnu.org
Cc: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: [RFC PATCH 14/78] util/error-report.c: add fallthrough pseudo-keyword
Date: Fri, 13 Oct 2023 10:47:18 +0300
Message-Id: <7dc547f2966ad838d6a417b29589e592c76e99b5.1697183082.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1697183081.git.manos.pitsidianakis@linaro.org>
References: <cover.1697183081.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wm1-x32e.google.com
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
X-TUID: GNqftMqCVGr6

In preparation of raising -Wimplicit-fallthrough to 5, replace all
fall-through comments with the fallthrough attribute pseudo-keyword.

Signed-off-by: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 util/error-report.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util/error-report.c b/util/error-report.c
index 6e44a55732..acb66420de 100644
--- a/util/error-report.c
+++ b/util/error-report.c
@@ -353,36 +353,36 @@ static char *qemu_glog_domains;
 static void qemu_log_func(const gchar *log_domain,
                           GLogLevelFlags log_level,
                           const gchar *message,
                           gpointer user_data)
 {
     switch (log_level & G_LOG_LEVEL_MASK) {
     case G_LOG_LEVEL_DEBUG:
     case G_LOG_LEVEL_INFO:
         /*
          * Use same G_MESSAGES_DEBUG logic as glib to enable/disable debug
          * messages
          */
         if (qemu_glog_domains == NULL) {
             break;
         }
         if (strcmp(qemu_glog_domains, "all") != 0 &&
           (log_domain == NULL || !strstr(qemu_glog_domains, log_domain))) {
             break;
         }
-        /* Fall through */
+        fallthrough;
     case G_LOG_LEVEL_MESSAGE:
         info_report("%s%s%s",
                     log_domain ?: "", log_domain ? ": " : "", message);
 
         break;
     case G_LOG_LEVEL_WARNING:
         warn_report("%s%s%s",
                     log_domain ?: "", log_domain ? ": " : "", message);
         break;
     case G_LOG_LEVEL_CRITICAL:
     case G_LOG_LEVEL_ERROR:
         error_report("%s%s%s",
                      log_domain ?: "", log_domain ? ": " : "", message);
         break;
     }
 }
-- 
2.39.2

