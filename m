Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp878539njc;
        Fri, 20 Jun 2025 06:08:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVhVvAFKVJSKdA93/2nrHrD6ms7Esw/LrLyFwRNjhyTIhd/arcH8TaRIxKzDZx80AdvNaQNTIGOcY8WfA==@linaro.org
X-Received: by 2002:a05:600c:8b52:b0:441:b19c:96fe with SMTP id 5b1f17b1804b1-453659c05e5mr32758075e9.10.1750424934094;
        Fri, 20 Jun 2025 06:08:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750424934; cv=none;
        d=google.com; s=arc-20240605;
        b=C3xgInjZGuwj8RajnZs0CF2WXoQwZmTipDETdFC9292PtPXKtfiFMz2pqlD0bz141+
         AWn1g8SwFJpH+NCNFZ9JkabqZJ6n2kDQiC4FM2A7zeDXUwI9MEJp/L2MfQZnzcYHwY7V
         LZraShcq/o5tAvu/KkgPMbQECbqVwx81XcTQZCq2kkYBA8dSs5FdJFWj8jGO5VUY7K2L
         efNujBazTKCRKjriYqizvuqjEhcCxik8bP23/o6jpURkJRApnhZMEv8JPYhLHPux//v/
         2fzcY31+TT8wJUiVMVvVqHTVha58/kBduqLq7fh/Z6AIZf3X+bMF5kXn7+vOA4SXdH3e
         0TEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=WoXZ8Al0R/es9sXpuEKkELf4IYQr/L/uwmOyRIHiR2c=;
        fh=0MVNod1TJy5Cg+6VfKh2KtzCFavbofHBDnBaIBlNh7Y=;
        b=f/ycztzlDGmrBmnlnMIeMK1offUYcDIlCe3+X74UqI/fTN8xuSBwt29HaHAihVn6Va
         pbLzuiWTIkwfzeaKp/YWtMz14PML4wIDLgUX9kSG2MiJ86MMS+1FPH0Gp0XAhPaIXUCb
         lKGTdLi3BFefp4EKTYo4X6mW2bRlW8rOIJrF2C5VXgvaUoI4Icwa4PFHfIAGbfHhXnmK
         MvvoFBtsFxwv80P+WvAo2khjlrX6g/tICUCXExc6obhWynvpFTkahkBza/pka2XyVYLZ
         JA7Tco2SxpTewNmqq7PVhskF7KPZ7DqJWi+JQV1h1JV9uDaV/S/4wgu1NA7tpMtNt9/m
         89Pg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=euvQsox5;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-453646e9ce6sor8355135e9.3.2025.06.20.06.08.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 20 Jun 2025 06:08:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=euvQsox5;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750424933; x=1751029733; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WoXZ8Al0R/es9sXpuEKkELf4IYQr/L/uwmOyRIHiR2c=;
        b=euvQsox5mNv5r31SeeOYcfWi1BUVOOfTbYf+k9oPDRoctwf3vZH+jlBHyDVuNRDyPn
         xyzNUjMNhl2NZMVWsJlCC71sS9TfMURds/5UImX+1NwcMU3svLiFitU+HSRoFIoQbsz1
         2wwdxuXdjK75iXlRZDObgJoYzfnjV3Qd1jb2EarNZ5F9Vd6yyGTRMb8d1pogn5f7jZ1L
         AlRKgz2JzMoTl3kL69/7Cpw8G5chPtQktV1Y59o/a3sLs+2n18VjlStiAHMi0r5b+Ed5
         W1OmclCCFTvk6N2cFrUgKMsvQ2gigap7BGl0tQFQ6zhjzSL2K9jUml+F8++GYglXMmP0
         J8vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750424933; x=1751029733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WoXZ8Al0R/es9sXpuEKkELf4IYQr/L/uwmOyRIHiR2c=;
        b=WWldUOz4dcAhf/ehddSU1A39FCbUraUD1BrbTTCc/VWaAotFKPYnJdzpjG2j4n5842
         Le4gLym9Gr43eSEqz7HMVmEAGsifpm88Tn0QHuzN8UwclIKfG9hOLvsbImrTWOCtUka/
         eRzCdIcquCUmvxH8X8PbsF+UPfaWlHfAQ31OmdCVB8AHsxWSnywEP9afbBTcb3AELyxm
         kmwQJzJ+UFRaj83rJ3lcgEAoXCnjHrUyZJGdK+y+TwO5we7CDqUOXJvlSjapV6zlBPPF
         0KIfkrr8J3XgadOVEyibk8jUnVGJrzHklqhTLEEAiZBa4K5SCfdCsuE6O8M3vVD5c4G+
         Ywig==
X-Forwarded-Encrypted: i=1; AJvYcCURnvGNiP4/oTGyv+R8wmpLpQiemf5kPEK8aZbtBW/p290sZYTc41Jz3iBSxJmzsx1ROW5imbTPMxHVLA==@linaro.org
X-Gm-Message-State: AOJu0YyvJIx5KoBUaGmvSCA/q8bP29MGiqyV/PuVvh+tr9hiR9MAEnd/
	oeXCWIne3Y8XvWtHZ128xYgS3MTzjmo1S7c50hxhtG3uHHYQ5S+qmBsRKZyd5J4uWeqzxQ==
