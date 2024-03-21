Received: by 2002:a17:906:bc5a:b0:a46:bbde:2c08 with SMTP id s26csp489930ejv;
        Thu, 21 Mar 2024 06:11:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX6YvsGZEcLgLPWi9iVC7givcs3yCBWZefTIWBPWrHwQdFyLaVG8YJc/RmobuJ3FpH+NCe+E2oA0G9wOTFlQh8HUeKqwCH2
X-Google-Smtp-Source: AGHT+IESMDzmZNN9C1wjJB1zbtFLuNHjy+XyByZE536TeMkoOyWy7U1uoKql8kh3asYAYny4oZns
X-Received: by 2002:a05:622a:15d3:b0:431:1285:c0cb with SMTP id d19-20020a05622a15d300b004311285c0cbmr1852801qty.0.1711026716389;
        Thu, 21 Mar 2024 06:11:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711026716; cv=none;
        d=google.com; s=arc-20160816;
        b=JWGRgdlcjZhBZAj4l+P1eOEwBpGdHmyPyXD+DvDajU88hIwUzF62t9I2PJ4+MHv3Yf
         oXkuooqf8+SPhlNdnvUUjOMFCtqrDz88HORtGpSClhjpQRcERN3IsoCxGcodSUgz9wzY
         QHP3jPlIpFoTkM2ljM2pat/XNFBN5QbBNsR02sDw2YhXffvTG8I5tsAnBZT/pAaLY+kn
         eX4ylHI9dUckANYePnFzHt5vJlAGGqRdTjQkeitkFkZXxGP1wpv3GiQAgt8l7vG+JvEE
         i9eiU1BMFwMUSOkJkUhTMMnq0Oqs6ErdLz+CaUO2Ii3dIHsCpcDJ4IMoT0ls9K37YVkB
         vOUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=6isEtGqC/xkVhiOwzs1udE8M7np4HLCHPTCpQhwXgaA=;
        fh=dR6uRwfo9om/DmWDsGu5eY7/2T4Nd7sHG4YVwbPnVj0=;
        b=S8oBR4OgYqTdTC6+IHbQsizi9ZB74B5tu6ELPX2ZpTKWN2fH/zjuaYftlDRnUTnFBf
         zXOLthkHmBE8YkBNiEGT/q1iIQdhLr0c/9LAFgZh44sdFRRTt6GGe1rnfNE0FwkuleyT
         i/eWQEhdlhG5jfg8t8hGnbQ8mHaMPkqfV6Z6d/YMIDR6SGof6GgQFYBp2IznEnzwtrln
         ly1kzBY8ldIN4lUbHqDuoMZsm+kBh8kF19QBshjGI8HDCF0X5RPh2/aH7fycnDlAQhKd
         AQBH1ozi33ECOOUsJD3jdQvjQnUcs16GXI9nYb48slWX9KlflTi8w+FI/qtUm0TKISCu
         fJfw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s18-20020a05622a1a9200b00431144d16bfsi2924422qtc.435.2024.03.21.06.11.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Mar 2024 06:11:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rnIAn-000750-66; Thu, 21 Mar 2024 09:09:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rnIAl-00074Q-UJ; Thu, 21 Mar 2024 09:09:31 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rnIAj-0002oC-JJ; Thu, 21 Mar 2024 09:09:31 -0400
Received: from mail.maildlp.com (unknown [172.19.88.163])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4V0m46130rz1vxBd;
 Thu, 21 Mar 2024 21:08:38 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id D8E6C180060;
 Thu, 21 Mar 2024 21:09:24 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Thu, 21 Mar
 2024 21:09:24 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v9 02/23] target/arm: Add PSTATE.ALLINT
Date: Thu, 21 Mar 2024 13:07:51 +0000
Message-ID: <20240321130812.2983113-3-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240321130812.2983113-1-ruanjinjie@huawei.com>
References: <20240321130812.2983113-1-ruanjinjie@huawei.com>
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
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Reply-to:  Jinjie Ruan <ruanjinjie@huawei.com>
From:  Jinjie Ruan via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: RcmJo3I89+e7

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

