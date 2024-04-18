Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp1953491ejd;
        Thu, 18 Apr 2024 12:28:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVWXoLANYrVUozPl6gftIhsTP1zWJ7K4K5hF5SywtpeXbsNah0EwE9U67qUX3SMG3Tle2vPyJb0wpPRPV4Yl7nytgQR18D7
X-Received: by 2002:a17:907:97c9:b0:a52:13ff:5317 with SMTP id js9-20020a17090797c900b00a5213ff5317mr70883ejc.38.1713468507510;
        Thu, 18 Apr 2024 12:28:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713468507; cv=none;
        d=google.com; s=arc-20160816;
        b=Q8x817BxTKC3Ly+S0z7xVunueJ7sKmihFrdWbpDGGziGjaapEGNbVGcmRmzfEz9daq
         63pptgu9eMd4jlKLeucQGdYfmYaN12SFf/MeMYUdz+bxUQkaqZZ3k+g2ZWAkJ3+Vw0Ga
         9Ugw7k6F5dWRUDE8eJc5NVhSdSa+p/G/7s+jg+UeSzGamcZEbkoLVrn+8K8uG2XQeFmR
         AA9PhWqrDqywXkGYLXu/+Au5F9UpWyuM7nB8zB2qLi7ySOVdgFH8boG9FarR7gnXJWvG
         PPblZO2EogXaz8ax2NPlJEuDiV64J8RuHQtPCw1GGJRVJedxZNqljzc57mVfl4m9GzEf
         dKfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=1RS5jD62Ba4lXsw4t8DJy1DGdcN7GiTei/ES6lsX54Q=;
        fh=End/5HnPWgHNcimj4aEqabS5UZc05/1J8KKO3WRDNwY=;
        b=HSArLGs7KFrhsu64tOst2awQGHP9aa5COKDzariH1yHkKX2b5AFpbZ87bRhsOEyfQ5
         APiRKgPdU3F5mYl0HGx3ISKxLSNX7ASgSpYmyQytMixxx2VFD54s8VikmU5yxmJQHswM
         DGxgd2Y2L6kPTOJtqMsqet9o5fIRPJqnvCp7lQktoQY/1kBq48MBoKyoiWz/HuIUq+sM
         IdPeOr4EVN7J/9rMmGasRwx+5Cma9JCFY42FBuq8o2g5UafbOldRWou+S+uVA+9nXY5c
         EEMQLtK2LDmRnx1/re8XsdoluRUimDpmHJWlaysHFq1uZ1wDZyeJ98HRrw7VdYk5EVoi
         NB6Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A0uMWYOS;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u15-20020a170906408f00b00a51c541ab6dsor710369ejj.19.2024.04.18.12.28.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 18 Apr 2024 12:28:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A0uMWYOS;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713468507; x=1714073307; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1RS5jD62Ba4lXsw4t8DJy1DGdcN7GiTei/ES6lsX54Q=;
        b=A0uMWYOSGFoR3OJ/1FZyftE21dMDZjYJ2qcSyzOOgD44qat6yu8i3G0324BhWteY+P
         T+G1ROOoTJRXXywAwgzosIafMlyS12cP0+xgj2l0tt2QF43xXSi1TBqYV379sAxzz0rZ
         K7rM8mET3VNl+6sqnSEIuYM3uL5FLJ7p5xbQbZEwYKXB3gEBLFC+5qZT3rZuB9un/KXf
         nl16K2dwBvL/wHtG9zWeiEIaXch7tn6ak0PnjUU3jFasaNlqLcx4tUpXYisaarqLl+GM
         Upv+lB2zhZ1pB9LYOEMcoFA1J0GFV39F2tZBlNaoTQd8285esRYhmg41wNQJxL/tZ3HS
         DKTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713468507; x=1714073307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1RS5jD62Ba4lXsw4t8DJy1DGdcN7GiTei/ES6lsX54Q=;
        b=Zf/zuaxwwxJYQLufq0nz3HJIMYYf5ItUsyrBzFrBWEiTHqC7+dRgEIhCo2pQtmgoMq
         R6vrCqOaFumg2Z1wN9OS6LAjRRHD7S5wdl+NMS0ouczAv9JQ39nTxD7j7aMTY7+myenr
         dTWKJTdEWPvurztE8dZcU2lQeI8iZzxpRSuzj54/ZsqCCBBcrGO6xoNkjtvmssPmIjc4
         BTNL4GrthKee1/VOINsWO1JjEu75moAPmgz/65xyC1L4C4zHzzdA8pZThWu0CCYL28ly
         4rF9LurMd0yp254WqU+ZuQ4LyjX2oC9pXNNt3EXqXjD0TWQDujAaPiQrsMk2oNvWMzDJ
         qQrA==
