Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp793389ejo;
        Fri, 5 Jan 2024 07:46:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHi6Zfovy7E9KCNLII5WLHIuaqHTe02nYAf9g/5w3R82f18F0v/mAyrM1bep8CXTZ5C+qWX
X-Received: by 2002:a05:6214:c49:b0:67f:935c:3b22 with SMTP id r9-20020a0562140c4900b0067f935c3b22mr2212262qvj.108.1704469619122;
        Fri, 05 Jan 2024 07:46:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704469619; cv=none;
        d=google.com; s=arc-20160816;
        b=UF1cYJvnekDYhjQa+5jtjMW2hqYbBRu0ZpQqwbKVczdJYoRxHuf+DB0RWLm90mlTPw
         RSzEiJVBHw/NJ17yh6r+8YP0oNu031+mKeGenBtdzDpBvsB19Imd6xKdQ1ldwAAgDuz9
         fxuUeW0AxUmYsQmMjdAZuGGalpkMN1D7DbGp853lbUGs5PoHdAkIXG0nD6TlI2o5qu+p
         VQVoKkPnX6qkY0Ii9YChA1NP7w5Xd5687qHzQszG9uRnSCtTIqLeGw3s7LUVXVFvXxRH
         Jtzrkl7Ktri13XFY3L1vpszAAbJUxkbPvsAIMr+20B6qkdxmt1ZwZ6pSDjjkjlHO2HP9
         NKtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=35Qj0GQ7d4D1oUKsUxN1TKydmHhPRhj2Vw6etTCLPUc=;
        fh=H0WIw/NHiiCiwDJxIX92QzZyeLHCYfKeqgKtC87XE+8=;
        b=f/K6JRvHWAw3tO3Ohgry3W/u7SEQNEIOom6rDfTqqJwzf99Lg7hlJK3kH2s6a3g/90
         p4+sQ2pLOOFlQXdTmgxKvNTP25K3Rx1IMvTdRPwNZJvmEwjYnWKVeFvO7wlO/NEI145K
         14TlcfgOFT6zT6yLOY5cTzoRaqibVbDBcC000cftnV6qiFkWEYV8f+3XRtn3TrgXjamv
         nrMylbzqyP4adYZ+Erv7QmQwbbQNfVOe29afjZXYNxt7wsHRaT2FsZycQwiZ+IbHxnT0
         1bbxoT9YvvsOyl6Gr9spkhGpkxH2I4v6YFoGfZnle1onh499eEWYXv30spR+H2Uvn6XL
         PxKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SXSzjN5z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u16-20020a0cf1d0000000b0067f97827247si1974664qvl.541.2024.01.05.07.46.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jan 2024 07:46:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SXSzjN5z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rLmPA-0002rD-Tv; Fri, 05 Jan 2024 10:46:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmNv-0001K1-4l
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 10:45:24 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmNs-0003hb-2O
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 10:45:22 -0500
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3368ae75082so383207f8f.1
 for <qemu-arm@nongnu.org>; Fri, 05 Jan 2024 07:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469517; x=1705074317; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=35Qj0GQ7d4D1oUKsUxN1TKydmHhPRhj2Vw6etTCLPUc=;
 b=SXSzjN5zWyCXIfuZZULVsIf/YAdeDLpQCLtYiKQhEQtIHCOg/tCEsdJN/o+54bniXf
 yxCOPKOOmUMnEo+/5umcL85i2lGcovdlzX8xbcn9evrNe7kQR+4piIgVl1P9rldaiL9f
 Y10HYqmNWsjYgE/jhxw8Owjwv+s62l145nLxzWuyOZBAHgSyOfQ1VVmttTr6ns2New1C
 o8N0VNsBPdGTbDdABtt5Z4wW67LwmimbgAuCpVl7ZEe368NIYezMmtJ04nlc7koX8rmt
 gt8CHJ4ZFgksOIBFouDmTwHKsIg+Xy5CnWtA5RBSrstj4WzONT+nHi9cy7BdQI4oR7D6
 66mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469517; x=1705074317;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=35Qj0GQ7d4D1oUKsUxN1TKydmHhPRhj2Vw6etTCLPUc=;
 b=jblQe8XmxZkFCjFiZ0jkPch0Afejub93/G3c43kC2O0OxMKBQco3v0mF+MiXjDo+J3
 1JybeuLluel/kfuLgx50BEDno2THn2gAz7bQaHCnmGs2rvx+6m8IZf6RcR+qt4d2/Hk4
 MU2+TON3nalZV9IdHFU5CqqvbLAmDrp+Q3tPnBY4RNLdTXAHeP6Ny3Sa8/P+Ovo/07M7
 JRfL3I2DbFClPX3ICW22iHuX0sCKI48ZVUhhSJUitaniBDjgtjzpJnPH65PcDVqgqo+D
 QWcQmknXuByTGpK071eIqS/KfPa6OM9mSnd3FPbu7wr/qVcwXTBeuJRJxJnWE/gJR2KK
 SN1g==
