Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp909351ejb;
        Mon, 19 Feb 2024 12:18:04 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWKSHcuGIp7DKTdfuBeLxlP8XtKgaNEZQusAivGNymy5uOn/AQ3sdetZjXPMODEO0iFy9KqcelG/p+hBOzMGD6PFKLi10gY
X-Google-Smtp-Source: AGHT+IF4bNvK1lXQ3onYtRMlVdAkN3f8sKefuueIUWJPqpiTnSJp+vTKIxaODLPq+g+fsCbFocOo
X-Received: by 2002:a05:622a:1a8a:b0:42c:63a8:5c9f with SMTP id s10-20020a05622a1a8a00b0042c63a85c9fmr19435958qtc.33.1708373883821;
        Mon, 19 Feb 2024 12:18:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708373883; cv=none;
        d=google.com; s=arc-20160816;
        b=B8eeDzZoYv8x3bC+4zotOX6Pr6wWh9Bcy4w11n6T3RR4a/Pp9SpzgnqoIg0aqvkT1o
         SyI+Cw7VLRFnvby4wFIC5YECW09Alto7UKv6RrDkf5ZkMuLU30s/7vtOK9sdeOI6jXlU
         AcDETnKftOV0lSoa7JMYCLbTm5qlofU4+4eBnP/bTWqTgAC8myAwDTfk7LoWEZNSGz/S
         6nEDfF5wWtwNsxQSPiy+1IKgGjVq+aRAqDpXviualKryrKnIWtc+BCrIbGSvqro5TUJ+
         O5wV/Drg7mv9q0jG1CGEeW4uRRH2ZztrLBfpqPnyrvnXFcFW+b9/3eBbn3N+bc2pJHd3
         owIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature:dkim-filter;
        bh=Sl4UP9bEcoXd9bUfRaZY/uZFfoexMtsBMg3c/sDPwC0=;
        fh=58DdXjNEhnAMefdYf7t1zzeZ7Biw6cxiQpFmUFYWmd4=;
        b=UiM43MPy1qdQvy/UD3VdQFZeGiqL9miSBCcoiCOzknpHuWeHwrBQFjA5OYx67wmFwp
         YXNzOvI1qP/sfZPbicXoTKRPxweLhO1zqA6RGytH0nPIptCvqkNpxxqa4o+RZB5oyriZ
         /55/6Dr/NwBZ2wlT7qFxPPk/sLe0QFJWfL5A06YijySgOmMGCEo2nsJfp4B/PBXFcY7F
         dcbMDU9YEgryFAizO8LdrmoZ3UdzxJin4ukahjEt2lPmCHXf/zwxGYOo0AoMIzzSARho
         6QlPldFPQclby5f3AndaekWBjhJkhg7DnWEAOdJHgMMTjEuJ9+bloOdy9hz+G5BGRsIC
         mVqw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=fXtkTQIQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h5-20020ac85045000000b0042c0b72a449si6803224qtm.213.2024.02.19.12.18.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Feb 2024 12:18:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=fXtkTQIQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rcA53-0006xw-4u; Mon, 19 Feb 2024 15:17:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arnaud.minier@telecom-paris.fr>)
 id 1rcA4d-0006lB-Hb; Mon, 19 Feb 2024 15:17:15 -0500
Received: from zproxy4.enst.fr ([2001:660:330f:2::df])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arnaud.minier@telecom-paris.fr>)
 id 1rcA4B-0006lX-9R; Mon, 19 Feb 2024 15:17:09 -0500
Received: from localhost (localhost [IPv6:::1])
 by zproxy4.enst.fr (Postfix) with ESMTP id 122E4205EA;
 Mon, 19 Feb 2024 21:16:38 +0100 (CET)
Received: from zproxy4.enst.fr ([IPv6:::1])
 by localhost (zproxy4.enst.fr [IPv6:::1]) (amavis, port 10032) with ESMTP
 id QcCFV-V_ZR9N; Mon, 19 Feb 2024 21:16:37 +0100 (CET)
Received: from localhost (localhost [IPv6:::1])
 by zproxy4.enst.fr (Postfix) with ESMTP id ED921205FC;
 Mon, 19 Feb 2024 21:16:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zproxy4.enst.fr ED921205FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=telecom-paris.fr;
 s=A35C7578-1106-11E5-A17F-C303FDDA8F2E; t=1708373797;
 bh=Sl4UP9bEcoXd9bUfRaZY/uZFfoexMtsBMg3c/sDPwC0=;
 h=From:To:Date:Message-Id:MIME-Version;
 b=fXtkTQIQC0ycPwdM+Kw+xYZ/h+fBxJ1Z2jQFf+YTgKDTT3bJJA0YNN2TQRO+G7oFy
 k/kxoH+eTHWi1gzmp85mVNrYRHUFkUn/fnC8fyYWiX2dn0p01Rw4pn+12GNB3VPJIm
 acSZQQmU7Ipy/xUgpup2CBs2vXiHi9C070AoKo3k=
