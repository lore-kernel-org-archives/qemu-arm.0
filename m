Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp4122741ejb;
        Mon, 6 Feb 2023 04:18:40 -0800 (PST)
X-Google-Smtp-Source: AK7set9nd7yCyfhtwKCT9FijwaERDAQq+cQlSBBFTTRhkbHZzLIESauKmS5MbLpWApF8lBTByS1/
X-Received: by 2002:a05:6214:1c4f:b0:56b:ec70:eda2 with SMTP id if15-20020a0562141c4f00b0056bec70eda2mr13663140qvb.42.1675685920368;
        Mon, 06 Feb 2023 04:18:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675685920; cv=none;
        d=google.com; s=arc-20160816;
        b=LkqUI7iByuX1jEZukfvVcDp/IzCv/h0PGkK2QpG8jJylB99mSH2Xg0HB6Az5X0AYfA
         TXC9oAwSL785/HbmL/m8b3otvPsIhcRD6SXrjLuC3acv85ToJgVBuPo/vzRGxQUV5ka0
         lfyL2WXiR3QycdO2MFolTPQXeenwhwDQwaYInrpLWRBI4/PwCnuO9Wi625LRO79jth84
         WHUnwaCxI7q9rTyZ5D0lcfaZiH5IDpi3DOCOk2alxliaGUYZm5/uPgnzeikvSHjTnnlo
         CF82P1uUM2+3flqnwjlqU7UcZRR2i0M3LEYVXCt8SBWwCBTYybteD8Ats7D2YppnNzun
         VWSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=LXO14j3VKdWe9oMd0XtD7rpE8pnbdCJDTrrJ4g32Du4=;
        b=sGhL7XVfE8qDKFEgOfrNsF92MQCnaHfoml5DaIW52ojju/5uGpOKogm8BcGpAREWTQ
         2w9eCOdqDMn6xYGVnyx71z6OpZCHJH9ajq2YL5D4fVKnjJXj3thKnmhk5YY8hAQf1mQi
         cPqJ3PC2DJYdWG9gMfWyjREKHH5sk6hBe1FZE3x6aTUtsNP62SYB+Hih4cqtGZzUZP6b
         eY93w7OATmGFfhp8BrIaSVtIFjeLPhC+bSjjXkLwiUBrtmp70O43v5MswXINMfdusmyf
         HIaL6/jde+krSOJSXVL/YWrH6jBsEQBPu1HArXFxhSQ6X0NpEq5n0w9cZgm2Nq0J+lcn
         ewnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tTqa5kVv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g10-20020a0cd7ca000000b0053777b28b0asi7472024qvj.76.2023.02.06.04.18.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Feb 2023 04:18:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tTqa5kVv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pP0RV-0007oe-86; Mon, 06 Feb 2023 07:17:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pP0RM-0007ka-7g
 for qemu-arm@nongnu.org; Mon, 06 Feb 2023 07:17:45 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pP0RH-0005pB-4h
 for qemu-arm@nongnu.org; Mon, 06 Feb 2023 07:17:41 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 az4-20020a05600c600400b003dff767a1f1so3341880wmb.2
 for <qemu-arm@nongnu.org>; Mon, 06 Feb 2023 04:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LXO14j3VKdWe9oMd0XtD7rpE8pnbdCJDTrrJ4g32Du4=;
 b=tTqa5kVvFUNGGqkuqndZaNDJTdCWxd3s4VkuhG/TI6WVUpJc1szlYoYwXLBPxAtehA
 huEnWvFDeUMDjN7s99YhxD6GWODnj3FFG1pXySaJtyDX1Qh/jGjhyW4DbQBJpZlbPBc4
 xRLSCv8nxB6e6JUVbCTrfG2CugyiSIWj6WFIKKajBGSeIv0L/6FobLAiBaBHsj/vDdg5
 +gjjdVSPFsXuaPS1CLPDJ8fI8gzyTvxKR2PQVfup2BGktGfQySGULEZUqXLALb1tG4XA
 COfSxzqnWeMTepnxH0Y+GVlasx38Xik7xWzA4I4yJJjuFV5dlWDWnwGFCyOt66RUuQHq
 +fAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LXO14j3VKdWe9oMd0XtD7rpE8pnbdCJDTrrJ4g32Du4=;
 b=BJAfuSWOI5tj8/8WLZp444QsawQdFOx9CUg9g9CaY8B1TCldQbMA5xa73ulWAinTn/
 BMgn63BNTBED7wT310Eu3nuXoKGA6QV9aiMQd1M/bnGrpIjRrn0g2g4GN3qBJJtEuksz
 jc15ELNZHbdu6r0HmQLO5UbbKPJhcyMxkh8ddnPQgnbYa4vdg8Uerzrbdk75+JrSfxlN
 BZZ0mr6u1Hy4ihQLYKF5V5VvGx4zERe6fWR+TUciaS83GfxH+CpovfJtvmbrVLlauE+C
 s0kdVmzZG5gjb8RnFrosgsFRhfJiDB01kpw/ThPNlkGVFYkPf7tE+Au0OMczzBtHwUiy
 czCg==
X-Gm-Message-State: AO0yUKUOCqoNUbGSmO7yW2QuMNcs5mlCWsMwa+41rNO0NzrzeS45gfyk
 CX8i/haf10oUyVx3NAumucaANQ==
X-Received: by 2002:a05:600c:3d92:b0:3df:e468:17dc with SMTP id
 bi18-20020a05600c3d9200b003dfe46817dcmr13312294wmb.40.1675685857362; 
 Mon, 06 Feb 2023 04:17:37 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 bg24-20020a05600c3c9800b003e001afa274sm2564647wmb.2.2023.02.06.04.17.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 06 Feb 2023 04:17:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 4/9] target/arm: Restrict CPUARMState::arm_boot_info to sysemu
Date: Mon,  6 Feb 2023 13:17:09 +0100
Message-Id: <20230206121714.85084-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230206121714.85084-1-philmd@linaro.org>
References: <20230206121714.85084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: mLcKAJg3fNC8

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/cpu.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index bbbcf2e153..01d478e9ce 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -770,9 +770,10 @@ typedef struct CPUArchState {
 #if defined(CONFIG_USER_ONLY)
     /* For usermode syscall translation.  */
     int eabi;
+#else
+    const struct arm_boot_info *boot_info;
 #endif
     void *nvic;
-    const struct arm_boot_info *boot_info;
     /* Store GICv3CPUState to access from this struct */
     void *gicv3state;
 
-- 
2.38.1

