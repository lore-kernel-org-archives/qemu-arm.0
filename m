Received: by 2002:a05:7301:19ab:b0:175:694b:cb76 with SMTP id mc43csp2509665dyb;
        Mon, 23 Jun 2025 05:19:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW/XRPUpo5vT5Cm8q2OHdu+8rKIAP5NqA4ibu9cur1gGej3i+3CXapJ8ORHo/GZHXx1jogPOFi+V14Gtw==@linaro.org
X-Received: by 2002:a05:6000:230e:b0:3a4:e4ee:4c7b with SMTP id ffacd0b85a97d-3a6d12c249dmr9259462f8f.15.1750681184602;
        Mon, 23 Jun 2025 05:19:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750681184; cv=none;
        d=google.com; s=arc-20240605;
        b=kRa8invOJZTZzKo4LYLHon5VEGKfZwxQjbHw4Cw/ZorbMd0EgcFmc0Zmu/k5D47F1H
         F7gqW8VQFqWKFzxaLdZwp+ggs6zpWB57gjTIG1Z/SyfJRKw4DUohEevo0NBFjXdFZwhS
         ENJareIrN1hFjcUwIOQ6O3t3zl7QLAc+wTZaRFyYcPcTnwEU1FnOcbX5EprCBe9712mr
         k0M9zkNO067C8Ppi2Hhxi0fyU4A52L448OvCpXz9ju9Vff4GnIHbysv3xEfN0g7AM101
         Y+LEqXBZenHTAtUB5bwU0pjBa5UJuomddtlD9QYGKLsojmt6HSnWiEjZpWbHtiiZLf86
         KTxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=YG0rGkpeQcTfIwjCevzyaz+W/QtJY+1YJlHHFNrDtaE=;
        fh=lMCayvQQx6YxzbmSKnsPEVcnHnNf8oqhQa7YB8gWZ+0=;
        b=J5uzdlwQGVvAeCEFP3D9PRkFGbxDEtqb4iKcFR6fejwaWVlEjDr8cA4W5rrLc1HOnh
         IvmMlNTgkZViQkGi9OwglDKMk/0IsYmj03jW3m0kKe+Ng6dzD7WE7RdOoRpJ3yBpVBsr
         S3vFbzv8O9gRfrebPPmFuWIsiTJom0h3OWrquuq16VbnCKCN7yx6sBfPdJrvmANI3tbH
         f+CMwohoRGDzWV0A05gFdZfvFzEg1Nq+iMVBF4mIqutkSAlBioVJQd0gnEcjD3E6+4Ub
         QBxgNiZDTBbwVw9HIgCivNtWYR1W7KgaWpKdfxBbmEhFbqXHab2SOgTBmGwqfoBUdL0+
         V5Lw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U1goOTMq;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3a6d0f0f9a2sor2214131f8f.1.2025.06.23.05.19.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 23 Jun 2025 05:19:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U1goOTMq;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750681184; x=1751285984; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YG0rGkpeQcTfIwjCevzyaz+W/QtJY+1YJlHHFNrDtaE=;
        b=U1goOTMq7eLA6lqKkfnQ5Qq5qk48ODHDgxlgEVqFCPHwUnq9tK4A6PbRduAtuBdjJ8
         yTRPQX2snhR1b4Aj3+yBQCHls0ezxWzTWWhQq26AdXJe+30f7Vu21tE+orZFNBeBIu78
         SGcJ//evlGpj9o5LvgxxFZX3y3ArJgiAuu/VGnc+xajLKOSDYjZiLTIsfudPvtg95UBF
         VkemrxdSVbpKpQfholfqys6waTEMJYq6Wtia4CItKQ1Mh2i5uh3a1Cy0c2CqryrCJBKS
         1GdAcie75eN8adQ/ttpV54a3tVdJM4SAM8GPbf8yxMTXWJZ9Lj/8Kk+x5bN6vpN03c+q
         g54w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750681184; x=1751285984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YG0rGkpeQcTfIwjCevzyaz+W/QtJY+1YJlHHFNrDtaE=;
        b=Ef1PxKJN2irIMbL4tPCvDPQDt+pIvA7s18eXZUMs2gYhuJDhfZ9HuMuLPRWlfG2Ssg
         az5MdZ1gP6ZdZW4Cg0iZTQL9eOhR9fI4BpNR0LSrMZWf1JLwN49nwM5o5gQMegeknVij
         7B+salFUK3BIgvoovrKKXmBANUPqhyG4ATN9T+MvCDG+sNAj/LwRDkOWVNxzaVWXOnG8
         jtyzdztLq5RQFs++1c2p85yQrXFX/xStGEl/93Ua+OWeyGLUl9jhso4fv2d2bMxT4/dm
         5mVz6QmZD82l9iRM7yrVUvGRSnbHeZ53I9n4i1yblP1vncz+p6jLXh/bokwcC6g4e3x6
         z8xg==
X-Forwarded-Encrypted: i=1; AJvYcCX4ZIJYyQwqKM8ciEgZbSj2T5QMfnG18UPuaR2BOdjHjE0u5vNX5kACeB5JlnIsj4Xk9oaUQLCa9dz9sA==@linaro.org
X-Gm-Message-State: AOJu0Ywhm0XuVd9Vl/BJ3L/aMoNhOMDESdNSQiMqwwtDL9uvrr1xauLW
	3tl62amfO3MJAp3H3i9Zr0GlgQXzX9BuP/nqjvF97D+0f4up0lnVr0XIcB8zDOhNzkKajg==
