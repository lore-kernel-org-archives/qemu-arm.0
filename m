Received: by 2002:a17:505:1f8d:b0:1be9:327d:8ee3 with SMTP id pt13csp189211njb;
        Wed, 4 Sep 2024 09:15:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVyCKs8se/m701CuBmd+GBanaMs5S7iuYwa5iFCoiR+ke77RlMF0q7v8jhD4UWwYZMluGeE+4naOkGGhg==@linaro.org
X-Received: by 2002:a05:6512:3a89:b0:530:ab68:25c5 with SMTP id 2adb3069b0e04-53546b1e1d7mr15258269e87.2.1725466544252;
        Wed, 04 Sep 2024 09:15:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725466544; cv=none;
        d=google.com; s=arc-20160816;
        b=vqo3HE65YeHh8KYOs9MUTuYtJ9AERbZU/+AvNUyxaoh0ibb81GOIfnjdCw+eXVa2S3
         5wo7ErLSkmWXecb2J2s+P/NAfRmYvXBTUrTG2Psu2SMdEpkHVAq4N3bjpMTdApiWZNkK
         /FDmpMKUDNuoDE4s6zCxSJGxZR9+vO6s3X7AdIkpf4Kk0AEY0rLDKQEZvPAWfSw+TICf
         9CqJmW5Q+iebPTHwDilVhNE9fZgVrqUHIfkjdP8tTcozLd7OHbMDO3x/8wUVr7c/PdDG
         7jXt0Q/SJriUuf5TSGZhPXdmSAkCdZuCFkpOSX64+hRKOhfkDq/Bx3aoEE5Qccjd1fr7
         amYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=N6K1JnQDB3GxWbgLc2L3O0RRJjZo+EVTDK5d5nCO5jo=;
        fh=F6cBGQm6qPrkWsaNOCgRfoDa0/iTrG/2cT6w0rZO6Z0=;
        b=ktcQEF+gUU6/eA/2xJ9f6monRtvaHLqNYKiKbjHnIDUFF44cK+jmZeIykCrN3PsAMo
         QMPsQtfalC+YAb5numiSJr6mf2W9DtOXId3xEgrdaXWd407Pzr3UgYkvrQURUsHzpOdT
         NIpgA021pN/EQ1tCSMgTqi2JrkbIECZSyZ9tnWkiQr8OtEhpOrcSCFyy8rCFoF23Ijvc
         Q2DjruLz4zaxRIPyJnXOKiPy7dl/hx2mVmooYqubfqzCqKlD6ayBBP9FiSWdtV0U7Ft2
         TGwr3nQLH0YhI5eIJMXiGp4Ut6ml54RiEhLQZkWCyOdMWiEz4diUEdqVq8lWQsn60Z+z
         9eyQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=F7ThivWP;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 2adb3069b0e04-53540776377sor5327358e87.3.2024.09.04.09.15.44
        (Google Transport Security);
        Wed, 04 Sep 2024 09:15:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=F7ThivWP;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725466544; x=1726071344; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N6K1JnQDB3GxWbgLc2L3O0RRJjZo+EVTDK5d5nCO5jo=;
        b=F7ThivWP4JVBc1SFqbFWRiZIt88/oxi45PHKQnPtSuxgehfBfEMZX/B0xQ4SrZNxX4
         /vxPrVQ2vK8cBjDpqscvsoxENvLN/JxYrXIIur4So+j737dedDjQVxOfSdg5gcvHtBs3
         woqHS28U0J64nt7PvJpBVJz4sQJClgkMOrNT7Hz4OZc0S09ldqdLYfdhQz2KVwd+tXmd
         wVzJwtDFnvcx7CG+Tn2v5AAgh+j7KLVePqphwezYxFFTKpqTIe3Rg4t1jAMlDjOM7bsq
         3NZtfwd8H42EXB6ALfJsEop9/FaBzrt53bCgaZm7BoWK2RoSCoZNaXV0oOWIQtumJhMm
         wHaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725466544; x=1726071344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N6K1JnQDB3GxWbgLc2L3O0RRJjZo+EVTDK5d5nCO5jo=;
        b=qCG8UtXfL8r4cuzn5t9eUOtTqd+52UpB2ShEe+JvsgiQbqH42Ow2/QQZF89IicxubB
         AFwrf8Rdp2P4DbSNDZpr30hp0VVMHET87NJXMl1HHgRDaIHIvk9/8BHzKahQDNuEcsvQ
         mM2te+kYiXphbAJlLthAGmRRPLc7csNIok+KCbgRWMtfPNhRBk319uvTgjvrAt5I9nqa
         Y8LNrTRDklJEKyvICJjjJ+YwJR0gyEHfkgAWXifA37PG+uf7hpb0s1JZsBGnyOzNOPss
         fxvyb0Mut2/oEUqaLcn9gCBcs69hU/wVi1KwC448D6vZUZzCapQPIld9Q8TAfo0t/IAi
         yuYA==
X-Forwarded-Encrypted: i=1; AJvYcCUQiEjPdp2gjnKUF9l5xNIVikwzumeVsL0DUn6aUMQBidPyx3VYQnn0hPPYuXsrV46GXJOp0Ydev9YbKw==@linaro.org, AJvYcCXlQGsV2OEl5rWz/puMVEyeG9pzzMAnoxa+8GilnibaPZAu4NZHhJ9QhF0FwD5royJV+q5CP+EqT4mTaVnnZw==@linaro.org
X-Gm-Message-State: AOJu0Yy8TpLuvQe4E0tj77hzeE8GemWsrCoqNIknlBEhAEVFX9n2PpGO
	8CHu1d07C3u59nPFEniAe2gM7jrYFpFTWPpPF8AEgdfSGY03blEr
X-Google-Smtp-Source: AGHT+IFom4VEXuZYnoDrA4HGURvL615ZNQmYPSqV45hP6uADwmwNAHyfJ2jP5ftIt03oSUiu6NVu1A==
X-Received: by 2002:ac2:4e06:0:b0:533:483f:9562 with SMTP id 2adb3069b0e04-53546bde03emr15776888e87.42.1725466543416;
        Wed, 04 Sep 2024 09:15:43 -0700 (PDT)
Return-Path: <edgar.iglesias@gmail.com>
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-535692d9bf6sm176315e87.41.2024.09.04.09.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 09:15:42 -0700 (PDT)
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
Subject: [PULL v1 02/12] hw/arm: xenpvh: Update file header to use SPDX
Date: Wed,  4 Sep 2024 18:15:26 +0200
Message-ID: <20240904161537.664189-3-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240904161537.664189-1-edgar.iglesias@gmail.com>
References: <20240904161537.664189-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: rg0X7wb0oql2

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
