Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp3178631njc;
        Wed, 16 Apr 2025 01:15:12 -0700 (PDT)
X-Received: by 2002:a05:6a21:998c:b0:1f5:8179:4f43 with SMTP id adf61e73a8af0-203b3ed3ff2mr1091707637.23.1744791311978;
        Wed, 16 Apr 2025 01:15:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744791311; cv=none;
        d=google.com; s=arc-20240605;
        b=MSE6nmVwge99NDqdpT14HoHKwmlwvHpJXMdfS/4YtIKfgGbhGVpvI+lizF0nRn1Z9i
         elHFWI0z4WD34e9UkSg23urrVSrn6Gk8ruOXGdBCF81HMdzWOTQzwR+UwBwLIJq58SXj
         cK9ukRFoegdkh0T2ain0cTb7J0AEQEwBOS5No2qPzDsYxWnPEKxpNasltALkWETypC/K
         1OB61SKMbxvVznwHo7bKhmTGoUpyuTevKMqoJ0EqYZvDXCXtvVAxtcSAUvopPqn/KFmW
         Tl/9xBvmRUksz6sIeMhNfPdaI+ugJkQYzuTIl+ieaz5R4i4ir63dJX9OuItP3Jy9zpz8
         3/3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=+SwF/zcvg5LcbyTBGVajfiTYVcj76iSNgPiX/V8HAlI=;
        fh=mUYHwmV9/VV+ZgBh64BfM5NWEWABbCtel7J9WKq5ErQ=;
        b=Q+kHxzc6LoLQ17paIu8cKJs6NsEOCMQSZoiglwzwMHuCZp81D6/6bEj8h/t+sFbhP9
         kx8CJKASsoWK5orZRYzBODUg5SReFewOH+qcu9uHV83BzEnYlJiCMtHgGop4XhT10d2v
         new8mT66cTPbYLPjpcBugUGkpXuXvhcyISV8sxnS/nCFPgiUHpHnq1BvFaHY3tlaIDOP
         BHuWbUqiu2IBmiG1PdMLbCNtnmfsi9eEHoqNiaA2z2161YHsfIAyu71DCX6M0b4438at
         EQyWO2MHllLGU69Gpuh0XBRDyH8fsiyRd5lfWtx0OjP9PGtWp1nSI6rlo0d0s/+Yo8JT
         SVOw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Rr3igz1C;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-73bb1c47247sor9015817b3a.0.2025.04.16.01.15.11
        (Google Transport Security);
        Wed, 16 Apr 2025 01:15:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Rr3igz1C;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744791311; x=1745396111; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+SwF/zcvg5LcbyTBGVajfiTYVcj76iSNgPiX/V8HAlI=;
        b=Rr3igz1CcW1Fm/7V2l0H5BakwUxvhh8T37XnCGWlAZ0n5qQYeBG2of3RjYprbfxmij
         FRAC1QxuWEnDdddXtnD8H0eF1lnF9IrqHyuwHwFw6aZg3mYMwrJGX2FDmSWnOhJabHcY
         29PZ6XBIa/84mvaf6MW0GZKPCt2rKEac6D+2I7DYuNUp8wDrRytCbidLIcZ+6f+rotSG
         PKkv1uMoCWPTwlx563oNy2+F5QZUXXkMzfHhyi3MF3vzg+d/X+24flA1FKdXd/iRglQx
         UDWmd0BJ+tgq7fBIUyY17oioniAQEZFpOUP7ggfuYOA3f9Xjob2ynu2pcVnFeKwVgaXQ
         HE/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744791311; x=1745396111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+SwF/zcvg5LcbyTBGVajfiTYVcj76iSNgPiX/V8HAlI=;
        b=v8iZstW0tVEgFxTicbKYhQi/ND9WVI+a1FsasoTD9f/qKiG+q93UAazCJGRRUvN/Uu
         jvKeGgNQ0uyHJjxV4IfSlLQliTnIt0hTk1bVu4dMutw5TRxVx02hXY7MAtuW+qyXfyyu
         7XgL2y/rtPPpSpbVMsP0N/px3Fi2JLdXtAS4Cn0aLSgrbLXi9Z358uz/RoPCpFG+MWr1
         WSs1G9cv41/7kUvoqO78k6s05e8O21D2qHh+nehKDanL0UakguyywPktRO1pypEEpXY6
         WU0ENxBAL8xzEUE3S4cMZ0hGEbiqTpTuOGi7dFlKSVSZ8YhC0FZJ73lfDK/gT2qukDYv
         OWBA==
