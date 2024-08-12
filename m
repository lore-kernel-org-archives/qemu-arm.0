Received: by 2002:a17:504:6454:b0:1be9:327d:8ee3 with SMTP id g20csp768303njh;
        Mon, 12 Aug 2024 06:06:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUgsAU2ZJluXdl+JTXPBg3gXIZtk9ez8+q2Oa2ButyWlS5s7M/sVdmTKuYz1BWEYKCMyyD7wSefa9vopqXqIKw0U3/9/TQA
X-Received: by 2002:a2e:bc0a:0:b0:2ef:2d6e:58fe with SMTP id 38308e7fff4ca-2f2b717861fmr1759211fa.32.1723467979846;
        Mon, 12 Aug 2024 06:06:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723467979; cv=none;
        d=google.com; s=arc-20160816;
        b=zh0G5IXXDapZ9fp9uzmz8f4imAUoU7R0mYni3b6Ij7ly2Cet3AvNl1s07nTJhcRSSj
         aK8JAXstPbiMPRr56WDZ0lwMc2z9/VU6jN8GC+BXvELQfI9NAuTxQqRWEhSegDYy89Yz
         H+9e7R1Jv+wsRwtYh+FOj79ojS5/bmp4NCNzZO8JSobW9vhw5S4E6X91ykWnvG+R+S5/
         vSdSUViT2vEBefQS3UE/EgjzI5BLh807Ds9wZ2y8v2lrQ4z9ZXgtRwYKL2Vsd+G26Q15
         mACTCzayxdtIYEQoPRZ6UJhy7kN2H1nVdyAEtMQYeqRZCjWHH1eyfWgcyMV0RW18VbyQ
         RLDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=q0MBRxvJH0y/bIJK1xHx6k1kVCY+2jxCQ2h5fP5Rdc8=;
        fh=fmo/vNYyq9AzTVh4vE/Bgqr1OGm1AmGP4vhu2XbHkNQ=;
        b=ADGxZXf6pFXhyz58DidTiVBS3o24VC++QrF4YLPiC7GH7ZOHLFtbXnMX+Mkp4SC8f+
         AFNv9WrLoR4vsx4A8d2rq4YLBTMTos8Hyc8jUJ7GrTS0+BZ1Xgx6JfFTlRA3ZkUeb1zV
         mnXZrLwaSC1VrxPGyKb+znOcfGK/aZY9M6jB57m5tpf4fsqReaoZF73y2cMMcCLqo6Kj
         EtsItgL65Fkl+gU98z8ObpoHzG3PHJlH2yv3Io4ex/Wdnt6xRglDZ6gsPISrsAkGoHo1
         QomXXlC6GUQ8EQdPI4KDa98u7SGTNLATgZbbblUBVlJiqZO2uTl9h59cZ0Bdvn582h0j
         Y/FQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ne2G0gfi;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 38308e7fff4ca-2f291ddbd50sor6634301fa.1.2024.08.12.06.06.19
        (Google Transport Security);
        Mon, 12 Aug 2024 06:06:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ne2G0gfi;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723467979; x=1724072779; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q0MBRxvJH0y/bIJK1xHx6k1kVCY+2jxCQ2h5fP5Rdc8=;
        b=Ne2G0gfiVNM2ndKEOfjAI5CDYtJtb0nVZn8wgTc5w18kttq8EgKS+UfgDRYrj5kbGq
         edXDHq3N4AM2AgnpAkxUzHkntprzFO+PrWNGucgip3pNBmKQ3ArGf380Y1Nbdcts493D
         10Kd+zJyIo2faSUM6ZrcQkuQcOPFwNv6VXvyFk8sCqI8nKURXSUKIn2DSKndFufH8zPd
         qceTd1aqGIHSxWZOw3N5BJj4I9Pqx0znD4GS4J8aZSJK+s50Fu745FBbPUC4htAGx6Yf
         4tIFVe7rvjFKie51Abth2WzOZOnw+LYoCARTJHLc3CNkJr0JCPlmuHbRBa3MNvY3F2Rr
         AvfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723467979; x=1724072779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q0MBRxvJH0y/bIJK1xHx6k1kVCY+2jxCQ2h5fP5Rdc8=;
        b=fsnSeHHw2r95i02gDSBlxGbl0S0v3z+jdPLVEc9+j2LZ+fC+2D1IDLTKh6pVLSlTrR
         4njsmYZVFRMbhMYxepgduga+U9m1GwCkS/yS7VD8blOfgKvQwu+s9rkF/NJblQrzdy/4
         EZlXF5k54vl4wDMBF/gmSMRcskl3oWRzjVwU+u38mURjj8lFemx9wrkiAFZYhvWRNz5d
         K7skeUmniL0kmGB9ZN4D6+qFqZEIyfs7QAeIfnbX4ZE4iPwr1XAEW+S6+LUPS+nvGs9Z
         uqdBZ29Z55uusYdhUSUxLt99Q6Gwt0UdP4rq9xxB2IdqiVZQnKA7VoSjP6z+WnrWNx33
         QLnw==
X-Forwarded-Encrypted: i=1; AJvYcCUhmMtNbhHO6yNDfJV+3jhd1FyE5k0D8VOQVy+nk4FJzzfQFVtbK6b0O851uy7pKfCjMpVVSxkRHFMVeDuHGKUAUGie9shB8RuZYO5yKBbsEsnJT6NUsIRzrNOfzrDfuTU=
X-Gm-Message-State: AOJu0YzSSG/zU7S1QhPM13ZITBP0cS2Ts8zBhaezKTfVw7Wd6a16dPca
	lUAj1npBHB/YATPjqLLOds1p+3nKroPJ3LnGPYSn7dKPm4e+pxgT
X-Google-Smtp-Source: AGHT+IFl4ehD3FYz4UFHWYeyrWigmFf76jU/CdxDFMCU8WOzXI0nnlPyTlTXorwYYcOTf9CmvnlIAA==
X-Received: by 2002:a2e:8e6e:0:b0:2ef:2b45:b71d with SMTP id 38308e7fff4ca-2f2b7154f70mr1527581fa.24.1723467978593;
        Mon, 12 Aug 2024 06:06:18 -0700 (PDT)
Return-Path: <edgar.iglesias@gmail.com>
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f291df57cbsm8687111fa.52.2024.08.12.06.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 06:06:17 -0700 (PDT)
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
Subject: [PATCH v1 02/10] hw/arm: xenpvh: Update file header to use SPDX
Date: Mon, 12 Aug 2024 15:05:57 +0200
Message-ID: <20240812130606.90410-3-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240812130606.90410-1-edgar.iglesias@gmail.com>
References: <20240812130606.90410-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 0NUaQCE6fisK

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Update file header to use SPDX and remove stray empty
comment line.

No functional changes.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
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
