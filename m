Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp1994422ejb;
        Wed, 21 Feb 2024 07:36:29 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVLZXitp81Fio+W5GFqKkr+UA91SfFnX4eJ4ql9e+2g9pk8+/LojSag9yVc15PLshOL8Cp+2WR1LmPJmTaI8mu97XgVEw9z
X-Google-Smtp-Source: AGHT+IG4ZDto7Asf9wHywA5EDTUrME3I9GWf3b++t903GRA9ZjA0cCy6q6g4XLhq2hLsQ+n42afm
X-Received: by 2002:a05:6808:2288:b0:3bf:f1da:633 with SMTP id bo8-20020a056808228800b003bff1da0633mr22672474oib.54.1708529789401;
        Wed, 21 Feb 2024 07:36:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708529789; cv=none;
        d=google.com; s=arc-20160816;
        b=MB18onSLYwlEPVgvKPfY0LtbLbWolgHYTEEjMCrVcmlGZaZ6q3RsZDgWkGyk4spJn4
         2cIMY6m478BzYm3S6ODstBeSXM6uetRE37bFkIhg/NfnrfCzJ65W9RJ6YRD0qUWqQpdK
         KMdUW8DbR57yRVibC59JJfUPinidXgJt0DdCNeb00988jUztijCOMKaFE93zHwj3BRrz
         97qjFFrUVeAkcokOisvKUhF7Z7ZvLXHrBSZYk/uDnV3cVPj/OWjuEiRDDxe0J4fNibQP
         5nzDXK4eflSg1ck25fqoh5rnXKY/9RnkgCldsJC3pCIbelPUeWElfBxVZbEA7qKZW2ZP
         DTwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=eTOAE7MzRCJbGl9LSN6U9Oq7O5H7ZV4owxf3RnSUykI=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=XtOCOEgXsIzXXLVvklFJwij8e2Nvx5L3Zz/IJBpVpuWW43MAJys1JF2Y4ptem2CJlv
         E8C3w96qWaPnrt5Cv9FCR3d4E3Mob2ZaN1QKbXsRNAXywVed6MIOfBZiY9NKBn3ogpds
         lnfVkdAHWSm+EEc3f1qg3cxi4Y3h5YyPNcCwppTEsNudPvd4K/szsVPQu4pXJ7bNpAq+
         05xPKNTB8f/C2EN9B5N5QhEpsi68J7rymBEpIKptuUhgVfTwaFtTbQRYGHu1IDK3V76o
         k6ncd+s+qECCL7CAtwXfJlTvRg/2ibJ83Ry3QYja6zgLYsm287guD9iVeptjF696DT1U
         DpMQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bp39-20020a05622a1ba700b0042daa920d4esi11578686qtb.305.2024.02.21.07.36.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 07:36:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rcoZy-0004x6-1A; Wed, 21 Feb 2024 10:32:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rcoQb-0000ae-ER; Wed, 21 Feb 2024 10:22:33 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rcmLw-0004od-JB; Wed, 21 Feb 2024 08:09:38 -0500
Received: from mail.maildlp.com (unknown [172.19.163.44])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4TfxQm2hfpz1xnkp;
 Wed, 21 Feb 2024 21:08:00 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 18F4E140154;
 Wed, 21 Feb 2024 21:09:23 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 21 Feb
 2024 21:09:22 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v2 01/22] target/arm: Add FEAT_NMI to max
Date: Wed, 21 Feb 2024 13:08:02 +0000
Message-ID: <20240221130823.677762-2-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240221130823.677762-1-ruanjinjie@huawei.com>
References: <20240221130823.677762-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=ruanjinjie@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: CEkACsIkClSs

Enable FEAT_NMI on the 'max' CPU.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/tcg/cpu64.c        | 1 +
 2 files changed, 2 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index f67aea2d83..91baf7ad69 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -63,6 +63,7 @@ the following architecture extensions:
 - FEAT_MTE (Memory Tagging Extension)
 - FEAT_MTE2 (Memory Tagging Extension)
 - FEAT_MTE3 (MTE Asymmetric Fault Handling)
+- FEAT_NMI (Non-maskable Interrupt)
 - FEAT_NV (Nested Virtualization)
 - FEAT_NV2 (Enhanced nested virtualization support)
 - FEAT_PACIMP (Pointer authentication - IMPLEMENTATION DEFINED algorithm)
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 5fba2c0f04..60f0dcd799 100644
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

