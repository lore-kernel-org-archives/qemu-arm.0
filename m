Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp2497995ejd;
        Fri, 19 Apr 2024 08:59:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXEgY+Q2xIbIyGucNTkJ1YBbVJ3+0amvNhb/O+YMmFOhyHxDBh8r5YDi0vy7xz7N8oxEFUkzL5oXBevyedXZ/lXu0St5pwq
X-Received: by 2002:a5d:460f:0:b0:349:cc8c:56ed with SMTP id t15-20020a5d460f000000b00349cc8c56edmr2000616wrq.6.1713542393870;
        Fri, 19 Apr 2024 08:59:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713542393; cv=none;
        d=google.com; s=arc-20160816;
        b=cTeZau3Z9usZaxQeqjd04U7nciBFJcyD/czSqnxP4IDX3gi/uMpqkJlGQ60BgBmlhN
         wYPee3Ocub3mhA357rIWmrrFt6t0rtrGapK0hVEHF584OblQxC9eSW2yHPHcZefnfAE8
         Hm2gsGJXi1WIzdPnkpjAtjAyKnHTGhDdnYkG/mjHLm6/aa/z4TdF8i+AJ/orNRHD3LjK
         dKneEVfY2odp9g+MBt0QMAI2hhuAjJpyDR1aBa1l1/6jqlcwIkdpdpuy9Wzr836Gu06p
         B2uK11zBpbEUDrFARnThS4DnNXaeR0vJrXhabau/DLx8Pw2VWdMtoBhyx0ngwOgNKqx9
         0vJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=RSfgbPCTP9EyXuV3juP9dkL7EJuQyUK18eBXqNLqpbo=;
        fh=C0+9JoGc63e0UWZ3wNxvcvADeD/muW4rE0DypyfXAmw=;
        b=soQm2XEEeaQSM9lt2mEf2tvSXcLVMUY6IdbXAZ29WY56IibMRU26/XK/x994p8UO1M
         5vL3tizZeaS/l+Drh7WpvkFaspuNPF1wCkLrWYcpT7lJN5BQlNlsL9UmGPqEMby7RTS3
         hkxyJIMIHu8gQ5lC5gNTMvIStCyMSfIew7RxzAHEXFrfkJgCD0EWxG3de+0eJRj0ghpe
         mqjaymzT2fPTcET46c+2wefmaEWimjyJStCGUkIR7fhNIKanQdb7a/wQq2JaCJ/PwaFu
         CV+pWiqdMwpNLBoeR8SVoG7I+51C2GR+7mJq/9RvnSmWpKpuBkCXRXqdh58Xvw2JehIL
         ttSg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RVfLNiou;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id t13-20020adfba4d000000b00346c40d96c1sor1834601wrg.7.2024.04.19.08.59.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 19 Apr 2024 08:59:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RVfLNiou;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713542393; x=1714147193; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RSfgbPCTP9EyXuV3juP9dkL7EJuQyUK18eBXqNLqpbo=;
        b=RVfLNiouEv+UHmeJLrnH63X7VTTlGrWsLWIQm+Y1KcF0zFyX25WetdS4Wfsbxq/fni
         x42VZsX4T7FTnag3y7Y27m4fk9V7PAU5yiU1xn8a5Vu7hi1PKEtMbvAtPK5Od9GaOC0D
         +Q2a/oMlaa40go25ePHGyX6L+LBYJj2qc5VaZCqcP5cy/rhaaz09es3xjy9QMN2UdhAC
         t3Hcps3TUCdqaxYSi0smJt37tkz4FKXdyaYz4HenkxxT1hhrp1ckd6aW1AMusi2aLSPj
         bnfiLvAs0A40Wytao4kW+6h3YSC/JCLccnV41BQy8R17ItqiEMkMpRPNYSr5eIgnWBPw
         NBRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713542393; x=1714147193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RSfgbPCTP9EyXuV3juP9dkL7EJuQyUK18eBXqNLqpbo=;
        b=An96tvsuQjaMEi+QZIWMlheYbEMp2jae2ILBNMoX19tT+sFWZW26ooqZQFSlGgnTSD
         NNOITLN1d0FOChAcfcLrlqSU8WaQrqOyEq5PkZOIt9GVsWLG1wYUndqKPRPCJCBZP1tJ
         kP/f/fwvD+1vDsDMZuyBTErjuhyyGrctdLnGZCNaDIY+ytqb9yIIFDAvX/f+CrMKCgqS
         1u83zKZu5NLDeiWFzB+t5naAddJX37nm/9fQHzIsR1iC4p+7z3rH5b0lEyGZeyPye9yf
         opgmmNkSn0VWgP0mB275UWAdTBK3xG90hmF5/8NmmhdOQ7YwR2TAaYSd1UoPZEuFYhhI
         a40Q==
