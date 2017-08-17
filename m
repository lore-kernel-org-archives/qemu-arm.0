Received: by 10.223.183.22 with SMTP id l22csp80822wre;
        Thu, 17 Aug 2017 16:01:21 -0700 (PDT)
X-Received: by 10.84.132.76 with SMTP id 70mr7537853ple.7.1503010881198;
        Thu, 17 Aug 2017 16:01:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503010881; cv=none;
        d=google.com; s=arc-20160816;
        b=HjlA5SHqdSkiDERWbWMwX1SL9ByBMEQAVRiLIETdBsnDFo3VxurqWvRE5I7gXIC9Cw
         Rwzeyo7p7n1C25wkY8N6b+gnWSF1aNGQ5/dHaTBxtekzslSsanR6dOs7trOw+d2aRBqP
         MyAwSznYpgh57TmH/yMzCFe5dNWxaA/cfqfSesFKzEEXxMm8/TKLOZUoOXfkWlaLthGe
         w0U93GejA9mkO9x1TjyT/TBeahiUhGSs0d16E4SgSw7koWlYEPRjDJ9tdjyLvX9FbgC4
         /iS9U9DOAkE5d57qTDtGsyd/hqc+FPnJLQN/nGpFioZLJLlOACPTGcogL0sM7oIs+L8T
         H+mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature:arc-authentication-results;
        bh=9o+4s+u+HhA1SN1wAmIK4x0UqDGVW4ct/r56gOt0Xg0=;
        b=dT2DXIdGlwgJCh+4/FlCg9+RlzVnmuWk5lNz/4dq3JRs9wh5kI54EeiSbONU0V6TMy
         0fmLbA3XhtzQ60KiVA/6Ww1Zu5C2d7F7aIGlsKLbKmwXziHHKW7A1+DRU9MIaoYw6kHF
         ykcf6G9YII/8KebBqi2Mzk5dQ4Qc8dhUYIulZEJNmjyuO8yxI/7F95j8yNqOsUC0hsCB
         QPzUW9qFvkc0PJM7O5JFIW4QL0Zl1AC+c2GQG88CnpW16Io5CJSvBWfG/4xeQsE4KC00
         xQqs18iQ05QpQObaDRgI57xRSjeY+8BWbZYu0d6kUcq8L6ElmaJJgN75e1/bimjlVL0r
         tJCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ERhOP+bZ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 2607:f8b0:400e:c05::22b as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-pg0-x22b.google.com (mail-pg0-x22b.google.com. [2607:f8b0:400e:c05::22b])
        by mx.google.com with ESMTPS id o26si2617072pge.34.2017.08.17.16.01.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Aug 2017 16:01:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 2607:f8b0:400e:c05::22b as permitted sender) client-ip=2607:f8b0:400e:c05::22b;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ERhOP+bZ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 2607:f8b0:400e:c05::22b as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-pg0-x22b.google.com with SMTP id u185so51779098pgb.1
        for <alex.bennee@linaro.org>; Thu, 17 Aug 2017 16:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=9o+4s+u+HhA1SN1wAmIK4x0UqDGVW4ct/r56gOt0Xg0=;
        b=ERhOP+bZ0PJ2PEOW+/ErsB9nFCLtJqJLFDUj272WDZ0MjFuhNhXwKnFnAmMUKs4A7s
         Hj8cuiKw2JYV52xfx6PLq7IEAaweD9doF4Md1XiAcX3CdQP0ajE6QRFcNqOvRiEh36rg
         Z7zWyt9Sy5eLrqYruYPWdiwWhW6ZteYTQT4tw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=9o+4s+u+HhA1SN1wAmIK4x0UqDGVW4ct/r56gOt0Xg0=;
        b=SIRV9KZvcivkCBUHVcrVe3uCJNUsvHcJg88FIogP8FOvxoNvVjIYpgH/QnrbmJQhOH
         9x7N4tqR7VuiLbm+aqQEb8sqSwbsMbAiK/DXhks65LGIp85dkp9OJKvW2Pai9FA7cR1c
         p+wrg00lPBn+zUiTHP8bwc5xhKVfyxa1Zjj/LdX0F+vikqH5kM2M/7ULNUJA+TLTjFz4
         QkrTK5NgDF8ULhxn8j6E8ERnEmI1sFsu77q3RjLYHexyXFtMLzBfjTz+o0CWSWFlhVz4
         w6/3r2hI0Djr3qiJc7uJvp6wNNaO2reP9zvvE/QxO5KfA7cn0ywlKCoVsvYnOo42lfub
         1WuQ==
X-Gm-Message-State: AHYfb5jBaBIVZt03xz/467pLFjLj9xeVsKuRje2g/aV3QQ68e/ZFZjJ6
	RKbet7BQwyz6ZwOIGS6CogTr
X-Received: by 10.98.198.145 with SMTP id x17mr6922847pfk.272.1503010880804;
        Thu, 17 Aug 2017 16:01:20 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from bigtime.twiddle.net (97-126-108-236.tukw.qwest.net. [97.126.108.236])
        by smtp.gmail.com with ESMTPSA id c23sm5190043pfc.136.2017.08.17.16.01.19
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Aug 2017 16:01:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH 3/8] tcg: Add types for host vectors
Date: Thu, 17 Aug 2017 16:01:09 -0700
Message-Id: <20170817230114.3655-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.13.5
In-Reply-To: <20170817230114.3655-1-richard.henderson@linaro.org>
References: <20170817230114.3655-1-richard.henderson@linaro.org>
X-TUID: d7XvgyElbngf

Nothing uses or enables them yet.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.h | 5 +++++
 tcg/tcg.c | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/tcg/tcg.h b/tcg/tcg.h
index dd97095af5..1277caed3d 100644
--- a/tcg/tcg.h
+++ b/tcg/tcg.h
@@ -256,6 +256,11 @@ typedef struct TCGPool {
 typedef enum TCGType {
     TCG_TYPE_I32,
     TCG_TYPE_I64,
+
+    TCG_TYPE_V64,
+    TCG_TYPE_V128,
+    TCG_TYPE_V256,
+
     TCG_TYPE_COUNT, /* number of different types */
 
     /* An alias for the size of the host register.  */
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 787c8ba0f7..ea78d47fad 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -118,7 +118,7 @@ static TCGReg tcg_reg_alloc_new(TCGContext *s, TCGType t)
 static bool tcg_out_ldst_finalize(TCGContext *s);
 #endif
 
-static TCGRegSet tcg_target_available_regs[2];
+static TCGRegSet tcg_target_available_regs[TCG_TYPE_COUNT];
 static TCGRegSet tcg_target_call_clobber_regs;
 
 #if TCG_TARGET_INSN_UNIT_SIZE == 1
-- 
2.13.5
