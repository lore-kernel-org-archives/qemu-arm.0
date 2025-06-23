Received: by 2002:a05:7301:19ab:b0:175:694b:cb76 with SMTP id mc43csp2509938dyb;
        Mon, 23 Jun 2025 05:20:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV1cYUJjoVh2V/nQoqklcoxjdeIENmV3ZpHx9mMYYoZrFPAU/zeReg9ED+Z8XWUzNB8SfIpuZjMgHi8rg==@linaro.org
X-Received: by 2002:a05:6000:2010:b0:3a3:598f:5a97 with SMTP id ffacd0b85a97d-3a6d2799df4mr9042409f8f.9.1750681210314;
        Mon, 23 Jun 2025 05:20:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750681210; cv=none;
        d=google.com; s=arc-20240605;
        b=lpkglMQOQh5kCuGxnAoEQnpXjbusrvK2yNb8q1RV8450ik2G9gkLj1eac/JJSWiHL+
         tFvoJPbBUmsLr/8gHYXvEzUlT4RdOWA2zsJlvRSp5EWc0v7McNy3EuQQYBb2/gsJwAOO
         m9ePlie9RUj8epyzGI8jtkQhLG8xqTDuuC2IdZ7ruIeblnifNcTEzIeQfsoHoAYrPIM0
         Uq1BToz5hUhPd+r/oFx3HaTM0NupZ+m7+D6SSfUZGTAisQCyThbTkS5y4My1tPp8unRf
         sxtFR+cmCiy7X891uNl14ef/XFAwPnj2O7LNjFzI/tKrAs7gF0V7Cb/yBZv+4wHQIkkq
         fG8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=+zn98SRXtaFwoihOhnAeEFS9N5zUhWDF7TNyGo/TLss=;
        fh=mZKJxxWFxhhx4QLReorS9dlZGq/3oMrV2DP3oDeP7xU=;
        b=AHcMgwy20qEbAzWp1IrjwsqYxVq9qlisqnpNoKGMYZ+2XuOW3ebmrhncb8Wl36ZEOi
         LrjTUgSomAris2RZ2zAdZ+llZVUeWrYC69PXPqOsWCp9N4R7Ydl0mUKKkYvWA9l1a4D0
         GtTU4OsUJ1QbX7zv7pN0zwpUg/Jj4+3ZO4CG2T5qB3jPX6Kf8aB+rz/CG89LJfQ3QU/M
         sYnxEujgcOLqbg9Eb9PSzIcoMH/5tmDcL3tEZ6qmpyOiAhpsB0cBa3ufs+oqLJV7WdRU
         JfO8nG+JVUevW6Bopmgy7mM1BHsyx2NnygIre0M5WlwENFK3SIBkjpsdihLBGMGxSUsW
         v3xw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NsZD7K+j;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-45364720d86sor15026905e9.6.2025.06.23.05.20.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 23 Jun 2025 05:20:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NsZD7K+j;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750681210; x=1751286010; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+zn98SRXtaFwoihOhnAeEFS9N5zUhWDF7TNyGo/TLss=;
        b=NsZD7K+jaQ6WMtc9/bZU9jpwlx3V/4eYywC+75ueYoNJgA24bapAlgfU9tG8II6Vrz
         Zjg8DXDk+em9ka/YEoTEW07uXriZxsiExrpg3a1nX/iCtm15RtSLgedt3ilMU+AjTx6A
         7tPdCxcO4nFlZ0ZOEkaWzulNcF/nGIqd994wasmc1G1ecc2NEHqiZSrNMtjHbJ9al4Ue
         4CX8xAZ4bYBqtx1X2/cxHpwyWeufcZNa7jRp/kpMzTlpCxSwcjSCxls1Oa4Hz6DEz0XR
         VumdCzrWwaHw6k3vgyRvknwFsv50UsNUk5/DCw4NkLUc/Sx5/zkcHxUHKZdwZwEjijhz
         /lrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750681210; x=1751286010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+zn98SRXtaFwoihOhnAeEFS9N5zUhWDF7TNyGo/TLss=;
        b=VyPcVp2FxRN04u2HTlM+Z0IpzJHjZmgoaj0UlNxEYHNsPw+hVm8ea4QdGLenYnR4VI
         /BV5HPwJHvDc8xddDtEorHaqLIBcNb7zDhf1p+frqPxGj5kJmbvzlMfzUzeGWvxNh951
         z4IwBjReuiI1nuixdaX+Cr8bBwKu77+BrAVgtTqiFSGhHQgl0g9SVEtVoNayKyJiwBAR
         KnYq2beOyklbmjsg7A/kEZaaKuzX1Rl1f1QLzNyS1O1XD37VN9A0E6pMnJaiIHkUeeTE
         IDfw3DHXynIiJc+pHdBDHMYxZPBTv+gFj/Ezdoi3nzzMlyEX1LXIme/65Aqp7EV5eAvE
         GWXA==
