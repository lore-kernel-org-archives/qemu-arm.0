Received: by 2002:a17:505:840b:b0:1be9:327d:8ee3 with SMTP id lq11csp24228njc;
        Tue, 21 Jan 2025 03:41:03 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUETOZggjYIy3xMAdzEUrdk+Bp/WCAWleiAx+yK2YIvMD8PWqN4VfrMsXdkipQoxEx9EptzVfKU1+vAtw==@linaro.org
X-Received: by 2002:a05:6000:1a8c:b0:38b:ed6f:f00f with SMTP id ffacd0b85a97d-38bf56635a1mr14823322f8f.17.1737459663433;
        Tue, 21 Jan 2025 03:41:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737459663; cv=none;
        d=google.com; s=arc-20240605;
        b=Gcy/tMFML4kfwx+n3RDDH9U2mxcOiZmLFwgLvb9WDY1oCHnskxi19b49u4QCE2fq/v
         dzHzFyHaNLvFg1YIl7kzfsJTA1vKTyXdQE7/U2R/t7zJ/F5gudeTQVTGplorvtTTEv82
         KSYZ7Y0lB//hM6x5TNRRx0PwlP3i5+rQxBBrgYLbRatE8KGo2ViOwF391AayeR6dfmcA
         74zHmoN6XED0TZvGIZph/OK8zwp9a4O8oQRq5J0QMP/PG6ImvsLwL6FMBeZS+QJ3OJtY
         ygPL9mAJLuN4owSmde6q8p9g1Ck+G6RbkZLFBf03PXsOfQPjGbH+/bySQ/h1IbZEPDL0
         djcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=FMaF6+Wa5WYYaGZJTTHWyD0ctSisYPOSoq9ZRxR4GzI=;
        fh=I6TQ/nAYejACVmW0mi2PN2GvYmH7A+qEARzAxw8CGkg=;
        b=Y2uY4xXeSjI+Tq1KWzz28NnV3E0K/ViyDoD9cB9mxoaOEPDh+gxszI0EvjyvsJEiEM
         mZEclZn07DEGBN231xfLGEQ9Z1H1fIFVWVIJPa+3HUaEariYeyUrcu1hQysl8WKYGWxh
         cT1MwU4xsSBLBxvZEwZKbRjktTYgWYzHu3e3GlWzeVN20MbzIZ7O0byuFufAGxx1vuQl
         FG9b4m+7gZOUsHoiSMH5BhNOD6TS9IUEkm0dJ/wfsaNTSYs1UCnLzF372SUZJzW2dGfy
         VHmmNOXnHXUPuwCvqUXFMc/MBuQ8KUD1PaEv8oDBPcwQeKu6UIWgrloUInkB4iRkGL5V
         ySYg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BOXybqt4;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43890467da5sor43364615e9.7.2025.01.21.03.41.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 21 Jan 2025 03:41:03 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BOXybqt4;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737459663; x=1738064463; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FMaF6+Wa5WYYaGZJTTHWyD0ctSisYPOSoq9ZRxR4GzI=;
        b=BOXybqt4yFt51Ablcg49GAmyWowxCKswc+ZASO5vARPNH/hr0n1/vc2NlLA0PAkmp5
         ti7rN3mSefpkGMuS/JV/NI+aW9GG74rG0c8WiZ3BczsjgN1jK3yMp4W78kxe/pMLEZ+P
         aylMNMVb2VtFhZ5+ZRAzoBpmhJ5kNg4FCMGtyxG/QDVNw+CfyMV8A8TUICM2ZwNVpOo5
         snGAT+1J/7k/PssOSDqGfROHsqntmgpug9ZUyrLbe1hR5ad4zYNTGAf+CwiKHA2VR+8J
         HriyXzO5gZ/TSir6Xh7Gv7j/VBXulxujccvaIS5ynJ6Qp9gU/ocHHeYmzVloBcf+DDLF
         9i/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737459663; x=1738064463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FMaF6+Wa5WYYaGZJTTHWyD0ctSisYPOSoq9ZRxR4GzI=;
        b=m0Hu7Mtq7G4cjlYNUgOdN++9+o/0QNorHX6RYC62757EoOL9Yw0uyCcD/Vx5A2/OW0
         PpNx7WGsgJo6jXS0ZNkREgrYDbJoXqyYfx73uKkb3qMUTfCTPtIzwsi1vk9xJdVqJh0f
         fEXV0a4hRSwDtjsVngAIpo7iL+kFgB/Ev8AxVtn/l8dMQ+qoPT9tU4GgZPz37tiFGDgZ
         8/oDvUaFjEWSte9V+NJuUOmUi1VWa3nMWzL4boigHLiDWz+g4XF6pUlCx2ObyP3N73Zc
         NJsGUsBvGb6s/OvneJkdiys1QgV9WeE6t7AUrNskFs8PPVImBrxnpPvlEGjeR+HMHZDL
         Tf/w==
