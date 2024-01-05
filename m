Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp792398ejo;
        Fri, 5 Jan 2024 07:45:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG5z4tlNd71g0rM4BQxDlJrAPVA8/Eu3vjnkDqmhUtuN4NZB8Z0bKfX3volUqs42vd8nvfP
X-Received: by 2002:a05:6358:63a5:b0:172:cb8d:71de with SMTP id k37-20020a05635863a500b00172cb8d71demr2048834rwh.62.1704469513752;
        Fri, 05 Jan 2024 07:45:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704469513; cv=none;
        d=google.com; s=arc-20160816;
        b=FlJynZs1nJJfH5TSxhh/BDddBgk/3cS+LMkEFCYEHQSW22XaKI8NCc3riJRRnKsXIs
         ib/QqiERo2E3itYdAQUdGx9pgbnh0ceUE/hmfgJY94BqghLECx94E9N5BKu+4gDZYOJd
         Pxx/fv/WcNulRhcRlococ6gFZLzOwIN8up5ZFa0X0+pCPNIu9g4O8FYcB+SGA/E38VBW
         JxVhmNpWJ5Gmz3BznxgwEbcJ9ge0u9liHV+1wm6MT6VLtuSWGjtV3bwyiSv7/AcYh1j/
         87dGMiI+XzU83jzS175MLTWAJIGcvDwlfSsz+uevYyDFLIA05c3deOfbzJf9LTui25c3
         qCuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=MTyqf1UOhmXWKWjB2kbjbecKyF9tbZD+k3iPAVC8zqk=;
        fh=ZfmZ91dT2fDtwL0voXDf5Nuiara66u54o8Fu7OweU7M=;
        b=ZfaX7wJvgaiL03hZvaJxXlEHYHFl+OxrANCfVFD7tPDLi+cDvKNHxTMFdEs9bzLfS2
         qtpLFj8LSzeNMCuSGHm/cW9ChBXiDBhVDBrKi+OsbeE7ctwRqXFupl3kyouDweex/LCr
         UzV0la+ieBCMZHrhttKKQp43oPw3fOZSKavFYF9NYcKA/epAZN765JrdFbX26kHlbZ0p
         Zn2+WwbwcVvDRp+6l+n877jLoHFL2zJjqyVMaToT2mXMILoY63ZeEaJPSWYopYSVpht5
         pMEZTb6MrUER7rmUD0UiNTRi7/IvYj1IttLmgZz/6v+ZFxNLPhrjCHvxAI+qgj6qFeWV
         QkKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HHmzfCby;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g2-20020ac87f42000000b004283ef47c2asi2125896qtk.109.2024.01.05.07.45.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jan 2024 07:45:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HHmzfCby;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rLmMq-0005NC-Em; Fri, 05 Jan 2024 10:44:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmMn-0005D2-SE
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 10:44:13 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmMm-0003F3-2m
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 10:44:13 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40d4a7f0c4dso17354135e9.1
 for <qemu-arm@nongnu.org>; Fri, 05 Jan 2024 07:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469450; x=1705074250; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MTyqf1UOhmXWKWjB2kbjbecKyF9tbZD+k3iPAVC8zqk=;
 b=HHmzfCbyDxgSNouK5PFaSTbIUfIyKA5KYDHdhQCM/v59CT/QVijLLoxM9MzIIlI8lk
 bzYTlobLBFs4KVVjenCvEkCw5I5Wy45FprpKkVv8wGc9PflKoqwb0nMU4etKQNytio+L
 pDHcbO3/fXusXREE50o/AH/HCe/n0Ict/ytBu2Y79mxe9HuDmruDJ9OKViQfxCFoaESR
 0r7nsi8wFWRf5zhZMs2TuhZGNijGgN7zjRbdEroqN9KabFo57RNTrmXvdHp3gj9TWXKK
 eWa4SLmc/aJV2Gupw+FYDx0sP14G0nJUBlc+DCE2K3wFg6kM9Upv84+hA3lzkq8TjO8O
 Azkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469450; x=1705074250;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MTyqf1UOhmXWKWjB2kbjbecKyF9tbZD+k3iPAVC8zqk=;
 b=hrZKfW1XbaGiw6qigpEknw7ZBkKCd7c6N67IS307OrRx125dZs3A/C1wLs79UA5CaV
 JZUNnnhqi0cqf6HtecSZvWoExgiDFKxTokwVceaviwOCUIXHrUFjtKsllg/6SfYfMx8p
 6pAChaenKrfnnTxueW0a4xMLh7oXB3+XwdV+xoH6Dhu29irgTQ7qEcNaDUUtpLhj9AXo
 ql9lsSSeCflLvvqyAQyfLwiEX3LeG8UvQCSKPxl2j8qd5CaB7Y3SU3FcZxcoTymTprhJ
 qfMmESo+H4aQGXUTAtrdFjP2+rihjwBsDmGHz3W7Xsac49k1alNLzXHdYGZujvq+3ule
 iPmw==
