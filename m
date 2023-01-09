Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2192315ejc;
        Mon, 9 Jan 2023 04:04:38 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvpFATkTof+winNZ08QfM7kAvhFvIRukUxmWIyGytzM1m0wH65IQDTnZGC62LTvgo2wwLIV
X-Received: by 2002:ac8:7202:0:b0:3ac:3479:84 with SMTP id a2-20020ac87202000000b003ac34790084mr8388723qtp.40.1673265878245;
        Mon, 09 Jan 2023 04:04:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673265878; cv=none;
        d=google.com; s=arc-20160816;
        b=XMENATd146Ut9f5Ou03DBmRtMwA0PuzvHVq1AOB7JTZ1DHB4HKVS9pHRRZc/ZqY0va
         Pgc6pn9s/By9rXb02kgk+r+BIlGVA3KJN9EdZ3Ec+x1cvlBbGqjUjVV4Yw6Bnf3seDx4
         ZKzMW/okywMmAKCAvv4qgU64O4M7Rfe4LWmjuWmdLZkYv4exzClKEIXpRuOEOPGKitNA
         HRfj/Ci2q07OrgJcat56uMDX902yJViiGdAqiRnyCK8fN6xpFELWuhwDIpguvyRUMomg
         OD1X25EwgLK/rwAuJFh60abayqIz614U9WP9/vktkGzbNuoFAUyUA8LDa0/1jlrGaBk3
         gT0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=iQs1+OIM6FI+xXo1eNVCeEzgZwL+2/Sa1KGrztxPB6E=;
        b=wSLkLxZvxbrlWUXDtuCXrk0rjqRJrOdfSO9xyDYgqRJrHlXOMYNNm4tw4z0lEVTGWh
         +92CUJnkkFiw2UB7whCx1JFhmHIOOmYEjzBeXV3tvErrjTNIfQXv86UV3QJhRbqxO6YD
         w2vSoolQPyYatzSEsY6lZRGRLWupYhqaEGoVlUbfj96z0h+7yfqzsyvbXRmh8uap4VyA
         olf48wPtFYKLhvilWlYciLPH0PLw8Gki3Hcz0iCy48NTsqMipMtl37yS/pGPoK+H+4qM
         eq0Hyc8+BcGaPbpwpiVMOE7WyAWJvqSOyqhUF7d5FqlQDNe+BR115+drQDU+fVKAeamd
         UeGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LHUpQHsG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fy11-20020a05622a5a0b00b0039cdad4d788si4488259qtb.777.2023.01.09.04.04.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Jan 2023 04:04:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LHUpQHsG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEqiW-0002no-0v; Mon, 09 Jan 2023 06:53:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqiU-0002n3-EE
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 06:53:26 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqiS-0007xA-H0
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 06:53:26 -0500
Received: by mail-wr1-x42a.google.com with SMTP id j7so2877314wrn.9
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 03:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iQs1+OIM6FI+xXo1eNVCeEzgZwL+2/Sa1KGrztxPB6E=;
 b=LHUpQHsGMytocszGYclxxFY/M0sI4Wy83DOeMv67XaQlZjsqp3QXXAy4ByzQW+Nu5G
 Yx+deKJeqp+pLH4vSzj/oFuhvWNm1V1ao0WgxhlyMKPbMh2eFlASN0y05W2jqvQkz9li
 qavptblnClL/RMxD/dm+V/lPWzomhuCkD28gqtNER1MQ6bIayj7IcI+9AEu9sQwilqUK
 X4hgHYe72wWx4ND3foCra70qRuy6Z96KQJKrTaSUWevKYlqKl4o/5uMzbPyfVbX4GoNu
 i5P06j9e1s52YPrKMe/4BgltPHFPq9SUEXKBp8DvRkWI6kcoMLSemL07RWMIDCm4aA/S
 juoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iQs1+OIM6FI+xXo1eNVCeEzgZwL+2/Sa1KGrztxPB6E=;
 b=4YBZpjbviyrN9DNsIRANq6M1xWCf3cj5wcCcVNlZI8uyMzYQfGlLfmrg6pxWJ1bKTu
 YILveFaNSg19W2IdTncxIb49BlMmjTjAmH2d1xPCySydYAhPL94hobhZEkxF2sXzmnYg
 0+rPoEZ7EtzvowfC4YgRr/AIZtoRDWkDh4ZyJBCA2bs81DMDQnQzNdxxT/jXWkYY8DCF
 v1lmBf7KXrvWklyNQGYEoOH8JCVetFSaB2RDeqIbnSbrCL+AJ6prTa4puaFSuncHlOB4
 7G1OzBv0DQGCteO9NrQ0Rc23Dtxlzpc+ekTME4o2lpulEklOh23QDcRH1si9yIBgqddp
 mGiw==
