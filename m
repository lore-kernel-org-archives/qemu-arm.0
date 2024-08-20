Received: by 2002:a17:505:4e90:b0:1be9:327d:8ee3 with SMTP id y16csp341235njx;
        Tue, 20 Aug 2024 07:29:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWA5pznTF7kCl6VQzxmaPd6f5MLIXFv+555jskP6MbG8XvIhStaG8EKGUYXoWh0/mGSxl22k2XOunyxYlm4qZDJaNHo+PCQ
X-Received: by 2002:a05:6512:3195:b0:52b:de5b:1b30 with SMTP id 2adb3069b0e04-5331c6e23a8mr10412974e87.44.1724164196704;
        Tue, 20 Aug 2024 07:29:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724164196; cv=none;
        d=google.com; s=arc-20160816;
        b=FKvNWjLrBP+fd0psXWkOxjVo+OS2Vsk+9IRgTMSQT2ARFh7hpK2VC8WFqq8DrsIp4l
         42c8gG6SpfWIX9dGPyUJdT8TtRWgG/tLUG7ROwp2e3/LXqJhmM+D9XWjaMNBln6hPosS
         3kfWCTZDORfIS86wqIXw10t5YKoaW3nCIFqURcw1WzMVfQrEjDuXjpAV+B8F912liVpx
         s6xWvf3e90wpsDcp+J/f2FCpjA/Gc2a1d+Q0FIpqJMuhA0mVXjOR74UKKdRS4lrPZYFa
         plUsKBG68Lz8v8OrPTCKcVKjg/s08C6W1nd1ZDb1b1CjIrAbt04iqVmE6HU998FcYfoA
         VYdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=N6K1JnQDB3GxWbgLc2L3O0RRJjZo+EVTDK5d5nCO5jo=;
        fh=n+TwEbHmUcr1eccAaw/Q8e+sPw0Qpat+q21hveCiBKg=;
        b=S/w8Wy4eDuroBL9QU0SUXDREq9ZutpKgbIYej8rTqXzsyMI8fD+qq5S3iyZho1kU5C
         XJq9PVypbe3uqaUJ2F5SdM92gyEoEUiz+o8fQcbQRpJ2M5u5t1G4XDXDnNKpRTk4+UcY
         +tXgkP6Wag2TBTfi9KspNL3raDImQVRzKon139kHt85hc05RIdqmYAGSxxl2EGrYzzbe
         Bnj4asNPsk8RTkcF3c1a6Quuj/pgDQrYPR4tXfcDmQCGl95bS81vFXYXmvUTbADZTELB
         qEViYj1Qy0QNWfWMmg0Cwdk13OloLtDq6YQ9BaieYbqfCCwREKr+VnsMkqbKI7pPYq3T
         FR9w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=F2zWFf6r;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 2adb3069b0e04-5330d3a9a86sor3085083e87.5.2024.08.20.07.29.56
        (Google Transport Security);
        Tue, 20 Aug 2024 07:29:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=F2zWFf6r;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724164196; x=1724768996; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N6K1JnQDB3GxWbgLc2L3O0RRJjZo+EVTDK5d5nCO5jo=;
        b=F2zWFf6rqaAilaDQ4ub7FTJd1n4E/a7gkiXydYVECX1Y96JKS24VH9ysVsecsqqmnj
         n3lCqQTCC8iXE9e3aNBYYMkIjl6rCk07Nayrd45BQ1iuEfKN+ycy1Hg4N2DKF0wvLQKr
         +kbHkfPmcpyKIfeYDlBlNnliJweFY1DueyII36sEALCAKUhKJHqS8B5Z0wtI4aQwJQxu
         OEj8fcmItfezxRZCgaEWxXx6bmi6wVsPeehn8TmCwz7yh0s+ghvHZlLl+jv8oG2DEZpr
         znGNoQAAf/+9gpgksAoaWEAn6CCJ3eXtO15A6KxmdxAiRr3udykCDmjSV9qPVvBUf8oS
         ClTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724164196; x=1724768996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N6K1JnQDB3GxWbgLc2L3O0RRJjZo+EVTDK5d5nCO5jo=;
        b=CJr5/5BvHGQvHMY4EBTDOYazxQFhoFY38YUBJVtcWJ3Cc8Oota+YX1Pl3NAM9svh1G
         dPSOsnILjb3DWs99OWgwRgrow5AwoFOmi22xD9Bo/5sf5V0Qqmhbh6wU8spxn2WInuC4
         h7aZhnyT3FVvRF4ueEWnCkNxEZw5XuUZheBMfwpMt8ZJdLReiDwZavihEYnESZKH1oar
         ElvKYZ2ldKq7jQnwYmtmKazfh2K89PPPv7g9mwRiBiHyrAupypslny6ogTf9Iv7bPNOk
         mvvaiQ9lrS5MFrlN1PZLdf936e8dOMMQENIw3zt+6LY4ArxSSk3SqHJTnO2hhu3rp0q0
         d6DQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbmGxqV+VEnA8Q5BsjAE3qvAkTLz1BfD9bw14bBGfNNDvef730WnVxIOP6zpn9bLUm0ym5+7kWys+NniZbANKUpltifRJuJQeEUf4F7A2BAbDfMRjG5PWagNLu+Dld61o=
X-Gm-Message-State: AOJu0Yw0elgcjZwMyRMIA1ijBfGA7GtuHRRBwtde6hmIXYJsO2muRGft
	8ca76LZmydlLDJLgtK+cfi6H5k6IWsom4PLgqwIZ8jrIae5hQLRd
X-Google-Smtp-Source: AGHT+IERWznLEeJJPBmVGgbqZsGGHpjiqbNNsmHg/7CXZqA1iSzt7K9nFEzoO0ph3Q9aeI604W1JJQ==
X-Received: by 2002:a05:6512:138b:b0:52c:e3bd:c70b with SMTP id 2adb3069b0e04-5331c690c37mr9543219e87.1.1724164195374;
        Tue, 20 Aug 2024 07:29:55 -0700 (PDT)
Return-Path: <edgar.iglesias@gmail.com>
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53345d17c33sm53420e87.128.2024.08.20.07.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 07:29:54 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: sstabellini@kernel.org,
	anthony@xenproject.org,
	paul@xen.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	xenia.ragiadakou@amd.com,
	jason.andryuk@amd.com,
	edgar.iglesias@amd.com,
	xen-devel@lists.xenproject.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 02/12] hw/arm: xenpvh: Update file header to use SPDX
Date: Tue, 20 Aug 2024 16:29:39 +0200
Message-ID: <20240820142949.533381-3-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240820142949.533381-1-edgar.iglesias@gmail.com>
References: <20240820142949.533381-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: l9aoYT5phRLn

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Update file header to use SPDX and remove stray empty
comment line.

No functional changes.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
---
 hw/arm/xen_arm.c | 19 +------------------
 1 file changed, 1 insertion(+), 18 deletions(-)

diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
index 6fad829ede..766a194fa1 100644
--- a/hw/arm/xen_arm.c
+++ b/hw/arm/xen_arm.c
@@ -1,24 +1,7 @@
 /*
  * QEMU ARM Xen PVH Machine
  *
- *
- * Permission is hereby granted, free of charge, to any person obtaining a copy
- * of this software and associated documentation files (the "Software"), to deal
- * in the Software without restriction, including without limitation the rights
- * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
- * copies of the Software, and to permit persons to whom the Software is
- * furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
- * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
- * THE SOFTWARE.
+ * SPDX-License-Identifier: MIT
  */
 
 #include "qemu/osdep.h"
-- 
2.43.0