X-Forwarded-Encrypted: i=1; AJvYcCV/VwfBrZVd3KouT5/NC2cXcjgvGOC0BWdpZDr+YUMnkvSEeX5GSq68zit1CcMMQnHmgLbr61Czk3OjHQ==@linaro.org
X-Gm-Message-State: AOJu0Yyw510KGOxuzMrvVuw6pivuiXPCFOHzDklu+1iLBMScXR8UkBKp
	PDMGPTkBy69hip2YfL+8pf2tvTK/j4do16VcTZj5xjaBc0ElGzuQyU6xs1MUlsz4mm79RQ==
X-Gm-Gg: ASbGncsd/gcWb1PEvpXPPPSAu6IwpczqeOJHzkICtpvzGVMow4mYLQNbZ4ZmBIJ07hT
	aoFKdSzc8gLDF62+5ZjSK2sokVVyugIGHJMYLmbG8jtv+SH1t4jLl7LslSxVjxQtdcoaWlcaoEb
	6cC/j2Yc9GLNmb9E8VyuIt8VfDE+NdGcx5Jd/rFND8tI9Z7kBQe/KWge6jtFQEUt6BK5LjQ1bvb
	K0k2rwBBVb34eoasXy4zhUVODLFWtXCCJquaWAbpb63b5U/klh/7WL3B5zhHGit2rxhJWoKQG6o
	RtZxxu5DlyXEirxXnplSzBICMQhc8sTP2HL5Mvb8HG4kh0BnCQdneXa+ybtOmeA5ceRTK9uKXoA
	hwjguFB1qSel4luhmAIe1YLsPEngCqgEMhteE
X-Google-Smtp-Source: AGHT+IFhxvf0pVdM4spy0FqKxphN+wj0nPLNYA/H7sLORxDSPVaYXm5uBRM12Jr6vzicVX+Kk0gVwg==
X-Received: by 2002:a05:600c:3b19:b0:442:d9fb:d9a5 with SMTP id 5b1f17b1804b1-45365e5e41dmr102028495e9.9.1750681209616;
        Mon, 23 Jun 2025 05:20:09 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f1d168sm9202901f8f.40.2025.06.23.05.20.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Jun 2025 05:20:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alexander Graf <agraf@csgraf.de>,
	Bernhard Beschow <shentey@gmail.com>,
	John Snow <jsnow@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	kvm@vger.kernel.org,
	Eric Auger <eric.auger@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Cameron Esfahani <dirty@apple.com>,
	Cleber Rosa <crosa@redhat.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Phil Dennis-Jordan <phil@philjordan.eu>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 16/26] accel/hvf: Add hvf_arch_cpu_realize() stubs
Date: Mon, 23 Jun 2025 14:18:35 +0200
Message-ID: <20250623121845.7214-17-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623121845.7214-1-philmd@linaro.org>
References: <20250623121845.7214-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: jGjHik2q19g0

Implement HVF AccelOpsClass::cpu_target_realize() hook as
empty stubs. Target implementations will come separately.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/system/hvf.h      | 3 +++
 accel/hvf/hvf-accel-ops.c | 2 ++
 target/arm/hvf/hvf.c      | 5 +++++
 target/i386/hvf/hvf.c     | 5 +++++
 4 files changed, 15 insertions(+)

diff --git a/include/system/hvf.h b/include/system/hvf.h
index a9a502f0c8f..8c4409a13f1 100644
--- a/include/system/hvf.h
+++ b/include/system/hvf.h
@@ -72,6 +72,9 @@ void hvf_arch_update_guest_debug(CPUState *cpu);
  * Return whether the guest supports debugging.
  */
 bool hvf_arch_supports_guest_debug(void);
+
+bool hvf_arch_cpu_realize(CPUState *cpu, Error **errp);
+
 #endif /* COMPILING_PER_TARGET */
 
 #endif
diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index b38977207d2..b9511103a75 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -588,6 +588,8 @@ static void hvf_accel_ops_class_init(ObjectClass *oc, const void *data)
 {
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
 
+    ops->cpu_target_realize = hvf_arch_cpu_realize;
+
     ops->create_vcpu_thread = hvf_start_vcpu_thread;
     ops->kick_vcpu_thread = hvf_kick_vcpu_thread;
 
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index b932134a833..fd493f45af1 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1082,6 +1082,11 @@ int hvf_arch_init_vcpu(CPUState *cpu)
     return 0;
 }
 
+bool hvf_arch_cpu_realize(CPUState *cs, Error **errp)
+{
+    return true;
+}
+
 void hvf_kick_vcpu_thread(CPUState *cpu)
 {
     cpus_kick_thread(cpu);
diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index 99e37a33e50..28484496710 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -367,6 +367,11 @@ int hvf_arch_init_vcpu(CPUState *cpu)
     return 0;
 }
 
+bool hvf_arch_cpu_realize(CPUState *cs, Error **errp)
+{
+    return true;
+}
+
 static void hvf_store_events(CPUState *cpu, uint32_t ins_len, uint64_t idtvec_info)
 {
     X86CPU *x86_cpu = X86_CPU(cpu);
-- 
2.49.0
