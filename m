Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp804839njb;
        Tue, 18 Feb 2025 08:26:58 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUEYXKlRWh+YNRiHIVCnmqDUZQxzLk6hc/mfORLLbDbGO8D6UxrXmrH1/6f12xmyj1kdP8EdfaLIdQczA==@linaro.org
X-Google-Smtp-Source: AGHT+IE53MDBeuGOrSa5WToZCMlwdwFGR6o+KeAVL+wMYpIC8UrEh/qxlyRyKTAHcwqNk3T28Ssq
X-Received: by 2002:a05:620a:45a6:b0:7b6:c92e:2e83 with SMTP id af79cd13be357-7c08a9a9173mr2107832185a.17.1739896018704;
        Tue, 18 Feb 2025 08:26:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739896018; cv=none;
        d=google.com; s=arc-20240605;
        b=iN4+t09Ed3zYoFzTWph28RVVtEWLDXdRXw09VbI+c3Umv1p4MCzSU27i1fpS8Na6Fn
         pPF4PAVCVzbAICjGBCDtu9xD28eHAmpVm8ZFO2/50SWW71S3UOBZB2tG8IAI9Ei73dOu
         QOsoIotL1NUDIb/Xr/IAZe7p277xmnmKufoxgOfntugD3i+PhN9jLSds2RHHTiNycYEa
         UdOsB3e42aL110A3KvhsJhpP+ZZnpZvoT8gljv4Jw5lT3JTZBID1OR12uHu/bHMg9Ol+
         wkkYq0+hM4Q26+yHLO1bJ6aqF9bHOobi9Vf9E5p2yk7187fH0DaOhxW+zcBQfJ44Sh6K
         MtXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=4LIM0sFFVBkCbyArsjA9gzE/mDTxyAKavFGTWagdWog=;
        fh=uj14pK82Piet8iZ+KeaVpYHRMa+VtxoL4BErpJvHhv8=;
        b=TLGe+gA8vjFBzZyF4eDV4DcoDU4y9LaHYmapUMcQTcy0zchCPmsS0W+yIPKeTG5cAF
         fL7/5v7JRLxaPqxgCHzbKJRHCf/U8oNkiE3oEVXgSzrGFQPJAGvzBUI7f9aBX7zmYQ+K
         X0zJQDJ4z+Vc/XVJsa0sjBaxloFJi1Es/kUcb7UG5QTGsyWXDNF3hbwzfHrVprDo+FPO
         vUhvtgcVcJol9BuMrA0Lr7cy0B6S2r+4wR3gM5vyrvGvjtvcCMRiaJtcmlUnDNv4Er9o
         RUVIP9pfs3qR3YQ90GfCutxL9nKhJtl86H3fH5RI7GkMe/5n1iLYtu6SdzYeuSF1t7x1
         uvhw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oywqo1D5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c0a52399f9si301761385a.498.2025.02.18.08.26.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2025 08:26:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oywqo1D5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tkQQb-0004pa-PQ; Tue, 18 Feb 2025 11:26:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tkQQX-0004oi-Jc
 for qemu-arm@nongnu.org; Tue, 18 Feb 2025 11:26:29 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tkQQV-0000iK-NS
 for qemu-arm@nongnu.org; Tue, 18 Feb 2025 11:26:29 -0500
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-38dcac27bcbso4136102f8f.0
 for <qemu-arm@nongnu.org>; Tue, 18 Feb 2025 08:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739895986; x=1740500786; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4LIM0sFFVBkCbyArsjA9gzE/mDTxyAKavFGTWagdWog=;
 b=oywqo1D5kyfnsY0B7eXVSyTYlqiYPUKIDy4C7O79hAR6ToCJ8Z8ScCLwIFTZ2o3ALY
 qNcbGKOmLToiOGZYfX01aKhimFZ/s6xtA/wJXo1QMpyKcDw/iUYMMdwiaWYQkuCWsxzs
 BGkJl943rNUTO4MQR2YiPQi6c4IFL3yPF+u+esJyG88fg/mbj5ohkTpU/vXBPJqmX5Qn
 4Rng//gqqN6E+JwmgtwHQGzwMxSRG7TGWPlOOSO4LcRKdIdxNMgZ8lw3L1wy6bEPxSWv
 a/d01ly9tCpM14zbFGBLcgLcEqCPLx9j8Zx6Viok+EPZW0kbvkeegw/Iw1KmGHtpL3Tq
 WoRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739895986; x=1740500786;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4LIM0sFFVBkCbyArsjA9gzE/mDTxyAKavFGTWagdWog=;
 b=GecCwazTIYuYq2doG5w4/pXAzOZJoqrK6qfQPTnCiWIXmpngAVyigXh+Yrv6lQRs2Y
 XH7/YdZkIghOOgge1t0gvi71XVB4WHMhsskFOzBbelTQH2nP3Vv1eRs1eAfpIJ2xmzz2
 Y8BFKdZZIuZWklpD8gnLjonWiw6IW5s2xuFn3jvTX5U6pdJJIwsD8iuxyf9d5tGYTUec
 MO6jZ71dFS16yar+mjwvQyUC4XGT63fdzayxdSg9RfQjoOQxncmJycuHuCZZo8ssWa5A
 fdkJ9rPT/6vXrrA3rLkewPIH8ZgpbTnyr6NXtzNkCMA7wuYpeZAL5/4v6CxnAKv5r/u+
 c6gA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/RBne4KwBG4HJcCuU1oiam/VFtGiwGBQlZQGPwS3H/EvTDDRx67syh6k0Ay/Ag8CTbX2/87icvQ==@nongnu.org
