Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1845781njb;
        Thu, 6 Feb 2025 14:13:05 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWGHniXcKfKIy0rv2tXNfTqB3YduHQkOphEIzCNoVQShRPI92a6BTzvg3nM88tjQkf5GB/QIAiAnnHY3g==@linaro.org
X-Google-Smtp-Source: AGHT+IGPK0stUrR9Z0BeEeexM/mCUcNPe8QVSv3AjI47rHGOH+4UHLa/y4zqWT96ima3LyAMyVNd
X-Received: by 2002:a05:6214:2a4a:b0:6d9:15c3:42c9 with SMTP id 6a1803df08f44-6e439ab6a06mr76150846d6.7.1738879985374;
        Thu, 06 Feb 2025 14:13:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738879985; cv=none;
        d=google.com; s=arc-20240605;
        b=jdc8lHFbxfZBD8MAX9qUOZLvWTTfG2VbPRVOAdXgg+VaNQNF42zy0jlVsR6JgrrSpt
         pMCAB5+AfbAetw0U1UFBGzQISRonEYNu+5G10Y4TNlZUPxqRB/CDMvUTQtO7ffka9Z/G
         SWlZDv2SlbYSBeohfl1MGehqzsVRvl0tG7erskZffnbvn1f7ne3hVf9KSL12Nn7rHNz/
         0Xi+eJgryIgYE2vUdDIbrnQsanlTg/CK0wouCsumQjKqHHqdqef0yKQNp2SXqBjx1EbQ
         0OSGuN2gyGte8015uLAWG6nUyAO9RS8+mgTgd7+xQ1P/xRZ1BDFj6mmsyOKxKe55+2JR
         JECw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=YGB3Wz1lhXJZgFE3yJDLH0YHrZy/Ctj0hcun0JpjWOE=;
        fh=kzdqXtl7N8uv1Lwq7hlL5fC94fSEDoLPiN/GOnEaSQk=;
        b=N/+CvF7RDq1zkjwXGqf9wy/NlPIOB3C348ivXJPBChPZTIJmYhCrncuBQ8OyV3paYJ
         Q20K3l2ZOjFEqBamf3JW0CtF/0bYBVq40PnR5hLNc68RPTjaYvy2LJdWWx/4BRm3yoRK
         rukx/3NJjt83GMQQ7YchtywHzA7YPwcvXXNkwdVOx+1Ri2XB2hVPl7pbWcuOx/f2IoDX
         si/NjF02o78ExqoZKAfbGPXQHTd+ypyh5xmd4lJ2fxtVLTjcq2sIdoJ+eCAqoMAzPAJD
         57FDo79Bh5WyLgT1vZKkjvW0xFnVCvHNBJaW3Ar0PLOXFybI9m25NSkiXg5iYdvQrUso
         T/Pw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=zatg8nsB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e43ba37466si19494276d6.124.2025.02.06.14.13.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 14:13:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=zatg8nsB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tgA6n-0005hm-Ls; Thu, 06 Feb 2025 17:12:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3vjOlZwgKCv01zmftyxmlttlqj.htrvjrz-ij0jqstslsz.twl@flex--wuhaotsh.bounces.google.com>)
 id 1tgA6c-0005bb-Jv
 for qemu-devel@nongnu.org; Thu, 06 Feb 2025 17:12:19 -0500
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3vjOlZwgKCv01zmftyxmlttlqj.htrvjrz-ij0jqstslsz.twl@flex--wuhaotsh.bounces.google.com>)
 id 1tgA6a-0001QH-7h
 for qemu-devel@nongnu.org; Thu, 06 Feb 2025 17:12:17 -0500
Received: by mail-pj1-x104a.google.com with SMTP id
 98e67ed59e1d1-2f9fdc4dc84so2856981a91.2
 for <qemu-devel@nongnu.org>; Thu, 06 Feb 2025 14:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1738879934; x=1739484734; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=YGB3Wz1lhXJZgFE3yJDLH0YHrZy/Ctj0hcun0JpjWOE=;
 b=zatg8nsBe0nTWcQXoS9WJfpYhBEe4R+8woSZuTyiQHZ55avrxvc1IjDOsjstgoFNSz
 fPPE78AL5sbT9AytDh/fFBMFz82/h0q3gSpFGLV30rY0GCdJBQ2YPJg/JpYpw9AACGhZ
 VGECa2tl3Q6OdSHY4VISi2j5rSo5Sq/Y/nsQoD1zPtUXq2dDjbAvzchxdGqVR5iQC2FK
 7ijQrhmtABYrxmEAN/EL8RAxhZOzl3fXmRm81Wx1Y//+RXz0sEOMUdzG5ashpAZAvHqC
 aoU/XHf3CPZmnHg5ZAytkuvvUa8DVpqFT9m3OzLZv9k7Vpua+4nniE2REcSY2W/5njks
 o9vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738879934; x=1739484734;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YGB3Wz1lhXJZgFE3yJDLH0YHrZy/Ctj0hcun0JpjWOE=;
 b=ML1Ii0Q/vMa00yAJ3heWaw1ywYmIqHcPhj8FcIq9jo5+z+J+sjfcjHLyvv8WYNtF5p
 HmgjGOxZJracvcJ1ENof7QEKLKKLlEpscJgMbs9HSdb+b49+ObGR9J6r0IAUBweEWnSN
 0WySRbZIH+jVnweBJpUCxCRfID2itASsojnzm9L6XImllrlTmeIJ7uImfviYQvy6fHCJ
 bSagxNDzuYERY17TmQYd9YGwv/s8VgEp0oIqQq7c6lydkp5WNcBefyA4tFAvTzvSO/Io
 YfnIaqx5bUmiCi6oKdPHaTiMhDEUl0tYAweCFsb2ZhTr09vWWP4jAoV/8LmnDikiCV3h
 2n+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXK8FdPrH6ERb4CqgSF4OaCdWjjaOr3AxxrQoBV1fuibMBX24MwjjdujycgfMDSnPd1W4ZPzeR11EMQ@nongnu.org
