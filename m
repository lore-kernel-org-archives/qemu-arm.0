Received: by 2002:a17:505:4c56:b0:1be9:327d:8ee3 with SMTP id do22csp1569247njc;
        Mon, 25 Nov 2024 11:59:27 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWkCIXcqew4ZFnIhYr21fz6qzwbSfPcmNanjaluuVb0WQsFuPPE+csECUl6Z/k0ONlfYmqlVydVM5PJNQ==@linaro.org
X-Received: by 2002:a05:600c:1e10:b0:434:9c3b:7564 with SMTP id 5b1f17b1804b1-4349c3b764dmr58639895e9.20.1732564766824;
        Mon, 25 Nov 2024 11:59:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732564766; cv=none;
        d=google.com; s=arc-20240605;
        b=Iy0T3yo2Q/oAlQUhlT3TqSg+QLndrn8BsPH8yN/KuKv8NzNdYuvV/fTbU7lMMG5nYe
         EAsdoT6qtJjS91NFa9HVi6Klws8SkP7qhKBomGnpmqWgfAh5sST9eU5uzKrNAZJR9kdA
         cJY4Pwvlpw6YvBVCHEVWv1ipIEv9wLINO9Xqvy6JZO30DFYZe93k6UdUyUYVdUrXkciM
         +TB0LQRGAAf2bidBOhOjWpP2cwQElGOt9dg59ritdl9oemnl2V9hch1+jC5TJW/snTxx
         /LTmr8Okh1iptA4yt9ZJe9qXbwpBA4LZN45F2zxHroGyg8RjyDmSFQFSFXLZeVjjTXQT
         nYMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=AUUGPkOeOTTu2+NC5FrYwYu1VqmCribZfZ+rxUCPPlM=;
        fh=M+rvFRatTQL4YrvDNQ0n6yaO/GUTu7jQMqcsTJ9XeJM=;
        b=Btj7GZCyejz/aDzGhLCyIBULJNRfNuqbcsFR9fbSK+FTMxwCFcZlM2scxGWo8v4NkQ
         CwCvuWvSPTD3xnDM8qEzJOeMAumZgRxX7cYi0pbtq2pDbRMavy0GLVH8OWQQsPR+lam3
         Tr5ptVu/DhICdxVlAeo9HoHoZNFh1/kaEJ2whaWOeJRYjwmgA2xTJFUBV9Kf0UV5ar/1
         UpZwk9K+n0nO0NLYzhviVmyjDQnJVmwsdrCqilGjK/eGFnoyIKNnAy+RD/eISEBF23Uy
         HB35KZRmEQdbCkZJvjqrVb7MDiWEEdNGR40s8rF0fV7U3I/o2qi1du7CwKuxJ/gYS+Yi
         Ic/g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vLCyAa8a;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-434a4a654cfsor2557615e9.7.2024.11.25.11.59.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 25 Nov 2024 11:59:26 -0800 (PST)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vLCyAa8a;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732564766; x=1733169566; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AUUGPkOeOTTu2+NC5FrYwYu1VqmCribZfZ+rxUCPPlM=;
        b=vLCyAa8aPXwvWCOUhwYplsfGUH+0S8Nhm2eXkXFVc7Z9ZXPHuhqwLOMk/MkcYRqNN0
         Mjj2i35FkE+vk8evrzpoNxS9oR9n07FATUBH3o1mh0YlWpM61uVnGJBhvHUIoiDDY9Tl
         2zTdujhNH/b+G16U8RyNiBW904IUIjr7wDUh7uCHV3NsWbEbBNMOvW9rUtYfFEBzeWVS
         aJ0yySlzijZmJQUfOWh4/wUnICl8GwKXwn+ONjgU3ojuCaixhvt795S2jja33MHIlgjf
         /+5YQxEAhpDNq2uDqEs/cDjDwdEC8Nwpi2BuBCa0N43lnyhqZI0GUTZaNzLth270f20n
         8z0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732564766; x=1733169566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AUUGPkOeOTTu2+NC5FrYwYu1VqmCribZfZ+rxUCPPlM=;
        b=We2kvv9BZHnG2vTQ1dHkAUvIxQ2UivjPtMb15x31/U//AbTqcLakFUsagNLuNLr23u
         t/Ux+ICK4V2l2JA1gTuXsmdZScgp1JGd+NnlXTBBsw/hi8xRNOTpTbr8QLubSASgdXuL
         jeATfhb71c6IG/Uv3O9DiDdzyCZQg8mBFNMPKrYbCeHgDbRN5Wc5Lo489v0Kj4Ts3iNg
         drdwDR+bchrU0QNjYMeQdKR7LI5J8X9aVJHPUI8erGWB/X7jLr74iSzQClxmtGQtYLne
         tuP0lEnGL/qyC+WKaDeFq5spQO73URomOgU7TSSn0Dqq06v8IPxdkCltezMmlO9xf9fb
         uKpw==
