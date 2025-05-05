Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2778417njj;
        Mon, 5 May 2025 16:20:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXCgxwHYx0kx4hGYFpDrYDS529fBaVU0dWSImz+kwJQ0k4VUBGTC8mG85gdt6ZBCwPA4/x3nO2WDYNy/Q==@linaro.org
X-Received: by 2002:a17:903:1246:b0:224:e33:889b with SMTP id d9443c01a7336-22e1ea3ced2mr148680085ad.12.1746487255448;
        Mon, 05 May 2025 16:20:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746487255; cv=none;
        d=google.com; s=arc-20240605;
        b=OGd7h/stXIbzk2JfJOC7iM1ovVF7X1h6y17t6dJz86eqFUotvYg0W+1wAnmAWfFSj8
         l2Wl1a4Y4nFZh+UZHpy8KxmaE6+IzQXPteztwJbhCCj/LF0+fosMRoa0m1cxFlOGH+Ik
         zN7q74Yz4XDfeaFhfQW5GisLQ2lAgmKUsaHV9/D4UPRBfnGRgnHwryJb5r8SihYQi2ia
         QKxAfQweAwYnpxS9Z1gY8fhcBLVD8DvBZL8lCJcowOvIuq2NfLOn42Y8UdDVuJ3ELatb
         I1ru5Pcx8A7ZjA/sTHbkCO1DK6UdiP88NxLVnrTio1Z6HTEuYOjAprvnc3xOLLyAvugB
         r7OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=fjvN9GkUlSXmzEXtUb9+tptKE6zBbBhkZRx0p6n3iY0=;
        fh=VOEb9P+A6n+Ap4uzT5HHWSX4mp6u4iHIVGp1Cpq+MOA=;
        b=i9xNMwDq9ygdbkuMLmDS7UWya848/7dNKRfFKBeYxscdvo/9MRdDYxqUtb42zWfKKB
         P60hivHNzo2pMj7kZnrI8vs23s1O1D+A8XtONP7ggRPD/OvOsPBfeSv+eaynwc7Js85A
         jQQq0FivVZOBw37bEKAhybmR4Qk5nLmrBzps1FGNVdV/yYcHdVExnwOlmm20HCHBBcj8
         yYAQk9dCjI+mb0GR5bAoTbGo/XnhmZd23oyQi/cOmXnqUnS5AaYQOAhQShEtyKejz67N
         R4aEPgZLYLgyoWjkN2RWduAl9DCdvDr1QuJOo3g1RtDhDT3Qtuyvq2euquFJqU/e4Mn8
         Thvw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Zz7gHVvS;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bc86c50sor57296275ad.13.2025.05.05.16.20.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 May 2025 16:20:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Zz7gHVvS;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746487255; x=1747092055; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fjvN9GkUlSXmzEXtUb9+tptKE6zBbBhkZRx0p6n3iY0=;
        b=Zz7gHVvSkWSEOYZwVDBTEAQICO8obPfcAF4ueUg/2McytwKD+zVectzN56Cjv++Rm1
         M/VWk5293huCZ/k5VfeZ6AR2pDCuACQcN7G48tg32oIiJq3iQwTUhjke4f+TymPJmsiB
         HKjh/lB3SSlUG3WDC53HBPqzzGhCtPDM1xujS7hweDx32NWjoMovHkIjmwlMSifRXLiY
         dI0VBERPlh+go8IJeNdE3kbqoyw76Nkd1o07QMLxR1E5yVXrUmmAiyDqTZ+bIY3eybkP
         edOYsxRcJNpEqnXwxLSFKaLwsSnsUCHQeMnx2OvQzdMJVwNz6CNGHPfR5XnFStnA3mBC
         47Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746487255; x=1747092055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fjvN9GkUlSXmzEXtUb9+tptKE6zBbBhkZRx0p6n3iY0=;
        b=apncuUJs+rZw8G8ZdiFOKUbCXlyIQRn8kOxw3fehJA/z+rh7RB3YegU439rLS/61+o
         bNDotPjkWcMKchjdqunW7I8hM6PUZgMNKOXYmro4OR3nh7MdKN72JJ+PIWlxC2rXGvm9
         tEeSJGPcHaSSJArAaGOzas8V/XxdT/KaektLAWWdkWEeOGG+R5hjOgyfw8IZub35qI9K
         Tp2QcShxS7MerIpV48o03oMJhHS1p05tastDli7gmF2qdoc4BpXHq8OpDUXB5yhLY+sE
         43dPlifvrAdKKey6rIVsSP2g09BptG1LzKKJzbw47z8LHZ3gmz+JpllHQdJl5u9XB3vJ
         T5Xg==