X-Gm-Message-State: AOJu0Yxdudxd+fQ4cEegnCUK+tcWSfMVN93Icx3FB/ffC6l2uGHoIZ3Z
 oDtarCHQ4HOZAa/IxXCJ7hQQ29Qtcgi1gg==
X-Received: by 2002:a05:600c:3482:b0:40d:922c:3fa2 with SMTP id
 a2-20020a05600c348200b0040d922c3fa2mr1276114wmq.166.1704469517228; 
 Fri, 05 Jan 2024 07:45:17 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 i1-20020a05600c354100b0040d8ff79fd8sm1942471wmq.7.2024.01.05.07.45.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:45:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Gavin Shan <gshan@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [PULL 20/71] target/tricore: Use generic cpu_list()
Date: Fri,  5 Jan 2024 16:42:13 +0100
Message-ID: <20240105154307.21385-21-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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
X-TUID: 5ttiY8bxT9fm

From: Gavin Shan <gshan@redhat.com>

No changes in the output from the following command.

[gshan@gshan q]$ ./build/qemu-system-tricore -cpu ?
Available CPUs:
  tc1796
  tc1797
  tc27x
  tc37x

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20231114235628.534334-21-gshan@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/tricore/cpu.h    |  4 ----
 target/tricore/helper.c | 22 ----------------------
 2 files changed, 26 deletions(-)

diff --git a/target/tricore/cpu.h b/target/tricore/cpu.h
index de3ab53a83..2d4446cea5 100644
--- a/target/tricore/cpu.h
+++ b/target/tricore/cpu.h
@@ -246,10 +246,6 @@ void fpu_set_state(CPUTriCoreState *env);
 
 #define MMU_USER_IDX 2
 
-void tricore_cpu_list(void);
-
-#define cpu_list tricore_cpu_list
-
 static inline int cpu_mmu_index(CPUTriCoreState *env, bool ifetch)
 {
     return 0;
diff --git a/target/tricore/helper.c b/target/tricore/helper.c
index 7e5da3cb23..174f666e1e 100644
--- a/target/tricore/helper.c
+++ b/target/tricore/helper.c
@@ -96,28 +96,6 @@ bool tricore_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     }
 }
 
-static void tricore_cpu_list_entry(gpointer data, gpointer user_data)
-{
-    ObjectClass *oc = data;
-    const char *typename;
-    char *name;
-
-    typename = object_class_get_name(oc);
-    name = g_strndup(typename, strlen(typename) - strlen("-" TYPE_TRICORE_CPU));
-    qemu_printf("  %s\n", name);
-    g_free(name);
-}
-
-void tricore_cpu_list(void)
-{
-    GSList *list;
-
-    list = object_class_get_list_sorted(TYPE_TRICORE_CPU, false);
-    qemu_printf("Available CPUs:\n");
-    g_slist_foreach(list, tricore_cpu_list_entry, NULL);
-    g_slist_free(list);
-}
-
 void fpu_set_state(CPUTriCoreState *env)
 {
     switch (extract32(env->PSW, 24, 2)) {
-- 
2.41.0

