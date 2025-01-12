Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp1414363njn;
        Sun, 12 Jan 2025 13:03:51 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX1Z4oKKKh1zKz5bYso4//+zepNvbkb7d0BzoN2qVPVsJuJQiTLrrw/XDnHySHkHjp1jB30qin5xthCHA==@linaro.org
X-Google-Smtp-Source: AGHT+IFTL2ASRSTotJHXZTs9IgC4sC5MNwalS+rYz7ENLeybLttY4q3VxlD9d01oDCILT7g3vr1g
X-Received: by 2002:a05:6214:1d0a:b0:6d8:9e9d:c223 with SMTP id 6a1803df08f44-6df9b1cee68mr338412736d6.7.1736715831452;
        Sun, 12 Jan 2025 13:03:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736715831; cv=none;
        d=google.com; s=arc-20240605;
        b=ixOKfTftSUEeCg9+B7+R+9Sqd8Vog29wf4bGQ6N3vovLw+ZbvsiQ4I6y1MyumN/axA
         O6p4swts/NVY9SLUEmYb+7e+Hc192BGGlISS7x0eqOd1Fka1d6njryWgWrvT0n6nlRWr
         dN/eI5QSXSPnXqrGw/ReHd3ppXSlX+kFOsYJn8p9uDKBroq88QGt0fzpFwjZIAj82+Dc
         3p7ir3e+viYRUAiI0WoVp5tfmRTOwCe/7N969xO1TVa2vf572dUuP+NwCMvlBQik3gh+
         Pqsm6k7eYOJks69mq+XsmJWzt+nsLE/b5dbA13O/a70l09Z7v7i6Gb2NZ1o3l6KNbfmb
         RAAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=c4OQlrQ2lOwO235fKNtUs/AAw1axl2Gl19Nw0aS3zkY=;
        fh=UrkCyqosaO1gQEue9tWrYvoqzNmNJkLP0el1ubpXH2g=;
        b=FxNuXGPctfmDIubtynvyJzx/27frbmOIoscoIyEwADiyzqMhmwqIt5jHQqezFrKxTp
         ZmIxj82p1Kf9e6bYwRWqsAefNenZ7JQy2ywacL/SPY1VLFC/CYdWFUTiEPM18ZfviXyo
         BkiZVYA0CpCneSXxmMpZ+ORfI6uSP6Lp6BRXuYvVN1NCk/BxDwRCxlwKkJeSu9vUI0l3
         6dEW4SKc6IMCeKCZ+Pw5T7i73s7hNaZQtgQGF0YBko1fbjXX0moVfvMSivAGWNdRs+Xk
         BNWo53basfMPYachxHSJz0d9mMFTM8/H7JJzUPLd6RhH4ro4x/uthizp6R2htC23tiAI
         2+QA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=ELJ3koK5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6dfade9836csi76342076d6.246.2025.01.12.13.03.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Jan 2025 13:03:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=ELJ3koK5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tX57O-0006Qd-EK; Sun, 12 Jan 2025 16:03:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tX55d-0004YU-Pb
 for qemu-arm@nongnu.org; Sun, 12 Jan 2025 16:01:56 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tX55Y-0006QD-Mj
 for qemu-arm@nongnu.org; Sun, 12 Jan 2025 16:01:45 -0500
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-aaeecbb7309so685344266b.0
 for <qemu-arm@nongnu.org>; Sun, 12 Jan 2025 13:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1736715699; x=1737320499;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c4OQlrQ2lOwO235fKNtUs/AAw1axl2Gl19Nw0aS3zkY=;
 b=ELJ3koK560D8f8/Wm7V9QlWpmSNKkIVcrAq1ykFqbaHq2rKwCZCz5kWI72KoW6UJrt
 6YMoaeCC3Rm/Rm8k31O6bGmXOdpoZv0X+FoFNre1QbKMISB/HyQr4jG2yXaomXlJX55r
 IAaSdm3Q6tQgVF6Auc+myNGKCRPfkN7GAdIDMrA7J+qCcK2dDToDB3Y3CGRN93Snk+jw
 cUvrGhrLNSz8bhaVmbJTY7TWQg/SxRlzAapadbo/VnKd+dGO6r+Jb8pkxMNxnactLW6p
 8KARZLbC3xoZyO34aj0+mnBfwVFiBSPa7dKoM0LQ+UnoJu4cHztAmLUuR0NZYMRN60RS
 UHeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736715699; x=1737320499;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c4OQlrQ2lOwO235fKNtUs/AAw1axl2Gl19Nw0aS3zkY=;
 b=GSizrswtr6GSZuoVS1e6T7WkLz/BK8grVrlgMTg3F8G7Qi4DFme1+0zzIwi2AwjKyv
 JsQbmr6czt7o3qvj5gJUbRCgkczyWNbyuwTsjQSROwDfCE4WA7Wx3Xh46/CTVKr81rwr
 /72deCprNteeyNaqpMw9sUcy6kPQs4D6Iyago4PInAK4X+PjKCR9tgEQ/NhpCBY1gbje
 B5sdCmSIgFZSCXNwbpqs+toxzID948mqEAFL193jfHqmcbFGRCbrihaPzWrm9gyL1mKP
 PGW75IuQ6aWjFyCKNJ3rk20SK/SCe2HHQkpAG1pHamcWs9JYI27cPFwIDlciM+e0rjlT
 9Iww==
