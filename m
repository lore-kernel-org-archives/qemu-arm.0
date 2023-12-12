Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp1024299ejo;
        Tue, 12 Dec 2023 08:29:48 -0800 (PST)
X-Received: by 2002:a17:907:7da4:b0:9e0:4910:1666 with SMTP id oz36-20020a1709077da400b009e049101666mr4157920ejc.35.1702398587904;
        Tue, 12 Dec 2023 08:29:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702398587; cv=none;
        d=google.com; s=arc-20160816;
        b=BF49VWRzrJimK5708EwCERSQ9icSOt7Uvr1khY5SajsZMS/CPnC+wza3YpQMlgQEzk
         411yWyWgzOVSPtiqkKBUibnvQDdKT1TYO+MPBBiQLyLjTrDtVbxrXJyc6t/9t49S9vK+
         eeN7TUDck/nCEXmEJz8fYcfzPdoKg2W8LwARmpVL0JMvlaSYX9Uhorz9HS+piWfdiifI
         FHdfp0PQn8/dKS7Wx6CWAizCkTtx87AJeh95RtpB07taI54tKCjSbUfFBpJfXh11s7TN
         pa+o+Y7HwO6s+obzhNb779V5pO6T2l4YoL5e5qO2MAHfUdxTcjVymYRwWdH879A2GLez
         8Mjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=5LE88JwgY2y1IWpLN7sGqf0VCLp2wC33lSYw5ePt+UY=;
        fh=CkupYgn1Qmdh7jizui9HJgGegpqbRR5NXz1VyjRE1Hs=;
        b=Ql5rkr6Qzle3zwUXltKRB/BZ+eaVCtYnE6C4rruAiFPaspi+CSexcUTFzL4mGCtLfU
         p528zzJDRAWQUUp9OC2UYfM0Lga5D11L4JjfsxbHuWCzOHwB/2ZG3Ks7Cl3wKgV2PLk7
         RpcBigab5VYJIK2g1tTaCLGsI19TzAWzpPHXngz2gLGcnE6oLmdTun/1aE7IjEfHT1hL
         Tf0lHauuldISlLWMuFoWhd38KQik2Jm2SAFeQug+ujo9Gg8PmvPO1fmBL3A3IqLq7+3b
         /wpb9diGxDv+nMeJNS1RExGxtM1nJVz3HB9K9CojlLFtw1tLe5ed/Dil0k7zZEu5lyzC
         ub2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JGR3LT0p;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id hg17-20020a1709072cd100b00a177741295csor2585688ejc.4.2023.12.12.08.29.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 12 Dec 2023 08:29:47 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JGR3LT0p;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702398587; x=1703003387; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5LE88JwgY2y1IWpLN7sGqf0VCLp2wC33lSYw5ePt+UY=;
        b=JGR3LT0pz1nZgGAK1mvtaSSmWqgKLumB7wBO6aJ17a0Apwr1Xss4CRo9xe/7HZyPx8
         7Ub4rk+lUzVCdnXTNj+DBXXnE2lu+H8RcWX2q20yqnsf8siFJOlK6h5qS7+UGXaRz2L8
         PXHdFEO5MvXGhHrPvxV+82+9oCl/pp+rO5V8jMKiPwZrPMeRf/HB8d7hbFlW9PQvJxHT
         XPB+NPu4kAJArPfdWgy46m7Fc5BMKt+M0nVVHtpM0MYew0KN0/UQuDY29xmlCPgDik5/
         H17dpXtl53QrELdWVCGNl2x6j42EAk7qONq8VCfYvZZ7XaR8Ok5y3aEp6E+aSVk2rT2O
         uUqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702398587; x=1703003387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5LE88JwgY2y1IWpLN7sGqf0VCLp2wC33lSYw5ePt+UY=;
        b=sMq6g0Ie8s3sKLnOoIoXWcKO3OIlsjJGQNuYVyZJv6eKYHj3QKSTIUdx/2odTrswS+
         hraDsFEu2TZ7nvoJahGFnJe3ycsFEasG3lJAkQ41Ln2ys1iYQia0P6NDd5YBZld7Dzja
         HMQqNULk9PMfOB3xRCfx61bQKbvcvPvCsdxnQWB/r2NAKDE9QHER/VmsoLRAiWJ5jPBy
         4QsuJL0oT2yBdvmDHJiWqSTa1T2zOpuGsVT/82tIlkCw6Wo/diMvkV5rq2Jqc/WX7ewo
         58DfVUzdPqn/cyEGmrHOaQ0P5OJICurGTnX9POfCrpEEO9I0ETwxEsRXmgzZDvS43J77
         nLkw==
X-Gm-Message-State: AOJu0YxBLY6W9K6nhUDKNoVrEGaSXEtzoTItpyDwCtVulsSuAwQrTN1s
	UCVVLw/Gu76Ah92/7zB8xRFb/hun