X-Forwarded-Encrypted: i=1; AJvYcCUxoYOZ/NNu4EhtmXabdRU2J3wc/CXcCY3tU4zLRoBISnN4w4Z6WIy8wqGNcdGR7Qr7YjMQhlUc8mAEFe6tRYZz8hE=@linaro.org, AJvYcCV4ufW5wQJ7bAROzGuKJeWC2JyvOIsQFsuiHEqMjl0XTTM30rfPgIxK1IO98NevWlG3wOJzwTXcDtS4X7yy@linaro.org, AJvYcCXhk5CQ75LNFl+sUiDDwUcskaM2aMRnkAeuytuYPkqbdYi9xQFltWXdj/T35pZ9Zf+Pie9v2+eAlLMWgf0O2TfngQ==@linaro.org, AJvYcCXzf15GqSFfjuUshqnHkVllOOd15r9J0zXUncytOLqlh35qvdRsslIdJaUwh9Etc0gjGTIqkGg/@linaro.org
X-Gm-Message-State: AOJu0Ywt4BSSAkp7EbAkNDpdygROkZ4gkYmjnaX+EcUbzxyNedUaa+20
	lQufOtEVDCwVSr+vBYqcZ5NEeojF0uNnzldFEJm/zDjHxiXcY13M
X-Gm-Gg: ASbGncvGF/iX3IFIg/nIEuqV6sfc/UVtAPG0iVvSZ5tM0G2kEBIZjWF0Bb7LskbPUeT
	C2NoIum5i3rq26/xk+VyodyBYsI7TxWstX26IM/iHUhSkHnjYf+2MT04rArLlOLhdyZj9hWpbkF
	8VcUT2tgvq6WWNQeQbMz1n4ft50dYcdc8lfd+/Hvgu519XgxYJEG3c8HsQkiJ+nYdqFA7oFmi+9
	BXrnnvdD0/T2FbY1CBfXmIJjlExZu/xZ/6V2epAjNui0BFRWy4WboKJrYL1R7rrdabP/ytCLsxA
	BwJz+MOOAikIn3SdD1+z3rV9u6UHUKSmchlYI9qRrTWol896+532hpdsfQ==
X-Google-Smtp-Source: AGHT+IFcRXS74eGqHFoObLFx38Z2SJtnXeKU/q+O9awZgeadeFbL75vkrelwK4pBvPI7MLCNBkk4gg==
X-Received: by 2002:aa7:9a84:0:b0:736:46b4:beef with SMTP id d2e1a72fcca58-73c266b9c4amr1660367b3a.3.1744791311267;
        Wed, 16 Apr 2025 01:15:11 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from localhost.localdomain ([240d:1a:3b6:8b00:ee5a:e672:7d4c:d43])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21c3263sm9839445b3a.38.2025.04.16.01.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 01:15:10 -0700 (PDT)
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Kohei Tokunaga <ktokunaga.mail@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Pavel Pisa <pisa@cmp.felk.cvut.cz>,
	Francisco Iglesias <francisco.iglesias@amd.com>,
	Vikram Garhwal <vikram.garhwal@bytedance.com>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-block@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH 01/19] hw/core/loader.c: Fix type conflict of GLib function pointers
Date: Wed, 16 Apr 2025 17:14:06 +0900
Message-Id: <44e9ef95ea6e8aa33560ca8580db0033623f0e91.1744787186.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1744787186.git.ktokunaga.mail@gmail.com>
References: <cover.1744787186.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: URGMpBMP68FF

On emscripten, function pointer casts can cause function call failure.
This commit fixes the function definition to match to the type of the
function call using g_list_sort_with_data.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 hw/core/loader.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/core/loader.c b/hw/core/loader.c
index 2e35f0aa90..93a8b45d28 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -1410,7 +1410,7 @@ typedef struct RomSec {
  * work, but this way saves a little work later by avoiding
  * dealing with "gaps" of 0 length.
  */
-static gint sort_secs(gconstpointer a, gconstpointer b)
+static gint sort_secs(gconstpointer a, gconstpointer b, gpointer d)
 {
     RomSec *ra = (RomSec *) a;
     RomSec *rb = (RomSec *) b;
@@ -1463,7 +1463,7 @@ RomGap rom_find_largest_gap_between(hwaddr base, size_t size)
     /* sentinel */
     secs = add_romsec_to_list(secs, base + size, 1);
 
-    secs = g_list_sort(secs, sort_secs);
+    secs = g_list_sort_with_data(secs, sort_secs, NULL);
 
     for (it = g_list_first(secs); it; it = g_list_next(it)) {
         cand = (RomSec *) it->data;
-- 
2.25.1
