Received: by 2002:a17:505:4c56:b0:1be9:327d:8ee3 with SMTP id do22csp1569339njc;
        Mon, 25 Nov 2024 11:59:33 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW2Q4HVOKWB71CNLwZ92TfP83iwu1lzDYmHLxo800azwyjybU/72xg6kE82do8yriMyCkPjl99lfg/37A==@linaro.org
X-Received: by 2002:a5d:584f:0:b0:381:f443:21d3 with SMTP id ffacd0b85a97d-38260be3e78mr11998089f8f.57.1732564773705;
        Mon, 25 Nov 2024 11:59:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732564773; cv=none;
        d=google.com; s=arc-20240605;
        b=ANvnTOVE2rq4sWdHLiVCXwwa63SJCNC2/Z+W4jIoIjjQQ+R0TODWw7U3gGZPxwxlDG
         RL3wQDrZ74JWp0tdjTYectMHgVAvlosodEpEYcTOB2VPhw37RjYkqlfUvXMA6NLCLopi
         ekLIGnpqUnicceVatyG0ewlH7yqvauHDk0dE64cm+TfR+o1mS59VfnZ2ouYcWPZ2JtGJ
         WarlXGZ4lCUN5YLuBVSp2Akk/RWb5Bus6YBqhSJlYdxyS/Cr91Ty50FzxmMyxhcxyCyU
         OnPKb0H42aL7lx/lQ/HElQ7lD1uHBow34RexkNxnaAYqny2dOipxHE7tHC5iLBXfmJUO
         kH1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=AM9CmiES+peuGOYCBRYh0Z2NclowtBsfFXloH3BjlTc=;
        fh=JqGI9kAdjnBdjmCW9VLytjUryrbsJ/cvmDupjjSZRqg=;
        b=VQZLGi4e2fMy+7V4029muCBkoYkV6mp/3+nAwZ1O596DKV8KRBj/1ZEKHYkJ/IbX3u
         KCMRtH2N9e9oJiZgqvBm2nC/QjC/NA0WQqvS3f5vQiNfVGBy16uoK+/ufS1YgoBb+uyu
         lPf+WuyzN91gunHAbYhi5EmoF24UCaiz7Qx9XP9J+mm3h4zcC8bffx5Yimd0D+g46kh1
         gyGm++aTr/QTpBfDj2itACGcC5eSz1o/PCdXschIv6n6lSTO+OfZiJk7bkSe76/dbGss
         6Zl02VFQpmv8vsgnSX+wTr/DP5JB0O3KrLlw5FK8DeIzUlgVkbNfknCnNhwWJG81i6sF
         ovXg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wCmPn6h9;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3825fd3067dsor2252638f8f.9.2024.11.25.11.59.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 25 Nov 2024 11:59:33 -0800 (PST)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wCmPn6h9;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732564773; x=1733169573; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AM9CmiES+peuGOYCBRYh0Z2NclowtBsfFXloH3BjlTc=;
        b=wCmPn6h9N9SYuTGGbqxc68MiWU2hkhBeDoIVlGIxIi8t7txBgCr4zIRVxMdVISurTP
         aL8pzTQmo65j9M/W1Y/3oyxRhPONIbe2iaKLthhoILpFsHrlcptfVxhg6yZ+Bx6oCl6E
         MT3QO7qu6HACqjNfF9q6UJISpv0zJQAPznYDCYCKQsh8zwdekKVDjD+WYfPdkiEiKl5s
         ygXltfuhf+TxuFN2IGjW/nIhtQThHmnvVLFFbkrHhXpohLnoyIov25RviWd8QhT34u2A
         YHShkFXnGnB7NPvrJjf4BVAnhSXyYOKkP80JpntQjgM8GTSiv02ct/+GOflxyHE+9nbZ
         yoMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732564773; x=1733169573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AM9CmiES+peuGOYCBRYh0Z2NclowtBsfFXloH3BjlTc=;
        b=QgmzoJviBT80pI5F6ghH0Hl8npE3aO7j/ppNDJpxQBytuuPci7JJR4Tir45orhcrjC
         gxLOPeRRpIlNpHtd9BFl2yJ99memm0Ij1lRGOY0jMXLeTVmNEgMJGKrt49EbclGsIByI
         qctBjf7OjiM5x9WvT5tXJCWbgSKqynjxjhRxV/0Qvkre6RbV6dD4Byz3CPCAM8QKBmFt
         DT94w69+o32iwqY1x72MyXYKxEKLasTVu19DXXqQXpphlxiyEZ9yHxWNiK9zKiBbR5A7
         xjZhNLkMYqOO9vannjR67DQe43/O24fZwkCy554d2meHPSu5OfuXACj8WFVbAmRrBzus
         s6ug==
