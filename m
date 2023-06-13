Received: by 2002:a17:906:ae84:b0:982:368b:d395 with SMTP id md4csp535900ejb;
        Tue, 13 Jun 2023 06:35:50 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6wXqfPjC0Vkgasr0Cfr2allWhdrTQG08Jz2KMPbJoauMtVnd2SmnK08c2FuLOxTWvpiDhn
X-Received: by 2002:a05:6214:ccb:b0:625:aa49:9aba with SMTP id 11-20020a0562140ccb00b00625aa499abamr8848025qvx.62.1686663349879;
        Tue, 13 Jun 2023 06:35:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686663349; cv=none;
        d=google.com; s=arc-20160816;
        b=lb+5yR+15jnAGZnes+mJx/cOX93/r3rPiA1meIqM+zDF/PbQzPG+hLFy1v4RV9pjRM
         6vTBueM8dQARiMt1P0y4fqtqxWZ+0WCgx0AZKUlTdAH3hypFeOzxjWNvb6VErvdrCqPK
         rsUEfDgbGx6RpxK5u+zm9BRf5BOgX5NFVamkVJiy3wpmKm0cGvt0hhlTnHDp5MOxZXwP
         PDLdzACYsYisi4cPAztqbtfTKIUvn+V0GCmE+FMJJjLSxi02PkDgYlwZkjZzZrCyaXHr
         jmrtFpMyAKsCuNlxVKwtDbLIbFcpXZBS7vAudeiylCkhPIJbWT6b/Q0+fZbN32grrQuf
         HZMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=HE4rMdwDzn7Z5hU0mldHp9um1gTSDI5fOpSWPoLYcO8=;
        b=dGPDA7Ne8gx2hA19iTJ+Xe2yjbV6dDhp6BUSvE4OBw43kTEiDx+F5/M1POMl7TCDTM
         ERi1gRl1zOwbBCLbuwZltfJTxrCPrdubqnnZ5W88XO7/dWyLG9vRDaeaNx4mGnojCcAT
         v+vM2DeMboU4E035Fsan2uXDD9UylgGjhmZnxJ/4VN9xR7Gppcrzz/S8BKvC7hcVZ4mm
         /9XnvPIJXshma5eVZpE/u2lnWTiBqleDIcOYyGVn7CNu1QgO7CCSXelQQ0YcPaUdxtBr
         jb954qlPphpbgDMbIhg0wIcB0aKxcRRySM9D1frlhDf0Dkj4LczEYOe51ysxuzk5Sw81
         ICtw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qO0Wk4mI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gw8-20020a0562140f0800b006282077b3easi7479941qvb.493.2023.06.13.06.35.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Jun 2023 06:35:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qO0Wk4mI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q94B3-0007fz-AL; Tue, 13 Jun 2023 09:35:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q94B1-0007aO-GP
 for qemu-arm@nongnu.org; Tue, 13 Jun 2023 09:35:15 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q94Az-0002QB-IV
 for qemu-arm@nongnu.org; Tue, 13 Jun 2023 09:35:15 -0400
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-97467e06511so887014066b.2
 for <qemu-arm@nongnu.org>; Tue, 13 Jun 2023 06:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686663312; x=1689255312;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HE4rMdwDzn7Z5hU0mldHp9um1gTSDI5fOpSWPoLYcO8=;
 b=qO0Wk4mIqHnzhNQNLP9LR5c32xCPrPUIGMAF7lcBLHHSnc0q9qbpBy8Jud/I1th9T8
 3b4d/ZyOOK8PV+4yoRM1ngyTX7/uLTegjEsyWeBK3fHH9y4P/SBN05zziEY/WJqvqXc6
 zhGxUtiMpb0pkwXKLJ8MYhwL3mqwczaBsgSjFC7NEGcDD4Gu2+t7sVCQFouKUPpXkmil
 ROCIaLgtxln9B5/HeGddUWuHC5O65NaTkuBmovEh1Fh4ES/cpO4MklBQZk0IXNuaSx5B
 hrZaPCAF5aootiuaDD8Gw1TMcnDv/dqVrfQRUfbq6CDEi6KsSdX0fTRP4HWeU3IMZjDj
 WZDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686663312; x=1689255312;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HE4rMdwDzn7Z5hU0mldHp9um1gTSDI5fOpSWPoLYcO8=;
 b=aEyCPhBbK+xzToA0GW1E5Nx2JiAmFs6pqC0sRBcf2lnk8hHAhh/D/FXj2ctpUkXJJu
 a4ZnzNfFNGhDW+5ZAZ/meZcOyKD15XyNOZBodvQGBkSzwOpLROtLjRJKwUzGNZ0YoFl+
 dk653meonUSZOptwo7et+IswmvjGFNWTfpTf8OWdSFFxBa3/QWfQ6lTN2rup1I7aMl++
 A1P2h/NLy9MpcqI0NdOJEZ6RDKKdVtuR8EHLZPZ1F8aARGDFGuNf/ZwB1UKeAHoFVZUU
 fNVqPPTYTCKJKTeDGfQoFpEfpiAwl+pFZmmI2BOcxYbP6xsY4BorkSELdD4ji1xirwcv
 sR4g==
X-Gm-Message-State: AC+VfDy4qvD5g6ImATQJo6jnKVFD3BCRkZNOwoFnyYR6mUGEJaZrqR94
 W+R+CeCp/MTjA+UqgAqGialYpQ==
X-Received: by 2002:a17:907:7b9f:b0:982:25d1:bfd3 with SMTP id
 ne31-20020a1709077b9f00b0098225d1bfd3mr4198341ejc.15.1686663311927; 
 Tue, 13 Jun 2023 06:35:11 -0700 (PDT)
Received: from localhost.localdomain ([213.235.133.109])
 by smtp.gmail.com with ESMTPSA id
 qt17-20020a170906ecf100b00968242f8c37sm6598096ejb.50.2023.06.13.06.35.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 13 Jun 2023 06:35:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 2/9] target/tricore: Remove pointless CONFIG_SOFTMMU guard
Date: Tue, 13 Jun 2023 15:33:40 +0200
Message-Id: <20230613133347.82210-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230613133347.82210-1-philmd@linaro.org>
References: <20230613133347.82210-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x636.google.com
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
X-TUID: tNzyKCUqrdY/

We don't build any user emulation target for Tricore,
only the system emulation. No need to check for it as
it is always defined.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/tricore/helper.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/tricore/helper.c b/target/tricore/helper.c
index 284a749e50..951024d491 100644
--- a/target/tricore/helper.c
+++ b/target/tricore/helper.c
@@ -31,7 +31,6 @@ enum {
     TLBRET_MATCH = 0
 };
 
-#if defined(CONFIG_SOFTMMU)
 static int get_physical_address(CPUTriCoreState *env, hwaddr *physical,
                                 int *prot, target_ulong address,
                                 MMUAccessType access_type, int mmu_idx)
@@ -57,7 +56,6 @@ hwaddr tricore_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
     }
     return phys_addr;
 }
-#endif
 
 /* TODO: Add exeption support*/
 static void raise_mmu_exception(CPUTriCoreState *env, target_ulong address,
-- 
2.38.1

