Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1284436lfj;
        Thu, 5 May 2022 11:46:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1x9PmOPdZBZS25leTh5bkoMP0MuJ54CM5Rs1PRGFSvR/I2AyrCoDxu0XmIMXW+1wOi7XC
X-Received: by 2002:a05:620a:414d:b0:6a0:2035:f097 with SMTP id k13-20020a05620a414d00b006a02035f097mr5846621qko.458.1651776389968;
        Thu, 05 May 2022 11:46:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651776389; cv=none;
        d=google.com; s=arc-20160816;
        b=BZktsV+8LllK9VxNKlVajw6lH7ne7VRRh4kpv0AK0dgJIzatCzeHbhkC2XTZZFRG9k
         xW/nE8UwIgsLLAm5bpti0BCzwzAxlQipp1mXitkFptjFN3LKlxDR/14b1Q2Pcgt8f8Oj
         rSrXEZE1dQdNYNb7LGE4Rr+vCBTf+eAU2RpTWdBGwBe33EKs1ApN5PAeza+ufX+Mnfzk
         hokUY1d850+nSlOoB8LIkrei3HxJCbRJjc1m3/EAJktKAqmP7DyiIW+lQgEbICxAM0+q
         JtIF+CfcKhqicpz5M5LFU+0YUd3O3TA6foi02JV1KPHAvu26XKrdx6VzSgavol+M0SHU
         xu1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=uu7/TC5fWHfFvtIm4oJ7noZYbZtTrG6x0h1sDOIjlLo=;
        b=TTxSLEXtXXAkqD8viJ5elGHbOKsTqvb6WM4LQ1w3ogGNeawQpnToHMY/bT8D1Er72Q
         +r0ZE6lQwkuIngJr0EKAgdSkl3U4VYyUiKH154EtcRle5jR/kreq+tbHUG+S7oZ2y0bt
         FGLvAFHrWraVFgSjGil9jcE1q32pkuvOyM9kjMenqBazgSno7sfVSrhXjMkEi6KdXitQ
         KSWNP6VioMEZQtLJ0UV1j4tqMiKLs8rRY7Ug+FXdXj2/AYwnVvhirkbTXNtLmWTW5ld4
         Bvn9ArtcBGGUAAVx+dFT6z7DyYZRlf2XJIZKZufm2HEu7zacPMqucEIjiz8mK5BO8E2j
         vn+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qI35xtAW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u15-20020a05622a010f00b002f39426a08esi1190151qtw.528.2022.05.05.11.46.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 May 2022 11:46:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qI35xtAW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nmgUf-0004vl-Di
	for alex.bennee@linaro.org; Thu, 05 May 2022 14:46:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmgOM-0006wv-Vm
 for qemu-arm@nongnu.org; Thu, 05 May 2022 14:40:00 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:40660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmgOJ-0002AU-Td
 for qemu-arm@nongnu.org; Thu, 05 May 2022 14:39:58 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 v64-20020a1cac43000000b0038cfd1b3a6dso5597229wme.5
 for <qemu-arm@nongnu.org>; Thu, 05 May 2022 11:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=uu7/TC5fWHfFvtIm4oJ7noZYbZtTrG6x0h1sDOIjlLo=;
 b=qI35xtAWKc5GgQS46g9oBirKR2BUffy1laCxXdrQ9z7+KHQxAe4g+jLgK9xNkDW2PD
 6ca0EUINC31lKMR0o16mfhCsrn/T3NUqVPOOKmfDR48WkjdpSFFUD/C3OVnaAbB3YJ5k
 wF2x6XFjwohb6IY0iDfaZahBUjZdfDG6vmUzq1G68UpITPMch+H3AzAzjXs17hhWzRo9
 fyuO7bC+6PCiTt72piC8QCujSRyGDAWwi3GQDRUbFb9CYbQhSdAVSL40AX6EIK4a8SGa
 djUP4mL/UOKTrF2pA1t0/ei3t1C9G79ZD1wsK90wKogIF76zKaS6z8amTx0rq60BNOCQ
 FJGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uu7/TC5fWHfFvtIm4oJ7noZYbZtTrG6x0h1sDOIjlLo=;
 b=Ybir8IofpvVDOB3QDSRD56gs3Rs1NPUieiy8VfV0hBvFCBq1EbFraKlaGQ0yNTyvHF
 YMx7mKFkNER1Xc5y0RjUomI6bNd24YH8o4bTjaZsQR9D7Z7JVoaMdbGCkdKX6woJPaF/
 eb9yX+dbR7/CnaGwTWlxc1YdzLYOIYqyml6MzFj2Tg+s/Ow+r1FgXD8+0a8nEOJBcBfc
 skyHVQI1/eVcUejGGup25gN0N0koeeygD7ojlkHqGD0JzUk39rJbn49YUoW86732/S0t
 Uo/0b/NI9wZWFK/pa5kcCphJDb7nSgXX3cKDNDo/TNfVNYDzi9nJZvc0GEhKpT88Pp4k
 n+UA==
