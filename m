Received: by 2002:a17:505:1e8b:b0:1be9:327d:8ee3 with SMTP id mw11csp986360njb;
        Mon, 5 Aug 2024 13:17:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUplSb150XgC2LDFzb/Pc69alQSFVZkMz7rK8Y9hW5ZCWzHC/icx1wbRSULYoVaSQ8JI/c7fkVU2VLGFRfq/h7oVcJWXf2u
X-Received: by 2002:a05:6902:2190:b0:e0b:acc7:b206 with SMTP id 3f1490d57ef6-e0bde26456amr11459190276.8.1722889048535;
        Mon, 05 Aug 2024 13:17:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722889048; cv=none;
        d=google.com; s=arc-20160816;
        b=GgDSyQiTMGlyuJJQuj/LRCQH3PfGLlPc6Kcp0WJkTCzlRlYiyE2UMyEsLjmcZx1mt4
         Ju//c+H3JQDn0FzrOFzD0AmilSfcyPyl1gpLBvy3l4ewEeASGXxVsWt9cNNyALKH78+q
         LtmH8EamQuQiqyokrITEcurnqn+MzBDRUhXBwRkODQCJRxhFs+ZonRvjXR/ut+vlDiLe
         sCVgs8kBpqUIKmEMUyUW6xAgvaRDqkSnYH4H701rlt3mR9b5LY2Q8dm8d3AlG/kS3Oqp
         YItCegbdfkRRBGkoy59rYRiYmaLPghtfBFODP729lhcw1MaBR5gWH6ZkS4W7xOuqaqjE
         qpww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:dkim-signature;
        bh=4wdCCjeNwO8Nd9IfMEbL3mdHNd1GL/ZDoT8770kOdC0=;
        fh=krvzf6IQExm3y/HzKeN79mOPFzgGuur4WEAty6iIdNo=;
        b=Fc3QRBoXzZLDpHnUZJH1RK2PJtIPiycAhSTEyAIfT8Ye8RanmPoCxvuFmxGi/Ryi5v
         jhjQJ/K6qg9yhupOtaW2K8meMG7aZ9fBwhvZlsT9jZlEPxbhzHglNopM14A1PHjjAbHo
         WyNoVMOHrgFNI+6qTXSTHv8Z+QPTzUHKdYiPh6VMFqZAwdoD3hOoqQPP01SepyBEhv4Z
         XY6FOa1I0I3H41/pVpmEEnNmo5nQLI4acJv/CUq9tvOk3orlW88PRfxIxuD4ohFZQdYm
         rwfBlukw2nt7O2LMv7w7IqvOrbKkW8BOFqKWwkNXoSv+eUVr5uBCEFGIv+7lAbMHKDrL
         1TjQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=JwCZl1OL;
       spf=pass (google.com: domain of 3wdoxzgukc78yf0nulttlqj.htrfqj2.gjssjjqnsfwt.twl@flex--tavip.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3WDOxZgUKC78yf0nulttlqj.htrfqj2.gjssjjqnsfwt.twl@flex--tavip.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <3WDOxZgUKC78yf0nulttlqj.htrfqj2.gjssjjqnsfwt.twl@flex--tavip.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id 3f1490d57ef6-e0be533b619sor4825062276.4.2024.08.05.13.17.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 Aug 2024 13:17:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3wdoxzgukc78yf0nulttlqj.htrfqj2.gjssjjqnsfwt.twl@flex--tavip.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=JwCZl1OL;
       spf=pass (google.com: domain of 3wdoxzgukc78yf0nulttlqj.htrfqj2.gjssjjqnsfwt.twl@flex--tavip.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3WDOxZgUKC78yf0nulttlqj.htrfqj2.gjssjjqnsfwt.twl@flex--tavip.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722889048; x=1723493848; darn=linaro.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4wdCCjeNwO8Nd9IfMEbL3mdHNd1GL/ZDoT8770kOdC0=;
        b=JwCZl1OLblXdSULxilw6SapftHElOTkdlePB4EIdH8rEpV3odjP8yWGc1Y/ABBEeet
         gjHyG2BPsAwPUFdSliWPqw0hnaXlnJl9l9NQbgSDIPq1jBEXLJs75pK9eCGSzc2LfEp8
         OMJehFFFeRlpYl86qk5XwwF/TWN9xgUd/73o1GwWMmrn+8LelPsJqRH2sUj6k5M1KVkC
         ZsXprOpXkP40COAlko16LSp/yLndCgd5hjDZ9tzwsOvVxOhe9MpWgxFAtecm5A9BIA0U
         PcfDQK+L98GvNc76SckmRjRVHdT2w6cb0zYQ7KyU12Ar61lX/yk22nsY5exMqEaANMj/
         wkvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722889048; x=1723493848;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4wdCCjeNwO8Nd9IfMEbL3mdHNd1GL/ZDoT8770kOdC0=;
        b=stICj5/j6317yjZzMB/xV7qVD3WbSSyN8vAHEeeDgUJ9BN+d7EDMWSJBjgfkLbhTtu
         ztJXm47DTyyszxrWIvbGU+vwxzVF0B2TQtxnQJF9lSoxL/c+Mwyp2JQgW7oTU1oiGSoi
         QXiUKxSQhPPi/R9tcV6TAq1n0RoZzxpiOSCtdmxjgGagOpsNH4pNboughVl/Zt2UmjBh
         z1BI49JEUbHKXSCu0hnMjqHVf+7tWMadRQ/Wkb3bbxVpVNX8J3x0MbWoa8itl05Z1ijl
         opiHAwcxg5W/U91Vd7kFQGtyel3V21EX83v5dKpekk40nGAREm0a5Y+KMlrnur8p8kAZ
         s0ZA==
X-Forwarded-Encrypted: i=1; AJvYcCVe8BtPu8ooskJgl1ST1gV7dolfVxzQ4BcSrdYeNKKQxrXTFvjYfE5Zbh9Zz+iqtKpBCJdRplykIVB+oQ+MkPAVJVRqBhUQ
X-Gm-Message-State: AOJu0Yz/fGU3/6s7mFeKlbSDNqwYKqaYlexNV1QVk9hkKr0ZiG8fWvi8
	tl8sPKrQ1QPFGETB2098tr4clt1BJzKGs0pnWPLg/Otm5klq8eXhK4B/MeSCe+LauuPdbwrSvQ=
	=
X-Google-Smtp-Source: AGHT+IFc6T3TAxrL7s5Lv7ug2GUJd5MzzOoyezk2KKzPhvbVP98dIUt1LyxRK3Igl2effMsOknmdhYg5+A==
X-Received: from warp10.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:750])
 (user=tavip job=sendgmr) by 2002:a05:6902:709:b0:e0b:9412:3295 with SMTP id
 3f1490d57ef6-e0bde1eaf4bmr23833276.3.1722889048127; Mon, 05 Aug 2024 13:17:28
 -0700 (PDT)
