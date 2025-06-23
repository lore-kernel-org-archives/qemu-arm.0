Received: by 2002:a05:7301:19ab:b0:175:694b:cb76 with SMTP id mc43csp2509377dyb;
        Mon, 23 Jun 2025 05:19:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWeNhST0RY0QOHjCPx0LdkW4A8nR5oENKyaoEAX2ms2qt1Tm6gA4Cpbko3GMUhGYsRclew+czrk5UnA6A==@linaro.org
X-Received: by 2002:a05:600c:3b84:b0:441:b698:3431 with SMTP id 5b1f17b1804b1-453659ec191mr101282875e9.28.1750681148786;
        Mon, 23 Jun 2025 05:19:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750681148; cv=none;
        d=google.com; s=arc-20240605;
        b=VGXqglUmdpl7XQZ/FZdMRS2zMm+RpG8RbSJvIdrgR53d+/AdL98h9BBMrwjxJOhASy
         8DZnmdbQqdHvWRzA1GwB8hfuefsJKwuPLGP/P7fDtIxES7uujhqxdCn09G+RmmfKblMr
         VvpFM9ZA1IH4YxpCr3lpXQNFN1MQNJ2aKrIRi/FSa2j4tUVo11RaXRqw90WtvNzw9Gac
         Y5ReoglKKZSJd3LOwsEshhpS2rTGcLUMiXuf4f4UF/M80dctmw1JsoG9LV1/A3pVCwbw
         mLVZG0rkEWGYzo36ne02QcKKkd5XErkgPaqXxiXjdkG+mh6v5z+PG+lL8e0sG1SeKFKI
         O5lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=LDQM9sk8xLoIDxyTCgc//1G3alM8o04T+fdq/t3mMdE=;
        fh=eBL8IqzDsM2pxLgyD0m3NBK4RVBZlPxhuqrIPNQGlP8=;
        b=ETtSr18MpmiYFnujhMwmW/gnVec/pjt7OvnFVfSDnH+txud/ttBTqBVM5HXipj2v5d
         I/QxhJSPk+KfGATgROJccEXcllmnqvtSz0Fnr9LEJYJ3EwL+vWsqqyAFWbk0+hSrVx8z
         G+OpozeudUgHqwGrk2uFgJbNsq5OH6rgSPVOrEbgDvwOa8z0rStLSBlNIM7zvxP+qp0w
         HjgXPtFfnu387ZMSBdb8Z8GhPXqGBAdq0aFpSaHbUQNdwOIqzIFKFGhhPfe4VaYavx4P
         YZDgprL9MBW8YKgmP0d7THFNhvqR4IKvYWyvKtVfrDKbqKqI0HxHRti8eS1+/UTPRG1I
         dofw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z3LpX3a8;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-45364704507sor29249965e9.6.2025.06.23.05.19.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 23 Jun 2025 05:19:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z3LpX3a8;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750681148; x=1751285948; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LDQM9sk8xLoIDxyTCgc//1G3alM8o04T+fdq/t3mMdE=;
        b=Z3LpX3a8FfbLM6PJaVj8+PYB/PMzcVRDlSnWvMK0XQ3OaUJVII9KNep2SOcNm58RwC
         BcDjgWTEaKoIoyFRbdA70RialMeII5RrTE0iqO4HgwLI63axw6lZaFDPF2jeoCddpGoZ
         Rl8umK+svmSoPwyhLtLeNh7imZK+VX4AQoNCdClxM32PNTBT+TKAk9YEva15y7JPXp+w
         fUhfLYtiWbA7x6QoDpnN2MXynPt6k/+MIgIPiLpL6gOC19hAWbuhYY6BMFHI02ULG2Dj
         zBVxACxaOnypzSnXf04X8YTzi5nXjFR3Izu7n+eWhNBWxqq1LiDmaA7wR68QAw38HOyP
         hsYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750681148; x=1751285948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LDQM9sk8xLoIDxyTCgc//1G3alM8o04T+fdq/t3mMdE=;
        b=g3VtF1EWvKcV5ec3bmNu9X19VgLhwtFdpasdimzyff/XzsKCLCTbkFE+C/Ab6V6rM0
         vE8qxhD7jGTw6ElhXZSsBpNvW76qppEV7JTVMB65KUgzKRoJpneupQztAFiiD3K6L6jb
         Zy5VzhofV7Mk3R1S+hYo+IZcyewrP4NlhwIyEv7tg4W436XrvB3ilhNI/3yeYrA9QCdg
         fozJ70PDr7l6I10419QKsokcjN3yZOuLhhwC6PihZvgA+XiesIDiQP4xhsqonQZGyUKe
         +sT/4bS2w4H4KrqNwrmMeEGmhwGJLjxlTs6sPc9S0j99cfpmkBO8lci6dNrxuzZbM10e
         XYXA==
