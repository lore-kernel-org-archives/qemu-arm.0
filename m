Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp877361njc;
        Fri, 20 Jun 2025 06:07:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW2AFjv9rcPOtuyxPem+rrL95sNOoEVFu22ZUjkADooXrr/0e/LoBtx882wwE/xuBGgdvjAMAsJD74QwA==@linaro.org
X-Received: by 2002:a05:6000:2108:b0:3a5:3af1:e21b with SMTP id ffacd0b85a97d-3a6d12e6d88mr1788415f8f.47.1750424855134;
        Fri, 20 Jun 2025 06:07:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750424855; cv=none;
        d=google.com; s=arc-20240605;
        b=ie0tMhvb1bUQkRrDURmqJEOy/w1GH0oRemUXnJuod4sPyxOMHlKb4OINOd7sm+7K3B
         lteHWNx18/MH4aaYhqx6O4ujJ/yvUkkmx7Jnll/N8AItD2DMI3Bc63IuJ7Zei08kDTlz
         jog78BQ9sTp/EE2+1g3DIq5Qzniu5O6xKsNz9uI7EJhIQiimvWr7H2a/luBSxK4yrKwu
         HYKmvxoSeqdK8s5iU1oOUrIq5WTTSM6BbDfIksnij5YUchwzuEDHm1bDdOTdZfGCEUfq
         MQrhIgPJjTZpzjKxwmzDtnKc2kQ9A/VlZ3mWT/5SB2wgaquSAz22nMBpjAoAmc4RYdkU
         cMOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=i7X9qE0A0zkH5gg9YDfRhHn13dFLj9D3tYtyAnJR94U=;
        fh=lLWY+Bh4YktQlEcNFLpVcM1Gp/Ishxi72oAJFjJLeAI=;
        b=bGZ0sDjSP5b0Gh9mMQ2Rey1xQfkhbfKbRyRSXfKudl3gKLX06JlOBGwg8peAIwPDzn
         D3+nizljK0TzuEhWAtClR2883f+oJN+Csda4/ZYfd3MiAMVbnlK5juo1D3u0uuLXssOn
         75zgLXyk4OIIHGGpXeNtX/HNwOo9D1/NXRrIn8abWBZbmOuJ8Y2/lg53U8gCo3vsndMg
         57aLmtVHBvyH6grQYPeoOHapKJ5CIgnmRva9VhJX7+jEcgHZe7/dfsC9tDboSUQdMesK
         fk/46c9H3jpB4xPrWRyWF8t8ii5PqNYAmB+exT957/aopajNrJlTV/0sgtUu7t8cUe9a
         fIJg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FEedxWiu;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3a6d11537d7sor612291f8f.7.2025.06.20.06.07.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 20 Jun 2025 06:07:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FEedxWiu;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750424854; x=1751029654; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i7X9qE0A0zkH5gg9YDfRhHn13dFLj9D3tYtyAnJR94U=;
        b=FEedxWiuIueDoIYALnhvS63R8OCYKTTBKwCjgqYZNYVStyEXhBHaQT65qEP8cpYwTH
         ocu6EzEO3uDZnXlRJGKH2deVv5t7+UyEaEpRpjOFZv5Elw+LV8x+z3+ND5fy4z8Qqv3O
         AYMpvvljCa2NlDsXQbMq4IWBAAGFhVpXEFk6N/X7GjUDBRhwy6tMTpj+iaUtnqeZq46n
         hvs7RJvq/HHk2lGV4Rd8mtskRlKJTJ9yLcKWUP/1ijRGjcElBRwGfcOzkLbOuDVyQe28
         p5S5XAJCFX6NKkaKR2xDZZ4uO0gaHtAqCpyRP42NJGdig9Bu56QKikUYPXYuz56VWl1o
         J1tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750424854; x=1751029654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i7X9qE0A0zkH5gg9YDfRhHn13dFLj9D3tYtyAnJR94U=;
        b=CtG35x4K7WbVVboWRfK2lgYG0DVStOtL2VGYQMXZuMMXRpC0ReBM5LvA3b33zyTOxz
         /sA8zwZJSrsptXZ/bqXgFwANWXZgaItjYwT6M8rBWwH6NZ3QRGtgpe9aFmTxVOogfE50
         ySAjsMJ5QnT2LUi5zlJCitl92ZWzvXXPmc5VxYXAMFLPc0enopmf5w7665b9JKSE9es9
         bUWcHQUBUSryBZeZK5WmA9isGEQqPnHEdBoNK4Ynp6npMFdwFl2pXJrK8t7aRyaj1Hsn
         Slvx4C7gEVz98CmRrlWGO2mb8+PTFKUZO7YVKp+D9bXsUhIuQ6A1euTSKltePlxb/A5v
         F6OQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9CT4xryw0+obQB2GgAxGbtr/rKVtzXkm+ZqBWl+vxpp7aUvA91Danrb8fWTSPuimGuIz5jHIleL+PWg==@linaro.org
