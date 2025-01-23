Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp485511njk;
        Thu, 23 Jan 2025 15:45:43 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUG58eVADlKVJCt9zUw710yJirL39Orw3nEyoYb7CUrWD3wwKdGmoWs5qfU0OJb3q1Ws5BWVFSCHl6qjQ==@linaro.org
X-Received: by 2002:adf:f249:0:b0:38a:4b8b:295a with SMTP id ffacd0b85a97d-38bf5673c40mr19168876f8f.31.1737675942814;
        Thu, 23 Jan 2025 15:45:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737675942; cv=none;
        d=google.com; s=arc-20240605;
        b=g2BHZkaRfEs3hXZLJg/FLWyTe6eVzC7ffyjZK8lvyeDGVg3jHUYckAcsbl3+9ptbEU
         NNeg6ISz6h+k/Z2+PnJ3R3+UFmnvg+Cs59yb2Hs+psoq4qX/n8edRX4FHki0dMlE0rJB
         YSoiHAWWuxDSgiERttARsKM0xS1eWR2frmnSfFPllu5rPl4yRro3yEqU6I25X6dAUUDA
         X7lFivqNlxCRBZeHFvsgKlAu1DWxVcyTgRWKxnQjYxqIAi2sCidlJ3SXQyaRpWbjMMzI
         KmmeTGeFyRPl8ZQi8Fa2ccdpnLWsy1/6cDui52vyqM2Z4R1rfDY6jDXxo+jMHsc3YBEx
         kX2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=GOf7cXhzVFnELwvvE/9oD0dVEdIwULgdsVx2rdQEX18=;
        fh=pz/Z6q+8YQ3YN5CB1AwVdmn3lX36ho+HY33BnwPZFa8=;
        b=gnYuTq5yKyZkankpADq6tzyiAPZSs5ph7Md3Mlbp/OCzW5LeYEcqiagnTFKtuOReEI
         pAsbQOORYhXN0S/6l17fXlua3+EODtNWt1sGrZs5UXzq/F00tcaSrDPpI/SQ6hBACNxq
         GqfVvh+g0DgyYy61OULjkixI8drntL539EaPgqU1gnbm2ynJ9ZFhcHVj5Y/kx4k7gja/
         AYW+YetIwxdVwUVDGSyWZOU0cbGT6wNTSurVnwAJzwhZUnkpqY0B3307nxkxmquD4ixJ
         PlsICbF9ECsMaEPR6ZLlJ30hZM60uJUIqiUojbEpqdDiWzpdQoewz2I7KCWyZ1pa9v2L
         S6HQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="M/irKgiw";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-38c2a1bffeasor356749f8f.6.2025.01.23.15.45.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 23 Jan 2025 15:45:42 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="M/irKgiw";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737675942; x=1738280742; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GOf7cXhzVFnELwvvE/9oD0dVEdIwULgdsVx2rdQEX18=;
        b=M/irKgiwgCJz2QMJNtBTQLZYRAErl3myTCL5nDsmFVaoK6Cyudl81g/nZNukIZbUWY
         cuwkrc62TmgbeI+zHytxFbtQHmm5MWmj4V5mTw7jsNUYKeopE/vFxySPYNYwr0SwaPKz
         L/RXicw443Dq9DxFjRVTV4CwXM9s5I+IxO6zoFWNWkw1RX9iwyJlKS+Mb4XTJq7cvt1R
         +B1Ru0OAaDvZQSpzvV/h9jND4jd4PSdl9URMk9d3HiefihsrpW9YQ24EXO2lqP9//VOh
         OHTs+bb86hZR9WZyhmA/qHJQo3+LQpAaPUsnMn0NzxuYVRssxkL1G43doZh19MHuQIS8
         tTdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737675942; x=1738280742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GOf7cXhzVFnELwvvE/9oD0dVEdIwULgdsVx2rdQEX18=;
        b=giEAonKc/4UqGr8ItRkao9nMYVb4b6Lb0WsF7O/cqsvPdLLy9MGXwJl1Tr8gFo0Mzl
         9mnTZXF18gWjGAkmhfVRw3/52mBQLJrt1GlK+rCMsXL2VGvGVIAZQy227VVl+moHtSm8
         9+FI90AAHvKqikzVpJfizjl8iLI2+zpPHjOo+zJQQIyTWAYY6xW6l+riUijXCyt6JFqu
         jSuv3XcWugtaeiWffzuCHuDJ7Q5Lw4nQatQhAPRzloDl4mp+leQW64bZsuz76yghuC7D
         +yQcwcLsNXWDce+l5JWzEzsVoMgFN8DHwNS3IdplVNW0YMbAWmUr/fgJ2MrA6ykqFBb/
         5cAA==
