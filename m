Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp42522njb;
        Mon, 12 May 2025 11:05:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVxjvgaqlHk8g+KMqLPJUGHa/6OLAbVkfjmjntUdm7XW2XLcRKGUtwQ2z6vsA6TnCt03arCs9yXoBxIUA==@linaro.org
X-Received: by 2002:a17:902:cecb:b0:22f:a932:5374 with SMTP id d9443c01a7336-22fc918d1a7mr239898435ad.48.1747073113193;
        Mon, 12 May 2025 11:05:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747073113; cv=none;
        d=google.com; s=arc-20240605;
        b=bbvfpwghpJoinud+TzMNrwqXO+jy5/WtDKUpMCxgf8ujhmIeiToNQunJmofUev3lr5
         FtB7HclV9MjiTxPDcfM6Lvjf5zpYi7n/C/zKHptEA7UcEQoP22lr8/MvE4jZFpyrhOtk
         g4Df+8xLvnT8hEhkdWdyED3fQL8gLzuTpqJkyvHwsgk/v2XwVhYBgWXiAI+1WI0GoRQt
         1Z1c33Oh1kf//8227OhYedNU3SIzMUun2CYenbqq3D9cXnb6M54zRya6yhBcqnpgG40t
         FaPBiKPcWqTSFkATXQDodkiXI8fRYpxYPFA50QTMSYEk4mrNYD6Wleyse/V8mXfwNyhI
         TnTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=+wT6DnXqbX5AENDmRydoGeLBXcyCT3Vy8ui4SCalzaQ=;
        fh=m60PmNxGWcbBP+OvBqKsFic8g9ZWVM4WJdN0AS9Xltw=;
        b=AsATiR2CCBRXXmPPvLPZzHotHX/zy4AfRyqo5o4jGpaFyGDz00n+J1LwZEJeCQJtoL
         7Yi7SWr75fJ2okB3h7As2I8OLu/HSeHH88KgJQsuBg9JpsL3GbkKsQoIvWwHeXHmHHew
         vMFJymGl3Fd28GsV3t/ZuPnnNd4oy3mZsJjhsl4O6jArs8rbfuiAWS1rPHK88UC3jlvu
         slwZSJjjgE+5ntEQGdDZRL5z2q31Ks7kwtnthhkLciI/TPLZoOeMKHFtWZIqbPFKdTvl
         0/Rxs3/oOHgn5qiSg2UYYHS9rvbrjcgpADmtlon2hV8biMID8weYhhhfkYpofcr3i1E2
         wfKQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qrVUsauU;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22fc58284aesor57848595ad.1.2025.05.12.11.05.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 12 May 2025 11:05:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qrVUsauU;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747073113; x=1747677913; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+wT6DnXqbX5AENDmRydoGeLBXcyCT3Vy8ui4SCalzaQ=;
        b=qrVUsauUViHzAZs5fKbaI69DOnZRapkuNpfA8W76/0Hc+iVa9WYQEu9QA6iMcOv6DL
         yFasulblMZO3iqOHRZyzFXY6GqhXAX28tLJapHdMUTnDd03YwwV8I8sE1g8X85iIr2Zr
         +aTXQPVcAchXeMiN7NYiXQjPet3wXorLflkjdd1oWYy1FxtknoIEhfSVoBQcSDmYF6JZ
         MsotJnPBWzcTOpCarDhPw6HAdylnRhSe3hkWKM+GoaY9ytKpIvNKirkOwQF6c5KswgNu
         GSVfVuCTZDdKpvVOk/olLKoNxrjOr5EbpQXor6ErlaLr2hTMGc9oZZgOP0CZxBEZPheo
         05nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747073113; x=1747677913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+wT6DnXqbX5AENDmRydoGeLBXcyCT3Vy8ui4SCalzaQ=;
        b=KWm0RE3wyiGUpt4CJs4WyrgoxFFSPDdTpTI76dmTi42pnh+pfXn5Vf8PU/iKrbcDHu
         +1LOl+zfnPT1nac8mn1fA9SSGltZKcdqZQW5n++EhnGtWBfAqaV8W64NwjTdd8/vAZpJ
         OFGEg6ti7E26rvreJPckvVo232Ex8gOowbpRTamL/E4W2e2plZDV8ml/O+Fsw2A98LQK
         pSRQ7p68wk6kQpFTq/7fwQ0d+tofIO1jki5tVLDE5RH28JHWdzDWHWvez6s1OSVhE1OP
         rVlyqgoGiOAdTtOaNrpnIaUFuTNq3S+45EglgFMEOdpFvjPssIjzeR1ULGcsnxuO1XEA
         UcNA==