X-Forwarded-Encrypted: i=1; AJvYcCWZzhZHehJafX4mx5COrYSfnOn5dxUbAnvoudjwagirZHGRi+ilJWwbshLNeI83UPuI9oi3GjJDARtZHA==@linaro.org
X-Gm-Message-State: AOJu0Yy3fp9XXekSx/S6B0M5m9ptmsgnzCC8EI69jYLPVZ7eO8bhxTNs
	N+Wf4pMTNE3npICKy6ne5i3GPP0/mqcZuKohyIGcs1mGFp94Y8qoHoyPJkAR99J5LDaIrA==
X-Gm-Gg: ASbGncs2jR3Nj2B2Vkb+zJ0WUFEDXX0v0hWvJs9tsDo9NvxsOARMxAx5ZYN4XEcWnXK
	WgL9ZkEzlFjs/EDGHTEazGjyi5izmugzj7fVw+rqpuw6FnB9ACGwXHs1BvbZzLIEjDqtBUkDCT3
	LXTCXbNbTiLvs9w4PxshzwvaxAytx+ftl1u8vzzh/2m61kasPYXe93wwT3yNyFVNAShuoxwh7zF
	EvJgW0dra8gZ0RhY0zL4JFAgJxysNJIXBe+QODTjrt1wcK1Iv5cyjh/6kF2APE7Mm2lT56FqYr+
	iThSEiv/lrpX/wEGMpwtLMgbU6MgafYx3YZKV+HmKknFedgvWD4a1/SWINFULwB6UpIqnlurEaX
	DC+NQ7SaHZvngjLtFJMaIhIjAYSOYUXhQbeab
X-Google-Smtp-Source: AGHT+IEEGQ2yizNQOBV9T6BfrGjeWcpsEH+4yJg0Dp41EHihRocLWjYUthkP7XbX59/zuaabZ4ahQw==
X-Received: by 2002:a05:600c:c172:b0:442:f4d4:522 with SMTP id 5b1f17b1804b1-453660d7e3fmr109375695e9.5.1750681148220;
        Mon, 23 Jun 2025 05:19:08 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646fd7aasm108543505e9.20.2025.06.23.05.19.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Jun 2025 05:19:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alexander Graf <agraf@csgraf.de>,
	Bernhard Beschow <shentey@gmail.com>,
	John Snow <jsnow@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	kvm@vger.kernel.org,
	Eric Auger <eric.auger@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Cameron Esfahani <dirty@apple.com>,
	Cleber Rosa <crosa@redhat.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Phil Dennis-Jordan <phil@philjordan.eu>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 04/26] target/arm/hvf: Simplify GIC hvf_arch_init_vcpu()
Date: Mon, 23 Jun 2025 14:18:23 +0200
Message-ID: <20250623121845.7214-5-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623121845.7214-1-philmd@linaro.org>
References: <20250623121845.7214-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: kR4S3CFG4dDa

Only update the ID_AA64PFR0_EL1 register when a GIC is provided.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/hvf/hvf.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 42258cc2d88..c1ed8b510db 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1057,11 +1057,15 @@ int hvf_arch_init_vcpu(CPUState *cpu)
                               arm_cpu->mp_affinity);
     assert_hvf_ok(ret);
 
-    ret = hv_vcpu_get_sys_reg(cpu->accel->fd, HV_SYS_REG_ID_AA64PFR0_EL1, &pfr);
-    assert_hvf_ok(ret);
-    pfr |= env->gicv3state ? (1 << 24) : 0;
-    ret = hv_vcpu_set_sys_reg(cpu->accel->fd, HV_SYS_REG_ID_AA64PFR0_EL1, pfr);
-    assert_hvf_ok(ret);
+    if (env->gicv3state) {
+        ret = hv_vcpu_get_sys_reg(cpu->accel->fd,
+                                  HV_SYS_REG_ID_AA64PFR0_EL1, &pfr);
+        assert_hvf_ok(ret);
+        pfr = FIELD_DP64(pfr, ID_AA64PFR0, GIC, 1);
+        ret = hv_vcpu_set_sys_reg(cpu->accel->fd,
+                                  HV_SYS_REG_ID_AA64PFR0_EL1, pfr);
+        assert_hvf_ok(ret);
+    }
 
     /* We're limited to underlying hardware caps, override internal versions */
     ret = hv_vcpu_get_sys_reg(cpu->accel->fd, HV_SYS_REG_ID_AA64MMFR0_EL1,
-- 
2.49.0
