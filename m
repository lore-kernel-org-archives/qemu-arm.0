Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp739809ejb;
        Thu, 15 Feb 2024 10:04:44 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU4Yqgc7uUFX5P0mvtN4k4R/KiO9fwGwloLyWl2yK+/P+0lQdlxq6Y5VpIFZ5IfBHK279hEuGOKQEVopKmROB36daIwgA/+
X-Google-Smtp-Source: AGHT+IGsPMQwjO4b7ExFlBhq1wGxU2LWojE+hxGEpMxMS7lyxVgwEGeAamRmD3mYbcvINiSIEW/g
X-Received: by 2002:a05:6808:1184:b0:3c0:3309:2057 with SMTP id j4-20020a056808118400b003c033092057mr3588807oil.26.1708020283894;
        Thu, 15 Feb 2024 10:04:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708020283; cv=none;
        d=google.com; s=arc-20160816;
        b=YmQJmdo27XqFuVfMf0riGYRbwIZvFla0GfEgfFKqRJDwm8i32tOjibU72E/k+v6SmF
         J9XC5W+mPa6dS/8NvxK7fwt5ANXCVmw27gWGSow0P3+nYKFnde3Qw6x7UfhwPjPY3oFv
         Uh2BJArsggaOHFKfNk7L0VZC4eQRXiwSoS0bJYyeOK/csMHmwGXcTcPTYRMIgjPUx+Bp
         xP3wt5rHu1d3zzIhebTvcpC2IIkRdlU3SexbRkqqyOrBjMUWnZG360s0DKFKVeJCStDf
         i0iThcimHhIkVsULjmnOAZN4k9lfllfjAokp9agpkYqSIVs4mCrNHsdqlqtwYBKYjckZ
         aq6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=6J7vJKQXa+8iZQt74/J2PIq4S7PNQU5OOBph7QaqNT8=;
        fh=ySkeD0cMS5l7FSy0x0WaxGntPkHf6TA0RKgBwNZqK9g=;
        b=1E8m3tGSzK0fSj8+/Xf2t9us9lsv8sgEv6o54JaXadf3mdXS1/yUjhh30aNMaUJiXX
         jL0VfEfgkVyBlayMvTL208iECzp2U9aIb+nbl/QlBxAUeYh9CJZGrKks+mWloO97Z7ay
         6Ivv0YsJYtZAajfglNQTcrQll2i5syZISJQ+H0cBuLwmNq3AVwyA/lCEtR9Fc0MaLJOh
         bs3nTWIPaR5Lhd5gaLmy5O6eqef6wuyEPTFoCmggbgTqrpMJfuPKwWJjtUek4gMBsyl+
         oS8TFnkhPv9CKDrqe4//odWLoQv+J2lnCWgDg+3Mna/TrW+jEiT9Brj/SpA9c2CkzOYt
         B6tg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L2xmsA7O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j4-20020a0561023e0400b0046d1c59f198si418024vsv.250.2024.02.15.10.04.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Feb 2024 10:04:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L2xmsA7O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rag5g-0003Z5-J5; Thu, 15 Feb 2024 13:04:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rag5Q-0001yu-6Z
 for qemu-arm@nongnu.org; Thu, 15 Feb 2024 13:03:52 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rag5O-0003Dm-FX
 for qemu-arm@nongnu.org; Thu, 15 Feb 2024 13:03:51 -0500
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-56399fb02b3so1545131a12.1
 for <qemu-arm@nongnu.org>; Thu, 15 Feb 2024 10:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708020229; x=1708625029; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6J7vJKQXa+8iZQt74/J2PIq4S7PNQU5OOBph7QaqNT8=;
 b=L2xmsA7OzIxFYSMqiDkrrEsCWcChHteAtGCiR2/B3sDD0T3YFPmn0Z++yCAiELAEXr
 C4wl7TCHIwpiaOUjiknUK6M26nH8ax2a+Kx4+d2n94o0DbHTzfm7n8uj+qgyDTfARuxd
 9NCQPFsBRT3mqTbSm0JbcjTO1V8Y0MQW/XbMODRMKaVmAMXCy0Ua8D2jD9M3EQrK+sJl
 GaEq+HuB/8aA2sdhcgn2dFnhnNVb2hqIo3VTxJ3MJWJui37O6GbVL4Gc7llGpRwPgsYM
 5KJABNmFbmalqXLVGbUKx9QETBZY4PDuZYd4HK+yvh9Ls7r/ffIbIwKAy1qJo0LAwkM7
 IKDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708020229; x=1708625029;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6J7vJKQXa+8iZQt74/J2PIq4S7PNQU5OOBph7QaqNT8=;
 b=cz3JuQaHHXGtWhv/h5QMTXKUsvaG/VnslMxCLD21NoCB/lkdpFVDX9y9aSeZNJNIVm
 1tE76J0iDtvpTcQ+qQyOgha9xH4eKOQ5SCCxu3ug9jLovVBPSFUO3aedKHn21C5eMKBm
 ibUsF/gjIhqDZmymqK+ZrIXkrNc3pZgdWekokTo1L+3zG7hJcR9xFa4uqKJK+o47fmnF
 exTxGh0u1srXl11ID52YfLhvqu9Fh4vCwWsYKjoKn0fJObO3SxPYG4eLG7r6223q0mX4
 4kuIZ3QNhacbjui/8MxmOv83pIgQUIaZaDFzQDuH6t4J1kwPogyVMQO6igwQUlIds9iv
 H52A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJmL4RKfDgaFDkbwkhYu/IEb97PJikZrFiwmY6XfJmDKwrbKgIktr8JARSZo6WS0Stt08joYQQlHq0E69/pPI07cLc
