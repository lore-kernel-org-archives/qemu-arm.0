Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp987161ejy;
        Wed, 14 Sep 2022 06:14:05 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7JUvF+d9d3X+5bc7/KjdFm4M07S7BNVj4IB5Nre3gEqZgolSkb48G+wlc7UvVpI4+cmrz+
X-Received: by 2002:a05:620a:b0c:b0:6ce:61a2:3f20 with SMTP id t12-20020a05620a0b0c00b006ce61a23f20mr6323141qkg.551.1663161245249;
        Wed, 14 Sep 2022 06:14:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663161245; cv=none;
        d=google.com; s=arc-20160816;
        b=nZ/w2Z9TgDGsqRagb+p7IPck4y9hNFoA4tSDrhK3vYM0z+5TMJ9tG4OM3ntciREzT3
         730ENrv0/VpZ9VpghfxiXv38eCxrQa0FYYxVuQiIbjwd/Om47Du1XlcXkMUfoFa9m+An
         ewEiJxYPSdU2NBEXGBy9hxpOdChOmV69pfUT5w2JK51TnE9sZkQEyXZrxISkujphZlZu
         trLTjDdI5x9clug7rHPckjNwEVXmGKUA/I1YmgE4OB4loX9nETIN8vsnbYFlLmG9VTtE
         2kwyKFyZfepsh0y87e8/IqiKDvg0UxsqlQsXt5B4vuGy5KxgpmBCo3dl4FsiiNglUD17
         21lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=x7RzGIn8LNVYPu9Oy+agYCMaoOcO7iYBjnlAKBL8SJM=;
        b=aLt2eNdb6XJ31LsEKpLQkm4I1XlO3LgtBAhfstlz5qmfR750bzheE70GdbEyDwROJn
         /0US+2rxPkg1Hl6pok8HJTPw2OtdXRd+GzT8RoliXmWuU8DtyJn4FK7QR6jrXz3PEK1N
         IeEMrvveDwcDKaVMOVhwyyOvwJTSk2SVK6c92pWGRQdtpw8oMhNSrfqfvKCexH5ekC2B
         AMWWEu3gkh0xwFGZoW8fCxaZvPvPFsK1Y65kmUfBvk6Aq6xt361g/Y9ikCLmhQSKsETW
         K1uWQznOA2l18uUKIlwLIrZB8+Eb97OUSEWasbrK0WXZGjW+ns2hveO5hPn8uMrrQqpk
         YB9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w5sefo6f;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r9-20020a056214212900b00496dcb7aaf0si1385792qvc.165.2022.09.14.06.14.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 Sep 2022 06:14:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w5sefo6f;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oYSDM-0003jZ-OA
	for alex.bennee@linaro.org; Wed, 14 Sep 2022 09:14:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYQwg-0000kT-V0
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 07:52:53 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:43874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYQwY-00008o-It
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 07:52:46 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 z14-20020a05600c0a0e00b003b486df42a3so6241740wmp.2
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 04:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=x7RzGIn8LNVYPu9Oy+agYCMaoOcO7iYBjnlAKBL8SJM=;
 b=w5sefo6fHLzQtgKluFmt+SQb1+xxZbyPZoA+pFzegUmP7msP746lwgIHKSTDqJUs/m
 o1qbc/MBz2u4DsfvTTM1JFLRAolcZGcSpGQIah74m8Csc5aXnwYDHP1O24u5Kbbzrd+d
 y0YdHmLPplrkQGUPPAuSdg0tUg0hx1uWcmrNBYx+X8DIxmcrKHDa+sOOOYURGgKzOcGV
 GrepFSKgbnDV+cjJBGL8JssGnnNL31qPmDEbUkPlQf8u2sFoUQY8KgcdplcfAWMUyyWz
 X8hDr0fen/yQN+gCV92jmB5jap7YLROye6NQyGMzj2rDVmXNEgCn9YkkYN9b5OUqAP7r
 XotA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=x7RzGIn8LNVYPu9Oy+agYCMaoOcO7iYBjnlAKBL8SJM=;
 b=X+oVXNHBjZblnEjBtRbvp/dFmtmc8eke+wqbCKFTn8SAjXHVcTeJeTxwE0N6US8Vae
 HVWmE8uyE0HVAU79q1cc2EZ9Wmjyzio5tWtLaSjQRS2Ucl+/0SKn+JYGn8R5p2vbJrrS
 /0Ihosqd1+qONLeGGja1gtmxVjTUfQraej/xl1YXA+vW/nDCeVL2KZYJEepZMYGgmxZm
 3VWKS4TXOK0GsLEL+PeF6I21Tb5blSF5yYFIrl4G00kMS2skyJRwAMk4mvg15oHvlDl4
 XHNPCvYGRnapOgk2gTRx66WFYfAEYAR+o/cGcbFE9dMo3sg2sntKh7bHj+5hgxsavRt9
 56MQ==
