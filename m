Received: by 2002:a05:7301:19ab:b0:175:694b:cb76 with SMTP id mc43csp2509893dyb;
        Mon, 23 Jun 2025 05:20:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXGO9feFOk9N2EgSYSeoADs+38BRtHpUVAKWbEBYrx0a1YlTaMDEPZMV0eEMdEFedau4GX7Ez8xKrwvgg==@linaro.org
X-Received: by 2002:a05:6000:26cc:b0:3a5:24cc:6d5e with SMTP id ffacd0b85a97d-3a6d2786856mr8560069f8f.3.1750681205134;
        Mon, 23 Jun 2025 05:20:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750681205; cv=none;
        d=google.com; s=arc-20240605;
        b=hpa7DJYSmMr0V54T6VFKkrHEmSevbuYBXLpHpo002+H8fDlav0izh9A3LuY8fWefHd
         rOaknAGHiChqTCAu5kO7Axk5K84wZgMOKEsw9svU9A3vtHjQKCgs8LBNjNjVnllyJVB4
         2uB5BtuCNDg3+MRhUPM4f+D7eAoTrXMYJlcgFVxy637u5BFHfkzPKxIBlgnsJDauoe7o
         FVputqJGhIZln66s7xTbE3wO6gS2gRryX77V9Fzxime/nr4ge0Krw9H9bNilT2Gtt9GS
         yutrIwmwVABr7YGfUoGpBrPCEI7D8P5IH/KV8Wtn4IBCpv/XS49bMCt1Le+yFvpQrlCe
         Wp3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Y/J3/dM6yL9EpwD8nNu/ZbysHMLeoDjMiAJQk/DeNw0=;
        fh=012sVVhv4bJRe+ynZhqOMIhamq9ZsdD5dftzhlWq+Nk=;
        b=O8QdealO9Y3slJe6AI9cFC9Vxemp4vtuMR0C0Xo3C6IyYPC9sdX8KbArd8RpIfG+Io
         x7PT/VFNcJpPcAVS9ewgqO5TV2aU8vYVPEMsonZn7Mo5oDKnvfRORP5vyTcJLTd9hSaH
         eSeFmAwr9R3pwZZGxPY9H6zRfDf8aJg8V6bIN6YgguqO6LZjEThXWEh+uBOURUlsGQht
         2OFAR6GLfrwB+Xa9ocPw9ZiNApVeBUAXN3EEbOca2822Rf3Tx5N3hDHKTXX3aY/By/5/
         fNC1s9V9N16xfMvYmF7mvu9yAtQSG7yIdFqYev6R4nQzANbLXA6Swbd0OvbT05BaULg5
         5ZGA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="A6a/IDZt";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-453646dd7d2sor21108785e9.1.2025.06.23.05.20.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 23 Jun 2025 05:20:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="A6a/IDZt";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750681204; x=1751286004; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y/J3/dM6yL9EpwD8nNu/ZbysHMLeoDjMiAJQk/DeNw0=;
        b=A6a/IDZtppY/t/fyCqwINKGkR7fPuVIy4vMWx8CXCId4itX1IvFaZctyncm2n9963B
         ASX5wrCde0l7yNbP95ycRfvzCBT36E9+nXmRza0bc4VcTuu1Lf2n0Ip3beF30HoLyfOu
         5WRW+QPVhtw6r6sqifV1seU2AtR1vukMYkx6twH84asUp90VaP596H1a8SiGKChGjoXJ
         cyM2Q76M07A+mSSC2BLz1W7Z8LtyeCDsdYIJPLVe4ljq+BXmcp4mN6jT6bQAWq9v5e1T
         pa29vycpA2/bIRRElezBX/TGHms9r9tv2nD9Gmf52f+XIo83IY5tjBtBoKPPij290WiB
         BqCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750681204; x=1751286004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y/J3/dM6yL9EpwD8nNu/ZbysHMLeoDjMiAJQk/DeNw0=;
        b=pyaHMJJpJtYhCqRSWDZFx37MuHwkPBuO1bq1Av3McJIme2qxTvrudNTENAve/y7Vms
         +FfDMxarMqiDDwHSkmdhYUy4Ih8RY8jfDderd9wsBLyA5NabTWKdDigtWOBdURAOfuJX
         A2L4YZRb0PiQKGHfntsUAITGAIWjKlr7iviavjrSR7w8N/g7tuubiC8ThKL+NmZFFYs+
         4pJ5IhHI34WXHdaNPqcRBlQaphPd9/Lt8ZNbqopnUJ2bTSLn8PjXSRBU9UNFwVCYaEa/
         jLwSGEMQePanNTYkZ1OM3P9EKnhlqX2+wsV/86uqm7WhkdE/IQyF+H5QwJDJV6qTKk0U
         im4g==
X-Forwarded-Encrypted: i=1; AJvYcCU5wQe8CGj7Ge6m1y64MYu1Sl5UaC2I4L/A+gtNmcf7Bd9vO21lJQmA49hP87IIrZxGjNSJV8UKrxWAmw==@linaro.org
X-Gm-Message-State: AOJu0YzQ6QMNFR/EGdmXTCKzmM+mvPBSiSfArGqD7ioI5wr6mF2+C1oI
	OybBo73z0X8vHg02qJ9Hh8Afyh+KbG2yyd04YCwKlnSZ4Ep6vcN3tlYC1N5U+he+wNScNw==
X-Gm-Gg: ASbGncusSNoTWlUR9x1Ng9yCaaWer7vYDJ2SL6Hj6n//M7EH1naq8KoLkESNEVOzab2
	o3MN+6j4iALdpiG8rb+Fm6bXtqZH3C3nDbsGGj24eg0uspjHnimiEHr0tP1I5iCpaXn2UGb+To7
	e1CQaE6F4px//6adUVCZ51JjLXgkJghauJF7MHvSXr63hfxf+ceDFcu1K0fTXLFxXoeHViy2q09
	q0xLXwimO5WjEDNEQKDpMvCtv9ei8AuKUXdhWdDLcs/NiNycDl3Xet42dT7m1feHX2DbqEOgYGq
	xQ3hnR5ACdnehPKH/V2qrJsMGScWLXUniIzzEDlmVEDZMUn3MAYoA76SMkkBdWVXKWC2EH7SsIJ
	GF7qmn2tJRXNTAQILp78I7ANKv2mGtNskRujz
X-Google-Smtp-Source: AGHT+IEDBLzyvotQDHdgeUadRfrLThtjSEX8cwJuz2mnLVjDK+hMLUAuzhTdSt0x3jQyPiQhQl7KNg==
X-Received: by 2002:a05:600c:1d27:b0:453:10c1:cb21 with SMTP id 5b1f17b1804b1-45365e3dffamr107598715e9.8.1750681204506;
        Mon, 23 Jun 2025 05:20:04 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646cb5a8sm111194065e9.7.2025.06.23.05.20.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Jun 2025 05:20:04 -0700 (PDT)
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
Subject: [PATCH v3 15/26] accel: Introduce AccelOpsClass::cpu_target_realize() hook
Date: Mon, 23 Jun 2025 14:18:34 +0200
Message-ID: <20250623121845.7214-16-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623121845.7214-1-philmd@linaro.org>
References: <20250623121845.7214-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 8sX9l7doy7FO

Allow accelerators to set vCPU properties before its realization.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
