Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp532071njl;
        Tue, 8 Oct 2024 17:05:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX/uQWmarbitvVRrauK2o/m0Dz4w4MuZ9zF856/Cz0vswLtV2Ufnb1nppsGGH947mjfauvAqa6iJ0HPNQ==@linaro.org
X-Received: by 2002:a17:902:d4d0:b0:206:adc8:2dcb with SMTP id d9443c01a7336-20c6373aa92mr9865375ad.25.1728432309337;
        Tue, 08 Oct 2024 17:05:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728432309; cv=none;
        d=google.com; s=arc-20240605;
        b=OZ2D/x2SCh+PVPU5bJFPaqyAUJSeT8ZLm/V8ZffOGS1/KyKLOF3pN1cgzHuLbdmFsA
         qvMJl5I3e2+gxDymBA8tGeA3zfaREdzUfIqQTu9iDb18pQDcOeAk52Y45S7ULf/KSt6s
         OkI3Jha0phoGAsg+zO9Oqvnds4mS92ofeM6Jfaaqy3sx5CINsBZfq0Gt8oDky9bnp4ZU
         S5mYvnqJrlGhPiigL6SDlUseasc+plbRijeDVcvCOxCrN7XkdyLIpuCpXm5X4/XnQZ1z
         NesASiGpb03qF7H2GZpgSM+lfcYkcZm9wjwM3jhvJuSKH/eLdBhs0N1Qa5s67Bl2NoVn
         ksTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=617h4byv7OP/ct3y2kJCr5k6Qy1wZsttJUBcCYmwvNQ=;
        fh=vPC+Af8SjrabvmQ51LbEXDxru/4sV79kOV070oThD7w=;
        b=XQTbVzwhH9P1raFwjPJGJNyqE1V9Lhc9+qwDQ+nbuNDwhJcny7DbMfXAcNws/7ipzJ
         PWGmEFrBF6MxijyyLt1Bmua5UzAVy3JH8kHUcJ99KKTMCP/JiWecRayvS8H1SE14EMzQ
         Jkvr81zKVbt3CNz1AoS4WCaNtg6Mscf+uW+gHQQUwf8a1ZZr0AnRa56DO16LCpRZ2Yaz
         DUcWja5ZbR1i2b8XQCsIYCItZWtgR7mSwbHMR25Ww8Z8rVyq9iKXXb0mBnsWLvlCSN5y
         19zJLxMZ7qzaUWgx6IgEltizyxzVgrwiRjFp5OsZhjdLwe8WuydNPBPfRTZnc4i1qeWr
         jqww==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iGc9qYDe;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20c1393f0f6sor62761935ad.14.2024.10.08.17.05.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 08 Oct 2024 17:05:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iGc9qYDe;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728432309; x=1729037109; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=617h4byv7OP/ct3y2kJCr5k6Qy1wZsttJUBcCYmwvNQ=;
        b=iGc9qYDeGMpssuljsyZ7PLk49YhY8ifDqOdXMUP7l4r2Wd+hKkr4T0/aA6gxJoWQPB
         s03hpakys4ku+skXGVBF5FpnCjGtMykMHF15Sv1LLqRlS2wJ8LunNE1rqX4zikNdyn7B
         5nSUcfd6fdGMWxCt8Q32iNyuaIM+XMbBnsOPvikaUk/WIn0TdrIcHB646l/c8bt8xA2p
         aV5FDZNEkJ5cN0XW9KEI+mxDBh631L93fU9lTqIv1rSqq4FSMaZhOsn+wEwxxDGcKjXl
         T1xfNT02ig3o2sot9cRENOgkMFRmIwWdoza+VIHFCmIvQiEL3GYPNEswJTg0A+yXN6+D
         Mwdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728432309; x=1729037109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=617h4byv7OP/ct3y2kJCr5k6Qy1wZsttJUBcCYmwvNQ=;
        b=EuZzT/siv0ru4/HBV9+XMMzoBnaYCr8Ahclrb6ZZx1fjnxy9UUGnpN6Elx6+rwTijf
         4CmMRFQab326VFUWctoIbQY+MLJawsUsfee1BtzMl9O0NfGzF6qx4oz9UWh6mcc/7IHg
         gEEeF6lEQIS89coC5j1P98isy+7Od7Pj2izfYnZDSUMqyM3AqU+KQ6167R/dlSP+omMI
         mgPtASiXkbiGTKGihDJlW5nll9hssgcktV9O+zwcphGLjwCAZow3KkXMal1W2cyhaSwi
         Fg0VA1CPKb9A19ERk/hL34BxL1SdwOWmiFJlgqYhgVYHEgOPkPRuBH6YgQIpILOO3Oaf
         wp9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUS6737K8wYjm7LmRTo+ljerkcHU6t8o70hyglG0jP0GBtYit1d1TcmNDjJzCB42N3lI/1Nfso7rkPZPA==@linaro.org
X-Gm-Message-State: AOJu0YwgvNrIs+iQN5L4Mp1qsd/BbIlkGBEkD1Vwl62kfCx6K+Ug7Y7L
	IvU+2CIZzC2CPpJOAzXmg2vot1dICqZo7bdPJxq9Knv3ij1ugPNaCHFi1lP6Y1ytAA==
X-Google-Smtp-Source: AGHT+IGz831u80Gw701tK56DvhnXhyXPWJ4bmGeVXTKsGYyVIeaQp323LRx3BoQmx+OjkzUmoyjqwg==
X-Received: by 2002:a17:902:e543:b0:20b:5be:a403 with SMTP id d9443c01a7336-20c636f5d9fmr11781085ad.11.1728432308873;
        Tue, 08 Oct 2024 17:05:08 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c138cecf2sm60705105ad.104.2024.10.08.17.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 17:05:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org,
	Helge Deller <deller@gmx.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 14/20] target/arm: Pass MemOp to get_phys_addr_gpc
Date: Tue,  8 Oct 2024 17:04:47 -0700
Message-ID: <20241009000453.315652-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241009000453.315652-1-richard.henderson@linaro.org>
References: <20241009000453.315652-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 4mvuAFB+7l4a

Zero is the safe do-nothing value for callers to use.
Pass the value through from get_phys_addr.

Reviewed-by: Helge Deller <deller@gmx.de>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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
