Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp4133413eje;
        Fri, 14 Jul 2023 08:48:38 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHMFLxvmbeIAmzsQq+/ePyQWSMWpwpofpoAsRxTu7sv2VysnLdtlgk+i+TKvHvYOZJd1FmJ
X-Received: by 2002:a0c:b399:0:b0:636:34e2:fada with SMTP id t25-20020a0cb399000000b0063634e2fadamr4042768qve.23.1689349718141;
        Fri, 14 Jul 2023 08:48:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689349718; cv=none;
        d=google.com; s=arc-20160816;
        b=pJwtPZxujMu606bg9QRlcgUdaH+Y4hHsJ9v78a9rW/XyADo6djw0BqWX0nhfhkIi3B
         UZvbSBjJr1df+rWfmKjFmdtUEmm5DEb77zknvYYHlijEx9il8UBMnTltphfTBsHGKZMI
         T6dUGPnew/xZnGpmaJ7GtLZC9xB08IOJ3WCyGw0PLuJwVldGIUReuZE0PCq3VtYmOJ5X
         7M7d3ttu1yRlCoQ1XPJvxr1L5Mgk+B/Tl1AJOQx+dKqnAfD4BKPL/FCpWNfI0O28dWCI
         1duzsLNA4RPnMjelm9K4v2pOtklG/OZHdfZhq1Os4TkBRlHsqJcnRVxHE+2KdaX0FnwD
         WW1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=CiH9E7mBgPKZNIpdmx/tPxEyFtaNkc5RvSs8kkQDWdc=;
        fh=jvpdohKmRoZMO537s6xMKXXtj7EZws1LOMQI/oP4vXs=;
        b=xpZs7CCoa6AYwc4q/wPEAMAbGlyq8aPPD+rN/JyoK3bXBpC5uuEiQYnRO4QycE6vKS
         w51Ve8CKQcGVOHvUrgcWs/Bs5iQ1PIWETseV2MJ2pdqHdrhc5HROCnWudXpgKqiPT/lF
         J2wGsH59X0xSFPWQVvyAP/wwi6JhRPX/ArZPZNtJYYIrsr2Kgn5N+GqfHTjGoho43GEb
         kEHm02PBsU+N/eE/cp1TEbJZwfXXKAa9kDRmliHu7wDP3m4o/nkkS7TM6BmK7j96njBj
         Fm7C6vFLdNtAzYKlx1XJFSH/iDlqm8a8gKLEUECfv5+IkGcSmgKp6GofY9rLxqV1m97a
         hyig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tpB8rFst;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u11-20020a0cb40b000000b00625ad2b66f6si4613996qve.84.2023.07.14.08.48.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Jul 2023 08:48:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tpB8rFst;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qKL0T-0007Bq-JX; Fri, 14 Jul 2023 11:46:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qKL0S-0007Ac-CO
 for qemu-arm@nongnu.org; Fri, 14 Jul 2023 11:46:56 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qKL0P-000752-Hy
 for qemu-arm@nongnu.org; Fri, 14 Jul 2023 11:46:56 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3fc0aecf107so19222475e9.2
 for <qemu-arm@nongnu.org>; Fri, 14 Jul 2023 08:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689349612; x=1691941612;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=CiH9E7mBgPKZNIpdmx/tPxEyFtaNkc5RvSs8kkQDWdc=;
 b=tpB8rFstuTaj78dYKDrQspXQtsizJgJ7WV8QOo2zvitmtF1J9ZH66aMCgaSA2AkKh2
 dS6mEpwAN633lp2na70fjxlvG7zHv+ZmKDo5ByWGOvZOv2bjvaRJmJZHGEeY4rXY0eSw
 aW/Drf/wwutJP5GsWx+oM1Eh5HrJqL2Y4mbbaSGBeavhH2F90k4lIzVyIOQbxhlwZTKd
 F4Y/v4r6HIvlL1ETInKGNlW8P7jYj07omVAgRWkN7+OkHSFDAOVQdNn67Cq68TRTYeox
 RrPihxoH929hsils3WgrhsaeKNZ8K1jKQJTKy0KLl9zmwZFvIQ2U54WN8nSeNSrMfD7q
 6u0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689349612; x=1691941612;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CiH9E7mBgPKZNIpdmx/tPxEyFtaNkc5RvSs8kkQDWdc=;
 b=iwVhhtuwmgEwcTPyqcXNbv48uxQJJJmcAeMWEc8HnT/SMk0C8sROgX9Mj8/I4O7w+M
 Eq3UyLJJL+v6GaNm+aGd4VLSM90seeB6VhwqcZ8fU2FtnYKMCGN6gbgve9p5Dwcz3cpT
 /a6RlWoB8/LuTcksMIq+fm1Am1rFtYumKGq7WYxxumVqo7odwopNmCC2FuTLgtV1cETm
 XSAHO2FXQxtH0aQHTsaYwXoNvwNRBCdJuughbWHTaGKIwdvmbRDCn+wcwIR3uYsS7PPe
 y0gDF3hAlITbp3QPiXthV2P32aCqspLYUF56v4Bl21NWMWUqrlYUw8n666tqNesbFHRY
 uTqQ==
X-Gm-Message-State: ABy/qLb/jWB7ImIVSIma/ZOmFJSQ9SWb82nEgYRuBx1lsrIY5DISQ9Xl
 xZHm6/abrJEnvxJG5m6RUuspID0BIDZfckDMW/A=
X-Received: by 2002:adf:de12:0:b0:314:30ed:9b55 with SMTP id
 b18-20020adfde12000000b0031430ed9b55mr4580983wrm.15.1689349611418; 
 Fri, 14 Jul 2023 08:46:51 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 t16-20020a5d49d0000000b003143bb5ecd5sm11214025wrs.69.2023.07.14.08.46.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jul 2023 08:46:51 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 01/14] target/arm/ptw: Don't set fi->s1ptw for
 UnsuppAtomicUpdate fault
Date: Fri, 14 Jul 2023 16:46:35 +0100
Message-Id: <20230714154648.327466-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230714154648.327466-1-peter.maydell@linaro.org>
References: <20230714154648.327466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: gmPonPKbGIGU

For an Unsupported Atomic Update fault where the stage 1 translation
table descriptor update can't be done because it's to an unsupported
memory type, this is a stage 1 abort (per the Arm ARM R_VSXXT).  This
means we should not set fi->s1ptw, because this will cause the code
in the get_phys_addr_lpae() error-exit path to mark it as stage 2.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 8f94100c61f..bafeb876ad7 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -701,7 +701,6 @@ static uint64_t arm_casq_ptw(CPUARMState *env, uint64_t old_val,
 
     if (unlikely(!host)) {
         fi->type = ARMFault_UnsuppAtomicUpdate;
-        fi->s1ptw = true;
         return 0;
     }
 
-- 
2.34.1

