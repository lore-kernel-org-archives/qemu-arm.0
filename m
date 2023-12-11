Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp493288ejo;
        Mon, 11 Dec 2023 13:23:25 -0800 (PST)
X-Received: by 2002:a17:906:106:b0:a1e:f7d5:695a with SMTP id 6-20020a170906010600b00a1ef7d5695amr5285291eje.2.1702329805660;
        Mon, 11 Dec 2023 13:23:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702329805; cv=none;
        d=google.com; s=arc-20160816;
        b=ikK+tSWjfMBTkQO4y//C/QRf5ZA/0phrf7keok8JKpDNBkdtywsssVJtl3rcn1YlXm
         bEH/4IGtTkzS0Dt22Ja1gCO/l9GWvVM8QspuyO4gl4Nj0rCruW15o6asXoyKTfxP2aNJ
         StoPLSpWvYl/3BZ1uRI24DY0zeoNj/GAg6XlAudwDEa3g5XOg7fgG/L6ykEHNFWgcJNn
         1QGqgM0Yyd/pvr4GjPmSGw6sh5kM+7zo1MGXmEXMbOZ9NFhB1/FGq4QVUWbv9iyjKk/y
         LWL5a0uAXglMztVK+jWwtWVlBgFq5oCbDxmNGp+RigWJMCjVisBRbIvKa1EazodFkjeo
         K9mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Mqu2MlgIdZS3QyZ/aQC1T5TlHEjoxgX9tzjZABIOL+s=;
        fh=I8Gv4l+Mvngg0xR5KeDSIN3bWIMQV7ABjXENGTHK57g=;
        b=NXGFyz3avIU+2GO0C7niwM5t+JW/B4yAxvZ6ZdUt4uULmXQ6WsNsLmIFlfStcnRbqZ
         LE4Nl7pXA0k7yHeHInpLV0ZkuyJgSG1z6BF67PLd+N/Y+NRELNtQguPkFgagbfWJApbG
         +FQxsq11vy+MGiEKPlMC1ub+y5HAhJiDZKqcyYxYjtfwf8eZAdnQcMzoXPyTqBjR5rCM
         YPcyVnkm0sB5Md9kKW3FLoMFTACPqDLRD9Guck2JHaqsxQQV6B4Els/uRkdSnXDL7jAO
         qJGxXdi/tPON2keILqemUbkE5wWW5mkPqDl+H1kig43ietwkr10YBLcstHqD2wCup/HV
         sNrw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LKkP1KoD;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id hz7-20020a1709072ce700b00a1f8a1e952csor1794138ejc.8.2023.12.11.13.23.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 11 Dec 2023 13:23:25 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LKkP1KoD;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702329805; x=1702934605; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mqu2MlgIdZS3QyZ/aQC1T5TlHEjoxgX9tzjZABIOL+s=;
        b=LKkP1KoDiYHCslnKHi4MNBG5gMQv4UDAbgdOSBQoxF75lXWKrF77A7QgKxX3k0KeHK
         AiVpVRPKXCLkDKEa6W7VKwh9Zd/T2qXia654ouE57v3gTTZBtZRwXa/4WscqOq/gxSeJ
         JE1IQnaza1GAqyKFaZpVW2t2eIrUoJaJ5t0JlTJ72RUzvpfxPcHh4yBgxCPl+nmHQMq5
         vwPrK0y6oxrhRhrJHxk6gC4oWD87b1ZBotkIYusUn9WO9+VW/k6AiErtQQZIwwyHTNA+
         L/v+NNKkoxfujurbJ1yd3OImJ8t9svrhG//ZYOOH0orSuJhJGE+JPfX6EOkRyfCr/EsG
         4Vng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702329805; x=1702934605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mqu2MlgIdZS3QyZ/aQC1T5TlHEjoxgX9tzjZABIOL+s=;
        b=drankZaGn2CD/90HX4LDX4RhziC4iz0cvhSlQSN/XfVl7EP5H0uexw3Dliny0wV2OV
         Y16xSoG4WzQe31VTuMElCZ8W5PCsdEfcbrJ/36xJQi1TsZ937XFQP1Bm49bQOqaooD4A
         bXl2n+7K8yUh2KZR2W/adXOlxpKjekrEysrLtZv5lz3hXajTlT3fyohgM55lQOfp1Zts
         l1s8boB+5+xhVhyYahyE/JqB2Yn4g072jvReJedo47PJTBQTNqvRARuLBQPtc/AJ/CnE
         keUvGNR+3Rilz47rySprQSfMIA12ioLCaN42k6bRHT3n6ZZogk0aJWPypli2pQXpvWVa
         9ClA==
X-Gm-Message-State: AOJu0YzmKcTviR8CGmY7MjippW717UMxqn0kbSju9PNcZMY6l2OtfYNN
	bdYKmjvadi7f2LXPNIVXwTccFyNS
X-Google-Smtp-Source: AGHT+IFn8/3rk8CtW9OM9MwSkcANYhGT/MeN5C5V5YIFguGIcvrA/lPPLRPS+jv/cd9Ds9KT/8JIBA==
X-Received: by 2002:a17:907:20aa:b0:a1c:6e3e:4873 with SMTP id pw10-20020a17090720aa00b00a1c6e3e4873mr4173217ejb.43.1702329805455;
        Mon, 11 Dec 2023 13:23:25 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id vv9-20020a170907a68900b00a1db8b08610sm5437885ejc.148.2023.12.11.13.23.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 11 Dec 2023 13:23:25 -0800 (PST)
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
	Song Gao <gaosong@loongson.cn>
Subject: [PATCH 24/24] target: Restrict 'sysemu/reset.h' to system emulation
Date: Mon, 11 Dec 2023 22:20:01 +0100
Message-ID: <20231211212003.21686-25-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231211212003.21686-1-philmd@linaro.org>
References: <20231211212003.21686-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: sHnzAyRJACgI

vCPU "reset" is only possible with system emulation.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/i386/cpu.c      | 2 +-
 target/loongarch/cpu.c | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index dfb96217ad..17b6962d43 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -24,7 +24,6 @@
 #include "qemu/hw-version.h"
 #include "cpu.h"
 #include "tcg/helper-tcg.h"
-#include "sysemu/reset.h"
 #include "sysemu/hvf.h"
 #include "hvf/hvf-i386.h"
 #include "kvm/kvm_i386.h"
@@ -37,6 +36,7 @@
 #include "hw/qdev-properties.h"
 #include "hw/i386/topology.h"
 #ifndef CONFIG_USER_ONLY
+#include "sysemu/reset.h"
 #include "qapi/qapi-commands-machine-target.h"
 #include "exec/address-spaces.h"
 #include "hw/boards.h"
diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index fc075952e6..b26187dfde 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -17,7 +17,9 @@
 #include "internals.h"
 #include "fpu/softfloat-helpers.h"
 #include "cpu-csr.h"
+#ifndef CONFIG_USER_ONLY
 #include "sysemu/reset.h"
+#endif
 #include "tcg/tcg.h"
 #include "vec.h"
 
-- 
2.41.0