X-Gm-Message-State: AOJu0YyIVQqZUHsREJl9X258dmwjQDNds2Qbn3TkkC7uNQ3pLl3C4pJU
 KINGXY62PrzfNNicOavRUd38pWcEcYs7OO4TZriC918PH1Knvg+Mq1/1m7023a1GdjVXqucz146
 Hc35fhTwuIg==
X-Received: from pjbsp6.prod.google.com ([2002:a17:90b:52c6:b0:2ef:82a8:7171])
 (user=wuhaotsh job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2309:b0:2ee:ead6:6213 with SMTP id
 98e67ed59e1d1-2fa242766b0mr1117685a91.19.1738879934091; 
 Thu, 06 Feb 2025 14:12:14 -0800 (PST)
Date: Thu,  6 Feb 2025 14:11:50 -0800
In-Reply-To: <20250206221203.4187217-1-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20250206221203.4187217-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <20250206221203.4187217-5-wuhaotsh@google.com>
Subject: [PATCH v4 04/17] hw/misc: Rename npcm7xx_gcr to npcm_gcr
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, titusr@google.com, 
 chli30@nuvoton.corp-partner.google.com, pbonzini@redhat.com, 
 jasowang@redhat.com, alistair@alistair23.me, philmd@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::104a;
 envelope-from=3vjOlZwgKCv01zmftyxmlttlqj.htrvjrz-ij0jqstslsz.twl@flex--wuhaotsh.bounces.google.com;
 helo=mail-pj1-x104a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: zXBe2raD8IF4

NPCM7XX and NPCM8XX have a different set of GCRs and the GCR module
needs to fit both. This commit changes the name of the GCR module.
Future commits will add the support for NPCM8XX GCRs.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 hw/misc/meson.build                           | 2 +-
 hw/misc/{npcm7xx_gcr.c => npcm_gcr.c}         | 2 +-
 include/hw/arm/npcm7xx.h                      | 2 +-
 include/hw/misc/{npcm7xx_gcr.h => npcm_gcr.h} | 6 +++---
 4 files changed, 6 insertions(+), 6 deletions(-)
 rename hw/misc/{npcm7xx_gcr.c => npcm_gcr.c} (99%)
 rename include/hw/misc/{npcm7xx_gcr.h => npcm_gcr.h} (96%)

diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 55f493521b..554eb8df5b 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -70,7 +70,7 @@ system_ss.add(when: 'CONFIG_IMX', if_true: files(
 ))
 system_ss.add(when: 'CONFIG_NPCM7XX', if_true: files(
   'npcm7xx_clk.c',
-  'npcm7xx_gcr.c',
+  'npcm_gcr.c',
   'npcm7xx_mft.c',
   'npcm7xx_pwm.c',
   'npcm7xx_rng.c',
diff --git a/hw/misc/npcm7xx_gcr.c b/hw/misc/npcm_gcr.c
similarity index 99%
rename from hw/misc/npcm7xx_gcr.c
rename to hw/misc/npcm_gcr.c
index 07464a4dc9..826fd41123 100644
--- a/hw/misc/npcm7xx_gcr.c
+++ b/hw/misc/npcm_gcr.c
@@ -16,7 +16,7 @@
 
 #include "qemu/osdep.h"
 
-#include "hw/misc/npcm7xx_gcr.h"
+#include "hw/misc/npcm_gcr.h"
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
 #include "qapi/error.h"
diff --git a/include/hw/arm/npcm7xx.h b/include/hw/arm/npcm7xx.h
index 4e0d210188..510170471e 100644
--- a/include/hw/arm/npcm7xx.h
+++ b/include/hw/arm/npcm7xx.h
@@ -24,7 +24,7 @@
 #include "hw/i2c/npcm7xx_smbus.h"
 #include "hw/mem/npcm7xx_mc.h"
 #include "hw/misc/npcm7xx_clk.h"
-#include "hw/misc/npcm7xx_gcr.h"
+#include "hw/misc/npcm_gcr.h"
 #include "hw/misc/npcm7xx_mft.h"
 #include "hw/misc/npcm7xx_pwm.h"
 #include "hw/misc/npcm7xx_rng.h"
diff --git a/include/hw/misc/npcm7xx_gcr.h b/include/hw/misc/npcm_gcr.h
similarity index 96%
rename from include/hw/misc/npcm7xx_gcr.h
rename to include/hw/misc/npcm_gcr.h
index c0bbdda77e..9b4998950c 100644
--- a/include/hw/misc/npcm7xx_gcr.h
+++ b/include/hw/misc/npcm_gcr.h
@@ -13,8 +13,8 @@
  * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
  * for more details.
  */
-#ifndef NPCM7XX_GCR_H
-#define NPCM7XX_GCR_H
+#ifndef NPCM_GCR_H
+#define NPCM_GCR_H
 
 #include "exec/memory.h"
 #include "hw/sysbus.h"
@@ -70,4 +70,4 @@ struct NPCM7xxGCRState {
 #define TYPE_NPCM7XX_GCR "npcm7xx-gcr"
 OBJECT_DECLARE_SIMPLE_TYPE(NPCM7xxGCRState, NPCM7XX_GCR)
 
-#endif /* NPCM7XX_GCR_H */
+#endif /* NPCM_GCR_H */
-- 
2.48.1.502.g6dc24dfdaf-goog

