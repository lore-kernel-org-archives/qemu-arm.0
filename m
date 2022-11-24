Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp4253965ejx;
        Wed, 23 Nov 2022 07:02:11 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5YlHuWaWmpS5AJHDDalVaLrJuezvsXAYa4FmoQhjoUSYYWl/qL/LOJeOYIaB7cS2k7KL1C
X-Received: by 2002:a0c:eed3:0:b0:4b4:4cb5:cbc0 with SMTP id h19-20020a0ceed3000000b004b44cb5cbc0mr8577128qvs.28.1669215731283;
        Wed, 23 Nov 2022 07:02:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669215731; cv=none;
        d=google.com; s=arc-20160816;
        b=qF+J7VSpc/+WlIr4E4hcweYavyEAt6bjKLHyy6VPRYFt6lCfuV4wxlYLxE3I1vZgRo
         1sHSuXA0eizMND0qlxWIQb7bz6IFWnkelwyX6d7t7EpiQV/Fshatkco3Yhc00YXBD8+W
         O6KLxXw3+sqUKdTFsPHicQ8JX3bLPDdrHThBtSCWE0CnfcF2l1DXCzjdbnipHqVUlgfW
         Zxd1MwEQP1uwyKs0kcs7UoQc0Vxcm1cjA+nx8/FXpZsCPgvD2yEuLyDDqzKbvJ/AH8Az
         LV1xypeGNwTOIUfNlnihVwjJMdzJtRp63Nx/O6CcfZ9vNu/5tB2RMo8FGH2O+NSGRN2E
         oWKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-disposition:mime-version:message-id:subject:cc:to:date;
        bh=6J/dN6p9DOM74ipjsjRxOdJZKZOerRoEVKPh7tGr92c=;
        b=UiI+Izo+MyuO7lJ2w5CNi7DIK2dY79omF95T5YG2UdDnkwxZx/tMojIBKnFpRkjTgk
         snB4CfJb6NA/NKFROGJZyEqsuPE3xH0AhH3OwpbOdCS9peKEDXk4iBW24Nq5ibKh0yQI
         shDyk/3NnGyF5M8BHtLbM/rEnWgB8Es2qcY/skH7eBACV3OiCpTwp3v4Gt0fewmR1GSA
         jNzskRTjXLdn/o2fZ1CYS9AbYMoyg3AY9qiHMKT7qZiRoFutjmQ9CVCoY7cRrA3cfaOl
         1Ho3FA8AC/S9aT2Jl0uGmR9mDlaJxsz5ZPV/4X0BA/8guLe9NbzkY7R6gHWW3oqrQVd6
         7hAg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f6-20020a0562141d2600b004bb68c1cf38si9549915qvd.548.2022.11.23.07.02.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Nov 2022 07:02:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1oxrGJ-0004i3-4V; Wed, 23 Nov 2022 10:02:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changbin.du@huawei.com>)
 id 1oxo5C-00027T-Al; Wed, 23 Nov 2022 06:38:26 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changbin.du@huawei.com>)
 id 1oxo59-0003SP-DF; Wed, 23 Nov 2022 06:38:25 -0500
Received: from kwepemi500013.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NHJtW1lRCzXdYd;
 Wed, 23 Nov 2022 19:34:11 +0800 (CST)
Received: from M910t (10.110.54.157) by kwepemi500013.china.huawei.com
 (7.221.188.120) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 23 Nov
 2022 19:38:05 +0800
Date: Thu, 24 Nov 2022 11:38:02 +0800
To: Richard Henderson <richard.henderson@linaro.org>, Peter Maydell
 <peter.maydell@linaro.org>
CC: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, liyang
 <liyang281@huawei.com>, Hui Wang <hw.huiwang@huawei.com>
Subject: arm: gdb-stub is broken by FEAT_HAFDBS
Message-ID: <20221124033802.meuiphlcskwu3aty@M910t>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-Originating-IP: [10.110.54.157]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500013.china.huawei.com (7.221.188.120)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=changbin.du@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DATE_IN_FUTURE_12_24=3.199,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 23 Nov 2022 10:01:59 -0500
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
Reply-to:  Changbin Du <changbin.du@huawei.com>
From:  Changbin Du via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: rP7BuXI0vA9e

Hello, Richard,
We just noticed the gdb-stub is broken and probably caused by commit 4a3585568
("target/arm: Plumb debug into S1Translate").

(gdb) target remote :1234
Remote debugging using :1234
0x000000000e1716d0 in ?? ()
=> 0x000000000e1716d0:  Cannot access memory at address 0xe1716d0

This issue can be workaround by below change.

--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2879,7 +2879,7 @@ hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
     S1Translate ptw = {
         .in_mmu_idx = arm_mmu_idx(env),
         .in_secure = arm_is_secure(env),
-        .in_debug = true,
+        .in_debug = false,
     };

Could you take a look at this? Thank you!

-- 
Cheers,
Changbin Du
