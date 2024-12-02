Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2802206njk;
        Mon, 2 Dec 2024 05:14:31 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVJFjGnDcNuOFm+Aym1S55gwbF4E1yBzoQDfIqpAw/V3PMh3L67YrXwbuixU3p8Ogt7K8IO7zKR1LN9Ug==@linaro.org
X-Received: by 2002:a7b:c4c8:0:b0:434:a815:2b57 with SMTP id 5b1f17b1804b1-434a9de55f6mr186288205e9.20.1733145271161;
        Mon, 02 Dec 2024 05:14:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733145271; cv=none;
        d=google.com; s=arc-20240605;
        b=DDPkgcy6ez3NHG/z1w70zcwN+7chg1i2NMtTQMFr2BGfgtKD1+j8t/CcT2l2KsHiBx
         RO8D9Kw3PuWpkIYnEEx9F4nMnBbo7oGTgIq072ZRXvp7HMxHJMQbZYqfZ0Q3rJARCF47
         D10nkpvXDW8U1Lt3EWguJR4cpYQ/0Q3IK06BVaAtdGvy3jz7ium0wzEiPp2Ag/DoPl4c
         1KIa6NAaImg6SWzOWz2XZg2VEZUudvOCH8o2dV/dCpmg6OzDurs1bZN2IlLzKKGDgeaZ
         qW9wMtBQxauC1yDM85ePJMzkmc4eYekdOXDyBrv9qgqR5Nv2rQTzuK0F7n/mrxzsENoY
         69XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=oNFUiJahMuoZ73+h4VdLlQSeFpgNJO8VlBUcPmwjIjg=;
        fh=ajwUTbn84edzjuEeu/abW7ByrMUBpuLEq4VJNABnq5k=;
        b=Bh/pyZSFzZfLZ9cJWNuCN0eME8ZCGJAfcLUiFAYn+SxvVlGog9McNn0o7XfCT60pKw
         CfR4CQ0Pt1EoLkiZLexaaXjfUwDBW42lnipxffq8U67TgUdhZA404cub0H35jp10W6e3
         /6t+sqt41OEUWMe1DiT8v2vhReQmgXB+7JEO9A8cymDfROU5x/Lg+oPPL1XvfJeu4j3s
         W6N9Jrscwobp88CBNR48mVmMbaDNGex/dbIgS9P5K2CP//vlil9lazJ6mEuom7FJOfEx
         gZMZa8CyDejH6bAHGD+i7iHNpmsFs5cB5pDHqshvHbGVlpmxr1VJ9/ph5RstnZ4XGx7W
         4YiQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fQUYrkf5;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-434bc36562dsor21520265e9.2.2024.12.02.05.14.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 02 Dec 2024 05:14:31 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fQUYrkf5;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733145270; x=1733750070; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oNFUiJahMuoZ73+h4VdLlQSeFpgNJO8VlBUcPmwjIjg=;
        b=fQUYrkf5B+fnFecsOla+/c1hDZmjqc3YpwH2NyQQf++fg9dK/et0vkQunnahd1t/xG
         Iv6g7FGXF4UGLtPTtOJKP94+nTB9CL2RzxiSh6keClv1efn+cfyZWmerLBuSdT/pqgD/
         uF7Z/IhD6Mj1Tpf6F1zHjrO1H7nfqM+XnTeCyj1n87Dh+rERlYddAcP+eBXk8PEGiMs8
         v8JKx21e2qx4Nw42ScHvhZfximqiNHi450FGvwgtciDEESdvtj3OSjajAsnUzc85biwC
         GKAGLrp7LM/3FbIXo50wjf5h3h7qaP9DnyfdGS9T6Xxbu1325FSPigGDHjXbZRv3A5Eb
         d/pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733145270; x=1733750070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oNFUiJahMuoZ73+h4VdLlQSeFpgNJO8VlBUcPmwjIjg=;
        b=jfn0QXV2aGo0FZimjDAFkcWGLrpoXKFY61RRA9CrLnLBDj1DcLREWJIGXJcn79LPYa
         N+O+qFZEFZxyMmyCNnzjScvEmHLuggVItb18tAO1RdLkVCsRBYXxzYahhuf+8o+tABTd
         4lpDSdFkpo46t4Zd/8MKCzTpqJvTSC8DfJFEejmoLlTnFKirxUHY0PFLXSN5SNI3cNJX
         P0A9kd7v1ir2hxPz2vDCmu2ZPbNVUHc6aeepjqprIkwXAEsbzumVyEdIux/Xhk5pWRq5
         d2RAd1jK77KXnOAitbCT4n87daEv29FT1R0NJ0sly9Bl0/gd8NanCseL0LfH6cjIGGM2
         6U9g==
