Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp2238539wrv;
        Thu, 18 Jul 2019 05:59:30 -0700 (PDT)
X-Received: by 2002:adf:f042:: with SMTP id t2mr49491405wro.139.1563454770736;
        Thu, 18 Jul 2019 05:59:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563454770; cv=none;
        d=google.com; s=arc-20160816;
        b=rwU+fvBoFj5CyeEcNUMrjxQi2qPq/WHtukIYn56vtNbgbF0CYfwMi7JWznMNtgfy13
         TYMsX4lZx1cqYTUE+/cMm4J6WVlpAXQwcEh/2J5jQx3u5FakI+d40aoR8VTs6mqc/hox
         kP/riC650knfSu0XUHfoV+Hyjd2Cown9VuaXuDbhJ26bfug3xnelFtm8RwsRsu4aT0v+
         WLpDodrSkyHBBgXSL8yOz3o7AK44fl2owjI9vsRvavisCRaze9sxgf3PI2AAl9ufOS+U
         hTf5oumWJO/6qKfcLYfn+1U/GnuhDr3zUsA1Uxs7lnteKeilPMLqPHkKLQPm4sHhCLTn
         3NbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=CyoFO1RlKJhdoAKsNHGdbd1/3rVaZK+AHTqU2IwHJqU=;
        b=LzSv8zlbmk3nXHqc47wkficvslpRp0KyydrEH7wkUj4ESPDZUo2Vta+DmGWV+deH7h
         vUGkd8kDmFfIiJRGtDZbvtzXUHVeSYTZHoDuPFEKvQlKh5D4L66/iFpMXfu0AgMA5fVm
         qtQ3hxJVX11dvv/SBdhqECXQWFnJ1Zo8k4FCmsiXVM4ZRav50J2cqR3V7jiowGvsomfO
         7jkC2O1rbSjMoLOHeqqEIW5/yrdw2vyx0zQ9bl6p6w7p8JkHsWWVa2f50dyRxn1jEEQE
         U0n87TkWK2N5I2nT3CqWxs/rnSTen2qM6PH3oSh+2bKpxuW5o5fLW65V1WBfz0xod+bK
         zDmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XqlyUQ1i;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id y132sor15997491wmd.19.2019.07.18.05.59.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 18 Jul 2019 05:59:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XqlyUQ1i;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CyoFO1RlKJhdoAKsNHGdbd1/3rVaZK+AHTqU2IwHJqU=;
        b=XqlyUQ1ib5opKjytg8AA5cVa1pCmD4UYNw8UOcfTQuisuAAjGQCOrOyeMtwvOdTSki
         xtD+XW6mdU33sLRVJssk1A/dh0XqL4w975WymYlI8XDVSYK4FDfCeErRGACrbvGiJf8R
         XATn2/YZJ29DckArQaVSpEm9DhfNkfsM9j062VKZAJm5QzjW/8iMzwA7T8imYFB7ELFx
         u7EG9+3MO4MIQLoSbjrgdSxTd/GmZThYE6FDtFYrFH/kaG1V0qR9kZtTN6R0WOp6LgYI
         aCkR+gwbRO4gp4HRyddCKjC2r2iPd8fFo35QVkMM2IkG1iGVEtWHLGxI0WVQq0lgJ5KM
         AIvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CyoFO1RlKJhdoAKsNHGdbd1/3rVaZK+AHTqU2IwHJqU=;
        b=tXDcgeg9Jl3IXrzF2O/Jo2zQXS4CVyMR0ku9TJklYx/pATw/O5ynSe3u1vSe14C5qt
         KLmvZaVTfeGLS5NXoVuNqj+gzHeqDxiDKQTo9fySBbb91TaeWFUr3RvizlK9PQgV4ctL
         /Zs2DRKxRiqMf1XKKz87jCFMBeaHLhHUfqgj3oUY0rtr1VZsoljInt3VoeadauJnK1EH
         4fJlc/HKE03ksjQgHZWHFHMm1rpYTVA1GvG2q+QRD2gRbk5PgtDTFRo+LU5ES4LF9WY1
         zpZCbsGKXpId1wua7iTFpuK2QvwUvAGNA5WmCDSnrQyjmP31LOg9MBkAlRt/uWYJH59F
         8TCw==
