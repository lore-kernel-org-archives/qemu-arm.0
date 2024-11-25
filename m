Received: by 2002:a17:505:4c56:b0:1be9:327d:8ee3 with SMTP id do22csp1569376njc;
        Mon, 25 Nov 2024 11:59:38 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWCeG8m9ycSCciGvyDGKb05BrrJMBrg9IAE+KRGtmxKxkNS4hSVlKSORTEBF/l36ozaavKyUZHW2r9OVg==@linaro.org
X-Received: by 2002:a5d:5f55:0:b0:382:47d0:64be with SMTP id ffacd0b85a97d-38260b8059cmr10314563f8f.29.1732564777796;
        Mon, 25 Nov 2024 11:59:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732564777; cv=none;
        d=google.com; s=arc-20240605;
        b=SvyPACQk2iWE5Gh/7G+n1jojhu/auJlYINxYtCs9xQHn0Hw5AIV5gsgqkj/sCtuFbE
         s6LJVn3Dh3hm0CEfaueInAZNd+OHzhfgsA/hWx3fO/rDKBI9GGd29RedAHCoVR6tkrC0
         EA4pyDOBpdjoZA5h1SkGNkE8NwjrVbp26YxOAvH48rTHx2UtUAq4Fv9baeVXuaU7KlMp
         5n52YV/3sRab4dxJVGHUHAQkXTPwvbHG0gSh4fXmPqnCtxKROMLNi+U7itz5nFgo7mwR
         VrbA4+sjw4mr/u0W/Vdx5fhjE9x7fDdLgfHdcW/esTMQ1d82TNF0g0qZAFgOp8NFDj77
         cvAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=0X0EuUhZkl3V6dkF5yC+rBGIPkT3Qq6H9A8p4Nm7TQw=;
        fh=oN0DKx5vcu+CZcEMZ64h0GO/FbEsEFteFuDYyss7VOs=;
        b=akMBcon/L1ejjL0FO1FbW0O/kjH/KHIVhRUJgtTw11G6n40+8t/9LQWtm3HBCzn2of
         f29LD6wAuaUFzBuWntPsfwL8VGJakXw7vNot7HjBg2gGShyaCyc7KbShAxo295e1rBkN
         uHL23UIqXweD3LX5VSmCSkC8Yd2sXrAMnmG1oEmuoagyGyvVlFi/qBFhU58rHjA0SfVf
         i4qHkTGDixCafFW0H9D1H4FYSLu1HWhZcmPuHmH/OO1Dm4YYL+qmjc2OIXgOHgzaSsYM
         iXgKtdD/hNCYAFQV4yb4hNAOvcV1DpyrygHc7FU5poK0VYMbENMZUpaQh/rg4BfMMuEe
         bxjw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cOMhOgJ7;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3839ac1a419sor2810854f8f.9.2024.11.25.11.59.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 25 Nov 2024 11:59:37 -0800 (PST)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cOMhOgJ7;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732564777; x=1733169577; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0X0EuUhZkl3V6dkF5yC+rBGIPkT3Qq6H9A8p4Nm7TQw=;
        b=cOMhOgJ7SM0QNZ7vyaK8AlY2hHR8e4YdWDrivonQh9YZrzKfwgVNgG0T55zjMmd0lQ
         q8OYXeyDMo71BHHjJgp4uGBYB6RQhXh2D/EIrHmg8mTZJBnSM2ssnsnTAdchpywsqF1K
         ZwlBlfJLvjE++1skoWV8hXWxXf+uxAf4OxY59qLAiBXl3DPoKeEKxZPpKpd1YEBFXM+r
         WTqDyMSZ0lKb+90p4HoQGpSVrVjWMg4LyPJe5yDYfUPCXcGIea1st8BjXj06ubLA1O75
         q9DHubBzrndWZfJ1d3q0hY/yyZ/KrjNUDDwH5SQHgY/Fk5XnNPXJgYKhrwueazJ60LEh
         guCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732564777; x=1733169577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0X0EuUhZkl3V6dkF5yC+rBGIPkT3Qq6H9A8p4Nm7TQw=;
        b=LDfyuVir9DWTPbL12P+hghI1yWtal9khE79KYJTWTkv9CvSb1tI0BAR7xzVLhVA3kd
         FzWmqE/bQo9hVbIA04ak5NDIGqT/SPN0bkC/7VBOZvogfeFCBjG1GgEaaEjqoV4GaEtJ
         UMeGDyczH9rIo/zbWUh2bkhbq2KIzPCTqHujCGCaD7s6tMySIo6aig730nmDzFIe5vT7
         bwnBxFUZfqV6brw5Jww9GVk3Dt0Cviz2yZW/YbsHbDm8Wh6p+tF7jhTWIlBWHl2ABf2C
         e20p7eDKDaBlr7j9D34mBA/gpxZ5Pl+tpqMxg4wNGVcH0mQw4jw+aLX+bfgJmgU7odv3
         IavA==
