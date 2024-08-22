Received: by 2002:a17:505:917:b0:1be9:327d:8ee3 with SMTP id hq23csp702575njb;
        Thu, 22 Aug 2024 09:22:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXnMdA/fNkV31l1tGlvwWL4F3+6Y61k0VKCFKW8qQueAA5FYfMDmYyY1QkfwOL90B2TF/dfcAZEyoA1Wg==@linaro.org
X-Google-Smtp-Source: AGHT+IHe5MiQzRMdpSCLIzIHKHyUSN5Pm6dU3AWX9YtXNDxyW2nzMGc9vnjT+WOZ+Lg50qA1CrQi
X-Received: by 2002:a05:622a:1b04:b0:447:c7e4:6b33 with SMTP id d75a77b69052e-454f21dbc79mr63341651cf.7.1724343756360;
        Thu, 22 Aug 2024 09:22:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724343756; cv=none;
        d=google.com; s=arc-20160816;
        b=vYg9eYu8cYj24BHADp6OX5GJnMbJEtFd6FpObT19l5eozMlbIGpHnyNExRHA/VVFdF
         1/nXng5pdvqqGtL/7K2+MY7ZwQO15m9SfmPKz7AYyMZQ108JvUy9lEHqdMnnPj2l6J9K
         4ct8FwLI62gYa4syLGQJLEEiCmLwISYOVyCsOH4DdWXJf8EREvwJ9oUS8g4Y7m6bzHBA
         PnRxiJDw7Xtur9ITXuH1gu4B/co2EA5uTSigQ2m1Y94qTzNj8cD2+hbCdwgmXXQHR+3+
         iXgx55Egaq2meHa1lMwj9SrpFGxDVpoxB1BLeUKVwCr3QRL+I8zlPvQE7EdhSvIHKD6M
         cSVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=nMpLWn3WW/z8gsXVfqO2IPBe/rQMV7r1aFvdjBG7Zt4=;
        fh=eKvyMq82ozF2pexIVE339+mXcynob0ROL80gQzK9b2g=;
        b=lM+gdaivjIiBO5VO3+tdt3oz1vVLa6JtXUw2r1WeE42gXatfje5mJupCzYiXnWH6JG
         4OLs1mnO9MyY8lwU/iVERtdbiCrPcg+ZIVyXwDdU4rLaM0WplvQ4RYJwg1QrYmUl+1Q5
         UxdpayJtBXaKieidRUdknWBaNLB6R9RqeYE6QnAnAgw8Qm/r2TLm5duyrVHMQ626wJjG
         Qq3HakM88D7HLz5F5jIAdi7WMdR5jfZdB0sscPEx8DFaypp1K4NRG10ow9uM+7NCnXMN
         gRZbmfd/UYekWrVQ9g3dt11VwgjhPvWv6qnWcSJHtoW7+D3njskiT0jcbO6XFHuAq6pQ
         hYEA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uO3W1+td;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-454fe1aa973si19766591cf.261.2024.08.22.09.22.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Aug 2024 09:22:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uO3W1+td;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1shAZN-0005lk-Kd; Thu, 22 Aug 2024 12:21:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1shAZH-0005Mb-5U
 for qemu-arm@nongnu.org; Thu, 22 Aug 2024 12:21:47 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1shAZ7-0007Kh-Mm
 for qemu-arm@nongnu.org; Thu, 22 Aug 2024 12:21:45 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-37196229343so632694f8f.0
 for <qemu-arm@nongnu.org>; Thu, 22 Aug 2024 09:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724343692; x=1724948492; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nMpLWn3WW/z8gsXVfqO2IPBe/rQMV7r1aFvdjBG7Zt4=;
 b=uO3W1+tdcqqKQy9b6fD3C0ArfnIs7RrGMYpNFQMEch/K3EijismlJK6YTAqPvcx4El
 F+Lp8vFMKrGEJYJj61z3puJ9yoHuuyCJa1LkoQanbBYWXiE+Mn2T+H1NM8E2Bv8K4gFm
 F6VDDMIxHpiRfFb1wdZo477CFcC0laLLTbJgiAVvzuowCGvv0+9ICFrGyHSUtXa3xvsv
 49wsZmGzJWLF9ABqur6LH+4ITq8GbAtX0m8Xx+2LO51aT40b8ACbgOKm0rCGs70VRS52
 1yfPYrdilfBX3nkdFj7P5nHLgGf3nL4mWPjaRKZReHllYqY0yfm4GgO6gxHC/vayHZGq
 yR6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724343692; x=1724948492;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nMpLWn3WW/z8gsXVfqO2IPBe/rQMV7r1aFvdjBG7Zt4=;
 b=oYdZjNvLqot3F4qZ1h3OA9biJlebipdsvSRuuTo6TSta5NAjlS1OGr6jgUXIgAwEbM
 /4t4xaleeiao/IdgyHgeM8mzifDh/zFxICTeEuaJuKzDkRdHdmhXSV/Srn/4V9q8TVRy
 WYJ2ZJnbRY0yp8hmucGM7PRPtPDnPOS+8ZroTEE5hwBAkqk74hrolE7fYqoDem1CdMmT
 WwTL/ExQIFjSPcmiS9/Z42iTmrZcxY2f3S2LJlHPJNJ07OLmLviaWzY19kLH41+CpJeN
 LEIDxroEauRXBgYgX5q4p1L56PXX3tnU4/kXG/4PmFG6bqzMgXOc3+0UE6OgmunywrX5
 oekg==
