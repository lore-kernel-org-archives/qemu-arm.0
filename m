Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp521661ejb;
        Mon, 18 Mar 2024 02:40:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVeNeEbBqXplcOwUDABzHDgWCo8SI7XsfYpNTSGr7827pw+cYiB/8Av43v6NrC6+jiCjletsiEyfE1O5BAQ0IOF63Urpqdf
X-Google-Smtp-Source: AGHT+IGk9H2X/VJozzMQfnWexN66XNrTtm80qSKBN1500EwfxzgmYWLu9Oq9uF/Y8SdT0AKWvjt9
X-Received: by 2002:a05:6214:810:b0:693:7301:915a with SMTP id df16-20020a056214081000b006937301915amr5938729qvb.55.1710754802219;
        Mon, 18 Mar 2024 02:40:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710754802; cv=none;
        d=google.com; s=arc-20160816;
        b=E2Ps/FcRSFwadTkRbQlgg0PBwGTAunvw9T50SyBKkwRSkUtk52YZ05iBf3CeFpUjFT
         gTKU48M430fSXzt/9Ilxx2tLLEic85pskX90Mx1f3a/WiBbQQjwktZ6CUEmochswRJv3
         ElwV+/kQniSP4TVumDIJz9fxsC/kNGZIgQ9Cutoa0r9I3bpOQEgszPrPelxE1FOpYiZ5
         hcKMdpCMpK1IV00IzwhRKmvOrFTR13eTymk41/+rFe9dwhtqPgdUMQ+y7zg5Hcp9f/Gs
         Zl71j+85+UduN443gB/POKuoRkZD88VbtTYYKJnctJoNOc3FdORNbzAMNr97cWd1yeOx
         umwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=6isEtGqC/xkVhiOwzs1udE8M7np4HLCHPTCpQhwXgaA=;
        fh=dR6uRwfo9om/DmWDsGu5eY7/2T4Nd7sHG4YVwbPnVj0=;
        b=JSyCpwhX0WOOqHWmFzr3lbZ0/lXbwsry5VXbAL9vt4G1Z65xG0lC0zoUkpZQZUE6Xh
         RzxtkF0yID/+EI7itDs/o2Hrb9hpwBBWvJN9BlqtAsEi6KipsR7D+uFbHZ2zPFFFbV8z
         HSmnUpgLJKjY891Da6OQhfs6wwN8SNInPxytBzB5W7P4evORj17OrrYaiP/6eNze4yGL
         I6kbfu6eMUfHYdnMa7jPmkGdfXg6Rb+OJqa0SqhrYJSreoxoCXsvMGpnsHPDExemCn3E
         zn1rXTyxEd2dNVLhXlR5d5PB3OIjGXuRoGcLssoZoqE9Nn4RoPxPRXYoenqFnMJszXWb
         p8rw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1-20020ad45c41000000b0068fdd6d16easi8493964qva.554.2024.03.18.02.40.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Mar 2024 02:40:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rm9Qs-0003vn-PW; Mon, 18 Mar 2024 05:37:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rm9Qo-0003tl-3d; Mon, 18 Mar 2024 05:37:22 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rm9Qh-0000tx-3J; Mon, 18 Mar 2024 05:37:21 -0400
Received: from mail.maildlp.com (unknown [172.19.88.214])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4TyqVR1XCWz1vx6J;
 Mon, 18 Mar 2024 17:36:15 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 910881A016C;
 Mon, 18 Mar 2024 17:37:00 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Mon, 18 Mar
 2024 17:36:59 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v8 02/23] target/arm: Add PSTATE.ALLINT
Date: Mon, 18 Mar 2024 09:35:24 +0000
Message-ID: <20240318093546.2786144-3-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240318093546.2786144-1-ruanjinjie@huawei.com>
References: <20240318093546.2786144-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.32; envelope-from=ruanjinjie@huawei.com;
 helo=szxga06-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
X-TUID: Fy8Gq8yxMBpg

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
index bc0c84873f..de740d223f 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1430,6 +1430,7 @@ void pmu_init(ARMCPU *cpu);
 #define PSTATE_D (1U << 9)
 #define PSTATE_BTYPE (3U << 10)
 #define PSTATE_SSBS (1U << 12)
+#define PSTATE_ALLINT (1U << 13)
 #define PSTATE_IL (1U << 20)
 #define PSTATE_SS (1U << 21)
 #define PSTATE_PAN (1U << 22)
-- 
2.34.1