X-Forwarded-Encrypted: i=1; AJvYcCXl65/Aak3xFDeCH9P84k/04r1RIXOsPhFGaZyGX64o7Ofi6NtADhOSBXGIO26A04nNJIxnPCqPJ2AU8Q==@linaro.org
X-Gm-Message-State: AOJu0YzgvtLS1lgU/PCyGFlxNjX9GF2nKj7e+dSU6aF/4X0h+ndwTpwb
	MJAx55OsJmRyJbJB6iiCDF5fvP3r+HvHu4jqUBBgcpiK6pM95PhZrBrgVXk/sVWEBg==
X-Gm-Gg: ASbGncuHAwTAVZxCjjdWmsHsIyZfEAJFrXedtKWRvHJaRWHu/f9qVHnYK3p2r21V1uO
	F7QpvsYy4TDyrz3M/ovlx3TySB0YqNYVX+DxKEN1gfL+e3JROBxQpPO+Fp4A8vRR8p/qgANCyXR
	/odHRvdz+B8JJgQ0fK6xJ78igo5+qUadrxZNPB4svesGHifAhvrWcPJ4DoWKKymFrlSpL7ZkmLN
	KT0m3zXaJdelN/yspKgFLsqUK1BzA7LVIvdwGlDeWfZ22K7yUtsotn6zOvu7CLTe5bI
X-Google-Smtp-Source: AGHT+IG8nC95KgxPOV4gNNszZYNmR7epAcoJPgXz8ijIjcuMTQZVqQBxAAlIVhMM0m+tNLQY0PCvEQ==
X-Received: by 2002:a05:6000:2ae:b0:382:4378:4652 with SMTP id ffacd0b85a97d-38260bcb8b4mr11780186f8f.45.1732564773213;
        Mon, 25 Nov 2024 11:59:33 -0800 (PST)
Return-Path: <jean-philippe@linaro.org>
Received: from localhost.localdomain ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fd0fbdcsm11237971f8f.109.2024.11.25.11.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 11:59:32 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org,
	philmd@linaro.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	alex.bennee@linaro.org,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH v3 15/26] hw/arm/virt: Add support for Arm RME
Date: Mon, 25 Nov 2024 19:56:14 +0000
Message-ID: <20241125195626.856992-17-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241125195626.856992-2-jean-philippe@linaro.org>
References: <20241125195626.856992-2-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: EQIpla5WA0zo

When confidential-guest-support is enabled for the virt machine, add the
RME flag to the VM type.

The HVC conduit for PSCI is not supported for Realms.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/arm/virt.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 1a381e9a2b..2d36640733 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -229,6 +229,11 @@ static const int a15irqmap[] = {
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
@@ -2165,10 +2170,11 @@ static void machvirt_init(MachineState *machine)
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
@@ -3013,6 +3019,7 @@ static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
 static int virt_kvm_type(MachineState *ms, const char *type_str)
 {
     VirtMachineState *vms = VIRT_MACHINE(ms);
+    int rme_vm_type = kvm_arm_rme_vm_type(ms);
     int max_vm_pa_size, requested_pa_size;
     bool fixed_ipa;
 
@@ -3042,7 +3049,11 @@ static int virt_kvm_type(MachineState *ms, const char *type_str)
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
 
 static int virt_hvf_get_physical_address_range(MachineState *ms)
-- 
2.47.0
