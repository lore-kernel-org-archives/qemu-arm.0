Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4244C5B572
	for <qemu-arm@archiver.kernel.org>; Thu, 20 Aug 2026 02:51:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wwsqA-0001vl-11; Wed, 19 Aug 2026 22:49:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kylefoxaustin.github@gmail.com>)
 id 1wwspr-0001qS-8b
 for qemu-arm@nongnu.org; Wed, 19 Aug 2026 22:48:57 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kylefoxaustin.github@gmail.com>)
 id 1wwspp-0000Oi-O6
 for qemu-arm@nongnu.org; Wed, 19 Aug 2026 22:48:55 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-836cde02992so23852057b3.2
 for <qemu-arm@nongnu.org>; Wed, 19 Aug 2026 19:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787194132; x=1787798932; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=IrPGfl+huHTZPIohbx6Ak3r7i9HaCjXef11B7n7gDFo=;
 b=NBO8jxrgFfm3YlkRkV3qXXYAS47JEb9hV0wI6849ftwY6JyfmQCKDIwCTWNmy5UpfL
 fRTijTB+j/NaqWmcpEdmLgsl19r/3hjilzvZ6gEPRRn990gb4tuHXFFJRO3A7GnME826
 piTmAU1c+srlsgpW6l2YJXdFoHqFHGje66Cue2xrUVuicmuIRyvhFh/CQ+oXdWO4yUHh
 7CbnYY12bokQSdaAWDbQjHxNpu9wGb41F50KfUyuDL0R401kQq06M6oNPsrcLYPIxIiY
 kUW7j+KMNnkXruKgb1rHWbvXpwQq3xWzfdwCZNs93sQ0MhZFOUJy1Bmn9E4xYO3X0oUG
 7Rbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787194132; x=1787798932;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=IrPGfl+huHTZPIohbx6Ak3r7i9HaCjXef11B7n7gDFo=;
 b=D2knwhP1IaRsDIrEStAp6mSGDHzAtCGYiW3bVRg4M7Zo4UQM/EtI3oOHj+nMSsxmRt
 PhUf7bwRpGkFUlZ6A8c4jlPDPWvFMOswimBHXkifTwxqLzoXpWSExC+C547Vcm9GNYa4
 Sy0Ty42I7x5wTH0igr5c8MCdWsXOWgPcaxT7LpKcZuuyZp3KmDG8fguuzjlepXVbUmaP
 oLRFCacOBsXV5+8VcWyzdSjk8EZ9xkg4V+v1mTl0qc3c5Tzmk8J6BZyhAUZ3XVgNsPLD
 9zNuvUHtCCutvsjLV9hgwHuiLEDAqoPOxdF2bLTXUNUyMbS1dDqX4ePDTwfJhUpZdWot
 edXA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq9TN5IMG8FoXJTfF7BDvhoNDtIGJW10nxbH13qCk4ZBLzW4FqRx0nbXeIiPYpMPvsKwqpGYMtTlA==@nongnu.org
X-Gm-Message-State: AFuF++n1SonFcHZO9lQZgI9XpiyMMH92UPkphFjLJEkM7tp/DKSfZthz
 fu07cqnzpKpNpo8XNfycoYRgHagfVoRwFn8RZPRI426/8ps6BkkHGdJN
X-Gm-Gg: AR+sD12aTDMcGhlFY4/0T4mXyJrHaHOBTrJRaCMFB2961lxDyD38Xsyqdwv77NJJRGW
 nILDetO9VYY1mfdGM5FSs0KyjNQylub53THB1/mZeGabQvaCwu88KPgyjOzPySLsBjhkTfYCIQ0
 h1Lu6rvCj9JUu5VWyD18BAsIRsS7IDznOKH+gwmzLjmX6nFpXNxGxUPfph6ILLpces8UqtrShW0
 XbstLpacsADhiFMlaLveksTgfZa51+HsSM2RT4Yyh1o+C63YGIv10sbUDtsSrcyRODSMG2xJKFj
 2HhRVCNbNe686I4yYw29CxOvCS4cJIEhVAO3Fu/UlgPuJWLRLJd7SLORRVobejdtPHxwr1ZAK4e
 gCrwko2PyAM8mSnQJ+7t7WIZQGNlFmSl6WRcOmfs+ocPSJsLwOquziMTO252A3x3zj2+SbCNcSH
 cIlv7VNG/XiZStC69ygvEZdvp92dgFOiE13UsNUTKou0HTTItRw+QVFKewgBsKer1hUyNaX3cbr
 IOJOvwOZkuK6jS8022+9CDHMbJvv/QuQxrai9MhHPz3rNK9Gzho14Sc9gc=
