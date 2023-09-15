Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp1449576ejb;
        Fri, 15 Sep 2023 11:55:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7vmehM8UmS3/TuLaoYDQSC5ei1ubdD0/fJIwdiQNzLUQaepEucQmmJJeWOEfNAB3kUCVa
X-Received: by 2002:a0c:f310:0:b0:632:2e63:d34b with SMTP id j16-20020a0cf310000000b006322e63d34bmr2905757qvl.14.1694804127192;
        Fri, 15 Sep 2023 11:55:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694804127; cv=none;
        d=google.com; s=arc-20160816;
        b=a3/u25klZLyJplLlgHPk9nbQLcKApU/NOVww4a9zgE8U76qpOIAWKFoTrUIoHoxFuw
         qyQmcsHDmFKxoQmvitBOpXZtz0kbpJZWxgfroawRNwKFDuSAfRFzz0YHQQFLJyrdIe28
         wt33OYVLqhQwUnlW4RsKVlQUw3TTBkfXzA/Ja4CUyNNeuS7w+ASvXThzOPzGN1kYenq9
         7tRltztLeKr2g+HvPyXC4J6jQ/DmyXygCJECl/XUV5OcBxTu7GG/xZ8wrdpqxk+LgiLc
         YRCWDVIzf5LuaptvSsXmxSOXPGnV+A5Lp7KeOklPSU/ewID7t8euroJhDeo88NnG3No2
         Szeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=V/yMeSDg17r131vfOqc2aALDyiRjWqoBE8K57WDmj+U=;
        fh=nwESBDOyclRGtn6Eb3BvmV07s41NPEOkjsujT6WbZfE=;
        b=BxmRNmrIIA9uhTCJX5ddXhGS8FULVfrwAEaVhCcykLcUNU9fmK9W53gPTEIYxoh3Sy
         o1j0T2BMq1fBRw3yQNJr3TwxgxPEk33zzpfkGTuSdpIyjIYaKnC0rIh1KLEPVnYueDpt
         ou2+Q3oq6F08me6Hib29bWrXj7qwqYyOEYhafIdgPffdGGuMNA3H7Y3IWPcmCCsdUejq
         eFHhc8ICczBDn3EHcYk8WjnCQjyIwvRshIWDGO4KMkfVpAIm/CEHXE0qRlNEY8a3kKzB
         UmVkuANlmcQ0r/ukQYOEti7h1zVn+UKPHoJ6yZG4yYJy35tRjUgXrrK7MEAY5HpIbA+W
         zt5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YiQaZDRL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g20-20020a0cf094000000b006564001ff0esi331937qvk.413.2023.09.15.11.55.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Sep 2023 11:55:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YiQaZDRL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qhDyG-0000Sb-C9; Fri, 15 Sep 2023 14:55:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qhDy5-0000LH-IE
 for qemu-arm@nongnu.org; Fri, 15 Sep 2023 14:55:09 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qhDxy-00063R-Cf
 for qemu-arm@nongnu.org; Fri, 15 Sep 2023 14:55:00 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40473f1fe9fso22721045e9.2
 for <qemu-arm@nongnu.org>; Fri, 15 Sep 2023 11:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694804096; x=1695408896; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V/yMeSDg17r131vfOqc2aALDyiRjWqoBE8K57WDmj+U=;
 b=YiQaZDRL7Z8nLtujY1VOR8omCj03jlWBDK5ZVmbTWBH5pjhBavlSgUCIvufFa6pbVp
 4YnPjIXlS1MqyXvA4iZJXAXh4W3/qF8hQpS15WApint6lWX69rHIkqzZMmmaxdt3CIV4
 60FtSSMea5IL6HS9xryc7a16/2m9LAKV2tEOtPWc+9By/SM8TnLGIlYyk6vRc35JgTXF
 KeVlmz3GK/sh+Cgr58ULXQ0l992gkpIK7TJvsUPXtfdeRB4GVCqJG2QF+NZxAJOd/k6i
 7i79Az0vTSi2F1RW/zd290F8MJeaDRE2nk0vkt1QjhZ6O/rCkCVMYgUDODxElU9qHUwa
 FZQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694804096; x=1695408896;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V/yMeSDg17r131vfOqc2aALDyiRjWqoBE8K57WDmj+U=;
 b=O9zvE9PWXMPwd5xgVG94DRk9ZGUSs5fnKavshKF+HbLGfl/JBkMNPOUZVtAZ6NHCjk
 27iSoqR+ISDatPZlFed8ZokX94wrxnXVwyJg0F+JUHpKXLmWJ372nEuWgjyg8wbiihz5
 pM9QzPn0RRSIEEVinynfIzGymctAQqln0ZfoJ5vJw7iqnDYURQKJ9i5ifnPx2omT5Gy5
 ZBpKZAHWIjb0NmPaZiz1+tgST+XqT6P23ppszsgCiAbUl4Sj6aka5iuMAznCRVFXPT8U
 B4vA/JF5uxrtVHB3PYOEWv4V6b9B2Xs9cVLXipkVVWALVF7a66agjLlH6s1QXUfqoAW8
 QHjg==
