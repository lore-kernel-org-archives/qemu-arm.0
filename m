Received: by 2002:a17:906:6dca:b0:989:33b4:be89 with SMTP id j10csp245911ejt;
        Tue, 20 Jun 2023 05:49:20 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6Gj8SoalX7HHhfrG5JbMGwLHzd392BUmK4DSe5s4UNBbZKk+lpN+R90bcbVV42VpgrkEW9
X-Received: by 2002:a05:620a:258a:b0:75b:23a1:3641 with SMTP id x10-20020a05620a258a00b0075b23a13641mr15337854qko.2.1687265360656;
        Tue, 20 Jun 2023 05:49:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687265360; cv=none;
        d=google.com; s=arc-20160816;
        b=h6mKPxRcHJ9CR69dXw7rrIq11u9P08vJKZLpznD67oaL/mb9iAcdb/nThwFWiP73NX
         Dh9aeEZLhYUVqttaPFuACMlOo5WTUiIJeAqgSjoIzE8Atg60BuBCvhnH4x0d0Jm6vTVp
         fYdQRqGbDN0lNiX1YIgCAInVCkEXWr4LSF+x/R5Tk/0OV3jlGBrusQvxw/PwAX833pKP
         EP9tIUpaaQ+/rlAFIOvcY5gLaekPul938oucaxVFIp7f9MthCdhGmHAHGyP/RIWVoZOp
         XbeSNFbrGVmnUCWrEE1Zgc0bagN5WlnsRoW/TurogZRmcsXeL/vMuZUIrGHunR8G7LZ4
         lmqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=c5AwidcO4tfQ++xn12IPRLJwHDY5LLSrHnZYAWEeDsc=;
        b=ko2iXAejLW0hZfBs1LpvgdVOZJHi3+qgW71qtqlk2ymnqpUMMv6ROuk8joIReywanZ
         xDmIEVYpwdxeIXX1j8yxaLJZ1l2ElRnaJEx5BFaNP2BBWUKR5JcbAL1puzpQqBKoVVqQ
         O8i8ppgnivWMTOslRuMnmuhzEtxuy68KBAgHTsaJYQUjuA2GzUB/0gIUEQCSJFQo+PT3
         bU6A4kbOffxmiBImyrgkdrz+XItPTu0kjKUBOXDHAPFoZwKC6F7fj9bd3xU2I2yQpv+t
         +yIUs/BmpS1r+L0/FqXKYA1hCwjJZE928vK8CX7/VLXGji3hrmIIrHrTTJ0vyv3irLD7
         vb6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oHA1ewzo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b2-20020a05620a126200b00763a138b76csi794790qkl.188.2023.06.20.05.49.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Jun 2023 05:49:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oHA1ewzo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBaix-0001hB-Sv; Tue, 20 Jun 2023 08:44:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBaiu-0001cq-5q
 for qemu-arm@nongnu.org; Tue, 20 Jun 2023 08:44:40 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBais-00023x-GR
 for qemu-arm@nongnu.org; Tue, 20 Jun 2023 08:44:39 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-519b771f23aso6202996a12.1
 for <qemu-arm@nongnu.org>; Tue, 20 Jun 2023 05:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687265077; x=1689857077;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c5AwidcO4tfQ++xn12IPRLJwHDY5LLSrHnZYAWEeDsc=;
 b=oHA1ewzoXz7Y5z4TTe7NiK1UdbgDTcmyTx0gUwcFk4XhPb3M/rwwZy5/3zKBpS1Qrr
 NO1ixT9nr14S8DGm5Z8nBpCkzs9JcKZAce+6DpxQqiTiqB5pHY9+lNVqZsDw8J+/dxmX
 ckdcD3nkpDpMIJwpiYydp96aLaWIThNjoHjLZc2UDVoU8+dfZSgNmUFKCg6PSCa9WOE/
 k2eu42zaldgLqP2a7RCytLfwZ+yV02tBVBrTvirY1mTk6WuEqDADMoX4nLB7etZ+nu/o
 XQtfmGs+JhOXAOGXtr93661BpmcLJYyyCzxWQhokTgsF67o69VVzhqi8HAKXnwye+HnS
 gwbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687265077; x=1689857077;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c5AwidcO4tfQ++xn12IPRLJwHDY5LLSrHnZYAWEeDsc=;
 b=KH/rIDf8O/xSsTMV5aSD5B6iEb6UIbjevRbSJ+kKIDkVARHhSa+U/rE5CpYZ9RIucZ
 MoxoegIwJifgnkwlyKLUeNOCF3ckQybW6YKmQe29TImsHlDS7XN8NfVh5mzmaCXxzOW/
 UU0uMlNP/87Mmy2a0yMVhxUMH1GxkpVtNCQj6qUu2zvzk2VnlfJ5NGQT4z3dH9WDopyT
 uaDZgW3k2YRzJYILoYwwLmY1A6yuKP6wCDhP5teuIsP/bzQxAxu4sSJeI1szmwnoR9EW
 5QdSGcA4sZ1pwYg2d+tJ+SBflbV9CDcf9f1o/eSHh43VniJTo0pCT9tabbPDVuKdwNHD
 EhEg==
X-Gm-Message-State: AC+VfDxkBSvqff9NY0z/VV03be1lLjgY4eIEjLcpSwLomk4MMoI7f07A
 2ycp1zxWDqK4PfRE+0s2rTW6Lg==
X-Received: by 2002:aa7:cf19:0:b0:51a:313c:4407 with SMTP id
 a25-20020aa7cf19000000b0051a313c4407mr8210666edy.6.1687265077016; 
 Tue, 20 Jun 2023 05:44:37 -0700 (PDT)
Received: from stoup.lan ([176.176.183.29]) by smtp.gmail.com with ESMTPSA id
 w9-20020aa7dcc9000000b0051a313a66e8sm1142541edu.45.2023.06.20.05.44.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 05:44:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v5 16/20] target/arm: Use get_phys_addr_with_struct for stage2
Date: Tue, 20 Jun 2023 14:44:14 +0200
Message-Id: <20230620124418.805717-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230620124418.805717-1-richard.henderson@linaro.org>
References: <20230620124418.805717-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x534.google.com
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
X-TUID: FEJrR2FKp/tS

This fixes a bug in which we failed to initialize
the result attributes properly after the memset.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 558b4b731b..7c4526e2da 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -39,10 +39,6 @@ typedef struct S1Translate {
     void *out_host;
 } S1Translate;
 
-static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
-                               uint64_t address, MMUAccessType access_type,
-                               GetPhysAddrResult *result, ARMMMUFaultInfo *fi);
-
 static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
                                       target_ulong address,
                                       MMUAccessType access_type,
@@ -2886,12 +2882,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
     cacheattrs1 = result->cacheattrs;
     memset(result, 0, sizeof(*result));
 
-    if (arm_feature(env, ARM_FEATURE_PMSA)) {
-        ret = get_phys_addr_pmsav8(env, ipa, access_type,
-                                   ptw->in_mmu_idx, is_secure, result, fi);
-    } else {
-        ret = get_phys_addr_lpae(env, ptw, ipa, access_type, result, fi);
-    }
+    ret = get_phys_addr_with_struct(env, ptw, ipa, access_type, result, fi);
     fi->s2addr = ipa;
 
     /* Combine the S1 and S2 perms.  */
-- 
2.34.1

