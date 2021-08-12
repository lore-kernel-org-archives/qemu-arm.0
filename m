Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp197001lff;
        Thu, 12 Aug 2021 02:45:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7OHTyDBvncxTB6u1Pdvdubo45L/MRYqvHVkn9Dlu4dR/o5z2tWN/ZaRmLwjKnyCVqsxt3
X-Received: by 2002:a5d:848a:: with SMTP id t10mr2358806iom.82.1628761517823;
        Thu, 12 Aug 2021 02:45:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628761517; cv=none;
        d=google.com; s=arc-20160816;
        b=vhq43ZvnCgvBgqPOgAq8C7voQcL1Bt0rgw6pg44ynDgILB94ViXkfhsWNiYv6sUUKd
         QnBGVF+AA2dOB6ivulrbqYVUbmVuemIR1IjhsV82ii4zGzd9wfddQWfOQ8ZDReIYKi9N
         jbkysDUjOlLJlrJOnjMb/sISNN16V7Vq1T2HNPKql82ix4fVvMlIW8jqMi8ZA0T7cYx7
         RHRn4XUqWO/SZUprhWQXVymCnG0dN3WdjfoSJxg+E2Hpc35xztYRRscbLeWV9QUhzJy6
         /k9Y8ibgea4NeUOZuLafsubtdYdnWk9ycGD92V5oHuF/u8Rh5CVNs4OflLTJKY8Dm9Bj
         QMew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=imRDz2WYhnYhneAl1HiaVMr6cnP1w4n/2P4u8XAGN8c=;
        b=s6XFHOH227XEZQo6ZjiPjm3LCrHfj+jIop1ge2CRdFilsP4i4q1JlyoAtQkA8QxiJT
         RRBlbw+xwCmNoR67AGHhN6gDUvGFSLWgFIt5MbLXdMX/LAEdGqVjDMsuZULxd4nk5uMj
         AthQxnmCnsm3MA4dOypv3ar7pfTA5Fz3/N7eie0a3VZtPZNhXfkqlvxtMlOCj4tabAUT
         FILEjyxnugarHK4AUIQNmOJUoCsxoq8TOFMP0BPhd7KTSQhzzWLoUMsDu4osKBLKWFvs
         uK8kG9iNewowpQkLECmJHrIdLQYOCQN8B4EU27UIDbQHdK7im4tkAD59565YAFnzWpWJ
         VGfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nzQlu9Ub;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x26si2561240jao.11.2021.08.12.02.45.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Aug 2021 02:45:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nzQlu9Ub;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mE7H3-0004UU-69
	for alex.bennee@linaro.org; Thu, 12 Aug 2021 05:45:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE76T-0005nP-Ad
 for qemu-arm@nongnu.org; Thu, 12 Aug 2021 05:34:21 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:44651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE76P-0007zz-L6
 for qemu-arm@nongnu.org; Thu, 12 Aug 2021 05:34:21 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 l7-20020a1c2507000000b002e6be5d86b3so613640wml.3
 for <qemu-arm@nongnu.org>; Thu, 12 Aug 2021 02:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=imRDz2WYhnYhneAl1HiaVMr6cnP1w4n/2P4u8XAGN8c=;
 b=nzQlu9UbuecwMnDj1dD9HLhEgjf3SegmOh3BR4BCfZD+NCH/YYTzlnjSzaEOw7agZI
 FioZxYTi+e5WXz7uI8epar175x+SVjPyhtV9N1fRGeyUXUkSwCTZb+u7vm59k+1Duuz1
 1K1cLJrFV2Vpta8t836ZFZQYOb5egnRQTC/QpIAI/ED87C3z/eYYVVcSSem2vRpw5ccL
 Mg3CQsj3JQ4MofloffFqLd4UZ6LwfyZzYre4YDHAmdIOV/dEfR/fOjjAI7nr/3N+6vPS
 MzAlQT5oj0V4N3xFrUorwr19o/AYTGqE5TDAmksVb8IVrmv/GiV+tTClIC98rPiJqsVY
 t/kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=imRDz2WYhnYhneAl1HiaVMr6cnP1w4n/2P4u8XAGN8c=;
 b=BfmbSiTEdzzKPmXAFlIszXenffBZMyaGRmeauV7Jg441zE2s1bWPqbsZKAdaRAR0A0
 yPrmlMghYFq3+F39goz1fWplcgFx/mZOOgEgRvcZKPbsqZSmm5DQYwx1apeC0l+SYGOb
 UBs2dItrvtNLvScTQ0W0UHGDE2UMD2qaI45t9SasC8zFC6JpoP7AJqWqA2LBvX2te0Fe
 vzUr6eVXnL26WTZRW9ENvgZFn0kog/1Wad8s/18o+Dlfb0lIZVt98c9lWuhQwERULZFk
 uBPpDkM7cCIkLoWXa/szi6P3vleSSGeBjED9jhR1QIDhgaU1UgieFMUMeB3sTXWtrNUE
 0RPA==