X-Gm-Message-State: AOJu0YxiRyF9pNTECADfNr+QOlzUEquaHdxxBdfciXEtjT3c3kkm//K1
 W061SAqLhBRA+N/Tl2cSVGQ1JCkxZXm0nnvH0lbvT4cCZ5pG9NIsbhkbKasOneaoEGICsl+WoBb
 VsrM=
X-Gm-Gg: ASbGncuLxtJuNbw1c0PfQQoUDw2QHhjFBVk7N9obzmZgRz9vPCCkYRwfe2DJi44n+vx
 4X/lBIy1lNKVVXhkthT5/ieMIvufe/LfrpV0j3wU9lxHHpNfqQ8sbxerPEZQhVIpJ0H28i8vY91
 ZzqXsCjZXWhiGLzGiddsJc3/7DDilrzRaWhn+wIuykc/ICUrddeXpi1CYpCPWlJR/oDwYGdOo1H
 UDqjwtLcaRyEBnhyeQwc4LMMrR6aglooHiuTSMoC9OrrMbUfBCwbdFk7dUfLmS4gvkJw9XaRfSU
 yUxLpBMJXgpN6RG78m7YyVm25HNCgFgNclFOcsq+DWWpx4Ttbrk/ld+ypZ11NWVxqQ==
X-Received: by 2002:a05:6000:1fa1:b0:38d:c6b8:9fe1 with SMTP id
 ffacd0b85a97d-38f57ea1cfcmr360586f8f.24.1739895986072; 
 Tue, 18 Feb 2025 08:26:26 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259f7df2sm15426607f8f.84.2025.02.18.08.26.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 18 Feb 2025 08:26:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Anthony PERARD <anthony@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Vikram Garhwal <vikram.garhwal@bytedance.com>,
 Thomas Huth <thuth@redhat.com>, Jan Beulich <jbeulich@suse.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH 1/8] accel/Kconfig: Link XenPVH with GPEX PCIe bridge
Date: Tue, 18 Feb 2025 17:26:11 +0100
Message-ID: <20250218162618.46167-2-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250218162618.46167-1-philmd@linaro.org>
References: <20250218162618.46167-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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
X-TUID: HXIS8lonpE5k

XenPVH requires the PCIe/GPEX device. Add it to Kconfig
to avoid when configuring using --without-default-devices:

  /usr/bin/ld: libqemu-aarch64-softmmu.a.p/hw_xen_xen-pvh-common.c.o: in function `xenpvh_gpex_init':
  hw/xen/xen-pvh-common.c:174: undefined reference to `gpex_set_irq_num'
  /usr/bin/ld: libqemu-aarch64-softmmu.a.p/hw_xen_xen-hvm-common.c.o: in function `pci_dev_bus_num':
  include/hw/pci/pci.h:337: undefined reference to `pci_bus_num'
  /usr/bin/ld: include/hw/pci/pci.h:337: undefined reference to `pci_bus_num'
  /usr/bin/ld: include/hw/pci/pci.h:337: undefined reference to `pci_bus_num'
  /usr/bin/ld: include/hw/pci/pci.h:337: undefined reference to `pci_bus_num'
  /usr/bin/ld: include/hw/pci/pci.h:337: undefined reference to `pci_bus_num'
  /usr/bin/ld: libqemu-aarch64-softmmu.a.p/hw_xen_xen-hvm-common.c.o: in function `cpu_ioreq_config':
  hw/xen/xen-hvm-common.c:412: undefined reference to `pci_host_config_read_common'
  /usr/bin/ld: hw/xen/xen-hvm-common.c:428: undefined reference to `pci_host_config_read_common'
  /usr/bin/ld: hw/xen/xen-hvm-common.c:438: undefined reference to `pci_host_config_write_common'

Fixes: f22e598a72c ("hw/xen: pvh-common: Add support for creating PCIe/GPEX")
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/accel/Kconfig b/accel/Kconfig
index 794e0d18d21..4263cab7227 100644
--- a/accel/Kconfig
+++ b/accel/Kconfig
@@ -16,4 +16,5 @@ config KVM
 config XEN
     bool
     select FSDEV_9P if VIRTFS
+    select PCI_EXPRESS_GENERIC_BRIDGE
     select XEN_BUS
-- 
2.47.1