X-Forwarded-Encrypted: i=1; AJvYcCX6/IOb5LOST8uQ+MltEplhZ3B83PsgutQWsl9IJmMEvUWUJs6RFG+y6LZH0l96cda5x4G7dE47Ki/RrQ==@linaro.org
X-Gm-Message-State: AOJu0YwL7TLKb/exzouF+2v7Bk54FHJp6ejMsHQLBYV00Ch4H5XWn++d
	mtIImc5okQYZf8IdyHju5p5vV3VPUzJ76g64hSogQQ+CW06FVNIu26zoQI/NFKSBxPsHNAEDyXn
	cK7g=
X-Gm-Gg: ASbGncvc7o40RQ569ETe2OsYusQ0VNv7EARBF/Y3opiv8fA++qn4y5d2wrOeXX4YhG3
	uea52l8BJUREEBTCmOO/euUC32QO3ge3OXqFY5devfXQUYVXPR5Hfx7yPqoyAKfTiPMJOtHoMLp
	9LNXlIHUpMtIy+5YCISYnPy+QLQytpRPpY4cXddX4wTqMcf23IUWnYSuK3M/Gftxc94NO6wr/jz
	kGWmW3k5ZtlCJD6qFl7tero2qRTBuLHilw5OrmHYq7w93ehN4jkZ69LOrMuVv7eF8VjlESvXeSC
	Nwq6xnEjDH61b1Fw3rEeMVXI13HItBm4KQrH7AbE6OGdY/L7dH4=
X-Google-Smtp-Source: AGHT+IHC9v0YNf7C0VB2fqmdISRjwl/2lgPQJoH5JAMzh04iqPHb+bGI5eSQIxgja1O4tGivjZuHZw==
X-Received: by 2002:a17:902:e84d:b0:22e:62cf:498f with SMTP id d9443c01a7336-22fc8e961a1mr224733145ad.38.1747073112762;
        Mon, 12 May 2025 11:05:12 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc82a2e4fsm65792005ad.232.2025.05.12.11.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 11:05:12 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	kvm@vger.kernel.org,
	alex.bennee@linaro.org,
	anjo@rev.ng,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v8 01/48] target/arm: Replace target_ulong -> vaddr for HWBreakpoint
Date: Mon, 12 May 2025 11:04:15 -0700
Message-ID: <20250512180502.2395029-2-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
References: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: m2QCTJVwZYDg

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/internals.h   | 6 +++---
 target/arm/hyp_gdbstub.c | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 660d3a88e07..5b421bc4ecd 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1949,9 +1949,9 @@ extern GArray *hw_breakpoints, *hw_watchpoints;
 #define get_hw_bp(i)    (&g_array_index(hw_breakpoints, HWBreakpoint, i))
 #define get_hw_wp(i)    (&g_array_index(hw_watchpoints, HWWatchpoint, i))
 
-bool find_hw_breakpoint(CPUState *cpu, target_ulong pc);
-int insert_hw_breakpoint(target_ulong pc);
-int delete_hw_breakpoint(target_ulong pc);
+bool find_hw_breakpoint(CPUState *cpu, vaddr pc);
+int insert_hw_breakpoint(vaddr pc);
+int delete_hw_breakpoint(vaddr pc);
 
 bool check_watchpoint_in_range(int i, vaddr addr);
 CPUWatchpoint *find_hw_watchpoint(CPUState *cpu, vaddr addr);
diff --git a/target/arm/hyp_gdbstub.c b/target/arm/hyp_gdbstub.c
index 0512d67f8cf..bb5969720ce 100644
--- a/target/arm/hyp_gdbstub.c
+++ b/target/arm/hyp_gdbstub.c
@@ -54,7 +54,7 @@ GArray *hw_breakpoints, *hw_watchpoints;
  * here so future PC comparisons will work properly.
  */
 
-int insert_hw_breakpoint(target_ulong addr)
+int insert_hw_breakpoint(vaddr addr)
 {
     HWBreakpoint brk = {
         .bcr = 0x1,                             /* BCR E=1, enable */
@@ -80,7 +80,7 @@ int insert_hw_breakpoint(target_ulong addr)
  * Delete a breakpoint and shuffle any above down
  */
 
-int delete_hw_breakpoint(target_ulong pc)
+int delete_hw_breakpoint(vaddr pc)
 {
     int i;
     for (i = 0; i < hw_breakpoints->len; i++) {
@@ -226,7 +226,7 @@ int delete_hw_watchpoint(vaddr addr, vaddr len, int type)
     return -ENOENT;
 }
 
-bool find_hw_breakpoint(CPUState *cpu, target_ulong pc)
+bool find_hw_breakpoint(CPUState *cpu, vaddr pc)
 {
     int i;
 
-- 
2.47.2