X-Forwarded-Encrypted: i=1; AJvYcCWb+H+P0KG0pSCRrgz1jKlc+B8i1ZDc1I+yxVeMZDBkE6zblMG+wxkq39n4YvMbq9McD0S/P2x18xLMgA==@linaro.org
X-Gm-Message-State: AOJu0YxdLACv3a6sxEgN5ngtXb4WWw8VxvfzOLOBJpqN4i3cAzXiH5Pf
	OtPG0EG/RxXr+CZwcupw7gp/NDawtzPHLK04ww+h2GiHELrDmR5uJcVYsmPazIBDQQ==
X-Gm-Gg: ASbGncvr10ZchelsA5TXd47z0PpDtH+w3LBVX89TamQrL57R0AtjTSLuX24qO8njfFJ
	1ZiN/eg1dmiF8wnd1VIN/Y0RVaTQZmWYdiR6naEXmh5m8ZnmyeM6bZIgbkonbIoHEwYY0EO1o5i
	gDGh1b+Ak5o/Vq2ZiPl08rXpHa3+Nsn2U3ukhCBaW8JGRQ6vD8/7Sl6r0GgTeGPipTqoTjjj0z2
	GGgpuQzgHK+RXenhd0hyQ6S6mgYynip/XGHowWO/nxcBkUOZ1CrCuQQSgnYy5tfgQ+v
X-Google-Smtp-Source: AGHT+IEKfTHdZFW+oj4dYHwYt+075eZ/vDoe3cPOa5Tj6NfVEo8CowgGjm+2FvHfVf6gMGEwUzHcFw==
X-Received: by 2002:a05:600c:3b25:b0:430:5760:2fe with SMTP id 5b1f17b1804b1-433ce4c2218mr111110665e9.22.1732564766349;
        Mon, 25 Nov 2024 11:59:26 -0800 (PST)
Return-Path: <jean-philippe@linaro.org>
Received: from localhost.localdomain ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fd0fbdcsm11237971f8f.109.2024.11.25.11.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 11:59:26 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org,
	philmd@linaro.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	alex.bennee@linaro.org,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH v3 03/26] target/arm/kvm: Return immediately on error in kvm_arch_init()
Date: Mon, 25 Nov 2024 19:56:02 +0000
Message-ID: <20241125195626.856992-5-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241125195626.856992-2-jean-philippe@linaro.org>
References: <20241125195626.856992-2-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: ejO5UsNrg2zs

Returning an error to kvm_init() is fatal anyway, no need to continue
the initialization.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 target/arm/kvm.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 8bdf4abeb6..95bcecf804 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -563,7 +563,7 @@ int kvm_arch_get_default_type(MachineState *ms)
 
 int kvm_arch_init(MachineState *ms, KVMState *s)
 {
-    int ret = 0;
+    int ret;
     /* For ARM interrupt delivery is always asynchronous,
      * whether we are using an in-kernel VGIC or not.
      */
@@ -585,7 +585,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
         !kvm_check_extension(s, KVM_CAP_ARM_IRQ_LINE_LAYOUT_2)) {
         error_report("Using more than 256 vcpus requires a host kernel "
                      "with KVM_CAP_ARM_IRQ_LINE_LAYOUT_2");
-        ret = -EINVAL;
+        return -EINVAL;
     }
 
     if (kvm_check_extension(s, KVM_CAP_ARM_NISV_TO_USER)) {
@@ -607,13 +607,14 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
             warn_report("Eager Page Split support not available");
         } else if (!(s->kvm_eager_split_size & sizes)) {
             error_report("Eager Page Split requested chunk size not valid");
-            ret = -EINVAL;
+            return -EINVAL;
         } else {
             ret = kvm_vm_enable_cap(s, KVM_CAP_ARM_EAGER_SPLIT_CHUNK_SIZE, 0,
                                     s->kvm_eager_split_size);
             if (ret < 0) {
                 error_report("Enabling of Eager Page Split failed: %s",
                              strerror(-ret));
+                return ret;
             }
         }
     }
@@ -626,7 +627,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
     hw_breakpoints = g_array_sized_new(true, true,
                                        sizeof(HWBreakpoint), max_hw_bps);
 
-    return ret;
+    return 0;
 }
 
 unsigned long kvm_arch_vcpu_id(CPUState *cpu)
-- 
2.47.0