X-Gm-Message-State: AFqh2kqpSI00PU+NnvHGjkcJkJiKEifwIbJ5951l4lmpp1/EYipJjQ3q
 LgifD4QVsc/PonXpEnjeFQOTaDzUf4sgJnCO
X-Received: by 2002:a5d:620f:0:b0:242:9e3:72b8 with SMTP id
 y15-20020a5d620f000000b0024209e372b8mr46471796wru.31.1673265203010; 
 Mon, 09 Jan 2023 03:53:23 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 f14-20020adff58e000000b00241fea203b6sm8495136wro.87.2023.01.09.03.53.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 03:53:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 01/13] hw/arm/pxa2xx: Simplify pxa255_init()
Date: Mon,  9 Jan 2023 12:53:04 +0100
Message-Id: <20230109115316.2235-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109115316.2235-1-philmd@linaro.org>
References: <20230109115316.2235-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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
X-TUID: 562/AQCpF6kt

Since pxa255_init() must map the device in the system memory,
there is no point in passing get_system_memory() by argument.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/gumstix.c     | 3 +--
 hw/arm/pxa2xx.c      | 4 +++-
 hw/arm/tosa.c        | 2 +-
 include/hw/arm/pxa.h | 2 +-
 4 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/hw/arm/gumstix.c b/hw/arm/gumstix.c
index 3a4bc332c4..c167518a46 100644
--- a/hw/arm/gumstix.c
+++ b/hw/arm/gumstix.c
@@ -51,12 +51,11 @@ static void connex_init(MachineState *machine)
 {
     PXA2xxState *cpu;
     DriveInfo *dinfo;
-    MemoryRegion *address_space_mem = get_system_memory();
 
     uint32_t connex_rom = 0x01000000;
     uint32_t connex_ram = 0x04000000;
 
-    cpu = pxa255_init(address_space_mem, connex_ram);
+    cpu = pxa255_init(connex_ram);
 
     dinfo = drive_get(IF_PFLASH, 0, 0);
     if (!dinfo && !qtest_enabled()) {
diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
index 93dda83d7a..8b8845fc63 100644
--- a/hw/arm/pxa2xx.c
+++ b/hw/arm/pxa2xx.c
@@ -11,6 +11,7 @@
 #include "qemu/error-report.h"
 #include "qemu/module.h"
 #include "qapi/error.h"
+#include "exec/address-spaces.h"
 #include "cpu.h"
 #include "hw/sysbus.h"
 #include "migration/vmstate.h"
@@ -2230,8 +2231,9 @@ PXA2xxState *pxa270_init(MemoryRegion *address_space,
 }
 
 /* Initialise a PXA255 integrated chip (ARM based core).  */
-PXA2xxState *pxa255_init(MemoryRegion *address_space, unsigned int sdram_size)
+PXA2xxState *pxa255_init(unsigned int sdram_size)
 {
+    MemoryRegion *address_space = get_system_memory();
     PXA2xxState *s;
     int i;
     DriveInfo *dinfo;
diff --git a/hw/arm/tosa.c b/hw/arm/tosa.c
index d5a6763cf9..3ca2e4459c 100644
--- a/hw/arm/tosa.c
+++ b/hw/arm/tosa.c
@@ -242,7 +242,7 @@ static void tosa_init(MachineState *machine)
     TC6393xbState *tmio;
     DeviceState *scp0, *scp1;
 
-    mpu = pxa255_init(address_space_mem, tosa_binfo.ram_size);
+    mpu = pxa255_init(tosa_binfo.ram_size);
 
     memory_region_init_rom(rom, NULL, "tosa.rom", TOSA_ROM, &error_fatal);
     memory_region_add_subregion(address_space_mem, 0, rom);
diff --git a/include/hw/arm/pxa.h b/include/hw/arm/pxa.h
index 1095504b86..c26007e57f 100644
--- a/include/hw/arm/pxa.h
+++ b/include/hw/arm/pxa.h
@@ -195,6 +195,6 @@ struct PXA2xxI2SState {
 
 PXA2xxState *pxa270_init(MemoryRegion *address_space, unsigned int sdram_size,
                          const char *revision);
-PXA2xxState *pxa255_init(MemoryRegion *address_space, unsigned int sdram_size);
+PXA2xxState *pxa255_init(unsigned int sdram_size);
 
 #endif /* PXA_H */
-- 
2.38.1

