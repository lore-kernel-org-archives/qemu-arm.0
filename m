Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp792387ejo;
        Fri, 5 Jan 2024 07:45:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGKrE1rAqwn+JtNsAGbTzWUGhprP5q6dm99SGb9qyuHzaUkGYblRIx/w/J8KC2F36dl/R4j
X-Received: by 2002:a05:620a:22e6:b0:781:8c1d:16c0 with SMTP id p6-20020a05620a22e600b007818c1d16c0mr2691050qki.78.1704469512678;
        Fri, 05 Jan 2024 07:45:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704469512; cv=none;
        d=google.com; s=arc-20160816;
        b=U+D6KqqrgCJH4hyDqvnoemTzmj7kLivYFcw87RF46lRyPyx5PTQMoW9GA55mSX3f/P
         BYMxBW0pPkIidxv382ZO4UVQt7jkXqBDhpPl+rcvUuHqPKXCWNfqDjQhLZV2CAFn1kqg
         oFUC8/IAcelamB0l1rRzT5GyY8ILiaDS5vwTBCULFBaOSTnNb/oDojA5hVpE2LF+O8w0
         cIy5MUzLvf9ANPPKN2V6pzPKkZu3XIQD5P03hKYkAuegA+RUg9kccrqDzwKVJ21u+8ha
         i+VJvaZKSlnc7BFzxCvbh2cAqArde38Hx9O7aE4AsH0R7WWZhJgo9eIMQgsdwckFRlmU
         MeZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=3F01YLhzgjTdtmytUy5rbru1eD+VsYVlRXqJFlFh/Hg=;
        fh=6oFdbfvy2CilAP0eadDcmbW+cZmCcVYrHTIFJj2TpHw=;
        b=YMH/wfMuopaDLAr6NQ6so+CFu1agX4x5pFAlYB4Hq+v6/p81RaV8Zd4mO1tHaDu21F
         V72UjSE7V6TrdgQITRTpflFMUSpXjX2TpAmuDMb63mf29Rpcugi5YFo/Z8vtdM056bk4
         f6llVVJdpVNUHIraoKZIFzx+ReOWn/FlNcRQvoS1PMsJu9VMA8EHN/Ug7s7s1jXQGOjq
         52Kx3YGpi2lXf0F41kq5DBK2w5+hDluIJiDl/xlYIp+/uZLNf7Yzzadzo+RlWV0ZFxhQ
         LjR5d9zlz8MSNDfM5PbwmaDPBzTm+XS7oBPoLIJOlc3m/vW29CeT8O4FFM4fzAGTDEfA
         CIuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DTGr9hZh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s13-20020a05620a0bcd00b0077422d8fdd7si1997469qki.235.2024.01.05.07.45.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jan 2024 07:45:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DTGr9hZh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rLmN6-0006BQ-W3; Fri, 05 Jan 2024 10:44:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmN6-000670-8t
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 10:44:32 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmN3-0003JS-8C
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 10:44:31 -0500
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-33686649b72so1469407f8f.3
 for <qemu-arm@nongnu.org>; Fri, 05 Jan 2024 07:44:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469468; x=1705074268; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3F01YLhzgjTdtmytUy5rbru1eD+VsYVlRXqJFlFh/Hg=;
 b=DTGr9hZhGcXyItA9vjUOyMeef6a4deRm4PvKLmdkqvVLo5dIUmdsBNIeLo5GiLEvlA
 yhhnyjCuWApfTCU0EOFfPQegTY0Bp80Wd2xdRDjDCR/gmiWMMw9S4ujpGbmJG+aK7HYH
 hQ8xRgCXSRP+7yYh+ni8aNJm28sVXPXIHg2HJilj9y1LZbzQUJ06vXuMge1IPwX/4x61
 xDHddJih7EkNZ7xb8Kd79m4dEfcZLGzbLIWvlsDjDYuRF72T9yDjwptWP7gl+wKlsFTC
 QMxEpwke8fUiNJ8q6uatKNyD8bashtpV58ZCf4IwBPiJX+uSrdAfriE3KWVs4nGBh7Vv
 wt/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469468; x=1705074268;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3F01YLhzgjTdtmytUy5rbru1eD+VsYVlRXqJFlFh/Hg=;
 b=cKMqTxVWQS/si1JL2c8NPTr6GfphtoJiN8xFroV+hE9NX8SUW6/odve8S6Utgu6i1o
 z623gc+XSSqZbz+8re2nbWTFehX3wgIe1UO/qMGbUQMwGWUkjuRs5xiVtuLUKPy9vt1r
 5Bl4uqONYRvV0/ZUJBB8qLf6BpNFGSTL9R+LNFh5oI0Ni08u51NMFYOXWkF+Bwga3Qh+
 FY9zUPVCx8Fy5GCW9WUzHUfPRipmizEw1DEawBDutwNvkC6PHlrhJtxoZMZI/hy4JtgS
 NhCJ7V65u+Wh158NZlvHEUgJOsxXHhveMu+X8CsRRQAeCd2HdcZrbj1EZgmAGPi85Y17
 fJKw==
