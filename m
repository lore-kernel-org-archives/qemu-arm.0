Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp636542ejb;
        Fri, 26 Apr 2024 12:42:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXrIH36R+0yYCd6yUkrISw0VjWe90l3xDXJXNwOZavOL3Y7or1epju81TDgdBQtjA3FvbA78eum9sn8RcyI/fSgQ+zVDiwr
X-Received: by 2002:a17:906:7f03:b0:a52:6435:ef09 with SMTP id d3-20020a1709067f0300b00a526435ef09mr2679688ejr.76.1714160559992;
        Fri, 26 Apr 2024 12:42:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714160559; cv=none;
        d=google.com; s=arc-20160816;
        b=iDHFi+xPbhuiPse8N2vNa+gfqvxO8l+11yq1ebLs3rXZgfe0C8O3wWi1kjkkPIYZKW
         OmnHT/q+3KH8WhF+NilFSyODRdjyzGbkEgAU5OzxYXjbmqeIXFOC6eANVXtSf5g/LKb0
         n+uxGp7gmWsmRIUFpYPgdmzbPmaYx6slBX4Q7f2pMJlI2615rGcYu7CpVvRXYsC+BSBS
         5VgciKkW6aKdSwMBMo9KlbPfynTFWNTPgfOo+R8Kdno0OLkovfpL33P+UKugqqDJWpu6
         uXKrg+u/nbPaHPNawjRhUSOJpPdOpQnT4TXT44XcKygbs81aifyFmSYk8UuTVlDIXNEg
         l13w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=4X/VhmwXvkdhIQuo7rHVj9w7BkqzRhVw95Tx0jafh5o=;
        fh=dLEaXY73ExIfLMGqtPopie5q8EWV8/78NJxXPwK34Ac=;
        b=ffVR01zVeggMj2ZGBToFqN5m1I+BQ8kKuM8qwW4GNwdzEL5GC+HsHvpt4kFhAaTuJj
         c9hXyfPFIhFR8lId6Kx/n99PLgSp6MwVnpmEPKlBEbaifcT2VWYm2+mpz3+6bQnqDifE
         75nCxdPvoDaVAYgJgK3y4qwPEsL13gNXqDPObcexJVRzj1GelMik4/vekLKvtggI73v3
         +89t863mysVZA1HU0HXuwYmeuLRLcqVidEk9V/UxFNf01/AhUIc93YvXavH8uc4BTqmm
         +SGMr+qU3boIt1FRp103r59VTNm/k2oTr9sLp0B2kN3+STLHsHkAGPkAQuqoBLcu5+/p
         hhzw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P3Mm0d5y;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l13-20020a1709061c4d00b00a5211f8bbf8sor5091909ejg.17.2024.04.26.12.42.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 26 Apr 2024 12:42:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P3Mm0d5y;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714160559; x=1714765359; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4X/VhmwXvkdhIQuo7rHVj9w7BkqzRhVw95Tx0jafh5o=;
        b=P3Mm0d5yApOiOwfb8OPCOI5yPuipOfO9S2Y8nScdcQPfG/mQR1MoeMwzWXfhxgrVXX
         UpuVpQPRl5mVnM1MNu5XRS4CyWpKMrgOkY6XzVGiOD9Y53bxdX7It/xukws+vogN6c1o
         Gv1rlRJpDna/SCpKE+bbBe6YwO74EcwFvJRxp3/uwU+fA7/4ddktHE1ObVacAVYucY++
         0dnLB1BvJR45z9T57+Rc7Ls0MqxKS/cEi2SFbCdOVH/es2Mry+DDQIMRNEpcosuCUvSO
         yp7iE1MIQCIKI8MOd5H5aiZ4A/pSlLWJs/+HEtY5Eh+lUGZb58kL+6axyG/IpwoSOZrL
         Fjew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714160559; x=1714765359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4X/VhmwXvkdhIQuo7rHVj9w7BkqzRhVw95Tx0jafh5o=;
        b=qifWHVHolIqsQWTEYYAz8gWqF2k2IROZqMowkdkx4RGQYtMWnrhR66Ua61KcxJeLZF
         sOW1qbZH47gAXH9qSD95TLCVrQdvf5CSklc87mNcSQe2iaHyE1H6swB6n2UEXH8NG9cw
         gsrC0gFeixgg4V7eA1XGOvwyEprQMaYCzhntj7QFQiZVhLdR98vJAOTupcDiQyQND5nV
         BxumgCILkuCwxSyCeBD8xrH1BE2ETA9LZ0r39aH/VP7A0+DIXy9RbCg5sOskTDFt2poQ
         CvjyfpqNWlD40D3UT5neriE0eCG0ahz53/vqfBR+NuWWeYMh2q2Qq4dDBJ4lEp3HzMOv
         Uk4g==
X-Forwarded-Encrypted: i=1; AJvYcCWRtjmJfMQD82PRPgVQ3n8+6RvMlXTvi6g9KOjcketR6icq3Y135xWS/Admif0HHt1ykCLIBTlxgk/BVLR6m5GLeTqUTpcs
X-Gm-Message-State: AOJu0YzKnMyQU06gG8Xd9OZKf2RZiSwAGT9x1G9q4qgcX6dAzqY9hdbB
	yq0JFygt6KruInNgL4SRsHgGBuX2SoVgG3wgfOaCABL7T6JTLBMIstm1x8tWi3UVyw==
X-Google-Smtp-Source: AGHT+IGxJBhgvUwhhWCAgenYBiSIUi2w5crKR0/10WrNMXoZqN9Fol3uSvd/ZTOG18vXH6erYN0+GQ==
X-Received: by 2002:a17:906:28d9:b0:a55:63de:9aa9 with SMTP id p25-20020a17090628d900b00a5563de9aa9mr2581937ejd.49.1714160559645;
        Fri, 26 Apr 2024 12:42:39 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (aul93-h02-176-184-11-147.dsl.sta.abo.bbox.fr. [176.184.11.147])
        by smtp.gmail.com with ESMTPSA id n11-20020a170906b30b00b00a5242e285aesm10798927ejz.184.2024.04.26.12.42.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 26 Apr 2024 12:42:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org,
	qemu-s390x@nongnu.org,
	qemu-ppc@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Warner Losh <imp@bsdimp.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 06/38] gdbstub: Include missing 'hw/core/cpu.h' header
Date: Fri, 26 Apr 2024 21:41:26 +0200
Message-ID: <20240426194200.43723-7-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240426194200.43723-1-philmd@linaro.org>
References: <20240426194200.43723-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 4/rC0LBT90J0

Functions such gdb_get_cpu_pid() dereference CPUState so
require the structure declaration from "hw/core/cpu.h":

  static uint32_t gdb_get_cpu_pid(CPUState *cpu)
  {
    ...
    return cpu->cluster_index + 1;
  }

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Warner Losh <imp@bsdimp.com>
Message-Id: <20231211212003.21686-15-philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 gdbstub/gdbstub.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 9c23d44baf..9c2b8b5d0a 100644
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