X-Forwarded-Encrypted: i=1; AJvYcCWpCahkjAslY/jdDgETdwo3uY/B8GAy1g9NeJRahjcqCqYulWKUxNVeaYvt5mfwJO+ErYinUlWkq+Nr8A==@linaro.org
X-Gm-Message-State: AOJu0YzR63Lh5ckw8hlMJQJx6qWLVeH7DRPbLBoojcrwQUJEzG0PNLvU
	ER0VcrVNS0Mj1wypfbEsnYZYvopXezpwQ0rCjA+M9jzl+7EtG/860GhR6ih3JXyBZg==
X-Gm-Gg: ASbGncuH9XktRSzIGjdVji91pfn8UiqfFEDTqkbwyftL1oZf4IE0tweaJgm5QkHjI8E
	vB+H0vdKzohqUvjbxeAL24X0rrQlKzhRbcMji6mq0MtQiwAkoxzrlwk3K0wqSSZ6hVB/ca44okk
	t8caSlD315DVwf7p8j1okbZTO4EtATTDoK8J39FYLY9qEEOy6Gy6bIbErexvYkrf5nQtDrq3gRG
	oPzFSRycAbpzg5F1PtuDMAVsOF162irFhbS9SZ+BZhMUlpLeFWuYk4=
X-Google-Smtp-Source: AGHT+IG+zglFH9P/OX2WF0mcI3v1zFBJH7Yyk//lwFwNB2aXYaOsIJ+XlGXo6dHgb1+xUJgb5Soqtw==
X-Received: by 2002:a05:600c:314a:b0:434:9de2:b101 with SMTP id 5b1f17b1804b1-434a9dbae1amr203940025e9.2.1733145270515;
        Mon, 02 Dec 2024 05:14:30 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385dea1e4ebsm10160157f8f.1.2024.12.02.05.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 05:14:30 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Song Gao <gaosong@loongson.cn>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH v2 for-10.0 23/54] target/xtensa: Set Float3NaNPropRule explicitly
Date: Mon,  2 Dec 2024 13:13:16 +0000
Message-Id: <20241202131347.498124-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202131347.498124-1-peter.maydell@linaro.org>
References: <20241202131347.498124-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: u8aGhj2plV6r

Set the Float3NaNPropRule explicitly for xtensa, and remove the
ifdef from pickNaNMulAdd().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/xtensa/fpu_helper.c     | 2 ++
 fpu/softfloat-specialize.c.inc | 8 --------
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/target/xtensa/fpu_helper.c b/target/xtensa/fpu_helper.c
index f2d212d05df..4b1b021d824 100644
--- a/target/xtensa/fpu_helper.c
+++ b/target/xtensa/fpu_helper.c
@@ -62,6 +62,8 @@ void xtensa_use_first_nan(CPUXtensaState *env, bool use_first)
     set_use_first_nan(use_first, &env->fp_status);
     set_float_2nan_prop_rule(use_first ? float_2nan_prop_ab : float_2nan_prop_ba,
                              &env->fp_status);
+    set_float_3nan_prop_rule(use_first ? float_3nan_prop_abc : float_3nan_prop_cba,
+                             &env->fp_status);
 }
 
 void HELPER(wur_fpu2k_fcr)(CPUXtensaState *env, uint32_t v)
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index 28db409d22c..67428dab98a 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -505,15 +505,7 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClass b_cls, FloatClass c_cls,
     }
 
     if (rule == float_3nan_prop_none) {
-#if defined(TARGET_XTENSA)
-        if (status->use_first_nan) {
-            rule = float_3nan_prop_abc;
-        } else {
-            rule = float_3nan_prop_cba;
-        }
-#else
         rule = float_3nan_prop_abc;
-#endif
     }
 
     assert(rule != float_3nan_prop_none);
-- 
2.34.1