X-Received: by 2002:a05:690e:4891:10b0:668:8dc0:bcc3 with SMTP id
 956f58d0204a3-66ccb3a5042mr2453152d50.0.1787194131862; 
 Wed, 19 Aug 2026 19:48:51 -0700 (PDT)
Received: from skippy.localdomain (99-61-67-1.lightspeed.austtx.sbcglobal.net.
 [99.61.67.1]) by smtp.gmail.com with ESMTPSA id
 956f58d0204a3-66ccafd03basm1986454d50.1.2026.08.19.19.48.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Aug 2026 19:48:51 -0700 (PDT)
From: Kyle Fox <kylefoxaustin.github@gmail.com>
To: qemu-devel@nongnu.org
Cc: Kyle Fox <kylefoxaustin.github@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH 04/16] hw/arm/armv7m: forward pmsav7-rbar-align-down to the CPU
Date: Wed, 19 Aug 2026 21:48:22 -0500
Message-Id: <20260820024834.3286721-5-kylefoxaustin.github@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260820024834.3286721-1-kylefoxaustin.github@gmail.com>
References: <20260820024834.3286721-1-kylefoxaustin.github@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=kylefoxaustin.github@gmail.com; helo=mail-yw1-x112b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Forward the opt-in "pmsav7-rbar-align-down" property to the CPU object,
following the existing init-svtor / vfp / dsp forwarding pattern, so an
SoC integrating a PMSAv7 core whose firmware relies on the align-down
behaviour can enable it.

Signed-off-by: Kyle Fox <kylefoxaustin.github@gmail.com>
---
 hw/arm/armv7m.c         | 8 ++++++++
 include/hw/arm/armv7m.h | 4 ++++
 2 files changed, 12 insertions(+)

diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index 68a1cbd6316..bb0f95d423d 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -332,6 +332,12 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
             return;
         }
     }
+    if (object_property_find(OBJECT(s->cpu), "pmsav7-rbar-align-down")) {
+        if (!object_property_set_bool(OBJECT(s->cpu), "pmsav7-rbar-align-down",
+                                      s->pmsav7_rbar_align_down, errp)) {
+            return;
+        }
+    }
     object_property_set_bool(OBJECT(s->cpu), "start-powered-off",
                              s->start_powered_off, &error_abort);
 
@@ -562,6 +568,8 @@ static const Property armv7m_properties[] = {
                      false),
     DEFINE_PROP_BOOL("vfp", ARMv7MState, vfp, true),
     DEFINE_PROP_BOOL("dsp", ARMv7MState, dsp, true),
+    DEFINE_PROP_BOOL("pmsav7-rbar-align-down", ARMv7MState,
+                     pmsav7_rbar_align_down, false),
     DEFINE_PROP_UINT32("mpu-ns-regions", ARMv7MState, mpu_ns_regions, UINT_MAX),
     DEFINE_PROP_UINT32("mpu-s-regions", ARMv7MState, mpu_s_regions, UINT_MAX),
 };
diff --git a/include/hw/arm/armv7m.h b/include/hw/arm/armv7m.h
index 70555962bb9..23cfed222c1 100644
--- a/include/hw/arm/armv7m.h
+++ b/include/hw/arm/armv7m.h
@@ -52,6 +52,9 @@ OBJECT_DECLARE_SIMPLE_TYPE(ARMv7MState, ARMV7M)
  * + Property "init-nsvtor": non-secure VTOR reset value (forwarded to CPU object)
  * + Property "vfp": enable VFP (forwarded to CPU object)
  * + Property "dsp": enable DSP (forwarded to CPU object)
+ * + Property "pmsav7-rbar-align-down": align down a misaligned PMSAv7 MPU
+ *   region base rather than treating it as UNPREDICTABLE (forwarded to the
+ *   CPU object, which only offers it on PMSAv7 cores)
  * + Property "enable-bitband": expose bitbanded IO
  * + Property "mpu-ns-regions": number of Non-Secure MPU regions (forwarded
  *   to CPU object pmsav7-dregion property; default is whatever the default
@@ -108,6 +111,7 @@ struct ARMv7MState {
     bool start_powered_off;
     bool vfp;
     bool dsp;
+    bool pmsav7_rbar_align_down;
 };
 
 #endif
-- 
2.34.1