X-Gm-Message-State: ACgBeo082mBzJHV6l/PbFtK5UrcmVhE/5hvKRjCKovWY79TtmP3JVM8Y
 I6Yx0CPQrkbwOxUfx84xH4+I8nEGccFZbidA
X-Received: by 2002:a1c:c91a:0:b0:3a6:38bf:2c36 with SMTP id
 f26-20020a1cc91a000000b003a638bf2c36mr2858923wmb.38.1663156357174; 
 Wed, 14 Sep 2022 04:52:37 -0700 (PDT)
Received: from stoup.. ([89.101.193.70]) by smtp.gmail.com with ESMTPSA id
 t9-20020a5d6909000000b0022a3a887ceasm13712970wru.49.2022.09.14.04.52.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 04:52:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 19/20] target/arm: Remove useless TARGET_BIG_ENDIAN check in
 armv7m_load_kernel()
Date: Wed, 14 Sep 2022 12:52:16 +0100
Message-Id: <20220914115217.117532-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914115217.117532-1-richard.henderson@linaro.org>
References: <20220914115217.117532-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x333.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NWmXnpn6Q58d

From: Peter Maydell <peter.maydell@linaro.org>

Arm system emulation targets always have TARGET_BIG_ENDIAN clear, so
there is no need to have handling in armv7m_load_kernel() for the
case when it is defined.  Remove the unnecessary code.

Side notes:
 * our M-profile implementation is always little-endian (that is, it
   makes the IMPDEF choice that the read-only AIRCR.ENDIANNESS is 0)
 * if we did want to handle big-endian ELF files here we should do it
   the way that hw/arm/boot.c:arm_load_elf() does, by looking at the
   ELF header to see what endianness the file itself is

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220823160417.3858216-2-peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/arm/armv7m.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index 990861ee5e..fa4c2c735d 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -572,17 +572,10 @@ void armv7m_load_kernel(ARMCPU *cpu, const char *kernel_filename, int mem_size)
 {
     ssize_t image_size;
     uint64_t entry;
-    int big_endian;
     AddressSpace *as;
     int asidx;
     CPUState *cs = CPU(cpu);
 
-#if TARGET_BIG_ENDIAN
-    big_endian = 1;
-#else
-    big_endian = 0;
-#endif
-
     if (arm_feature(&cpu->env, ARM_FEATURE_EL3)) {
         asidx = ARMASIdx_S;
     } else {
@@ -593,7 +586,7 @@ void armv7m_load_kernel(ARMCPU *cpu, const char *kernel_filename, int mem_size)
     if (kernel_filename) {
         image_size = load_elf_as(kernel_filename, NULL, NULL, NULL,
                                  &entry, NULL, NULL,
-                                 NULL, big_endian, EM_ARM, 1, 0, as);
+                                 NULL, 0, EM_ARM, 1, 0, as);
         if (image_size < 0) {
             image_size = load_image_targphys_as(kernel_filename, 0,
                                                 mem_size, as);
-- 
2.34.1

