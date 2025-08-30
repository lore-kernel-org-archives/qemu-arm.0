Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23C10CA0FFF
	for <qemu-arm@archiver.kernel.org>; Sat, 30 Aug 2025 17:18:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1usNvW-0005Mb-Py; Sat, 30 Aug 2025 11:55:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1usELl-0005tO-A0
 for qemu-arm@nongnu.org; Sat, 30 Aug 2025 01:42:07 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1usELj-00046b-PA
 for qemu-arm@nongnu.org; Sat, 30 Aug 2025 01:42:05 -0400
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-b4c738ee2fbso1836283a12.3
 for <qemu-arm@nongnu.org>; Fri, 29 Aug 2025 22:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756532522; x=1757137322; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kEj8duxAu1Pam82WhtcHKlYlFMg89KDGm3ClOoILo48=;
 b=sc2rhVPr1Fst/iXFm9DjJ9jA1CsfekitiLQhc7hjGgd+tq9PnvlwDd+6G3+bRopXqZ
 PuXNIGnR5UWXYkKrhAFbt5v2amIOATTuSS0l6Fl9w7Su1xrXAgLPbk8i6wuJi3wzK8/3
 1lkXOGuOly8jiReLBMX0hOG9vs9iCEKrb99D1icmn7+/5BQZD7BZL+L8wPtiyN9AKMwO
 sNrpQnr2izSVqogeXBCrkt8tWg0UQO44H/8BukR/OrU5HzWdp02yayMc9hdAgIoKt8Dg
 STEY5R6ce6N8GUm/bHZgJz2ymG7c4OFZHUWLoaZjzha4L7X7PK6OiZqcbplFQnieGE3O
 8uPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756532522; x=1757137322;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kEj8duxAu1Pam82WhtcHKlYlFMg89KDGm3ClOoILo48=;
 b=mHJ1ZZw0Un6iAqALqWvXs9yGfA6txwXuMDgnHu0n1TIu9vxHP4n724g1Pq5R22zGRX
 sKeUe51/wtRAZfxcSfe9WRAPGjiDDMWQtoEjLDnARedCstG1yJSf3OgYZ3sYVcTc9n+S
 KIHSotvFwFA5xp3Q+DfCTDRqXrgodPW49jiNHrqsIiA5o4z1gRPlVLbeC5OY3dfCETuA
 aFOPJ6AvuOiOIDqJIiDYBq9V85IgeiXe7BTZzt2vyYW4In3DTQyD8EZ5ZkADpYpjEZPJ
 MIp0baL7QScSaWceJXNkUzouZwLfrgDxEVBHzvLzS5+p5YW8uYQRFyGZJNHGyxhJpsXw
 acQQ==
X-Gm-Message-State: AOJu0YyxM0VUjaed1Jyw3SAFBnFTsQ7N0o0xy845kpVBjfoCkt1+ie3n
 AePfEkCXVj0RsPemL5QqAR6f18IiMKjilyWgaNuzKNTFCZR3X3rkA4vQOi7ilv58y8IushxfIUE
 R4Emf8cA=
X-Gm-Gg: ASbGncvPj580m6XZzlKVhmYIs6MCIhGwQG542Y+TyEMQA3XJK7HKyaDnT5VaMQ3SGcB
 4SoC19hDM7w9sghUDcq8qw3pBpBSnnn0bTwFVz7X7qZiSZmhdgU7KxMolSgSsCkP7XZAfXIwpZL
 h+PJhI5FsQCdOfXzQD22ug6MoB8cnt4XVQayzfmLim3IMMRZVmqQ2283OWzThJDCjSk2hahKXYt
 46zf0/ra0KKuT2/XREFHjwKcDsvu1oBDWKaAGx8kjczVs66X2m7aejEwSdCq7eOBOSG6+Q8kfre
 EcDqJv5MUPlORgq5z4Mq2mUNoGsgoM0VV+x0WogWqX2khP96mm1E7qBB0M1xSMfmp6YvjgDTgjD
 lbURsicoI4SD/KgpASsGmz2NAUS7fdoe+qW/8SApPilOZDOhWU7RtxzEsImRN
X-Google-Smtp-Source: AGHT+IHPtBOFiEzfRefyZUtWHaBtI2tu0RAWhXNiugpnHWR+ub1KWfwokwz+lWmTlQTScu4hMzSOnA==
X-Received: by 2002:a05:6a20:918c:b0:23f:fa6e:912a with SMTP id
 adf61e73a8af0-243d6e007b3mr1600596637.16.1756532521709; 
 Fri, 29 Aug 2025 22:42:01 -0700 (PDT)
Received: from stoup.. (122-150-204-48.dyn.ip.vocus.au. [122.150.204.48])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b4d96829a66sm2435905a12.6.2025.08.29.22.41.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 22:42:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 10/84] target/arm: Fill in HFG[RWI]TR_EL2 bits for Arm v9.5
Date: Sat, 30 Aug 2025 15:40:14 +1000
Message-ID: <20250830054128.448363-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250830054128.448363-1-richard.henderson@linaro.org>
References: <20250830054128.448363-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
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