X-Gm-Message-State: AOAM532pG4KjlllJiV95OdunHtqv4LcLEscH3NsGqjNX3u9S0Z4s0TyS
 XHWXREMrPPm4SfERngKzND1iAW46rXmddQ==
X-Received: by 2002:a05:600c:2550:b0:393:fd17:a8d with SMTP id
 e16-20020a05600c255000b00393fd170a8dmr6301912wma.203.1651775994191; 
 Thu, 05 May 2022 11:39:54 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 o35-20020a05600c512300b0039454a85a9asm2302121wms.30.2022.05.05.11.39.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 11:39:53 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/4] target/arm: Factor out FWB=0 specific part of
 combine_cacheattrs()
Date: Thu,  5 May 2022 19:39:48 +0100
Message-Id: <20220505183950.2781801-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220505183950.2781801-1-peter.maydell@linaro.org>
References: <20220505183950.2781801-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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
X-TUID: UmmEStyCEIR/

Factor out the part of combine_cacheattrs() that is specific to
handling HCR_EL2.FWB == 0.  This is the part where we combine the
memory type and cacheability attributes.

The "force Outer Shareable for Device or Normal Inner-NC Outer-NC"
logic remains in combine_cacheattrs() because it holds regardless
(this is the equivalent of the pseudocode EffectiveShareability()
function).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 88 +++++++++++++++++++++++++--------------------
 1 file changed, 50 insertions(+), 38 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 5839acc343b..2828f0dacf3 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -12532,6 +12532,46 @@ static uint8_t combine_cacheattr_nibble(uint8_t s1, uint8_t s2)
     }
 }
 
