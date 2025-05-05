Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2178690njj;
        Sun, 4 May 2025 18:52:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXyxFRUD31GDCpPAdAatIhxprqhMkjikqqjX6kUBtylHG+zNLtTHUKM9sFYzxNaO5ZlAy+7OF7mqBSuuA==@linaro.org
X-Received: by 2002:a17:903:11c8:b0:224:249f:9734 with SMTP id d9443c01a7336-22e1e8c8979mr71078085ad.4.1746409948339;
        Sun, 04 May 2025 18:52:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746409948; cv=none;
        d=google.com; s=arc-20240605;
        b=PfAWU5st9wt5g3LS/DZkJmkTdewa68r2vj05ZmQhN4b6ZLTyo9vB7rzHTHqMj8MQta
         CukIO0gp8NsnYE3xR2B4F59ybR7C5ayr1J8vhXskNI1UN6QxsATqLKu/yAKu0fjEtwL2
         QMJjxi5ojsvK1oD1zKvCbFjDYQGRCGUxzs6tpyPQhrWnN52aVhUbA05f2Ul3VqrjM58X
         DaluoVL3pSu+TTbw2Mq2KTyvkDJ8uDcY2w/jvZUI1+G+vSDgfFGUhXqhF6fsf7isJfG6
         bnEPq/H1csmISpRmr2NJDzVKxSXhQRjc8VKMmqLBNGPSIbRVvZyUPvLmB2m753yFDZQg
         3jSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=v1JmSJqnxYquNU/v4UOEtwOcqbxnEb6aDiKyyBWqJ6s=;
        fh=iPP5JSC+zCZQRsSzqRQ8alsEWj9LUNYu6p0MeMyyh74=;
        b=Ih6evdcy282GlJjYA+a76YRf/6WjLQ8hIxJqvRPNZ1u18ZYZ7jAXB+QsDwT/VWjzAv
         zncAgILYkZ/TP3sWWZHP2zq0EHmURSrRnW0oYziqGHHLSuwGn30cjbCxmWLroV0U9pk8
         xyKlaR5/U6CRnWrYjtKHwP1cB5dL+gms+Pn7ZOEQjVUSwyOcjkzJGCZ3kpExvjfqINGD
         ima7BWchIWGwkb3uWcNyctSqpyLoFnIXhWQShb1tDfQT84Yt35X1GsfRgXSAQt3qiC/m
         TZqQ19tLT7ZedZ2p9EbfvuK6sT9LFqnFSOBWVyp8B61SfSfRIjRvDhfguAEhT2QnKBGr
         Unsg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cQIM95eZ;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404eeb549csor3951734b3a.1.2025.05.04.18.52.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 04 May 2025 18:52:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cQIM95eZ;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746409948; x=1747014748; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v1JmSJqnxYquNU/v4UOEtwOcqbxnEb6aDiKyyBWqJ6s=;
        b=cQIM95eZeymT4fwaARCrKXRrk9XORMNUiuuZcc6DtmQ2aSExyBQ62g+HQ3QakVYA2l
         TkfTCIDvkhYr74kCt/YQpdU737M7vMVKs83laBbyO1jwHZNmGQIwbqWFmd/F4Y//2TBl
         INthY7+SxL0GZGiQ1L2GORQk4z0kcIzfoU+XaipWPKNrPogo6/WW3uNr4ocQwViKcLv6
         d+YKnWHB0UpcjRTaXhZPLmMhsbuXZiORLmc4vWdfos7UYUx/D6fvHvVI6jdEpOxnE3iY
         KAnNkxs2W6221fxjNSAX6jFWckCDfmHigdT1WKB0qO3WslS9zvDOI8Z90HBUQHoH5If8
         z4eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746409948; x=1747014748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v1JmSJqnxYquNU/v4UOEtwOcqbxnEb6aDiKyyBWqJ6s=;
        b=THuhX8YXGX8aLgGvVgqE6icr3rBFvanrgC0A8QIOdWYhDmECHEqbCi28HkM1WO7vqq
         Zk4W1kmJkKayH1OeGZ0ABT5mJV6M5vRO8+BPrwtHMhfz0BZ/b74c5g+mHlWNQExggvqv
         qDkMzpR9fiVsoQTl+qSctUF079wglXE8X0XwAktNUQoPWmcuOB2xvQKv9GfrcHuZm48k
         aistm0VxdVpfjNwZdvcLbYWP+hLC3KEa330MWJXdhgs5h3LyshUvdnRSfxq+wzkj0tsk
         e4PY8FDGH9nvxRk77Q6hWp5ab6nkts0lvNcuGdNQ0088pv57bPLuHahm+VRJm7BAVAzs
         U9UA==
