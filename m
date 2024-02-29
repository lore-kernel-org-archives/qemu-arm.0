Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp373730eja;
        Thu, 29 Feb 2024 05:12:39 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXW/CtvS3R9YJ17KCO60jymxe1ZnsfLlCpnGbY2X3eXh93fJlD4dJ9GM2HMn2luWJ+7NBnMgH9lmQef7psxsXcTGcs3wgtQ
X-Google-Smtp-Source: AGHT+IH5xdpZd6QNZri4pJ8ADH+PoA3dFVCLvQ70is4dV3pLS7ASp1m0iUfF2E/rmRHzcCbils/w
X-Received: by 2002:a05:6358:7f8b:b0:17a:f909:2cea with SMTP id c11-20020a0563587f8b00b0017af9092ceamr2917894rwo.17.1709212359120;
        Thu, 29 Feb 2024 05:12:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709212359; cv=none;
        d=google.com; s=arc-20160816;
        b=uoiA2JBtbcH2uZlM0coFIVYzHkhZ3EjtbvhHcnd1is/jtNdd/rk++nMt344Nsw0Uy6
         MadPMd0S0Vkxz3xuBFPTv3QTC6NtGbsi4daFeQDMjIk8la73U53+I7cw68UnEsLfoUri
         RuVA5gHEhfxF6JNP+tnziiV0LE/DesZ7+/g4RytepNtn3Dgts4ZUmQkD3QGR7FvirPo7
         yGZlxNwY2/TmpDNsNfUwP2k3asFoBBir+SmLeZj/FjRuOUQBS91pNeZ0XZttL3tpAnUm
         eUr8NuiEDpb94eBC97xrNR7V/mBYbG02BSj2mdOgPncpzwUeUOSgECs5BcpJCyr3mefz
         aAjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=Jeloo7xjqd7jTwpQMyfeYlZRi7pLOYbvgrO+rlVUb9Y=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=MJs9Di6QOL5zsAZWuvNS+ft7NtOpplHcmLj+X/pmDub36VbBHVEQZ8gJJfnIK6NZaN
         Sc4hjEkA6OuhGL16Ekge060kcFPId/K6axTBR27k/6vR0KIVw0LZ5y/TKdG9+B3Lk0/5
         uWxXVObK2j1D2ksW2lXF/pQItgAAZLRll/tfQxAYMEVEinjBprkMM43dsX1aODk5CbWg
         970HDWQYhJq7fu953T7tcfXYZs5yEawb4XvimSEe6MklM4Jbja8XJtZUes8vfCWubrQp
         JwPK3j477Av5ZaC7zXBdNlgBlxrJxHXyJhB3Xc0DbIJ5oLoinZW4RsK6j7OiV7SUWwzO
         rQIg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m15-20020ac866cf000000b0042ec187fbdcsi510865qtp.42.2024.02.29.05.12.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Feb 2024 05:12:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rfgCf-0005h6-9T; Thu, 29 Feb 2024 08:12:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rfgCZ-0005Yx-OE; Thu, 29 Feb 2024 08:11:55 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rfgCW-0002dK-UA; Thu, 29 Feb 2024 08:11:55 -0500
Received: from mail.maildlp.com (unknown [172.19.88.163])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Tls4k2MZdz1h0cV;
 Thu, 29 Feb 2024 21:09:26 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 1B5A9180060;
 Thu, 29 Feb 2024 21:11:42 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Thu, 29 Feb
 2024 21:11:41 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v5 02/22] target/arm: Add PSTATE.ALLINT
Date: Thu, 29 Feb 2024 13:10:19 +0000
Message-ID: <20240229131039.1868904-3-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240229131039.1868904-1-ruanjinjie@huawei.com>
References: <20240229131039.1868904-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=ruanjinjie@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Jinjie Ruan <ruanjinjie@huawei.com>
From:  Jinjie Ruan via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: zX+UfkDB018b

When PSTATE.ALLINT is set, an IRQ or FIQ interrupt that is targeted to
ELx, with or without superpriority is masked.

As Richard suggested, place ALLINT bit in PSTATE in env->pstate.

With the change to pstate_read/write, exception entry
and return are automatically handled.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
v5:
- Remove the ALLINT comment, as it is covered by "all other bits".
- Add Reviewed-by.
v4:
- Keep PSTATE.ALLINT in env->pstate but not env->allint.
- Update the commit message.
v3:
- Remove ALLINT dump in aarch64_cpu_dump_state().
- Update the commit message.
---
 target/arm/cpu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 63f31e0d98..abb453f733 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1543,6 +1543,7 @@ FIELD(VTCR, SL2, 33, 1)
 #define PSTATE_D (1U << 9)
 #define PSTATE_BTYPE (3U << 10)
 #define PSTATE_SSBS (1U << 12)
+#define PSTATE_ALLINT (1U << 13)
 #define PSTATE_IL (1U << 20)
 #define PSTATE_SS (1U << 21)
 #define PSTATE_PAN (1U << 22)
-- 
2.34.1

