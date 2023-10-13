Received: by 2002:a05:7022:2383:b0:6d:30c6:dd9e with SMTP id bz3csp1168907dlb;
        Fri, 13 Oct 2023 01:50:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFreVxisLzsKUEYsJoKO/a01Sc2ONwyBXEcES+9YBEjcQD5eFhGzd6yppsVrzdZviWt00Wc
X-Received: by 2002:a05:6214:451a:b0:65b:2b67:13c4 with SMTP id oo26-20020a056214451a00b0065b2b6713c4mr27292774qvb.61.1697187042851;
        Fri, 13 Oct 2023 01:50:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697187042; cv=none;
        d=google.com; s=arc-20160816;
        b=0VoWxYOv5vxWOo4hmeJkCop7RrjJDpaZlOqP+DCqj+AYD+ORR4pNcv9RDkk8h9zK9T
         UMICzV5OxAC7Do4QrfmJJZg1w8PRvlKCXzccVgD+WSrrLm+yIKE7+L2RBkKvPEEIG4p9
         Jv6DFIQALDHHkc9WLgQcOlvYahW0+C8QDSD30DiPX/MKyfxFAkgSGclKrwnjp5lFt7Vg
         ROTtfOH3oGvjMh7LSYqMvSifgbHEdxj1KruCuSKnSujaHzy8O2xiXa8qkhEyHC7zDaad
         gs5c5ODXGQjlxky/1v5K9hX9vF2qBG5V5sTn3Fot+RyqidA+go5l5kg/kM6wkq6D4edM
         Mb9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Zggbk3Tv5WW2FuR6IS0/SDL1yyI6gdBYW/mCpV1Dhdc=;
        fh=NzSBWYzWXvfcD56ZpOos1hg9h9wc7xIOoGtDTwjwQZk=;
        b=VL/HY26JXoI5lOoSSbSaTVac3IRSWvVakXZQLZj3l1YAwQce18W5OgVnDY2ZScjI1t
         5mudMsUcGTseZoZWCnlzMkpxJJ2Wax/XDnWxa2O8XPZutHKFa2iUsu2RNZ/hyRr0gQ3G
         cXhkkjUhd9TiCQAA84vO7gXXU016E/DdYJArMxzbT1yLVCZ0vUT1rtRWvfH5fbyruikM
         fnLoPRktf9kAPexhaEwpUNHPh7uQjFyLWUxxLzdMQ4Z/dh5P19Uh7SsDrsKGHFrj4RxG
         Wgl/LthczfEVAsYk/dgnvUXkj+lfV9AVUFe/gJWETEAc1uJAS8fqqN+kuXvAQ/UXegKT
         HcHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zGJ+tC+7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a11-20020a0ccdcb000000b0065b26faf108si853369qvn.406.2023.10.13.01.50.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Oct 2023 01:50:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zGJ+tC+7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qrDqb-0000vt-Gv; Fri, 13 Oct 2023 04:48:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrDqa-0000os-0E
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 04:48:40 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrDqW-00017Q-PZ
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 04:48:39 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-323168869daso1763969f8f.2
 for <qemu-arm@nongnu.org>; Fri, 13 Oct 2023 01:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697186915; x=1697791715; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zggbk3Tv5WW2FuR6IS0/SDL1yyI6gdBYW/mCpV1Dhdc=;
 b=zGJ+tC+79lUT2+PxIGovvqfaSZMxhTYH4obc7C5AjofXgKuiXmMG1G6ujE5rwFg8xF
 5b8UAO1bD/e0kzI6M8uepp0H1bID2pnvb/EFm8A23H1WFh5OQ50tfRk4Ym6IAFTkNAJD
 b4MTsCKK2+j2JgOIpcg+3mSJsjqLOo2jwiby9RIsSWh2FWdiT5o/EjG9X5cEuUvQXHWl
 Mto2ex8Zq3l6oZSZfOBbYqm3aPDg/IRpfdhrgPkF3veXiKuPbIyHt0VjUIR+XRVYRHCu
 /GKPPkWW1OLwIp7NcFy+x6gzbr78rhVrFz1AXWk4fFDQfpd750rkHUxL8L8Q+WxfPUou
 0L9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697186915; x=1697791715;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Zggbk3Tv5WW2FuR6IS0/SDL1yyI6gdBYW/mCpV1Dhdc=;
 b=R7X2PzsYGyLAvf2ivOEQkVgdgzD2AIPwn2a6OoR1CqpwYRnKy9WNR+BBui7PS2x/JD
 DNVXuZlYfZvsJ+RtVKFAFk+YsXBCji/vaTXHfHrlZFCsrKJMdE7eREUX0RPcyHhP5Aie
 45MlQqlYCzdMm5OEG386ICTjIpqxEM4fE04KJMnk/nVnmWx7MO/ZV8w1J1qQy7iUQWxV
 S1GVGPWs0NT69lLjAOAxpFBmm30MqG3Zuyrx+wjnPSqBE4m8df7CGhyU8oECX05QKaUX
 ZyaBWx0GaaePa9GMnogk6Qm0rU7jcuTK3ZJjDbwgPOYFYyGSKsmEPpxCgXjmH6kIU/kQ
 8TkQ==
