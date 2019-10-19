Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp2724032wrm;
        Sat, 19 Oct 2019 16:58:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx8SzAzYtXAlmnrY9SISci5D8Jttj8xr415XM5xZL0KoHDL+NYwK5d53L85dT/rPVZFA6Bx
X-Received: by 2002:aed:3c67:: with SMTP id u36mr17476245qte.142.1571529536658;
        Sat, 19 Oct 2019 16:58:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571529536; cv=none;
        d=google.com; s=arc-20160816;
        b=LE/FpDnQoX5+eaP8I6Ew1fW0y9kAgiFXYxQ31HSBm82c0VEuHVeSPViOCIqaQzVGYw
         WGNNzx9Ntf+D5iTAvpVYLMCCiZodvqgL9xTaXZs6N/b08eeWd2w3RQaGGbgWLkjotJVm
         yMn7PaL67lumNRH6x9G50QuhiF4/8LVaVc5lv8CM1qrhnA4y1idB3zhFADRvbblJy9QZ
         4xz0qDcymtu/2074h4CuTKK6WcTlUAVQu0uwY0Hb1Ly20/aBgasuj7Sz2rSUAn03dGyF
         T0DxKLWv4OLI7aYcqT5biEgiQ4s3Ktnt1kUiNFctuHZ86eZ1kdq7Sbxui81s3F7ow7C9
         mDfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=O5oiXx5QsqcxjGrnz0sfvOqjkOSxCB/5RAZrFYtWlbA=;
        b=t8yEYfnHVLaViy7mPd8GdmETUYyrwsygcbCQznwyH0I2HY7am/kkT68jRttsD7zfRd
         TT4fWIrli6fudC2ZDCgnmKKeCdWmZxVkvy3ERKPlQmLCU0ltxA+4AoJW4oKLFrM3EQDP
         u8ZkKr4cb/8rr4dwCxryJOr+6P57p1SZyluayemrBb9AlxGgJ20vfE1d6vXBho3iE3ZT
         XItXXNfUv7PaxnQEVVMty7C4ADvw5vz64qM2IEWUfsUznsu+df5iN43aKHvhQftr49Bz
         zLkxHDhCQzSQt6L5Mp6wnbkXAxkcT2anyWe3Q94lfuuOCrWupcO60YZw+4Y3vrweQnxt
         +bPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hSEyfflr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d9si9946663qka.189.2019.10.19.16.58.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 19 Oct 2019 16:58:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hSEyfflr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLycZ-0006Kp-Pn
	for alex.bennee@linaro.org; Sat, 19 Oct 2019 19:58:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34670)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iLyRh-0000SH-6L
 for qemu-devel@nongnu.org; Sat, 19 Oct 2019 19:47:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iLyRg-0005f1-1T
 for qemu-devel@nongnu.org; Sat, 19 Oct 2019 19:47:41 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:53231)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iLyRf-0005ef-PY; Sat, 19 Oct 2019 19:47:39 -0400
Received: by mail-wm1-x343.google.com with SMTP id r19so9572273wmh.2;
 Sat, 19 Oct 2019 16:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O5oiXx5QsqcxjGrnz0sfvOqjkOSxCB/5RAZrFYtWlbA=;
 b=hSEyfflrQ3eukOQaelqiuw7eyOdcySc7vTMK2pnmAvEE7J1zsr9JlhoMrJoMDunNbM
 5GDZNNr15LpFVXKt+vJJDjWu7wT42+PZJqSyeoBPEdsAgTEUQRUrUOi/3EXNgwdO5Jcb
 w40OPmiaSfd7NJrYoxTbfBvk48iL/mU5Q9+qeOCGjskdY7fxmPCfMsTANaPmoLbFW5Xh
 xonxBvtxotLD5L/CXpfgQ/nlNUpt927sZFnnykOTAn3/1Owpf8rbWwiXbkXqq/cEl41H
 3M8ZEAQAZcxouQfiS7S3zox0l7m/rUQUZFkts13pOI37QJvOYVx8X1JbFHkuiFET875N
 /aCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=O5oiXx5QsqcxjGrnz0sfvOqjkOSxCB/5RAZrFYtWlbA=;
 b=D94CEFB/WuzNm2mP3dW2RniE5O1GPNQlNfn7BxjdmS6BnH8l28ZEizpW+b7waOrsk5
 btfOsHNAKT6iNoF85w6/8wyg29e/ShAjuZjgYTjTxWy0JJrlPFSfHxP7AOCqveEYWKT9
 cP7AgbNwB4thG/EKHt2pGvntJ/fbnEmPwbhwC9TI9jRuEzZNbqWIoKgN6x9UTOAcLinW
 BtTWrquKedwyYkvEteiCLRyI5ke3M+m3ZtJpC7QbaN4emnX4xZZbUdPKf1/V1L9LaL8S
 +dAFJIniNs7avhuA0MvuVn72H/S1Q3seAapiENBoF7FEmtQY2nHknpBgHsNPqS+FKMSg
 5s1g==
