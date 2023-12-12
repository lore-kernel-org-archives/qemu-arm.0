Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp864935ejo;
        Tue, 12 Dec 2023 04:35:09 -0800 (PST)
X-Received: by 2002:a05:600c:3b97:b0:40c:20d3:3a0f with SMTP id n23-20020a05600c3b9700b0040c20d33a0fmr3141736wms.78.1702384509025;
        Tue, 12 Dec 2023 04:35:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702384509; cv=none;
        d=google.com; s=arc-20160816;
        b=w0TooGR3YAm5yFouZeyZPP8VbCFQ6gM6zduUectui12WkiHMo8VCLeMheYE1F9LzxB
         RP4jK065YUY88y+h3W7aGtfiSDr0PUIuG0aNZagaSsTOEcxE5LDzRKu30btuqMk/qEEV
         q6aLa/5ErYdrhp7n62zuS7ebjpskm7cx20JLV3KE60j/OFvH86JYvUlZUyh4cXLXFouz
         1pCUVoLf+iAL8ami42+wT/HY9jxw1hPeyUYTsaiVgRVQvs2p0yc74YKyMhSkCu30fDAx
         JJaUVxfbDd1dLhXOTbIW29RJkdojboyia8Ki4OTMGdVEWBGcxaZo5I2ZHu9WIngXNLcI
         czFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=bTgCkgY7q586A21zu0JSDs5UTTpVyxNoAlIlHHAmSdk=;
        fh=vlFEGdij83GYetLrOUaCnR04sbYRvtckD5L7fw5192c=;
        b=fFYX/ez9kwZixRy4PvGJhBj9+U26srKIWPbBNBbHaqw2Fk42Crm897VuF/JZJlP/wm
         9CIG8TaAFU376fbfyavsFRLECfWpub01SxmkLmSya4A0+dzOXRCT0oxcnqCLrwZ9fAEi
         048iJDHm7ssyWGMmZh+5pnLBI9s43QBW6Zw4qwmfR1ODw1Umgk+LC07i4ixcerj8j3zH
         5ERgHe2pkNmkp7rC2unGpZtO48rypgvyXGsLZdkqfI/IhUjNHzMFQSA5owI+lYwwvZ7x
         YlnZLqyMU0zzTGsRNQXBOlrSrQILKrBvYBotteA/8j8P6snbhbktGTmKdIUpYrPcW4Sh
         k6Qg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o8FeLLiX;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ci9-20020a170907266900b00a1b7fccf61esor2267956ejc.11.2023.12.12.04.35.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 12 Dec 2023 04:35:09 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o8FeLLiX;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702384508; x=1702989308; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bTgCkgY7q586A21zu0JSDs5UTTpVyxNoAlIlHHAmSdk=;
        b=o8FeLLiXQYBF2JveSmwjkHokvpy80em+vd1izeIF88uKFdGEb4GjeRuAWC85ZJpB6A
         l/CWauKIjJUXDHB7eN1Iynjrh8RO7SNko3t1ivApN8X6GxrJvkFHJQGgGdAgzyf9zeLO
         RHQfTlQ5khYp20xzjEjvY8pZqGB1lLF+6FJUiCISZ2vwCwq61umzndjrtZDAdbNJeZ0Z
         uxgxyMJvDjYWH3YDZZUmaEbhbTH+ORwookUQ4yi7Pd2TG7Jpo5P3ltxmZ9Q5RyjJvAMR
         yqXkRHXwvTILImfXW/gSLVyBWJ8NoyaCDUAhotTBWFlZUwZa95T4BOF6BGrWEURTNF1W
         6GxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702384508; x=1702989308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bTgCkgY7q586A21zu0JSDs5UTTpVyxNoAlIlHHAmSdk=;
        b=aJn6+tMUeXu5fWwEP4AXSNmHuCpI2O7kyABRL6YvXi70EXHkyRbu5ECg+79W7ytlA1
         Yk0CU0L8A06ojU9BbiS76H+O5yMmd1fS8viTn4XnK9xtv1/UptPwB/SqqqJxLTObNRBj
         CNlvQCMRfOUQexcu+ySaZqhVqD05rjIiJRH/28XUuEOcMTynFnlu0izFnR6as5gmSO7i
         w9lMLMgbF3QR4IWLOU2lS8JePLK8D9kDi+YadQTzOff8K4BlnmH7cUvrs7ZqK1bCChHv
         3dVrZ2RTHrsHOOYkS5FQP9onl3jmOohqyptAWHTIT/nsfP7WG1gdxrrywaaIyYJmTSFV
         noDQ==