X-Gm-Message-State: AOAM5319ZgCVYWSHMl70KKBdRRBh+OexEJHLLcprxqALdBnOHkhQZDBb
 CZ4Rpo2TM14Pj+ZbgCFjzPNS9mkXdUG07w==
X-Received: by 2002:a1c:7506:: with SMTP id o6mr11762646wmc.112.1628760856135; 
 Thu, 12 Aug 2021 02:34:16 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l38sm8158506wmp.15.2021.08.12.02.34.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 02:34:15 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 18/25] hw/arm/msf2_soc: Don't allocate separate
 MemoryRegions
Date: Thu, 12 Aug 2021 10:33:49 +0100
Message-Id: <20210812093356.1946-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210812093356.1946-1-peter.maydell@linaro.org>
References: <20210812093356.1946-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
 Alistair Francis <alistair@alistair23.me>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZbpbFBI1o9d9

In the realize method of the msf2-soc SoC object, we call g_new() to
create new MemoryRegion objects for the nvm, nvm_alias, and sram.
This is unnecessary; make these MemoryRegions member fields of the
device state struct instead.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/msf2-soc.h |  4 ++++
 hw/arm/msf2-soc.c         | 17 +++++++----------
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/include/hw/arm/msf2-soc.h b/include/hw/arm/msf2-soc.h
index d4061846855..38e10ce20aa 100644
--- a/include/hw/arm/msf2-soc.h
+++ b/include/hw/arm/msf2-soc.h
@@ -65,6 +65,10 @@ struct MSF2State {
     MSSTimerState timer;
     MSSSpiState spi[MSF2_NUM_SPIS];
     MSF2EmacState emac;
+
+    MemoryRegion nvm;
+    MemoryRegion nvm_alias;
+    MemoryRegion sram;
 };
 
 #endif
diff --git a/hw/arm/msf2-soc.c b/hw/arm/msf2-soc.c
index 5cfe7caf834..f36788054b3 100644
--- a/hw/arm/msf2-soc.c
+++ b/hw/arm/msf2-soc.c
@@ -83,11 +83,8 @@ static void m2sxxx_soc_realize(DeviceState *dev_soc, Error **errp)
     int i;
 
     MemoryRegion *system_memory = get_system_memory();
-    MemoryRegion *nvm = g_new(MemoryRegion, 1);
-    MemoryRegion *nvm_alias = g_new(MemoryRegion, 1);
-    MemoryRegion *sram = g_new(MemoryRegion, 1);
 
-    memory_region_init_rom(nvm, OBJECT(dev_soc), "MSF2.eNVM", s->envm_size,
+    memory_region_init_rom(&s->nvm, OBJECT(dev_soc), "MSF2.eNVM", s->envm_size,
                            &error_fatal);
     /*
      * On power-on, the eNVM region 0x60000000 is automatically
@@ -95,15 +92,15 @@ static void m2sxxx_soc_realize(DeviceState *dev_soc, Error **errp)
      * start address (0x0). We do not support remapping other eNVM,
      * eSRAM and DDR regions by guest(via Sysreg) currently.
      */
-    memory_region_init_alias(nvm_alias, OBJECT(dev_soc), "MSF2.eNVM", nvm, 0,
-                             s->envm_size);
+    memory_region_init_alias(&s->nvm_alias, OBJECT(dev_soc), "MSF2.eNVM",
+                             &s->nvm, 0, s->envm_size);
 
-    memory_region_add_subregion(system_memory, ENVM_BASE_ADDRESS, nvm);
-    memory_region_add_subregion(system_memory, 0, nvm_alias);
+    memory_region_add_subregion(system_memory, ENVM_BASE_ADDRESS, &s->nvm);
+    memory_region_add_subregion(system_memory, 0, &s->nvm_alias);
 
-    memory_region_init_ram(sram, NULL, "MSF2.eSRAM", s->esram_size,
+    memory_region_init_ram(&s->sram, NULL, "MSF2.eSRAM", s->esram_size,
                            &error_fatal);
-    memory_region_add_subregion(system_memory, SRAM_BASE_ADDRESS, sram);
+    memory_region_add_subregion(system_memory, SRAM_BASE_ADDRESS, &s->sram);
 
     armv7m = DEVICE(&s->armv7m);
     qdev_prop_set_uint32(armv7m, "num-irq", 81);
-- 
2.20.1

