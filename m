Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp614405lfb;
        Thu, 9 Sep 2021 16:07:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzSGoK0JbKhNtw+IL8/lOMMMl8FL4MUalWAZ9/c3L6hT2vDEsCjATfXtidaysJX6M9ZTndT
X-Received: by 2002:adf:eb89:: with SMTP id t9mr6526366wrn.66.1631228879564;
        Thu, 09 Sep 2021 16:07:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631228879; cv=none;
        d=google.com; s=arc-20160816;
        b=uXRW5ni6+8qF0E9v8/CgAq/1IUTnUu0xLB26/YQFL+8MlSfV/yL1ROBAQWHKfola3f
         Bedg/B3OwS3hb9+L2T+IOBmhxSOiqeGI6iXAzaywqAOJl/dvQ1xY0t7QMrfCKviMuDDY
         yPJ7sjNv0JhFgTGucZUwhEhoxDAywK5RV54WBJr8IX910v3yWWN3jUoHQaZ+nx2Pkyo6
         bPvi/bz+ZcSqrqul2DS/uOEXSO7Z/lvenDtS/PM2zhWiHnPgzAU0Ds/t96Kg2j8Kkj2i
         R8r5daZLz0jKCvXP8K2F1IquCb3zixl0cHllMsArwo1x/Jlo3gZMOJTtSDHOZzbppH8c
         p5lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=NXWt55pjezy5dMEkLACY8sKG8zq8Wfg4Vr71HclTn7E=;
        b=MFIHyi5trgLHqEBjyHM+SOmUZMlu38E0seLfTDdW4b6ppC4lCDGTSNIpqH+uiqk/XN
         46gqbE2yVWQe7zZnpD7oXy8bCyYpv8n7S9u50ys9vBFmmEIrOiXXmTz6Yx5Hp3pF/vqO
         WUPMr9FLOaTX1GaYveg0fCKF7XNfurZB/EKEdNloRCjvMS2aJVYrIwnHWNBQHRF8LepX
         gNhc5NtyUkUGA3S1GyVrw4ReYYrhFX3zgE56TN1v94+klguxlYmcjV8U/Hrws11NO8QL
         jRafp2W0bch/+SNPSpTUbio0cfcMPQd1rnvLiR7J6t3CiI2o/yyhHgQ1AYg39SQd81Jd
         OchA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=RWmIO7eO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h16si3186232wrx.294.2021.09.09.16.07.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Sep 2021 16:07:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=RWmIO7eO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:47284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mOT9C-0004aS-Jt
	for alex.bennee@linaro.org; Thu, 09 Sep 2021 19:07:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3oJM6YQgKCME31ohv0zonvvnsl.jvtxlt1-hytuvunu1.vyn@flex--wuhaotsh.bounces.google.com>)
 id 1mOT8W-0004YJ-Fm
 for qemu-arm@nongnu.org; Thu, 09 Sep 2021 19:07:16 -0400
Received: from mail-qv1-xf4a.google.com ([2607:f8b0:4864:20::f4a]:38686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3oJM6YQgKCME31ohv0zonvvnsl.jvtxlt1-hytuvunu1.vyn@flex--wuhaotsh.bounces.google.com>)
 id 1mOT8T-0003XG-Sv
 for qemu-arm@nongnu.org; Thu, 09 Sep 2021 19:07:16 -0400
Received: by mail-qv1-xf4a.google.com with SMTP id
 a10-20020ad45c4a000000b0037774ba4e8bso277511qva.5
 for <qemu-arm@nongnu.org>; Thu, 09 Sep 2021 16:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=NXWt55pjezy5dMEkLACY8sKG8zq8Wfg4Vr71HclTn7E=;
 b=RWmIO7eOIgVOZ39kBtCqu7cAEAv+i84BHiEgA2DOlusjey4Id95tq9k1gYnTqz8zyI
 geYKO2avf1QbQGZpgLI8bUqzFE/xcAeK90wqfZ5fWm/pXH8zKMMf3RnknmrKc8xzwc7w
 1Qws9q2VaUK4d8u0Qrnz4W8Lv2gTwts78Vxs6erijnGZd9J9fMNMaXH4x/4ToXvFSR65
 paHomHtTDE74u4aLHjzelyTgzk7Y9AZ5fM9B78ll+fHW1rW84Yue5Bi3dTulm7itomi3
 GTahm0kdhV4gzRGUcoUwBYNt8y57q2HiVZT/KPam5bhEgMX5HDin8PbKS91LMZtYkbqP
 GYFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=NXWt55pjezy5dMEkLACY8sKG8zq8Wfg4Vr71HclTn7E=;
 b=BUNS+A664BKf404eWAJBbuDeY5kH8ZOGbeAyR1eFhz9uzJDPiqc7VdTQjDY+LSB31R
 AjQiyvxzq+ptCU5EPo6+Brb7jdC/hhP3trhKV8g4qDAqPTLMn5FOO3EWUZF5gri3GScO
 AafZfRkh9YPpY61Eoo5o04bFh5Eye2LET8aMl2rw4rwMy/hN6nHMnD5EIOu0kI3QATQI
 lOVRznApmjpQP8LjjdVFJQ53zE/AwGlfhdx+pbWnEYt81T/YDtzc2Chtg7OZ6aGtpHco
 jJ8KQFekD6V9qbO5BBvpiB5RreZDjDtX+paUuInow75a6cA1PFs/Scmjx0XCvpXyhMFV
 a53A==
X-Gm-Message-State: AOAM532C1wZTL85P8qWojHvwZ+Qa0nfPru26/otn2kKQ9iey2FREMQC6
 E7jLnMEYPixT+mjzuTLHMg+Zbcnq/tRTGA==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a0c:e2d3:: with SMTP id
 t19mr5427565qvl.23.1631228832567; Thu, 09 Sep 2021 16:07:12 -0700 (PDT)
