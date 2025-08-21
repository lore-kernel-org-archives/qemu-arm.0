Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC5E1CA0EFC
	for <qemu-arm@archiver.kernel.org>; Thu, 21 Aug 2025 15:45:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1up7Tf-0003TW-CN; Thu, 21 Aug 2025 11:45:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1up7TU-0003NP-5b
 for qemu-arm@nongnu.org; Thu, 21 Aug 2025 11:45:15 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1up7TN-0007Io-20
 for qemu-arm@nongnu.org; Thu, 21 Aug 2025 11:45:09 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-45a1b05fe23so6341635e9.1
 for <qemu-arm@nongnu.org>; Thu, 21 Aug 2025 08:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755791101; x=1756395901; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9TBVPD6oa19o0Rlf8ysqop9Irol7X6lGtL0OpntaIok=;
 b=T1/9MW9RtSJ3mpVmiJFF+OWyzVwyKRei0qvmbMtma//USyhUzEUoaOVKoF4DC2LqU5
 RgLa+nqZCPrdbXXVj7FmOn7qIdDOdySgT0AkQn3mCpJtWV/Z2VX96z11fIlRn1YwiGTa
 RiVKYTz59zggQrtUARqUW5LzyBkK3E5kN446l4ikC9onwYbh7/M0ok2iLaeuKF3oLSkf
 jn0yy/C+2CS4yKzXSrmsaO4WRmXlD2WZrNm8Q1myinpFwTZxkI8pfvM9qZbc1sYUVqex
 Hf6VqvRvGauO/9rOTQUEr5rgtDyW4+rSr2g9Gdr9HqvuXP058aF5DROMwB79PFtkCYlH
 raVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755791102; x=1756395902;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9TBVPD6oa19o0Rlf8ysqop9Irol7X6lGtL0OpntaIok=;
 b=HmbCCGF73Tg5ryAUPEgOawGsGu70oFMTXSaHSGZ/1Z2GzlCL5ODvkajBk60oYoQe18
 23szz/GhHJOAw4/Or1Cj2dPeUaZQqquH7pn0MNHlvy3Kz0nETPcHitXZNdONrPCPkmp4
 zmsDh9LALBa5xrdBNcNgrUwP7K5v9JiGcjkN+FvKxUNCtk5tQs5tya6/c1Y90E7AuY8V
 i6+skT+S0xOKgElPQk7W5nBwRbVpP0Ni93slq0aksraNEUx7M0PVJYVS11bMegKACDWW
 dUK5OrKHN1Fh0do3f/TYJf5EihGibCifeeo2I1pBFjzL9DHOwfqoMR0CY6STdU7BidFz
 s+Dw==
X-Gm-Message-State: AOJu0Ywqfjq63wc29frobIOcO61WPfTB+r48iQXRTOyUWap7ChrLV8xQ
 fQXTzQFCXF6Cszqfvcgor1js2GUHXxypNIAZdD2lEtTewk/ZBvZCMeJkPZuvVeOwBukedt/fdaL
 6lvGL
X-Gm-Gg: ASbGncvGzWehwP3TzDJjS2LLk0zqDbbvgf7JpHNnCElF6S9Hh6fHxE+86tKuiXV4TTt
 e25jccggvRP3oIUOAJpypcQoQpA+iwC0jKuSiIgZr7zcW6rr9XWM/rVTjyHJ08JZAQ2kxABCRyw
 tqG4pGGZ9Ayc4v1n6HTstuTMB2KzEXCAGo9l+c3YaOdpMFdA92Btfrm0HNWdQKqYaLq5DGFYaJY
 AaEJgG7MZhEoXWURdOaJjU8IcttZODM2Ui6pkZQYdWmT3MEz+giVV3GQIoFO5JbsteiZc8B1Jso
 6kh8IxGCm9hLX2L1BycYgXTJ67SnbdNvnPlBaBTiW3AJq7rRpmqZT0Sudy0CtllJTuQgWgR6bZg
 V8qepJdSuaLotLXc5J4+IFEDCDta8ktTRQuherGM=
