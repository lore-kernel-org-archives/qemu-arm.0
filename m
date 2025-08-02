Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C09E2C87FC9
	for <qemu-arm@archiver.kernel.org>; Sat,  2 Aug 2025 23:34:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uiLi3-0000fD-V4; Sat, 02 Aug 2025 19:32:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLgf-0006sg-Uo
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:30:50 -0400
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLge-0004uz-1f
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:30:49 -0400
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-741b1fe0e00so43258a34.1
 for <qemu-arm@nongnu.org>; Sat, 02 Aug 2025 16:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754177447; x=1754782247; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kEj8duxAu1Pam82WhtcHKlYlFMg89KDGm3ClOoILo48=;
 b=u7PBaoiLD00XkhOppNWpjHjYFoa2x8Q3sjGjVTN+W3tPfwIB6Dzpaqpu0CnDuK57QK
 a1j6IfTkwBu4HYBTVzz7Pym0ZNeBbN7pLx1EbA7S6uyBDoidgXdm+NFrqp667jo+PQub
 8CYUKPP6vvz2GbHusZrk994/MFoQGlSeE259+GTTQHELBFiNBQXIAsDQdByA/QNcTKLA
 EJgNw/RTEgT30+Rf+QGHwqnkMrR1cFSA2m8Erv67yauxqfiRB3wGm8Fx5A7F6KvA03QH
 NFxraefxvutlar6pVzISmiEwog6vOQ8qyJIxiG42FZHVgDlehGrfyRf6p6kOjWxkWpIM
 QA5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754177447; x=1754782247;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kEj8duxAu1Pam82WhtcHKlYlFMg89KDGm3ClOoILo48=;
 b=GsRKib3lLiRDPP8KO7Sb/eUcE8k4j7emOLBZpi/EMgJNU3DkjnMQX7wZ09Fu+JacyF
 iro+hZ0L5a0x86ka5VXhlyOPhq5HOokhiFhcXmVGzvoCmZz8+YoaYDK8FIw8DlV56ee0
 kW30vE59G6bs0VQ70R2PIzt+Uh498pe9w+aA6QoKPDf5A21+tnxh/yy27eB+714ghOdV
 8DMXYgzZF7DX/2v//rYNoXUeCgiCEx8sH8KY/s3CTiR1iUvl/uKwJrchBkebusSrwFzV
 SSXtKAlEVaQ6XBZva6nNo7rNg2NWmxV6V5QcGRo2vC2T4DYeOtnAxffJdfgd9xMfaaXD
 CwfA==
X-Gm-Message-State: AOJu0YyQzmpA6vsUvkPtz6V927M+tKx2RRxg6xilwx5/WZzzJwNZxotA
 U0tq7Oc82+ex/YlMrNxMs2UH5AR/xYh/oG62yo468cSEKdJTNsI9Je8oBiLwawnftzGhIhtJaFL
 Jq+GV0XM=
X-Gm-Gg: ASbGncuH0kuvIkK2b3bI5xSGCWCI2glTq4y3di/pSBKgw1zIxl48aiBvzUIGgoWVfRB
 WqrULgfEv7ZAfYvpoXDwPcmLk2P2N4fyTFMSFEHPpOBG5EA+5JJeeNUEQNZUI/4EGqk8UDtAFsa
 1QBAJ6fH/DhqCUSgCYOvdzmRrvFRsSGw3J0GGx/tbxix9Sy8aaL8ApHkJMtMBIrhPxpD+FLRrf+
 VrBxgXPOO4jHtWmx0lx/fHCD88lMljhQIcJi8mXcpdaRwpqTcR6/HsQmXfXs53pWThJk6U9jFf2
 iSQ6Gt9U/h/4trK3Kvi7dhTrMd1M+jHYyvgtSAUJ88mjf4GahWaUtXS7GPCSpLE0MZuluoRBL3W
 lMq8cPD9XyP5l+nXIwXEF150Cufi+CFSBxJkF5niwrWoyMdEuyo4s
X-Google-Smtp-Source: AGHT+IHiqSeqoSJmoQQLzg0b/R7VSK1wiFSdieYogDifbx+Txeh56HuZ5yxKRJR46OjPVimEzix7SQ==
X-Received: by 2002:a05:6830:600f:b0:73e:5540:730e with SMTP id
 46e09a7af769-741879d7295mr7675745a34.4.1754177446714; 
 Sat, 02 Aug 2025 16:30:46 -0700 (PDT)
Received: from stoup.. ([172.58.111.133]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-30b8e3c9b32sm71031fac.24.2025.08.02.16.30.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 16:30:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 10/85] target/arm: Fill in HFG[RWI]TR_EL2 bits for Arm v9.5
Date: Sun,  3 Aug 2025 09:28:38 +1000
Message-ID: <20250802232953.413294-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250802232953.413294-1-richard.henderson@linaro.org>
References: <20250802232953.413294-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x331.google.com
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