X-Forwarded-Encrypted: i=1; AJvYcCW+Ik9Zs+2w6qoItG6lQwqvg78Y5MWCn6qRq8/LWDxbP4+lrtOECujQJsGmKPcnWtltGuhvg9kaEaR/Gg==@linaro.org
X-Gm-Message-State: AOJu0YwVUpSLEm1mHgOBowbebMyK9hTSe5rZPIVwZ8h6aWQNGPA1XeL9
	mftPjiyZOTfD/aGZPpID32y0sHstXw5+E9z92UkUqXhU2DciNjDPfTezxQ3b79FFiQ==
X-Gm-Gg: ASbGncvM7SMn08Zi6SRznmDU872UJYZCSMlHNH4xZFeGiNjtmbVYSQZCik6PYtIV+4l
	Mpy7idqomMSYHN+tYS4G4l0UHjwOoBSB+6WG/hSxccGQ+nvtb/FkTRU3TskcxEixU2ISciPhCZW
	9VfemYtJvFmkZiP3yvT96H8ZoS0X79Ea/4ke6vEw2GxNS2olJ8Zf6M1O3KabuWumu3PEv9rwte8
	QJ9vlCBOPGV5o6xA0my8PMgKqv+23jL3y9uEcQd0xXdjEvmMmzxU+foQR6rvGVFfnkGV3Ndlk47
	4pd6LmPeMJZIt/wWVKEhfx4XC1PK5R68jGm6cu2wZ78+
X-Google-Smtp-Source: AGHT+IFxIGaP83HpPmv6NXZkFq2jfmtvkIsdcXSRb5Ou3rbnTeLi0+ZTeJpHOJpXjMv4wJPlutsUQA==
X-Received: by 2002:a05:600c:b8c:b0:435:330d:de86 with SMTP id 5b1f17b1804b1-438912d2c48mr162947445e9.0.1737459662693;
        Tue, 21 Jan 2025 03:41:02 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438904625f5sm179480395e9.28.2025.01.21.03.41.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 21 Jan 2025 03:41:02 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 01/11] cpus: Cache CPUClass early in instance_init() handler
Date: Tue, 21 Jan 2025 12:40:46 +0100
Message-ID: <20250121114056.53949-2-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250121114056.53949-1-philmd@linaro.org>
References: <20250121114056.53949-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: u/ZR/dv5g46S

Cache CPUClass as early as possible, when the instance
is initialized.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 cpu-target.c         | 3 ---
 hw/core/cpu-common.c | 3 +++
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/cpu-target.c b/cpu-target.c
index 667688332c9..89874496a41 100644
--- a/cpu-target.c
+++ b/cpu-target.c
@@ -134,9 +134,6 @@ const VMStateDescription vmstate_cpu_common = {
 
 bool cpu_exec_realizefn(CPUState *cpu, Error **errp)
 {
-    /* cache the cpu class for the hotpath */
-    cpu->cc = CPU_GET_CLASS(cpu);
-
     if (!accel_cpu_common_realize(cpu, errp)) {
         return false;
     }
diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index cb79566cc51..ff605059c15 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -238,6 +238,9 @@ static void cpu_common_initfn(Object *obj)
 {
     CPUState *cpu = CPU(obj);
 
+    /* cache the cpu class for the hotpath */
+    cpu->cc = CPU_GET_CLASS(cpu);
+
     gdb_init_cpu(cpu);
     cpu->cpu_index = UNASSIGNED_CPU_INDEX;
     cpu->cluster_index = UNASSIGNED_CLUSTER_INDEX;
-- 
2.47.1
