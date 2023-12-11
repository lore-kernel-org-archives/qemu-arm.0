Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp492428ejo;
        Mon, 11 Dec 2023 13:21:32 -0800 (PST)
X-Received: by 2002:a17:907:72cb:b0:a18:e9fe:2d9 with SMTP id du11-20020a17090772cb00b00a18e9fe02d9mr3701715ejc.25.1702329692328;
        Mon, 11 Dec 2023 13:21:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702329692; cv=none;
        d=google.com; s=arc-20160816;
        b=aibV+/vAd5OiXybDgzOMDYtGE4/DSvkOJuNIrA8z3pLytoADP4tqT//JjsIh5blEND
         DNxf3CcWWoTGl9CPTbGWj8R8Tu9Afb7mgp2ATmY75SC7EMQAoceJG0ndzOGybM2FgK3G
         L7KnuFnZGj2Gn0+E9cnyTmcsZ8DzHKjsgfOjqGdNOdZ/Hcc8L3SltwevTAKTcQpBJ1Z6
         itSb5PeksxKz+SH3oems7CsU44G1LqqqXMemjePKpjQHsGOAc46ntW5+FEvFZuV3IeDT
         JypjnJcs+bWjV9VykvdxzwR26e/w/6FiQqaZSyD3pXOwXFK2S3ZBlE3M8NaCMdyi3d9c
         2jWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=N2w63ljFdqIz1JzgOaJC6yCkuASP8vMkY+wuXlFzHsQ=;
        fh=uUPCw6byahDk/thrbQq8Lwq/REtSwxHAyNKJMizpJnQ=;
        b=tyF/Wf5Lrvc6dAkoL3ZiWsuk2676Qf4XyG+gDtWYFsRCIud2b7Cl3p3wME+ySJFbiq
         6V4kAjVDSmWog4HU8mgU5db7gl5JUYgnr+sTPybv0KC/W9NhaS1puePrQ8vtNI/SJDiV
         vB3Ij92TwfkLZxSG5Mbs8azfexXHjCfsScxqz1fpel2+YgrW8REL/lthS7O6yum+/jNV
         GS5cphqU/9MToYsUFiEhZDh6zLo/uaUTIhLuzFoLOrzcAasliREtCEh9D2xehYnGT9OC
         TfBmneTI4o43hW1CywOOqtccErqCz/pYfDa7N2htW5eIZOr16JLIjPfqahZK3PQ0w1t+
         hRbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ZOpUhr/r";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ci17-20020a170907267100b00a1606da224bsor1946890ejc.13.2023.12.11.13.21.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 11 Dec 2023 13:21:32 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ZOpUhr/r";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702329692; x=1702934492; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N2w63ljFdqIz1JzgOaJC6yCkuASP8vMkY+wuXlFzHsQ=;
        b=ZOpUhr/rLzyW/W/kap7sU1kDb9PuKu7ibVra+h5rDSnxRK87QmZFzGZCUVMFBtUXT0
         7A+Twb4s3O9uL3RANZhkEaXhbPhqbQA40+KmS5VVqHejcVUBLzkj2Col4ekqrqzxAinv
         rOUIMWxcmyEJmSxjQeqbWrpSLsbVEoP2rZn9t24cBcwZQkbTk/YCo36SqKREhsV8baK7
         20PhyueH08b/llA1UMNEwPMpSjW3vCZBFJxjIovB8J0nNP9J6IuaOxvYvE1TK9he56pT
         iLrAUxLSOxmHG4URsCEAK2oWoXWSFmSobD4Abv0FqIOlPVrtq2estiok/eBwb2eCsmHp
         BHQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702329692; x=1702934492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N2w63ljFdqIz1JzgOaJC6yCkuASP8vMkY+wuXlFzHsQ=;
        b=Zdua4f7hjOGqagENUdE6YxsWVpmHBiiZS96Nu/zwzkTfpA5ZEGRVtjqvAKcggFk/PE
         VzIpwTkUqaMwWfjBnwtRcCNmD+BnhSSo+dnn20sSucTA+889iPY/rWIouRW4Aa7cUKyI
         VtOM6/lBSkC1Vxs/ArQ9V/Ce37RRfPBVtCYapsZ319CA26tiC2XJ8kP4LhUac8rVo9vM
         cNRnUXE6hrMjUuflfaaegRCL33BYu72mV7O1JApnOmSIhmzoJGYl530oKB8CVlosKB/T
         xgBEjIYfruqT1flzrw4O2AcM1Bjyx/8PuMUt0EIvHI38CCgf8UUKy4H+xc7GcUovk62f
         N+2g==
X-Gm-Message-State: AOJu0Yx43/SBOWrXiBXpoIqCNcgdWFb0rbSyC9lz4ibW4ya1Uv0e/wNb
	Q60/dWBfEaVWpQeR729+YYbc9qH/
X-Google-Smtp-Source: AGHT+IHPiHbU4zyhYynFno5PODyyp6MkmIQrhrcW4VtRL7mGlUhbV9KC4i0etCle48wLlV6QIbSgXA==
X-Received: by 2002:a17:906:b389:b0:9df:bc8d:fbc8 with SMTP id uh9-20020a170906b38900b009dfbc8dfbc8mr2584832ejc.37.1702329692122;
        Mon, 11 Dec 2023 13:21:32 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id mm15-20020a1709077a8f00b00a1b6ec7a88asm5320964ejc.113.2023.12.11.13.21.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 11 Dec 2023 13:21:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>,
	Peter Xu <peterx@redhat.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Eduardo Habkost <eduardo@habkost.net>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	Warner Losh <imp@bsdimp.com>,
	Claudio Fontana <cfontana@suse.de>,
	Brian Cain <bcain@quicinc.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 10/24] hw/misc/mips_itu: Remove unnecessary 'exec/exec-all.h' header
Date: Mon, 11 Dec 2023 22:19:47 +0100
Message-ID: <20231211212003.21686-11-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231211212003.21686-1-philmd@linaro.org>
References: <20231211212003.21686-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: pi95pgRvPyIo

mips_itu.c only requires declarations from "hw/core/cpu.h"
and "cpu.h". Avoid including the huge "exec/exec-all.h" header.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/misc/mips_itu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/misc/mips_itu.c b/hw/misc/mips_itu.c
index 5a83ccc4e8..37aea0e737 100644
--- a/hw/misc/mips_itu.c
+++ b/hw/misc/mips_itu.c
@@ -22,9 +22,10 @@
 #include "qemu/log.h"
 #include "qemu/module.h"
 #include "qapi/error.h"
-#include "exec/exec-all.h"
+#include "hw/core/cpu.h"
 #include "hw/misc/mips_itu.h"
 #include "hw/qdev-properties.h"
+#include "target/mips/cpu.h"
 
 #define ITC_TAG_ADDRSPACE_SZ (ITC_ADDRESSMAP_NUM * 8)
 /* Initialize as 4kB area to fit all 32 cells with default 128B grain.
-- 
2.41.0
