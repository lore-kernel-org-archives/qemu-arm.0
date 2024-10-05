Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp1047871njb;
        Sat, 5 Oct 2024 08:26:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUx3lvejMUggAxnUbLHNlTNu/pk9WBSog882fnRbN32wShpdYfBAqQdo7wZSMTAw+hhoqWMX0Rt++RSEw==@linaro.org
X-Received: by 2002:a17:902:ce83:b0:205:7b1f:cf66 with SMTP id d9443c01a7336-20bfe049ebfmr78371435ad.35.1728141967928;
        Sat, 05 Oct 2024 08:26:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728141967; cv=none;
        d=google.com; s=arc-20240605;
        b=StP9Wz2nCQ+Hg0RYuLSFjuBUrLdGtWWubmxNxd6PDoqGz/cIiDL7iD2ER3TzICvVgY
         kSa7vUxxvwcti6zcDveejqscD1jofOsycd1QBa0fDQW9HUqveiZJ8SRYMqsMIr1C4XYQ
         DNweW0mSuxpw7PkZXD/ShFkZ4i/5wcYRTl4hOsWjrfs/hzZAbEN6ty+UksImSiOYGyO1
         wmLqsJbAl6BxsxI1EuRRF9xRtd5UEI6rPJj4kLA5S2oBFIn6UabWAxbYWVyarFulnkjb
         8+Os5hBqqfy79LtUAuhqlQ5BjYVwKgJvJs31is1ZeJfX7NxHLNIqZjPX6z0teLYEwoME
         ttRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=4X5zP7zXx4H0vSkmfgBSYylbUDArgVMPw2dfqzvhfaA=;
        fh=R0nYRiM7UJT9o8bLC0PKnpcA7w2ztjdeqh+gSB8gFp0=;
        b=DbUhNE3CsCdFTUFHcj6P4yh6IKQ36+l77ho358mf8w2+X9QfalKnZxZkB1BbEsudDl
         c20kp9rUI/nZS8wYsq11VK4tAUa2IbKomaiqNvtG3WlUTv+vJRRFeiy2R5zbSFxg3jqB
         oRR2/KHxTlNy7eLyLdG44muzGt6AfMtSDSNMT/MhK/YirH08Vcy5/7AhnXOmVpnFNCnl
         Y9Sv/Aoj920/mmBGF/TnTKX3A0J47o1zcrP2bicKIPp8YkwBHxpVIttT83vTwtLvd5O5
         XsWMdsudGim39MgfrBVEyUghLPSwy4474H56ZaomZe/pINpOfGxb5Oig0z9RyQmPcyrf
         jd0Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kyNLf+jI;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20c1390f6b3sor8752545ad.14.2024.10.05.08.26.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 05 Oct 2024 08:26:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kyNLf+jI;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728141967; x=1728746767; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4X5zP7zXx4H0vSkmfgBSYylbUDArgVMPw2dfqzvhfaA=;
        b=kyNLf+jIu5Zph980MH9OYZWYiG4JQOBCMgd5cS8+juefd2X5+c+XGKgqxS5GHW4iIM
         oVYuY3VdIqjuVoEjfReJzXVKW+BygI1FK8HMJigKaIOBeyvfyH5kRmo8H3jC45MaFE/T
         R2b48bC/H78iZ1MZC6+t2EQW5iTRXqDLYGYZ8aS78LVdpAw8xs6nu7sJG++879f6cP7W
         I41osQ4ogrRv1+t7mxm55suoTesdxFsfVa7S1aDyecC5w82Ulea4CPEWI1rfDmqUx7AT
         oKhVDi6Ow+pgFe2nNL0dOTJs07klWq/iaCwgijO37yUUAaUsjruZP/EO9AUHvnItqp1P
         dqJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728141967; x=1728746767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4X5zP7zXx4H0vSkmfgBSYylbUDArgVMPw2dfqzvhfaA=;
        b=M63AQq8dy/vkxhuLLPcobaioy6oRd42yuJllbmaokeoy3d2NukCAeTdmrLtcbMag6W
         sfO6qDyMOi54k2fa6HbVWQIU1I9Rb440zS7zcruktdv9eJl+GCogM5eJrUB0GnPcoqNF
         nUTk0LmStIzQTcG9u5p+sE9SR5T6rMaukYJWz6J77VOe421bw2wV/MabEIb24MRMAP5I
         aM8ZLPSM+7Br8fg43n5kVtqYVrkESydMYTgANabdPHX7kvCsX7tHWrUPc6CAY3LLGePW
         iUtW9Yh29cjaLF9qoNXmwTGurNm4HIRZGKI2P9G4L/MX0YVKTr/wyuEeahUAjVtO+TKB
         bdiA==