X-Virus-Scanned: amavis at enst.fr
Received: from zproxy4.enst.fr ([IPv6:::1])
 by localhost (zproxy4.enst.fr [IPv6:::1]) (amavis, port 10026) with ESMTP
 id PIqRWBI9e0_e; Mon, 19 Feb 2024 21:16:36 +0100 (CET)
Received: from AM-Inspiron-3585.. (cust-west-par-46-193-4-103.cust.wifirst.net
 [46.193.4.103])
 by zproxy4.enst.fr (Postfix) with ESMTPSA id 3D72F205EA;
 Mon, 19 Feb 2024 21:16:36 +0100 (CET)
From: Arnaud Minier <arnaud.minier@telecom-paris.fr>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>,
 Samuel Tardieu <samuel.tardieu@telecom-paris.fr>, qemu-arm@nongnu.org,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>
Subject: [PATCH v5 6/8] Add write protections to CR register
Date: Mon, 19 Feb 2024 21:09:06 +0100
Message-Id: <20240219200908.49551-7-arnaud.minier@telecom-paris.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240219200908.49551-1-arnaud.minier@telecom-paris.fr>
References: <20240219200908.49551-1-arnaud.minier@telecom-paris.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2001:660:330f:2::df;
 envelope-from=arnaud.minier@telecom-paris.fr; helo=zproxy4.enst.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: mxnp+p4jAr09

Add write protections for the fields in the CR register.
PLL configuration write protections (among others) have not
been handled yet. This is planned in a future patch set.

Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
---
 hw/misc/stm32l4x5_rcc.c | 164 ++++++++++++++++++++++++++++------------
 1 file changed, 114 insertions(+), 50 deletions(-)

diff --git a/hw/misc/stm32l4x5_rcc.c b/hw/misc/stm32l4x5_rcc.c
index a3b192e61b..198c6238b6 100644
--- a/hw/misc/stm32l4x5_rcc.c
+++ b/hw/misc/stm32l4x5_rcc.c
@@ -346,9 +346,47 @@ static void rcc_update_irq(Stm32l4x5RccState *s)
     }
 }
=20
-static void rcc_update_cr_register(Stm32l4x5RccState *s)
+static void rcc_update_msi(Stm32l4x5RccState *s, uint32_t previous_value=
)
+{
+    uint32_t val;
+
+    static const uint32_t msirange[] =3D {
+        100000, 200000, 400000, 800000, 1000000, 2000000,
+        4000000, 8000000, 16000000, 24000000, 32000000, 48000000
+    };
+    /* MSIRANGE and MSIRGSEL */
+    val =3D extract32(s->cr, R_CR_MSIRGSEL_SHIFT, R_CR_MSIRGSEL_LENGTH);
+    if (val) {
+        /* MSIRGSEL is set, use the MSIRANGE field */
+        val =3D extract32(s->cr, R_CR_MSIRANGE_SHIFT, R_CR_MSIRANGE_LENG=
TH);
+    } else {
+        /* MSIRGSEL is not set, use the MSISRANGE field */
+        val =3D extract32(s->csr, R_CSR_MSISRANGE_SHIFT, R_CSR_MSISRANGE=
_LENGTH);
+    }
+
+    if (val < ARRAY_SIZE(msirange)) {
+        clock_update_hz(s->msi_rc, msirange[val]);
+    } else {
+        /*
+         * There is a hardware write protection if the value is out of b=
ound.
+         * Restore the previous value.
+         */
+        s->cr =3D (s->cr & ~R_CSR_MSISRANGE_MASK) |
+                (previous_value & R_CSR_MSISRANGE_MASK);
+    }
+}
+
+/*
+ * TODO: Add write-protection for all registers:
+ * DONE: CR
+ */
+
+static void rcc_update_cr_register(Stm32l4x5RccState *s, uint32_t previo=
us_value)
 {
     int val;
+    const RccClockMuxSource current_pll_src =3D
+        CLOCK_MUX_INIT_INFO[RCC_CLOCK_MUX_PLL_INPUT].src_mapping[
+            s->clock_muxes[RCC_CLOCK_MUX_PLL_INPUT].src];
=20
     /* PLLSAI2ON and update PLLSAI2RDY */
     val =3D extract32(s->cr, R_CR_PLLSAI2ON_SHIFT, R_CR_PLLSAI2ON_LENGTH=
);
@@ -368,77 +406,101 @@ static void rcc_update_cr_register(Stm32l4x5RccSta=
te *s)
         s->cifr |=3D R_CIFR_PLLSAI1RDYF_MASK;
     }
