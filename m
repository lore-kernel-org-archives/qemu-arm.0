Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp878310njc;
        Fri, 20 Jun 2025 06:08:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXWwgQcAH+ZR1TlHVCIPk84yxG4v6nF9nQIsIzBUkc5a3qj+g7iVDiVcfJEjitDqzQx6IKPKGDq8Qzzow==@linaro.org
X-Received: by 2002:a05:6000:718:b0:3a4:eed9:755d with SMTP id ffacd0b85a97d-3a6d12c2a8emr2563279f8f.3.1750424917025;
        Fri, 20 Jun 2025 06:08:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750424917; cv=none;
        d=google.com; s=arc-20240605;
        b=a5JYuuwb47nKJBfgepqdUxs5NVgxcf+jAbvYDRCpZ/QomqOuRQxA4WRvJcBMm89gYm
         TkZViHcvF7cMo1ru+mvov1/WUHJTkRoJ4TNGqBpfx29FQtDY0aAVGEsKdnSI3cqnaE5C
         YKDj+hF+4KpKB/4uY5xFc2g0LM9uD2fPJdyBofz7bUxuVMyTZjtmYXfDqjrR2G+PLgDP
         5Vmd/s/0QE6rYGLLRExLJA/z+0iTzMV51PDJ5lqnD09RzNNseEYI82Ghxjq4jusEgYgO
         Wi7tzZHgn9YKU44MXpzCx1LIRxmOdLZdeXlBI2Safzp/YEk5/rWKP2J7SKfhOTBjQ2Z6
         J58Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Fteu42QoSrS1hfDvjcW70gOANYEhePCaBpCVcvmvL2M=;
        fh=Hng5JGUAdfbzigdja2g81lfFPXSBiFJjT8DoOgVK1bo=;
        b=CS8CndY3hS1izn0li1zR2hJ0Xjj+9ShgOeBEQ++zZ4ErI4rzs7z3k/244tstJVZs2C
         kByacBWM/7ZIs9JEhQlhYtW1OEhk6id/DboDu1chsAYpCCWrAgn0TOPUkwLKpyzxQVyL
         /EASrMZQ05WRIq6W/PsaoGfMTlmk6ZGxPmWG5Ntwa2sSrmCs90bidi3rui4XWFFOSRNA
         NnhTdf11Hd6IyvUbD0HsritMLUN2xzLuZ3j/I6CUQYeaiQb+tW7EN8i2/pbtPhgmM4Nw
         QD4CXszGHNjN4X8WddnXfTar4DZ3Je+bvYJfUpLS46Z6EWRrutOFenD2YY4Tn81Chju2
         FgAg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k1P7EwMf;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-45364669a2bsor6832325e9.0.2025.06.20.06.08.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 20 Jun 2025 06:08:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k1P7EwMf;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750424916; x=1751029716; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fteu42QoSrS1hfDvjcW70gOANYEhePCaBpCVcvmvL2M=;
        b=k1P7EwMfVFf/2lvP20ixbctrBB2/bmNAFZ8q/RATbE+Sw54BUwjNjb+bRcrVk8ga32
         FEGf/V7SiLh4sOzJcEIPjL2+K1ukJoAWL3lfGbTjVbTeiUx4UMmuXWLXmk4yzK6tCO8Z
         5alJJ+nx3GatZezuCLXi5kuMjth5rPEHPq06eBiL9cNGNpmbvWF//T1Gt9f2/uJ6p9X8
         Wgfm/lwkBEaLDvfp07EWXQ51EtIVeC4PxJjV5vuBndH6+c0sUTVk6ngGjDh+bhFeUE7L
         zv9MOiVXwN+usHQNlKvUOS+igD+CcgKiDteTCe2CpkhU/k0B25o1zXUHihQy9ZCVxnfU
         kKbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750424916; x=1751029716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fteu42QoSrS1hfDvjcW70gOANYEhePCaBpCVcvmvL2M=;
        b=fDqC3zkvKprEzbZoWOPz/oBmgbAQV3WSZYDhGgrpM/0YFyy0r9xN3pEeXnVNbOVfwL
         FmHDD6WhtngGChCGgZaS6s546PgEFHeDW02v+iIs2NV+rdbyNg+ymXGLABLZ6lRxrtR8
         xlswbWx4Sd+cc4ZhpGnNLtUecjEq+i20sbGMj2EHSOlMRnWeoCRux+YFiqjIqHvHrVTg
         Wz3CgUnPMcY9SS7l/PQ+4bihx7qY+O4fg9TSApuRHZPVzN0LIhPDqkEqxR+1jyNviua8
         KNGA+Edji5qySFjClU3C/Y6vYuUpT3by9W7lhRW3D6LSSjaiAoP/SiJLTKlJcn1OGWHG
         1AdA==