X-Google-Smtp-Source: AGHT+IH0B7xZKjjroXLrapu7eouajRrB/DQ7DauPcYFTXVv2EqvOYauFvjaNNi9gqr+oNTaDTdnXIQ==
X-Received: by 2002:a05:600c:1c0d:b0:456:19be:5e8 with SMTP id
 5b1f17b1804b1-45b4d830ae6mr25088515e9.20.1755791101588; 
 Thu, 21 Aug 2025 08:45:01 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c4c218c6c2sm2838429f8f.66.2025.08.21.08.45.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 08:45:00 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	Glenn Miles <milesg@linux.ibm.com>
Subject: [PATCH] hw/gpio/pca9554: Avoid leak in pca9554_set_pin()
Date: Thu, 21 Aug 2025 16:44:59 +0100
Message-ID: <20250821154459.2417976-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

In pca9554_set_pin() we have a string property which we parse in
order to set some non-string fields in the device state.  So we call
visit_type_str(), passing it the address of the local variable
state_str.

visit_type_str() will allocate a new copy of the string; we
never free this string, so the result is a memory leak, detected
by ASAN during a "make check" run:

Direct leak of 5 byte(s) in 1 object(s) allocated from:
    #0 0x5d605212ede3 in malloc (/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-asan/qemu-system-arm+0x21f1de3) (
BuildId: 3d5373c89317f58bfcd191a33988c7347714be14)
    #1 0x7f7edea57b09 in g_malloc (/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x62b09) (BuildId: 1eb6131419edb83b2178b68282
9a6913cf682d75)
    #2 0x7f7edea6d4d8 in g_strdup (/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x784d8) (BuildId: 1eb6131419edb83b2178b68282
9a6913cf682d75)
    #3 0x5d6055289a91 in g_strdup_inline /usr/include/glib-2.0/glib/gstrfuncs.h:321:10
    #4 0x5d6055289a91 in qobject_input_type_str /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-asan/../../qapi/qo
bject-input-visitor.c:542:12
    #5 0x5d605528479c in visit_type_str /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-asan/../../qapi/qapi-visit
-core.c:349:10
    #6 0x5d60528bdd87 in pca9554_set_pin /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-asan/../../hw/gpio/pca9554.c:179:10
    #7 0x5d60549bcbbb in object_property_set /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-asan/../../qom/object.c:1450:5
    #8 0x5d60549d2055 in object_property_set_qobject /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-asan/../../qom/qom-qobject.c:28:10
    #9 0x5d60549bcdf1 in object_property_set_str /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-asan/../../qom/object.c:1458:15
    #10 0x5d605439d077 in gb200nvl_bmc_i2c_init /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-asan/../../hw/arm/aspeed.c:1267:5
    #11 0x5d60543a3bbc in aspeed_machine_init /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-asan/../../hw/arm/aspeed.c:493:9


Make the state_str g_autofree, so that we will always free
it, on both error-exit and success codepaths.

Cc: qemu-stable@nongnu.org
Fixes: de0c7d543bca ("misc: Add a pca9554 GPIO device model")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/gpio/pca9554.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/gpio/pca9554.c b/hw/gpio/pca9554.c
index de3f883aee9..eac0d23be34 100644
--- a/hw/gpio/pca9554.c
+++ b/hw/gpio/pca9554.c
@@ -174,7 +174,7 @@ static void pca9554_set_pin(Object *obj, Visitor *v, const char *name,
     PCA9554State *s = PCA9554(obj);
     int pin, rc, val;
     uint8_t state, mask;
-    char *state_str;
+    g_autofree char *state_str = NULL;
 
     if (!visit_type_str(v, name, &state_str, errp)) {
         return;
-- 
2.43.0


