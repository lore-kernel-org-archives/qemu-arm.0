Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp2320602ejv;
        Sat, 30 Mar 2024 03:35:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVyiLh8ZtpkVaOdOPMSKeUDheddKeTa4uJ2mPqr+34clU1PIrk3Ocb19Y7EPsRiYbq6Q7JsTxaN0OkHRx3gx4zioqU8Rmwz
X-Google-Smtp-Source: AGHT+IFzUT4HQvqiYjvypz9amHaz21sFqkATAuo4m4V3gYWL1ot4f6PduW2dEmD38B4X0eMipaCC
X-Received: by 2002:ad4:58ed:0:b0:696:49d5:942d with SMTP id di13-20020ad458ed000000b0069649d5942dmr4299461qvb.41.1711794930322;
        Sat, 30 Mar 2024 03:35:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711794930; cv=none;
        d=google.com; s=arc-20160816;
        b=BcSeWvO6ObjIeJ7lz60ENA+ueyQRMJLfZmr+IdS403xAWnPT5JnA58Y+nU9uXe5rYo
         hTm6kst7hIyLfuQVRL8yr1QlWOrX2wKj5C0RQD4bcHu0mAP20pdHt3L4zjqk88NzSV1e
         Wh6uX79vmkEPnFnFiJFHuHFbnQNv14lGTgIf7zuaENXN/ILnigxbP+f//dhGc1l3LRCz
         van18ggt0+ZaX0do6+Bkm2A3egMb4tkJ3IAaQehPLsIbUNUdo0byOieWDYHorGkUe6kE
         G5ewaCJIgT0HYZAB5k3deM2Cdb3ohWI6VncMh4czBXhQX61gdkeZIrLYvDilTx7gYd7y
         oJig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=CTvWwrCpTKOZ+gV3mXvT4nYl3pZnnP+ALq3LUnld7/4=;
        fh=dR6uRwfo9om/DmWDsGu5eY7/2T4Nd7sHG4YVwbPnVj0=;
        b=TCF37cKe+1Z63nqNn8CbgO7ROjvXV/AzR/2I41j+u83NU80IHAiFfo4hsu/FvnOD4q
         XQT96dFg440LlXc5s3o51OYAXv0pUuQ4B9bCt4JF4ZLUsU1h8CGWqHUReDXHjivnwVkU
         C9SKEKiM19OGzf6qol6Ppq/txVLZiHvIi+JP0uRk3UONe9CEjWEx+yeXqQD3VU4Zdzb5
         62KYbx64ra+EjSLU2JtSIv2yFiYpKtB5952OUlSkw3EEYRAQk1AKElxSjot5Zdocab/f
         Ql5i26XkgusrJkSikedlJqbu7GHB3DQrEjFDwKmbDOimF1lozoEAF474KVAWTwLhWW2C
         U7Nw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s11-20020a0cdc0b000000b006968a75169asi5609820qvk.7.2024.03.30.03.35.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 30 Mar 2024 03:35:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rqW1j-0000VT-5x; Sat, 30 Mar 2024 06:33:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rqW1U-0000PY-B7; Sat, 30 Mar 2024 06:33:18 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rqW1R-0000sW-CA; Sat, 30 Mar 2024 06:33:16 -0400
Received: from mail.maildlp.com (unknown [172.19.163.174])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4V6D7g29LxztQxW;
 Sat, 30 Mar 2024 18:30:39 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 6D24914037D;
 Sat, 30 Mar 2024 18:33:08 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Sat, 30 Mar
 2024 18:33:07 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v11 22/23] target/arm: Add FEAT_NMI to max
Date: Sat, 30 Mar 2024 10:31:27 +0000
Message-ID: <20240330103128.3185962-23-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240330103128.3185962-1-ruanjinjie@huawei.com>
References: <20240330103128.3185962-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=ruanjinjie@huawei.com; helo=szxga01-in.huawei.com
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
X-TUID: 2DfBXTyJLTV5

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

