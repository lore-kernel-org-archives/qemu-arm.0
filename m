Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp1361268ejb;
        Fri, 20 Oct 2023 09:38:43 -0700 (PDT)
X-Received: by 2002:a05:6512:1382:b0:507:a1dd:5a86 with SMTP id fc2-20020a056512138200b00507a1dd5a86mr1993310lfb.13.1697819923065;
        Fri, 20 Oct 2023 09:38:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697819923; cv=none;
        d=google.com; s=arc-20160816;
        b=WiniABxJnvuEy6QUWlSuq9YYQp1dFGicePZiKmhr183Bj7oSquO7abjD0MH+JUppLP
         /UU4j51E+ui0YjSzfCBqKTEXWbmoa9LE7mXJiQ5Gno9Vu3tG/okLuABp5qBeTgFN2yED
         JIgQd5V4mRm+RD5Bp9D01xIDff41wCzqceOUvD35/vaKPRbMKrvP8rlvH7wnfB6NAy5A
         V5cIp+D80JzfMQHauluw4uleTzcqwBr1Qmr7bymvsii14TLQlqBYPqanxoQCTBiOYHO7
         ZG2QsGLhRVW7IUI31K0AmPct/sCAYEaDMyzPuzC1qsottwCO8Z0K3FtQV9D8iwDg38pv
         YhFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=glBeQZnUhkWGnfluElBv8to+WC3WDtUU/ZpHqLDizi4=;
        fh=bHlQXYStbs05aY0EAyGaMfJbShY+ETfyh4guRCrz04Q=;
        b=kbRlEM9sizPj/aGMOCBghxe9lwnMG8XUu6/Lhu8uITLb5xVUXFllRHgE2LLiOs4gUy
         ll7vW3oXhzJJg4YWCCb1a4HqyhE7QTQNjm+No0Y4op7wZGeKO+I45TR9pWj/cIR2BtIg
         1keJo+G85Q32z6UGDYYRc5x9Ttz2nq+Zn9y+d+zy6wVR18rwfr36xNKXVz4u+zAAw987
         WYvXR1NFAyr/ygLxDbj2FMJRpDfa7ykA2tyDDSsL3AIYvz9Bu5ho+DhtgPSyw6EWrsg5
         QiFtkCBTX9hpUOhqqs7tk9liGXIRfEqSyC9LcmX5fz46hqEfT/cDnj/IXxeY4tXBCNE8
         NDUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zUj3Kh+v;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id f8-20020a056512360800b005046171d957sor609383lfs.4.2023.10.20.09.38.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 20 Oct 2023 09:38:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zUj3Kh+v;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697819922; x=1698424722; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=glBeQZnUhkWGnfluElBv8to+WC3WDtUU/ZpHqLDizi4=;
        b=zUj3Kh+v08WmuRu0B9xDMnabIHd2wKm+AKHoIdIWXJ+RCXr47T+lbcjcoTZPUQiF0Q
         WtXr5CIs0hdG3EiY9uoMZ4EMh03hd25zOLzyrA3nIQKSj+cK6gQwvI0Kyc8Y2/YZBNSb
         Xva3H7JxuZC123WXK0YhWtBTPc6GN92+rVQoGqMWfFHsiJnBfee4cDcyLj7vJKwNyeh3
         P8Ia3oJQsUHCToVTge8XYy1xocOiaWWFhHIrF3DhFPm2879tKxf4J70ROBE9n2Ap8mzH
         FtlJhSt6pGxVlIRclBvgVVewazT3Gg+/CGdKaplVG296/2wxGEwmgmR/dtiEE0SKgcgR
         5ENg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697819922; x=1698424722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=glBeQZnUhkWGnfluElBv8to+WC3WDtUU/ZpHqLDizi4=;
        b=rtihJa0hdKbCkSaf6VGMZMTcxVPBMZDfm/Wky3wsj9NLK5zwdFauDnNbxr6hFO4qdO
         sk/dX+N72qkYa0YOJ7dV8hfMXIM0RZSsvZNHlmcZSEVoga9ho7dLu+LCMh2BSzbs8/Zw
         hSv+0FN7qiyjk5FWD+wstQz+KsE+rN3LXY/48aSTazL6GGXlU6c2P9Yg8rsMyX7xMZ83
         jqMCdSEy2C43x4ZRhxOytZ/lzQZFNDrvAlZaFIcBdjwZ/cy0RJPeDC8k7hCFNCKl1yud
         kN9VlNfbwgFQeiVy9XU1YGyLrlacNKQGyXn4I1EZ9ymf1ciD2cE7DNjZ+scRrx6IAknf
         7Abw==