X-Gm-Message-State: APjAAAVSkTeQE37C4ZfdAf+ZLU/5+Vfi63M1zfwvx/L3Nyjak9uwjsQ1
 7qnK7UE+VQT0voMysAPMPbtry0M0
X-Received: by 2002:a05:600c:2908:: with SMTP id
 i8mr12735560wmd.20.1571528858686; 
 Sat, 19 Oct 2019 16:47:38 -0700 (PDT)
Received: from x1w.redhat.com (14.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.14])
 by smtp.gmail.com with ESMTPSA id u1sm10433763wrp.56.2019.10.19.16.47.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Oct 2019 16:47:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 12/16] hw/arm/bcm2836: Rename enabled_cpus -> enabled_cores
Date: Sun, 20 Oct 2019 01:47:11 +0200
Message-Id: <20191019234715.25750-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191019234715.25750-1-f4bug@amsat.org>
References: <20191019234715.25750-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Matthias Brugger <mbrugger@suse.com>, Rob Herring <robh@kernel.org>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Esteban Bosse <estebanbosse@gmail.com>, "Emilio G . Cota" <cota@braap.org>,
 Clement Deschamps <clement.deschamps@antfield.fr>, qemu-arm@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Laurent Bonnans <laurent.bonnans@here.com>,
 Cheng Xiang <ext-cheng.xiang@here.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Pekka Enberg <penberg@iki.fi>, Pete Batard <pete@akeo.ie>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: V59f4cAp85xJ

We now use -smp cores=<n> to limit the number of cores powered
on reset. Rename the 'enabled_cpus' variable as 'enabled_cores'
to better match the new use. No functional changes.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/bcm2836.c         | 4 ++--
 hw/arm/raspi.c           | 2 +-
 include/hw/arm/bcm2836.h | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
index ada35e5620..e3cef69687 100644
--- a/hw/arm/bcm2836.c
+++ b/hw/arm/bcm2836.c
@@ -202,7 +202,7 @@ static void bcm2836_realize(DeviceState *dev, Error **errp)
         }
 
         /* start powered off if not enabled */
-        object_property_set_bool(OBJECT(&s->cpu[n].core), n >= s->enabled_cpus,
+        object_property_set_bool(OBJECT(&s->cpu[n].core), n >= s->enabled_cores,
                                  "start-powered-off", &err);
         if (err) {
             error_propagate(errp, err);
@@ -235,7 +235,7 @@ static void bcm2836_realize(DeviceState *dev, Error **errp)
 }
 
 static Property bcm2836_props[] = {
-    DEFINE_PROP_UINT32("enabled-cpus", BCM283XState, enabled_cpus,
+    DEFINE_PROP_UINT32("enabled-cores", BCM283XState, enabled_cores,
                        BCM283X_NCPUS),
     DEFINE_PROP_END_OF_LIST()
 };
diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 45d3f91f95..b1b488ca53 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -191,7 +191,7 @@ static void raspi_init(MachineState *machine, int version)
     object_property_add_const_link(OBJECT(&s->soc), "ram", OBJECT(&s->ram),
                                    &error_abort);
     object_property_set_int(OBJECT(&s->soc), machine->smp.cores,
-                            "enabled-cpus", &error_abort);
+                            "enabled-cores", &error_abort);
     int board_rev = version == 3 ? 0xa02082 : 0xa21041;
     object_property_set_int(OBJECT(&s->soc), board_rev, "board-rev",
                             &error_abort);
diff --git a/include/hw/arm/bcm2836.h b/include/hw/arm/bcm2836.h
index 787ab76738..2c3f1e6c6a 100644
--- a/include/hw/arm/bcm2836.h
+++ b/include/hw/arm/bcm2836.h
@@ -33,7 +33,7 @@ typedef struct BCM283XState {
     /*< public >*/
 
     char *cpu_type;
-    uint32_t enabled_cpus;
+    uint32_t enabled_cores;
 
     struct {
         MemoryRegion bus;
-- 
2.21.0