X-Google-Smtp-Source: AGHT+IEOz/3cPUYqj6E9+MY5U0yMjwZ0gN3IV8bI14iEHt40pSfIVR1T2gW74N0fBanDA7gfEviJEA==
X-Received: by 2002:a17:906:414f:b0:a00:b4ab:cb6d with SMTP id l15-20020a170906414f00b00a00b4abcb6dmr2946269ejk.69.1702398587565;
        Tue, 12 Dec 2023 08:29:47 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id vs6-20020a170907a58600b00a1f99e749dasm3754142ejc.210.2023.12.12.08.29.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 12 Dec 2023 08:29:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Tyrone Ting <kfting@nuvoton.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Joel Stanley <joel@jms.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	Anton Johansson <anjo@rev.ng>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Hao Wu <wuhaotsh@google.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Rob Herring <robh@kernel.org>,
	qemu-arm@nongnu.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 01/33] hw/arm/boot: Propagate vCPU to arm_load_dtb()
Date: Tue, 12 Dec 2023 17:29:01 +0100
Message-ID: <20231212162935.42910-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231212162935.42910-1-philmd@linaro.org>
References: <20231212162935.42910-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: T0eBkc/FBHhw

In heterogeneous setup the first vCPU might not be
the one expected, better pass it explicitly.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/arm/boot.h |  4 +++-
 hw/arm/boot.c         | 11 ++++++-----
 hw/arm/virt.c         |  2 +-
 3 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/include/hw/arm/boot.h b/include/hw/arm/boot.h
index 80c492d742..b12bf61ca8 100644
--- a/include/hw/arm/boot.h
+++ b/include/hw/arm/boot.h
@@ -160,6 +160,7 @@ AddressSpace *arm_boot_address_space(ARMCPU *cpu,
  * @binfo:      struct describing the boot environment
  * @addr_limit: upper limit of the available memory area at @addr
  * @as:         address space to load image to
+ * @cpu:        ARM CPU object
  *
  * Load a device tree supplied by the machine or by the user  with the
  * '-dtb' command line option, and put it at offset @addr in target
@@ -176,7 +177,8 @@ AddressSpace *arm_boot_address_space(ARMCPU *cpu,
  * Note: Must not be called unless have_dtb(binfo) is true.
  */
 int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
-                 hwaddr addr_limit, AddressSpace *as, MachineState *ms);
+                 hwaddr addr_limit, AddressSpace *as, MachineState *ms,
+                 ARMCPU *cpu);
 
 /* Write a secure board setup routine with a dummy handler for SMCs */
 void arm_write_secure_board_setup_dummy_smc(ARMCPU *cpu,
diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 84ea6a807a..334e4640fd 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -432,13 +432,12 @@ out:
     return ret;
 }
 
-static void fdt_add_psci_node(void *fdt)
+static void fdt_add_psci_node(void *fdt, ARMCPU *armcpu)
 {
     uint32_t cpu_suspend_fn;
     uint32_t cpu_off_fn;
     uint32_t cpu_on_fn;
     uint32_t migrate_fn;
-    ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(0));
     const char *psci_method;
     int64_t psci_conduit;
     int rc;
@@ -512,7 +511,8 @@ static void fdt_add_psci_node(void *fdt)
 }
 
 int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
-                 hwaddr addr_limit, AddressSpace *as, MachineState *ms)
+                 hwaddr addr_limit, AddressSpace *as, MachineState *ms,
+                 ARMCPU *cpu)
 {
     void *fdt = NULL;
     int size, rc, n = 0;
@@ -655,7 +655,7 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
         }
     }
 
-    fdt_add_psci_node(fdt);
+    fdt_add_psci_node(fdt, cpu);
 
     if (binfo->modify_dtb) {
         binfo->modify_dtb(binfo, fdt);
@@ -1321,7 +1321,8 @@ void arm_load_kernel(ARMCPU *cpu, MachineState *ms, struct arm_boot_info *info)
      * decided whether to enable PSCI and set the psci-conduit CPU properties.
      */
     if (!info->skip_dtb_autoload && have_dtb(info)) {
-        if (arm_load_dtb(info->dtb_start, info, info->dtb_limit, as, ms) < 0) {
+        if (arm_load_dtb(info->dtb_start, info, info->dtb_limit,
+                         as, ms, cpu) < 0) {
             exit(1);
         }
     }
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index be2856c018..4a1d1550f5 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1678,7 +1678,7 @@ void virt_machine_done(Notifier *notifier, void *data)
                                        vms->memmap[VIRT_PLATFORM_BUS].size,
                                        vms->irqmap[VIRT_PLATFORM_BUS]);
     }
-    if (arm_load_dtb(info->dtb_start, info, info->dtb_limit, as, ms) < 0) {
+    if (arm_load_dtb(info->dtb_start, info, info->dtb_limit, as, ms, cpu) < 0) {
         exit(1);
     }
 
-- 
2.41.0