X-Gm-Message-State: AOJu0Yxny4KcV6HpKdcVWpGdSKJotedUovsNEEQP0WtdLPNyt0bDQKoJ
	6xbm22+a0V2yxDyLYXwZmF7zDe3gr1CSJKTHEi8CeScq9yKWNTiC+B2q3XYL80JLdclgQUNRsxv
	9e19B/nvBxg==
X-Gm-Gg: ASbGncudPPIgkgDazg138ZCd6uttEAJLGoclIeIg30TbdtZsgAA2K79pz3CxaaxbOE2
	YrveCYSRSgyqSgP1dB5pQcK72owh6KdeQsOVpsWesnivlJ0tyxCWol8FmYwbbu2eUL6AbDln7Zf
	kuzXXVxDM5TICGdp23xQWTQKSOpRosrxRDaufwi1EFSptEU89F4QPc/+1dOad++g3B2D4D5VdEj
	EsQxZFpjQjEcj09u+Le2ATZfy/cCLO6sxBc1YyK+EkzmCdMyMFZjSFWh5B1t5a2hukpYETA4aEQ
	lRdIEsazyQE8tYo7pkaVqIru5v8GfOdAvsUFkkxQrP95XbW4VY/ar4HnJ++VlizijuwjzPq49TC
	1EhPLzizP1hLFwbj+IStNHRvIcy7WSbVPM1wum0QtjHvT+bk=
X-Google-Smtp-Source: AGHT+IG8MOa1mgx5GRJT2pi7G8sTIbJ7uQF1KFg+Pl8xxcjdSw3j34E0kQi1ej0Od+hgqLrB/UqKrg==
X-Received: by 2002:a05:6000:4715:b0:3a5:2923:7ffa with SMTP id ffacd0b85a97d-3a6d1193fd2mr2532616f8f.7.1750424854370;
        Fri, 20 Jun 2025 06:07:34 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45364703f1esm25142395e9.32.2025.06.20.06.07.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Jun 2025 06:07:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Alexander Graf <agraf@csgraf.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Phil Dennis-Jordan <phil@philjordan.eu>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Bernhard Beschow <shentey@gmail.com>,
	Cleber Rosa <crosa@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Cameron Esfahani <dirty@apple.com>,
	kvm@vger.kernel.org,
	qemu-arm@nongnu.org,
	Eric Auger <eric.auger@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	John Snow <jsnow@redhat.com>
Subject: [PATCH v2 04/26] target/arm/hvf: Simplify GIC hvf_arch_init_vcpu()
Date: Fri, 20 Jun 2025 15:06:47 +0200
Message-ID: <20250620130709.31073-5-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250620130709.31073-1-philmd@linaro.org>
References: <20250620130709.31073-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: lh8dcru0wJ0u

Only update the ID_AA64PFR0_EL1 register when a GIC is provided.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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
