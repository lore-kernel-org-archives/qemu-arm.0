Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp252739njc;
        Thu, 19 Jun 2025 06:13:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVUFF+8nbb/jtJiKmRlVJ6J042OAY0PhMu38UhsDSaTKQXV4zUwwUxlRe0sJStUL5ET2JboLmlQuz7DXw==@linaro.org
X-Received: by 2002:a05:600c:1c87:b0:440:69f5:f179 with SMTP id 5b1f17b1804b1-4535ec3875bmr33920235e9.7.1750338835422;
        Thu, 19 Jun 2025 06:13:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750338835; cv=none;
        d=google.com; s=arc-20240605;
        b=kELZQXvTw2B2g5ai/sVh5yHl7WrEleFDUlaZBQ+gzqzD4IXxgke7RDLLw0s0GWj2G8
         QzkDoA2/59sHF55WwCDcl7GnhDr44iuf8Ydep90C1WJ9B0009/PDUKqSYoXgEXnqaaCo
         SBRiXtYjslhpc1sd4MErQnPuTYkDtiIIoGh+KK0QjpBbPgLQ3srRl8hIimR8qCj47eMi
         oYE/djuktOID59d6NGXBx2UqTUnlbBRo3GNXQxDbx3XM67Qluh1iB0ZNiLcoMlj6PCGl
         iJWFlKP/IeV+IgwYvGHnsToEtGEiBiRkIXqnZOW/lsU+K7FA8QWXaFSqzm0C2oqMJggb
         hKXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=UyPjw/EICSj11C7UIftsbx9d+1RqLVuFlx6cdDbkp90=;
        fh=J26UyZ567U2+/mNGYk7ThGXemxwHLpRVQSXT/8QLUA4=;
        b=RhxGpOd9YrecNxsYmr5023Ot3C0ENfGrestOLYqdHRcq4Tm/c3J7cGRbVL0X2VARWy
         gadSnxGN8VnNSjRzGaOZXV/Y3sR6xkFCbDG5K8/A3+dauYfy07P2Y0j3k10CM6YZ8yIl
         AFz+LZd99swNwOBrG9FJqxg6XY7hK6D1aPKEC6+JGafLnlVkSVllcJmqYzX1liqE6nHg
         rneagFX6hk4/4R4RyU7ifMVxQzwPGG4mKjxtnQ5NmXivjqgnyw7tXQN0xUN47mCXdmry
         OrAJ9QhvyN12tHBlNcCespzXMUfJqWtD1M5rFAwumihK5QMPwfDUpCuvZ5NLBKb1I/nR
         h3aQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EcKSssLo;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3a6c958610dsor801989f8f.2.2025.06.19.06.13.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 19 Jun 2025 06:13:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EcKSssLo;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750338835; x=1750943635; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UyPjw/EICSj11C7UIftsbx9d+1RqLVuFlx6cdDbkp90=;
        b=EcKSssLoDTj8YseplvmSPaW13zklukt0PpvG+9VlETJ5yLuAEWDugGa8y/QWuMsokB
         YXL/Z6eiJqQKedmIP2JGz5CCistgk1SIBbpFjmP3YQO37Er0fxKlnRPUOReOYVYgUqVb
         EbYTtZrz/RV5pevzZTZGM2cxHTtDKDZdAR1agjSlZHa62uQYUL53togpeSZMuTop9T39
         rvEI4gKyA6eWYRaoMPMPzgwmIuw+v1N2R7wOPEuvfCl9bRoz4vdlb70/jfmKNpHlZqYp
         ykiLayqzSkPFz+0Rsx0KUMdunn+tpI+BXtzeULEPCiYlfeNAzwu4JHucSDsUTDJQyTp3
         s2yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750338835; x=1750943635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UyPjw/EICSj11C7UIftsbx9d+1RqLVuFlx6cdDbkp90=;
        b=OmTxFouulkgPndTI6QuhEbjfjv7jcG64Dk/gz2h/g+oiMzhA4CI6IYxVb0Jf0PjiNt
         ndjkpkKT75v3wK5OhpkGgwRndoY2sMqaDZKvFr/EIYJrfeSWh5vHSeh4QlSH4KhfcFxh
         0SEHWIk8X1fIHL9HQ9Cx11gyMzuTaYr694JznyyQ4MsqRErrDhVMBhG98iXRR+2JhoSG
         BOkOSeXv3BZCmEzKHoO6+NJbeekTVBefsnS3kdusBe8bExyoNdrSZBp2VJM518SDPFp8
         xgkIz5szsAR1cZIbIv1MVPYFtyaBUShvBc3E6rhcFhfivtOq3AS1PVJU0UMKXpnJyOAf
         gbpw==
