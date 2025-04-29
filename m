Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp22897njm;
        Mon, 28 Apr 2025 22:00:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUCtNtujiKlle1PzonDQXQyqbDr3ocPvlVB1xSrFvFfz9aEGaE5rPcj1YIz2OblIYwZEqNZNb1NBd/vxw==@linaro.org
X-Received: by 2002:a17:903:1b2e:b0:215:bc30:c952 with SMTP id d9443c01a7336-22de70072f4mr20871305ad.6.1745902817905;
        Mon, 28 Apr 2025 22:00:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745902817; cv=none;
        d=google.com; s=arc-20240605;
        b=E0r0IyJMFrHcLsi7am0aH6cXiImfi/B1CWl8ShJ9POmOU1GfPBMZ/SIz8NGR1MbyuX
         fAUEmYRbpqykR3vyWg938I9ZdTTgWDIkYXwL1clF8jA1ZYnRP7vyoZc7u2dPCURYLxAH
         jjL3WMhn/r2M5xXR04BeM66Psg203wDLQiz96ms05TxeQWw+pZIwjo0ALioMU7mGIkG4
         3/NXvKN2u0b59XxpNjREyvtR6A2Y0acXxeNKG2KIXVOX7FHySjexqmOVyKScTrNVuhyl
         YgTAXpOO8XuTHt+I6pC/VaCpM1n5OflAA0lX/glsXG9ZIaCt6yeLMRVURR28ZbHrBX5I
         am3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=qd9JoYIvLQe/drBoM2Bi9/5cgLzZGHsmbjtG6PaToKY=;
        fh=hZMi6uRJZd91CzmK9TYF+06MeadCLbLUQgiiuLwte88=;
        b=bRI5Y1nH3F20kKaw8BPcdqqhTMlJz7NJAgb0mJw32krR3Q9R3iEDHZ3Mv7olfRKPWd
         o2tvMMIT3jbwp/JIAhg63GHMULfG9gzc3wyfYtWFwLDKSax6VIESO2NLGHcCEqArDwah
         B9TUYxae6uAwePzLWDh1CBQuo7ylr1ZcysBWn3NGY6i56EpbivEzHVcPHvZE4G2+Xj54
         3Hoo2t4Vg11nrsV+wP77FL+x/epBBtjfne7bGSJb+94lGjgHtIZeiUF2ZTZ0hkSQuCvU
         lA5UUHdseXUkj3/eXfg3ZRyuiU0UnTb/DkiGG6WOs774DyvJY3rLuVBCndSnnqk2lAzq
         VS9g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T1J6oyQv;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22db50f93d5sor66265065ad.14.2025.04.28.22.00.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 28 Apr 2025 22:00:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T1J6oyQv;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745902817; x=1746507617; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qd9JoYIvLQe/drBoM2Bi9/5cgLzZGHsmbjtG6PaToKY=;
        b=T1J6oyQv0GLu/WgvF/lxfXhFk2ambHPOqQE57JDK/l4hjXNmAPrZekLWL+z5W2uqQv
         AVwwOvqNdJSrKMcwnhjdUwiHMN0FitHT1eDS9UOhEHwRE1YMtiMNq+IJBWNyRTd5EnFu
         sISB0JsCDgxcVtx4KjWoTusAxgZICXHxAhtdqwyPgTk1E7J/o6JUeChhQvcA0pEReaUi
         K4APrZFPkiAjKWpWn2C6LeLsoY1/JOkbLwMDa0UBqDyhNoqfTdD7mctfjnfAaGjHNh36
         xnYo/eIYjYqYQYoPjn6KKQ0nIkEl3j3G/VYOL9fOlyJRHPA4aF2FVv7NaxQ0t36PTxUh
         604A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745902817; x=1746507617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qd9JoYIvLQe/drBoM2Bi9/5cgLzZGHsmbjtG6PaToKY=;
        b=uWFTUBR93LMIeJlu5cK449E9+FnuKQc8YLI08xlLjZX3i5blMc6PeST0G4XAYitWYJ
         uvsXeF9CHAhWIxmoIgEYP6lsykHmap4qZb5CClC0tGYgVwuXNTIClVyol7+bSThh0EtY
         XT0q/+0mbU3E8G4xqO8mXRmdz9wuldjPNhGBybHDwQIkuUsWxd9x6JTRQ+qmvUME149d
         UWnw8YAK9+1dL3e5Z2x6uqgGgd/xvVrAbNeoYtnoP9WdXPtlTBX+vtG95IM7vZ+TS+J9
         P9z7jHrv81GYQ59777bwG7oOowvfjHyqv5k2aVR5agb+7XVC10gSep/J1um7+iQvGmT9
         kPXw==
X-Forwarded-Encrypted: i=1; AJvYcCWOnb3h1b8px26rNoz5TkZdgcnGRL07he9HTga12z8JMijkbW8nVXdY6ogjv505Dg7sUfUX/UJx5IFhhg==@linaro.org
X-Gm-Message-State: AOJu0YyOK+EDjXB3VbqXmPSw9p5z2SP8zpZEv84maCEvyo1LQjVlutvT
	UBNPcv9t9lEyYJWdJ/zSajVOFGlfK7CjacOsnQJnJ0eGfK7nIOevfyzh0uG9tfbqVQ==
X-Gm-Gg: ASbGncvDe5I4WzzItUKrQL9mh9SkerB60WTLp9L4XW+s12OGp5et53b1AX2Hw43uag6
	ES7sbfh4UayBSQ+cbQ4tj9HychpiuU9C/ILk904JrPLC4PdfnGDHNGemXkGmst83w/hWWsxQgKQ
	u9hdSIRrhImL+sKo7yI/bvGywd+gTAh9FzpLDJupkANN0qtaTWp+9OrBglvMb7hUvoDjodjiIyu
	k+DpNpDH6y5Xg9tVIPj7c29lDD9wUz9lMbjhai2F1p87D6VUGvSU87Fpmek1rCVt7/hK78J8qNq
	Q0g1tUfWGO1Yo+pe3kjq3KfRW6wbtrdTXfd1V27b
X-Google-Smtp-Source: AGHT+IEym+4DaHg2WVCA9P5QZCnFC4FKkvs0up3xAn46PptfaIMRSezZKhGFkfqVu0U7+N2+PKpNSQ==
X-Received: by 2002:a17:903:28d:b0:223:f408:c3cf with SMTP id d9443c01a7336-22de70276d4mr26404235ad.21.1745902817405;
        Mon, 28 Apr 2025 22:00:17 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbd6f7sm93004015ad.76.2025.04.28.22.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 22:00:16 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	kvm@vger.kernel.org,
	alex.bennee@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-arm@nongnu.org,
	anjo@rev.ng,
	richard.henderson@linaro.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 01/13] target/arm: Replace target_ulong -> uint64_t for HWBreakpoint
Date: Mon, 28 Apr 2025 21:59:58 -0700
Message-ID: <20250429050010.971128-2-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250429050010.971128-1-pierrick.bouvier@linaro.org>
References: <20250429050010.971128-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 186OfqcqvlD5

From: Philippe Mathieu-Daudé <philmd@linaro.org>

CPUARMState::pc is of type uint64_t.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
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