X-Forwarded-Encrypted: i=1; AJvYcCXUVEMIwvnkVqQ2stxFk/CdmCEm/hP69RdcoSWaNcZwFKmyowfFbtzr/vnLfB9LVKcpjO/m/HRZd/2P/A==@linaro.org
X-Gm-Message-State: AOJu0YyCrRvF1UndZ4a6lnjn0rxqLpmaLJq/auKODVlOXAfHu+WIBc17
	gUYOBzn6SsocjZvO9/OgenllAvZJ8E/n+gZAS7ujLimIaWa8mPsYXl1e8ae4zvPLOnPn3A==
X-Gm-Gg: ASbGnctg2o938oUVn5dAIsW6IjgHyp1OBvHOi5PswwF/FwVJicYBHNc/Mnxq+9BBJ+l
	ApA+9gDBifki/zQ5mXgdzdBQmeRJ1SMtqUbkixFconKu22uwsMyPtsSJEF2Ytfhni5TwDRpNhjh
	kVYiseTXUX1UKFRxSfclY4ItBjGu8WDGhrKcD33+10nZTsSu5RKfvX6yV38o2e/rdrxTQtgnTKD
	U4VuBhsIXnXH+ExMRjZl/CmdS+4zFHtXfp62zCaVJ16YXzC66DDMRZ3lZ+UHI3/FNJJneRsg7DB
	Dqt0KksbBjkqFdd+ReKvJ8oZR14Lo3aQPmKkEn6itMkztmN6f+hg9a+dH14Fc4cRApRIxVZPZHJ
	LNMuNQi5ZlV+TpXFOGAr0vZ+s4ftSvDl3zHeB
X-Google-Smtp-Source: AGHT+IF+npPw/Fpnff5lnMY4tzVA5zu1lieKqW+klOIEesBk3BkWi62GERyChD7PyAo9RXNQgBmPoQ==
X-Received: by 2002:a05:600c:8b70:b0:445:1984:247d with SMTP id 5b1f17b1804b1-453653aa3afmr23498795e9.7.1750424916439;
        Fri, 20 Jun 2025 06:08:36 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d11909f4sm2016944f8f.88.2025.06.20.06.08.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Jun 2025 06:08:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Alexander Graf <agraf@csgraf.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Phil Dennis-Jordan <phil@philjordan.eu>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Bernhard Beschow <shentey@gmail.com>,
	Cleber Rosa <crosa@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Cameron Esfahani <dirty@apple.com>,
	kvm@vger.kernel.org,
	qemu-arm@nongnu.org,
	Eric Auger <eric.auger@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	John Snow <jsnow@redhat.com>
Subject: [PATCH v2 15/26] accel: Introduce AccelOpsClass::cpu_target_realize() hook
Date: Fri, 20 Jun 2025 15:06:58 +0200
Message-ID: <20250620130709.31073-16-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250620130709.31073-1-philmd@linaro.org>
References: <20250620130709.31073-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 9WZtLomLn7jy

Allow accelerators to set vCPU properties before its realization.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/system/accel-ops.h | 1 +
 accel/accel-common.c       | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/include/system/accel-ops.h b/include/system/accel-ops.h
index 44b37592d02..a863fe59388 100644
--- a/include/system/accel-ops.h
+++ b/include/system/accel-ops.h
@@ -35,6 +35,7 @@ struct AccelOpsClass {
     void (*ops_init)(AccelClass *ac);
 
     bool (*cpus_are_resettable)(void);
+    bool (*cpu_target_realize)(CPUState *cpu, Error **errp);
     void (*cpu_reset_hold)(CPUState *cpu);
 
     void (*create_vcpu_thread)(CPUState *cpu); /* MANDATORY NON-NULL */
diff --git a/accel/accel-common.c b/accel/accel-common.c
index 56d88940f92..55d21b63a48 100644
--- a/accel/accel-common.c
+++ b/accel/accel-common.c
@@ -105,6 +105,9 @@ bool accel_cpu_common_realize(CPUState *cpu, Error **errp)
     if (acc->cpu_common_realize && !acc->cpu_common_realize(cpu, errp)) {
         return false;
     }
+    if (acc->ops->cpu_target_realize && !acc->ops->cpu_target_realize(cpu, errp)) {
+        return false;
+    }
 
     return true;
 }
-- 
2.49.0
