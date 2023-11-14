Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2082884ejc;
        Tue, 14 Nov 2023 06:39:14 -0800 (PST)
X-Received: by 2002:a17:907:7b88:b0:9a1:aaae:8207 with SMTP id ne8-20020a1709077b8800b009a1aaae8207mr3294573ejc.20.1699972754356;
        Tue, 14 Nov 2023 06:39:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699972754; cv=none;
        d=google.com; s=arc-20160816;
        b=dyQi2MWoOX1qYbF2LldOIdoWbPvNuoHr63dNOVo4I4aaO0qlTRqGzOOpQ5YFveh5n2
         O1ekZHOhQbTr5jmkuFDKE06IwAo3//dy+d7odjwId3aHpqFAziQGGrEDbSlrqJku3eOy
         Ui+3VWb//ORqRQo/HhM2sTwFArkQzf2Lz14CRLmd09GPf3cTlhDvzbWcSPrqDBfM/MhQ
         BhO0oYjkfnIu2Dlwd7wNFnqb03LN2GsvqCJUwSmxiXEp5J63aPqr29rTRjnRnKfAI+08
         Rf1Vd8boaXYPo56MVPwd93LfJgXo4sxK4psyo0ubY+EqULcnvDyD9xU6F8U7O4/hDfJ+
         E2RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=MhpN1sNxh5OOZ/KSUE3Y0jUPmEpPW/hS+3a5vlda+P4=;
        fh=WgzlLWvbY5R8+4JotruerK0jeEkAYyt0q4wPP6dSEVI=;
        b=HzCeBsMRoJEVfeBbla3Kk0ym3x2H9fubo0pV1C1Ojt8/UmbGyKfZQyWAY0uhiKoIPq
         c472AjTbMLD6zeQP1KnA90wx/M16sK/QyYeLbsjSKInln6fJ4/6DVILArAvNWWu8NFTm
         JGML+1/DzgUa/47COJLwoVsuYGXUrQpetUVHYq1CzSKx7hlGbQKKzu5gdz3EjbSgvaHr
         oTXhSNZffITqBhNImfuZNyEXtpMO83/nh0KbL8KNfvBkswauG+xEgwFt74eBt6UYGsI5
         XrNknIzTjjUHZVSiSlaIlhR3/aAQeD7L5BufkZ0xqfp7YaKCsbsjX1oICOBV61Z55ZJU
         aIXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ecUH3ptI;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id do19-20020a170906c11300b009b2bbfdbcd1sor2568987ejc.10.2023.11.14.06.39.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 14 Nov 2023 06:39:14 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ecUH3ptI;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699972754; x=1700577554; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MhpN1sNxh5OOZ/KSUE3Y0jUPmEpPW/hS+3a5vlda+P4=;
        b=ecUH3ptIupdeH3b2WM2nQF1G5TemTdOF9pWgMaVlbHoxKRsb8d31c2DbfqC0l65zOu
         A46D9dpQEMCOXzEEBQUhGgtOIS+i/W7aYXQ1WEFn5GsZ+DykZpit9UeKTPeRQpTP0AtY
         pc39RZesP5Fx8NzyNR849LvjIn2a1tQaKr10ro7y8UWrLkPGQ/EQA4vkMy367z+8zx9E
         uMmYYeXFTmNZWydwy3UWAybLXx8jbgvMC98bjHCq1IxgeQpcN7ozSGVBFsteekfydtYK
         JJhOgGpAoJ87QNUco8fnwAWuPxKQUW14gtJPbgBRRMjs6iKfUrwKc1SCi/VoUcYxOzHc
         ZSTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699972754; x=1700577554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MhpN1sNxh5OOZ/KSUE3Y0jUPmEpPW/hS+3a5vlda+P4=;
        b=lKpU6FByFuHxoTJN3teY64ARQ+FcEfaZ/FohJO0/BHTFK0jLGRo+MiDS0vXsp3yt7Q
         FnoDqPYlh98dMnxAlKY1iahIEPNw847mgm1suBwpXeyah9nYnPBj81b+zsltS8YM1Ax4
         OdgvrYNKYiouKbpf4C8aqcQKaxhhw8NC2fm7UgodFHGpRFPKLYtm8oyWOjZsnoACKCxg
         qz60RzvJSY/DXcO1cosLus9vH0Uq6QGxEETkeQQqYwtv8q+yhuWohMBP3UzQ78xoh5El
         AtkdK3qGCUpEiFaEj1kP2a1CuKVP+yjNs3KbJrqt/1voBxJLf9gCcl+PTpBQiuY+9eFN
         UxJg==
X-Gm-Message-State: AOJu0YwbP5AQT62M0NAMyfBNqhGQ/rmqWnF8ElqDsgp05ok67T0s4puI
	kwA1Y8jw+qiOyVd9DUCFqMhBiNGw
X-Google-Smtp-Source: AGHT+IEBPsAFKv3TcvW/4lHrf4Ji7dOfSz7fvZ7L1HUiABJvwud/gdEB/1UIkKrwYaMtMuFVPwAlYw==
X-Received: by 2002:a17:906:bf45:b0:9e5:1db7:3199 with SMTP id ps5-20020a170906bf4500b009e51db73199mr3052455ejb.4.1699972753957;
        Tue, 14 Nov 2023 06:39:13 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (cac94-h02-176-184-25-155.dsl.sta.abo.bbox.fr. [176.184.25.155])
        by smtp.gmail.com with ESMTPSA id g4-20020a1709064e4400b009e609088c09sm5584953ejw.1.2023.11.14.06.39.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 14 Nov 2023 06:39:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: David Woodhouse <dwmw@amazon.co.uk>,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paul Durrant <paul@xen.org>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	qemu-block@nongnu.org,
	Anthony Perard <anthony.perard@citrix.com>,
	kvm@vger.kernel.org,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.0 v2 08/19] hw/xen: Remove unused Xen stubs
Date: Tue, 14 Nov 2023 15:38:04 +0100
Message-ID: <20231114143816.71079-9-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231114143816.71079-1-philmd@linaro.org>
References: <20231114143816.71079-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: cu6mdHGongia

All these stubs are protected by a 'if (xen_enabled())' check.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 stubs/xen-hw-stub.c | 24 ------------------------
 1 file changed, 24 deletions(-)

diff --git a/stubs/xen-hw-stub.c b/stubs/xen-hw-stub.c
index 6cf0e9a4c1..53c6a6f2a0 100644
--- a/stubs/xen-hw-stub.c
+++ b/stubs/xen-hw-stub.c
@@ -8,36 +8,12 @@
 
 #include "qemu/osdep.h"
 #include "hw/xen/xen.h"
-#include "hw/xen/xen-x86.h"
-
-int xen_pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num)
-{
-    return -1;
-}
-
-void xen_intx_set_irq(void *opaque, int irq_num, int level)
-{
-}
-
-int xen_set_pci_link_route(uint8_t link, uint8_t irq)
-{
-    return -1;
-}
 
 int xen_is_pirq_msi(uint32_t msi_data)
 {
     return 0;
 }
 
-qemu_irq *xen_interrupt_controller_init(void)
-{
-    return NULL;
-}
-
 void xen_register_framebuffer(MemoryRegion *mr)
 {
 }
-
-void xen_hvm_init_pc(PCMachineState *pcms, MemoryRegion **ram_memory)
-{
-}
-- 
2.41.0
