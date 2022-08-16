Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp2009075ejf;
        Tue, 16 Aug 2022 13:34:43 -0700 (PDT)
X-Received: by 2002:a05:6808:309b:b0:342:f6b0:1b53 with SMTP id bl27-20020a056808309b00b00342f6b01b53mr120968oib.293.1660682082940;
        Tue, 16 Aug 2022 13:34:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660682082; cv=none;
        d=google.com; s=arc-20160816;
        b=x120aFm1UJ2Sopl/NeCdkGHnUvxsZwSm7o5J/1Rk2lhmCz5G2pEDYQ7HHs7pyk9ugL
         JrKuq8jqiCXFsESzDhQ3GsCzGpfZyG+Qde6wCH4E5db3vYDrk5zWGO0NM54M/fnR5ReJ
         KUDdAupn/0VO8Am1PrG/9HGDos2Qh7OKb8cnpR7aO4HFTMt80JsgytiKSzYr+PM7W9W7
         Mfo8t6QZiVkxpzmKo0Lt0aozdQy/BN1Rjd7thIsBezHD+uDr0Xo3Z4yuBxsYiTs5ckmp
         T6N/5snypHrDRUmiV+4aiUV/LLMyKjxFdW/vEelV6cvrOsp8hlBoSy0hpgIr6uetAWrB
         7v3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=3ScK9gYYd7Yu/4MmJJp6WEZrowwZuhBtdiXOVA7xdaE=;
        b=OKRpKeGg9PC7SaFecIZ6vAQF7RLVA/DgrmAzm53ew/C8HVUyOTRNXWoLJ4c2cPLtVv
         mM7ii0n0z1J+HnM+zlcL3Q0/iZrgkx8rPjAqJkl+JYOiR1cmz1qEpF9a2QvieU0IfyKB
         48d40nNfy9QECmsufe5ZAHl6WeCZNjPCeRpQgT1ynCe6oFPWp/t1OxJhDIicxtiMnU6n
         trmoHdappnpcSBrW+KOLhI+JqsvX6RW7h6gLvwjDRHANwkJHgwb6DsG+GUvVq+MQF6G9
         o1NtNmE2rcAdxvehc6Ly8TrzMdrw4rRbZpVn6IOHUPHpWjaqoP/SsaiCuqYf3Vg9SIIB
         8Zjw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sKFnk2U4;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id i40-20020a056870892800b001183d09b183sor2277228oao.27.2022.08.16.13.34.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 16 Aug 2022 13:34:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sKFnk2U4;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=3ScK9gYYd7Yu/4MmJJp6WEZrowwZuhBtdiXOVA7xdaE=;
        b=sKFnk2U42+arEPTPyQUqCdP2C2tK0Ga35UD58mGl02wfr2GqzCDBPyS1PDMaGybbou
         9ID6WdoP/FqXFLxTuK38MjBvlM33h0/kivxnCxHPsz8ujEayYWeb5gZmgkky/Z3XLmLW
         xQFI6wm8Cmay3uZ1vtaw3WSQHGTbzS5rGZzNNlhAgzUeWtihAA9IAIoWxnwrarpKn1j7
         thStVklcEUTTaD1Cz+ovziHSBoIN+AlTyrVfOlGyDeQqFYXhKVEgQVBgODqTOTnBM/ZP
         3HZ+RXqPugrIWL5FmZrGH/YHxWIQnTP8JnDcKPvC5yUrWgbugz9wVpyGRv1gp5uf5ow9
         OI/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=3ScK9gYYd7Yu/4MmJJp6WEZrowwZuhBtdiXOVA7xdaE=;
        b=lQI2WCC8sVEfIwMXhBC9heUYeRbabpprxk901YeqCqn+Mdv8HFgh4EjGVPwSr55En/
         aG9UKO5g2FAB2KklVEoEggdjEZd+eAz3XM3WTCTEOGt1QDMddIHl7q/HSAEZ1LKXOkY8
         IGta5L75dk4ta+Es6afff0MRsGMKQPJZv83mhP4k3L4xmVCHMHD27zPyaQjBOxfNerS2
         HHE8wQjBGWFxrkQf2yP2wzBXk+lfwfT9wPkpmyYM4Gj+7ylJJREZyboTGxniXxkCY6YX
         A4yDUusjisIbs45bHZ4BQa/gxC6EnJMVSEC0PdrkV3MlwV9YKd5vNtb90T9UH+0arY6P
         Kh1A==
X-Gm-Message-State: ACgBeo0SnY6xlvIItoiVNM0ck0P3HtXkyhWmvqzdkD4PaVN+vBKf7uTE
	BgmEGcdQp98yqM5eLsC2j2hMhAgv
X-Google-Smtp-Source: AA6agR7TIrBnV2QzswzN4on7zjifUDssj/ECXZFZcd5CpSSEm9iInrclDlMfhVL4HjzQ17ccuAZA8g==
X-Received: by 2002:a05:6870:5809:b0:101:ce10:b267 with SMTP id r9-20020a056870580900b00101ce10b267mr146813oap.83.1660682082602;
        Tue, 16 Aug 2022 13:34:42 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. ([2605:ef80:80f6:61fa:9bc2:5095:d612:5e22])
        by smtp.gmail.com with ESMTPSA id y23-20020a056870b01700b0010ef8ccde67sm2285220oae.13.2022.08.16.13.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 13:34:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	iii@linux.ibm.com
Subject: [PATCH v2 16/33] accel/tcg: Remove translator_ldsw
Date: Tue, 16 Aug 2022 15:33:43 -0500
Message-Id: <20220816203400.161187-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220816203400.161187-1-richard.henderson@linaro.org>
References: <20220816203400.161187-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: O4wEQDK+1ndX

The only user can easily use translator_lduw and
adjust the type to signed during the return.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/translator.h   | 1 -
 target/i386/tcg/translate.c | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/exec/translator.h b/include/exec/translator.h
index 0d0bf3a31e..45b9268ca4 100644
--- a/include/exec/translator.h
+++ b/include/exec/translator.h
@@ -178,7 +178,6 @@ bool translator_use_goto_tb(DisasContextBase *db, target_ulong dest);
 
 #define FOR_EACH_TRANSLATOR_LD(F)                                       \
     F(translator_ldub, uint8_t, cpu_ldub_code, /* no swap */)           \
-    F(translator_ldsw, int16_t, cpu_ldsw_code, bswap16)                 \
     F(translator_lduw, uint16_t, cpu_lduw_code, bswap16)                \
     F(translator_ldl, uint32_t, cpu_ldl_code, bswap32)                  \
     F(translator_ldq, uint64_t, cpu_ldq_code, bswap64)
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index b7972f0ff5..a23417d058 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -2033,7 +2033,7 @@ static inline uint8_t x86_ldub_code(CPUX86State *env, DisasContext *s)
 
 static inline int16_t x86_ldsw_code(CPUX86State *env, DisasContext *s)
 {
-    return translator_ldsw(env, &s->base, advance_pc(env, s, 2));
+    return translator_lduw(env, &s->base, advance_pc(env, s, 2));
 }
 
 static inline uint16_t x86_lduw_code(CPUX86State *env, DisasContext *s)
-- 
2.34.1
