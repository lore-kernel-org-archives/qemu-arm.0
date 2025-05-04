Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp1756064njj;
        Sat, 3 May 2025 22:29:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWR8fO9N0SqQnxJoTqe99ydE5Sa6/UY+/3w+gwTLcUFx41rQC91jpGTc83wceN5W/Z/lxCkGO/aSeWZhw==@linaro.org
X-Received: by 2002:a17:902:fc84:b0:223:64bb:f657 with SMTP id d9443c01a7336-22e1ec35548mr43434335ad.46.1746336561836;
        Sat, 03 May 2025 22:29:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746336561; cv=none;
        d=google.com; s=arc-20240605;
        b=fh75qIumrM8CKSeBUDF5WJBuQ6Fl4oWVKertaFWOSJHPXxC78nZRX57uZtat9RzCPC
         WcEGlnbCkicbVqV/DC2aMYTGxv5EzyQS0NTM0O06TMZOopZ/WC0qhEzX9j/SBpCt08gk
         N+1jmhpjVVzyhQF6W7NotMp1NVOtmlXtLOTybmJ9xG+6toQBpF9Q22wi/ly1t7gy361a
         BLJmmqUypaIDwPQnkgwMNj7S7llNz7Fa6mfoMJ3cIeSyppnj7VVEVe+taJ3kcBuVbFdl
         LZk7lyLKlLw3bKHNI2arY6GULiPPcc0QpdZE7OW0cq8LZQsd+sxZDvpqe6ovFgyBDHkk
         vUvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=v1JmSJqnxYquNU/v4UOEtwOcqbxnEb6aDiKyyBWqJ6s=;
        fh=T+vtxJIZ6eJILJHQb19+qjDIw6YGGzFPg3XRnFhrVU8=;
        b=ZhNwwt2ODgwrM4Y+/covLJ3c5ZNp2RR/x3fZwVt7UIUe0709U7jChdsTEdC3JRWP6e
         2uA+U8iwSIr+8OUCH1sGcTHusR60vWFNPsa/8GG2g7GvklI1TiPrW0OWtH2aahrU1Nu6
         k7AUbDAp4I0i3MBK7+5R+6UHAZEgxkVWqEt/eh8daD38AZydK8zf5rfOWlngwlPtfKsj
         0T/DFPuyDMPCXOpwp6ZO7lY7o5ifeqTjyyrHR39PwGja3/izwsXxXnArwaExo1D73wTx
         ORJSeeIUpGkRVl+fMoVobi9SaoUX+OGnX5hkx9hjr/Csn3ZlPrErDO3/Ii1R76mnNnzM
         OApw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="YUCU/K1M";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0ba9d308sor36616995ad.0.2025.05.03.22.29.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 May 2025 22:29:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="YUCU/K1M";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746336561; x=1746941361; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v1JmSJqnxYquNU/v4UOEtwOcqbxnEb6aDiKyyBWqJ6s=;
        b=YUCU/K1MSWeidZ6AA1eIGSnvRK+JkmCQ26OGXffwB6Pd85yUh6F4jhmfVkvvds8JVw
         jGutEeM9YXzHypwagqtqfhrktbERNeYoQZb7v2lHJhP0xAiHbjZqdCkRGB2XWmSqs6xw
         MlK0fqwMUB3hTP/u3V8btVMyoJ3Jeg6GELPqZIMBYwHKbAUQWlV+vyQ9CaV1Y623A3ct
         KRqqP8TeHMKPaUOSNPn+R35PXspkZEawZSXC9YQp4dkuS7kwlTjp3Dd5HPkZcNK0i1cD
         HZuMMqgVB5fQ6MhfrWmD5RKpxl32xKqUbvSenJcL6xaLeYltjHzgHEfq+0RcekqFe3/4
         lWbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746336561; x=1746941361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v1JmSJqnxYquNU/v4UOEtwOcqbxnEb6aDiKyyBWqJ6s=;
        b=QrDic6qn/UJSZXoMQhIlhDDzcjujYRcsWztr4iy0m3qVbynCCUuT1SZYynmjiRheqK
         8J94QGLxhbSLAKGiK1fXRel+9YMkJ6ozHApPxIwHSjB/r4oJKiuvd1w1RdtrgRhgJoXX
         X+7ufFR6Pdspnt53v0br1HWKdE8d6tBtnKyMY6iiqyXs6OqXLlLVbb4+rTlVUdoUyKdd
         FNY47cXkHQqJUasLwFcHi01MFIrD5T4HVwcxv/FoJPLWRQHToFqTcZ0SVO+3doye/Uc0
         sYrt4SbJobsQVYN0pL+vGph4qFXJdxNt/sEp+HxP1oy5bLDyVzvTsqbrx/0bjUn5kwQw
         1eFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUaUtR4ViM/9Sq5NgtfZXg2bKzC/Ut9B6YXi8KRDX1+39XZ8jOsRcUquHLXagLkwHRd9C7qH73OzeL3g==@linaro.org
X-Gm-Message-State: AOJu0YwXNiToEhPLsuJROJey89TB+t3SV/r1qfYAbeLtVSpgEsOjpYxm
	KbYDY4TNLVebtosoX4w0tJHnMCJxkUqZQTK80TyuwxkNmwzDLj7JHLN9adszX9h0ow==
X-Gm-Gg: ASbGncuhNDP5XZTjIHcALH+qLhqxBKI7gqGc0P9TfGbyp1iy+jyp6eDcpoTDHf8vin/
	OXgsajU9uGoyDsQyo1uUqCSQkWcOXBEqW+gAMCUkIRhm1EwwK2m3OiiZokyYw+sDOvkZrx8wPlm
	2p0q+Xa7PPhylpeXXV0yz3zD44ppP0QOwqBQTrvQdrMWPvyvSC7hLBxXK6K7uD70HPJfEI1/PXR
	2YB0i3EAGk03zt4+++oFqxU5WwPZakB/lJyNFkYbiVLTPNn9oauwI+sD58KL1UnMT2BRA0R6npn
	DgSkOEnR1s4vWmsdCeRAFVNAGOVVkDJKK1ND6Xu6
X-Google-Smtp-Source: AGHT+IHXnjnzTW6tdaUx2wqRb/N+J0DcR77Y5QyXk4o/4S99YU+4N55bxZt8UGnvoRa5cSJGoQ9fYw==
X-Received: by 2002:a17:903:1246:b0:224:e33:889b with SMTP id d9443c01a7336-22e1ea3ced2mr48331655ad.12.1746336561460;
        Sat, 03 May 2025 22:29:21 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-740590207e3sm4400511b3a.94.2025.05.03.22.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 22:29:21 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	anjo@rev.ng,
	kvm@vger.kernel.org,
	richard.henderson@linaro.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	alex.bennee@linaro.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 01/40] target/arm: Replace target_ulong -> uint64_t for HWBreakpoint
Date: Sat,  3 May 2025 22:28:35 -0700
Message-ID: <20250504052914.3525365-2-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
References: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: O5Y8fDpNbiGt

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
