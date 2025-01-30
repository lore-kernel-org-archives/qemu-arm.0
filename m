Received: by 2002:a17:504:3e04:b0:1be9:327d:8ee3 with SMTP id i4csp220300njl;
        Thu, 30 Jan 2025 03:27:19 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXYxbNEG/mXurOzSPagdDV572zoD7wK3pRATGIIG6d/0+iLtonWzKQRi835mztYhuaB+MovfXMXyAQ77w==@linaro.org
X-Google-Smtp-Source: AGHT+IEAe09ae2q1QWx4SWsgbHXApGgef00+ViVhsFvsyRJDB75SAEKBou7r4Duun5mkiFRDOuWt
X-Received: by 2002:a05:620a:8082:b0:7b6:cb81:95d with SMTP id af79cd13be357-7bffcce5723mr1110072385a.21.1738236439407;
        Thu, 30 Jan 2025 03:27:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738236439; cv=none;
        d=google.com; s=arc-20240605;
        b=G2oFWunst45NNOEOPveOAVxtaJGc6OhRhSbU8B9gF/rIsVY0RTrIWOTGrmrkJC6crl
         5OvW9siBNEz9NMINZPp4Jxrh4dTItfPLWYXbFhun7hOA2VPEYRvWnr7fhxENSut/lC9A
         dDijjjX38Lo/VEyo+AJSCVNyMwZ9nsNjUWZ70LcmhEhCa5oETveHl3hf7XdvksntOA+r
         WMCxyYaxwqJOTbBuHkXVSG5VufwXnpbOUBcGSIQ46qvN8cyXwXnw8hTTXLyQDvPETc8Y
         SbK94Fu46jD93TeEHSdZrnsdXYqTKA2b83fMFIHA5YP9IQzM3G1iWIfri5i/iyM0k2md
         FE3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=z5yokpfogWCNLT5AOLz5ISF3vcjRzUCib53Za1mgnlY=;
        fh=wXYnM2Xe6CLi/jjNhqKsBwYc7XquNHKu73845APGzhA=;
        b=N4xU6+eVsLyhpV1MVenTk6Qg7dj49hg5pDTAJ2fpxjiWjwh7xCEiaxCc2xDuDeWtm0
         qG5RzAus7CNUGzTW8AHs12IqXhPDqiAy13YLaJrlFfzFO+KQKD81h5wh6ksIa1AmW7j1
         ZZmSSzn3gtC2UcEFajAFVmUwgtSDi1qN0QNq5w/+FdKL23rVLW73WuV3gTohqMOsu5lx
         JngFLHyt6e7WQOdgGQ4dunW11tcMV7RVFEw6DYWqyXpJNxMGLzD3HYS8bOsfbdK41FbE
         X0zOSEQsa/EVCN/Y8+PZEcGDNcNxe42O0/uRbxaLqGfrf4UU9TCEYTjuIPRv95OJ3pl8
         RwoQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cGWlKHnw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c00a8c0cc7si167087885a.96.2025.01.30.03.27.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jan 2025 03:27:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cGWlKHnw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tdSgv-0001Uw-AC; Thu, 30 Jan 2025 06:26:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tdSgl-0001Rp-6B
 for qemu-devel@nongnu.org; Thu, 30 Jan 2025 06:26:29 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tdSgi-0001hI-NW
 for qemu-devel@nongnu.org; Thu, 30 Jan 2025 06:26:26 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4364a37a1d7so6590775e9.3
 for <qemu-devel@nongnu.org>; Thu, 30 Jan 2025 03:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738236383; x=1738841183; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z5yokpfogWCNLT5AOLz5ISF3vcjRzUCib53Za1mgnlY=;
 b=cGWlKHnwNEAH2kfWS1T5OsRzsNwvuTDioGWcntMtvfD077c75bFyyJH43tTBlo5Hf8
 TP2xxS0yGFIZ+mDvCyHnmejZq7zp6wNkvIvO49rpvLMcbJww/5T/N2uDf6VqOj8BSuBa
 4dhsKp3ZKlLUKKvq+Ken440r0ZMjF35Cdne7lx7gqebasF3KojsUIykOS3bLSlmKq4d5
 cz/U4NTjHgm8t3H/YF2qu9pzhOO5RhjxSJPhYYxHNRPwu2pWNo1v7cDxz0/oFTYuu/1T
 Aom8sQFr05ICXO4doEGs7K8C7lh1eXUErWreJxXwbFpuzS4PK/NW7to3iJhY6hZr8HoI
 Wk0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738236383; x=1738841183;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z5yokpfogWCNLT5AOLz5ISF3vcjRzUCib53Za1mgnlY=;
 b=A3jsFBgrJx6+kT8Kz4kd6nOaTcbEezPdiGikcvx5VpwwKRjhGX9H0RbHJrnXjSDFMf
 oSpvS5awrzvCq6aae4IysA3C2IchbNIZrNhBZJ21TKCL6WT+8gePXZrcIK0Dsjlk2s3G
 JAX2mMDRcJ5lDZh7tc5M9BMpk5tSZ5RYP51RtTsLqod8nh+T1+vTvFKs7rYDg5XE7vj9
 enpb/k4waxrErJw+OXBW3ANuBQ0KE7tEGVu4nhvTvb4MCd5fYPoomOm8cXaubcGVxlw+
 yZCtmZ7DPTRBprL4EY4vLCIxmXshdkFhPMtNR/sIB9jSX4I4lRYxzVfHNOdo92D1PxCC
 5Weg==