X-Forwarded-Encrypted: i=1; AJvYcCVAzQTD3guiz8v5kPlRDedVentvj5E4zmfdseXKZB+Hqn3wGfV/BMf0GN+/lc0xbPa6IPVzilRV9A4i9w==@linaro.org
X-Gm-Message-State: AOJu0YzjxTvgR+oPTq3VLtMsCAvdefZgeMgY3sdxS+qE8MRoAKaHtnxr
	mOlHbBqfQqaVf8lOHycxiRaLLmnDNxqHb13IMrsoor2llzDSeXHsjNIJ0DLt2CVRew==
X-Google-Smtp-Source: AGHT+IHY99g3UXT4c2ojVRByg/b7oYD6LPj2/nVP/Gw9LAajOrCDKRjQrnpHrqEZDe38lbLZqZ4qcw==
X-Received: by 2002:a17:903:1d0:b0:20b:fa34:7325 with SMTP id d9443c01a7336-20bfe291d4emr83779435ad.43.1728141967491;
        Sat, 05 Oct 2024 08:26:07 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c1396948dsm14351765ad.225.2024.10.05.08.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 08:26:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH 15/20] target/arm: Pass MemOp to get_phys_addr_gpc
Date: Sat,  5 Oct 2024 08:25:46 -0700
Message-ID: <20241005152551.307923-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241005152551.307923-1-richard.henderson@linaro.org>
References: <20241005152551.307923-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: G+m88sMIYK3e

Zero is the safe do-nothing value for callers to use.
Pass the value through from get_phys_addr.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 9af86da597..e92537d8f2 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -81,7 +81,7 @@ static bool get_phys_addr_nogpc(CPUARMState *env, S1Translate *ptw,
 
 static bool get_phys_addr_gpc(CPUARMState *env, S1Translate *ptw,
                               vaddr address,
-                              MMUAccessType access_type,
+                              MMUAccessType access_type, MemOp memop,
                               GetPhysAddrResult *result,
                               ARMMMUFaultInfo *fi);
 
@@ -579,7 +579,7 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
         };
         GetPhysAddrResult s2 = { };
 
-        if (get_phys_addr_gpc(env, &s2ptw, addr, MMU_DATA_LOAD, &s2, fi)) {
+        if (get_phys_addr_gpc(env, &s2ptw, addr, MMU_DATA_LOAD, 0, &s2, fi)) {
             goto fail;
         }
 
@@ -3543,7 +3543,7 @@ static bool get_phys_addr_nogpc(CPUARMState *env, S1Translate *ptw,
 
 static bool get_phys_addr_gpc(CPUARMState *env, S1Translate *ptw,
                               vaddr address,
-                              MMUAccessType access_type,
+                              MMUAccessType access_type, MemOp memop,
                               GetPhysAddrResult *result,
                               ARMMMUFaultInfo *fi)
 {
@@ -3641,7 +3641,8 @@ bool get_phys_addr(CPUARMState *env, vaddr address,
     }
 
     ptw.in_space = ss;
-    return get_phys_addr_gpc(env, &ptw, address, access_type, result, fi);
+    return get_phys_addr_gpc(env, &ptw, address, access_type,
+                             memop, result, fi);
 }
 
 hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
@@ -3660,7 +3661,7 @@ hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
     ARMMMUFaultInfo fi = {};
     bool ret;
 
-    ret = get_phys_addr_gpc(env, &ptw, addr, MMU_DATA_LOAD, &res, &fi);
+    ret = get_phys_addr_gpc(env, &ptw, addr, MMU_DATA_LOAD, 0, &res, &fi);
     *attrs = res.f.attrs;
 
     if (ret) {
-- 
2.43.0
