Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp1153580eja;
        Fri, 3 Nov 2023 08:22:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHB4B5aFnm2q3wN9sN+TKF2jleBlELxjS+FIhkXMVgkRmDtzguhM/HXRCsC5KJnw9J36d1k
X-Received: by 2002:a05:6214:529c:b0:66d:2af4:c423 with SMTP id kj28-20020a056214529c00b0066d2af4c423mr23924230qvb.2.1699024923135;
        Fri, 03 Nov 2023 08:22:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1699024923; cv=none;
        d=google.com; s=arc-20160816;
        b=QX77sWhDxA7Nc4g6rAb9CCm6L6WUCBgTXt1g7YqLahbk0foB+XzroT5H8HuFdkdtYD
         eHaSf39VMChsHKceO40DsrpGlN6IqmKWA0qDtvsW8/9ulSIBHQ42ZL4imrKVEbSLlj/9
         u2DZcehmklm3BDkv+W4atRPUgywsg5pc2E9nd9b7GNurEHwUe4f1j2n3qKrJ/HBHgpLG
         YVmeAOZdXbSPxD9+Lokf6m+mtk1A6Tid6Kz+PhRrCPiJpnfUeJkUe+oQ4wjefAmSufA4
         Q3z79wlSsa+Lp8W4vWT8Uv1WmTffWFomfCBGTzIq6QUyNfaIeE6hIIQRGRlt6Q6Apjim
         bZLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=oOUtQCOKfl8ZTA0KsgLPylscZ7jLKH8nCj7u4SLLwyQ=;
        fh=wqfvLaBYopGyGisjq/k8ulPaCl1xshcoDnGh5kvEEbE=;
        b=A12KJTy2GRzAUtI4Ve9wiiqyZ86pE+Gryrg7bJPcP3vY2XuP6wu3VsjTd/BpW2zsmd
         m95BdClI8+DjR1Hc4ESvZO5ca8mocb4fFizMa9m767F1/UykSUx5c+9eH8xIeM6We5NU
         ELpa6Y+RoC3jHS94BH/C22K5PKPEBu7Uxsrq7BnLZy/PKDFlUaaOPce5E+DQb6ayF1Ib
         SkegQORGjIuuhTs/9wncKbPJcMGA+uxzRwpwJp6MWiOT54S/c1xivUbPKfYJF/XAgIcV
         d4Zpmv7EiqrDjvnkcenEBiUbzFSd+4f6muqRSg87JEfkTUtetNEFEeyeX5Q05AaSlNi3
         VxWg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="bbkpLZ/y";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u4-20020a0cee84000000b0067540716895si1594903qvr.597.2023.11.03.08.22.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Nov 2023 08:22:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="bbkpLZ/y";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qyvzG-0004nV-4i; Fri, 03 Nov 2023 11:21:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qyvzE-0004mp-Fj
 for qemu-devel@nongnu.org; Fri, 03 Nov 2023 11:21:28 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qyvzC-0002nK-Jw
 for qemu-devel@nongnu.org; Fri, 03 Nov 2023 11:21:28 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40853c639abso16452865e9.0
 for <qemu-devel@nongnu.org>; Fri, 03 Nov 2023 08:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699024885; x=1699629685; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oOUtQCOKfl8ZTA0KsgLPylscZ7jLKH8nCj7u4SLLwyQ=;
 b=bbkpLZ/ywqNNhlrsozY+GUSYt6Ax5UTSdjcCcynki/prVk/rOeXLBsJLWa8/AgGCww
 uTArE1xWXVIzwGdZ0hXuyZm9I+frkSUSt2kBtGZZmoLKTlGRF32uzlunTS2mO5p2gwYa
 quGR3RnycPHfRNlNKe38Al+GOyHoAqwqyIrzAj03Cqdsh0cax5qM356saRJgK4eoK4B8
 KebwGtZRF49B1v2OPiv88QBEzCxwgDJkxm2UNNSJw+NMra5v08j7KO8wg+ScKSvYAmTx
 zQ5IhOMcNR7/u6XJuh9d5WUg9jrqjn+cK/iHXcA5bkYd0ftRSE7PxisfZCoenGXcf2Lf
 dcSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699024885; x=1699629685;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oOUtQCOKfl8ZTA0KsgLPylscZ7jLKH8nCj7u4SLLwyQ=;
 b=WRNPOetOg9EWwm+Eke3Jo3+vFCqyXfQriJIAC8I+m/aXhx6RHhjTOUx/atghHylPjQ
 BukF/1xyelwqQOSXx27L2hWtUX47JpdRHsaSpLDE/zado+ZaBRYxW/Z0GFcRYNDvThe4
 wGehTIwTf7Gzj2lnR6FeFIgjF283U2ktbHUGr/ItIFKe52J7wZ49m/27mKxWrzpwTIqx
 qw/nzylZ+ML/oWGVY09kaBTBp0+5Os+l2+q1ys4VhmKL6yCKH622HXnSYn4XKWtmVApc
 PGOualhT5Cr1vqC4pfoStSr1aHsdAz6rtz2Nko/ifhBePg/TDiH1RAOIR4FnPjGZzIPm
 CKNA==