X-Forwarded-Encrypted: i=1; AJvYcCVNxXHeWltVBqCjMx0RdPBgnhHQHAI+ilNj3IbVTy6G+nOdT4cmKRsmfKiV831Bqsa2heM5vzuSsb6HTA==@linaro.org
X-Gm-Message-State: AOJu0YxdZHoDXlW5rrLy2cRb6QSJE4zwtq320d1Q7Bd31SgdMQN/J0Ar
	ph7DBXlglDmprA/fFsKThOpnHe/inP0HEREkP8vFprmnez1V77ifE+rAjP0g3+SV4luvJ9ee7tU
	qmnk=
X-Gm-Gg: ASbGncvYQy+3OKrbdA2hUaQgv1FBpsSDlRzBtWRNeUFUKFP9hWy8qnWaJgoRY+o/dUu
	yEA+i75f//pWfUKWaCzokAIE5SPe1NPlzjgtGWkrMZMPHFrlReYjXn0sjudhBOvUMnMvF920b/w
	jaRCuOg5e7+HqvAaUEUID9XHXQ8WxNlq+5rhAgkiBqkWAG7btxwjsFywKEhOKuh3Seg7UluVlao
	u1rcrJv3xUNdqDsQqQ4DPyYiJ5WmjzBLJyInwrTz+QecMX0kZX8pkKhPRFsaH83SkRF
X-Google-Smtp-Source: AGHT+IFSmpP21tnbsCvXgk64PcQ1IqbTren1CzqreRLS7x4zvWdbhUeeP02hsbF6jzpxXIfyBKQGpQ==
X-Received: by 2002:a5d:6d0b:0:b0:385:bd85:5a32 with SMTP id ffacd0b85a97d-385bd855a91mr2115120f8f.15.1732564777217;
        Mon, 25 Nov 2024 11:59:37 -0800 (PST)
Return-Path: <jean-philippe@linaro.org>
Received: from localhost.localdomain ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fd0fbdcsm11237971f8f.109.2024.11.25.11.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 11:59:36 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org,
	philmd@linaro.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	alex.bennee@linaro.org,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [RFC PATCH v3 22/26] hw/arm/boot: Skip bootloader for confidential guests
Date: Mon, 25 Nov 2024 19:56:21 +0000
Message-ID: <20241125195626.856992-24-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241125195626.856992-2-jean-philippe@linaro.org>
References: <20241125195626.856992-2-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: CneWpjm20dXi

An independent verifier needs to reconstruct the content of guest memory
in order to attest that it is running trusted code. To avoid having to
reconstruct the bootloader generated by QEMU, skip this step and jump
directly to the kernel, with the DTB address in x0 as specified by the
Linux boot protocol [1].

[1] https://docs.kernel.org/arch/arm64/booting.html

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
v2->v3: new
---
 include/hw/arm/boot.h |  6 ++++++
 hw/arm/boot.c         | 23 +++++++++++++++++------
 hw/arm/virt.c         |  1 +
 3 files changed, 24 insertions(+), 6 deletions(-)