X-Gm-Message-State: AOJu0Yy4kb8r1D+puwDATTNrEBRns9024kbpXsGnxR9cgx98rvpvtxtv
 JAboeRqYUwoyj8VN/qby6VevlA==
X-Received: by 2002:a5d:62c6:0:b0:31f:d52a:82b3 with SMTP id
 o6-20020a5d62c6000000b0031fd52a82b3mr21325818wrv.46.1697186915447; 
 Fri, 13 Oct 2023 01:48:35 -0700 (PDT)
Received: from localhost.localdomain (adsl-170.109.242.226.tellas.gr.
 [109.242.226.170]) by smtp.gmail.com with ESMTPSA id
 v10-20020a5d678a000000b0032d9f32b96csm569185wru.62.2023.10.13.01.48.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 01:48:34 -0700 (PDT)
From: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org
Cc: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:OMAP)
Subject: [RFC PATCH v3 49/78] hw/arm: add fallthrough pseudo-keyword
Date: Fri, 13 Oct 2023 11:46:17 +0300
Message-Id: <92469f064a501d60fbd39699052067dc25747038.1697186560.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1697186560.git.manos.pitsidianakis@linaro.org>
References: <cover.1697186560.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wr1-x432.google.com
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
X-TUID: vZWt6Rvv+Niw

In preparation of raising -Wimplicit-fallthrough to 5, replace all
fall-through comments with the fallthrough attribute pseudo-keyword.

Signed-off-by: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 hw/arm/omap1.c     | 8 ++++----
 hw/arm/pxa2xx.c    | 6 +++---
 hw/arm/stellaris.c | 1 +
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/hw/arm/omap1.c b/hw/arm/omap1.c
index d5438156ee..c54a4ec553 100644
--- a/hw/arm/omap1.c
+++ b/hw/arm/omap1.c
@@ -552,7 +552,7 @@ static uint64_t omap_ulpd_pm_read(void *opaque, hwaddr addr,
     case 0x28:	/* Reserved */
     case 0x2c:	/* Reserved */
         OMAP_BAD_REG(addr);
-        /* fall through */
+        fallthrough;
     case 0x00:	/* COUNTER_32_LSB */
     case 0x04:	/* COUNTER_32_MSB */
     case 0x08:	/* COUNTER_HIGH_FREQ_LSB */
@@ -658,7 +658,7 @@ static void omap_ulpd_pm_write(void *opaque, hwaddr addr,
     case 0x28:	/* Reserved */
     case 0x2c:	/* Reserved */
         OMAP_BAD_REG(addr);
-        /* fall through */
+        fallthrough;
     case 0x24:	/* SETUP_ANALOG_CELL3_ULPD1 */
     case 0x38:	/* COUNTER_32_FIQ */
     case 0x48:	/* LOCL_TIME */
@@ -3181,7 +3181,7 @@ static uint64_t omap_mcbsp_read(void *opaque, hwaddr addr,
     case 0x00:	/* DRR2 */
         if (((s->rcr[0] >> 5) & 7) < 3)			/* RWDLEN1 */
             return 0x0000;
-        /* Fall through.  */
+        fallthrough;
     case 0x02:	/* DRR1 */
         if (s->rx_req < 2) {
             printf("%s: Rx FIFO underrun\n", __func__);
@@ -3279,7 +3279,7 @@ static void omap_mcbsp_writeh(void *opaque, hwaddr addr,
     case 0x04:	/* DXR2 */
         if (((s->xcr[0] >> 5) & 7) < 3)			/* XWDLEN1 */
             return;
-        /* Fall through.  */
+        fallthrough;
     case 0x06:	/* DXR1 */
         if (s->tx_req > 1) {
             s->tx_req -= 2;
diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
index 07d5dd8691..eaa6684243 100644
--- a/hw/arm/pxa2xx.c
+++ b/hw/arm/pxa2xx.c
@@ -285,7 +285,7 @@ static void pxa2xx_pwrmode_write(CPUARMState *env, const ARMCPRegInfo *ri,
             cpu_interrupt(CPU(s->cpu), CPU_INTERRUPT_HALT);
             break;
         }
-        /* Fall through.  */
+        fallthrough;
 
     case 2:
         /* Deep-Idle */
@@ -425,7 +425,7 @@ static uint64_t pxa2xx_mm_read(void *opaque, hwaddr addr,
     case MDCNFG ... SA1110:
         if ((addr & 3) == 0)
             return s->mm_regs[addr >> 2];
-        /* fall through */
+        fallthrough;
     default:
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: Bad read offset 0x%"HWADDR_PRIx"\n",
@@ -446,7 +446,7 @@ static void pxa2xx_mm_write(void *opaque, hwaddr addr,
             s->mm_regs[addr >> 2] = value;
             break;
         }
-        /* fallthrough */
+        fallthrough;
     default:
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: Bad write offset 0x%"HWADDR_PRIx"\n",
diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index aa5b0ddfaa..d68602ab71 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -157,6 +157,7 @@ static int ssys_board_class(const ssys_state *s)
             return did0 & DID0_CLASS_MASK;
         }
         /* for unknown classes, fall through */
+        fallthrough;
     default:
         /* This can only happen if the hardwired constant did0 value
          * in this board's stellaris_board_info struct is wrong.
-- 
2.39.2