X-Forwarded-Encrypted: i=1; AJvYcCWaWzUEGBDrPDuKrul9yp9H1RY8PHGsShUnvOwvQbG5EIfpSYVe/rtBFcpFruchiQKWW8Mb2Sm49bvU1g==@linaro.org
X-Gm-Message-State: AOJu0YznwRAtVYthLUIccZJ0uV8GRpzFI2modQLqyyu7nbTL2Qx9Gb9o
	cW7RO7xCQtBDy/ts0HKPeDyHpBA1Z+CiyMWYItmrFF+6o/vfr34DGLKHoET9ZTsfUFHIUg==
X-Gm-Gg: ASbGncvyMawQF4wwEV6AatqhNsxtU47NLHswcA2oM60VBwwmY9toijlODpo7hO2lXXm
	7OztzYxfi4S2Cfc2voNZStQAbyT5vEXSU84S899fGadIxYAzwuq8GADpbWmD2+sgD+NAMiG2hCQ
	lMk1xFV96aKY0YQabAkJjWudVvNHzrwxgbNLC2imKF8nD/YaCrN55YBR6iOQK0wkstS5zXulZRR
	l6k8xwNn3Gt9pfhN21SPHLy4gQJuZ4l9x7FmdxAYLU8P4Q/RAzPpEx5R04HT4soMYUSpEin8kdZ
	rI4dOD2Uihl+8U0idhuElT4ch5fSRLvUEiwGSeaKTWT1uLWt8VMBKISduyj497C8QLZ+JcmQ0/K
	utio0Nhl6rrd6CxBUpPtcu034E8ZywBXwdeys
X-Google-Smtp-Source: AGHT+IEjodew1p2iOcXaxxRKozUpoGn7RLSDtMkNBt9kEo1h6AALkAFYm4aB/mN1Eoyo1pNh3qgXcA==
X-Received: by 2002:a05:6000:2210:b0:3a5:1241:afde with SMTP id ffacd0b85a97d-3a6c9692af0mr3671381f8f.9.1750338834779;
        Thu, 19 Jun 2025 06:13:54 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b08c7csm19792341f8f.50.2025.06.19.06.13.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Jun 2025 06:13:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Cameron Esfahani <dirty@apple.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Julian Armistead <julian.armistead@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Phil Dennis-Jordan <phil@philjordan.eu>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org,
	Roman Bolshakov <rbolshakov@ddn.com>,
	Alexander Graf <agraf@csgraf.de>
Subject: [PATCH 06/20] target/arm/hvf: Trace hv_vcpu_run() failures
Date: Thu, 19 Jun 2025 15:13:05 +0200
Message-ID: <20250619131319.47301-7-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250619131319.47301-1-philmd@linaro.org>
References: <20250619131319.47301-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: wY8ndYfohUrJ

Allow distinguishing HV_ILLEGAL_GUEST_STATE in trace events.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/hvf/hvf.c        | 10 +++++++++-
 target/arm/hvf/trace-events |  1 +
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 30dfd97bebf..1ff3ff7b91a 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1914,7 +1914,15 @@ int hvf_vcpu_exec(CPUState *cpu)
     bql_unlock();
     r = hv_vcpu_run(cpu->accel->fd);
     bql_lock();
-    assert_hvf_ok(r);
+    switch (r) {
+    case HV_SUCCESS:
+        break;
+    case HV_ILLEGAL_GUEST_STATE:
+        trace_hvf_illegal_guest_state();
+        /* fall through */
+    default:
+        g_assert_not_reached();
+    }
 
     /* handle VMEXIT */
     uint64_t exit_reason = hvf_exit->reason;
diff --git a/target/arm/hvf/trace-events b/target/arm/hvf/trace-events
index 4fbbe4b45ec..a4870e0a5c4 100644
--- a/target/arm/hvf/trace-events
+++ b/target/arm/hvf/trace-events
@@ -11,3 +11,4 @@ hvf_exit(uint64_t syndrome, uint32_t ec, uint64_t pc) "exit: 0x%"PRIx64" [ec=0x%
 hvf_psci_call(uint64_t x0, uint64_t x1, uint64_t x2, uint64_t x3, uint32_t cpuid) "PSCI Call x0=0x%016"PRIx64" x1=0x%016"PRIx64" x2=0x%016"PRIx64" x3=0x%016"PRIx64" cpu=0x%x"
 hvf_vgic_write(const char *name, uint64_t val) "vgic write to %s [val=0x%016"PRIx64"]"
 hvf_vgic_read(const char *name, uint64_t val) "vgic read from %s [val=0x%016"PRIx64"]"
+hvf_illegal_guest_state(void) "HV_ILLEGAL_GUEST_STATE"
-- 
2.49.0
