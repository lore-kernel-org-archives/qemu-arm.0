Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp1552994njb;
        Wed, 19 Feb 2025 10:46:46 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVlxeALVVuAFssnzTD0g5L/5QDJx1Rnvjpm1HB5k+WxMRVonjcU7eNePY2ANcGdGLHMSEhQIaDA5MnYPA==@linaro.org
X-Google-Smtp-Source: AGHT+IEYfq9pJOuurdSTsVel0GcsK4mbdk8U+OSxXGytpJlHtasvikC+49hVZkZXiLdLUPXZV5qc
X-Received: by 2002:a0c:e808:0:b0:6e1:715f:cdf5 with SMTP id 6a1803df08f44-6e6a25dc575mr4559056d6.15.1739990806338;
        Wed, 19 Feb 2025 10:46:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739990806; cv=none;
        d=google.com; s=arc-20240605;
        b=OXaDgp4qBYViqmne0I0DQpO0w55Jp9LaL69LPdUCaC10ihRD/wZvJUZZrVMFDiEGNw
         gIKNg9BiD1X2rc5ngIlbr1R9I3DWx/mMkUqjaZKQ8bPUd5vSfcCzrA3g3+hkUsztPsCn
         Mif2MZ/VU2TpEY0did/Co6ljFeOMhip3sMdWxsi+c/oIxjKsmUNfu+2PCRgo3XBfCi1/
         h3P+l3kZacG/0qv79VQILc0z7BNn7HRLlED/v80PSWmBzRWpUuvNRM71YUybpo67vmEF
         7F6r2BRGrz6R+4x34vKCCuw7fLgYrnyIca2bTB6//ugaGaeDrja2EWd9aVb5+nk0cRbH
         bL7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=HBwUiikiGOfgCxanP9f6qzV84BwbvfIj1V8/CZyi2UA=;
        fh=biy2AaKCbwpAZ/Lk7Qechxb9C3WSrIx4CYh+Y6obQL0=;
        b=ill4eOLXC2MU12irWP1L2s/budr2q+wwuiFQeMpDD9n99B5tncPtTSA7uBg6UqToex
         pAekxTIzpaLDuX1VG0muL8RtHn0HyYnXzNY04BhOGdJs4NA83QHR+wZ0CqnkfLHYbfaD
         n1snYboecta3aJEa2GHYdKFlc+TLnUaXnPxbKW11hmZ+6MkVdtZxH4HV3+8CzeoSqpeM
         UpURcT5Nll1qCxk7hl2Wo8+anXdGeaRJGtVxhSfOsvfIsAOqMzkR5pDN/f4gEyaOK4o0
         KNjNsewUnIqsAtBAxOmvYO+3WUQFGTin4Ml91zkZGPHzQSv6bD6Xqrl52HnRu+UCk4rP
         UiIQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="Tj6/E4/5";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e65d9d1626si133463626d6.505.2025.02.19.10.46.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Feb 2025 10:46:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="Tj6/E4/5";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tkp5k-0002zx-Ix; Wed, 19 Feb 2025 13:46:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3Bie2ZwgKCHEljWPdihWVddVaT.RdbfTbj-PgbcdcVcj.dgV@flex--wuhaotsh.bounces.google.com>)
 id 1tkp5f-0002wf-QX
 for qemu-arm@nongnu.org; Wed, 19 Feb 2025 13:46:36 -0500
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3Bie2ZwgKCHEljWPdihWVddVaT.RdbfTbj-PgbcdcVcj.dgV@flex--wuhaotsh.bounces.google.com>)
 id 1tkp5c-0004hu-Sl
 for qemu-arm@nongnu.org; Wed, 19 Feb 2025 13:46:34 -0500
Received: by mail-pj1-x104a.google.com with SMTP id
 98e67ed59e1d1-2f46b7851fcso301743a91.1
 for <qemu-arm@nongnu.org>; Wed, 19 Feb 2025 10:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1739990790; x=1740595590; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=HBwUiikiGOfgCxanP9f6qzV84BwbvfIj1V8/CZyi2UA=;
 b=Tj6/E4/5w43q/ct9FeX/ZakTNUMhDfYy0nDc4704cNTUpxWSmXaoQVGYXw/bcXlae9
 Sbhv0LH6pIJewzr2n3s2axcKgU61LAaNgy3dPjH6wUNWTlLAXz6pq4k/3pIMzim3psxs
 v3Y9zwZhiXdycfiuds8CDW7AWmTX93XkKCfgqwhqGXRJ40tf0L4uTj1LtVRxbEdalS+x
 4hW23Me7ly8lqGbVgJll156UUvf64zH5hUWK+DebTv8K+xTrvW6Nd3h66GbHHZvv30c5
 yYKgBVl2EAdlcIOw5PZirV5DWXsPEG8OxuB0cgZO4X5YI9IU3EHT0S4N8hTaUg64y7Ww
 a63g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739990790; x=1740595590;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HBwUiikiGOfgCxanP9f6qzV84BwbvfIj1V8/CZyi2UA=;
 b=E86wvVOZDOS/8guRSTCKwkFeg+7wzNKkRbX/ulrzExNIpKNYbxO6rFZgGFCfZ9Q8RD
 wmqBA+PBa5HIWKxgEnDHUNfy66ABxbUO0BeqcLLzsvXMSccAnx034TP05BBpucpgSbAs
 jf4rs60SM11++xliy6EbXKRivqoNogmwx7k5N/DNnbb903p8nxTekYwl9Ca7Fylggyz/
 9TAIrN1JOtmkUccoXMOLmIjoxOgSlOXoW/Sizw/TNCApZZulvd0Bm9O1f2VMqeGcPN3v
 TWfe/mTkS3e3sv6F1xvb61n0ZMTZlMYWKzokYPzjGZZc7SipGDUK+/YVUkpTE3191p1c
 GVag==
X-Gm-Message-State: AOJu0YzwWJipM4bTfhTClGFiRiwGD5n2F7WZwBKmKTzU5H9KB6yKWnyw
 4PK0GSSZ66jYQR2i3Kr6ywZ8HoD90mVqOx/vvz6VE2u3ySQOnxxmdGXkatTNkHtWZQBWKZs9ouN
 2IRoKWu0zUA==
X-Received: from pjg8.prod.google.com ([2002:a17:90b:3f48:b0:2ef:82a8:7171])
 (user=wuhaotsh job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90a:e7cc:b0:2ee:5bc9:75c3 with SMTP id
 98e67ed59e1d1-2fc40c1d6e4mr27228277a91.5.1739990790450; 
 Wed, 19 Feb 2025 10:46:30 -0800 (PST)
Date: Wed, 19 Feb 2025 10:45:55 -0800
In-Reply-To: <20250219184609.1839281-1-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20250219184609.1839281-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
Message-ID: <20250219184609.1839281-5-wuhaotsh@google.com>
Subject: [PATCH v5 04/17] hw/misc: Rename npcm7xx_gcr to npcm_gcr
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, titusr@google.com, 
 chli30@nuvoton.corp-partner.google.com, pbonzini@redhat.com, 
 jasowang@redhat.com, alistair@alistair23.me, philmd@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::104a;
 envelope-from=3Bie2ZwgKCHEljWPdihWVddVaT.RdbfTbj-PgbcdcVcj.dgV@flex--wuhaotsh.bounces.google.com;
 helo=mail-pj1-x104a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: AMhqd4eJ8nF7

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
2.48.1.601.g30ceb7b040-goog

