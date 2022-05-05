Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1301783lfj;
        Thu, 5 May 2022 12:18:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjfl0SmI77AANTnSjDYQplVwBIy/Nv321BwbOJ+4ayipV9IV0rRZ9bqD6xrnbr98m4RC6q
X-Received: by 2002:a05:622a:5d0:b0:2e1:d430:a5c9 with SMTP id d16-20020a05622a05d000b002e1d430a5c9mr25777463qtb.639.1651778298912;
        Thu, 05 May 2022 12:18:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651778298; cv=none;
        d=google.com; s=arc-20160816;
        b=cRn6k6Y8C/Z8KCKQDJnyjI7iaQ9aN/hsQT/u8gJwHGFdBbEEwX8ODhoagB1Dqdsjv6
         DBhH3y6LdjFmBOppxNQKncHHS8lENEYImhyJmJICRRonS0xpcea6ovO+/FxYQkvmLECE
         az6CwW5JMIblS07x9wyqbjGu8G3a2Z1aiV+xO9gOXx5LPAahMnOltp6oD58uyB679BZB
         8D7QPf8ixW5wmkXi9t7GbcJZ0sKCo80zKHEym1P+Op2HYbrwTCL5zzmAG3PwtiycP6UP
         JkBfh99UKhjfaTuNcfzDfp2MbogGNmvzummujj5IYoTXL9w8//pioKO/CjBTv1kB5G9h
         w7OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=UA0u5zIb+IjVjwjFedkOJVeM7leXzM2MF4hE+Hu/fBc=;
        b=MlIHHd7vMzxdNFbedb/oswh7Ar+TX4Oa+1cnNozwVUCPbbXmdx+/qBvlsXfunEHfar
         xVdRHYLEYy+KVo5sdJytYFP0SfLkXjblhWqjll60ULbkwZ9Xn40uN09ZOy8VNy/0TDJU
         gH1iJR3nKTX+vRdK1lOjFgpNZ/koY3CkAby9ZwnEEDIkbuURkEtVa8pCOwCspzzfv+B0
         FMcKqmIT2ngbfb1eMssk3rjuhbM9v3oDhQ6vmLOyxPAE4Bdi1cxmy2hGTf6bQYx8DiEF
         HlYpctClSty+KtyFu87G9im5Jgr50DwK2fErJGws/hf8+HZhOE9B7QWfcTi3tdnl5jSJ
         8k/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dp44kJCI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w14-20020a05622a190e00b002f366ce2546si1397967qtc.129.2022.05.05.12.18.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 May 2022 12:18:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dp44kJCI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nmgzS-000132-AS
	for alex.bennee@linaro.org; Thu, 05 May 2022 15:18:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmgYZ-0002qR-Cw
 for qemu-devel@nongnu.org; Thu, 05 May 2022 14:50:31 -0400
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231]:47000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmgYS-0004RE-0b
 for qemu-devel@nongnu.org; Thu, 05 May 2022 14:50:31 -0400
Received: by mail-oi1-x231.google.com with SMTP id q8so5238985oif.13
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 11:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UA0u5zIb+IjVjwjFedkOJVeM7leXzM2MF4hE+Hu/fBc=;
 b=dp44kJCItyvzaIgdlYDpsN8be0sKQJNR6F7Bx6SwfWUiUFd7CUbxc20nOoIvLmbgsx
 Jq+Ie4fiEjXbt+EEYaKjJ28sgw8VNf0YL+WMjdjNZ86X8Bg1Le37DNW59PTh2SFl0763
 iiNNpwfEIQ6mEDpA1Z0G/We/J3XwqwGBcCNV6fMQImZ4HwGaSoGoJSeartMY5UxTPlYF
 fIDSCVuoP1C4UxvHFEf7+s4rrUH/Tl8G/efqw4zpbjuZ4Xfp9KEfXbT8nLh5ELWkXJ/3
 aWspqd+5hqqA93Tx2ZA5SjaGAa1Ee0y8yUr9zlOfH6/P18o+60gC9KRhJbRWCI3OoCIo
 jW3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UA0u5zIb+IjVjwjFedkOJVeM7leXzM2MF4hE+Hu/fBc=;
 b=x79FICYOvKLYvD5sUOyBpaHIGTgch+mTXvuhFUUPsnQE3GN4Ji6W+1OSphLZQ6reCe
 3SGebIgNIdjGsEzri8+m3p/WqyCYJNrYjF5XZBYfgqeLnelTCRJQrLq84sbqGhFgZPHN
 bqivefrAH6aXQXjAZMWUEYmhqXrpn9NGEeJhhiF6a2LmVxLuvClgjak//aE8ANDx6D9L
 h+QD3jrsTQhYU9MvVchMHsepcjTL5kFGjpcX+cbqcYGNC87rERtD9ykOqqmFkD8XKGKD
 hhXngA/r9k4OKyodD584+7sw1/mGYQ4MovhZzyUcUJqfSsrX2Duwq5ChAdkkDIt4k5Uy
 v3jw==
