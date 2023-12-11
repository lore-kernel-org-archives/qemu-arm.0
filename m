Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp492583ejo;
        Mon, 11 Dec 2023 13:21:50 -0800 (PST)
X-Received: by 2002:a17:906:c7:b0:a1f:84ea:d8ce with SMTP id 7-20020a17090600c700b00a1f84ead8cemr1287170eji.44.1702329710291;
        Mon, 11 Dec 2023 13:21:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702329710; cv=none;
        d=google.com; s=arc-20160816;
        b=VHxvOnAbdOxNDQUBl9h3bEvtD/fazOTU7AVCgagUaDbim+09pIZuEgk27Y2uaSVj38
         KH7wnMBcFQuTXHT3r8snPCDCNolzajxD7XvQIdqslRB7DChIZwhF1OYqy1mFa0FXN1DQ
         usRwupOOhyJ7cwZgCm6mN4ws+DeQdSirKpJaH1bg99MfMOfI+kZmxNrUoIUULJ1y6Awj
         sxmwXnkXIeR/3anrXp1Kpr5dkxDpa3fCRLiOodD0p2ZzZGp1fHdpTGTYjU+UnWu/eQRT
         Rx9nBRoRw5+42tcrWTACZ5FUiv8UIY30+V0wOdgzjxUUy1bQl5GDMC4FD49b7q4XGpBv
         6chA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ctY48Y/OwHlinQy0HeLOez7IoCqO19a0AzhAC5KFtJo=;
        fh=6uA3yvXeN55FEhLQ+7xhayEyGzy+Y3z2qOYV5oRrcR8=;
        b=QwKZtRB8xuK/A353RgmADgMhtZQlBtt22txsgqFu9WlFHLq3tQMoAxhxt8AqUcvcJB
         iQbWZNrQyTbcy1nnmJjiGIhSPJtOTkIlQK3+8KK0m6j8nQjgDyLELUsfHiq2ee+MMPUd
         d9jrQj06OshFpmNI/8l3Bp6rheaDBF2YPHfVDZkb1dH2uyywSyqfj4jmY472O+fxgCSE
         TjfhwMPSHJns7B36FAdoiB5NgPfmdl+egp0Y4mdlWBmJW2Yk5FPFUlSLRHFvKTJD/uNm
         Db1SHDUknOt1wtKW8xdL3RlkRrhwOn0fMw4wImN1yiMWWxp9/3/iujArOyec8s/Hp9G6
         FH4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W3aMASx5;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ci23-20020a170907267700b00a1f6eadc110sor1510368ejc.13.2023.12.11.13.21.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 11 Dec 2023 13:21:50 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W3aMASx5;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702329710; x=1702934510; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ctY48Y/OwHlinQy0HeLOez7IoCqO19a0AzhAC5KFtJo=;
        b=W3aMASx522hB9VRJ5ArV/fNjf/9EjY6O/66joq1pRV4SDUh+TggD7b2eEdw89SQakG
         Axdf8e1W1wmok6F2cLm1pmjfyjufcQPVqcbX6GTM2BZVe1+TETlmUW24ZL34Z9OJilql
         LBukvW6RJN1CKwnZfnJzHWfY5gO3aX/KOFFJTNmtpoyuuQl3Wdsn/beCgf9/fqPL9XZ9
         OpDAVNXqKOULdRIKN9JWKTOinaPYmZv8WQ5sISjHqETxrdrPEMvCgbfFwqhqw7ttwv6A
         rMe+JQ6qHmjn2kKCqQ5Ig86z+rSc0m01fU0goLYst2MKmXmHfDYJ1oeu0hocnheAtf67
         RJYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702329710; x=1702934510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ctY48Y/OwHlinQy0HeLOez7IoCqO19a0AzhAC5KFtJo=;
        b=G1LN2BflhO4i0jpAcAjLEh6BXwLk3J5UWjiR6+8sYKm/MnsqXEZUmeTYHrw3qUyRxv
         w9TEYxd5w80yNUSrwxIYnBRNnZii3C1PeShYQoh88Glh106ezb2LmFHUgvQR1v/pEDtR
         c6ybS8YWZ+50MTN5m0KYoY1bxbkixIZvCrYJeIZWh8Stftn0Blcjludp6uRAMFGaTAlm
         NthCBC+UyjM4jhI2u/Dzccx2ZKRMsxpCLi6fuQfyYFHEhCOy8B3o/7iQjLwuj53NpFx/
         gdOJSHkb8tCNnflW23QxBzeGj7lyb0niq5fPcrdB9j/tkzR+LRPxgmFPp1/o1sJ3k6sz
         TRlg==
X-Gm-Message-State: AOJu0YwuEOHlxgQK5L+IWkpX0uebdt70GlRH8GLwUbjyfnLyEhqeSFKY
	8zjjilUpgxVs06+wzmMBWbYWvBZm
X-Google-Smtp-Source: AGHT+IGCuHPmu7XBcoyZGbS/1vv337vHf9v2rTtqCVC+z2TYZobgtGzbWjHW3TEMn/IMi+AiZLh79Q==
X-Received: by 2002:a17:907:94d4:b0:a1a:8399:e12d with SMTP id dn20-20020a17090794d400b00a1a8399e12dmr1806037ejc.64.1702329710085;
        Mon, 11 Dec 2023 13:21:50 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id wb8-20020a170907d50800b00a1cb351dd4fsm5350843ejc.9.2023.12.11.13.21.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 11 Dec 2023 13:21:49 -0800 (PST)
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
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 12/24] target/i386: Include missing 'exec/exec-all.h' header
Date: Mon, 11 Dec 2023 22:19:49 +0100
Message-ID: <20231211212003.21686-13-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231211212003.21686-1-philmd@linaro.org>
References: <20231211212003.21686-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: jBWPMtnw2+Ys

The XRSTOR instruction ends calling tlb_flush(), declared
in "exec/exec-all.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/i386/tcg/fpu_helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
index 4430d3d380..3bb018fbae 100644
--- a/target/i386/tcg/fpu_helper.c
+++ b/target/i386/tcg/fpu_helper.c
@@ -21,6 +21,7 @@
 #include <math.h>
 #include "cpu.h"
 #include "tcg-cpu.h"
+#include "exec/exec-all.h"
 #include "exec/cpu_ldst.h"
 #include "exec/helper-proto.h"
 #include "fpu/softfloat.h"
-- 
2.41.0