+/*
+ * Combine the memory type and cacheability attributes of
+ * s1 and s2 for the HCR_EL2.FWB == 0 case, returning the
+ * combined attributes in MAIR_EL1 format.
+ */
+static uint8_t combined_attrs_nofwb(CPUARMState *env,
+                                    ARMCacheAttrs s1, ARMCacheAttrs s2)
+{
+    uint8_t s1lo, s2lo, s1hi, s2hi, s2_mair_attrs, ret_attrs;
+
+    s2_mair_attrs = convert_stage2_attrs(env, s2.attrs);
+
+    s1lo = extract32(s1.attrs, 0, 4);
+    s2lo = extract32(s2_mair_attrs, 0, 4);
+    s1hi = extract32(s1.attrs, 4, 4);
+    s2hi = extract32(s2_mair_attrs, 4, 4);
+
+    /* Combine memory type and cacheability attributes */
+    if (s1hi == 0 || s2hi == 0) {
+        /* Device has precedence over normal */
+        if (s1lo == 0 || s2lo == 0) {
+            /* nGnRnE has precedence over anything */
+            ret_attrs = 0;
+        } else if (s1lo == 4 || s2lo == 4) {
+            /* non-Reordering has precedence over Reordering */
+            ret_attrs = 4;  /* nGnRE */
+        } else if (s1lo == 8 || s2lo == 8) {
+            /* non-Gathering has precedence over Gathering */
+            ret_attrs = 8;  /* nGRE */
+        } else {
+            ret_attrs = 0xc; /* GRE */
+        }
+    } else { /* Normal memory */
+        /* Outer/inner cacheability combine independently */
+        ret_attrs = combine_cacheattr_nibble(s1hi, s2hi) << 4
+                  | combine_cacheattr_nibble(s1lo, s2lo);
+    }
+    return ret_attrs;
+}
+
 /* Combine S1 and S2 cacheability/shareability attributes, per D4.5.4
  * and CombineS1S2Desc()
  *
@@ -12542,26 +12582,17 @@ static uint8_t combine_cacheattr_nibble(uint8_t s1, uint8_t s2)
 static ARMCacheAttrs combine_cacheattrs(CPUARMState *env,
                                         ARMCacheAttrs s1, ARMCacheAttrs s2)
 {
-    uint8_t s1lo, s2lo, s1hi, s2hi;
     ARMCacheAttrs ret;
     bool tagged = false;
-    uint8_t s2_mair_attrs;
 
     assert(s2.is_s2_format && !s1.is_s2_format);
     ret.is_s2_format = false;
 
-    s2_mair_attrs = convert_stage2_attrs(env, s2.attrs);
-
     if (s1.attrs == 0xf0) {
         tagged = true;
         s1.attrs = 0xff;
     }
 
-    s1lo = extract32(s1.attrs, 0, 4);
-    s2lo = extract32(s2_mair_attrs, 0, 4);
-    s1hi = extract32(s1.attrs, 4, 4);
-    s2hi = extract32(s2_mair_attrs, 4, 4);
-
     /* Combine shareability attributes (table D4-43) */
     if (s1.shareability == 2 || s2.shareability == 2) {
         /* if either are outer-shareable, the result is outer-shareable */
@@ -12575,37 +12606,18 @@ static ARMCacheAttrs combine_cacheattrs(CPUARMState *env,
     }
 
     /* Combine memory type and cacheability attributes */
-    if (s1hi == 0 || s2hi == 0) {
-        /* Device has precedence over normal */
-        if (s1lo == 0 || s2lo == 0) {
-            /* nGnRnE has precedence over anything */
-            ret.attrs = 0;
-        } else if (s1lo == 4 || s2lo == 4) {
-            /* non-Reordering has precedence over Reordering */
-            ret.attrs = 4;  /* nGnRE */
-        } else if (s1lo == 8 || s2lo == 8) {
-            /* non-Gathering has precedence over Gathering */
-            ret.attrs = 8;  /* nGRE */
-        } else {
-            ret.attrs = 0xc; /* GRE */
-        }
+    ret.attrs = combined_attrs_nofwb(env, s1, s2);
 
-        /* Any location for which the resultant memory type is any
-         * type of Device memory is always treated as Outer Shareable.
-         */
+    /*
+     * Any location for which the resultant memory type is any
+     * type of Device memory is always treated as Outer Shareable.
+     * Any location for which the resultant memory type is Normal
+     * Inner Non-cacheable, Outer Non-cacheable is always treated
+     * as Outer Shareable.
+     * TODO: FEAT_XS adds another value (0x40) also meaning iNCoNC
+     */
+    if ((ret.attrs & 0xf0) == 0 || ret.attrs == 0x44) {
         ret.shareability = 2;
-    } else { /* Normal memory */
-        /* Outer/inner cacheability combine independently */
-        ret.attrs = combine_cacheattr_nibble(s1hi, s2hi) << 4
-                  | combine_cacheattr_nibble(s1lo, s2lo);
-
-        if (ret.attrs == 0x44) {
-            /* Any location for which the resultant memory type is Normal
-             * Inner Non-cacheable, Outer Non-cacheable is always treated
-             * as Outer Shareable.
-             */
-            ret.shareability = 2;
-        }
     }
 
     /* TODO: CombineS1S2Desc does not consider transient, only WB, RWA. */
-- 
2.25.1