X-Forwarded-Encrypted: i=1;
 AJvYcCVD2f6UuCiY/jY/K+dMAjg/Gu5woYL4fW5fLc6h1441E7aw8jQcoQusBNHkAyGsuNYZyjzx0o7hZA==@nongnu.org
X-Gm-Message-State: AOJu0YzqDCjurEUjLfAQipaml07m8I0oaMqucHppMU1q42kPsLhc2o7X
 Vc3luSF/dtWt7NNipz94hA/3KB5OPlsMf/4TJlo3RvWOYwKuxZSQfSBwdd4uAg==
X-Gm-Gg: ASbGnctgy4zuzm84cg0Bs+6Hlh4vOtk8lIB7UUFrkP+7aebKt7LhCm4n1g/GcngFMxr
 KLbu0mFnA5LmxS1i4TgWXM6xDcYbBraHk9OEhbVG969AzuRwseigABF7V8ne3RkLNeuRPckwV+n
 SVYrk07MUogC5xZO1Mfm/eOzk5OV8oyK0AOn4798sfqgED7b5uEtV3Gcwrp7rWC3QGp6wJiAXoG
 xSCSK21zQeepPXDtwA7yHbxazFAOCSUfx2cz49YB5ZlcucUOlnX8g2YZCfnY9RMT/nuhkLTARGB
 XdjGNTcjIFysqjNOxJNg3JuQ73DmcNiI
X-Received: by 2002:a17:907:1c21:b0:aab:d8df:9bbb with SMTP id
 a640c23a62f3a-ab2abc925cbmr1809514566b.41.1736715699279; 
 Sun, 12 Jan 2025 13:01:39 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c905e283sm418276666b.31.2025.01.12.13.01.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 12 Jan 2025 13:01:38 -0800 (PST)
From: Phil Dennis-Jordan <phil@philjordan.eu>
To: qemu-devel@nongnu.org
Cc: agraf@csgraf.de, phil@philjordan.eu, peter.maydell@linaro.org,
 pbonzini@redhat.com, mst@redhat.com, stefanha@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, marcandre.lureau@redhat.com, philmd@linaro.org,
 eblake@redhat.com, armbru@redhat.com, qemu-block@nongnu.org,
 qemu-arm@nongnu.org
Subject: [PATCH v17 09/11] hw/usb/hcd-xhci-pci: Adds property for disabling
 mapping in IRQ mode
Date: Sun, 12 Jan 2025 22:00:54 +0100
Message-Id: <20250112210056.16658-10-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250112210056.16658-1-phil@philjordan.eu>
References: <20250112210056.16658-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::634;
 envelope-from=phil@philjordan.eu; helo=mail-ej1-x634.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779 autolearn=no autolearn_force=no
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
X-TUID: nC8oWveB4jAW

This change addresses an edge case that trips up macOS guest drivers
for PCI based XHCI controllers. The guest driver would attempt to
schedule events to XHCI event rings 1 and 2 even when using PCI
pin-based interrupts. Interrupts would therefore be dropped, and events
only handled on timeout.

So, in addition to disabling interrupter mapping if numintrs is 1, a
callback is added to xhci to check whether interrupter mapping should be
enabled. The PCI XHCI device type now provides an implementation of
this callback if the new "conditional-intr-mapping" property is enabled.
(default: disabled) When enabled, interrupter mapping is only enabled
when MSI-X or MSI is active.

This means that when using pin-based interrupts, events are only
submitted to interrupter 0 regardless of selected target. This allows
the macOS guest drivers to work with the device in those configurations.

Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2705
---
 hw/usb/hcd-xhci-pci.c | 24 ++++++++++++++++++++++++
 hw/usb/hcd-xhci-pci.h |  1 +
 hw/usb/hcd-xhci.c     |  3 ++-
 hw/usb/hcd-xhci.h     |  5 +++++
 4 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/hw/usb/hcd-xhci-pci.c b/hw/usb/hcd-xhci-pci.c
