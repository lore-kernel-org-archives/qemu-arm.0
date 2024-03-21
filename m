Received: by 2002:a17:906:bc5a:b0:a46:bbde:2c08 with SMTP id s26csp489290ejv;
        Thu, 21 Mar 2024 06:11:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX0uLAr3moPsGqNObOKv2w2FMrhwBNINBwIJWyhHOSHE5rSvf6kwOXXNgvPpSt1UQfH6NZK/b/xF4KZecMCP2L4wpU4UNqy
X-Google-Smtp-Source: AGHT+IF1T2D/RnTIlF9HfpR62P6CB2AeHQO7Osa2Elp/syNevjxRvtgFYmSBKCZ/rNvCqwpk71vW
X-Received: by 2002:a05:6122:4493:b0:4ca:4a07:9006 with SMTP id cz19-20020a056122449300b004ca4a079006mr20474094vkb.0.1711026664785;
        Thu, 21 Mar 2024 06:11:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711026664; cv=none;
        d=google.com; s=arc-20160816;
        b=cw/0N8qaf4WrBfOBEW2dLIHCk9UnmUbsii+6LK/4L5P/ACV5SxHzdLrgf5jHCs60y6
         USAemONmka1qxPVt1PbhYUOU95RERoiXoQdoHwMPGY9vDFGuvJy4rd9FoG4fcgNQ3ozI
         npb9GjhZ5Ws5bf1qq5liE9Jn2laHVY3EzeancIP5sC0C5EwfdfGB+94ClmdTl4nS5oMP
         dJRW41MzGhLCi7eprM/MmH88jtL6Vt9goUoJCVuxxViFwOnOY4ldzR7wjDSsMzbWy0lD
         E/+msPX0PQk+cDU+YGJQ7sOvNtx+G1koDHR737xOmmb+9i1vrhTJ08mXG3iCkv3WsOOy
         iBEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=CTvWwrCpTKOZ+gV3mXvT4nYl3pZnnP+ALq3LUnld7/4=;
        fh=dR6uRwfo9om/DmWDsGu5eY7/2T4Nd7sHG4YVwbPnVj0=;
        b=cP4+chboHn7pRIDBKhpDcRq7HtMP0hRXF5fKPDZ+2tEZegTYZmnYZ9I1evtOFPHh/N
         DKXbXodkCKK1cHTY6eokRKzQ3t/ARBr/kbiZ2gPndldq0znaQ3S0JBu/tTB2WEGTccTn
         5dKuQjvN3yn6I5GQbga5CoB1AZq9qCqrXIvGqqfJdTt92wg1/r+3sD0QD5oGoxYEZKw/
         bvWgacs9wS8Yxx9jfRbqJEFj5XI/0VzkyiurBzRZNGgXMf8K/Z6JzBjzpgv8tYw5SeTJ
         Z2t7c/+8RGIlVLYzn0DY3GC699EaqeyjELEfk2qOJorHdJCa9GCRWDYJtxxjp/53X9fA
         HRog==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h7-20020a056102104700b0047673d29021si1217376vsq.157.2024.03.21.06.11.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Mar 2024 06:11:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rnIBE-0007O7-5f; Thu, 21 Mar 2024 09:10:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rnIBB-0007N2-0v; Thu, 21 Mar 2024 09:09:57 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rnIB1-0002v2-0s; Thu, 21 Mar 2024 09:09:56 -0400
Received: from mail.maildlp.com (unknown [172.19.88.163])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4V0m3B0Fy5z1xsCd;
 Thu, 21 Mar 2024 21:07:50 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 17910180063;
 Thu, 21 Mar 2024 21:09:44 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Thu, 21 Mar
 2024 21:09:43 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v9 22/23] target/arm: Add FEAT_NMI to max
Date: Thu, 21 Mar 2024 13:08:11 +0000
Message-ID: <20240321130812.2983113-23-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240321130812.2983113-1-ruanjinjie@huawei.com>
References: <20240321130812.2983113-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=ruanjinjie@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jinjie Ruan <ruanjinjie@huawei.com>
From:  Jinjie Ruan via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 1agveJajpGRP

Enable FEAT_NMI on the 'max' CPU.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
v3:
- Add Reviewed-by.
- Sorted to last.
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/tcg/cpu64.c        | 1 +
 2 files changed, 2 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 2a7bbb82dc..a9ae7ede9f 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -64,6 +64,7 @@ the following architecture extensions:
 - FEAT_MTE (Memory Tagging Extension)
 - FEAT_MTE2 (Memory Tagging Extension)
 - FEAT_MTE3 (MTE Asymmetric Fault Handling)
+- FEAT_NMI (Non-maskable Interrupt)
 - FEAT_NV (Nested Virtualization)
 - FEAT_NV2 (Enhanced nested virtualization support)
 - FEAT_PACIMP (Pointer authentication - IMPLEMENTATION DEFINED algorithm)
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 9f7a9f3d2c..62c4663512 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1175,6 +1175,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64PFR1, RAS_FRAC, 0);  /* FEAT_RASv1p1 + FEAT_DoubleFault */
     t = FIELD_DP64(t, ID_AA64PFR1, SME, 1);       /* FEAT_SME */
     t = FIELD_DP64(t, ID_AA64PFR1, CSV2_FRAC, 0); /* FEAT_CSV2_2 */
+    t = FIELD_DP64(t, ID_AA64PFR1, NMI, 1);       /* FEAT_NMI */
     cpu->isar.id_aa64pfr1 = t;
 
     t = cpu->isar.id_aa64mmfr0;
-- 
2.34.1

