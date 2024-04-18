Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp1952219ejd;
        Thu, 18 Apr 2024 12:25:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUWv/ygIbrqXqWf6njENjVBIyGOeQ3zs82MPVgQ4NY7LwErvEh15GrIaKUwcdxuTgpvHyVIueLi3lTCDRto8dbuPmbd+Y6+
X-Received: by 2002:ac2:47f9:0:b0:515:a8c9:6e99 with SMTP id b25-20020ac247f9000000b00515a8c96e99mr6854lfp.5.1713468347902;
        Thu, 18 Apr 2024 12:25:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713468347; cv=none;
        d=google.com; s=arc-20160816;
        b=qF00N5I1sp+FqqdxApyBqCYhluu3Ju+umHtdxJc01idrxis1qEAOm/7kfwM2Og7KIL
         UdNne4gzeN0IkQqFJSy3SkRgEN5WGiK+R8gIAhQ970Kirva58vRXjrT9tL0kf0ph5GP6
         l2c1EdAG9MwVONllpdnjwYR/BPDmr3xW7NF98s0bOYv9dtvjQYUQ54Sn/eQOQ57bmNK8
         oTb0kq6UnjDzus+tevEHU5YWAm+eKYd1ArMKpN1jdOD2AZz/GTXYEY1ZHkfYEHZWfbaz
         L7f8Kd6JkUtF3Zs7pq0tNhVjsffcKpP3DcasU+y+3jrQlmQwxV6rqdeNZrVjedI/eiOc
         E/GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=qM1+ePV7JI08UmjLq5CXr5Pnp/lUDlPFaqkC073bDHw=;
        fh=a8Ck4j+4yUWxCi3ng21EEn80N4YGr7XLi0IgITsmO9s=;
        b=OBd8zOep8f/WUcSK74UoLo9uDIkq/a9r673h3d+mKcpwUyOvwPjOHf8CxYkj0oZcV4
         4PuHRO59ztNWqrQl6rzSMpgdjKsrF/DGo4rZhZQTI0CFHNSVwVcjTnnp4OtsurP+XEz4
         MwSHIGFbgzKtsRt7fS5L5+jjrchxJRyOpU9iKb8HykotV8nuLEgeNcN3KuAmRdhm5XuZ
         OBGx2VGInTBkIQWz0Wn/gU4VWPx8/PqzigTZTRGv50/Yh4PYSMDuTX/7H3SEVEDlOa7J
         RVMTlEMIvg67Y+vbjV5XI0nx18jFtYYNW07a67eV8fFRxbWtf2RjJGHEkJcoht9VjDto
         5URw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Jm0v2klQ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id f8-20020a193808000000b00513c1b3fe26sor560246lfa.20.2024.04.18.12.25.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 18 Apr 2024 12:25:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Jm0v2klQ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713468347; x=1714073147; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qM1+ePV7JI08UmjLq5CXr5Pnp/lUDlPFaqkC073bDHw=;
        b=Jm0v2klQ/k/lvMFXNwfPCkeQjkdWohBTmwcDXx1IMQG29OidN9AO/HnzFqoLT8bN+P
         SyY0/aBuQ2MT4CARuS05MD/RcSOtujKhEsjeD3pO9oX/2rXCfiCi7d5sAjBru+1i7m+W
         vyKvnRQO+XJCf9M7q1SejA1Id8GQxfReuqwzySFuthj+O2dK4lGDH2hVnGKMiezuMCxw
         Gj5MWv0Fa+W6yELGkYvju8XA9bNT9TzrFVc1UigB2/CSn6NH9ke2OPQhcOa348E5/NxI
         c6l5SVjJ/zRfNhL7RAcV99GDvaMeqnmmBpPjRiLPII4ZMuYVDfHOYPwASPhzcPEojdTn
         VrJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713468347; x=1714073147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qM1+ePV7JI08UmjLq5CXr5Pnp/lUDlPFaqkC073bDHw=;
        b=KZ095k3cEc0l+Lx/Eo8Wnz3qB/USMrcgFfwS53tbFv0zZcLHEelautI1bG272r1VAS
         v1ld5/MiD18MM/VbUpJ/ZKMHK6kmMhggKCjgcsuQTX8tGdI5xpALjGGzlfp9Gp6znUFZ
         F6VDEvWFQLKK+NHVG1Md2tKdvlT3CMtQIwUxXy/8kRtvnH7iD7+WjgAR1jg0+VYs27RF
         UlQU76WVZu/zvNsTOFO6cc70r396AzauVRIQk7eFQwO25LCs5v1/CkqGB3dxTOlN+Wb6
         PfHTNTW0buLRHWeKmlMrVh/HW/H+LaGOaFQAkrG2rqXMiFl+EyyUjKqkXWfvOuRD92zy
         GyGA==
X-Forwarded-Encrypted: i=1; AJvYcCX/YEZ7iQ1F66wVEWCqOfDp/1NzZelQRB+ftSeVd4yilGg00MdpRa9hh/Y/BgdCecuX9PTirv1sOgDpWIOT8q7x143sCt7q
X-Gm-Message-State: AOJu0YwWHA5w7oMAY1ty2o04WDGtccCRep6g0uiMTSe0851A/zD2IQuN
	faoYhHwxZRMh2VnEp6IBdh5MHKgnNhiHDiLMIxdaI3SlSgB1ylc4DUZGMqflMqVAgOgAa6Dqpf/
	kjXg=
X-Google-Smtp-Source: AGHT+IGbmgL9q5GYwqiriM3TxUUJmdVS5GsQvbF3Zc7lx0z/Cqw6N44I5tEaB6OpQn1vVifcnkd4Ww==
X-Received: by 2002:a19:f616:0:b0:518:d6ea:9f5d with SMTP id x22-20020a19f616000000b00518d6ea9f5dmr2755246lfe.42.1713468347556;
        Thu, 18 Apr 2024 12:25:47 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.151.213])
        by smtp.gmail.com with ESMTPSA id w23-20020a170907271700b00a556f2f18d6sm1195356ejk.57.2024.04.18.12.25.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 18 Apr 2024 12:25:47 -0700 (PDT)
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
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 03/24] hw/core: Avoid including the full 'hw/core/cpu.h' in 'tcg-cpu-ops.h'
Date: Thu, 18 Apr 2024 21:25:02 +0200
Message-ID: <20240418192525.97451-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240418192525.97451-1-philmd@linaro.org>
References: <20240418192525.97451-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: hZFAAQxyPaN7

Only include what is required, avoiding the full
CPUState API from the huge "hw/core/cpu.h" header.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/core/tcg-cpu-ops.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
index dc1f16a977..9387d38748 100644
--- a/include/hw/core/tcg-cpu-ops.h
+++ b/include/hw/core/tcg-cpu-ops.h
@@ -10,7 +10,11 @@
 #ifndef TCG_CPU_OPS_H
 #define TCG_CPU_OPS_H
 
-#include "hw/core/cpu.h"
+#include "exec/breakpoint.h"
+#include "exec/hwaddr.h"
+#include "exec/memattrs.h"
+#include "exec/mmu-access-type.h"
+#include "exec/vaddr.h"
 
 struct TCGCPUOps {
     /**
-- 
2.41.0