X-Gm-Message-State: AOJu0YyYWSFeZTKs/7aeT04waeWAGiU6/5E0ddtG5KOnzLA/R68angvj
 2xIWk9EQxlRLOw0Q+yscuquc+x389G7aYg==
X-Received: by 2002:a05:600c:5487:b0:40d:6e2f:da7b with SMTP id
 iv7-20020a05600c548700b0040d6e2fda7bmr1311698wmb.13.1704469450494; 
 Fri, 05 Jan 2024 07:44:10 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 d3-20020a05600c34c300b0040c3953cda5sm1950432wmq.45.2024.01.05.07.44.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:44:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Gavin Shan <gshan@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Brian Cain <bcain@quicinc.com>
Subject: [PULL 11/71] target/hexagon: Use generic cpu_list()
Date: Fri,  5 Jan 2024 16:42:04 +0100
Message-ID: <20240105154307.21385-12-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: BUKgTy4xvokW

From: Gavin Shan <gshan@redhat.com>

No changes in the output from the following command.

[gshan@gshan q]$ ./build/qemu-hexagon -cpu ?
Available CPUs:
  v67
  v68
  v69
  v71
  v73

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20231114235628.534334-12-gshan@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/hexagon/cpu.h |  3 ---
 target/hexagon/cpu.c | 20 --------------------
 2 files changed, 23 deletions(-)

diff --git a/target/hexagon/cpu.h b/target/hexagon/cpu.h
index 7d16083c6a..5c11ae3445 100644
--- a/target/hexagon/cpu.h
+++ b/target/hexagon/cpu.h
@@ -37,9 +37,6 @@
 
 #define CPU_RESOLVING_TYPE TYPE_HEXAGON_CPU
 
-void hexagon_cpu_list(void);
-#define cpu_list hexagon_cpu_list
-
 #define MMU_USER_IDX 0
 
 typedef struct {
diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
index aa48f5fe89..c0cd739e15 100644
--- a/target/hexagon/cpu.c
+++ b/target/hexagon/cpu.c
@@ -32,26 +32,6 @@ static void hexagon_v69_cpu_init(Object *obj) { }
 static void hexagon_v71_cpu_init(Object *obj) { }
 static void hexagon_v73_cpu_init(Object *obj) { }
 
-static void hexagon_cpu_list_entry(gpointer data, gpointer user_data)
-{
-    ObjectClass *oc = data;
-    char *name = g_strdup(object_class_get_name(oc));
-    if (g_str_has_suffix(name, HEXAGON_CPU_TYPE_SUFFIX)) {
-        name[strlen(name) - strlen(HEXAGON_CPU_TYPE_SUFFIX)] = '\0';
-    }
-    qemu_printf("  %s\n", name);
-    g_free(name);
-}
-
-void hexagon_cpu_list(void)
-{
-    GSList *list;
-    list = object_class_get_list_sorted(TYPE_HEXAGON_CPU, false);
-    qemu_printf("Available CPUs:\n");
-    g_slist_foreach(list, hexagon_cpu_list_entry, NULL);
-    g_slist_free(list);
-}
-
 static ObjectClass *hexagon_cpu_class_by_name(const char *cpu_model)
 {
     ObjectClass *oc;
-- 
2.41.0

