Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp1495093ejb;
        Fri, 24 Mar 2023 16:10:42 -0700 (PDT)
X-Google-Smtp-Source: AKy350aXG8TW8cpnENUoSPV90JsbuZzoefjRKoTcKP+G0ZxzzGa202mUEaz4IT/k8mb5ybpuZl6V
X-Received: by 2002:a05:622a:387:b0:3e4:dba2:819a with SMTP id j7-20020a05622a038700b003e4dba2819amr767605qtx.10.1679699442624;
        Fri, 24 Mar 2023 16:10:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679699442; cv=none;
        d=google.com; s=arc-20160816;
        b=j/Ir/kAsKzNAmQPzUzMWFMO0a1Cx0IhBrjk/ohKGxVWuMu3TPoONDyl5/EKb7d8+35
         QuIIEWri8jgjtq5sJ/xooOuvPIp2/WQVTeWwITjP0vJMm+tfQy3rCdz/iGNkdsLkBJwR
         OERGJkNMaih3sD/nBqzUpvtX2wokfSOzwLfHwzM15SR9dfyiC39VTtxtH965ZTXPVVoR
         cGWbOR+CUir8ZVUIKKnedhpjfpRIXrk9+IyHbfr0jzW/rOnSwAe3o85SHKJCO5ElUPMY
         a3lXDIXdgG076S50lb4O7kH8XHz56OxnQd5voHLaLd29yiMfHd0V17Dzs3SmlZvVnqg8
         jZ1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=hThAM1PYVptJ2T0hv2FGmx247BXgKKyww2sb3KTt5a8=;
        b=uiYbMF1d/w7g1dXYKLoSP/7Hw3Q3WAHb2dz6/F34ggy2cVJmgXfBeXO3LGq0gstSuT
         nMkPlwMRA8RO7ayLYt1QSZ2EvJAyNuTbpUorwriemvEHl1vytUKX1fArQzieQ3w3ylAi
         6Btj8fKCW95LoIok7V9JLAPTokf0PulcTd3A5UHpuK7qr5q2CHwkxvps/8DTkhb3XAyQ
         JA4w4ta49wl7aF9Ewu8aJMaSCid77q4RxrT/Cn0QS09xS6rgZvbQVIK09h5veeoZKeQC
         TvM7hne73URdSB+hUSwW7p8kZSTpZMzgtTTCbA+VTT/XyJqlaF0k1G4P/IAOoYTp1jXU
         8Big==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=HPJ9Ibd1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r14-20020a05622a034e00b003d81a0637d9si14273671qtw.68.2023.03.24.16.10.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Mar 2023 16:10:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=HPJ9Ibd1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfqXd-0002N7-EW; Fri, 24 Mar 2023 19:09:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3ty0eZAgKCrIomZSglkZYggYdW.UgeiWem-VWnWdfgfYfm.gjY@flex--wuhaotsh.bounces.google.com>)
 id 1pfqXb-0002M4-7n
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 19:09:47 -0400
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3ty0eZAgKCrIomZSglkZYggYdW.UgeiWem-VWnWdfgfYfm.gjY@flex--wuhaotsh.bounces.google.com>)
 id 1pfqXY-00083Y-UW
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 19:09:46 -0400
Received: by mail-pf1-x449.google.com with SMTP id
 l19-20020a056a0016d300b006257255adb4so1652090pfc.13
 for <qemu-devel@nongnu.org>; Fri, 24 Mar 2023 16:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1679699383;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=hThAM1PYVptJ2T0hv2FGmx247BXgKKyww2sb3KTt5a8=;
 b=HPJ9Ibd1GEnSgOHybqIQitAI3oGVKRQU7xDX3ztGpOgTyu5lnornrw4b5iFXWQOj+i
 4N8jh1wIk3IGvIJyqNb3+Zq7k1pl2Zm3jTe5OrVGEUuEEbcu1f6VT0cpxo6/1hx7du31
 pxl2P0MZeXsrN3YIINen0KOIOMQMFO/yTE81f7ERIpzeH4UNWp/tCXW0FdfM55s+pHg+
 iOsYJJlLDvRDI042k+8QDeeBXLuUwdcEnuLCuiwrCZoNhygfrSdVcHk4LT8iPyW7ks3Z
 o3KrJq+PHvHgaqXXw+ZoSXBkG3b4UaxG8XLHWY9pssOUaUscTzT6NHPvjaLr2Zguf14h
 5CUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679699383;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hThAM1PYVptJ2T0hv2FGmx247BXgKKyww2sb3KTt5a8=;
 b=IR6haFey1PPwRCfyjcq510Sib/6LHYa4dviPT+oU84T6WVP/tYoXvhMPb2enw9lenP
 DMY06xPQ6uvcGprJFFlNORgjGqsMPSbDMVcK1L99wAFfGFhikVyhdL5rys0U3yuR2P7N
 wz/jTWFReVJuwbkux004TTwzhB4TB1bF0OqxmSZ8rvUjqJXhNNZRsKaebTqIqjBYgTpj
 N7ZTBGayZ9CjT0zs0CaptM5sfPJxXJNuJZptfidNCk9SCj/Olec8GNiSROk82+1uZJbi
 ezvb6CbvmiqeA+DbJSdd3+kzkG7mIddw0cIMQ5JMW/tAOAi6Ip3o9Fz7kY82Y/h9UOfv
 IFkw==