Date: Mon,  5 Aug 2024 13:16:59 -0700
In-Reply-To: <20240805201719.2345596-1-tavip@google.com>
Mime-Version: 1.0
References: <20240805201719.2345596-1-tavip@google.com>
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
Message-ID: <20240805201719.2345596-5-tavip@google.com>
Subject: [RFC PATCH 04/23] hw/arm: add SVD file for NXP i.MX RT595
From: Octavian Purdila <tavip@google.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, stefanst@google.com, pbonzini@redhat.com, 
	alex.bennee@linaro.org, thuth@redhat.com, peter.maydell@linaro.org, 
	marcandre.lureau@redhat.com, alistair@alistair23.me, berrange@redhat.com, 
	philmd@linaro.org, jsnow@redhat.com, crosa@redhat.com, bleal@redhat.com
Content-Type: text/plain; charset="UTF-8"
X-TUID: HR7g62QsREtU

Picked from:

https://github.com/nxp-mcuxpresso/mcux-soc-svd/blob/main/MIMXRT595S/MIMXRT595S_cm33.xml

NOTE: the file is truncated to keep the email size reasonable. Please
use the link above and download the full file if you want to try out
the patch.

Signed-off-by: Octavian Purdila <tavip@google.com>
---
 hw/arm/svd/MIMXRT595S_cm33.xml | 224052 ++++++++++++++++++++++++++++++
 1 file changed, 224052 insertions(+)
 create mode 100644 hw/arm/svd/MIMXRT595S_cm33.xml

