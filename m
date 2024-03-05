Received: by 2002:a17:906:3750:b0:a44:3ba0:e9d1 with SMTP id e16csp111810ejc;
        Mon, 4 Mar 2024 23:05:57 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWSBKdvcHlsfY8ByJ7CbJf7L05OU+fpmGm3srrpC4E6NfhUpHzW9mdn5FR7UOukbaFFgscQPNadzS3ScBByL7IaDq0YNw79
X-Google-Smtp-Source: AGHT+IGakdSg57SMSSto2KgPpAGB+UEXtjhQbPCBOsUrJfA9u+pW0ZCloT0aMWuX7A465Pl5bH2l
X-Received: by 2002:a05:622a:110b:b0:42e:dc52:ba64 with SMTP id e11-20020a05622a110b00b0042edc52ba64mr1725354qty.32.1709622357134;
        Mon, 04 Mar 2024 23:05:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709622357; cv=none;
        d=google.com; s=arc-20160816;
        b=Tk3OPxz7BdU0xFPF1tm/Vn92zbT4yhXE1MAHZsZnc7/FGlCwbXBWrFD+QhRSx2127R
         6zNSQ/SrEXDxq1dc/pjv95rgc75VBVCTfeiH7A5S65YqBM34olpOJBxSw3ostp0f355+
         CCPThgoIw9NMGY9HdzRctIKb/Rcuhxewxp1FOovCdJ97DuPWetaDIQcEvdiKN0en62PQ
         tBuEzaz8L+E/H3rp/R2dTSnDVGWo57O9LZiGQXtuF6vMiVQIRPUvonf6wQh19f2msYlB
         R8XLT+K706r/W+j/cT+ql7a62Fqk80auY/to1EfJQxVXjbjvhUGMIpRxogM1wb369a9W
         MAUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=SFd0FzKVIily9tuo5NGY2oR5RjxOZt/wtm9FgkW4V5c=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=K+Jj5vZu2dkZkQbZnXT1zA2rgZguPuAgmNgOwKWu4s6V+6iWvZ7nBDV4gyJOAUBG/a
         CNJb5dLIEjN731xWzWluBN2D+uTvpjEoJMjkfbwH8jUR/U7VIgZdgkAQmTD/M82GVrFk
         zi4u7cE4KHE7C1Zi9ocyQ9S74HzL67BacAq9eI1CScMeyZKCpCwxWJIAQUGWpw+OgTEr
         Ujoo4UeF7AZkgZ4G8RZ8Xkz7uuAQjo7cTC9HNLcckXWa5f037Es+ZNHh7B3w9pmjhHH9
         l/nriG4xfUsQ83Z5+Y6UUMTudX9vHmIMD/D63X/AL08/OVmoiYLOn6+QMga0QQe4kY23
         T/Bg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 2-20020a0562140d6200b0068f45b80656si11310621qvs.138.2024.03.04.23.05.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Mar 2024 23:05:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rhOrr-0004Ws-FU; Tue, 05 Mar 2024 02:05:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rhOqz-00047T-CI; Tue, 05 Mar 2024 02:04:48 -0500
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rhOqu-0008QJ-Iy; Tue, 05 Mar 2024 02:04:44 -0500
Received: from mail.maildlp.com (unknown [172.19.162.254])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4TpmjC4Lx9z1Q9Gf;
 Tue,  5 Mar 2024 15:02:39 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id C21F818006C;
 Tue,  5 Mar 2024 15:04:35 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Tue, 5 Mar
 2024 15:04:35 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v6 02/23] target/arm: Add PSTATE.ALLINT
Date: Tue, 5 Mar 2024 07:03:10 +0000
Message-ID: <20240305070331.2151131-3-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240305070331.2151131-1-ruanjinjie@huawei.com>
References: <20240305070331.2151131-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=ruanjinjie@huawei.com; helo=szxga08-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: b1Duhhh7SoHP

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
index a5b3d8f7da..9402d23a93 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1536,6 +1536,7 @@ FIELD(VTCR, SL2, 33, 1)
 #define PSTATE_D (1U << 9)
 #define PSTATE_BTYPE (3U << 10)
 #define PSTATE_SSBS (1U << 12)
+#define PSTATE_ALLINT (1U << 13)
 #define PSTATE_IL (1U << 20)
 #define PSTATE_SS (1U << 21)
 #define PSTATE_PAN (1U << 22)
-- 
2.34.1

