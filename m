Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp2497943ejd;
        Fri, 19 Apr 2024 08:59:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVi2P5OSmha6yPloG61Sw/MQirZC5APzBOj6LaM9J3uLMxzjql2q3qVrFrhDMw+hJBIWHH3jQ6Fu0qwwJKS/iBzTeyhmMC6
X-Received: by 2002:a05:600c:1c05:b0:417:d624:1fe8 with SMTP id j5-20020a05600c1c0500b00417d6241fe8mr1785745wms.30.1713542390709;
        Fri, 19 Apr 2024 08:59:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713542390; cv=none;
        d=google.com; s=arc-20160816;
        b=nrJbZUXAgOqfNsjjZdvHLEqAnmk0/YrICYu0r/6FHuIGxdyjKLefoBY8H9B8+grzU6
         CQKiCXuS4DQAf4lAQrMCybGIIIrQQOnp9P89iiYHOI0495/IVFdUGWrmJJ5id2hICuVw
         L98XzJy2XsnLKf842Zl4RujkEAG2NAdfiDpeATNJgqCO1oCJNtFZdzO7MBW+YVWzFjYd
         56/XtLpMWmpqYWLjqE9sxNuZp462MwxU3H23ubPL0ZvO6ksMUi6F1Aurk/D2poaWQ5g2
         VGtZ1vHW/pz5tj2JyZFqHIHMAXzviHBlPVY0mkiNvyt1TRHDbdm5wCm4LCsxdvmHz4iw
         eAKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=CRM3PMgf67soEHO0QvvaQBhnswxt2iC+13Xw/Jq7gQ4=;
        fh=QLryh67WN4BPHQ8qYT5fqr8kFTWYZxu/Xd2uxgQroCM=;
        b=ldADvPnUeH5l++r+w6K3rjrW4pCYLbISaN0k+FqPpRFABXCpfesw0GCsWCVrcHbvi5
         UKXKJddI1Xt8rHLTCJ/RRStHkY3JyvZROzsnc7LKIX9ErLZG6JMDktjqbYzCDkolslUP
         n6u02Y2M0nxDcyQUyxgBFtLQPLn63OlERs69O4ThabHzqRqGwt+BRXnpA5+chjuN479z
         2Pyoo9dsJFtuOEWmwb/Bn9YQADFZJ57vDyEscsim098WJU0n3d1A3exSFjMYT1/Bw1Un
         kyq4T09VlmSN0X3B2DwwCBFuYIl8UCiiiOCtFvqtTYtBEPVVaipLP8Cq2Gv/m8WyI62S
         NJ9Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nPfkp7uO;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 6-20020a05600c020600b004177c3315d2sor1279282wmi.10.2024.04.19.08.59.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 19 Apr 2024 08:59:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nPfkp7uO;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713542390; x=1714147190; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CRM3PMgf67soEHO0QvvaQBhnswxt2iC+13Xw/Jq7gQ4=;
        b=nPfkp7uOlqIRGp7N75vX8L3zii+qrJjdkzrdezSAPQ5r45nsrbh9g9b/zqQtuvLKf2
         eUuC4L2SgMH9GxNAxC0FuNIpkV252AioL6ZZ+6VnmJbcDzy5RqK5QTZLxLSQYScymlU4
         tbMPqmUWRfxjMOovm92K+69v5SmSD4xrLgd06wBU5D6SBRR7JIK30vmlkRT5k7A6Mm5r
         RoyE5HRjCY7g5quYKraX8X4+Bx2WRNMeLz5zFDk8Wy0Lq8xzebxv3eF8URoMEdLTn8Pm
         QUyeKjLVw0GeNhljSjbcwSJQan17IaEwK8VldikdoyqIZFL16ZfB3bHKG8UY2V+ph2eM
         RVVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713542390; x=1714147190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CRM3PMgf67soEHO0QvvaQBhnswxt2iC+13Xw/Jq7gQ4=;
        b=iIcCTsGjaCShHQnXeaM2vPgZuhggQpowIxOyi0RjC5iq7KWc+qONFF8F4t+yQ+EvgK
         SEoO4YwLyj3O+uDaWHVcLTyx/tbZ2M8WP4OJpUJFXU1RQb4K1rnYudNu3RNv9+erpPdD
         aWqrat71iA0gV8LSNujHPGJ2u0jSzhceI2eijbv20D2VG9vef0AT0COUm8nZ+rTGBOvr
         VBDMrqMKb9gxmAiZmPMjPm9DzXFhdKsA3vsC6nIFntSIAGAQ7+QeQQnOycFfRaItXbxF
         u0jGQ7BhI4QPrq8aspyjRl++QoomhRPzQpLPrFUASiLSjvvhrrSDCi4VGS3rd96Z0t4T
         bYxA==
