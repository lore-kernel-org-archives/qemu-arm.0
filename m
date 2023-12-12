Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp864669ejo;
        Tue, 12 Dec 2023 04:34:42 -0800 (PST)
X-Received: by 2002:a17:907:3f10:b0:a1f:750e:a285 with SMTP id hq16-20020a1709073f1000b00a1f750ea285mr3532074ejc.39.1702384482809;
        Tue, 12 Dec 2023 04:34:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702384482; cv=none;
        d=google.com; s=arc-20160816;
        b=PoH2X/0VHv8NMQqriP/Jq1m2lvZY89QduGlRYWD7/QWwIYeEacia8xU6DW6uPqxLSC
         imDDKgHbBv8LSHVWJo+8E+Kj5WVQZqK/t/84l4Gp5Q/DJ89Z2f3b7/P6sE5eRPcvkYs7
         eFbKSbA2PPYS9FGHShOrTBeAkGCkdQrbPI0ycgIWd9BZp+SYNa2QCqSUT2AO1gZeKi9n
         N7iQMih+nKCqkwX0vK90nEQWzY0+ADvB2VKUk1Ki0X+I2z0LnVfUO0jRndrRQ0gW+hdN
         M+EFZ6m7b1hDwCq1D8yi910fVQKqnWmzzFqspU7cawFV8ldLT42VSEkDCbZOvwsHX6aP
         uaaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=hNDHIJ1gpHeb2DpFjhHXsFTasuOwWoH4S7CHuQ8aaek=;
        fh=vlFEGdij83GYetLrOUaCnR04sbYRvtckD5L7fw5192c=;
        b=af0DG3m2l3Y2idSvDTf96s8ernJiRrc/+lzYLfdoAf0h519/Fl0KA+A8UUgHQtkYKe
         xgoP8pDJRroyK8S0YyTGrfsfFi7HwNl6R9Hg0VU2jCpIhrfn605sgIKd/6XM4JYSLh7G
         pQa4YGLlIR5RnIeaGf3NhenD/GkjQa+k7At22rI0Ld6zYNNN7LnusD+nqRONACaisrDo
         0tqlmXDUhW2NDqiq6d1NLnEdtCWAe+L4Ap7IkSF2VdHHePZ6JWg5M6G+Kt14lG4QYyMw
         R8da3+M2P6lgOTtrH5to0K72A0sQjYJBerbIAf87gU3wDbds1i7SDtu+FCwy1/fAo/Iw
         cGJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ME0uMZz2;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id jx14-20020a170906ca4e00b00a1ebe99f215sor2135643ejb.19.2023.12.12.04.34.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 12 Dec 2023 04:34:42 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ME0uMZz2;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702384482; x=1702989282; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hNDHIJ1gpHeb2DpFjhHXsFTasuOwWoH4S7CHuQ8aaek=;
        b=ME0uMZz2v6kU0eLD0TRKeQ2FzB6Pv+VyXzSoF3yVabjN6TabL0jelQVwpvzn4jDTsT
         l6ogVk4ewIwuyAXpBH8z09ayPE4pSnbLGJGGHmiwmstWIdF4Nf4MQ3a4lGmAaulnPMhx
         Pjlvl9xKxX10zQPBb5SoFTTNZpsSbCAFvUpq6YR1IRCKhLV96UfIPtLAAetMZKebjy82
         DTqEJ6M6R7iBsMniNl9GYVzjTMEH+GUIQq7F03UTD0XK6hle7C3ftPnbnnmkaREUGipt
         e1qdxsxpwHm0dbNJB4vTuzxNtJYK0oGuXEuA6moacJLloDDVuedkxc5hG+YJ+zSF7VQB
         YfrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702384482; x=1702989282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hNDHIJ1gpHeb2DpFjhHXsFTasuOwWoH4S7CHuQ8aaek=;
        b=VwRYy52Hn2WSxxM9+UOVu4qjb9f3l8xv5Tr8ODMJp22upV3CZ5dRJfYutO7CuRxVdY
         ydr/9VbZBVaqzM64UjDSOA9ZiyNs0F2HIgVpu/xMr8/fiOeFZjosSdRSyjq4IvhvUuHV
         p7jr2Mq5uA7Ne87f0njmlLL5Ij+k8EoPO9Lu38cQL7ul/zaX2hoWYdZnPF50WEu2/+l3
         C7Tg3LFIWd4FrZeYqWrXiCHzVIYNAH/K1HeidUrWH3ycbLC46PvhyMSWnma1VIetku7r
         52PPbzZxaxetHFpNQV4KvNFLgTm/FzFHuUg5bO/lmJVQidEdDGjRCXl78JYHjAI4QUHB
         eXUg==
X-Gm-Message-State: AOJu0YwRdCRwSN/Oo9p2eYuJiwrVfdNznxaFRAklTpd8tvD+91tKFU8Q
	Iyi4pDRGWfIscx1pL6hauNynLYJl
X-Google-Smtp-Source: AGHT+IHiL6j5LJnv3YMln+vLFP1FigAz4tB19Y+jgocfMjyUq9luEcj8SPD9gopactYW2HlxIZ9OXA==
X-Received: by 2002:a17:906:13:b0:a18:cdd7:3987 with SMTP id 19-20020a170906001300b00a18cdd73987mr3301144eja.2.1702384482325;
        Tue, 12 Dec 2023 04:34:42 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id tb19-20020a1709078b9300b00a1cd30d06d1sm6337726ejc.14.2023.12.12.04.34.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 12 Dec 2023 04:34:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-riscv@nongnu.org,
	Brian Cain <bcain@quicinc.com>,
	Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anton Johansson <anjo@rev.ng>,
	Warner Losh <imp@bsdimp.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 05/23] gdbstub: Include missing 'hw/core/cpu.h' header
Date: Tue, 12 Dec 2023 13:33:41 +0100
Message-ID: <20231212123401.37493-6-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231212123401.37493-1-philmd@linaro.org>
References: <20231212123401.37493-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: qbARSW8V0vL0

Functions such gdb_get_cpu_pid() dereference CPUState so
require the structure declaration from "hw/core/cpu.h":

  static uint32_t gdb_get_cpu_pid(CPUState *cpu)
  {
    ...
    return cpu->cluster_index + 1;
  }

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Warner Losh <imp@bsdimp.com>
---
 gdbstub/gdbstub.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 46d752bbc2..034a4ac211 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -37,6 +37,7 @@
 #include "hw/cpu/cluster.h"
 #include "hw/boards.h"
 #endif
+#include "hw/core/cpu.h"
 
 #include "sysemu/hw_accel.h"
 #include "sysemu/runstate.h"
-- 
2.41.0
