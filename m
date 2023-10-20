Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp1361432ejb;
        Fri, 20 Oct 2023 09:38:57 -0700 (PDT)
X-Received: by 2002:a17:907:7293:b0:9ae:4878:1172 with SMTP id dt19-20020a170907729300b009ae48781172mr1740168ejc.7.1697819936844;
        Fri, 20 Oct 2023 09:38:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697819936; cv=none;
        d=google.com; s=arc-20160816;
        b=XUdfbh2TiQTyfip+ULoKgQEV65vvO7mnNuIAdFoh05ZbsFDDJlpkIYVk6jQEIuVWI3
         Gk7xycM/JfRbVrOPy6+cZ+dRWkRVeBImml1pIiLs1VtyT1QoQR8izPLnK2xQjIAfdWEq
         cubwYYdAaRcKPdGlzJd86aINLvqjcfJP/Dm8G+SQZk3rIU1+QGRsNkGqFDDLRqboXysE
         KEK+om+xFXBXCWofw9L3hhHJTYahcfF+Wt7xZKIr+z7U5KOrqpdM9MGbi2p27s6u+a+A
         M+7ZwyrfmdQq7vx5cS9htxgdI5pjT7J7M2oZIRc+3NzAHvX4yXqlwJvmnbqYw5fFqvHu
         1KAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=8m78jGvmF7oKs3bQ1VJX7QX1qGqO5WzM4SQXqj75reU=;
        fh=SD4RcGg+xPzHdRH3pKBNDwiGfpHZMHcXMnoTu8/UDBw=;
        b=L6swakHTqKO6R4KtpJ6nWOwV6OKFlXaOx0AQBATsAiGFjVE9F0FYN6aj2XiSGIMIjU
         OapItDsvLgXp1I/yj0DO3KOWAm1856vgJocqLbRbSW/owQYlkJ42lahLh8Pb7UJkJ01I
         5VUvISGkH5HUAyvUq7B/ndp7r+Xg1WUW7SdZXgJROPRxj2lk6Al8yFvcYnKC2hgjmDNK
         b7kfDed2yCQe4y19vgPLLwQDmjNIIgcXSje++r0Q4DCWlPLixGFxZe7w5sjaGRHuMCVA
         dm9NdKrcqcDSQbb3sZkQTTDXJv7s9nb7t1e+PJUfc/C9SSWwK+cCrJIn5stxoJTSgUvN
         RhLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qie2FNgx;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id w13-20020a170907270d00b009b2cdcddb2dsor735073ejk.0.2023.10.20.09.38.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 20 Oct 2023 09:38:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qie2FNgx;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697819936; x=1698424736; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8m78jGvmF7oKs3bQ1VJX7QX1qGqO5WzM4SQXqj75reU=;
        b=qie2FNgxRwSTVTtgev+/LCafgGDPB9JBdyiYmyy+TmuiefCJsWAHQ6GtOpb1ZSgLkE
         14wi7iJDaTXffmJmZjSxyQkFUeHrBjwYXe2+WsfDoWpbNrZXqzdflh0jKYzRmIwZOH2m
         EIsz45g6N4TPUsntg/MM0aJtGoQZSGQPmaOZ1ChzKz0zcq3vpGyVIrfTOCfHjKHLm794
         ugX8NA5t5k4FSCtgUdFmPA8XNEFcpEGDesl7c7iW8jJH4JaQmRrE3Fo3UjdySGvnFGhv
         UtbV/mEdrpC091e2ksgDi/kvxoj8ELD0R2Mhk0/GaC0HVe6KmDRQCvhs92+C/gdSegBe
         1tWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697819936; x=1698424736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8m78jGvmF7oKs3bQ1VJX7QX1qGqO5WzM4SQXqj75reU=;
        b=Z0++B54oWTTG5Jl9GXS0n1tCZdX85/fgbAL8fCZp3EG/rlVbkgQSe8xywrVlHsanif
         Gg5u0DEmtYVdUcotGNsn6Yx65s/OxKLDPAypAblHt4BVzrpz6Pub/TAYSfAAcprQ+rJj
         +RCcfiLfxoI5yd54JnLIACl4gJx9kLVIxRuV7ptmqIfQCmVVobm0Tff+oZqERvi6meLv
         O+KhdJOtzb4gQP8RXe4E6LtHYnXItKSILsIJCkGzfZi1at+qgQlpmFlj3HtbDIVNWyMo
         4KllcCHfOgXzVkd58GmV/8Vom8hXT5+qAGJTVi7DVNPgtVm+z9qtfODLU4+ydlcD5qQJ
         w35w==
X-Gm-Message-State: AOJu0YzxIH9myML0b8lqc0SmE+WvvDANCeFKdGDNcDRfE38cExB6TwHq
	uN76+krhbag7t5bVEzFp28byEZyD
X-Google-Smtp-Source: AGHT+IE8yq5L7NgEFg2BL5r/TirE3WBnMy42fdTokTdcZFul/3aVleWuW6Vwfoas6PkQGpsaPs5PAA==
X-Received: by 2002:a17:907:7b82:b0:9b8:7746:f176 with SMTP id ne2-20020a1709077b8200b009b87746f176mr2150472ejc.34.1697819936618;
        Fri, 20 Oct 2023 09:38:56 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (tbo33-h01-176-171-212-97.dsl.sta.abo.bbox.fr. [176.171.212.97])
        by smtp.gmail.com with ESMTPSA id rh8-20020a17090720e800b009930308425csm1788733ejb.31.2023.10.20.09.38.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Oct 2023 09:38:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	qemu-ppc@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	qemu-s390x@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH 17/19] cpus: Replace first_cpu by qemu_get_cpu(0, TYPE_SUPERH_CPU)
Date: Fri, 20 Oct 2023 18:36:39 +0200
Message-ID: <20231020163643.86105-18-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231020163643.86105-1-philmd@linaro.org>
References: <20231020163643.86105-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: zMH8g1Tgu1sP

Mechanical change using the following coccinelle script:

  @@ @@
  -   first_cpu
  +   qemu_get_cpu(0, TYPE_SUPERH_CPU)

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/intc/sh_intc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/intc/sh_intc.c b/hw/intc/sh_intc.c
index c9b0b0c1ec..be76a96ebc 100644
--- a/hw/intc/sh_intc.c
+++ b/hw/intc/sh_intc.c
@@ -44,12 +44,14 @@ void sh_intc_toggle_source(struct intc_source *source,
         if (source->pending) {
             source->parent->pending++;
             if (source->parent->pending == 1) {
-                cpu_interrupt(first_cpu, CPU_INTERRUPT_HARD);
+                cpu_interrupt(qemu_get_cpu(0, TYPE_SUPERH_CPU),
+                              CPU_INTERRUPT_HARD);
             }
         } else {
             source->parent->pending--;
             if (source->parent->pending == 0) {
-                cpu_reset_interrupt(first_cpu, CPU_INTERRUPT_HARD);
+                cpu_reset_interrupt(qemu_get_cpu(0, TYPE_SUPERH_CPU),
+                                    CPU_INTERRUPT_HARD);
             }
         }
     }
-- 
2.41.0
