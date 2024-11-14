Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp25915njc;
        Wed, 13 Nov 2024 17:14:20 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXm5oyV0/kZm9vXJeCoOZ+1V0VDfCByIQv/6zmax/CFh4xdNCUn6louVu0BqtMbs67Ud7d4XipL/HL3Dg==@linaro.org
X-Received: by 2002:a05:600c:3582:b0:428:ec2a:8c94 with SMTP id 5b1f17b1804b1-432b75035camr195078185e9.10.1731546859528;
        Wed, 13 Nov 2024 17:14:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731546859; cv=none;
        d=google.com; s=arc-20240605;
        b=Gf7/7NLp0/Uh0i+nYORkLYd3JMYgOF0kL6p0DWQSV+HvRHo8MLinnZ8OLT9CMVhWTo
         t12W7Z7NSTXinCeZnetkS/NTE2Nv6mmCk+oK41+wBMpEJuE0dH7mhaDi5dupgLCtzvSf
         ne5zEbKs1RFVIh7P7/5eGckZSZtYA96YtwzTsC1irvfpSySRdCQppYryVS9W6Kis88Mr
         WfvuvXWaZA5p/mcf3J2cLddafyl281SCtdz+afZYfluIf0upmbfTXpwOjbrdFh9byGUu
         fen3nZHzWorOMkzJw6mdVx4IcNMgAF0Y1KvVF2+a/+wYY7Q9sNM6F4Xw6qwuiBpU+z3t
         duDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=IkMAKYtUsFK+2kHSHv5+o6ejmYyvsynMitsyE7ErdJE=;
        fh=iQxhQUPcsNnXkO8PCPsf2MNrsBRvFFg7u+1Srg2tvSY=;
        b=D+5LUKdbNyoAZ6bk2nsugCrfeqA/WbBJCOeMeZFO8Y44FSAt1svFf0p2voC8VHVEq9
         DFnuxUIHrIWh2RyQfIOhrKm6EbU0ECvzYmrzG/df0CroFnrxAj/f0THUvlAtTRCn66n6
         owxZdm/y9kREYJC7RcYAXj55aaPUY4RYFPZn2ZNEGTsoCKPVUC8w/SEwqi+MU9REN+2T
         FVEUX2LBxh4RPCbKw14PAPZbd8wjzWdvqH8morYrvzSb57p50imoCr4gFn5JHG7b5Vsb
         9+Q1dUK1q00b79zaNzsYuBy16o8MtHsSSkVarNGl0ojIbRKJWl+cCBFTTEY2pzNxai16
         Qduw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mfYLZQ2e;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-432b0b159f9sor59960485e9.1.2024.11.13.17.14.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 13 Nov 2024 17:14:19 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mfYLZQ2e;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731546859; x=1732151659; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IkMAKYtUsFK+2kHSHv5+o6ejmYyvsynMitsyE7ErdJE=;
        b=mfYLZQ2ePhj33mbCsH/hW3DdgAyYs+mI/ABHAlm8MLHHiGqVxiqxfyU1jy/DZSCF9p
         Y7OqLuXeBiGDDEhSV6bt3rVx/iymdOJXlQL4Zpt8fvJs7ISH05h9yNS3GPdFyJGdTmTK
         g6aVb74QeJqBVjUOEiPa2CtUiOo/x/uoIxh+8M8EXgMvK4jEZR8IA2iYWNSOo3Hc/H8q
         TxoZbOKr+EewqcoRi6X3iaI8YEIiiMQ5IspwQtR7OkWAZ6k+pvTsJHsYRjzxd7bAXevT
         iaAuFx9yd6ZZ52qw2szuB0jxsNWRIjPzmlRubAvJTZkMD6AiD7oxNWIAUr6D+Qx4SrSU
         kryg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731546859; x=1732151659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IkMAKYtUsFK+2kHSHv5+o6ejmYyvsynMitsyE7ErdJE=;
        b=nysglfaWvk91VDQRxDt5YqMUo1Kz7QJQ+/6NPtdkTICTeQIksn+6RlKK2tryPKFKmu
         WswTIdpCER/R/xNNx4vxDLDRM4Sab3qowZjb6QH34fzQxWPp+TW689ZLWAbYtFLQ26Uo
         YSJqelYs0jm5BNvjsNDNgBcFoxHNnHkkpLnuRL1o3/0fQlw4kv4v2apl8B9Qr7zRaUUm
         eriQUhREKuQej1wKEiRgb+Bilo5iItMoPKJqPVte886fdrtvKJKuFICevHvOJhBIjnPn
         KZ+Wjs/NQt3dDyrIJttGVTj/gUnDS/GhiI6YGb2ozrBrgPebluv66gCp9qjgthL1l4Vj
         DQWg==
X-Forwarded-Encrypted: i=1; AJvYcCULkXiyXnKmaTwEMtp5XWW3pQYQrR4Yf4T6jV6x7mkcSMwquOYhJpGQlgsWcgbMx6kER5RDzJFUnkLMvQ==@linaro.org
X-Gm-Message-State: AOJu0YxyqO1P2PuJWuVHsijvKQ65FPv3nGVBcAgX15tG2Co//UDIHhdp
	EUJ0vyR8+yHCf+MrUd0Rz2pm2ltxzF/rSzvV+9DE12pe87rW0GrlhnN3Rq/2wdtwESsz4gWGl3P
	qF8Q=
X-Google-Smtp-Source: AGHT+IGq7l4w9ev6D28X1Yepm7vUOOMFRow8CZfJhEURSVFhxjg71fxbtKf1kANyx9ZamVx3FRm1Lg==
X-Received: by 2002:a05:600c:1d20:b0:426:5e91:3920 with SMTP id 5b1f17b1804b1-432b751dec4mr186860785e9.29.1731546859011;
        Wed, 13 Nov 2024 17:14:19 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([176.187.209.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432da27f4f8sm4766295e9.18.2024.11.13.17.14.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 13 Nov 2024 17:14:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Anton Johansson <anjo@rev.ng>,
	qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org,
	Peter Xu <peterx@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-s390x@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 07/24] system/watchpoint: Include missing 'exec/cpu-all.h' header
Date: Thu, 14 Nov 2024 02:12:52 +0100
Message-ID: <20241114011310.3615-8-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241114011310.3615-1-philmd@linaro.org>
References: <20241114011310.3615-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Q0aTSknfisuW

TARGET_PAGE_MASK is defined in "exec/cpu-all.h".
Include it in order to avoid when refactoring:

  system/watchpoint.c:52:24: error: use of undeclared identifier 'TARGET_PAGE_MASK'
     52 |     in_page = -(addr | TARGET_PAGE_MASK);
        |                        ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 system/watchpoint.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/system/watchpoint.c b/system/watchpoint.c
index 2aa2a9ea63..f7366574a3 100644
--- a/system/watchpoint.c
+++ b/system/watchpoint.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu/error-report.h"
 #include "exec/exec-all.h"
+#include "exec/cpu-all.h"
 #include "hw/core/cpu.h"
 
 /* Add a watchpoint.  */
-- 
2.45.2