X-Gm-Gg: ASbGncsMcK0+k9O1kjOKMOaZBVTY7uDYlXtd1CFvJ/J1vdSQa1IWP50Rv3+iT4ILzVJ
	dDBqR6WeYRg3cse8wK8x5kkfA8vD+B/eNkzL7164OWtYa339C0et2tOHvW/lkDxvOqjTIkAm/x1
	IApZ9LkE42GKCGrOnhgY0b4hDZ448Bti6AP0haEC7+VxdL8otpfITOYOogvHRobGH7Geb49K+he
	fwhpNXh+jTBcqmKWbPoTN1hRtYRUCZZVuo/dOKW4m/b7OnGqHeJzylI8E+MIuYOMtf5MmqnB6kM
	eEdX/u2xMy5jbCI1IfKWs7zcQo/5GJzu78wC/gsUfJZBEG77zSUA/xyZGnw/CboXtgGD4LiNzm/
	ZKNlfljftMWdIZnaznH8wqTpo6+q+abhSbs+Y
X-Google-Smtp-Source: AGHT+IHTcK8NRdR7PNArgyYQkG0nUCVoom+k7oQ1rJFLDhrBWTeykxYJUpFWrxkFgsUFr33IXybNlg==
X-Received: by 2002:a5d:64ce:0:b0:3a4:f513:7f03 with SMTP id ffacd0b85a97d-3a6d1303b0fmr9477486f8f.44.1750681183940;
        Mon, 23 Jun 2025 05:19:43 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646d14f3sm108727095e9.13.2025.06.23.05.19.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Jun 2025 05:19:43 -0700 (PDT)
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
Subject: [PATCH v3 11/26] target/arm/hvf: Pass @target_el argument to hvf_raise_exception()
Date: Mon, 23 Jun 2025 14:18:30 +0200
Message-ID: <20250623121845.7214-12-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623121845.7214-1-philmd@linaro.org>
References: <20250623121845.7214-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 9fhRlEsxqz06

In preparation of raising exceptions at EL2, add the 'target_el'
argument to hvf_raise_exception().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/hvf/hvf.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 5169bf6e23c..b932134a833 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1089,13 +1089,13 @@ void hvf_kick_vcpu_thread(CPUState *cpu)
 }
 
 static void hvf_raise_exception(CPUState *cpu, uint32_t excp,
-                                uint32_t syndrome)
+                                uint32_t syndrome, int target_el)
 {
     ARMCPU *arm_cpu = ARM_CPU(cpu);
     CPUARMState *env = &arm_cpu->env;
 
     cpu->exception_index = excp;
-    env->exception.target_el = 1;
+    env->exception.target_el = target_el;
     env->exception.syndrome = syndrome;
 
     arm_cpu_do_interrupt(cpu);
@@ -1454,7 +1454,7 @@ static int hvf_sysreg_read(CPUState *cpu, uint32_t reg, uint64_t *val)
                                     SYSREG_CRN(reg),
                                     SYSREG_CRM(reg),
                                     SYSREG_OP2(reg));
-    hvf_raise_exception(cpu, EXCP_UDEF, syn_uncategorized());
+    hvf_raise_exception(cpu, EXCP_UDEF, syn_uncategorized(), 1);
     return 1;
 }
 
@@ -1760,7 +1760,7 @@ static int hvf_sysreg_write(CPUState *cpu, uint32_t reg, uint64_t val)
                                      SYSREG_CRN(reg),
                                      SYSREG_CRM(reg),
                                      SYSREG_OP2(reg));
-    hvf_raise_exception(cpu, EXCP_UDEF, syn_uncategorized());
+    hvf_raise_exception(cpu, EXCP_UDEF, syn_uncategorized(), 1);
     return 1;
 }
 
@@ -1963,7 +1963,7 @@ int hvf_vcpu_exec(CPUState *cpu)
         if (!hvf_find_sw_breakpoint(cpu, env->pc)) {
             /* Re-inject into the guest */
             ret = 0;
-            hvf_raise_exception(cpu, EXCP_BKPT, syn_aa64_bkpt(0));
+            hvf_raise_exception(cpu, EXCP_BKPT, syn_aa64_bkpt(0), 1);
         }
         break;
     }
@@ -2074,7 +2074,7 @@ int hvf_vcpu_exec(CPUState *cpu)
             }
         } else {
             trace_hvf_unknown_hvc(env->pc, env->xregs[0]);
-            hvf_raise_exception(cpu, EXCP_UDEF, syn_uncategorized());
+            hvf_raise_exception(cpu, EXCP_UDEF, syn_uncategorized(), 1);
         }
         break;
     case EC_AA64_SMC:
@@ -2089,7 +2089,7 @@ int hvf_vcpu_exec(CPUState *cpu)
             }
         } else {
             trace_hvf_unknown_smc(env->xregs[0]);
-            hvf_raise_exception(cpu, EXCP_UDEF, syn_uncategorized());
+            hvf_raise_exception(cpu, EXCP_UDEF, syn_uncategorized(), 1);
         }
         break;
     default:
-- 
2.49.0