X-Forwarded-Encrypted: i=1; AJvYcCXHqsrnDC3k76pJ1o5prgM/v12bzRKHm+9VGyZGiMqzR9adaBOb8LoJzZCB1TjqYf16dGxs8ycHWKcTJ4uwdYRZCrU08ZWZ
X-Gm-Message-State: AOJu0Yy2l3Jv38xpwkMEVnw6XNmPTlA3w3O8xJEo0l3Qo/2CKyqzGhee
	3nDs9l7XtDKQa0+Qk92ENALB889YML1XmDTMM8zct5BEQlQjOHK6/+mzPL014ys+Ug==
X-Google-Smtp-Source: AGHT+IGnTKynFh1txoZ9rF9Vyl15tlc6kOiNOpj1xrRbtFLNtjZUfEfbPneu9vzj/dXaKDU0HdxgVA==
X-Received: by 2002:a17:906:f87:b0:a51:b463:6b41 with SMTP id q7-20020a1709060f8700b00a51b4636b41mr56034ejj.61.1713468507162;
        Thu, 18 Apr 2024 12:28:27 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.151.213])
        by smtp.gmail.com with ESMTPSA id s17-20020a170906bc5100b00a4660b63502sm1277805ejv.12.2024.04.18.12.28.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 18 Apr 2024 12:28:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anton Johansson <anjo@rev.ng>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH 24/24] exec: Remove unnecessary inclusions of 'hw/core/cpu.h'
Date: Thu, 18 Apr 2024 21:25:23 +0200
Message-ID: <20240418192525.97451-25-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240418192525.97451-1-philmd@linaro.org>
References: <20240418192525.97451-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Z0l55RFAi5Y3

When "hw/core/cpu.h" is not required, remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/exec/cpu-all.h    | 1 -
 include/exec/cpu-defs.h   | 1 -
 include/hw/boards.h       | 1 -
 include/hw/ppc/openpic.h  | 1 -
 include/sysemu/hw_accel.h | 1 -
 5 files changed, 5 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index cfbf51822c..03963442a0 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -21,7 +21,6 @@
 
 #include "exec/cpu-common.h"
 #include "exec/memory.h"
-#include "hw/core/cpu.h"
 
 /* some important defines:
  *
diff --git a/include/exec/cpu-defs.h b/include/exec/cpu-defs.h
index 0dbef3010c..2b88db71a8 100644
--- a/include/exec/cpu-defs.h
+++ b/include/exec/cpu-defs.h
@@ -29,7 +29,6 @@
 #include "exec/hwaddr.h"
 #endif
 #include "exec/memattrs.h"
-#include "hw/core/cpu.h"
 
 #include "cpu-param.h"
 
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 8b8f6d5c00..2daa23082f 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -9,7 +9,6 @@
 #include "qapi/qapi-types-machine.h"
 #include "qemu/module.h"
 #include "qom/object.h"
-#include "hw/core/cpu.h"
 
 #define TYPE_MACHINE_SUFFIX "-machine"
 
diff --git a/include/hw/ppc/openpic.h b/include/hw/ppc/openpic.h
index 9c6af8e207..8fe3a5902f 100644
--- a/include/hw/ppc/openpic.h
+++ b/include/hw/ppc/openpic.h
@@ -2,7 +2,6 @@
 #define OPENPIC_H
 
 #include "hw/sysbus.h"
-#include "hw/core/cpu.h"
 #include "qom/object.h"
 
 #define MAX_CPU     32
diff --git a/include/sysemu/hw_accel.h b/include/sysemu/hw_accel.h
index c71b77e71f..6aca3c6178 100644
--- a/include/sysemu/hw_accel.h
+++ b/include/sysemu/hw_accel.h
@@ -11,7 +11,6 @@
 #ifndef QEMU_HW_ACCEL_H
 #define QEMU_HW_ACCEL_H
 
-#include "hw/core/cpu.h"
 #include "sysemu/kvm.h"
 #include "sysemu/hvf.h"
 #include "sysemu/whpx.h"
-- 
2.41.0
