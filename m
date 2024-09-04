Received: by 2002:a17:505:1f8d:b0:1be9:327d:8ee3 with SMTP id pt13csp189224njb;
        Wed, 4 Sep 2024 09:15:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUsWwLVhp8lA1LETqMK2k3TqoVDfi+J/JKA+JqT5l8abposdq5Sp1kCC+PAFzs12Gtj5u0Be/1j+m6enw==@linaro.org
X-Received: by 2002:a2e:4e0a:0:b0:2f3:f82d:bb21 with SMTP id 38308e7fff4ca-2f64d4b59dbmr30731301fa.29.1725466546669;
        Wed, 04 Sep 2024 09:15:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725466546; cv=none;
        d=google.com; s=arc-20160816;
        b=U+h7C9NCVFdJW6K4nHd/f4rWykwX3rak7I9nIc2yYBsDCHJcIiXUayFXw91GrvpKYQ
         7NZME8CUjeoTNhMz5yq6IRzZayEU8svwnjjOZrMnxu+k7tXsURV7PwNyy7W+/kwdP9sZ
         SLAdao7tAf4HXfZ4eQrscjlK8HFrWMwQchZcnqkPNhrrFIPSz19rXXksI792oVXS8s5r
         fyQp82bGmV2WUofBaYsCSR0WJ6BNWNDNrJr6DXgHKy/nJ5/CfnKS6ZELFcNS3pZItwiD
         a8OMpx/4ir56uWg8FbT9sqC6LUnBKbQjOYUilrd6ww4QcBviVDUaVfAmGP7ChV99o4XN
         b+VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=cXrv0E3MFlFU+ItFyAOjyjeGygFPyj9i38Ckg44wQ0M=;
        fh=yo5dzPvVBVjyLqWVGRiDtCigJGsC+R/zx1AVq/6fTXw=;
        b=iNEmgHM4VJ+iCGY2+KrafluBQXcPQdnaIAdITOkcKy91GfJqGRWJAVVu6an2naQx8l
         Sin4uqHZ0chtT+K8qd6U1nctIetoYtzDaKoT4USqo+d4UYOWQuy0yZFgeVqj9z+QhvWf
         fDzYoQ2F9L2+Vy91+plA6Stsw4WUWVmq8nhm3cIC48B5aENbow7lzY7lFyENXhx8g4Cd
         HOGKwRkngJ8JcGEvYuPVzlw1YCH5lt83LUL4CxXCjsNa3Rmlcub0lhST2zNZ2D2N7Iig
         pLpJiFS/PsB3vUK1VUNWNii+RMhS1a+wxCCbPCwvhaAJlwZUu88Wbv1n0PpTxbQVfCxi
         rqTg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=hprWNLd8;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 38308e7fff4ca-2f6151743d8sor24475091fa.13.2024.09.04.09.15.46
        (Google Transport Security);
        Wed, 04 Sep 2024 09:15:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=hprWNLd8;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725466546; x=1726071346; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cXrv0E3MFlFU+ItFyAOjyjeGygFPyj9i38Ckg44wQ0M=;
        b=hprWNLd8SdiiU63PbwUVAsB2cTAYXtQxXhFdJP/cdQykUyLKixlo9D4T1SfTuJ14Ba
         mDBgNKPiVQcJG+i0WgRJhXcSFbkqZfdVFg28CFTOeWCKludTrb+Of4ipNibQduyxiG0P
         Fbtm9gcaBgJInM/tqpEUO46+cJ20kJzXFf4c2VymVW1QGf+iabIPomqvSVkuGeh73+wl
         RZBCOCEwpNRGzUqKsVXbVfSaFIjBbq/+R7OrJk3gy6DYp5hprpvrPXEHEHbiVpQ5YUdQ
         FNX6f4rCcRu2H1jX+jhwr2HxzpT5t57rliDRO2yaStw6cn++CrUxQSXiNfEUkSspUnpH
         eCCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725466546; x=1726071346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cXrv0E3MFlFU+ItFyAOjyjeGygFPyj9i38Ckg44wQ0M=;
        b=DDEmqIleQ1lrn6RGDaOB0o9SQ7NkwOfYlGkKdNLHK9RtRTqstdNOO62jOvaHmkP0uH
         6oqlgSaqyqppXE5HPnL8Nsewrq4w2467m24I+WIlg48E+um1rp2Wl3fbVjdqQdJ1B2//
         rNyk14o4ra55QX7WeRxrt4K2bDCnbfGwgMRY2z1zZUQwFyLuNAutWwyAz7SEiD6CPsML
         +Isw7++P0IphC/gWQr/uQJ3HKgHUoiPAWn0gQ3gCqYfUFjuhPxKcOXlpxKlwE/ODc3Bp
         ObrwsLXX0TFbgpWVxEoC15WqvzCk9Nr1hmdJYm4Xm+BPf74bUJnErc6fjZFGQEVG+3Xz
         J9Bw==
X-Forwarded-Encrypted: i=1; AJvYcCVvqOJu9KiWm7zYZfOr0dYKBv71rkOy2Cb7IG++2Ym09b48RvONM2HlIiYcVeWGxndarEy11HIrfSvwgqreqQ==@linaro.org, AJvYcCW2UdtGlTScVY8TmfN+17A3vnw7bwhCKODzRJCHAb7xV55IgKgl3jsvoZXhvmdu8wgsUcvOrIUGmtroBw==@linaro.org
X-Gm-Message-State: AOJu0Yx+a4GREYsTMz+mSxUDZ9hXGHqWA33EeI66bO2ANFS+rWNMjjEN
	gvmlPbL4gEhBxf13C/7/rw4gFU2eGcGhcx3gdiJvECXQPLY/m87D
X-Google-Smtp-Source: AGHT+IGAyh4WUxY9AfkVPMwTqyaGKO5sye5d21g+iPTe1bXZL4tYnRRSXSRVmyNk0vZJE9XGQJOMBA==
X-Received: by 2002:a2e:a586:0:b0:2f3:f4e2:869c with SMTP id 38308e7fff4ca-2f64d570e98mr37440521fa.44.1725466545191;
        Wed, 04 Sep 2024 09:15:45 -0700 (PDT)
Return-Path: <edgar.iglesias@gmail.com>
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f614f0079fsm25852041fa.37.2024.09.04.09.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 09:15:44 -0700 (PDT)
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
Subject: [PULL v1 03/12] hw/arm: xenpvh: Tweak machine description
Date: Wed,  4 Sep 2024 18:15:27 +0200
Message-ID: <20240904161537.664189-4-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240904161537.664189-1-edgar.iglesias@gmail.com>
References: <20240904161537.664189-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 2si4cpleXKmN

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Tweak machine description to better express that this is
a Xen PVH machine for ARM.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 hw/arm/xen_arm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
index 766a194fa1..5f75cc3779 100644
--- a/hw/arm/xen_arm.c
+++ b/hw/arm/xen_arm.c
@@ -216,7 +216,7 @@ static void xen_arm_machine_class_init(ObjectClass *oc, void *data)
 {
 
     MachineClass *mc = MACHINE_CLASS(oc);
-    mc->desc = "Xen Para-virtualized PC";
+    mc->desc = "Xen PVH ARM machine";
     mc->init = xen_arm_init;
     mc->max_cpus = 1;
     mc->default_machine_opts = "accel=xen";
-- 
2.43.0