X-Gm-Message-State: AOJu0YyT2/fs2bI+WFht/tAtWCwfC5HGljq9e5gw0VcmFuLlMlVWsIhz
 N4ExSVyyz+rRO2WOfSWIHQPGeue4SLRUmGmcQzk=
X-Received: by 2002:a05:600c:2206:b0:409:295:9c6e with SMTP id
 z6-20020a05600c220600b0040902959c6emr18097214wml.30.1699024884805; 
 Fri, 03 Nov 2023 08:21:24 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f16-20020a7bc8d0000000b0040684abb623sm2712165wml.24.2023.11.03.08.21.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Nov 2023 08:21:24 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Udo Steinberg <udo@hypervisor.org>
Subject: [PATCH v3 2/3] hw/arm/virt: Report correct register sizes in ACPI
 DBG2/SPCR tables.
Date: Fri,  3 Nov 2023 15:21:19 +0000
Message-Id: <20231103152120.829962-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231103152120.829962-1-peter.maydell@linaro.org>
References: <20231103152120.829962-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: vB/IVyMX3JZj

From: Udo Steinberg <udo@hypervisor.org>

Documentation for using the GAS in ACPI tables to report debug UART addresses at
https://learn.microsoft.com/en-us/windows-hardware/drivers/bringup/acpi-debug-port-table
states the following:

- The Register Bit Width field contains the register stride and must be a
  power of 2 that is at least as large as the access size.  On 32-bit
  platforms this value cannot exceed 32.  On 64-bit platforms this value
  cannot exceed 64.
- The Access Size field is used to determine whether byte, WORD, DWORD, or
  QWORD accesses are to be used.  QWORD accesses are only valid on 64-bit
  architectures.

Documentation for the ARM PL011 at
https://developer.arm.com/documentation/ddi0183/latest/
states that the registers are:

- spaced 4 bytes apart (see Table 3-2), so register stride must be 32.
- 16 bits in size in some cases (see individual registers), so access
  size must be at least 2.

Linux doesn't seem to care about this error in the table, but it does
affect at least the NOVA microhypervisor.

In theory we therefore have a choice between reporting the access
size as 2 (16 bit accesses) or 3 (32-bit accesses).  In practice,
Linux does not correctly handle the case where the table reports the
access size as 2: as of kernel commit 750b95887e5678, the code in
acpi_parse_spcr() tries to tell the serial driver to use 16 bit
accesses by passing "mmio16" in the option string, but the PL011
driver code in pl011_console_match() only recognizes "mmio" or
"mmio32". The result is that unless the user has enabled 'earlycon'

We therefore choose to report the access size as 32 bits; this works
for NOVA and also for Linux.  It is also what the UEFI firmware on a
Raspberry Pi 4 reports, so we're in line with existing real-world
practice.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1938
Signed-off-by: Udo Steinberg <udo@hypervisor.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
[PMM: minor commit message tweaks; use 32 bit accesses]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt-acpi-build.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 9ce136cd88c..8bc35a483c9 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -482,7 +482,7 @@ build_spcr(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     build_append_int_noprefix(table_data, 3, 1); /* ARM PL011 UART */
     build_append_int_noprefix(table_data, 0, 3); /* Reserved */
     /* Base Address */
-    build_append_gas(table_data, AML_AS_SYSTEM_MEMORY, 8, 0, 1,
+    build_append_gas(table_data, AML_AS_SYSTEM_MEMORY, 32, 0, 3,
                      vms->memmap[VIRT_UART].base);
     /* Interrupt Type */
     build_append_int_noprefix(table_data,
@@ -673,7 +673,7 @@ build_dbg2(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     build_append_int_noprefix(table_data, 34, 2);
 
     /* BaseAddressRegister[] */
-    build_append_gas(table_data, AML_AS_SYSTEM_MEMORY, 8, 0, 1,
+    build_append_gas(table_data, AML_AS_SYSTEM_MEMORY, 32, 0, 3,
                      vms->memmap[VIRT_UART].base);
 
     /* AddressSize[] */
-- 
2.34.1