X-Gm-Message-State: APjAAAVWtMeMuAduRz+V6lZ9+2S0beK+jjOwpFRZkTqwYO8J407kb/hP
	iGUTS/e2HvCcaVI6cUZ6xo879/BX
X-Google-Smtp-Source: APXvYqx/Wtku8ad9iXWdPJ1Luln+/0XKpr0pXSY6Qpt6pyazyOU7kP5fL5qQTMQea/huGBsdF0nbYg==
X-Received: by 2002:a1c:6882:: with SMTP id d124mr41531689wmc.40.1563454770381;
        Thu, 18 Jul 2019 05:59:30 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
        by smtp.gmail.com with ESMTPSA id t63sm21622182wmt.6.2019.07.18.05.59.29
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 18 Jul 2019 05:59:29 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Laszlo Ersek <lersek@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH for-4.1] target/arm: Limit ID register assertions to TCG
Date: Thu, 18 Jul 2019 13:59:28 +0100
Message-Id: <20190718125928.20147-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: hlxX/ZwIlUC6

In arm_cpu_realizefn() we make several assertions about the values of
guest ID registers:
 * if the CPU provides AArch32 v7VE or better it must advertise the
   ARM_DIV feature
 * if the CPU provides AArch32 A-profile v6 or better it must
   advertise the Jazelle feature

These are essentially consistency checks that our ID register
specifications in cpu.c didn't accidentally miss out a feature,
because increasingly the TCG emulation gates features on the values
in ID registers rather than using old-style checks of ARM_FEATURE_FOO
bits.

Unfortunately, these asserts can cause problems if we're running KVM,
because in that case we don't control the values of the ID registers
-- we read them from the host kernel.  In particular, if the host
kernel is older than 4.15 then it doesn't expose the ID registers via
the KVM_GET_ONE_REG ioctl, and we set up dummy values for some
registers and leave the rest at zero.  (See the comment in
target/arm/kvm64.c kvm_arm_get_host_cpu_features().) This set of
dummy values is not sufficient to pass our assertions, and so on
those kernels running an AArch32 guest on AArch64 will assert.

We could provide a more sophisticated set of dummy ID registers in
this case, but that still leaves the possibility of a host CPU which
reports bogus ID register values that would cause us to assert.  It's
more robust to only do these ID register checks if we're using TCG,
as that is the only case where this is truly a QEMU code bug.

Reported-by: Laszlo Ersek <lersek@redhat.com>
Fixes: https://bugs.launchpad.net/qemu/+bug/1830864
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Laszlo, would you mind testing this on your setup? I don't have
a system with an old enough kernel to trigger the assert. (The
change is pretty much a "has to work" one though :-))

 target/arm/cpu.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 1959467fdc8..9eb40ff755f 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1369,6 +1369,9 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
      * There exist AArch64 cpus without AArch32 support.  When KVM
      * queries ID_ISAR0_EL1 on such a host, the value is UNKNOWN.
      * Similarly, we cannot check ID_AA64PFR0 without AArch64 support.
+     * As a general principle, we also do not make ID register
+     * consistency checks anywhere unless using TCG, because only
+     * for TCG would a consistency-check failure be a QEMU bug.
      */
     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
         no_aa32 = !cpu_isar_feature(aa64_aa32, cpu);
@@ -1383,7 +1386,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
          * Presence of EL2 itself is ARM_FEATURE_EL2, and of the
          * Security Extensions is ARM_FEATURE_EL3.
          */
-        assert(no_aa32 || cpu_isar_feature(arm_div, cpu));
+        assert(!tcg_enabled() || no_aa32 || cpu_isar_feature(arm_div, cpu));
         set_feature(env, ARM_FEATURE_LPAE);
         set_feature(env, ARM_FEATURE_V7);
     }
@@ -1409,7 +1412,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
     if (arm_feature(env, ARM_FEATURE_V6)) {
         set_feature(env, ARM_FEATURE_V5);
         if (!arm_feature(env, ARM_FEATURE_M)) {
-            assert(no_aa32 || cpu_isar_feature(jazelle, cpu));
+            assert(!tcg_enabled() || no_aa32 || cpu_isar_feature(jazelle, cpu));
             set_feature(env, ARM_FEATURE_AUXCR);
         }
     }
-- 
2.20.1