X-Gm-Message-State: AOJu0Yz3lOkUBbJNbGoxgRFO3VQM5Pw2mCG1mTXSWdU3fO6mE2HQV7vA
 jpEmmjGFfCz0WD2826Q+KVk/eaxLcStN6htHOyRaS0LUJETCfmJXY2slIWH3C0doI3mMb991cwk
 j
X-Received: by 2002:adf:e285:0:b0:368:31c7:19dd with SMTP id
 ffacd0b85a97d-37308bff403mr1437853f8f.5.1724343691981; 
 Thu, 22 Aug 2024 09:21:31 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ac5162347sm28928485e9.23.2024.08.22.09.21.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2024 09:21:31 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Francisco Iglesias <francisco.iglesias@amd.com>
Subject: [PATCH for-9.2 5/6] hw/misc/xlnx-versal-trng: Call
 register_finalize_block
Date: Thu, 22 Aug 2024 17:21:26 +0100
Message-Id: <20240822162127.705879-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240822162127.705879-1-peter.maydell@linaro.org>
References: <20240822162127.705879-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: irfynqh3oMr/

The TYPE_XLNX_VERSAL_TRNG device creates a register block with
register_init_block32() in its instance_init method; we must
therefore destroy it in our instance_finalize method to avoid a leak
in the QOM introspection "init-inspect-finalize" lifecycle:

Direct leak of 304 byte(s) in 1 object(s) allocated from:
    #0 0x55842ec799d8 in __interceptor_calloc (/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/asan/qemu-system-aarch64+0x294e9d8) (BuildId: 47496e53f3e779f1c7e9b82cbea07407152b498b)
    #1 0x7fe793c75c50 in g_malloc0 debian/build/deb/../../../glib/gmem.c:161:13
    #2 0x55842f0aec5d in register_init_block hw/core/register.c:248:34
    #3 0x55842f0af6be in register_init_block32 hw/core/register.c:299:12
    #4 0x55842f801588 in trng_init hw/misc/xlnx-versal-trng.c:614:9
    #5 0x558431c411a1 in object_init_with_type qom/object.c:420:9
    #6 0x558431c2847b in object_initialize_with_type qom/object.c:562:5
    #7 0x558431c29d1d in object_new_with_type qom/object.c:782:5
    #8 0x558431c29df1 in object_new qom/object.c:797:12
    #9 0x558432427c1d in qmp_device_list_properties qom/qom-qmp-cmds.c:144:11

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/misc/xlnx-versal-trng.h | 1 +
 hw/misc/xlnx-versal-trng.c         | 6 +++---
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/include/hw/misc/xlnx-versal-trng.h b/include/hw/misc/xlnx-versal-trng.h
index 0bcef8a6132..d96f8f9eff3 100644
--- a/include/hw/misc/xlnx-versal-trng.h
+++ b/include/hw/misc/xlnx-versal-trng.h
@@ -50,6 +50,7 @@ typedef struct XlnxVersalTRng {
     uint64_t forced_prng_count;
     uint64_t tst_seed[2];
 
+    RegisterInfoArray *reg_array;
     uint32_t regs[RMAX_XLNX_VERSAL_TRNG];
     RegisterInfo regs_info[RMAX_XLNX_VERSAL_TRNG];
 } XlnxVersalTRng;
diff --git a/hw/misc/xlnx-versal-trng.c b/hw/misc/xlnx-versal-trng.c
index c0d1dde8708..86905479b8f 100644
--- a/hw/misc/xlnx-versal-trng.c
+++ b/hw/misc/xlnx-versal-trng.c
@@ -608,9 +608,8 @@ static void trng_init(Object *obj)
 {
     XlnxVersalTRng *s = XLNX_VERSAL_TRNG(obj);
     SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
-    RegisterInfoArray *reg_array;
 
-    reg_array =
+    s->reg_array =
         register_init_block32(DEVICE(obj), trng_regs_info,
                               ARRAY_SIZE(trng_regs_info),
                               s->regs_info, s->regs,
@@ -618,7 +617,7 @@ static void trng_init(Object *obj)
                               XLNX_VERSAL_TRNG_ERR_DEBUG,
                               R_MAX * 4);
 
-    sysbus_init_mmio(sbd, &reg_array->mem);
+    sysbus_init_mmio(sbd, &s->reg_array->mem);
     sysbus_init_irq(sbd, &s->irq);
 
     s->prng = g_rand_new();
@@ -628,6 +627,7 @@ static void trng_finalize(Object *obj)
 {
     XlnxVersalTRng *s = XLNX_VERSAL_TRNG(obj);
 
+    register_finalize_block(s->reg_array);
     g_rand_free(s->prng);
     s->prng = NULL;
 }
-- 
2.34.1