Date: Thu,  9 Sep 2021 16:06:14 -0700
In-Reply-To: <20210909230620.511815-1-wuhaotsh@google.com>
Message-Id: <20210909230620.511815-3-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20210909230620.511815-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.33.0.309.g3052b89438-goog
Subject: [PATCH 2/8] docs/specs: IPMI device emulation: main processor
From: Hao Wu <wuhaotsh@google.com>
To: minyard@acm.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, titusr@google.com, peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f4a;
 envelope-from=3oJM6YQgKCME31ohv0zonvvnsl.jvtxlt1-hytuvunu1.vyn@flex--wuhaotsh.bounces.google.com;
 helo=mail-qv1-xf4a.google.com
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
X-TUID: wUHoAj90VnQ0

From: Havard Skinnemoen <hskinnemoen@google.com>

This document is an attempt to briefly document the existing IPMI
emulation support on the main processor. It provides the necessary
background for the BMC-side IPMI emulation proposed by the next patch.

Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 docs/specs/index.rst |   1 +
 docs/specs/ipmi.rst  | 100 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 101 insertions(+)
 create mode 100644 docs/specs/ipmi.rst

diff --git a/docs/specs/index.rst b/docs/specs/index.rst
index 65e9663916..1b5d177d53 100644
--- a/docs/specs/index.rst
+++ b/docs/specs/index.rst
@@ -11,6 +11,7 @@ guest hardware that is specific to QEMU.
    ppc-spapr-xive
    ppc-spapr-numa
    acpi_hw_reduced_hotplug
+   ipmi
    tpm
    acpi_hest_ghes
    acpi_cpu_hotplug
diff --git a/docs/specs/ipmi.rst b/docs/specs/ipmi.rst
new file mode 100644
index 0000000000..adb098b53d
--- /dev/null
+++ b/docs/specs/ipmi.rst
@@ -0,0 +1,100 @@
+=====================
+IPMI device emulation
+=====================
+
+QEMU supports emulating many types of machines. This includes machines that may
+serve as the main processor in an IPMI system, e.g. x86 or POWER server
+processors, as well as machines emulating ARM-based Baseband Management
+Controllers (BMCs), e.g. AST2xxx or NPCM7xxx systems-on-chip.
+
+Main processor emulation
+========================
+
+A server platform may include one of the following system interfaces for
+communicating with a BMC:
+
+* A Keyboard Controller Style (KCS) Interface, accessible via ISA
+  (``isa-ipmi-kcs``) or PCI (``pci-ipmi-kcs``).
+* A Block Transfer (BT) Interface, accessible via ISA (``isa-ipmi-bt``) or PCI
+  (``pci-ipmi-bt``).
+* An SMBus System Interface (SSIF; ``smbus-ipmi``).
+
+These interfaces can all be emulated by QEMU. To emulate the behavior of the
+BMC, the messaging interface emulators use one of the following backends:
+
+* A BMC simulator running within the QEMU process (``ipmi-bmc-sim``).
+* An external BMC simulator or emulator, connected over a chardev
+  (``ipmi-bmc-extern``). `ipmi_sim
+  <https://github.com/wrouesnel/openipmi/blob/master/lanserv/README.ipmi_sim>`_
+  from OpenIPMI is an example external BMC emulator.
+
+The following diagram shows how these entities relate to each other.
+
+.. blockdiag::
+
+    blockdiag main_processor_ipmi {
+        orientation = portrait
+        default_group_color = "none";
+        class msgif [color = lightblue];
+        class bmc [color = salmon];
+
+        ipmi_sim [color="aquamarine", label="External BMC"]
+        ipmi-bmc-extern <-> ipmi_sim [label="chardev"];
+
+        group {
+            orientation = portrait
+
+            ipmi-interface <-> ipmi-bmc;
+
+            group {
+                orientation = portrait
+
+                ipmi-interface [class = "msgif"];
+                isa-ipmi-kcs [class="msgif", stacked];
+
+                ipmi-interface <- isa-ipmi-kcs [hstyle = generalization];
+            }
+
+
+            group {
+                orientation = portrait
+
+                ipmi-bmc [class = "bmc"];
+                ipmi-bmc-sim [class="bmc"];
+                ipmi-bmc-extern [class="bmc"];
+
+                ipmi-bmc <- ipmi-bmc-sim [hstyle = generalization];
+                ipmi-bmc <- ipmi-bmc-extern [hstyle = generalization];
+            }
+
+        }
+    }
+
+IPMI System Interfaces
+----------------------
+
+The system software running on the main processor may use a *system interface*
+to communicate with the BMC. These are hardware devices attached to an ISA, PCI
+or i2c bus, and in QEMU, they all need to implement ``ipmi-interface``.
+This allows a BMC implementation to interact with the system interface in a
+standard way.
+
+IPMI BMC
+--------
+
+The system interface devices delegate emulation of BMC behavior to a BMC
+device, that is a subclass of ``ipmi-bmc``. This type of device is called
+a BMC because that's what it looks like to the main processor guest software.
+
+The BMC behavior may be simulated within the qemu process (``ipmi-bmc-sim``) or
+further delegated to an external emulator, or a real BMC. The
+``ipmi-bmc-extern`` device has a required ``chardev`` property which specifies
+the communications channel to the external BMC.
+
+Wire protocol
+=============
+
+The wire protocol used between ``ipmi-bmc-extern`` and the external BMC
+emulator is defined by `README.vm
+<https://github.com/wrouesnel/openipmi/blob/master/lanserv/README.vm>`_ from
+the OpenIPMI project.
-- 
2.33.0.309.g3052b89438-goog