X-Gm-Message-State: AOJu0YzOQYFZmHPi3vHmZsCTeCyGdTy7UM98dOXLODTZ3lExoI8xIH3l
 UGtkrXtE813Qsy1zAOMLkP7FW1f8RqMhPg1nCFxiHHwVHnSVeGGjJl8nmjFygQc=
X-Received: by 2002:a17:906:4a1a:b0:a3c:ff93:e12d with SMTP id
 w26-20020a1709064a1a00b00a3cff93e12dmr1965936eju.74.1708020229262; 
 Thu, 15 Feb 2024 10:03:49 -0800 (PST)
Received: from m1x-phil.lan ([176.187.193.50])
 by smtp.gmail.com with ESMTPSA id
 vi17-20020a170907d41100b00a3d782d885dsm782424ejc.121.2024.02.15.10.03.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 15 Feb 2024 10:03:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 John Snow <jsnow@redhat.com>
Subject: [PULL 53/56] hw/ide/ahci: Do not pass 'ports' argument to
 ahci_realize()
Date: Thu, 15 Feb 2024 18:57:47 +0100
Message-ID: <20240215175752.82828-54-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240215175752.82828-1-philmd@linaro.org>
References: <20240215175752.82828-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: Dc0/GLkKJXRY

Explicitly set AHCIState::ports before calling ahci_realize().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20240213081201.78951-8-philmd@linaro.org>
---
 hw/ide/ahci_internal.h | 2 +-
 hw/ide/ahci.c          | 9 +++++----
 hw/ide/ich.c           | 3 ++-
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/hw/ide/ahci_internal.h b/hw/ide/ahci_internal.h
index 4dc2805d21..4e13329bb2 100644
--- a/hw/ide/ahci_internal.h
+++ b/hw/ide/ahci_internal.h
@@ -377,7 +377,7 @@ typedef struct SDBFIS {
     uint32_t payload;
 } QEMU_PACKED SDBFIS;
 
-void ahci_realize(AHCIState *s, DeviceState *qdev, AddressSpace *as, int ports);
+void ahci_realize(AHCIState *s, DeviceState *qdev, AddressSpace *as);
 void ahci_init(AHCIState *s, DeviceState *qdev);
 void ahci_uninit(AHCIState *s);
 
diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
index 2c3306dae4..33f7e83687 100644
--- a/hw/ide/ahci.c
+++ b/hw/ide/ahci.c
@@ -1614,14 +1614,14 @@ void ahci_init(AHCIState *s, DeviceState *qdev)
                           "ahci-idp", 32);
 }
 
-void ahci_realize(AHCIState *s, DeviceState *qdev, AddressSpace *as, int ports)
+void ahci_realize(AHCIState *s, DeviceState *qdev, AddressSpace *as)
 {
     qemu_irq *irqs;
     int i;
 
     s->as = as;
-    s->ports = ports;
-    s->dev = g_new0(AHCIDevice, ports);
+    assert(s->ports > 0);
+    s->dev = g_new0(AHCIDevice, s->ports);
     ahci_reg_init(s);
     irqs = qemu_allocate_irqs(ahci_irq_set, s, s->ports);
     for (i = 0; i < s->ports; i++) {
@@ -1862,7 +1862,8 @@ static void sysbus_ahci_realize(DeviceState *dev, Error **errp)
 {
     SysbusAHCIState *s = SYSBUS_AHCI(dev);
 
-    ahci_realize(&s->ahci, dev, &address_space_memory, s->num_ports);
+    s->ahci.ports = s->num_ports;
+    ahci_realize(&s->ahci, dev, &address_space_memory);
 }
 
 static Property sysbus_ahci_properties[] = {
diff --git a/hw/ide/ich.c b/hw/ide/ich.c
index d190012a95..122fc7e0ab 100644
--- a/hw/ide/ich.c
+++ b/hw/ide/ich.c
@@ -113,7 +113,8 @@ static void pci_ich9_ahci_realize(PCIDevice *dev, Error **errp)
     d = ICH9_AHCI(dev);
     int ret;
 
-    ahci_realize(&d->ahci, DEVICE(dev), pci_get_address_space(dev), 6);
+    d->ahci.ports = 6;
+    ahci_realize(&d->ahci, DEVICE(dev), pci_get_address_space(dev));
 
     pci_config_set_prog_interface(dev->config, AHCI_PROGMODE_MAJOR_REV_1);
 
-- 
2.41.0