X-Gm-Message-State: AOJu0YwlvncotTk4mfNUkKyTyLTaqUKel+oexE05FTM+y3VaLHmkovf2
 QK/9gmFwY2kxalLpV3p30/2cvwrzyoaFYQ==
X-Received: by 2002:a5d:638d:0:b0:336:95d2:c649 with SMTP id
 p13-20020a5d638d000000b0033695d2c649mr1282677wru.125.1704469467904; 
 Fri, 05 Jan 2024 07:44:27 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 p17-20020a5d4e11000000b003365951cef9sm1605022wrt.55.2024.01.05.07.44.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:44:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Gavin Shan <gshan@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Song Gao <gaosong@loongson.cn>
Subject: [PULL 13/71] target/loongarch: Use generic cpu_list()
Date: Fri,  5 Jan 2024 16:42:06 +0100
Message-ID: <20240105154307.21385-14-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: yljLuptKJY4t

From: Gavin Shan <gshan@redhat.com>

Before it's applied:

[gshan@gshan q]$ ./build/qemu-system-loongarch64 -cpu ?
la132-loongarch-cpu
la464-loongarch-cpu
max-loongarch-cpu

After it's applied:

[gshan@gshan q]$ ./build/qemu-system-loongarch64 -cpu ?
Available CPUs:
  la132
  la464
  max

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20231114235628.534334-14-gshan@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/loongarch/cpu.h |  4 ----
 target/loongarch/cpu.c | 15 ---------------
 2 files changed, 19 deletions(-)

diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index 00d1fba597..0c15a174e4 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -466,10 +466,6 @@ static inline void cpu_get_tb_cpu_state(CPULoongArchState *env, vaddr *pc,
     *flags |= is_va32(env) * HW_FLAGS_VA32;
 }
 
-void loongarch_cpu_list(void);
-
-#define cpu_list loongarch_cpu_list
-
 #include "exec/cpu-all.h"
 
 #define CPU_RESOLVING_TYPE TYPE_LOONGARCH_CPU
diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 81f2d8d8ed..87dfcdb0a5 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -483,21 +483,6 @@ static void loongarch_max_initfn(Object *obj)
     loongarch_la464_initfn(obj);
 }
 
-static void loongarch_cpu_list_entry(gpointer data, gpointer user_data)
-{
-    const char *typename = object_class_get_name(OBJECT_CLASS(data));
-
-    qemu_printf("%s\n", typename);
-}
-
-void loongarch_cpu_list(void)
-{
-    GSList *list;
-    list = object_class_get_list_sorted(TYPE_LOONGARCH_CPU, false);
-    g_slist_foreach(list, loongarch_cpu_list_entry, NULL);
-    g_slist_free(list);
-}
-
 static void loongarch_cpu_reset_hold(Object *obj)
 {
     CPUState *cs = CPU(obj);
-- 
2.41.0

