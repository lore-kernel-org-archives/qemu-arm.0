Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp485045njk;
        Thu, 23 Jan 2025 15:44:39 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVsSMVsdXBfd466HHSYltUA0jFSCqEi3ibJdICrqKOQcOPlOAAnywN0W7pAag42tRy+jVvnx+45yhFb7w==@linaro.org
X-Received: by 2002:a7b:c406:0:b0:438:9280:61d5 with SMTP id 5b1f17b1804b1-438bd06111bmr9679535e9.5.1737675878993;
        Thu, 23 Jan 2025 15:44:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737675878; cv=none;
        d=google.com; s=arc-20240605;
        b=JfiE4nqHEpwjdShvNJzxdg60g4fXmiIspYPR9puA0wXlFfI1WxZJJLFskkme6QlR4C
         5jCwAaEHx31NLh4QSqxPjoTnwQXGwyOM80vzOJV0OQVw1Z+zXG2EDqkJ0c+Fz/mrjShm
         ZZ/0IXq2CkKZ5xpBccNnVrF1ZFOC1Ste0DVXbIkSqH4T8j2Ll0dmdjySBPf/S6zfi3Dn
         6LfDv7CIFlF3ZXx3BNpp9lB0RbYpFwMfUrFQCfX3/u2H04JrNwUZRB2VmjurzxQyT6Wp
         /fZCVblMb4QdPt1uGaESsw4kD/JZj5ozh5P+pyMVuOvahNb9p5Jdt7C8o+YRtGbbD3Cf
         bqRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=JSvw35u1c/GeD9pKIKqf6WHVcOBbPhJhoq/j5sOwl2I=;
        fh=/4CtynsT9DKU3spzO88OVPuG+YBtb4pPMqWj6/qJarA=;
        b=XcwVJ5ltZgipK2cP5d8oSKRm+GM9IVBvB6v748oto8gEJjK1I5oscm2yOc09nY4C8v
         km47Td93wE8ZvFh1Ch1uciwLvbVxc13ivfmYMurM8XL0GwDENdU7isPNXSzUh/DYrMJP
         tk6Ct9o5NJesK5SBXRywSXMoObg3Evlr7vNgGyEFyt0eFzkmnYEpO4YyFUVhibk/DIds
         zV7oLVGBlbQuYZaC7GLkQmHzzA1skNt6sWtFakOoHye4+iF0nNjLW1hIaVbOxWeU12h/
         TuRF6vVY81/kGfhLkorJ/jAj7JOhnQm3V12wajao6BbF10PdIACDickUNRY8koflJVFu
         mUJg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tgcxjZPF;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-438bd4c84f0sor1511165e9.1.2025.01.23.15.44.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 23 Jan 2025 15:44:38 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tgcxjZPF;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737675878; x=1738280678; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JSvw35u1c/GeD9pKIKqf6WHVcOBbPhJhoq/j5sOwl2I=;
        b=tgcxjZPFDp7nVJkD9CXKJIw0mSvUZlSg6pUYI2UitNZENXk1v0rV1yxUQBps/U+CVt
         6nMQS0ppPwmrIEwe9CzOu8fRAQv7XyBBxj7H3+cPuHMMQQakHT9mdBMBrGmehpmmzxUI
         FIdTRj4EIiGwovEQqsB0yoJU+8xroQZodnRMNX0JpxIij7PiB+05Ds2IHAr97IjOjoBs
         CO6QMvHb5wrH+SgvKxeyb9CNdRBoRaxBxhVyHQB94aesFtdEwrbbmUhKA6oZzt7hj1bO
         wpOl+cS4VmJ3QcHFWv5BtDVM1zw00i6MJntfVyGtaHXJWhTUdtG478PSA6A4tShDuCFi
         ZBTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737675878; x=1738280678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JSvw35u1c/GeD9pKIKqf6WHVcOBbPhJhoq/j5sOwl2I=;
        b=lKYIzveYruK5VBE6NmB2/Qlh9En9RzM7cfdZEdBW1Y0TeuyKpfcv5E9l1UBvwDZcEC
         jYcMKIse7I+oZh55iGJErqk5Tv4M2lh+ifgMP2X3lgnEawPndNLl6heRQwq9449qnCMM
         3O1PUJtp+Zo+4oeEzHVUW4wqbfV0gJH+jAQ6OfFZaG18cmVHfQ9Q3zqqK6T5XFRco7g0
         k3+/od/7QvtZc9VXMFNexyKDl8gycHfsZlMLLZzgLW2Q7K0tyscb8f9oKwp8M9tVInzh
         FGquBag/HcMAKTzJQnRFh6TU3TNseWEmUqzSpgRvv/JhhAnBeeVIDqU24S1RNlYApkHz
         yv0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVi/u4gUBaz8yb1mjm46YVa0pH2TrXiyQ7Y9IigewnQbp8N63LYrV9VuuE6dgvem9/taQltxumA2PiePw==@linaro.org
X-Gm-Message-State: AOJu0YxzE7+Q7ofl9G/ScSRyF9yB0OpPGHWZLEj7mIf5VprsgagSjpmh
	3tKcOBe6V2Wf5vvWORxbM0xJvDLtXW0sNCkE0uqEKCyb7DF2/x4QxI8z0ZuH0TewRw==
X-Gm-Gg: ASbGncsgrQe7OM4cJ8cJqVNWzBDdu8MtPB465B5mgV/wvH7nk6DinPC8RKyO9BE7iO3
	FL1Uej5gm+FlaONCoNrfP5DdPcTgxkKB0VjZe/4f2PKpKxUadap2uuOjhxPDiYSiKUusx5AhX/x
	7u1pCVWzPYAveyjwaFOncuYx+BEJ3vMLuatHBloBh/TwFhuZPGksOIp24rHUzhiHz2H2Sk85dRS
	D7oaQLltTSzW+VPEDHnH/+7dE9zqjfpuNtvugqFE9J2Lh8WNYTAWwDwPmPpNqvQUmdDBEJSzr8D
	KwShA62Q/6l5zMxlyDw9SRifpnpI7F88GA9ynfAEYHuhPfB3Sp3E70P68+lOOWWVHQ==
X-Google-Smtp-Source: AGHT+IGo8PNbuw90Bq4/JTfJj+icg7kmRyyI+cmqGdvUrpM4r/a237PZVlDOFDC6zvKvXQiH9M0QlA==
X-Received: by 2002:a05:600c:3d05:b0:434:9e17:190c with SMTP id 5b1f17b1804b1-438b87f953fmr44596875e9.0.1737675878313;
        Thu, 23 Jan 2025 15:44:38 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd4857c3sm7081075e9.10.2025.01.23.15.44.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 23 Jan 2025 15:44:37 -0800 (PST)
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
Subject: [PATCH 04/20] cpus: Cache CPUClass early in instance_init() handler
Date: Fri, 24 Jan 2025 00:43:58 +0100
Message-ID: <20250123234415.59850-5-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250123234415.59850-1-philmd@linaro.org>
References: <20250123234415.59850-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: X/ZIbaDMMwFb

Cache CPUClass as early as possible, when the instance
is initialized.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
