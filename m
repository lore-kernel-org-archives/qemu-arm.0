Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp1495095ejb;
        Fri, 24 Mar 2023 16:10:42 -0700 (PDT)
X-Google-Smtp-Source: AK7set+SbAL2oi3vHEuskM35qhxvmcUkq5WGuYnth5s6XyZEtXkodLZqkvdRSe5KvRziy4fhUHih
X-Received: by 2002:a05:622a:1a01:b0:3d8:8d4b:c7cc with SMTP id f1-20020a05622a1a0100b003d88d4bc7ccmr8122701qtb.46.1679699442651;
        Fri, 24 Mar 2023 16:10:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679699442; cv=none;
        d=google.com; s=arc-20160816;
        b=PInHnoKBEZYzCgjSSSFdAD3w1e3woDnXnyPtBcUcqpw7zsrM905Wq2U1KSk3d9v17z
         9q3puyjvbuGSXShmCxEkX+kJ0hm6ZQ+o4Pzo8CLXnOVW38L2ji7g6Nvq7ttsxZ0E7o5B
         JIOQWGDPVLzSuDq46WgdjpT0pav5NWXtLmhcaTHwE/K8GM3lNQztNMw8PAjoRJpkvjOR
         cvBr1D45Bo5IJgaHN57+OtuLwcT9j/95VzDyMGoiBisddWwuqjOR148Tsbw9rCbz3yDH
         8czoJOVmXnI2+C9n6/XlKPUaJo2i6DygG9NN1B7apbKA4Q7KISt50IFT4pfrVtUz98M5
         7WaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=Wy+QXivZWG6sei776iRdoGPRBV1td8fSYtwRoJlCwUU=;
        b=ufeZOCoinZwnZA/o59v3iLi+x/oHHYFCITt9bQsqAG3rGzSKboxFgWne/zrA7Zj7It
         HrVLGz74Glh3YXxjKG4ekC9l5GXAWZeH4FnhMAkfNsHeVwuwKpx6sA6T+Fpvfjdemn+8
         nVZh15VdmIWDE9fhqkjuGsxacawo76MRB8WSj4JFtxJoJL84DZDD5orbcDissBxT3A/M
         we/V+xYjS4RhbtlGVZd9XzORzSEroewNSvFsrIm9z1yiIPnAClygm8HN8izvG1enO3wS
         NTUFLOV++uJLe5P/y+InmOs4sva5sJeaKhQUOW5xlTbQcBhSNVzukGXjqPNU3WtuySud
         zpGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=k4Qw9cAC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o16-20020ac85a50000000b003b82e360fecsi9954633qta.183.2023.03.24.16.10.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Mar 2023 16:10:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=k4Qw9cAC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfqXe-0002Nl-2q; Fri, 24 Mar 2023 19:09:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3tS0eZAgKCrAmkXQejiXWeeWbU.SecgUck-TUlUbdedWdk.ehW@flex--wuhaotsh.bounces.google.com>)
 id 1pfqXb-0002M7-E9
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 19:09:47 -0400
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3tS0eZAgKCrAmkXQejiXWeeWbU.SecgUck-TUlUbdedWdk.ehW@flex--wuhaotsh.bounces.google.com>)
 id 1pfqXZ-00083A-ED
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 19:09:47 -0400
Received: by mail-pl1-x649.google.com with SMTP id
 n13-20020a170902d2cd00b001a22d27406bso185627plc.13
 for <qemu-devel@nongnu.org>; Fri, 24 Mar 2023 16:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1679699382;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=Wy+QXivZWG6sei776iRdoGPRBV1td8fSYtwRoJlCwUU=;
 b=k4Qw9cACa6HXj3Gk2wOg8MpoV820+ksu44bZNB2ArjpxFnzkiMLH5ganPC/w40lng1
 P4fangQzJj92eWZN0xu1STmHIT4YsLPwQANQ8hEuggy1PwwwMEYIKJo6s1F7qSrsp5VU
 jecX+ykQrPJAKLiRezuEK08Le9O/iXclVxSAkPYii7V5oyQKoI1rt5nN4dFMXKSp0bPd
 SLhOoaW5FVd2Jh0aTsYsqU60MSGsbcTe33VsQRUdl9SM0T4tO7AgXk48MGPW64W208hi
 48By3ItD/Q8sekYFcxiKzOHagLUV9j/8Lm0T+Rs/5wEUIJApA6SFpPOvtgsOTDjU14O+
 U0BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679699382;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Wy+QXivZWG6sei776iRdoGPRBV1td8fSYtwRoJlCwUU=;
 b=pqiJGWOwT18PSgc8pVsnYE4CPxvbJUzzdXIWVKuS0E6mHKG6Gk+TqbbvhXJtbRTVQ/
 xN+85G9qikb51HnRaeDHxKh/hYr7XfXC3hwNQRU4YyjNojiz2GY+5kp2AVnwvdpRBqiK
 lDaIHM8kFw3fR+skudLR5J/2LHSDtg3F8aDMtCaEDmuU76gsPE6IZK4odaOHja5upgMW
 ta9pk1GYeFxCQtiFpXOQW/gkTBnI5n1UuQ2NSm4FFx1jKVFbrLLU4JOVtk0piyMixavK
 gmZpnr8DpGHHH4I7aY5eDmo4QUfGWvTcOd3n/ct1zOIl9bGi0INaxhTkZk2/j07PnxMu
 sz2g==