index 49642aab58..d908eb787d 100644
--- a/hw/usb/hcd-xhci-pci.c
+++ b/hw/usb/hcd-xhci-pci.c
@@ -82,6 +82,21 @@ static bool xhci_pci_intr_raise(XHCIState *xhci, int n, bool level)
     return false;
 }
 
+static bool xhci_pci_intr_mapping_conditional(XHCIState *xhci)
+{
+    XHCIPciState *s = container_of(xhci, XHCIPciState, xhci);
+    PCIDevice *pci_dev = PCI_DEVICE(s);
+
+    /*
+     * Implementation of the "conditional-intr-mapping" property, which only
+     * enables interrupter mapping if MSI or MSI-X is available and active.
+     * Forces all events onto interrupter/event ring 0 in pin-based IRQ mode.
+     * Provides compatibility with macOS guests on machine types where MSI(-X)
+     * is not available.
+     */
+    return msix_enabled(pci_dev) || msi_enabled(pci_dev);
+}
+
 static void xhci_pci_reset(DeviceState *dev)
 {
     XHCIPciState *s = XHCI_PCI(dev);
@@ -119,6 +134,9 @@ static void usb_xhci_pci_realize(struct PCIDevice *dev, Error **errp)
     object_property_set_link(OBJECT(&s->xhci), "host", OBJECT(s), NULL);
     s->xhci.intr_update = xhci_pci_intr_update;
     s->xhci.intr_raise = xhci_pci_intr_raise;
+    if (s->conditional_intr_mapping) {
+        s->xhci.intr_mapping_supported = xhci_pci_intr_mapping_conditional;
+    }
     if (!qdev_realize(DEVICE(&s->xhci), NULL, errp)) {
         return;
     }
@@ -201,6 +219,8 @@ static void xhci_instance_init(Object *obj)
 static const Property xhci_pci_properties[] = {
     DEFINE_PROP_ON_OFF_AUTO("msi", XHCIPciState, msi, ON_OFF_AUTO_AUTO),
     DEFINE_PROP_ON_OFF_AUTO("msix", XHCIPciState, msix, ON_OFF_AUTO_AUTO),
+    DEFINE_PROP_BOOL("conditional-intr-mapping", XHCIPciState,
+                     conditional_intr_mapping, false),
 };
 
 static void xhci_class_init(ObjectClass *klass, void *data)
@@ -215,6 +235,10 @@ static void xhci_class_init(ObjectClass *klass, void *data)
     k->exit         = usb_xhci_pci_exit;
     k->class_id     = PCI_CLASS_SERIAL_USB;
     device_class_set_props(dc, xhci_pci_properties);
+    object_class_property_set_description(klass, "conditional-intr-mapping",
+        "When true, disables interrupter mapping for pin-based IRQ mode. "
+        "Intended to be used with guest drivers with questionable behaviour, "
+        "such as macOS's.");
 }
 
 static const TypeInfo xhci_pci_info = {
diff --git a/hw/usb/hcd-xhci-pci.h b/hw/usb/hcd-xhci-pci.h
index 08f70ce97c..5b61ae8455 100644
--- a/hw/usb/hcd-xhci-pci.h
+++ b/hw/usb/hcd-xhci-pci.h
@@ -40,6 +40,7 @@ typedef struct XHCIPciState {
     XHCIState xhci;
     OnOffAuto msi;
     OnOffAuto msix;
+    bool conditional_intr_mapping;
 } XHCIPciState;
 
 #endif
diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
index 00d5bc3779..64c3a23b9b 100644
--- a/hw/usb/hcd-xhci.c
+++ b/hw/usb/hcd-xhci.c
@@ -644,7 +644,8 @@ static void xhci_event(XHCIState *xhci, XHCIEvent *event, int v)
     dma_addr_t erdp;
     unsigned int dp_idx;
 
-    if (xhci->numintrs == 1) {
+    if (xhci->numintrs == 1 ||
+        (xhci->intr_mapping_supported && !xhci->intr_mapping_supported(xhci))) {
         v = 0;
     }
 
diff --git a/hw/usb/hcd-xhci.h b/hw/usb/hcd-xhci.h
index 9609b83514..9c3974f148 100644
--- a/hw/usb/hcd-xhci.h
+++ b/hw/usb/hcd-xhci.h
@@ -193,6 +193,11 @@ typedef struct XHCIState {
     uint32_t max_pstreams_mask;
     void (*intr_update)(XHCIState *s, int n, bool enable);
     bool (*intr_raise)(XHCIState *s, int n, bool level);
+    /*
+     * Callback for special-casing interrupter mapping support. NULL for most
+     * implementations, for defaulting to enabled mapping unless numintrs == 1.
+     */
+    bool (*intr_mapping_supported)(XHCIState *s);
     DeviceState *hostOpaque;
 
     /* Operational Registers */
-- 
2.39.5 (Apple Git-154)

