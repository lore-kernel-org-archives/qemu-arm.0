Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27303CA0EE4
	for <qemu-arm@archiver.kernel.org>; Thu, 14 Aug 2025 13:12:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1umXe6-0003Wv-D1; Thu, 14 Aug 2025 09:05:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXcg-00025r-JA
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 09:04:03 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXcc-00058A-UH
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 09:04:02 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-76e2eb20a64so1120021b3a.3
 for <qemu-arm@nongnu.org>; Thu, 14 Aug 2025 06:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755176634; x=1755781434; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QDW+HxP2J6pK8IxGshUeq+u65rBy5XdnKzmGA8gxmkE=;
 b=cgrCWCRGZdA4UnKTje3Q2RycP6YYUwCEVMsCzjwTSx9WJqgE2Zk6O27le0sg3DqJp3
 iqR7JImTxbKgEcfVDqk8tTVW7udRzDz1JNCoh8D8Hqx9UoysU37I7vzIdseuCx0RBXTe
 JMNWTVTVbta76HY6xTi/fT8mx0kJIJYQfb275Py4h82OTO0uPjpUuxWNshwhWVev/tqq
 b+HUC+Ce0B92QirjUGGDFWdpqDXu4vKGTDMyLymjcruHJ6nlbxD5ocM4xUAoSi2Wu4vO
 BPWAUFPDiu7hQdoYrN58CTIwp+zGrZHp4DO73oNHGzysU+pzVGjwpgfCuulr+2Ejmtud
 EVFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755176634; x=1755781434;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QDW+HxP2J6pK8IxGshUeq+u65rBy5XdnKzmGA8gxmkE=;
 b=j1zNIzTmQpXxDLsBsn4V3AEYR/ZP7ZJcj/flI41JdiVYbW7QPMx8MuVAnO8/8ukEUA
 D+QXWnNaKUBcv6ZNqSHaC/PKbvQxfrISGpt/ghkm08mTI28M7/z+2I1/QoGxTsLslXVI
 Xw1n6iV78h25nwbyjaZ6cJp2sMNLoeSzgZKMxZDVmQ7xQKVtTSifVoys0FTH5uvMO4H4
 Rz1JuNA855Xz359+DxvVbg2OyondHOmPXjBVu13PB+gD9Lf6mk+OOvSwf+EeHxxqRpLu
 9uMJHLLGPqWAIyWkOxFwl4vNBgX1XI4EYJAcxRMWkmgSEBdXy4qd0DweZQwXVATsYuEu
 hcMw==
X-Gm-Message-State: AOJu0YwB3E5SxSO8mcLChxqw0ALT8OCYl+VMEaXSWe8c2A5SOoR3N+YI
 aa4JgvcCopIsplD9rrQwpuuAj4+IbpggfrgAHeXkeskZBfodr5sR3W14WtZgvm5pDqA=
X-Gm-Gg: ASbGncuYyY2NJ+rP7kd+AlJMAPSlBxihWTBo58cxSB1hIaW49+P4HKab8IToihlu0q5
 ThUD1C5cgpNjKc1kw/3LSOiUrnhV8vB26phrNNxie1/8Kmb2jWOrj19AoY6uP9gnG+vofGeVlgH
 8p2usvjOBo6jZeSypdIXZl0bQGK3ShtmczzzE6YMB6y1CmEgDh+q6BJfBFRCfddtafbNpvfgPez
 8aU3S9xW61Ykl6X+NX67cH6/DA9iW+UOnh7qpqtTNVskt3z8WzLS0OSMqWr2B947gGokRQbnS6V
 HL6kl/CiloNDRucqFp9ZyhLIENwIUk3pyqa6iZaEplQuZiLPm9AFliJg2pWnLuJm7zqxozb8+9C
 ygMQ7D5dG6AtZoZcI/2nD2KEXACVsZkP3rJprkvzGEoy552w=
X-Google-Smtp-Source: AGHT+IGEamxMvrYocxet/aTZQP6ijcQhpmNxzVnDf0Zka+EgWDe933VyF8cqARSCNxWakiORI9P4Ig==
X-Received: by 2002:a05:6a00:1883:b0:76b:ef8f:c277 with SMTP id
 d2e1a72fcca58-76e2fd0f872mr4760406b3a.11.1755176634307; 
 Thu, 14 Aug 2025 06:03:54 -0700 (PDT)
Received: from localhost.localdomain ([206.83.105.236])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bcce6f6fesm34480631b3a.26.2025.08.14.06.03.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 06:03:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 51/85] target/arm: Add syndrome data for EC_GCS
Date: Thu, 14 Aug 2025 22:57:18 +1000
Message-ID: <20250814125752.164107-52-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250814125752.164107-1-richard.henderson@linaro.org>
References: <20250814125752.164107-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/syndrome.h | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
index c48d3b8587..bff61f052c 100644
--- a/target/arm/syndrome.h
+++ b/target/arm/syndrome.h
@@ -63,6 +63,7 @@ enum arm_exception_class {
     EC_MOP                    = 0x27,
     EC_AA32_FPTRAP            = 0x28,
     EC_AA64_FPTRAP            = 0x2c,
+    EC_GCS                    = 0x2d,
     EC_SERROR                 = 0x2f,
     EC_BREAKPOINT             = 0x30,
     EC_BREAKPOINT_SAME_EL     = 0x31,
@@ -83,6 +84,23 @@ typedef enum {
     SME_ET_InaccessibleZT0,
 } SMEExceptionType;
 
+typedef enum {
+    GCS_ET_DataCheck,
+    GCS_ET_EXLOCK,
+    GCS_ET_GCSSTR_GCSSTTR,
+} GCSExceptionType;
+
+typedef enum {
+    GCS_IT_RET_nPauth = 0,
+    GCS_IT_GCSPOPM = 1,
+    GCS_IT_RET_PauthA = 2,
+    GCS_IT_RET_PauthB = 3,
+    GCS_IT_GCSSS1 = 4,
+    GCS_IT_GCSSS2 = 5,
+    GCS_IT_GCSPOPCX = 8,
+    GCS_IT_GCSPOPX = 9,
+} GCSInstructionType;
+
 #define ARM_EL_EC_LENGTH 6
 #define ARM_EL_EC_SHIFT 26
 #define ARM_EL_IL_SHIFT 25
@@ -351,6 +369,23 @@ static inline uint32_t syn_pcalignment(void)
     return (EC_PCALIGNMENT << ARM_EL_EC_SHIFT) | ARM_EL_IL;
 }
 
+static inline uint32_t syn_gcs_data_check(GCSInstructionType it, int rn)
+{
+    return ((EC_GCS << ARM_EL_EC_SHIFT) | ARM_EL_IL |
+            (GCS_ET_DataCheck << 20) | (rn << 5) | it);
+}
+
+static inline uint32_t syn_gcs_exlock(void)
+{
+    return (EC_GCS << ARM_EL_EC_SHIFT) | ARM_EL_IL | (GCS_ET_EXLOCK << 20);
+}
+
+static inline uint32_t syn_gcs_gcsstr(int ra, int rn)
+{
+    return ((EC_GCS << ARM_EL_EC_SHIFT) | ARM_EL_IL |
+            (GCS_ET_GCSSTR_GCSSTTR << 20) | (ra << 10) | (rn << 5));
+}
+
 static inline uint32_t syn_serror(uint32_t extra)
 {
     return (EC_SERROR << ARM_EL_EC_SHIFT) | ARM_EL_IL | extra;
-- 
2.43.0