diff --git a/include/hw/arm/boot.h b/include/hw/arm/boot.h
index d91cfc6942..5fcbaa2625 100644
--- a/include/hw/arm/boot.h
+++ b/include/hw/arm/boot.h
@@ -137,6 +137,12 @@ struct arm_boot_info {
 
     arm_endianness endianness;
 
+    /*
+     * Instead of starting in a small bootloader that jumps to the kernel,
+     * immediately start in the kernel.
+     */
+    bool skip_bootloader;
+
     /*
      * Confidential guest boot loads everything into RAM so it can be measured.
      */
diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 20b3071339..e461137595 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -762,7 +762,13 @@ static void do_cpu_reset(void *opaque)
             if (cs == first_cpu) {
                 AddressSpace *as = arm_boot_address_space(cpu, info);
 
-                cpu_set_pc(cs, info->loader_start);
+                if (info->skip_bootloader)  {
+                    assert(is_a64(env));
+                    env->xregs[0] = info->dtb_start;
+                    cpu_set_pc(cs, info->entry);
+                } else {
+                    cpu_set_pc(cs, info->loader_start);
+                }
 
                 if (!have_dtb(info)) {
                     if (old_param) {
@@ -860,7 +866,8 @@ static ssize_t arm_load_elf(struct arm_boot_info *info, uint64_t *pentry,
 }
 
 static uint64_t load_aarch64_image(const char *filename, hwaddr mem_base,
-                                   hwaddr *entry, AddressSpace *as)
+                                   hwaddr *entry, AddressSpace *as,
+                                   bool skip_bootloader)
 {
     hwaddr kernel_load_offset = KERNEL64_LOAD_ADDR;
     uint64_t kernel_size = 0;
@@ -912,7 +919,8 @@ static uint64_t load_aarch64_image(const char *filename, hwaddr mem_base,
              * bootloader, we can just load it starting at 2MB+offset rather
              * than 0MB + offset.
              */
-            if (kernel_load_offset < BOOTLOADER_MAX_SIZE) {
+            if (kernel_load_offset < BOOTLOADER_MAX_SIZE &&
+                !skip_bootloader) {
                 kernel_load_offset += 2 * MiB;
             }
         }
@@ -996,7 +1004,8 @@ static void arm_setup_direct_kernel_boot(ARMCPU *cpu,
     }
     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64) && kernel_size < 0) {
         kernel_size = load_aarch64_image(info->kernel_filename,
-                                         info->loader_start, &entry, as);
+                                         info->loader_start, &entry, as,
+                                         info->skip_bootloader);
         is_linux = 1;
         if (kernel_size >= 0) {
             image_low_addr = entry;
@@ -1136,8 +1145,10 @@ static void arm_setup_direct_kernel_boot(ARMCPU *cpu,
         fixupcontext[FIXUP_ENTRYPOINT_LO] = entry;
         fixupcontext[FIXUP_ENTRYPOINT_HI] = entry >> 32;
 
-        arm_write_bootloader("bootloader", as, info->loader_start,
-                             primary_loader, fixupcontext);
+        if (!info->skip_bootloader) {
+            arm_write_bootloader("bootloader", as, info->loader_start,
+                                 primary_loader, fixupcontext);
+        }
 
         if (info->write_board_setup) {
             info->write_board_setup(cpu, info);
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 0750c83fae..5247f53882 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2509,6 +2509,7 @@ static void machvirt_init(MachineState *machine)
     vms->bootinfo.firmware_max_size = vms->memmap[VIRT_FLASH].size;
     vms->bootinfo.psci_conduit = vms->psci_conduit;
     vms->bootinfo.confidential = virt_machine_is_confidential(vms);
+    vms->bootinfo.skip_bootloader = vms->bootinfo.confidential;
     arm_load_kernel(ARM_CPU(first_cpu), machine, &vms->bootinfo);
 
     vms->machine_done.notify = virt_machine_done;
-- 
2.47.0