X-Gm-Message-State: AAQBX9eK7zEsIJjdIomAc6Tp3qrzZTZ3fwwpsMO6LQ8bat1RJusS3HdY
 TJKXIM6BjPchScv/wzBwFnCMPf8xt3K7fg==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a05:6a00:2e9f:b0:628:1e57:afd7 with SMTP
 id fd31-20020a056a002e9f00b006281e57afd7mr2465143pfb.0.1679699383544; Fri, 24
 Mar 2023 16:09:43 -0700 (PDT)
Date: Fri, 24 Mar 2023 16:09:00 -0700
In-Reply-To: <20230324230904.3710289-1-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20230324230904.3710289-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Message-ID: <20230324230904.3710289-4-wuhaotsh@google.com>
Subject: [PATCH v2 3/7] docs/specs: IPMI device emulation: BMC
From: Hao Wu <wuhaotsh@google.com>
To: minyard@acm.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, titusr@google.com, peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::449;
 envelope-from=3ty0eZAgKCrIomZSglkZYggYdW.UgeiWem-VWnWdfgfYfm.gjY@flex--wuhaotsh.bounces.google.com;
 helo=mail-pf1-x449.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: RYSBOdyH1GGo

From: Havard Skinnemoen <hskinnemoen@google.com>

The IPMI document is expanded with a proposal to emulate BMC-side IPMI
devices. This allows a QEMU instance running server software to interact
with a different QEMU instance running BMC firmware, which should
closely model how a real server system works.

Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 docs/specs/ipmi.rst | 70 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/docs/specs/ipmi.rst b/docs/specs/ipmi.rst
index e0badc7f15..b06ad74728 100644
--- a/docs/specs/ipmi.rst
+++ b/docs/specs/ipmi.rst
@@ -91,6 +91,76 @@ further delegated to an external emulator, or a real BMC. The
 ``ipmi-bmc-extern`` device has a required ``chardev`` property which specifies
 the communications channel to the external BMC.
 
+Baseband Management Controller (BMC) emulation
+==============================================
+
+This section is about emulation of IPMI-related devices in a System-on-Chip
+(SoC) used as a Baseband Management Controller. This is not to be confused with
+emulating the BMC device as seen by the main processor.
+
+SoCs that are designed to be used as a BMC often have dedicated hardware that
+allows them to be connected to one or more of the IPMI System Interfaces. The
+BMC-side hardware interface is not standardized, so each type of SoC may need
+its own device implementation in QEMU, for example:
+
+* ``aspeed-ibt`` for emulating the Aspeed iBT peripheral.
+* ``npcm7xx-kcs`` for emulating the Nuvoton NPCM7xx Host-to-BMC Keyboard
+  Controller Style (KCS) channels.
+
+.. blockdiag::
+
+    blockdiag bmc_ipmi {
+        orientation = portrait
+        default_group_color = "none";
+        class interface [color = lightblue];
+        class host [color = salmon];
+
+        host [color="aquamarine", label="External Host"]
+
+        group {
+            orientation = portrait
+
+            group {
+                orientation = portrait
+
+                bmc-interface [class = "interface"]
+                npcm7xx-ipmi-kcs [class = "interface", stacked]
+
+                bmc-interface <- npcm7xx-ipmi-kcs [hstyle = generalization];
+            }
+
+            group {
+                orientation = portrait
+
+                bmc-host [class = "host"];
+                bmc-host-sim [class = "host"];
+                bmc-host-extern [class = "host"];
+
+                bmc-host <- bmc-host-sim [hstyle = generalization];
+                bmc-host <- bmc-host-extern [hstyle = generalization];
+            }
+
+            bmc-interface <-> bmc-host
+        }
+
+        bmc-host-extern <-> host [label="chardev"];
+    }
+
+IPMI Host
+---------
+
+Mirroring the main processor emulation, the interface devices delegate
+emulation of host behavior to a Host device that is a subclass of
+``ipmi-core``. This type of device is called a Host because that's what it
+looks like to the BMC guest software.
+
+The host behavior may be further delegated to an external emulator (e.g.
+another QEMU VM) through the ``ipmi-bmc-client`` host implementation. This
+device has a required ``chardev`` property which specifies the communications
+channel to the external host and a required ``interface-client`` property which
+specifies the underlying IPMI interface. The wire format is the same as for
+``ipmi-bmc-extern``.
+
 Wire protocol
 =============
 
-- 
2.40.0.348.gf938b09366-goog

