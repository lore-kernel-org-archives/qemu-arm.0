Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp614584lfb;
        Thu, 9 Sep 2021 16:08:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzUbEIj3wL3W9FCi5xhy/dVvYbh9LzVTSrwbZVfNWHsjPTl5c3PYT8ir8ejNMOvFDc5+8/Y
X-Received: by 2002:a05:6102:318c:: with SMTP id c12mr2601074vsh.4.1631228893417;
        Thu, 09 Sep 2021 16:08:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631228893; cv=none;
        d=google.com; s=arc-20160816;
        b=BMx+c29gcR0625N+wqx5x6L077/6xmIxBk9RbmgJiY/9ne44ddw1iiqCbpMv1+/G4F
         ubadBOqlOc6CWRAYxDvnlT/rDldzNjb3Gr2p3oOjXHckLIGEKzCI1L429yZUiNuqhFOW
         N3Y94HUeIhgi+VMDAZrSDfKFR/CIsJd2wTME5hvKEVND0uBsW9gN61uVK5KNx55Ol2Sp
         hAZeCdDb+UnbtFXYhtXqiHSmrLYjVGXOEkUxzQalQcBSjr9xiT8r4s3djchBtovUeRsN
         eVm7o10n5ikYZ4aLk8bSJ/Uvd7dHQ1B/nJyEcIBaflYcS2TsTgShXExNLxK+ga8pTJNC
         mEhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=K4LYlOvUZzLd9MOez1R3zFl12BIZBDW+14pZOtD/xoo=;
        b=z0mf4BLd1vMpnVYFeyx6+49fXuTlRPoLtxAjxK0brvb0Fm1AZmuz27y5/vFWHuDFx8
         7mmy/A/pxyEhBWwB9WPIl5J6ivl1cjvUyH0VkYxm85TXfMOOih6MYllWVLMqqRCCTKdH
         I2SNtyk1OLZ3wSAnow54xH9kVQrmMma8ceTi4s18s0HY25VB3e+U5zK0YIT+Yf40Yvhp
         gLpjhCCOuwhgBL8Hvg+7caKOtwf7CjIcAIUGH/xoL4wd7rxcJbOMqkcfnGNZFGw6u2QZ
         prBAHGpIlNK44JtQz6hTEgqWb0KMOKCiH4qqpo2S7DNs9nTuoen3amdP0rl7HVrLZaHb
         Q1Vg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=VX3HW05I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u17si1389678uae.15.2021.09.09.16.08.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Sep 2021 16:08:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=VX3HW05I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:48216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mOT9Q-0005Iq-N4
	for alex.bennee@linaro.org; Thu, 09 Sep 2021 19:08:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3opM6YQgKCMM53qjx21qpxxpun.lxvznv3-j0vwxwpw3.x0p@flex--wuhaotsh.bounces.google.com>)
 id 1mOT8X-0004Za-Ih
 for qemu-arm@nongnu.org; Thu, 09 Sep 2021 19:07:17 -0400
Received: from mail-qt1-x849.google.com ([2607:f8b0:4864:20::849]:42954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3opM6YQgKCMM53qjx21qpxxpun.lxvznv3-j0vwxwpw3.x0p@flex--wuhaotsh.bounces.google.com>)
 id 1mOT8V-0003Y6-Vt
 for qemu-arm@nongnu.org; Thu, 09 Sep 2021 19:07:17 -0400
Received: by mail-qt1-x849.google.com with SMTP id
 z16-20020ac86b90000000b0029eec160182so10851986qts.9
 for <qemu-arm@nongnu.org>; Thu, 09 Sep 2021 16:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=K4LYlOvUZzLd9MOez1R3zFl12BIZBDW+14pZOtD/xoo=;
 b=VX3HW05I+YxfQAsGO89DDgpNXRYqBBX2p13O0pWGm1WXsq3XcSxL/fzkpWLRjvQVmb
 lxz29uLSU+1hlzCWPsMZKBZtnAaHyC//GHqtWGH69mEBsm9A/o8jYZNlG2n/JDAzCLzT
 xNh/9RYPOo3U64lEkws/+G8m+M3C/yn800X6u8PJV3MZadGBo2Fv/zGWRZe9Mjp0pT3G
 I0kDSC+9RWP9Fbq8Fhzk+mZQxrC+JtEIwu+KuZToPSXpdNbxT3BFZPq1yV8m6axGDeRR
 mcE5EiJ6qw3o0x+nfdhBcLHDfpdV0W7rfY5NEYRL41z8wQZLyGGTMetGMXY6CSdUgDGy
 jHkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=K4LYlOvUZzLd9MOez1R3zFl12BIZBDW+14pZOtD/xoo=;
 b=rsfau+Natzxom4qxkHrw7kqDk6/2QVwvgRXW+zK0DXqcf9zdsM6Os6Ag1qFb9/hxLh
 Ec9eJ9iX6gCDAWH0rOPbv677CTesxFNZ7iyLI6WRNWGLPssVrBrspYwK0kDsZy7+uC+5
 GLxy2clR0s0w/82KyD05lkHE791st2W6n3ERTYB89wLFKGq5Hd8rvY/I4ncwHU+5jN1a
 o8KUKtzQZ8jPTNTAONaDeNIMWC/92/DroNQOqby8CbpnlyoqIeMf1sWfqtP+rnRTHW2b
 zwK/9wyGX4h3PAyZQ1zS8iYzYt22hblst69RAhyrkqq1UyvqjS9ieMoE6GtD5qKpj6CK
 RmKg==
X-Gm-Message-State: AOAM5325t0BC0c2GHYyWBZ4TA9TuH+JaFzQ+uTv/nw8GR5PDk/d+LKll
 f7bKqMYwQyLqhIUFaBwNN5ammx+P1TUR5g==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a05:6214:268e:: with SMTP id
 gm14mr5543839qvb.51.1631228834083; Thu, 09 Sep 2021 16:07:14 -0700 (PDT)
Date: Thu,  9 Sep 2021 16:06:15 -0700
In-Reply-To: <20210909230620.511815-1-wuhaotsh@google.com>
Message-Id: <20210909230620.511815-4-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20210909230620.511815-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.33.0.309.g3052b89438-goog
Subject: [PATCH 3/8] docs/specs: IPMI device emulation: BMC
From: Hao Wu <wuhaotsh@google.com>
To: minyard@acm.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, titusr@google.com, peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::849;
 envelope-from=3opM6YQgKCMM53qjx21qpxxpun.lxvznv3-j0vwxwpw3.x0p@flex--wuhaotsh.bounces.google.com;
 helo=mail-qt1-x849.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
X-TUID: 6c/fChRxehC5

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
index adb098b53d..b5fe362043 100644
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
+another QEMU VM) through the ``ipmi-host-extern`` host implementation. This
+device has a required ``chardev`` property which specifies the communications
+channel to the external host and a required ``interface`` property which
+specifies the underlying IPMI interface. The wire format is the same as for
+``ipmi-bmc-extern``.
+
 Wire protocol
 =============
 
-- 
2.33.0.309.g3052b89438-goog

