Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp649669ejb;
        Fri, 7 Apr 2023 19:46:18 -0700 (PDT)
X-Google-Smtp-Source: AKy350bIjIV+USPxdUvf174U2g/iUZK1WRw2aVp0S/JXKPEpv5xeXQ68icR7dShOOuSQ2gNYwS1X
X-Received: by 2002:a05:6214:1310:b0:5ce:7b40:89bd with SMTP id pn16-20020a056214131000b005ce7b4089bdmr8457260qvb.18.1680921978028;
        Fri, 07 Apr 2023 19:46:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680921978; cv=none;
        d=google.com; s=arc-20160816;
        b=0ycp/rSqnTKm0TYaBtI2VkI0cuQYyxwAiAsbLzflVWSx9l1my1jRbWTNlLNh4uZD6v
         4IxmRdWTbmvDIhbA00YA5fOqxmlq/jEO9W5v/qClgu9bckEmSuGE9CJGSjrt1fva45yx
         hByzyE5WWJ9//OwpSbXnZJYNM9iKyDeZtqUXwHBoHsnEJEDTiKS/xT14RRpAOA6qsbQn
         bGQ7RwjmdGIB4WrqWrTpK0F8lsN4zzoPd8fg0Nv6Z40SDkigrqJBsgLDqKxUMWJV5PvG
         qYDZjJJXdHn/nm9Rf45jbH2LuKzV+7JMEa6jVbRqkzrqaTs3WE20jIvMjmZXuuCzVqWZ
         yyMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=wmUvCy83uzUq+qlSl4tyoYDR2G5J3ycXbuZkZjm5Y8A=;
        b=RXgUPLPyjYuqUd7Ls1DZRpVS2tloiNJ7uMOyKtN7Hb1Xk0A8hJDVi+dHCWtRoULBDh
         jIzkhSr8czCRPgdn8m6oko7mJnHrpjpFSmBFOL7LhRct6iHu8F+gj1wt8pEqZccP+Ozr
         oLQKLJn8pch0s33YCPPEaBivkzuD8btVO3k52h7sE7LS25FGja527Acqmmgw3PYXvD5D
         fFdb2BXpbtBRWcCLh+4Fw39SpyUUOTeZdg6kXgYord6PcaEnM3rpXQIRvfHAZFzvt+AP
         20yrL0HWBu7F1moz6v/i+MfqVErlwB1IAZUjntVFGebPF7JnUwi5l/I+Fq/CFge/rvet
         GwMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A2ililuf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 204-20020a3703d5000000b007484c344eccsi3706163qkd.456.2023.04.07.19.46.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Apr 2023 19:46:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A2ililuf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkyYM-0007OI-PE; Fri, 07 Apr 2023 22:43:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyYJ-0007JK-PR
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 22:43:43 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyY4-0005WV-C7
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 22:43:43 -0400
Received: by mail-pl1-x636.google.com with SMTP id w11so368651plp.13
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 19:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680921807;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wmUvCy83uzUq+qlSl4tyoYDR2G5J3ycXbuZkZjm5Y8A=;
 b=A2ililufGQuYTzNPqtP/V7tjyrFn2iBMD2rUjURFCQRZYVtYMCubdskWauOo8LuFcN
 np7l69jOAdhFdrKHd+REhe0FMB/F27dJjkvnqFHRG7q8So8U+4uv+4Y0a0YGYl9BxWwF
 MCN3NpXVoyCqGQKEKVfvXHNCac0C+TFSZvH/TPfe0xMpj+F1zjoGUa6O5huFEeK3S/0+
 W08RfqHf9LXxbOWT83yHqviAIMphAIORCQ+NLzJhQ1fVi7IojyHa5rqD5wmNGXiZRSGP
 ZagNpqfwEsmQT6d/++3O9EeifezUN5W5niIn73+0bDxL/+3aUPjbPSK4EB7aMSlm3cMF
 9xug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680921807;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wmUvCy83uzUq+qlSl4tyoYDR2G5J3ycXbuZkZjm5Y8A=;
 b=ec52hjmbfXhKOZoYwSdprmTCHk3rl0Hv9DlIQk+CVmOXoRwXeWdWmL8TEl8fJdgo1o
 H5Pwv5fNI/aMWJ6mkowKtgW7oB/VZAfn8Ygkagoqd6qsHgA++Vhj5jAHy42CBCjg8gdM
 BnO0UxuVr4a0QpQ3DBHQgvzEKfMxsHz8rjochWEHh9imC/thOAYcy0Ibn/b/6KWUF33p
 0IGpqWQ3EDjLbDR9dbEcY7NLbA7ApZwgvvlgIIiCLG3EluyqTYsDTBHQ/uu/+Da8t3/o
 ZT2TOsotu3Z+H86V0l0x65dqG74wofCkzqhzzU61a9uMcCE9DeOVen6eLvwQd+Jn292k
 IK+w==
X-Gm-Message-State: AAQBX9enoQ4eMkTFXGMCFdkCeiBZ380fxwop08lRIA8dTqC3giHPOeC4
 w72S/xb6EEPDOncU2X+5Rz7ZnTtTQAQRXlEaf7g=
X-Received: by 2002:a17:902:db09:b0:1a2:8924:224a with SMTP id
 m9-20020a170902db0900b001a28924224amr5590006plx.25.1680921807559; 
 Fri, 07 Apr 2023 19:43:27 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a170902c18900b0019d397b0f18sm3530780pld.214.2023.04.07.19.43.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 19:43:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH 12/42] tcg/riscv: Conditionalize tcg_out_exts_i32_i64
Date: Fri,  7 Apr 2023 19:42:44 -0700
Message-Id: <20230408024314.3357414-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230408024314.3357414-1-richard.henderson@linaro.org>
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 3joBiLsBW60d

Since TCG_TYPE_I32 values are kept sign-extended in registers,
via "w" instructions, we need not extend if the register matches.
This is already relied upon by comparisons.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.c.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 7bd3b421ad..2b9aab29ec 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -604,7 +604,9 @@ static void tcg_out_ext32s(TCGContext *s, TCGReg ret, TCGReg arg)
 
 static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg ret, TCGReg arg)
 {
-    tcg_out_ext32s(s, ret, arg);
+    if (ret != arg) {
+        tcg_out_ext32s(s, ret, arg);
+    }
 }
 
 static void tcg_out_ldst(TCGContext *s, RISCVInsn opc, TCGReg data,
-- 
2.34.1