X-Gm-Message-State: AOJu0YyrOPgWG+iFDpB6fsJ1C4hUveSVUtiKMOQ4vHgYmlg0WHMgc7hs
 sG5rcIpGN7RnWQuq1oLUVSjtW3e1rSJByNcNQaG93FD0oTLuISxm+fh9orH2dls1rPpxMpAMU+5
 0Rv8=
X-Gm-Gg: ASbGnct/36HaFqoIfZxOClgESoZFhXvdPod0Bqf6cXP5I9RM3uUCrwfsZ+n63PNRSVl
 13TGstEBbnDMXCd2NTK/JJ7yjCSZHIBMH2cWtpPmUXVvhfo0y/zGRQEB7ym2AcM3AUBTyc8ZZOB
 9J7Rth+p0c/qGPd/VWtcxA1+7eEJMhhPo1YzoWwKkokstLo/Krcj7McnPY9Zy04U+TL+sCGwESu
 Pw/sk2tY5dS59ZLkJVKgiuU5PfSVgZL4fNFja7upVh7zE0g1otqeOMmGK7iSgFZesvULHcI1P1t
 bQKQGI8vkkjbkBT9i+txkOLfsUR9VBtOlFbdSNCxwAZZ+vfPZXVrQUYtOHMR7T3JkA==
X-Received: by 2002:a05:6000:1843:b0:38c:5d42:152b with SMTP id
 ffacd0b85a97d-38c5d421959mr1264573f8f.54.1738236382768; 
 Thu, 30 Jan 2025 03:26:22 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c1b576csm1722401f8f.63.2025.01.30.03.26.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 30 Jan 2025 03:26:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v2 1/6] hw/arm/boot: Propagate vCPU to arm_load_dtb()
Date: Thu, 30 Jan 2025 12:26:10 +0100
Message-ID: <20250130112615.3219-2-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250130112615.3219-1-philmd@linaro.org>
References: <20250130112615.3219-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Mdg/Ev2lDsLi

In heterogeneous setup the first vCPU might not be
the one expected, better pass it explicitly.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/arm/boot.h |  4 +++-
 hw/arm/boot.c         | 11 ++++++-----
 hw/arm/virt.c         |  2 +-
 3 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/include/hw/arm/boot.h b/include/hw/arm/boot.h
index 80c492d7421..b12bf61ca81 100644
--- a/include/hw/arm/boot.h
+++ b/include/hw/arm/boot.h
@@ -160,6 +160,7 @@ AddressSpace *arm_boot_address_space(ARMCPU *cpu,
  * @binfo:      struct describing the boot environment
  * @addr_limit: upper limit of the available memory area at @addr
  * @as:         address space to load image to
+ * @cpu:        ARM CPU object
  *
  * Load a device tree supplied by the machine or by the user  with the
  * '-dtb' command line option, and put it at offset @addr in target
@@ -176,7 +177,8 @@ AddressSpace *arm_boot_address_space(ARMCPU *cpu,
  * Note: Must not be called unless have_dtb(binfo) is true.
  */
 int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
-                 hwaddr addr_limit, AddressSpace *as, MachineState *ms);
+                 hwaddr addr_limit, AddressSpace *as, MachineState *ms,
+                 ARMCPU *cpu);
 
 /* Write a secure board setup routine with a dummy handler for SMCs */
 void arm_write_secure_board_setup_dummy_smc(ARMCPU *cpu,
diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index b44bea8a821..c88664141c2 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -432,13 +432,12 @@ out:
     return ret;
 }
 
-static void fdt_add_psci_node(void *fdt)
+static void fdt_add_psci_node(void *fdt, ARMCPU *armcpu)
 {
     uint32_t cpu_suspend_fn;
     uint32_t cpu_off_fn;
     uint32_t cpu_on_fn;
     uint32_t migrate_fn;
-    ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(0));
     const char *psci_method;
     int64_t psci_conduit;
     int rc;
@@ -512,7 +511,8 @@ static void fdt_add_psci_node(void *fdt)
 }
 
 int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
-                 hwaddr addr_limit, AddressSpace *as, MachineState *ms)
+                 hwaddr addr_limit, AddressSpace *as, MachineState *ms,
+                 ARMCPU *cpu)
 {
     void *fdt = NULL;
     int size, rc, n = 0;
@@ -655,7 +655,7 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
         }
     }
 
-    fdt_add_psci_node(fdt);
+    fdt_add_psci_node(fdt, cpu);
 
     if (binfo->modify_dtb) {
         binfo->modify_dtb(binfo, fdt);
@@ -1327,7 +1327,8 @@ void arm_load_kernel(ARMCPU *cpu, MachineState *ms, struct arm_boot_info *info)
      * decided whether to enable PSCI and set the psci-conduit CPU properties.
      */
     if (!info->skip_dtb_autoload && have_dtb(info)) {
-        if (arm_load_dtb(info->dtb_start, info, info->dtb_limit, as, ms) < 0) {
+        if (arm_load_dtb(info->dtb_start, info, info->dtb_limit,
+                         as, ms, cpu) < 0) {
             exit(1);
         }
     }
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 99e0a68b6c5..d23b14718af 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1746,7 +1746,7 @@ void virt_machine_done(Notifier *notifier, void *data)
                                        vms->memmap[VIRT_PLATFORM_BUS].size,
                                        vms->irqmap[VIRT_PLATFORM_BUS]);
     }
-    if (arm_load_dtb(info->dtb_start, info, info->dtb_limit, as, ms) < 0) {
+    if (arm_load_dtb(info->dtb_start, info, info->dtb_limit, as, ms, cpu) < 0) {
         exit(1);
     }
 
-- 
2.47.1

