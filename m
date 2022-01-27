Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp4248061lfk;
        Thu, 27 Jan 2022 09:23:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw9QMzllsoJySRkF1z8CaWpNs9K3is4p+KNZ/sErEDEHAzvoyJKE6sSS3WzT9ww2BkYGR4H
X-Received: by 2002:a05:6e02:158a:: with SMTP id m10mr3293826ilu.59.1643304235567;
        Thu, 27 Jan 2022 09:23:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643304235; cv=none;
        d=google.com; s=arc-20160816;
        b=QoXmU95/97Za7g9ZPuBmzZPvR4SaDEyHyGAB2eOCriTPPRmmDtLJ7JBXdJRd4R289P
         gAB+SRGIZHsmvVbgb24l2Jvdxj+Z8rTYBdYUOJS5qOP5+UrMfSPIYY0j1DM20a42kKb4
         PQEk1ZFNYXOAmZWq1RvbXMGFrn877Sbwiyl7blL+07x4AYjiWyT1tE7zYedsYNSo6PxX
         y2rw6GCM+X5DyG4JHBdeFwFduQmz0z1/E3dzfJRz3Bt2xaxOHVqM0AgCdyFccCGhQF7R
         IKi5INWQuIS8MIFOKGlGwiwOJ4e6kA97HLEDc604JSjh+4pAIyuW0aHHSq9prvfsDYBb
         9YMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=UTmaOnPlnPo5RWfu20ZKGcE5TEJnVANPMo+LxFYK5oU=;
        b=jH+4x+saqxWcJ+DVUelSZ0xt18PGZClg0lhjlP7fIydXvDvQqgBH0GndrJcj/uOVip
         hdHlyka1OfpN3bHl1ePUoZsyesO7NpzcIIa1fw5t90EFcOUas1r0xXfqitiaAPj0Yvvr
         X9T6rGwnMBhrcQIEQbRFsiWDom7yI7qGKQvTciFfJx/A0ahCDMWPUfgHWCet6eW2phUz
         J57lyOlv7Xr7NNNU4Cj1ONe+klAlCQy/hoKd3Zo9fllzvrfaWoLHFGEAQppVhLnP0k2R
         zORVoKP38aBj6F1HM243KQCm0lBaYHNHjGdi9HILfmWFEo+cmQmaECfx5lWOswKjsbyI
         jigA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="bPeg/HCv";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f5si1798299iol.29.2022.01.27.09.23.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Jan 2022 09:23:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="bPeg/HCv";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nD8V0-0005v4-TQ
	for alex.bennee@linaro.org; Thu, 27 Jan 2022 12:23:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nD6zU-0006qe-Jz
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:47:16 -0500
Received: from [2a00:1450:4864:20::32a] (port=43804
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nD6zQ-0008Ov-Ud
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:47:16 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 r2-20020a1c2b02000000b0034f7b261169so2154806wmr.2
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 07:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UTmaOnPlnPo5RWfu20ZKGcE5TEJnVANPMo+LxFYK5oU=;
 b=bPeg/HCvcVPeMYp3+ZtqeGiOCSj01rEpUK8y7awyBEwtEfPASPKIl32MOEt2dxmQvF
 xIAa0vWQVM5Wgf4Hy+TG5iLX0EIpWuKhPmiFRCD7iMQ4q9ipqqHq6PN1zgJEF9hJUiYq
 4wAxR5QfEvyGkzhUIMtOqhwPzdbFRK3jBfuzGyiKvRVwxvnL0NkPHySp9NmO+AGrSd7q
 LTybbe87zroAnxFPRIunrbpqkJ28uX3QGfMcOvawT8/7fxUxfvfTXXMSDrIi7P8yQs/L
 Gt/SctidcegoqnvkcqNwpptOyH+QTlaP9J2d+Bpat6GDIlJwLqerVxyvTjSsZw1I59Gv
 34AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UTmaOnPlnPo5RWfu20ZKGcE5TEJnVANPMo+LxFYK5oU=;
 b=l9cp9i5fbT2A+eVvB9ZFmA9pJg2rGimnB0ZEWBYWbhheh+PApoujBQIjt38Y1B3IsC
 1q6cKVGR539ibE7p4dDv7mpv3AHbl3KPGxklaei2jNRpTdHI45+9kDnjI3yQoxnNwmBD
 sA7na6dZFPB8bXBZfkFqrss8OSxapgQWwkEf0p/lNW0tdV6kO3vIo/xwbuk+jaMk3iiw
 f88BPd/DWQWXukq5TFpp7lcXVad8JoDKxdcswHDLzi0ef9RMZjvlobXibGJBslQgQP8K
 omkXy3jYuf76qL30gGM19sh0dS3Xx6fBsC4ZgGbzS73svYHw2+oETmuCjWCkQmIdkYop
 rtFg==
X-Gm-Message-State: AOAM532nhWMgFA1NMPrCDUAjcc63agy5wzODUdvNLVXXs8BrID9lD3ox
 qEHyNkRmul7Zp1R+Qn6/Hix6RA==
X-Received: by 2002:a1c:440a:: with SMTP id r10mr3830021wma.142.1643298427499; 
 Thu, 27 Jan 2022 07:47:07 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id w9sm6687667wmc.36.2022.01.27.07.47.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 07:47:07 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 13/16] hw/arm/boot: Don't write secondary boot stub if using
 PSCI