X-Forwarded-Encrypted: i=1; AJvYcCVX9Dx3xeHFAPF9SJMQ/mZffh6K1XsB5a0Lbxb26zM9+iQD/vs7wwJ8pv/1eCkMGLtX6UG2zQzXTzYkVnCC3PO6i2wDGxtw
X-Gm-Message-State: AOJu0Yx5FihpoJOjS/5ffeJUpCJr6/5sWU8oO9fzX8cAi3V+6lBJRkm7
	w+Bd6CA6FpHd0rvCPbTcyV7zVNlY7GelanhcfAgWuWnHFW2yzjQemrZObzq66ibupA==
X-Google-Smtp-Source: AGHT+IFeP2EmhMFD2HOBJ3b6ZBLM6/A+kopBfhoJ2HRfD/44Kv6a5uuKskDScPr0n9uZ7+UX02om3w==
X-Received: by 2002:a05:6000:10c:b0:34a:4b5b:a3d with SMTP id o12-20020a056000010c00b0034a4b5b0a3dmr2104134wrx.7.1713542393565;
        Fri, 19 Apr 2024 08:59:53 -0700 (PDT)
Return-Path: <jean-philippe@linaro.org>
Received: from localhost.localdomain ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id p13-20020adfe60d000000b00349b73143e7sm4793089wrm.75.2024.04.19.08.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 08:59:53 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: philmd@linaro.org,
	pbonzini@redhat.com,
	alex.bennee@linaro.org,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH v2 10/22] target/arm/kvm: Create scratch VM as Realm if necessary
Date: Fri, 19 Apr 2024 16:56:58 +0100
Message-ID: <20240419155709.318866-12-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240419155709.318866-2-jean-philippe@linaro.org>
References: <20240419155709.318866-2-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: PFmQ+7GU14LU

Some ID registers have a different value for a Realm VM, for example
ID_AA64DFR0_EL1 contains the number of breakpoints/watchpoints
implemented by RMM instead of the hardware.

Even though RMM is in charge of setting up most Realm registers, KVM
still provides GET_ONE_REG interface on a Realm VM to probe the VM's
capabilities.

KVM only reports the maximum IPA it supports, but RMM may support
smaller sizes. If the VM creation fails with the value returned by KVM,
then retry with the smaller working address. This needs a better
solution.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 target/arm/kvm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 3a2233ec73..6d368bf442 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -104,6 +104,7 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
 {
     int ret = 0, kvmfd = -1, vmfd = -1, cpufd = -1;
     int max_vm_pa_size;
+    int vm_type;
 
     kvmfd = qemu_open_old("/dev/kvm", O_RDWR);
     if (kvmfd < 0) {
@@ -113,8 +114,9 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
     if (max_vm_pa_size < 0) {
         max_vm_pa_size = 0;
     }
+    vm_type = kvm_arm_rme_vm_type(MACHINE(qdev_get_machine()));
     do {
-        vmfd = ioctl(kvmfd, KVM_CREATE_VM, max_vm_pa_size);
+        vmfd = ioctl(kvmfd, KVM_CREATE_VM, max_vm_pa_size | vm_type);
     } while (vmfd == -1 && errno == EINTR);
     if (vmfd < 0) {
         goto err;
-- 
2.44.0