X-Gm-Message-State: AAQBX9dY/wEm5Q0agxqWmvxoyJimeFkpp1z/dZv7RBPk/ydEUN4HP3wM
 NHyIJY6O5sOfjCio0gwL/bNwL4HdRkx8aA==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:90a:c482:b0:240:1208:a38 with SMTP id
 j2-20020a17090ac48200b0024012080a38mr1355285pjt.9.1679699381772; Fri, 24 Mar
 2023 16:09:41 -0700 (PDT)
Date: Fri, 24 Mar 2023 16:08:59 -0700
In-Reply-To: <20230324230904.3710289-1-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20230324230904.3710289-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Message-ID: <20230324230904.3710289-3-wuhaotsh@google.com>
Subject: [PATCH v2 2/7] docs/specs: IPMI device emulation: main processor
From: Hao Wu <wuhaotsh@google.com>
To: minyard@acm.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, titusr@google.com, peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::649;
 envelope-from=3tS0eZAgKCrAmkXQejiXWeeWbU.SecgUck-TUlUbdedWdk.ehW@flex--wuhaotsh.bounces.google.com;
 helo=mail-pl1-x649.google.com
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
X-TUID: FUZ7kTtH+8+t

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
index a58d9311cb..0b0ff4cbc4 100644
--- a/docs/specs/index.rst
+++ b/docs/specs/index.rst
@@ -12,6 +12,7 @@ guest hardware that is specific to QEMU.
    ppc-spapr-xive
    ppc-spapr-numa
    acpi_hw_reduced_hotplug
+   ipmi
    tpm
    acpi_hest_ghes
    acpi_cpu_hotplug
diff --git a/docs/specs/ipmi.rst b/docs/specs/ipmi.rst
new file mode 100644
index 0000000000..e0badc7f15
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
+  <https://sourceforge.net/p/openipmi/code/ci//master/tree/lanserv/README.ipmi_sim>`_
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
+or i2c bus, and in QEMU, they all need to implement ``ipmi-interface-host``.
+This allows a BMC implementation to interact with the system interface in a
+standard way.
+
+IPMI BMC
+--------
+
+The system interface devices delegate emulation of BMC behavior to a BMC
+device, that is a subclass of ``ipmi-bmc-host``. This type of device is called
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
+<https://sourceforge.net/p/openipmi/code/ci/master/tree/lanserv/README.vm>`_
+from the OpenIPMI project.
-- 
2.40.0.348.gf938b09366-goog