X-Forwarded-Encrypted: i=1; AJvYcCWPdFhXKsAU3c34pcuHrhO2a1uCP/Zzt0FqmQU3BkpY/jkDd2IH5/E75RL5w/QUjkJqCDr/e6WJ+R8j0g==@linaro.org
X-Gm-Message-State: AOJu0YwGsjCVMc8eKihcXeoj9W5CIMEfzPKZrVFA9UWZMFLRyjn+V81Q
	MU46xhlT0ZJwhjYcOgmCfTehOzItuQ+s9FU6GBCJMj0pwSQusU/QHugKOhVmvmpDhA==
X-Gm-Gg: ASbGncsOa7hUh1/9+w63zyPt9GpbWQqhF/S5+6IR+U06JO0Vtiw0e4fzMolrRxLsmTH
	tX4DUSNK4rzxfdhtv/TVMNNmKAudHS0QEtfdCkXquheUHm6nPOtSUytyy4UbgNkghpur3Jd2+dV
	mne2RMjjxqrGxS61mg6Bb6G5glxttbnG025lMWfeUXOBUyU8XxoLt4cyHnB2u1jJq2CBwhl8hmT
	yJqVrIMGwgyRcc7uwD7vLE6QvWBWAZ31/2UEfmmDZq64qkhotTm0LyavZ8suC0L+0wFS4hxfLam
	lbKTJDdURsb2xSL/tTOSVJnxMhmToi/JkWffCLSU
X-Google-Smtp-Source: AGHT+IEzyM9z7CVe4AtEhGj/jyZA+D2xzzxXGDSUKPWZMwhpDevNTLCDhN002Fitb043HbVefJtNKA==
X-Received: by 2002:a17:903:18e:b0:224:6ee:ad with SMTP id d9443c01a7336-22e1eb0c7fdmr138057955ad.44.1746487255044;
        Mon, 05 May 2025 16:20:55 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1522917asm60981715ad.201.2025.05.05.16.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 16:20:54 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	anjo@rev.ng,
	Peter Maydell <peter.maydell@linaro.org>,
	alex.bennee@linaro.org,
	kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 39/50] target/arm/kvm-stub: add missing stubs
Date: Mon,  5 May 2025 16:20:04 -0700
Message-ID: <20250505232015.130990-40-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
References: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: KB9GvHow1vBw

Those become needed once kvm_enabled can't be known at compile time.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/kvm-stub.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/arm/kvm-stub.c b/target/arm/kvm-stub.c
index 4806365cdc5..34e57fab011 100644
--- a/target/arm/kvm-stub.c
+++ b/target/arm/kvm-stub.c
@@ -109,3 +109,13 @@ void arm_cpu_kvm_set_irq(void *arm_cpu, int irq, int level)
 {
     g_assert_not_reached();
 }
+
+void kvm_arm_cpu_pre_save(ARMCPU *cpu)
+{
+    g_assert_not_reached();
+}
+
+bool kvm_arm_cpu_post_load(ARMCPU *cpu)
+{
+    g_assert_not_reached();
+}
-- 
2.47.2
