Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2082672ejc;
        Tue, 14 Nov 2023 06:38:54 -0800 (PST)
X-Received: by 2002:a17:906:d204:b0:9da:fd18:1fdc with SMTP id w4-20020a170906d20400b009dafd181fdcmr7258569ejz.44.1699972734129;
        Tue, 14 Nov 2023 06:38:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699972734; cv=none;
        d=google.com; s=arc-20160816;
        b=QRnWkbeXn3KKcfjdvaULDzKBaotwD4tFAIVID9afo2kPpZ4quicfGhZYAaDfEc+chV
         X3GyaBnph6mEXWSw/9dPdzLbslZGJh79TlckaB73z9F1cRAfsYxnWwOSuL2gSdj1AV2q
         yVwUQlFeh5m3iuEK+5WqMMsf7EfCjuwHMkBrJHgZFoeDwsK7dgGTSRHNvicKnO7QYmzp
         YHH/RPGtwkcKZRwICOmskLapZrWZaXCygxe5U9JjO15imF8CciaLzctKCojnl7r8aYoV
         4p2olDJN8J9XlnTynSN2T2atCcQv17rFPoV6Lyt0vLuosUdwWftIwZHZoKFXhp8gKOQ1
         s3RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=xuAolXSNCEGrTS5m5CRvskBDG9NQVZE3kWB97Se1m9g=;
        fh=JgHqP2LrV9J65/pN6QJ1PmL8fRqRH000nzYNaNgHxk0=;
        b=PQepnqcyeEH9JGgCjKHNU0zN6oUKqFqKyp235K5lq6fuWpNHcPvpllLVvQsFwBj0Vx
         ed9dpYVXONgVdsmRldpbb3JoyZRuUfJ0DIw8IL+05AGj+MQ60XV8ELRKwTbw3ZHvliLb
         Wphl94vG6rmYmNmWit0bMLTUYR9pYQnLKaYPj0w3rvEJUN2IWUkRIi/VZtKh1xlzXh8Q
         BbfidoT8DF1BIDrPIImhbf0g/hxfdFER8kwL5NsSbN4t3I+vCSUvKuO2AXEehvsyf9JN
         STGSMYCqP5LZrtFJPoIdM40ty4CL3MxbIQBUsZV3HSiWvQqhf7QIlt5Az33+ap5k2VH0
         i/8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zbQpvAqn;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id s15-20020a170906220f00b009b2d6326247sor2015025ejs.21.2023.11.14.06.38.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 14 Nov 2023 06:38:54 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zbQpvAqn;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699972734; x=1700577534; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xuAolXSNCEGrTS5m5CRvskBDG9NQVZE3kWB97Se1m9g=;
        b=zbQpvAqnWcgx53+Dqjcp9y8gqpciBNZw1n5bZ5BtpPbn8i9rgXBticlr1DRd77XtEa
         Ir1UyDHfHZUjLiKeXj5BBV+1Pi5/M4wO31DyM1zT0bCE7KZJuGN6kDChGaBwAK5EYgRC
         rkoM4YFhkY0BwujXSZhsFetEPRx4IJ60+hX4NdIUTwbteWXSGV3dtPlKBXQZJE4KP117
         hynlswl0FWCmkwsn9Nui5diJp9NYQudevk3tsFaLE2jNqWzy5WPy8z4D8WI8Gry2Dncw
         /mk8y4tvYlDbkKpOZ+hwnWUSvtRfow5jUXVEcs6YE2yr8PV8NtGK+JxPv/WbznuurPng
         L7eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699972734; x=1700577534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xuAolXSNCEGrTS5m5CRvskBDG9NQVZE3kWB97Se1m9g=;
        b=bgWxm+gVOyrLq1YmFbC2uAyOOzDSTvGMb/Q8AKnu+G4ZLg+jDAWhOQk8+52kmzPHkJ
         cy+PjTSWufG2e/qXcbTjk8XEMcg9x00nSAf8DP/zDgXIHtr72pimqcG9A1jeIV2Lwm2a
         BsMR80z6FPdhRSZtWW4flX1pYPh1Pf9E2DKCTVtZ+lg9BjhQTT0oWfEXIU87mjDggzei
         AI0tVC+LRBOcz0/kxQ3OHCjVkauFfEs92DkbhcFpD122fCwoOLp11S+PIFhUfR8ZZHHI
         kzO1buO2hjpNnM2BkCgjQHoSyY+i9lV0fEmYR5779cQ55SDLrzz2J/NqCim/7kiq3A0K
         Fk5Q==
X-Gm-Message-State: AOJu0YzhaeC4PCzz5QH362Ts/01QXaIi72Uw97SQPDZZGo4N4C8C3IVN
	cL5mmpN2+Run2yVETXfAdBHaEkOo
X-Google-Smtp-Source: AGHT+IEd2vTLeg2GpIsCyOKyOB5sACh8KieliOs//U/3JH0fTJ/5IoDfAGItJdrYHg+Wv8sdCg7VbA==
X-Received: by 2002:a17:906:b78c:b0:9bf:f20:8772 with SMTP id dt12-20020a170906b78c00b009bf0f208772mr7590866ejb.26.1699972733904;
        Tue, 14 Nov 2023 06:38:53 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (cac94-h02-176-184-25-155.dsl.sta.abo.bbox.fr. [176.184.25.155])
        by smtp.gmail.com with ESMTPSA id un1-20020a170907cb8100b009a9fbeb15f5sm5549367ejc.46.2023.11.14.06.38.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 14 Nov 2023 06:38:53 -0800 (PST)
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
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH-for-9.0 v2 05/19] hw/display: Restrict xen_register_framebuffer() call to Xen
Date: Tue, 14 Nov 2023 15:38:01 +0100
Message-ID: <20231114143816.71079-6-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231114143816.71079-1-philmd@linaro.org>
References: <20231114143816.71079-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: bIO1xUgW15Ed

Only call xen_register_framebuffer() when Xen is enabled.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/display/vga.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/display/vga.c b/hw/display/vga.c
index 37557c3442..f9cf3d6f77 100644
--- a/hw/display/vga.c
+++ b/hw/display/vga.c
@@ -25,6 +25,7 @@
 #include "qemu/osdep.h"
 #include "qemu/units.h"
 #include "sysemu/reset.h"
+#include "sysemu/xen.h"
 #include "qapi/error.h"
 #include "hw/core/cpu.h"
 #include "hw/display/vga.h"
@@ -2223,7 +2224,9 @@ bool vga_common_init(VGACommonState *s, Object *obj, Error **errp)
         return false;
     }
     vmstate_register_ram(&s->vram, s->global_vmstate ? NULL : DEVICE(obj));
-    xen_register_framebuffer(&s->vram);
+    if (xen_enabled()) {
+        xen_register_framebuffer(&s->vram);
+    }
     s->vram_ptr = memory_region_get_ram_ptr(&s->vram);
     s->get_bpp = vga_get_bpp;
     s->get_offsets = vga_get_offsets;
-- 
2.41.0
