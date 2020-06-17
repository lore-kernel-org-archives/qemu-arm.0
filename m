Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp320478lfm;
        Tue, 16 Jun 2020 22:59:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy3qDVx/Tim/uNzYNpLK/3LlN3IytAVhYtCEo+i6sX3prcR1idMjibNPQzNz0kOQ1ZeorI2
X-Received: by 2002:a5b:f4f:: with SMTP id y15mr9970671ybr.184.1592373597273;
        Tue, 16 Jun 2020 22:59:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592373597; cv=none;
        d=google.com; s=arc-20160816;
        b=H3EzFLCEj/59jDiFYTtvEsYZOq4kR4quDrmYyZjY00kbhLlbaDc7yrc6YXRShDn1Oc
         wex5WPrqcHypcV/RdhVQAkiBKvaQOJZ0YN1s6VT5hLRVONRKkTvzg+SesiONifseIoVk
         AROQ9OALafMiilem+jbzijGJ9L3o38s03nFrtcxNaResbd/OV5K7JD/81YHXIpnOCSv3
         HmguJwfC8g51AsNpFgOgTaTbqQli5zE5jjfjBitZ5tTHJjiuTJenF1kEc70Rwe/zx0m0
         0jY75ZQFaAgbWwdUIYLZalbYOzdUaVuRyR2y7wpEs/WjuVwc4UH+q0kOypd/qzH3qw0V
         /dLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=I3W9cifnD7DOZZ455FCgCr8VTTmTQL8v0YMmJYG05f0=;
        b=rcge/H5DfyHSUZjRNyN/Kwp33XP5nAmiW4tJqauMdly22CH4fXeykoQeDt7afRFWX9
         +Jz8ZJmNPTZdGRmpvTdfZK9RtALlh6lt4EEnj23bFIUq3UUJgIWI5Ehmr14AD6Rvj1yN
         vBHz3Lp2qJ6R7L/s3QC6384Tyz5j0p4Tb2GBVuR+qMg0vjTqhpElZlRN7BuXb3Tsjc8h
         SyZkjDHEWaDpqnEiASoesB/JZzYyo4UEaYqn90q1/6W8H2GeEuCK1bAbMLxD5HkLm8wb
         iTKwtdclfbU1c83rJvSaD7924mpjYakGXydf5oEMa9VL+PXDvqOfvbLAAYo+XHvyfcVY
         7/IQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=AnMKUCej;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z11si15357684ybp.361.2020.06.16.22.59.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jun 2020 22:59:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=AnMKUCej;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:60596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlR76-0007Xe-KX
	for alex.bennee@linaro.org; Wed, 17 Jun 2020 01:59:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jlQzn-0002qt-F2; Wed, 17 Jun 2020 01:52:23 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:52148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jlQzl-0004TM-US; Wed, 17 Jun 2020 01:52:23 -0400
Received: by mail-wm1-x344.google.com with SMTP id b82so603337wmb.1;
 Tue, 16 Jun 2020 22:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I3W9cifnD7DOZZ455FCgCr8VTTmTQL8v0YMmJYG05f0=;
 b=AnMKUCejKyYOV4Abe+F6mS+gWkYrGV7kuhz3seyz+H6W2Cbj2cfc+RQ0UPjkKLOPWx
 ewXOvGjOzESReAdVCDI6VX++TqhTsClUfuSPXUvefyUWSqlcgohVbhkxgJq3TTF+KitY
 fufWD5P5zI2aVhXQlBjw250HW3ASJMG9hQy3wnzQvvY4q6/CW5AJismwkLMvADDZoFZp
 J3DM2y81CRfZmT+Dt98AIC8koiMns3juwzuVaRjPwHwEYpQD3+YOhaueVO/QoSS8+s2Q
 9uwwoPVdUKsTdCc4TtX3LgEcu50+xud9O3MtE2UEfCptxRGe7rMN5XMxvNDMHdt3KUg3
 5WNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=I3W9cifnD7DOZZ455FCgCr8VTTmTQL8v0YMmJYG05f0=;
 b=uY6u9mwsVXU0TZykY0e0Sb798s+wRRkmMfkhVIBRYWpOee7ojLBkWSZpn/OC+FKLNg
 BS4wELTISuBiABwHk5auVxV2unnR6YIH3le5qhn4nTYcDN6LdErsIvFi3rMSS6mfGcge
 8ao6Cb6Q0lbJbH50m68nmGejy2U16t9AA4HPWB8djyhiXwuGPQTuNivE5Rmwtx9TD1B3
 r0j7V5CSdYk9+qblwOJdNWQDKe7y89cr4le9PwIMvt6fCxS/4rLN/rZtvizr3uXx6okE
 lFIRrbT/Rvu7xQQuj6HCGacgNKNgC1AtD6POlP5D/p+Tm8zxNZ5yuRaEMPu1QFk42vPO
 Oncw==
