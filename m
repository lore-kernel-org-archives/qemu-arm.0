Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0A23C87FCE
	for <qemu-arm@archiver.kernel.org>; Sun, 27 Jul 2025 08:03:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ufwLx-0005cv-1G; Sun, 27 Jul 2025 04:03:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwLd-000549-9I
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:03:09 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwLb-00042R-LM
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:03:09 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-2350fc2591dso39842255ad.1
 for <qemu-arm@nongnu.org>; Sun, 27 Jul 2025 01:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753603386; x=1754208186; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8MiZSYeSsFc7E9O+r65QuNCOOnlvBtRW+4SiNaYQadU=;
 b=KQyA2TAoBD8n/hNGoC6cBU5dK10t9HKHqr1eTE6oJ5xowbhEKp+5F0xtdAIJGI+23E
 smRUbbJWdKUJeokSepfQ6Zews+mkmURrj6bUEEkFHm3h9pCiFRPvpG+JXNZRHGn2SgUo
 SVHVuijMItOtm7T94jxqrat6PfOVJkfBbNKmXMEmWhrRkDlr+R+tPN89Zb6SbT6qbEtv
 Z+86k71Wqnt4T7MJ7u6oYo9xfQSovgPipbixC+eNxmMcSKWVtFv6nYsSKG5WCEeD9xde
 HDddAU+RM5G4e0raAZVoAxE5fycKEAO57H6Sg7QaertSrh22Lxjs/zT0L5kKzQ4UJ3e+
 pKkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753603386; x=1754208186;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8MiZSYeSsFc7E9O+r65QuNCOOnlvBtRW+4SiNaYQadU=;
 b=JPW0kXRdMM02xY4+Ybt4ZcrApKG3xkWd/ifuafg8JNVwZ4KO7HiDPrR3657TRaYGBJ
 8NZwN9peaL1+NQj8XZ6A+Oe42EII+Exzr74bXIHAJhNn0p4LHxCcJbHhRI/nv9WF4wh6
 qa5O5PmHN5aYdE/MWQwKMB/Mkt0+5/rIcFrwBXaeF2mnVt6W8/PudEyIpVE2FsPVcBhC
 4zxFEfIVnzJAako03EUwsrmAwg4JD0exmKOTDmTfL6Rj5R5xUepqFQbQ40by1IHe0gWb
 nQRH386hfiix1u1Or67eK6N4KQu4dQOCzco4HDmUdr7eo+jLzZ+TLf3HLs/HnxTdRWLK
 8zFw==
X-Gm-Message-State: AOJu0Yz+ESAV6KZe6vgVG2wA6sYNbJWRoOm8sY1kVl/g128+LP9uLluw
 Xw+Pkt/OmjF9wTGaUI6KnwmK6vdW0Q7aRoxAR9qjQR1S8uOhkSiW4TYq+75K7P+WK2JnV58eM4b
 wWHus
X-Gm-Gg: ASbGnculBePFtTcyTF0JPg/12WwryWsnVSkabx9Ud1Hz2oYzkfaPzgKsRgQelTjF9EW
 mP3C+TJYwntutBja1MSNye21c7bVpGLXkiBpCJaZFy5WrbUjjJoOl52gppvCcuPUjkbSS3c7hWR
 01rxMkiKQKiYHCG1CuGtfLTG/57S/2cv7nDIcrIsp2QgbqfLL0e9k2EEcESJ9j/JiCpfDYXXAGz
 5Hd5Hhas8ceVrM/zI9E2WqjvYv5f2lKb712sfBVVJuUh0RrSRQ7V14Cs0IZCLZmnOIj+KvUhkqV
 +qsRZ40KEvwJQ6usbVVv9G8VMu0Esk9uEaFYfAZCX1OhMr/0i3Ndw0OzfVwOCfZH3A7dONYZX3o
 Jvz4n/ft2DpMqBhSnOuyPRxIjNPtqCh1G961OvIu3d3kejZoypgeKJ2CH/uzZp5/2wvkUl3CKUd
 tVts/KUKNd+4hs+Nw5tGkv
X-Google-Smtp-Source: AGHT+IGCBfsvDo+Ox/F9r1qUIPnELctXG8FwQaMQtr8h36eOuqUep7Cl1gVafQGxVyTltvkhmMQgAg==
X-Received: by 2002:a17:902:cccd:b0:23f:75d1:3691 with SMTP id
 d9443c01a7336-23fb2b5c028mr105140895ad.15.1753603386224; 
 Sun, 27 Jul 2025 01:03:06 -0700 (PDT)
