Received: by 2002:a17:906:6dca:b0:989:33b4:be89 with SMTP id j10csp244630ejt;
        Tue, 20 Jun 2023 05:46:43 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4jFS4Cd10ykMX6XSLQrqmukJUiU2sYclka3arNV4WaWPuPS6XZJIFZJTA1gUpREcFvYW/Z
X-Received: by 2002:a05:622a:1a9a:b0:3f9:eff6:c48a with SMTP id s26-20020a05622a1a9a00b003f9eff6c48amr16716856qtc.17.1687265203326;
        Tue, 20 Jun 2023 05:46:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687265203; cv=none;
        d=google.com; s=arc-20160816;
        b=IUm4vldcAYYlNzZ4fhYn3BQP75dnGqjYXk5/c/xH5KPjN88yWLjfRo5EFfLrFQ93fW
         oOEztjdPDalSLSvIWMJ2sFX4nwm8ayaJjxhMi4VHEPWdWLFS091cHdwZLZUXGdxh/dVJ
         dZN25ID+z+zU1DjEBznlbRTaJ84ydpM+/3Zn+Xdp+3qmIzkecAQ3/fg3OlUu0H3OXtUe
         tIWGKe5xmWS5Y/6Ndkz8aT6bCvJRGkkpRqWTLW1TzW/9R/b4jEMfzd/BDNj0Ob/y6dBl
         JYU/BtYGQismyZ2xrRbqW2CiMBX9Iv2NOC56oa77SmuO+h7OFhhAmJsvLSTJDIzEmKXL
         aTMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=oYM1MGsrvUKsckHAPaAPGoH4M7K9gyTZzZ7Te/btT8c=;
        b=qEdaOG7kgpR/zkOm2XrCE4Belbe7p2kqXXSEwdkRn9z5YyuAyrDz3Mq2HS487XR/I8
         FAnEUcvM7slIlLHX6GixQO3kDRvEZ8PXkHbSMW1K2n30lkY7eCHGYcHibD8Lo2H96rPR
         Te1/Sxmf/0rClbaaWGXgUYi6ig/q8b2rcVWFxZfEpEnH0+4yQmTzgwFg6Y4yKjLjAq9K
         Gfz0YnRh5NtYpxCmXTDp9t2BvUcmA0tAtGtinprdwu27oOx6C3nUyyvxrmlF9VJR0e5V
         bi84VqC37x8cmrXIFuo6E5Ir2vm+Iv9WHEf2oGoCzDbWlQ+mYMcYhNRgFR+I6cMEltV/
         CMUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SPEhzb+A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s4-20020ac85cc4000000b003ff2fbcaf93si296973qta.757.2023.06.20.05.46.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Jun 2023 05:46:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SPEhzb+A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBair-0001Z0-1X; Tue, 20 Jun 2023 08:44:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBaio-0001VW-GJ
 for qemu-arm@nongnu.org; Tue, 20 Jun 2023 08:44:34 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBaik-0001x1-W5
 for qemu-arm@nongnu.org; Tue, 20 Jun 2023 08:44:34 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-51a2160a271so5888081a12.1
 for <qemu-arm@nongnu.org>; Tue, 20 Jun 2023 05:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687265069; x=1689857069;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oYM1MGsrvUKsckHAPaAPGoH4M7K9gyTZzZ7Te/btT8c=;
 b=SPEhzb+AdollQEdp3HX3JQng19/ma3XyjwJu/ePJtiDKhVTRacJ6/IdiRWMmq7MBQS
 8dJxjPl5dntKq9/RKDy5u+jxkbxUVZD0yjUrag1fhz4PpMoiEDzIc2h1tqfEtOaw4y1k
 BLrRKX+q/rpqmRur/b43tKby7fEvfYoJgNNmMX2aY/Mk/CNSfiK0gmvaggfsmg7csMsb
 Dh74wMgm9LAIrsUAO0El4YiB9l7KJ/X496LD2S66hx3utVPznB77ZY9RLxW2dGoz0dw3
 hDUMCWeYBKZT33If0FObhaue+nYHgmXNlav3QZ+YXbWxpYpM+qYOXkNbrBYC/3ZJYm+z
 t3tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687265069; x=1689857069;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oYM1MGsrvUKsckHAPaAPGoH4M7K9gyTZzZ7Te/btT8c=;
 b=C8mdHW961hiinBYxQmYwiQ28nLjW0JCAaMggQNDGIO70lsD9DCYjJrsCUlirpZcHoy
 GGGTnN/i0Lp06KoLFJdyzmKVwM7tg+RwGu7yxYDLghZY/rKVdxJd1X26F2OAdd5XUKCk
 qLQx8EVDBrkkXgaO1xAPbCPFatCGFE0PMBhYsFIJd60kCazItQtAlyrB7gqXQBIuNBOp
 mceU94xqan5Fxe7RZlpB3spthJtyA9bbXOtHJHTS528xy85XZtF5vkjjmE+LQ3Ckjuvc
 UA6KbcoQhmyYVCJYp7T2fL/CMCii2pJi21ekclXnIrKVgW2Y7c0ZIs60egODQb/XIalP
 wcqw==
X-Gm-Message-State: AC+VfDwG5lmIWkG/mhloW3U4C61eOAXSWeXFycDjVkGPsmc/D1FDHjUX
 8E3N4Ws4rAl3Fe/wK6nFSCZWGQ==
X-Received: by 2002:a05:6402:1b0e:b0:514:9df0:e3f3 with SMTP id
 by14-20020a0564021b0e00b005149df0e3f3mr9365963edb.0.1687265068932; 
 Tue, 20 Jun 2023 05:44:28 -0700 (PDT)
Received: from stoup.lan ([176.176.183.29]) by smtp.gmail.com with ESMTPSA id
 w9-20020aa7dcc9000000b0051a313a66e8sm1142541edu.45.2023.06.20.05.44.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 05:44:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v5 09/20] target/arm: Remove __attribute__((nonnull)) from
 ptw.c
Date: Tue, 20 Jun 2023 14:44:07 +0200
Message-Id: <20230620124418.805717-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230620124418.805717-1-richard.henderson@linaro.org>
References: <20230620124418.805717-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x531.google.com
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
X-TUID: zvSjgr1CKMFm

This was added in 7e98e21c098 as part of a reorg in which
one of the argument had been legally NULL, and this caught
actual instances.  Now that the reorg is complete, this
serves little purpose.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index a742bc1826..f7cbb984f9 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -34,15 +34,13 @@ typedef struct S1Translate {
 static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
                                uint64_t address,
                                MMUAccessType access_type, bool s1_is_el0,
-                               GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
-    __attribute__((nonnull));
+                               GetPhysAddrResult *result, ARMMMUFaultInfo *fi);
 
 static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
                                       target_ulong address,
                                       MMUAccessType access_type,
                                       GetPhysAddrResult *result,
-                                      ARMMMUFaultInfo *fi)
-    __attribute__((nonnull));
+                                      ARMMMUFaultInfo *fi);
 
 /* This mapping is common between ID_AA64MMFR0.PARANGE and TCR_ELx.{I}PS. */
 static const uint8_t pamax_map[] = {
-- 
2.34.1