X-Forwarded-Encrypted: i=1; AJvYcCXcWKCUleRYEtDCrfxTKDyWcGcDKHNkvUvcz56WmwXFpR38CP4t+9Ee32JjVpPTAbTWPE+z8SJA0Z88kg==@linaro.org
X-Gm-Message-State: AOJu0YwW3u5ryLcEqYNeW72QpzIF399+StBgmY9NtPywFQRMkxT3d7HK
	EFTnp/wkJI99EdcCcpxzG2iVqP51hVHH7I7nDEBnMfJaI3zDJuL7xKvKQBNzMelYgQ==
X-Gm-Gg: ASbGncvE4ihIcg9Z8YiHO/NMyMAJ8IUbfl5sJ+ssEEgxvKMWxHptviYS6WkGswTVt+h
	ZCmpb0Kk41E75Rs8hzd2AycxNroMdmt+GC5Xfyc7/xkyZS66OiyUatlvf5Yh/qUXxX3Sbx++Swo
	73kIke/NeHq3JFK4JLQlTQZi9tPmW2FM76UuiAoQwuumvwsth8b1I0c2O/BmwzplVarS9UAjLwI
	OG5E23bOuC0idh8ZR0y0jSPrZJ4v4c+Q9IegDcits9h0MghULKUk0FdGYNphO8a1DhZdlY5vd7V
	w+KovJDJBBTVExzsqoAcWXkxzyF7d3m15KXgj66D
X-Google-Smtp-Source: AGHT+IEDP5xBT51rFDO+YlfBvJJOZbgRutYKb7K1dO6mttF7lFJCwcmKCu2Cndsi3ubcw0yBzewrTg==
X-Received: by 2002:a05:6a21:8dca:b0:1fb:e271:82e2 with SMTP id adf61e73a8af0-20e96605502mr7410585637.11.1746409947932;
        Sun, 04 May 2025 18:52:27 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3920074sm4462101a12.11.2025.05.04.18.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 18:52:27 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	kvm@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	anjo@rev.ng,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 01/48] target/arm: Replace target_ulong -> uint64_t for HWBreakpoint
Date: Sun,  4 May 2025 18:51:36 -0700
Message-ID: <20250505015223.3895275-2-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
References: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: DcEz6j/i7uyx

From: Philippe Mathieu-Daudé <philmd@linaro.org>

CPUARMState::pc is of type uint64_t.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/internals.h   | 6 +++---
 target/arm/hyp_gdbstub.c | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 4d3d84ffebd..c30689c9fcd 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1949,9 +1949,9 @@ extern GArray *hw_breakpoints, *hw_watchpoints;
 #define get_hw_bp(i)    (&g_array_index(hw_breakpoints, HWBreakpoint, i))
 #define get_hw_wp(i)    (&g_array_index(hw_watchpoints, HWWatchpoint, i))
 
-bool find_hw_breakpoint(CPUState *cpu, target_ulong pc);
-int insert_hw_breakpoint(target_ulong pc);
-int delete_hw_breakpoint(target_ulong pc);
+bool find_hw_breakpoint(CPUState *cpu, uint64_t pc);
+int insert_hw_breakpoint(uint64_t pc);
+int delete_hw_breakpoint(uint64_t pc);
 
 bool check_watchpoint_in_range(int i, vaddr addr);
 CPUWatchpoint *find_hw_watchpoint(CPUState *cpu, vaddr addr);
diff --git a/target/arm/hyp_gdbstub.c b/target/arm/hyp_gdbstub.c
index 0512d67f8cf..4d8fd933868 100644
--- a/target/arm/hyp_gdbstub.c
+++ b/target/arm/hyp_gdbstub.c
@@ -54,7 +54,7 @@ GArray *hw_breakpoints, *hw_watchpoints;
  * here so future PC comparisons will work properly.
  */
 
-int insert_hw_breakpoint(target_ulong addr)
+int insert_hw_breakpoint(uint64_t addr)
 {
     HWBreakpoint brk = {
         .bcr = 0x1,                             /* BCR E=1, enable */
@@ -80,7 +80,7 @@ int insert_hw_breakpoint(target_ulong addr)
  * Delete a breakpoint and shuffle any above down
  */
 
-int delete_hw_breakpoint(target_ulong pc)
+int delete_hw_breakpoint(uint64_t pc)
 {
     int i;
     for (i = 0; i < hw_breakpoints->len; i++) {
@@ -226,7 +226,7 @@ int delete_hw_watchpoint(vaddr addr, vaddr len, int type)
     return -ENOENT;
 }
 
-bool find_hw_breakpoint(CPUState *cpu, target_ulong pc)
+bool find_hw_breakpoint(CPUState *cpu, uint64_t pc)
 {
     int i;
 
-- 
2.47.2