Received: from localhost.localdomain (syn-098-150-199-049.res.spectrum.com.
 [98.150.199.49]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23fbe333efesm30016415ad.65.2025.07.27.01.03.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jul 2025 01:03:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 07/82] target/arm: Fill in HFG[RWI]TR_EL2 bits for Arm v9.5
Date: Sat, 26 Jul 2025 22:01:39 -1000
Message-ID: <20250727080254.83840-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250727080254.83840-1-richard.henderson@linaro.org>
References: <20250727080254.83840-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpregs.h | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index c9506aa6d5..1d103b577f 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -408,10 +408,19 @@ FIELD(HFGRTR_EL2, ERXPFGCTL_EL1, 47, 1)
 FIELD(HFGRTR_EL2, ERXPFGCDN_EL1, 48, 1)
 FIELD(HFGRTR_EL2, ERXADDR_EL1, 49, 1)
 FIELD(HFGRTR_EL2, NACCDATA_EL1, 50, 1)
-/* 51-53: RES0 */
+/* 51: RES0 */
+FIELD(HFGRTR_EL2, NGCS_EL0, 52, 1)
+FIELD(HFGRTR_EL2, NGCS_EL1, 53, 1)
 FIELD(HFGRTR_EL2, NSMPRI_EL1, 54, 1)
 FIELD(HFGRTR_EL2, NTPIDR2_EL0, 55, 1)
-/* 56-63: RES0 */
+FIELD(HFGRTR_EL2, NRCWMASK_EL1, 56, 1)
+FIELD(HFGRTR_EL2, NPIRE0_EL1, 57, 1)
+FIELD(HFGRTR_EL2, NPIR_EL1, 58, 1)
+FIELD(HFGRTR_EL2, NPOR_EL0, 59, 1)
+FIELD(HFGRTR_EL2, NPOR_EL1, 60, 1)
+FIELD(HFGRTR_EL2, NS2POR_EL1, 61, 1)
+FIELD(HFGRTR_EL2, NMAIR2_EL1, 62, 1)
+FIELD(HFGRTR_EL2, NAMAIR2_EL1, 63, 1)
 
 /* These match HFGRTR but bits for RO registers are RES0 */
 FIELD(HFGWTR_EL2, AFSR0_EL1, 0, 1)
@@ -452,8 +461,18 @@ FIELD(HFGWTR_EL2, ERXPFGCTL_EL1, 47, 1)
 FIELD(HFGWTR_EL2, ERXPFGCDN_EL1, 48, 1)
 FIELD(HFGWTR_EL2, ERXADDR_EL1, 49, 1)
 FIELD(HFGWTR_EL2, NACCDATA_EL1, 50, 1)
+FIELD(HFGWTR_EL2, NGCS_EL0, 52, 1)
+FIELD(HFGWTR_EL2, NGCS_EL1, 53, 1)
 FIELD(HFGWTR_EL2, NSMPRI_EL1, 54, 1)
 FIELD(HFGWTR_EL2, NTPIDR2_EL0, 55, 1)
+FIELD(HFGWTR_EL2, NRCWMASK_EL1, 56, 1)
+FIELD(HFGWTR_EL2, NPIRE0_EL1, 57, 1)
+FIELD(HFGWTR_EL2, NPIR_EL1, 58, 1)
+FIELD(HFGWTR_EL2, NPOR_EL0, 59, 1)
+FIELD(HFGWTR_EL2, NPOR_EL1, 60, 1)
+FIELD(HFGWTR_EL2, NS2POR_EL1, 61, 1)
+FIELD(HFGWTR_EL2, NMAIR2_EL1, 62, 1)
+FIELD(HFGWTR_EL2, NAMAIR2_EL1, 63, 1)
 
 FIELD(HFGITR_EL2, ICIALLUIS, 0, 1)
 FIELD(HFGITR_EL2, ICIALLU, 1, 1)
@@ -512,6 +531,11 @@ FIELD(HFGITR_EL2, SVC_EL1, 53, 1)
 FIELD(HFGITR_EL2, DCCVAC, 54, 1)
 FIELD(HFGITR_EL2, NBRBINJ, 55, 1)
 FIELD(HFGITR_EL2, NBRBIALL, 56, 1)
+FIELD(HFGITR_EL2, NGCSPUSHM_EL1, 57, 1)
+FIELD(HFGITR_EL2, NGCSSTR_EL1, 58, 1)
+FIELD(HFGITR_EL2, NGCSEPP, 59, 1)
+FIELD(HFGITR_EL2, COSPRCTX, 60, 1)
+FIELD(HFGITR_EL2, ATS1E1A, 62, 1)
 
 FIELD(HDFGRTR_EL2, DBGBCRN_EL1, 0, 1)
 FIELD(HDFGRTR_EL2, DBGBVRN_EL1, 1, 1)
-- 
2.43.0