Date: Thu, 27 Jan 2022 15:46:36 +0000
Message-Id: <20220127154639.2090164-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220127154639.2090164-1-peter.maydell@linaro.org>
References: <20220127154639.2090164-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Rob Herring <robh@kernel.org>,
 Andrew Jeffery <andrew@aj.id.au>, Andre Przywara <andre.przywara@arm.com>,
 Tyrone Ting <kfting@nuvoton.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Yanan Wang <wangyanan55@huawei.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, Alexander Graf <agraf@csgraf.de>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BhORzNd1T1bZ

If we're using PSCI emulation to start secondary CPUs, there is no
point in writing the "secondary boot" stub code, because it will
never be used -- secondary CPUs start powered-off, and when powered
on are set to begin execution at the address specified by the guest's
power-on PSCI call, not at the stub.

Move the call to the hook that writes the secondary boot stub code so
that we can do it only if we're starting a Linux kernel and not using
PSCI.

(None of the users of the hook care about the ordering of its call
relative to anything else: they only use it to write a rom blob to
guest memory.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/boot.h |  3 +++
 hw/arm/boot.c         | 35 ++++++++++++++++++++++++-----------
 2 files changed, 27 insertions(+), 11 deletions(-)

diff --git a/include/hw/arm/boot.h b/include/hw/arm/boot.h
index 0bcb58babba..0cfc1c95c4e 100644
--- a/include/hw/arm/boot.h
+++ b/include/hw/arm/boot.h
@@ -70,6 +70,9 @@ struct arm_boot_info {
      * boot loader/boot ROM code, and secondary_cpu_reset_hook() should
      * perform any necessary CPU reset handling and set the PC for the
      * secondary CPUs to point at this boot blob.
+     *
+     * These hooks won't be called if secondary CPUs are booting via
+     * emulated PSCI (see psci_conduit below).
      */
     void (*write_secondary_boot)(ARMCPU *cpu,
                                  const struct arm_boot_info *info);
diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 0424c178305..184628ce564 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -804,7 +804,7 @@ static void do_cpu_reset(void *opaque)
                         set_kernel_args(info, as);
                     }
                 }
-            } else {
+            } else if (info->secondary_cpu_reset_hook) {
                 info->secondary_cpu_reset_hook(cpu, info);
             }
         }
@@ -1030,13 +1030,6 @@ static void arm_setup_direct_kernel_boot(ARMCPU *cpu,
         elf_machine = EM_ARM;
     }
 
-    if (!info->secondary_cpu_reset_hook) {
-        info->secondary_cpu_reset_hook = default_reset_secondary;
-    }
-    if (!info->write_secondary_boot) {
-        info->write_secondary_boot = default_write_secondary;
-    }
-
     if (info->nb_cpus == 0)
         info->nb_cpus = 1;
 
@@ -1216,9 +1209,6 @@ static void arm_setup_direct_kernel_boot(ARMCPU *cpu,
         write_bootloader("bootloader", info->loader_start,
                          primary_loader, fixupcontext, as);
 
-        if (info->nb_cpus > 1) {
-            info->write_secondary_boot(cpu, info);
-        }
         if (info->write_board_setup) {
             info->write_board_setup(cpu, info);
         }
@@ -1385,6 +1375,29 @@ void arm_load_kernel(ARMCPU *cpu, MachineState *ms, struct arm_boot_info *info)
         }
     }
 
+    if (info->psci_conduit == QEMU_PSCI_CONDUIT_DISABLED &&
+        info->is_linux && info->nb_cpus > 1) {
+        /*
+         * We're booting Linux but not using PSCI, so for SMP we need
+         * to write a custom secondary CPU boot loader stub, and arrange
+         * for the secondary CPU reset to make the accompanying initialization.
+         */
+        if (!info->secondary_cpu_reset_hook) {
+            info->secondary_cpu_reset_hook = default_reset_secondary;
+        }
+        if (!info->write_secondary_boot) {
+            info->write_secondary_boot = default_write_secondary;
+        }
+        info->write_secondary_boot(cpu, info);
+    } else {
+        /*
+         * No secondary boot stub; don't use the reset hook that would
+         * have set the CPU up to call it
+         */
+        info->write_secondary_boot = NULL;
+        info->secondary_cpu_reset_hook = NULL;
+    }
+
     /*
      * arm_load_dtb() may add a PSCI node so it must be called after we have
      * decided whether to enable PSCI and set the psci-conduit CPU properties.
-- 
2.25.1