X-Forwarded-Encrypted: i=1; AJvYcCWnfWjcAeoJDSoNiGAWAcHNStQxhhBnzo1nO1rK6uceNI6ynLXwKCFppeTcQ/Ymmpoq3y5uOP1/evZvUTfCM/A9f92MGKf/
X-Gm-Message-State: AOJu0YzY84K7gIO46pEVLIb8RzUtoCogAUFZuRL2iOGB5oBBI7h/knSC
	hZCUNOnZjWHFAOFB6HK13KpGi5yY7d7ot+ZeTAEwN4zOjgYOzCZTqW4C9cfBIMATqA==
X-Google-Smtp-Source: AGHT+IGVICopAXm0pEWgBvrgks5IfxQpCLgDaJmm8g+T7HOdc7+HvF5tidjUIpsGKu7caC1zxuWLOg==
X-Received: by 2002:adf:ff8a:0:b0:345:5f6a:cbf7 with SMTP id j10-20020adfff8a000000b003455f6acbf7mr1681426wrr.29.1713542390205;
        Fri, 19 Apr 2024 08:59:50 -0700 (PDT)
Return-Path: <jean-philippe@linaro.org>
Received: from localhost.localdomain ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id p13-20020adfe60d000000b00349b73143e7sm4793089wrm.75.2024.04.19.08.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 08:59:49 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: philmd@linaro.org,
	pbonzini@redhat.com,
	alex.bennee@linaro.org,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH v2 05/22] hw/arm/virt: Add support for Arm RME
Date: Fri, 19 Apr 2024 16:56:53 +0100
Message-ID: <20240419155709.318866-7-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240419155709.318866-2-jean-philippe@linaro.org>
References: <20240419155709.318866-2-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: XD1HZPgVOZmb

When confidential-guest-support is enabled for the virt machine, call
the RME init function, and add the RME flag to the VM type.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
v1->v2:
* Don't explicitly disable steal_time, it's now done through KVM capabilities
* Split patch
---
 hw/arm/virt.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index a9a913aead..07ad31876e 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -224,6 +224,11 @@ static const int a15irqmap[] = {
     [VIRT_PLATFORM_BUS] = 112, /* ...to 112 + PLATFORM_BUS_NUM_IRQS -1 */
 };
 
+static bool virt_machine_is_confidential(VirtMachineState *vms)
+{
+    return MACHINE(vms)->cgs;
+}
+
 static void create_randomness(MachineState *ms, const char *node)
 {
     struct {
@@ -2111,10 +2116,11 @@ static void machvirt_init(MachineState *machine)
      * if the guest has EL2 then we will use SMC as the conduit,
      * and otherwise we will use HVC (for backwards compatibility and
      * because if we're using KVM then we must use HVC).
+     * Realm guests must also use SMC.
      */
     if (vms->secure && firmware_loaded) {
         vms->psci_conduit = QEMU_PSCI_CONDUIT_DISABLED;
-    } else if (vms->virt) {
+    } else if (vms->virt || virt_machine_is_confidential(vms)) {
         vms->psci_conduit = QEMU_PSCI_CONDUIT_SMC;
     } else {
         vms->psci_conduit = QEMU_PSCI_CONDUIT_HVC;
@@ -2917,6 +2923,7 @@ static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
 static int virt_kvm_type(MachineState *ms, const char *type_str)
 {
     VirtMachineState *vms = VIRT_MACHINE(ms);
+    int rme_vm_type = kvm_arm_rme_vm_type(ms);
     int max_vm_pa_size, requested_pa_size;
     bool fixed_ipa;
 
@@ -2946,7 +2953,11 @@ static int virt_kvm_type(MachineState *ms, const char *type_str)
      * the implicit legacy 40b IPA setting, in which case the kvm_type
      * must be 0.
      */
-    return fixed_ipa ? 0 : requested_pa_size;
+    if (fixed_ipa) {
+        return 0;
+    }
+
+    return requested_pa_size | rme_vm_type;
 }
 
 static void virt_machine_class_init(ObjectClass *oc, void *data)
-- 
2.44.0