=20
-    /* PLLON and update PLLRDY */
+    /*
+     * PLLON and update PLLRDY
+     * PLLON cannot be reset if the PLL clock is used as the system cloc=
k.
+     */
     val =3D extract32(s->cr, R_CR_PLLON_SHIFT, R_CR_PLLON_LENGTH);
-    pll_set_enable(&s->plls[RCC_PLL_PLL], val);
-    s->cr =3D (s->cr & ~R_CR_PLLRDY_MASK) |
-            (val << R_CR_PLLRDY_SHIFT);
-    if (s->cier & R_CIER_PLLRDYIE_MASK) {
-        s->cifr |=3D R_CIFR_PLLRDYF_MASK;
+    if (extract32(s->cfgr, R_CFGR_SWS_SHIFT, R_CFGR_SWS_LENGTH) !=3D 0b1=
1) {
+        pll_set_enable(&s->plls[RCC_PLL_PLL], val);
+        s->cr =3D (s->cr & ~R_CR_PLLRDY_MASK) |
+                (val << R_CR_PLLRDY_SHIFT);
+        if (s->cier & R_CIER_PLLRDYIE_MASK) {
+            s->cifr |=3D R_CIFR_PLLRDYF_MASK;
+        }
+    } else {
+        s->cr |=3D R_CR_PLLON_MASK;
     }
=20
     /* CSSON: TODO */
     /* HSEBYP: TODO */
=20
-    /* HSEON and update HSERDY */
+    /*
+     * HSEON and update HSERDY.
+     * HSEON cannot be reset if the HSE oscillator is used directly or
+     * indirectly as the system clock.
+     */
     val =3D extract32(s->cr, R_CR_HSEON_SHIFT, R_CR_HSEON_LENGTH);
-    s->cr =3D (s->cr & ~R_CR_HSERDY_MASK) |
-            (val << R_CR_HSERDY_SHIFT);
-    if (val) {
-        clock_update_hz(s->hse, s->hse_frequency);
-        if (s->cier & R_CIER_HSERDYIE_MASK) {
-            s->cifr |=3D R_CIFR_HSERDYF_MASK;
+    if (extract32(s->cfgr, R_CFGR_SWS_SHIFT, R_CFGR_SWS_LENGTH) !=3D 0b1=
0 &&
+        current_pll_src !=3D RCC_CLOCK_MUX_SRC_HSE) {
+        s->cr =3D (s->cr & ~R_CR_HSERDY_MASK) |
+                (val << R_CR_HSERDY_SHIFT);
+        if (val) {
+            clock_update_hz(s->hse, s->hse_frequency);
+            if (s->cier & R_CIER_HSERDYIE_MASK) {
+                s->cifr |=3D R_CIFR_HSERDYF_MASK;
+            }
+        } else {
+            clock_update_hz(s->hse, 0);
         }
     } else {
-        clock_update_hz(s->hse, 0);
+        s->cr |=3D R_CR_HSEON_MASK;
     }
=20
     /* HSIAFS: TODO*/
     /* HSIKERON: TODO*/
=20
-    /* HSION and update HSIRDY*/
-    val =3D extract32(s->cr, R_CR_HSION_SHIFT, R_CR_HSION_LENGTH);
-    s->cr =3D (s->cr & ~R_CR_HSIRDY_MASK) |
-            (val << R_CR_HSIRDY_SHIFT);
-    if (val) {
+    /*
+     * HSION and update HSIRDY
+     * HSION is set by hardware if the HSI16 is used directly
+     * or indirectly as system clock.
+     */
+    if (extract32(s->cfgr, R_CFGR_SWS_SHIFT, R_CFGR_SWS_LENGTH) =3D=3D 0=
b01 ||
+        current_pll_src =3D=3D RCC_CLOCK_MUX_SRC_HSI) {
+        s->cr |=3D (R_CR_HSION_MASK | R_CR_HSIRDY_MASK);
         clock_update_hz(s->hsi16_rc, HSI_FRQ);
         if (s->cier & R_CIER_HSIRDYIE_MASK) {
             s->cifr |=3D R_CIFR_HSIRDYF_MASK;
         }
     } else {
-        clock_update_hz(s->hsi16_rc, 0);
+        val =3D extract32(s->cr, R_CR_HSION_SHIFT, R_CR_HSION_LENGTH);
+        if (val) {
+            clock_update_hz(s->hsi16_rc, HSI_FRQ);
+            s->cr |=3D R_CR_HSIRDY_MASK;
+            if (s->cier & R_CIER_HSIRDYIE_MASK) {
+                s->cifr |=3D R_CIFR_HSIRDYF_MASK;
+            }
+        } else {
+            clock_update_hz(s->hsi16_rc, 0);
+            s->cr &=3D ~R_CR_HSIRDY_MASK;
+        }
     }
=20
-    static const uint32_t msirange[] =3D {
-        100000, 200000, 400000, 800000, 1000000, 2000000,
-        4000000, 8000000, 16000000, 24000000, 32000000, 48000000
-    };
-    /* MSIRANGE and MSIRGSEL */
-    val =3D extract32(s->cr, R_CR_MSIRGSEL_SHIFT, R_CR_MSIRGSEL_LENGTH);
-    if (val) {
-        /* MSIRGSEL is set, use the MSIRANGE field */
-        val =3D extract32(s->cr, R_CR_MSIRANGE_SHIFT, R_CR_MSIRANGE_LENG=
TH);
-    } else {
-        /* MSIRGSEL is not set, use the MSISRANGE field */
-        val =3D extract32(s->csr, R_CSR_MSISRANGE_SHIFT, R_CSR_MSISRANGE=
_LENGTH);
-    }
+    /* MSIPLLEN: TODO */
=20
-    if (val < ARRAY_SIZE(msirange)) {
-        clock_update_hz(s->msi_rc, msirange[val]);
+    /*
+     * MSION and update MSIRDY
+     * Set by hardware when used directly or indirectly as system clock.
+     */
+    if (extract32(s->cfgr, R_CFGR_SWS_SHIFT, R_CFGR_SWS_LENGTH) =3D=3D 0=
b00 ||
+        current_pll_src =3D=3D RCC_CLOCK_MUX_SRC_MSI) {
+            s->cr |=3D (R_CR_MSION_MASK | R_CR_MSIRDY_MASK);
+            if (!(previous_value & R_CR_MSION_MASK) && (s->cier & R_CIER=
_MSIRDYIE_MASK)) {
+                s->cifr |=3D R_CIFR_MSIRDYF_MASK;
+            }
+            rcc_update_msi(s, previous_value);
     } else {
-        clock_update_hz(s->msi_rc, MSI_DEFAULT_FRQ);
-        /* TODO: there is a write protection if the value is out of boun=
d,
-           implement that instead of setting the default */
-    }
-
-    /* MSIPLLEN */
-
-    /* MSION and update MSIRDY */
-    val =3D extract32(s->cr, R_CR_MSION_SHIFT, R_CR_MSION_LENGTH);
-    s->cr =3D (s->cr & ~R_CR_MSIRDY_MASK) |
-            (val << R_CR_MSIRDY_SHIFT);
-    if (s->cier & R_CIER_MSIRDYIE_MASK) {
-        s->cifr |=3D R_CIFR_MSIRDYF_MASK;
+        val =3D extract32(s->cr, R_CR_MSION_SHIFT, R_CR_MSION_LENGTH);
+        if (val) {
+            s->cr |=3D R_CR_MSIRDY_MASK;
+            rcc_update_msi(s, previous_value);
+            if (s->cier & R_CIER_MSIRDYIE_MASK) {
+                s->cifr |=3D R_CIFR_MSIRDYF_MASK;
+            }
+        } else {
+            s->cr &=3D ~R_CR_MSIRDY_MASK;
+            clock_update_hz(s->msi_rc, 0);
+        }
     }
     rcc_update_irq(s);
 }
@@ -963,15 +1025,17 @@ static void stm32l4x5_rcc_write(void *opaque, hwad=
dr addr,
                                   uint64_t val64, unsigned int size)
 {
     Stm32l4x5RccState *s =3D opaque;
+    uint32_t previous_value =3D 0;
     const uint32_t value =3D val64;
=20
     trace_stm32l4x5_rcc_write(addr, value);
=20
     switch (addr) {
     case A_CR:
+        previous_value =3D s->cr;
         s->cr =3D (s->cr & CR_READ_SET_MASK) |
                 (value & (CR_READ_SET_MASK | ~CR_READ_ONLY_MASK));
-        rcc_update_cr_register(s);
+        rcc_update_cr_register(s, previous_value);
         break;
     case A_ICSCR:
         s->icscr =3D value & ~ICSCR_READ_ONLY_MASK;
--=20
2.34.1