diff --git a/hw/arm/svd/MIMXRT595S_cm33.xml b/hw/arm/svd/MIMXRT595S_cm33.xml
new file mode 100644
index 0000000000..8943aa3555
--- /dev/null
+++ b/hw/arm/svd/MIMXRT595S_cm33.xml
@@ -0,0 +1,1725 @@
+<?xml version="1.0" encoding="UTF-8"?>
+<device schemaVersion="1.3" xmlns:xs="http://www.w3.org/2001/XMLSchema-instance" xs:noNamespaceSchemaLocation="CMSIS-SVD.xsd">
+  <vendor>nxp.com</vendor>
+  <name>MIMXRT595S_cm33</name>
+  <version>1.0</version>
+  <description>MIMXRT595SFAWC,MIMXRT595SFFOC</description>
+  <licenseText>
+Copyright 2016-2023 NXP
+SPDX-License-Identifier: BSD-3-Clause
+  </licenseText>
+  <cpu>
+    <name>CM33</name>
+    <revision>r2p0</revision>
+    <endian>little</endian>
+    <mpuPresent>true</mpuPresent>
+    <fpuPresent>true</fpuPresent>
+    <vtorPresent>true</vtorPresent>
+    <nvicPrioBits>3</nvicPrioBits>
+    <vendorSystickConfig>false</vendorSystickConfig>
+  </cpu>
+  <addressUnitBits>8</addressUnitBits>
+  <width>32</width>
+  <peripherals>
+    <peripheral>
+      <name>RSTCTL0</name>
+      <description>Reset Controller 0</description>
+      <groupName>RSTCTL0</groupName>
+      <baseAddress>0x40000000</baseAddress>
+      <addressBlock>
+        <offset>0</offset>
+        <size>0x7C</size>
+        <usage>registers</usage>
+      </addressBlock>
+      <registers>
+        <register>
+          <name>SYSRSTSTAT</name>
+          <description>System Reset Status Register</description>
+          <addressOffset>0</addressOffset>
+          <size>32</size>
+          <access>read-write</access>
+          <resetValue>0x1</resetValue>
+          <resetMask>0xFFFFFFFF</resetMask>
+          <fields>
+            <field>
+              <name>VDD_POR</name>
+              <description>VDD CORE Power-On Reset (POR) was detected</description>
+              <bitOffset>0</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>read-write</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>VDD_POR_EVENT_IS_NOT_DETECTED</name>
+                  <description>No VDD CORE POR event is detected</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>VDD_POR_EVENT_WAS_DETECTED</name>
+                  <description>VDD CORE POR event was detected</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+            <field>
+              <name>PAD_RESET</name>
+              <description>RESETN pin reset was detected</description>
+              <bitOffset>4</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>read-write</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>PAD_RESET_IS_NOT_DETECTED</name>
+                  <description>No RESETN pin event is detected</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>PAD_RESET_WAS_DETECTED</name>
+                  <description>RESETN pin event was detected. Write '1' to clear this bit</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+            <field>
+              <name>ARM_RESET</name>
+              <description>ARM reset was detected</description>
+              <bitOffset>5</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>read-write</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>ARM_RESET_IS_NOT_DETECTED</name>
+                  <description>No ARM reset event is detected</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>ARM_RESET_WAS_DETECTED</name>
+                  <description>ARM reset was detected. Write '1' to clear this bit</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+            <field>
+              <name>WDT0_RESET</name>
+              <description>WatchDog Timer 0 reset was detected</description>
+              <bitOffset>6</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>read-write</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>WDT0_RESET_IS_NOT_DETECTED</name>
+                  <description>No WDT0 reset event detected</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>WDT0_RESET_WAS_DETECTED</name>
+                  <description>WDT0 reset event detected. Write '1' to clear this bit</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+            <field>
+              <name>WDT1_RESET</name>
+              <description>WatchDog Timer 1 reset was detected</description>
+              <bitOffset>7</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>read-write</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>WDT1_RESET_IS_NOT_DETECTED</name>
+                  <description>No WDT1 reset event detected</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>WDT1_RESET_WAS_DETECTED</name>
+                  <description>WDT1 reset event detected. Write '1' to clear this bit</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+          </fields>
+        </register>
+        <register>
+          <name>PRSTCTL0</name>
+          <description>Peripheral Reset Control Register 0</description>
+          <addressOffset>0x10</addressOffset>
+          <size>32</size>
+          <access>read-write</access>
+          <resetValue>0x7DF51F0A</resetValue>
+          <resetMask>0xFFFFFFFF</resetMask>
+          <fields>
+            <field>
+              <name>DSP</name>
+              <description>Fusion F1 DSP reset control</description>
+              <bitOffset>1</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>read-write</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>DSP_CLR</name>
+                  <description>Clear Reset</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>DSP_SET</name>
+                  <description>Set Reset</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+            <field>
+              <name>AXI_SWITCH</name>
+              <description>AXI Switch reset control</description>
+              <bitOffset>3</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>read-write</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>AXI_SWITCH_CLR</name>
+                  <description>Clear Reset</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>AXI_SWITCH_SET</name>
+                  <description>Set Reset</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+            <field>
+              <name>POWERQUAD</name>
+              <description>POWERQUAD reset control</description>
+              <bitOffset>8</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>read-write</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>POWERQUAD_CLR</name>
+                  <description>Clear Reset</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>POWERQUAD_SET</name>
+                  <description>Set Reset</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+            <field>
+              <name>CASPER</name>
+              <description>CASPER reset control</description>
+              <bitOffset>9</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>read-write</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>CASPER_CLR</name>
+                  <description>Clear Reset</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>CASPER_SET</name>
+                  <description>Set Reset</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+            <field>
+              <name>HASHCRYPT</name>
+              <description>Hash-Crypt reset control</description>
+              <bitOffset>10</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>read-write</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>HASHCRYPT_CLR</name>
+                  <description>Clear Reset</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>HASHCRYPT_SET</name>
+                  <description>Set Reset</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+            <field>
+              <name>PUF</name>
+              <description>PUF reset control</description>
+              <bitOffset>11</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>read-write</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>PUF_CLR</name>
+                  <description>Clear Reset</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>PUF_SET</name>
+                  <description>Set Reset</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+            <field>
+              <name>RNG</name>
+              <description>RNG reset control</description>
+              <bitOffset>12</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>read-write</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>RNG_CLR</name>
+                  <description>Clear Reset</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>RNG_SET</name>
+                  <description>Set Reset</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+            <field>
+              <name>FLEXSPI0_OTFAD</name>
+              <description>FLEXSPI0 and OTFAD reset control</description>
+              <bitOffset>16</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>read-write</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>FLEXSPI0_OTFAD_CLR</name>
+                  <description>Clear Reset</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>FLEXSPI0_OTFAD_SET</name>
+                  <description>Set Reset</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+            <field>
+              <name>FLEXSPI1</name>
+              <description>FLEXSPI1 reset control</description>
+              <bitOffset>18</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>read-write</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>FLEXSPI1_CLR</name>
+                  <description>Clear Reset</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>FLEXSPI1_SET</name>
+                  <description>Set Reset</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+            <field>
+              <name>USBHS_PHY</name>
+              <description>USB PHY reset control</description>
+              <bitOffset>20</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>read-write</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>USBHS_PHY_CLR</name>
+                  <description>Clear Reset</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>USBHS_PHY_SET</name>
+                  <description>Set Reset</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+            <field>
+              <name>USBHS_DEVICE</name>
+              <description>USB HS Device reset control</description>
+              <bitOffset>21</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>read-write</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>USBHS_DEVICE_CLR</name>
+                  <description>Clear Reset</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>USBHS_DEVICE_SET</name>
+                  <description>Set Reset</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+            <field>
+              <name>USBHS_HOST</name>
+              <description>USB HOST reset control</description>
+              <bitOffset>22</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>read-write</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>USBHS_HOST_CLR</name>
+                  <description>Clear Reset</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>USBHS_HOST_SET</name>
+                  <description>Set Reset</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+            <field>
+              <name>USBHS_SRAM</name>
+              <description>USB RAM reset control</description>
+              <bitOffset>23</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>read-write</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>USBHS_SRAM_CLR</name>
+                  <description>Clear Reset</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>USBHS_SRAM_SET</name>
+                  <description>Set Reset</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+            <field>
+              <name>SCT</name>
+              <description>SCTimer reset control</description>
+              <bitOffset>24</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>read-write</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>SCT_CLR</name>
+                  <description>Clear Reset</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>SCT_SET</name>
+                  <description>Set Reset</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+            <field>
+              <name>GPU</name>
+              <description>GPU reset control</description>
+              <bitOffset>26</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>read-write</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>GPU_CLR</name>
+                  <description>Clear Reset</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>GPU_SET</name>
+                  <description>Set Reset</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+            <field>
+              <name>DISPLAY_CONTROLLER</name>
+              <description>LCDIF Display Controller reset control</description>
+              <bitOffset>27</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>read-write</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>DISPLAY_CONTROLLER_CLR</name>
+                  <description>Clear Reset</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>DISPLAY_CONTROLLER_SET</name>
+                  <description>Set Reset</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+            <field>
+              <name>MIPI_DSI_CONTROLLER</name>
+              <description>MIPI Digital serial Interface controller reset control</description>
+              <bitOffset>28</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>read-write</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>MIPI_DSI_CONTROLLER_CLR</name>
+                  <description>Clear Reset</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>MIPI_DSI_CONTROLLER_SET</name>
+                  <description>Set Reset</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+            <field>
+              <name>MIPI_DSI_PHY</name>
+              <description>MIPI DSI PHY reset control</description>
+              <bitOffset>29</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>read-write</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>MIPI_DSI_PHY_CLR</name>
+                  <description>Clear Reset</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>MIPI_DSI_PHY_SET</name>
+                  <description>Set Reset</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+            <field>
+              <name>SMARTDMA</name>
+              <description>SMARTDMA Event/Algorithm handler reset control</description>
+              <bitOffset>30</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>read-write</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>SMARTDMA_CLR</name>
+                  <description>Clear Reset</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>SMARTDMA_SET</name>
+                  <description>Set Reset</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+          </fields>
+        </register>
+        <register>
+          <name>PRSTCTL1</name>
+          <description>Peripheral Reset Control Register 1</description>
+          <addressOffset>0x14</addressOffset>
+          <size>32</size>
+          <access>read-write</access>
+          <resetValue>0x101800C</resetValue>
+          <resetMask>0xFFFFFFFF</resetMask>
+          <fields>
+            <field>
+              <name>SDIO0</name>
+              <description>SDIO0 reset control</description>
+              <bitOffset>2</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>read-write</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>SDIO0_CLR</name>
+                  <description>Clear Reset</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>SDIO0_SET</name>
+                  <description>Set Reset</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+            <field>
+              <name>SDIO1</name>
+              <description>SDIO1 reset control</description>
+              <bitOffset>3</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>read-write</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>SDIO1_CLR</name>
+                  <description>Clear Reset</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>SDIO1_SET</name>
+                  <description>Set Reset</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+            <field>
+              <name>ACMP0</name>
+              <description>Analog comparator reset control</description>
+              <bitOffset>15</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>read-write</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>ACMP0_CLR</name>
+                  <description>Clear Reset</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>ACMP0_SET</name>
+                  <description>Set Reset</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+            <field>
+              <name>ADC0</name>
+              <description>Analog-to-Digital converter reset control</description>
+              <bitOffset>16</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>read-write</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>ADC0_CLR</name>
+                  <description>Clear Reset</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>ADC0_SET</name>
+                  <description>Set Reset</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+            <field>
+              <name>SHSGPIO0</name>
+              <description>Secure GPIO 0 reset control</description>
+              <bitOffset>24</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>read-write</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>SHSGPIO0_CLR</name>
+                  <description>Clear Reset</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>SHSGPIO0_SET</name>
+                  <description>Set Reset</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+          </fields>
+        </register>
+        <register>
+          <name>PRSTCTL2</name>
+          <description>Peripheral Reset Control Register 2</description>
+          <addressOffset>0x18</addressOffset>
+          <size>32</size>
+          <access>read-write</access>
+          <resetValue>0x1C000001</resetValue>
+          <resetMask>0xFFFFFFFF</resetMask>
+          <fields>
+            <field>
+              <name>UTICK0</name>
+              <description>Micro-tick timer reset control</description>
+              <bitOffset>0</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>read-write</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>UTICK0_CLR</name>
+                  <description>Clear Reset</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>UTICK0_SET</name>
+                  <description>Set Reset</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+            <field>
+              <name>WWDT0</name>
+              <description>Watchdog timer reset control</description>
+              <bitOffset>1</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>read-write</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>WWDT0_CLR</name>
+                  <description>Clear Reset</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>WWDT0_SET</name>
+                  <description>Set Reset</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+          </fields>
+        </register>
+        <register>
+          <name>PRSTCTL0_SET</name>
+          <description>Peripheral Reset Control Register 0 SET</description>
+          <addressOffset>0x40</addressOffset>
+          <size>32</size>
+          <access>write-only</access>
+          <resetValue>0</resetValue>
+          <resetMask>0</resetMask>
+          <fields>
+            <field>
+              <name>DSP</name>
+              <description>Fusion_ DSP reset set</description>
+              <bitOffset>1</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>write-only</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>DSP_CLR</name>
+                  <description>No Effect</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>DSP_SET</name>
+                  <description>Sets the PRSTCTL0 Bit</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+            <field>
+              <name>AXI_SWITCH</name>
+              <description>AXI SWITCH reset set</description>
+              <bitOffset>3</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>write-only</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>AXI_SWITCH_CLR</name>
+                  <description>No Effect</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>AXI_SWITCH_SET</name>
+                  <description>Sets the PRSTCTL0 Bit</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+            <field>
+              <name>POWERQUAD</name>
+              <description>POWERQUAD reset set</description>
+              <bitOffset>8</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>write-only</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>POWERQUAD_CLR</name>
+                  <description>No Effect</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>POWERQUAD_SET</name>
+                  <description>Sets the PRSTCTL0 Bit</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+            <field>
+              <name>CASPER</name>
+              <description>CASPER reset set</description>
+              <bitOffset>9</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>write-only</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>CASPER_CLR</name>
+                  <description>No Effect</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>CASPER_SET</name>
+                  <description>Sets the PRSTCTL0 Bit</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+            <field>
+              <name>HASHCRYPT</name>
+              <description>HASHCRYPT reset set</description>
+              <bitOffset>10</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>write-only</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>HASHCRYPT_CLR</name>
+                  <description>No Effect</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>HASHCRYPT_SET</name>
+                  <description>Sets the PRSTCTL0 Bit</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+            <field>
+              <name>PUF</name>
+              <description>PUF reset set</description>
+              <bitOffset>11</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>write-only</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>PUF_CLR</name>
+                  <description>No Effect</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>PUF_SET</name>
+                  <description>Sets the PRSTCTL0 Bit</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+            <field>
+              <name>RNG</name>
+              <description>RNG reset set</description>
+              <bitOffset>12</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>write-only</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>RNG_CLR</name>
+                  <description>No Effect</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>RNG_SET</name>
+                  <description>Sets the PRSTCTL0 Bit</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+            <field>
+              <name>FLEXSPI0_OTFAD</name>
+              <description>FLEXSPI0 and OTFAD reset set</description>
+              <bitOffset>16</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>write-only</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>FLEXSPI0_OTFAD_CLR</name>
+                  <description>No Effect</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>FLEXSPI0_OTFAD_SET</name>
+                  <description>Sets the PRSTCTL0 Bit</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+            <field>
+              <name>FLEXSPI1</name>
+              <description>FLEXSPI1 reset set</description>
+              <bitOffset>18</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>write-only</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>FLEXSPI1_CLR</name>
+                  <description>No Effect</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>FLEXSPI1_SET</name>
+                  <description>Sets the PRSTCTL0 Bit</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+            <field>
+              <name>USBHS_PHY</name>
+              <description>USB PHY reset set</description>
+              <bitOffset>20</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>write-only</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>USBHS_PHY_CLR</name>
+                  <description>No Effect</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>USBHS_PHY_SET</name>
+                  <description>Sets the PRSTCTL0 Bit</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+            <field>
+              <name>USBHS_DEVICE</name>
+              <description>USB Device reset set</description>
+              <bitOffset>21</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>write-only</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>USBHS_DEVICE_CLR</name>
+                  <description>No Effect</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>USBHS_DEVICE_SET</name>
+                  <description>Sets the PRSTCTL0 Bit</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+            <field>
+              <name>USBHS_HOST</name>
+              <description>USB HOST reset set</description>
+              <bitOffset>22</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>write-only</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>USBHS_HOST_CLR</name>
+                  <description>No Effect</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>USBHS_HOST_SET</name>
+                  <description>Sets the PRSTCTL0 Bit</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+            <field>
+              <name>USBHS_SRAM</name>
+              <description>USBHS SRAM reset set</description>
+              <bitOffset>23</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>write-only</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>USBHS_SRAM_CLR</name>
+                  <description>No Effect</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>USBHS_SRAM_SET</name>
+                  <description>Sets the PRSTCTL0 Bit</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+            <field>
+              <name>SCT</name>
+              <description>SCTimer reset set</description>
+              <bitOffset>24</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>write-only</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>SCT_CLR</name>
+                  <description>No Effect</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>SCT_SET</name>
+                  <description>Sets the PRSTCTL0 Bit</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+            <field>
+              <name>GPU</name>
+              <description>GPU reset set</description>
+              <bitOffset>26</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>write-only</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>GPU_CLR</name>
+                  <description>No Effect</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>GPU_SET</name>
+                  <description>Sets the PRSTCTL0 Bit</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+            <field>
+              <name>DISPLAY_CONTROLLER</name>
+              <description>LCDIF DISPLAY CONTROLLER reset set</description>
+              <bitOffset>27</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>write-only</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>DISPLAY_CONTROLLER_CLR</name>
+                  <description>No Effect</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>DISPLAY_CONTROLLER_SET</name>
+                  <description>Sets the PRSTCTL0 Bit</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+            <field>
+              <name>MIPI_DSI_CONTROLLER</name>
+              <description>MIPI DSI controller reset set</description>
+              <bitOffset>28</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>write-only</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>MIPI_DSI_CONTROLLER_CLR</name>
+                  <description>No Effect</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>MIPI_DSI_CONTROLLER_SET</name>
+                  <description>Sets the PRSTCTL0 Bit</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+            <field>
+              <name>MIPI_DSI_PHY</name>
+              <description>MIPI DSI PHY reset set</description>
+              <bitOffset>29</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>write-only</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>MIPI_DSI_PHY_CLR</name>
+                  <description>No Effect</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>MIPI_DSI_PHY_SET</name>
+                  <description>Sets the PRSTCTL0 Bit</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+            <field>
+              <name>SMARTDMA</name>
+              <description>SMARTDMA Event/Algorithm handler reset set</description>
+              <bitOffset>30</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>write-only</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>SMARTDMA_CLR</name>
+                  <description>No Effect</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>SMARTDMA_SET</name>
+                  <description>Sets the PRSTCTL0 Bit</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+          </fields>
+        </register>
+        <register>
+          <name>PRSTCTL1_SET</name>
+          <description>Peripheral Reset Control Register 1 SET</description>
+          <addressOffset>0x44</addressOffset>
+          <size>32</size>
+          <access>write-only</access>
+          <resetValue>0</resetValue>
+          <resetMask>0</resetMask>
+          <fields>
+            <field>
+              <name>SDIO0</name>
+              <description>SDIO0 reset set</description>
+              <bitOffset>2</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>write-only</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>SDIO0_CLR</name>
+                  <description>No effect</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>SDIO0_SET</name>
+                  <description>Sets the PRSTCTL1 Bit</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+            <field>
+              <name>SDIO1</name>
+              <description>SDIO1 reset set</description>
+              <bitOffset>3</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>write-only</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>SDIO1_CLR</name>
+                  <description>No effect</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>SDIO1_SET</name>
+                  <description>Sets the PRSTCTL1 Bit</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+            <field>
+              <name>ACMP0</name>
+              <description>ACMP0 reset set</description>
+              <bitOffset>15</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>write-only</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>ACMP0_CLR</name>
+                  <description>No effect</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>ACMP0_SET</name>
+                  <description>Sets the PRSTCTL1 Bit</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+            <field>
+              <name>ADC0</name>
+              <description>ADC0 reset set</description>
+              <bitOffset>16</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>write-only</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>ADC0_CLR</name>
+                  <description>No effect</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>ADC0_SET</name>
+                  <description>Sets the PRSTCTL1 Bit</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+            <field>
+              <name>SHSGPIO0</name>
+              <description>SHSGPIO0 reset set</description>
+              <bitOffset>24</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>write-only</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>SHSGPIO0_CLR</name>
+                  <description>No effect</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>SHSGPIO0_SET</name>
+                  <description>Sets the PRSTCTL1 Bit</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+          </fields>
+        </register>
+        <register>
+          <name>PRSTCTL2_SET</name>
+          <description>Peripheral Reset Control Register 2 SET</description>
+          <addressOffset>0x48</addressOffset>
+          <size>32</size>
+          <access>write-only</access>
+          <resetValue>0</resetValue>
+          <resetMask>0</resetMask>
+          <fields>
+            <field>
+              <name>UTICK0</name>
+              <description>Micro-tick timer 0 reset set</description>
+              <bitOffset>0</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>write-only</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>UTICK0_CLR</name>
+                  <description>No effect</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>UTICK0_SET</name>
+                  <description>Sets the PRSTCTL2 Bit</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+            <field>
+              <name>WWDT0</name>
+              <description>WWDT0 reset set</description>
+              <bitOffset>1</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>write-only</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>WWDT0_CLR</name>
+                  <description>No effect</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>WWDT0_SET</name>
+                  <description>Sets the PRSTCTL2 Bit</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+          </fields>
+        </register>
+        <register>
+          <name>PRSTCTL0_CLR</name>
+          <description>Peripheral Reset Control Register 0 CLR</description>
+          <addressOffset>0x70</addressOffset>
+          <size>32</size>
+          <access>write-only</access>
+          <resetValue>0</resetValue>
+          <resetMask>0</resetMask>
+          <fields>
+            <field>
+              <name>DSP</name>
+              <description>Fusion_ F1 DSP reset clear</description>
+              <bitOffset>1</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>write-only</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>DSP_CLR</name>
+                  <description>No effect</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>DSP_SET</name>
+                  <description>Clears the PRSTCTL0 Bit</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+            <field>
+              <name>AXI_SWITCH</name>
+              <description>AXI SWITCH reset clear</description>
+              <bitOffset>3</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>write-only</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>AXI_SWITCH_CLR</name>
+                  <description>No effect</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>AXI_SWITCH_SET</name>
+                  <description>Clears the PRSTCTL0 Bit</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+            <field>
+              <name>POWERQUAD</name>
+              <description>POWERQUAD reset clear</description>
+              <bitOffset>8</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>write-only</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>POWERQUAD_CLR</name>
+                  <description>No effect</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>POWERQUAD_SET</name>
+                  <description>Clears the PRSTCTL0 Bit</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+            <field>
+              <name>CASPER</name>
+              <description>CASPER reset clear</description>
+              <bitOffset>9</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>write-only</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>CASPER_CLR</name>
+                  <description>No effect</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>CASPER_SET</name>
+                  <description>Clears the PRSTCTL0 Bit</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+            <field>
+              <name>HASHCRYPT</name>
+              <description>HASHCRYPT reset clear</description>
+              <bitOffset>10</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>write-only</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>HASHCRYPT_CLR</name>
+                  <description>No effect</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>HASHCRYPT_SET</name>
+                  <description>Clears the PRSTCTL0 Bit</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+            <field>
+              <name>PUF</name>
+              <description>PUF reset clear</description>
+              <bitOffset>11</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>write-only</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>PUF_CLR</name>
+                  <description>No effect</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>PUF_SET</name>
+                  <description>Clears the PRSTCTL0 Bit</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+            <field>
+              <name>RNG</name>
+              <description>RNG reset clear</description>
+              <bitOffset>12</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>write-only</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>RNG_CLR</name>
+                  <description>No effect</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>RNG_SET</name>
+                  <description>Clears the PRSTCTL0 Bit</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+            <field>
+              <name>FLEXSPI0_OTFAD</name>
+              <description>FLEXSPI0 and OTFAD reset clear</description>
+              <bitOffset>16</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>write-only</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>FLEXSPI0_OTFAD_CLR</name>
+                  <description>No effect</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>FLEXSPI0_OTFAD_SET</name>
+                  <description>Clears the PRSTCTL0 Bit</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+            <field>
+              <name>FLEXSPI1</name>
+              <description>FLEXSPI1 reset clear</description>
+              <bitOffset>18</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>write-only</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>FLEXSPI1_CLR</name>
+                  <description>No effect</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>FLEXSPI1_SET</name>
+                  <description>Clears the PRSTCTL0 Bit</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+            <field>
+              <name>USBHS_PHY</name>
+              <description>USB PHY reset clear</description>
+              <bitOffset>20</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>write-only</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>USBHS_PHY_CLR</name>
+                  <description>No effect</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>USBHS_PHY_SET</name>
+                  <description>Clears the PRSTCTL0 Bit</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+            <field>
+              <name>USBHS_DEVICE</name>
+              <description>USB DEVICE reset clear</description>
+              <bitOffset>21</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>write-only</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>USBHS_DEVICE_CLR</name>
+                  <description>No effect</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>USBHS_DEVICE_SET</name>
+                  <description>Clears the PRSTCTL0 Bit</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+            <field>
+              <name>USBHS_HOST</name>
+              <description>USB HOST reset clear</description>
+              <bitOffset>22</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>write-only</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>USBHS_HOST_CLR</name>
+                  <description>No effect</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>USBHS_HOST_SET</name>
+                  <description>Clears the PRSTCTL0 Bit</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+            <field>
+              <name>USBHS_SRAM</name>
+              <description>USBHS SRAM reset clear</description>
+              <bitOffset>23</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>write-only</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>USBHS_SRAM_CLR</name>
+                  <description>No effect</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>USBHS_SRAM_SET</name>
+                  <description>Clears the PRSTCTL0 Bit</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+            <field>
+              <name>SCT</name>
+              <description>SCT reset clear</description>
+              <bitOffset>24</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>write-only</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>SCT_CLR</name>
+                  <description>No effect</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>SCT_SET</name>
+                  <description>Clears the PRSTCTL0 Bit</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+            <field>
+              <name>GPU</name>
+              <description>GPU reset clear</description>
+              <bitOffset>26</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>write-only</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>GPU_CLR</name>
+                  <description>No effect</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>GPU_SET</name>
+                  <description>Clears the PRSTCTL0 Bit</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+            <field>
+              <name>DISPLAY_CONTROLLER</name>
+              <description>LCDIF DISPLAY CONTROLLER reset clear</description>
+              <bitOffset>27</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>write-only</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>DISPLAY_CONTROLLER_CLR</name>
+                  <description>No effect</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>DISPLAY_CONTROLLER_SET</name>
+                  <description>Clears the PRSTCTL0 Bit</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+            <field>
+              <name>MIPI_DSI_CONTROLLER</name>
+              <description>MIPI DSI controller reset clear</description>
+              <bitOffset>28</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>write-only</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>MIPI_DSI_CONTROLLER_CLR</name>
+                  <description>No effect</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>MIPI_DSI_CONTROLLER_SET</name>
+                  <description>Clears the PRSTCTL0 Bit</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+            <field>
+              <name>MIPI_DSI_PHY</name>
+              <description>MIPI DSI PHY reset clear</description>
+              <bitOffset>29</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>write-only</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>MIPI_DSI_PHY_CLR</name>
+                  <description>No effect</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>MIPI_DSI_PHY_SET</name>
+                  <description>Clears the PRSTCTL0 Bit</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+            <field>
+              <name>SMARTDMA</name>
+              <description>SMARTDMA Event/Algorithm handler reset clear</description>
+              <bitOffset>30</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>write-only</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>SMARTDMA_CLR</name>
+                  <description>No effect</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>SMARTDMA_SET</name>
+                  <description>Clears the PRSTCTL0 Bit</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+          </fields>
+        </register>
+        <register>
+          <name>PRSTCTL1_CLR</name>
+          <description>Peripheral Reset Control Register 1 CLR</description>
+          <addressOffset>0x74</addressOffset>
+          <size>32</size>
+          <access>write-only</access>
+          <resetValue>0</resetValue>
+          <resetMask>0</resetMask>
+          <fields>
+            <field>
+              <name>SDIO0</name>
+              <description>SDIO0 reset clear</description>
+              <bitOffset>2</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>write-only</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>SDIO0_CLR</name>
+                  <description>No effect</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>SDIO0_SET</name>
+                  <description>Clears the PRSTCTL1 Bit</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+            <field>
+              <name>SDIO1</name>
+              <description>SDIO1 reset clear</description>
+              <bitOffset>3</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>write-only</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>SDIO1_CLR</name>
+                  <description>No effect</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>SDIO1_SET</name>
+                  <description>Clears the PRSTCTL1 Bit</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+            <field>
+              <name>ACMP0</name>
+              <description>ACMP0 reset clear</description>
+              <bitOffset>15</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>write-only</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>ACMP0_CLR</name>
+                  <description>No effect</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>ACMP0_SET</name>
+                  <description>Clears the PRSTCTL1 Bit</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+            <field>
+              <name>ADC0</name>
+              <description>ADC0 reset clear</description>
+              <bitOffset>16</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>write-only</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>ADC0_CLR</name>
+                  <description>No effect</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>ADC0_SET</name>
+                  <description>Clears the PRSTCTL1 Bit</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+            <field>
+              <name>SHSGPIO0</name>
+              <description>Secure HSGPIO0 reset clear</description>
+              <bitOffset>24</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>write-only</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>SHSGPIO0_CLR</name>
+                  <description>No effect</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>SHSGPIO0_SET</name>
+                  <description>Clears the PRSTCTL1 Bit</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+          </fields>
+        </register>
+        <register>
+          <name>PRSTCTL2_CLR</name>
+          <description>Peripheral Reset Control Register 2 CLR</description>
+          <addressOffset>0x78</addressOffset>
+          <size>32</size>
+          <access>write-only</access>
+          <resetValue>0</resetValue>
+          <resetMask>0</resetMask>
+          <fields>
+            <field>
+              <name>UTICK0</name>
+              <description>Micro-tick timer 0 reset clear</description>
+              <bitOffset>0</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>write-only</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>UTICK0_CLR</name>
+                  <description>No effect</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>UTICK0_SET</name>
+                  <description>Clears the PRSTCTL2 Bit</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+            <field>
+              <name>WWDT0</name>
+              <description>WWDT0 reset clear</description>
+              <bitOffset>1</bitOffset>
+              <bitWidth>1</bitWidth>
+              <access>write-only</access>
+              <enumeratedValues>
+                <enumeratedValue>
+                  <name>WWDT0_CLR</name>
+                  <description>No effect</description>
+                  <value>0</value>
+                </enumeratedValue>
+                <enumeratedValue>
+                  <name>WWDT0_SET</name>
+                  <description>Clears the PRSTCTL2 Bit</description>
+                  <value>0x1</value>
+                </enumeratedValue>
+              </enumeratedValues>
+            </field>
+          </fields>
+        </register>
+      </registers>
+    </peripheral>
+  </peripherals>
+</device>
\ No newline at end of file
-- 
2.46.0.rc2.264.g509ed76dc8-goog