X-Gm-Message-State: AOJu0YzNnqXdFk4KEcGCFi2hrNATx5+2qlkjIYR8C33aD7lOgXqubTlj
	Ww9hIvEgVPPZM1xLAak1v8tYb809
X-Google-Smtp-Source: AGHT+IEt16zUWRyTHtNuGb/0o+4ATMzXgBovHPXmuXe8Ekl+s1pTnuW+RElZyl/OHB8C6idjWqn2/A==
X-Received: by 2002:a17:906:51ca:b0:a19:a19b:55db with SMTP id v10-20020a17090651ca00b00a19a19b55dbmr2697065ejk.107.1702384508710;
        Tue, 12 Dec 2023 04:35:08 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id wb8-20020a170907d50800b00a1cb351dd4fsm6233385ejc.9.2023.12.12.04.35.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 12 Dec 2023 04:35:08 -0800 (PST)
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
Subject: [PATCH v2 09/23] host/atomic128: Include missing 'qemu/atomic.h' header
Date: Tue, 12 Dec 2023 13:33:45 +0100
Message-ID: <20231212123401.37493-10-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231212123401.37493-1-philmd@linaro.org>
References: <20231212123401.37493-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: E+cQtcOylmMy

qatomic_cmpxchg__nocheck(), qatomic_read__nocheck(),
qatomic_set__nocheck() are defined in "qemu/atomic.h".
Include it in order to avoid:

  In file included from include/exec/helper-proto.h:10:
  In file included from include/exec/helper-proto-common.h:10:
  In file included from include/qemu/atomic128.h:61:
  In file included from host/include/aarch64/host/atomic128-cas.h:16:
  host/include/generic/host/atomic128-cas.h:23:11: error: call to undeclared function 'qatomic_cmpxchg__nocheck'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    r.i = qatomic_cmpxchg__nocheck(ptr_align, c.i, n.i);
          ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 host/include/generic/host/atomic128-cas.h  | 2 ++
 host/include/generic/host/atomic128-ldst.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/host/include/generic/host/atomic128-cas.h b/host/include/generic/host/atomic128-cas.h
index 6b40cc2271..4824f14659 100644
--- a/host/include/generic/host/atomic128-cas.h
+++ b/host/include/generic/host/atomic128-cas.h
@@ -11,6 +11,8 @@
 #ifndef HOST_ATOMIC128_CAS_H
 #define HOST_ATOMIC128_CAS_H
 
+#include "qemu/atomic.h"
+
 #if defined(CONFIG_ATOMIC128)
 static inline Int128 ATTRIBUTE_ATOMIC128_OPT
 atomic16_cmpxchg(Int128 *ptr, Int128 cmp, Int128 new)
diff --git a/host/include/generic/host/atomic128-ldst.h b/host/include/generic/host/atomic128-ldst.h
index 691e6a8531..12e4aca2da 100644
--- a/host/include/generic/host/atomic128-ldst.h
+++ b/host/include/generic/host/atomic128-ldst.h
@@ -11,6 +11,8 @@
 #ifndef HOST_ATOMIC128_LDST_H
 #define HOST_ATOMIC128_LDST_H
 
+#include "qemu/atomic.h"
+
 #if defined(CONFIG_ATOMIC128)
 # define HAVE_ATOMIC128_RO 1
 # define HAVE_ATOMIC128_RW 1
-- 
2.41.0
