Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp1275606lfk;
        Sun, 17 Apr 2022 11:14:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxrf1hgRTi4m8eNaR/lEw9fG/CCmE7x3bINsuM9LQGoiN9jyy21/ek2x55sUfRrisifc7LF
X-Received: by 2002:a37:68d4:0:b0:60d:f4eb:fc12 with SMTP id d203-20020a3768d4000000b0060df4ebfc12mr4581491qkc.413.1650219268504;
        Sun, 17 Apr 2022 11:14:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650219268; cv=none;
        d=google.com; s=arc-20160816;
        b=kVyWtJFUyya5XlGULuOX/+BpMMS2LyL75Z9OW5Vjg3Qxe/3eihugGM8cZknM7NBpg3
         ryMdbkKnnMT2YW+lULM1P0uZZ+oSOlwrQyPYz8R+Yx5jXS+sFveMJmPH0+bPGUFMClXs
         g0qpV9HMgke7JVSFfeqh9J+ETgmW4jqZeR8yZVj/dnAlOQ1FOca2uEiFB2ahk74rm7zy
         IRjHjCFyFWisaJ7INAsYqTVvb0nd1OtBkoN29ugXnEPuTCEc1KAytLVpCi92FULa+vxW
         2BM4jqJRfI8NkhNRgNSGC8P6/kgo5bM/Rb4PGiRdcE5r+QJZ0rnr/1pud4ga3YN8Ihtt
         mXMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=xLPmYgqDe1CN+qFThm+PXn8LkgCmKzZ27jOhFMTIeFk=;
        b=UcC7+rr04vXhl/3O7Pl5gO5qDSKZ0KHIWj/hsVZmnayQi35PCTDg37WyfYNGQc8P12
         eBzOEn9x3JW5WUrTajgxpBasyNzOMrDJHsL3Zkb1gVY1bjL5/ExU9TMoi5Nc7o9zkSze
         A2LZAdGoxa/0Q9576uHnzsm5jh0bGRGjrPTPLZvEJWd+e9+HGEjbrS8yJWmH/iuTj1ru
         N9sEQQTcjPgRXwPkmSNWLP87VqCR0quYCVejDfFuM8eXuoPeYIHd8GFpwbWfwbsm9U1V
         Q5ThLgVklOFcoOdQpSIudWogMSkunynfleCZwUIf78diSh+2+CKHm/KVu0pU3+3N3rJi
         CE5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yPoF9KWz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k6-20020a05622a03c600b002e1fbf3beefsi2411014qtx.224.2022.04.17.11.14.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 17 Apr 2022 11:14:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yPoF9KWz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ng9Po-00005J-0S
	for alex.bennee@linaro.org; Sun, 17 Apr 2022 14:14:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng90O-0004Qv-F8
 for qemu-arm@nongnu.org; Sun, 17 Apr 2022 13:48:12 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:34714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng90M-00042Z-HE
 for qemu-arm@nongnu.org; Sun, 17 Apr 2022 13:48:12 -0400
Received: by mail-pl1-x62e.google.com with SMTP id n8so10765288plh.1
 for <qemu-arm@nongnu.org>; Sun, 17 Apr 2022 10:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xLPmYgqDe1CN+qFThm+PXn8LkgCmKzZ27jOhFMTIeFk=;
 b=yPoF9KWzys3/WPeMOlwKtIfxR2KTN/W6FHj9xpcKodjmop9nihstHGsGy6LHWRaM1b
 a2DLVl95EF3osz00hw4zPAyyEXFvOCS4HGJHGq48/JnWq26d9A+rpwit2bDVWP/133Jq
 NIwopTiiSpaNCQWLhP8XQXv6neFcJ2IBudaqAGfCw1Z13EthoUD7jyS1nfDNDUR0C0sC
 d/ID/32E/tXpFegCZs/YcKnF6UsH3jm3W3Kv2vUTgjq8dUhXO0x3bZhNOlLLAq0/5zKo
 UF7rmHowu2KAxhkFMc7bD8e589hXv9mdN8kU16B9YmpGXK6gPvSKlT5jrGK0xuqR9Eng
 vYcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xLPmYgqDe1CN+qFThm+PXn8LkgCmKzZ27jOhFMTIeFk=;
 b=xjlGdPdFKFY0RUORU0liICTWGSkoLCSjTzrNRpONNydKEKH8YyVv6k3+fUMVQGdo5L
 /agRmiezDtE2Dm9DJAjDXAzgQYmamu2Cts136rqftYeeWzO2Np8Y1tOei3w/yc939sYT
 atrpYpl5kpnguUFjcpn3vrHiQnJ4xT2lPPPuLSItKynCQ94TBf8jALv7+447sZ76+i7w
 CRBv4H5ob2h2XYlP7J+KQCCc6aOYehC2Nfdz5rqCwrMtNUv2TunmlVbv5UHAB2rDcAUX
 IvTM0ZMzbojUIk0nn6XeniHzlq6NRNbklFea6qdSIhISM7QiDbr82dyDPsPmQFkcfIKW
 MdJw==
X-Gm-Message-State: AOAM532vyEmw7N6tjw4CJmNNeAa3CD+29WhQ15V1XyvpzZt636WW1H9O
 uEmijizh7SlUexUbiCSCAw0Ymg==
X-Received: by 2002:a17:90a:6c64:b0:1cb:a150:52d with SMTP id
 x91-20020a17090a6c6400b001cba150052dmr9133416pjj.111.1650217689193; 
 Sun, 17 Apr 2022 10:48:09 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 e14-20020aa78c4e000000b00506475da4cesm9372055pfd.49.2022.04.17.10.48.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 10:48:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 45/60] target/arm: Use field names for manipulating EL2 and
 EL3 modes
Date: Sun, 17 Apr 2022 10:44:11 -0700
Message-Id: <20220417174426.711829-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417174426.711829-1-richard.henderson@linaro.org>
References: <20220417174426.711829-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HgpeALBl0BR8

Use FIELD_DP{32,64} to manipulate id_pfr1 and id_aa64pfr0
during arm_cpu_realizefn.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 3da8841eb2..33451cecf7 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1782,11 +1782,13 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
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
@@ -1817,12 +1819,14 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
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
2.25.1