X-Forwarded-Encrypted: i=1; AJvYcCVZUJQytrD3MPB3Utqt+GoBdEXtApqE9A8azV3j0U/5Yo5bDDBs+sTIH2kgLIjYr7GKntoZuQegGvD7kw==@linaro.org
X-Gm-Message-State: AOJu0YzHsANk7tcKSkpci0WHKx4fwZmiKaBDCzuhI5H7O77MwsZTMr2J
	KOyn/M9PYJvxQ0cmYjrNuz2t1+RdKZz3YLVMsEeI2jdBXYOUmt2AHocRPs5YeZMYsw==
X-Gm-Gg: ASbGncsUzRyma5v6FkRk33wA0gkHPGEQlVc6RZeyaeOMN8JnOkAxVoyfSdi3DjD8u/R
	jffKSINgCSFv9CCVoSKd2taBgttnWH2va+Id8slzS9LT3HM0IrYefJBeb7aIDRsYtk3Zhx4eubw
	W3qp92VubkjCFqo/YYJEa6MuJOdhNUpz5YLFUfuRRosIiz6lqMRzOo4UYaafrab5Xmav1ODg5nX
	B4fPxsjYIwXAj8yS3ID0oXyyKWMXyBKQO/IpMmKnnjCxPI6mb0jx6lF0mxcXsFHWU/zro2jlSMK
	WK9L0qic4HXGDgiI67JuHqglPDwUtIBT4IPHdBQAHPsmGLgnp/Z8SeY=
X-Google-Smtp-Source: AGHT+IFFvdlRkBEFpuvRapz+0/bX2s0BjBYZ6M4itb1IiIpdMWapxxpC9ppUNuB95mK5m+Q7pE4GZw==
X-Received: by 2002:a5d:47c9:0:b0:385:fb56:5596 with SMTP id ffacd0b85a97d-38bf5663956mr20431872f8f.19.1737675942270;
        Thu, 23 Jan 2025 15:45:42 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1bad87sm971133f8f.74.2025.01.23.15.45.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 23 Jan 2025 15:45:40 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	qemu-s390x@nongnu.org,
	xen-devel@lists.xenproject.org,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 15/20] cpus: Fix style in cpu-target.c
Date: Fri, 24 Jan 2025 00:44:09 +0100
Message-ID: <20250123234415.59850-16-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250123234415.59850-1-philmd@linaro.org>
References: <20250123234415.59850-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 7WS5XuLqdmQt

Fix style on code we are going to modify.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 cpu-target.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/cpu-target.c b/cpu-target.c
index 6d8b7825746..a2999e7c3c0 100644
--- a/cpu-target.c
+++ b/cpu-target.c
@@ -47,12 +47,15 @@ static int cpu_common_post_load(void *opaque, int version_id)
 {
     CPUState *cpu = opaque;
 
-    /* 0x01 was CPU_INTERRUPT_EXIT. This line can be removed when the
-       version_id is increased. */
+    /*
+     * 0x01 was CPU_INTERRUPT_EXIT. This line can be removed when the
+     * version_id is increased.
+     */
     cpu->interrupt_request &= ~0x01;
     tlb_flush(cpu);
 
-    /* loadvm has just updated the content of RAM, bypassing the
+    /*
+     * loadvm has just updated the content of RAM, bypassing the
      * usual mechanisms that ensure we flush TBs for writes to
      * memory we've translated code from. So we must flush all TBs,
      * which will now be stale.
-- 
2.47.1