X-Gm-Message-State: AOJu0YyMGqkOYYOLnLYUY2mYZ+fM0lCSXuQ7v4wcxU6rvs4Mpwc1CsGO
	VOinty2sTbBI5VXaBhCz1U1Xfyat
X-Google-Smtp-Source: AGHT+IG4AN5MeDxLeh5oiIFI1y2FX/rpR5Rx0eY0mrFrMBl/1N/Ujrv4xlmJWdziViHNemYMcOtoVg==
X-Received: by 2002:ac2:4183:0:b0:507:9f51:acee with SMTP id z3-20020ac24183000000b005079f51aceemr1635568lfh.22.1697819922614;
        Fri, 20 Oct 2023 09:38:42 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (tbo33-h01-176-171-212-97.dsl.sta.abo.bbox.fr. [176.171.212.97])
        by smtp.gmail.com with ESMTPSA id j12-20020a170906050c00b00977eec7b7e8sm1809552eja.68.2023.10.20.09.38.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Oct 2023 09:38:42 -0700 (PDT)
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
	Palmer Dabbelt <palmer@dabbelt.com>,
	Bin Meng <bin.meng@windriver.com>,
	Weiwei Li <liweiwei@iscas.ac.cn>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH 15/19] cpus: Replace first_cpu by qemu_get_cpu(0, TYPE_RISCV_CPU)
Date: Fri, 20 Oct 2023 18:36:37 +0200
Message-ID: <20231020163643.86105-16-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231020163643.86105-1-philmd@linaro.org>
References: <20231020163643.86105-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: BpyBVNCK9nBJ

Mechanical change using the following coccinelle script:

  @@ @@
  -   first_cpu
  +   qemu_get_cpu(0, TYPE_RISCV_CPU)

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/riscv/boot.c          | 2 +-
 target/riscv/arch_dump.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 1d004660d4..5e979f7b6a 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -437,7 +437,7 @@ void riscv_setup_direct_kernel(hwaddr kernel_addr, hwaddr fdt_addr)
 {
     CPUState *cs;
 
-    for (cs = first_cpu; cs; cs = CPU_NEXT(cs)) {
+    for (cs = qemu_get_cpu(0, TYPE_RISCV_CPU); cs; cs = CPU_NEXT(cs)) {
         RISCVCPU *riscv_cpu = RISCV_CPU(cs);
         riscv_cpu->env.kernel_addr = kernel_addr;
         riscv_cpu->env.fdt_addr = fdt_addr;
diff --git a/target/riscv/arch_dump.c b/target/riscv/arch_dump.c
index 434c8a3dbb..4813d1ac1f 100644
--- a/target/riscv/arch_dump.c
+++ b/target/riscv/arch_dump.c
@@ -167,10 +167,10 @@ int cpu_get_dump_info(ArchDumpInfo *info,
     RISCVCPU *cpu;
     CPURISCVState *env;
 
-    if (first_cpu == NULL) {
+    if (qemu_get_cpu(0, TYPE_RISCV_CPU) == NULL) {
         return -1;
     }
-    cpu = RISCV_CPU(first_cpu);
+    cpu = RISCV_CPU(qemu_get_cpu(0, TYPE_RISCV_CPU));
     env = &cpu->env;
 
     info->d_machine = EM_RISCV;
-- 
2.41.0
