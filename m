Received: by 2002:a17:906:9502:b0:9a1:fa4e:495e with SMTP id u2csp1834972ejx;
        Mon, 11 Sep 2023 23:58:30 -0700 (PDT)
X-Received: by 2002:a05:6a20:8407:b0:14c:910d:972d with SMTP id c7-20020a056a20840700b0014c910d972dmr11472723pzd.12.1694501910383;
        Mon, 11 Sep 2023 23:58:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694501910; cv=none;
        d=google.com; s=arc-20160816;
        b=xrAR9xQpCfPivFTI11a285ypEVQdaIqstxLHecXkBH9zCm0vLnZagMNlatSNKzj4vu
         daHxvZ3LWCp5iFuczepoy6mM668wCF+45SSIcGIy52pPbsfXFpVLGFZkIaII9TmGqWWL
         fhpXhIx0tfSkXejqe5Nhy7peIOMHNrzf5Cmw8OL/9XPO6tbS/mMJfHb0zykQn5hfhH0R
         HXbQOZfNSAHBxnExyzwQY5AXTtHqE/SZu+QaAXhzsi2rGYAKVVIMSM8+CsUqJYNjBlW6
         w72Zs4zfhFCCW4wuC5xzlUL/znQbHFKx5edL9xnmORncDq+t+N6hdC2RUksccgPqfiHZ
         5zew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=H0ux6zXnF8QbZYj0sOR52aBDTFuqL60bkneT20E5OaM=;
        fh=YpTETbZtebhjC8z2x4gkua4FkcYm/rAkTkMi+6D+Yvk=;
        b=APSBwNn1DC+XgF78HTCvpKB85G4X/K1MWCRSTCstQ1xUMfEokpkyW+zGFOaXG/eAMV
         REJqKXzuVDCiR92aLTQ5BOuHqz2dw+wnnWN8bbvtaogQHT2KKqquihhMrhO57wmcbAeE
         CUcu3otyhltav/G/V9QWbA+h5k/0+mC37Jkn19zKUj0VKf9S8LA6ef2yWDXHnNvmkUU9
         N9ey6/YCGKeZ9rAMZrK4ZQThwEXxRhVu4MMMWmSc9ErUH8HYhMybUfPSdJf+0Wvucx4G
         uq0XHv//FIQXIczUOZSGB36zbLDte3nwXHd4V6xBg3fOVDNWtBrw7S6+ix2o0wC/LiZN
         kbEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=D8G4uH09;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q13-20020a170902a3cd00b001beef3addcdsor5262823plb.8.2023.09.11.23.58.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 11 Sep 2023 23:58:30 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=D8G4uH09;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1694501910; x=1695106710; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H0ux6zXnF8QbZYj0sOR52aBDTFuqL60bkneT20E5OaM=;
        b=D8G4uH09Pg/GwTmTFBbY8PwGDIik8rCaJdgx9ybyTcRZimUybOyAp7W+pKPiYOTjJy
         BYKwsoHA8nQhdocq2WeIJGLcQsO0nIprdOUQqdPdG2hzObww0NOEAUrBJrAQn5wJCZDu
         0llXjfmpE3whVTAoW2FN9QM8/r8hBCsgVVirhIrRN2ykeg9s0pCqV50y4vA4AsArKgas
         RDzJZ/Nf92mAD/JOk7cBxYiT74X5chx1WXshaP1Bi/lz4cmAdBsiryc6H0en4ojX0hOs
         oDiO9PN6kpVbLLOX64b0dlZTCqBFKDZyXJzYOdZSy43mMDL9MQzkDFaFw1y0CuDeX/2a
         +Hng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694501910; x=1695106710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H0ux6zXnF8QbZYj0sOR52aBDTFuqL60bkneT20E5OaM=;
        b=cVvxd7KRahZDhB1RufQ97K7jCZqZznd4/WbebSHtUAjILrsVQorjfTdg9WQGJEOCbp
         txVZr7KnwXZsF34TZa+pQKEH9Bqld7dQZt+nHKuDEdgnsi5OsDLP47JQziTW0QtOG/do
         blZaIeu4yHIuWmQ/13sNyDHbu0/oN9cHuzrCXBdA89uXq0x26h/qsYq5cs2u1GVZYCzQ
         PDfc17DT4fMqOXQPWjgDNMZbjhodg+6KWBqXUKFDTb/NSqfxxIDcB6n1dXvhmJ5sRGsY
         ngLm5WnQwEZq6YPYa9ifevkDrK8+rlS2tgAHik94RmA57squd7VkGLcUiBK5Ch2s33dk
         9/dg==
X-Gm-Message-State: AOJu0Yw0hSDRWGvSBrdFhAVYqh/3ti3akn5zoDD0nljf1dVUkcj/h3Ik
	VYNR+nA7tmEb5d+hUWq/YIo4U29dmIQ9kQjaqps=
X-Google-Smtp-Source: AGHT+IE9BmXdH2WuD83XTg3yQOLtHh+/54bugNv/vjSDhlSJPZa/LsXSxhUA9w90AtnU/ar34m6nNA==
X-Received: by 2002:a17:90b:150:b0:273:d42e:50f5 with SMTP id em16-20020a17090b015000b00273d42e50f5mr9743278pjb.46.1694501909795;
        Mon, 11 Sep 2023 23:58:29 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id i8-20020a17090a2ac800b002696aeb72e5sm9315058pjg.2.2023.09.11.23.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 23:58:29 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Mikhail Tyutin <m.tyutin@yadro.com>,
	Aleksandr Anenkov <a.anenkov@yadro.com>,
	qemu-devel@nongnu.org,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH v2 05/11] target/arm: Move the reference to arm-core.xml
Date: Tue, 12 Sep 2023 15:58:00 +0900
Message-ID: <20230912065811.27796-6-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230912065811.27796-1-akihiko.odaki@daynix.com>
References: <20230912065811.27796-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: FRhQQGVUXj7a

Some subclasses overwrite gdb_core_xml_file member but others don't.
Always initialize the member in the subclasses for consistency.

This especially helps for AArch64; in a following change, the file
specified by gdb_core_xml_file is always looked up even if it's going to
be overwritten later. Looking up arm-core.xml results in an error as
it will not be embedded in the AArch64 build.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 0bb0585441..6ff6ff2d55 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2389,7 +2389,6 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     cc->sysemu_ops = &arm_sysemu_ops;
 #endif
     cc->gdb_num_core_regs = 26;
-    cc->gdb_core_xml_file = "arm-core.xml";
     cc->gdb_arch_name = arm_gdb_arch_name;
     cc->gdb_get_dynamic_xml = arm_gdb_get_dynamic_xml;
     cc->gdb_stop_before_watchpoint = true;
@@ -2411,8 +2410,10 @@ static void arm_cpu_instance_init(Object *obj)
 static void cpu_register_class_init(ObjectClass *oc, void *data)
 {
     ARMCPUClass *acc = ARM_CPU_CLASS(oc);
+    CPUClass *cc = CPU_CLASS(acc);
 
     acc->info = data;
+    cc->gdb_core_xml_file = "arm-core.xml";
 }
 
 void arm_cpu_register(const ARMCPUInfo *info)
-- 
2.42.0