X-Gm-Message-State: AOAM533dqbj0Nu+kly4sr4OYd0O03f4V4yWWhLIb0S3D8AV+Vt17uYoA
 m/93e/utKDI/TrNP8amHY5B7YuHu
X-Received: by 2002:a1c:8107:: with SMTP id c7mr6717423wmd.20.1592373139029;
 Tue, 16 Jun 2020 22:52:19 -0700 (PDT)
Received: from localhost.localdomain (93.red-83-59-160.dynamicip.rima-tde.net.
 [83.59.160.93])
 by smtp.gmail.com with ESMTPSA id d28sm3000809wrc.50.2020.06.16.22.52.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2020 22:52:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/14] hw/arm/mps2: Map the FPGA I/O block
Date: Wed, 17 Jun 2020 07:52:01 +0200
Message-Id: <20200617055205.3576-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200617055205.3576-1-f4bug@amsat.org>
References: <20200617055205.3576-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
 Joaquin de Andres <me@xcancerberox.com.ar>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Esteban Bosse <estebanbosse@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vCN0kl+EHioS

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v2: 25MHz prescale-clk property
---
 hw/arm/mps2.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
index c66c595d4a..e106123225 100644
--- a/hw/arm/mps2.c
+++ b/hw/arm/mps2.c
@@ -38,8 +38,10 @@
 #include "hw/timer/cmsdk-apb-timer.h"
 #include "hw/timer/cmsdk-apb-dualtimer.h"
 #include "hw/misc/mps2-scc.h"
+#include "hw/misc/mps2-fpgaio.h"
 #include "hw/net/lan9118.h"
 #include "net/net.h"
+#include "hw/watchdog/cmsdk-apb-watchdog.h"
 
 typedef enum MPS2FPGAType {
     FPGA_AN385,
@@ -67,8 +69,10 @@ typedef struct {
     MemoryRegion sram;
     /* FPGA APB subsystem */
     MPS2SCC scc;
+    MPS2FPGAIO fpgaio;
     /* CMSDK APB subsystem */
     CMSDKAPBDualTimer dualtimer;
+    CMSDKAPBWatchdog watchdog;
 } MPS2MachineState;
 
 #define TYPE_MPS2_MACHINE "mps2"
@@ -332,6 +336,11 @@ static void mps2_common_init(MachineState *machine)
     qdev_prop_set_uint32(sccdev, "scc-id", mmc->scc_id);
     sysbus_realize(SYS_BUS_DEVICE(&mms->scc), &error_fatal);
     sysbus_mmio_map(SYS_BUS_DEVICE(sccdev), 0, 0x4002f000);
+    object_initialize_child(OBJECT(mms), "fpgaio",
+                            &mms->fpgaio, TYPE_MPS2_FPGAIO);
+    qdev_prop_set_uint32(DEVICE(&mms->fpgaio), "prescale-clk", 25000000);
+    sysbus_realize(SYS_BUS_DEVICE(&mms->fpgaio), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&mms->fpgaio), 0, 0x40028000);
 
     /* In hardware this is a LAN9220; the LAN9118 is software compatible
      * except that it doesn't support the checksum-offload feature.
-- 
2.21.3