X-Gm-Gg: ASbGncu5wlgV/JEsRv/3p1Eq2lNd3o8sP/dvJArjdiXqLXLf0UCs1Uh1zYbvlepN0HY
	H0nZlQSSi1Bx3sHpa1n4LX0qXUhFmlB85xkbnYAGX3LsI7gzgqESvafTwxHmahxUv8UAazriiX+
	lIy+YMTZ/SE9xCKQqcj/pwCOO5cWcLTMcKcLQU84Ckhq8Opr8QgqQNk6pofeJsTHFehmZ2kjpLe
	lowIWKpSu6KCoyA87unOrOrldlDKQOpP1pLrvRrNBaovG/xz/ZC5YH+4Et15yrgvqiscsGYnYGO
	qzC2y7o/57hMWt/q8ULxHyRES0rJ2pK2Ne5DjgC+0kWbvUwHUKKnVnCmt6WeOubxT1bISWKpRbF
	XP1x60zI4BjspZXXvcHslBVhi03P2N0QC+Z4G
X-Google-Smtp-Source: AGHT+IGEOZJZmS9VN7oJFrBpyPnyA04MJAIvpYC6GlxrITVRrfApyBG3DfPjsMvyvrXG11kPH2vwoA==
X-Received: by 2002:a05:600c:8b52:b0:441:b19c:96fe with SMTP id 5b1f17b1804b1-453659c05e5mr32757335e9.10.1750424933502;
        Fri, 20 Jun 2025 06:08:53 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4536470826fsm24688205e9.36.2025.06.20.06.08.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Jun 2025 06:08:53 -0700 (PDT)
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
Subject: [PATCH v2 18/26] target/arm/hvf: Trace host processor features
Date: Fri, 20 Jun 2025 15:07:01 +0200
Message-ID: <20250620130709.31073-19-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250620130709.31073-1-philmd@linaro.org>
References: <20250620130709.31073-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: LH69m/hwTrEf

Tracing an Apple M1 (Icestorm core, ARMv8.4-A):

  hvf_processor_feature_register EL0: 1
  hvf_processor_feature_register EL1: 1
  hvf_processor_feature_register EL2: 0
  hvf_processor_feature_register FP: 1
  hvf_processor_feature_register AdvSIMD: 1
  hvf_processor_feature_register GIC: 0
  hvf_processor_feature_register SVE: 0
  hvf_processor_feature_register MTE: 0
  hvf_processor_feature_register SME: 0

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/hvf/hvf.c        | 43 +++++++++++++++++++++++++++++++++++++
 target/arm/hvf/trace-events |  1 +
 2 files changed, 44 insertions(+)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 52199c4ff9d..87cd323c14d 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -2160,8 +2160,51 @@ static void hvf_vm_state_change(void *opaque, bool running, RunState state)
     }
 }
 
+static void trace_processor_feature_register(void)
+{
+    hv_return_t ret = HV_SUCCESS;
+    hv_vcpu_exit_t *exit;
+    hv_vcpu_t fd;
+    uint64_t pfr;
+
+    if (!trace_event_get_state_backends(TRACE_HVF_PROCESSOR_FEATURE_REGISTER)) {
+        return;
+    }
+
+    /* We set up a small vcpu to extract host registers */
+    ret = hv_vcpu_create(&fd, &exit, NULL);
+    assert_hvf_ok(ret);
+
+    ret = hv_vcpu_get_sys_reg(fd, HV_SYS_REG_ID_AA64PFR0_EL1, &pfr);
+    assert_hvf_ok(ret);
+    trace_hvf_processor_feature_register("EL0",
+                                         FIELD_EX64(pfr, ID_AA64PFR0, EL0));
+    trace_hvf_processor_feature_register("EL1",
+                                         FIELD_EX64(pfr, ID_AA64PFR0, EL1));
+    trace_hvf_processor_feature_register("EL2",
+                                         FIELD_EX64(pfr, ID_AA64PFR0, EL2));
+    trace_hvf_processor_feature_register("FP",
+                                         FIELD_EX64(pfr, ID_AA64PFR0, FP));
+    trace_hvf_processor_feature_register("AdvSIMD", FIELD_EX64(pfr,
+                                         ID_AA64PFR0, ADVSIMD));
+    trace_hvf_processor_feature_register("GIC", FIELD_EX64(pfr,
+                                         ID_AA64PFR0, GIC));
+    trace_hvf_processor_feature_register("SVE", FIELD_EX64(pfr,
+                                         ID_AA64PFR0, SVE));
+
+    ret = hv_vcpu_get_sys_reg(fd, HV_SYS_REG_ID_AA64PFR1_EL1, &pfr);
+    assert_hvf_ok(ret);
+    trace_hvf_processor_feature_register("MTE",
+                                         FIELD_EX64(pfr, ID_AA64PFR1, MTE));
+    trace_hvf_processor_feature_register("SME",
+                                         FIELD_EX64(pfr, ID_AA64PFR1, SME));
+    ret = hv_vcpu_destroy(fd);
+    assert_hvf_ok(ret);
+}
+
 int hvf_arch_init(void)
 {
+    trace_processor_feature_register();
     hvf_state->vtimer_offset = mach_absolute_time();
     vmstate_register(NULL, 0, &vmstate_hvf_vtimer, &vtimer);
     qemu_add_vm_change_state_handler(hvf_vm_state_change, &vtimer);
diff --git a/target/arm/hvf/trace-events b/target/arm/hvf/trace-events
index b49746f28d1..7ef75184901 100644
--- a/target/arm/hvf/trace-events
+++ b/target/arm/hvf/trace-events
@@ -12,3 +12,4 @@ hvf_psci_call(uint64_t x0, uint64_t x1, uint64_t x2, uint64_t x3, uint32_t cpuid
 hvf_vgic_write(const char *name, uint64_t val) "vgic write to %s [val=0x%016"PRIx64"]"
 hvf_vgic_read(const char *name, uint64_t val) "vgic read from %s [val=0x%016"PRIx64"]"
 hvf_illegal_guest_state(void) "HV_ILLEGAL_GUEST_STATE"
+hvf_processor_feature_register(const char *regname, unsigned value) "%s: %u"
-- 
2.49.0