X-Gm-Message-State: AOAM532TptpKQ7XoyEgNEGmMe+hXLcF1y4UcDqn2ZJulsd24bdOhWaLy
 4K66y/z03OhM9E/ycTxjmQMTpd9yY2oe6ViW
X-Received: by 2002:a54:4d86:0:b0:324:ecc3:fd02 with SMTP id
 y6-20020a544d86000000b00324ecc3fd02mr3229632oix.243.1651776622942; 
 Thu, 05 May 2022 11:50:22 -0700 (PDT)
Received: from stoup.. ([2607:fb90:5fe8:83ea:bbf4:c9ef:4f3:11c6])
 by smtp.gmail.com with ESMTPSA id
 s36-20020a0568302aa400b0060603221259sm857273otu.41.2022.05.05.11.50.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 11:50:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 10/24] target/arm: Use field names for manipulating EL2 and
 EL3 modes
Date: Thu,  5 May 2022 13:49:52 -0500
Message-Id: <20220505185006.200555-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220505185006.200555-1-richard.henderson@linaro.org>
References: <20220505185006.200555-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x231.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: Fu1D84S8/Jg9

Use FIELD_DP{32,64} to manipulate id_pfr1 and id_aa64pfr0
during arm_cpu_realizefn.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 01176b2569..7995ff2712 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1801,11 +1801,13 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
          */
         unset_feature(env, ARM_FEATURE_EL3);
 
-        /* Disable the security extension feature bits in the processor feature
-         * registers as well. These are id_pfr1[7:4] and id_aa64pfr0[15:12].
+        /*
+         * Disable the security extension feature bits in the processor
+         * feature registers as well.
          */
-        cpu->isar.id_pfr1 &= ~0xf0;
-        cpu->isar.id_aa64pfr0 &= ~0xf000;
+        cpu->isar.id_pfr1 = FIELD_DP32(cpu->isar.id_pfr1, ID_PFR1, SECURITY, 0);
+        cpu->isar.id_aa64pfr0 = FIELD_DP64(cpu->isar.id_aa64pfr0,
+                                           ID_AA64PFR0, EL3, 0);
     }
 
     if (!cpu->has_el2) {
@@ -1836,12 +1838,14 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
     }
 
     if (!arm_feature(env, ARM_FEATURE_EL2)) {
-        /* Disable the hypervisor feature bits in the processor feature
-         * registers if we don't have EL2. These are id_pfr1[15:12] and
-         * id_aa64pfr0_el1[11:8].
+        /*
+         * Disable the hypervisor feature bits in the processor feature
+         * registers if we don't have EL2.
          */
-        cpu->isar.id_aa64pfr0 &= ~0xf00;
-        cpu->isar.id_pfr1 &= ~0xf000;
+        cpu->isar.id_aa64pfr0 = FIELD_DP64(cpu->isar.id_aa64pfr0,
+                                           ID_AA64PFR0, EL2, 0);
+        cpu->isar.id_pfr1 = FIELD_DP32(cpu->isar.id_pfr1,
+                                       ID_PFR1, VIRTUALIZATION, 0);
     }
 
 #ifndef CONFIG_USER_ONLY
-- 
2.34.1

