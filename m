Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp480292ejb;
        Wed, 5 Apr 2023 09:05:38 -0700 (PDT)
X-Received: by 2002:a5d:464e:0:b0:2d2:39d3:ce73 with SMTP id j14-20020a5d464e000000b002d239d3ce73mr4115142wrs.32.1680710738434;
        Wed, 05 Apr 2023 09:05:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680710738; cv=none;
        d=google.com; s=arc-20160816;
        b=JJmul4o+7WIOBK1TSZVExGJWZzxWOMnqrNhzIACzAJxcPVLc2U9Tn/JQf34a9Qo+Ij
         5G16guO2A+pVh8QWXizRHL1VUAa2ILtzqklEN7gaKRwbQSqDJe6JVfz3zbERpXhppx5U
         kTKLav3jQOGLNOIt2okpIjEbXk+wFQ3jpPe+zclvjBsVrSPPDVkrPcLUfYkBMmAeL1zB
         WYYrlzsBwi8LwmVeZHgtJ4tCCo2G1IdooyCoQD2cQkUa6F75n7xzkRs5ptwGf1WoBQ/S
         os9lN7tjr1BqEkEUsHYb+Ij2vUTYOCbZHFfzS/jYwPHfm4R0N5z7Bfjg4mO5rT/eQlne
         4psg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=qSZpkYKC0E9O8rqY27roK0ybv9W9NQfMeuFKqLZI7LU=;
        b=kAHP+Mml3yD+jcrbXK20fIXJ2wWUOP18mamvAaRBI1PLXb3SVwN1/kUoTgQxL97DfP
         t6+UlKqgfC4zUsZrDlnTgQJZZNE+wI/Lg786vAsCrEyZGYxp7dGKjn30UPlV2LjtqThs
         E6RYuA7n2steXyOCg/FoO1paAuZTOEgix2j18Dorku0MgmX7yu8Q8ch8ejmWEddH9KLL
         LlK6fpXKtPf0wXd4TEsCCmLUfSu2Y8fhWzM+CQUOseInIWuNtsDtwDnb+bBuMLX13eyF
         HlfvOPcg7suzKweZKGPZ0CTYRN11DWWaRSc+08LA5x0rJRWYm39ws0A9BOgn0RBi3G3W
         RIOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wqNCwi87;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id h15-20020a056000000f00b002c6eea2fc09sor5760143wrx.57.2023.04.05.09.05.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 05 Apr 2023 09:05:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wqNCwi87;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680710738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qSZpkYKC0E9O8rqY27roK0ybv9W9NQfMeuFKqLZI7LU=;
        b=wqNCwi876yROugf5tN+kiLbImBLgk+uYIjohRocygCiSXtq0GiLxJMZsXSek6pHpVR
         +vfvjXSlWK4qWKr94gcOADBrEVPqgm5CfvJ9deGOWUrdCVM9PHovYkwZHujef3O8MtOZ
         eXzc0P4Y5NXAVWdLu6uqolhV733Ybgg5UBVQpSLnRk/q1N+A6GEHjHvVwc3QqBqwAdiy
         BNPfLSrZgGarjn1j7MUV3SoT0FiNvFRNxXYmemHmO/109VPWZrGM4pBbcOVF8ud8YiU5
         ASlPsQUvC0UDNDeGKeDi0tm00GS1Eunn4AndcQhBbXGrCKw7wvhL9RVtanHs8lJbVSrB
         h7iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680710738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qSZpkYKC0E9O8rqY27roK0ybv9W9NQfMeuFKqLZI7LU=;
        b=GEr3LrX8/Qwmr0p3OzdNO9QrItx9XSqpCiUWJvVWvwt2A3BPftei0Z6luoDHqJILbQ
         Wmh7nvfGRjADXBbWSdQkpcgi1vOo5dLg1Ed96bp55h/arFq+txAH+3Kuw1R8g1sRw/C8
         UyJoOC7ukpHcQKdOPVtrdkyCFUX9GrmI714Cxq4AMGuwe11tsFvCXvPVmQzD6Gj06cxV
         TWMwEFxf59QaSIyxmcWpJ476dOurtHh0+Sh9JAqw4gtnWxgxoOQO7XVmNu3EY+spQe4C
         byvkWkN+kBDko6M6CI1M/Cb2MnbwAunyVrFlCZ5Ouw+BCyECPgz0DNrgvScEj8DVSmLL
         1g4Q==
X-Gm-Message-State: AAQBX9d1Dqz2Zj4UbwUyj22P9/dN1+KFMlUmlbOITjBEEx5uqFOWUr8C
	MvMvJioVBMLVqWnPPba2BgHTw+0A
X-Google-Smtp-Source: AKy350aZffoChxbCPg7M2fAcOye2AlE3AkD3kI7o7RFqx/SUBuZegFtLbCZIhwjdYIeXSthO8Irkcg==
X-Received: by 2002:adf:eace:0:b0:2ce:a098:c6b8 with SMTP id o14-20020adfeace000000b002cea098c6b8mr5030406wrn.55.1680710738191;
        Wed, 05 Apr 2023 09:05:38 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (4ab54-h01-176-184-52-81.dsl.sta.abo.bbox.fr. [176.184.52.81])
        by smtp.gmail.com with ESMTPSA id q18-20020adffed2000000b002c70851fdd8sm15263762wrs.75.2023.04.05.09.05.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 05 Apr 2023 09:05:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	qemu-riscv@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 07/10] target/arm: Restrict KVM-specific fields from ArchCPU
Date: Wed,  5 Apr 2023 18:04:51 +0200
Message-Id: <20230405160454.97436-8-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230405160454.97436-1-philmd@linaro.org>
References: <20230405160454.97436-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: wLCvhNwBdtDx

These fields shouldn't be accessed when KVM is not available.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/cpu.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index c097cae988..efd1b010d5 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -945,6 +945,7 @@ struct ArchCPU {
      */
     uint32_t kvm_target;
 
+#ifdef CONFIG_KVM
     /* KVM init features for this CPU */
     uint32_t kvm_init_features[7];
 
@@ -957,6 +958,7 @@ struct ArchCPU {
 
     /* KVM steal time */
     OnOffAuto kvm_steal_time;
+#endif /* CONFIG_KVM */
 
     /* Uniprocessor system with MP extensions */
     bool mp_is_up;
-- 
2.38.1
