Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp725326ejm;
        Sat, 15 Apr 2023 06:08:33 -0700 (PDT)
X-Google-Smtp-Source: AKy350bcrqYJRBdbKjVwivrgBq26QC1o6ZVQ5myUbvLDRtoNvdbgW3gpSmNq1kjqd3xi9W4TlzTf
X-Received: by 2002:ac8:59d4:0:b0:3e4:d887:3e88 with SMTP id f20-20020ac859d4000000b003e4d8873e88mr14991748qtf.10.1681564112758;
        Sat, 15 Apr 2023 06:08:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681564112; cv=none;
        d=google.com; s=arc-20160816;
        b=KQ9lxe0nOMCfJozpH9G+Wwiak6j/8+zJ0Xak/7bIcNJLXyDtSu+9hJeTz7WLIRug1y
         ppSmadH0qSXxoG6FeNxpEytuKjPGDkuH8PT3f5TJHb+c9U2/ijYUdSOLvZB7gEWIkWDY
         6/aJFhhM2YU/6wMO2iuohICbDQ2hco4KMIKaRKd/zQ70ZRsVahZMJN6UY4G0lTPdOX0o
         54kZBNRe8HQjcFo252YIi+YTCJifi8CWhleu5i4n5tZmoEbW3+LXTNvJYM2YE2jBj6F+
         5Y/YpWTKCoyPBml3NKmF0ewlg1Naitzk1Lakc2SjLlbo9ldjSyelgF8SNDnnPs5ZEf/I
         1Wbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=oFERySQsSWqxsgcmeziJzaaNINbANjak6JlRTjdRvws=;
        b=ulvrILkslZrCRL6sskCteSlOEx5gKGOevVPFOZ8gxLYnIYvvqYj0lwSMnn3O5nDkdf
         UZYZY1rvgppVeBjIgRUYAfDRRrTfcE3tsh53u5JI3igXUXlSo/C/dltRjMVpR+rXV7SZ
         wTSSxJS6NEn8fAvrj0Rd51hB0gpG1kxbC74BJIwy9zF9O4n0vL4aXj3XhowVmQTDucLI
         0NJOZJ+YDHGGUpVAH5bWRjtRSdpT5OcTPzW37hDaRjVZcpZFy9xoNy2Z/avMElO7Q1Sf
         Zzbz95s1eR+EyJWVccJ0lCtT/H5NaPF4kq8juongBiDYIyKQJ6dDfH8giW87znPcitvl
         t60g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=n8aalNEV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t17-20020ac85891000000b003eb79c6ea4bsi1666288qta.414.2023.04.15.06.08.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 15 Apr 2023 06:08:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=n8aalNEV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pnfcW-0004tC-Mu; Sat, 15 Apr 2023 09:07:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jszhang@kernel.org>)
 id 1pnbZm-0006is-Hi; Sat, 15 Apr 2023 04:48:08 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jszhang@kernel.org>)
 id 1pnbZe-00030C-Be; Sat, 15 Apr 2023 04:48:06 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 69E8F60F6D;
 Sat, 15 Apr 2023 08:47:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2365AC433EF;
 Sat, 15 Apr 2023 08:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681548472;
 bh=U8WABhsAkLpAnlwQZI56b2I0tzK5K4NZdbgTbNP5uPI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=n8aalNEVBvobcbFp9UIDEoxArzaKkd0Sh5wtyGUfa0ZHQnvzeG/CErDnwj2jaalYt
 pKf5P/zXcISkhSMn6iAruCfiEbQDK/h4B1ea0lQ8EF/wqVxEaj0kxgchKF7wyZz0EU
 dPvZ6RDVJXdI/Fev/spOyJZMkj8jpCyefFJNJC+I/al26BFmhiRsu+cGmhidsIFAib
 4uqAERsKkPC3SGj8xJM1rXsPKGYyXC649kBKDZFL7sffh5lgY+odvq9moOdUK4+vL6
 yxcWtue0WVb9Ci88y7SBUbDvlfAZhFcMGydb83n/bk054MNGpMDpu+DIZb4gOrzqOo
 wUzuge9Yr9vKA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/2] target/arm: Remove ARM_FEATURE_CBAR_RO from A55 and A76
Date: Sat, 15 Apr 2023 16:36:56 +0800
Message-Id: <20230415083657.2308-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230415083657.2308-1-jszhang@kernel.org>
References: <20230415083657.2308-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=jszhang@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 15 Apr 2023 09:06:56 -0400
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
X-TUID: JBJdg+1DG5M1

Cortex-A55 and Cortex-A76 doesn't have CBAR, so remove CBAR feature
from them.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 target/arm/cpu64.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 0fb07cc7b6..85dc9d57ff 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -796,7 +796,6 @@ static void aarch64_a55_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_NEON);
     set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
     set_feature(&cpu->env, ARM_FEATURE_AARCH64);
-    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
     set_feature(&cpu->env, ARM_FEATURE_EL2);
     set_feature(&cpu->env, ARM_FEATURE_EL3);
     set_feature(&cpu->env, ARM_FEATURE_PMU);
@@ -919,7 +918,6 @@ static void aarch64_a76_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_NEON);
     set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
     set_feature(&cpu->env, ARM_FEATURE_AARCH64);
-    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
     set_feature(&cpu->env, ARM_FEATURE_EL2);
     set_feature(&cpu->env, ARM_FEATURE_EL3);
     set_feature(&cpu->env, ARM_FEATURE_PMU);
-- 
2.40.0