X-Gm-Message-State: AOJu0YxwnUTssg4XZzLHbs48DHS5xesYszlIo7rpL8fvm5KVU5/ZZTiT
 LkUOT7xign4yyU/QYuh5P1z454gX570Lqn5F3ls=
X-Received: by 2002:a05:600c:2201:b0:3fe:f667:4e4c with SMTP id
 z1-20020a05600c220100b003fef6674e4cmr2417519wml.12.1694804095936; 
 Fri, 15 Sep 2023 11:54:55 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a05600c294c00b003fee777fd84sm5298849wmd.41.2023.09.15.11.54.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Sep 2023 11:54:55 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Radoslaw Biernacki <rad@semihalf.com>
Subject: [PATCH 1/2] target/arm: Correct minor errors in Cortex-A710 definition
Date: Fri, 15 Sep 2023 19:54:52 +0100
Message-Id: <20230915185453.1871167-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230915185453.1871167-1-peter.maydell@linaro.org>
References: <20230915185453.1871167-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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
X-TUID: jJtlhMPbDXMd

Correct a couple of minor errors in the Cortex-A710 definition:
 * ID_AA64DFR0_EL1.DebugVer is 9 (indicating Armv8.4 debug architecture)
 * ID_AA64ISAR1_EL1.APA is 5 (indicating more PAuth support)
 * there is an IMPDEF CPUCFR_EL1, like that on the Neoverse-N1

Fixes: e3d45c0a89576 ("target/arm: Implement cortex-a710")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/cpu64.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 7264ab5ead1..ea43cf3c1ee 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -840,6 +840,13 @@ static const ARMCPRegInfo cortex_a710_cp_reginfo[] = {
     { .name = "CPUPFR_EL3", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 6, .crn = 15, .crm = 8, .opc2 = 6,
       .access = PL3_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    /*
+     * Report CPUCFR_EL1.SCU as 1, as we do not implement the DSU
+     * (and in particular its system registers).
+     */
+    { .name = "CPUCFR_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 0, .opc2 = 0,
+      .access = PL1_R, .type = ARM_CP_CONST, .resetvalue = 4 },
 
     /*
      * Stub RAMINDEX, as we don't actually implement caches, BTB,
@@ -909,12 +916,12 @@ static void aarch64_a710_initfn(Object *obj)
     cpu->isar.id_aa64pfr0  = 0x1201111120111112ull; /* GIC filled in later */
     cpu->isar.id_aa64pfr1  = 0x0000000000000221ull;
     cpu->isar.id_aa64zfr0  = 0x0000110100110021ull; /* with Crypto */
-    cpu->isar.id_aa64dfr0  = 0x000011f010305611ull;
+    cpu->isar.id_aa64dfr0  = 0x000011f010305619ull;
     cpu->isar.id_aa64dfr1  = 0;
     cpu->id_aa64afr0       = 0;
     cpu->id_aa64afr1       = 0;
     cpu->isar.id_aa64isar0 = 0x0221111110212120ull; /* with Crypto */
-    cpu->isar.id_aa64isar1 = 0x0010111101211032ull;
+    cpu->isar.id_aa64isar1 = 0x0010111101211052ull;
     cpu->isar.id_aa64mmfr0 = 0x0000022200101122ull;
     cpu->isar.id_aa64mmfr1 = 0x0000000010212122ull;
     cpu->isar.id_aa64mmfr2 = 0x1221011110101011ull;
-- 
2.34.1

