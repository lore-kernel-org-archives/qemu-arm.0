Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp29688wri;
        Tue, 5 Nov 2019 15:41:36 -0800 (PST)
X-Received: by 2002:a1c:46:: with SMTP id 67mr1330321wma.51.1572997296670;
        Tue, 05 Nov 2019 15:41:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1572997296; cv=none;
        d=google.com; s=arc-20160816;
        b=tlUuNE0MEXLKSm7O2swQHplK5j8Zwgu2y1tKLfouvMR6xGKHi40ks9rRNjlZPIJVbt
         JTFXLN3+DQWyCe2HPQ1lCLJrUJYoYOOhG2UHno02lGP+Y/VqiZRlpM4bJJBLeUw9P/JY
         pxo+gujYPxPNJJ524DdAfIn+OnPbGwQ6pA1hWGBhy1QR2pLlKEGpOTfIP7tzV6o+/Gla
         BO17eXRoRoL5ezIw51bTGQqCeG1Be4zAleDGWeCm14DQ553YgzKsbfGawCwUEBoZ61Qg
         szQ/0dbj88JvA5O0ROmObwBNWSVQRSKE/CDceX7HbMTB/whe6RRgGGpFZ3TX65qNfHim
         OXzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=RzXz801WN8Wx2siaVGOD6DywcY9lAErvVsKc+KJI/kM=;
        b=Z6qxvvn0kzqq5HhfpKt0OayZ0i6rnbvz0w1jBoXxyRkTgfPfcZZeHx/fVb0EXHSIMk
         tUOWod+LV/IrSPipx5sWne0OSFHnCBCWRmX7FnUakBxYm5skw8sMtUuxS17VOhinVKsG
         6ftEPup1XY8VpVs1A1XSeRtE3rPr+r4dXt0rW8XegHSwJT1Am3sLqzwc6KHWvZJDqeFx
         ctVTZSP37i7SwMh2rUNUrpc4Zf6TPBT+e8WhmAS2wMeANwb9M2cegodV/B0IIdnjkyPk
         Ik0/AXN04LI84ci4EMlwZFbAMH4vbnZwutcXUe4OA1xefstyxxhj/Yj90r/YPa71l1Sy
         UNFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AuSe0hVB;
       spf=pass (google.com: domain of beata.michalska@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=beata.michalska@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <beata.michalska@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id u6sor14153203wrw.48.2019.11.05.15.41.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 05 Nov 2019 15:41:36 -0800 (PST)
Received-SPF: pass (google.com: domain of beata.michalska@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AuSe0hVB;
       spf=pass (google.com: domain of beata.michalska@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=beata.michalska@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RzXz801WN8Wx2siaVGOD6DywcY9lAErvVsKc+KJI/kM=;
        b=AuSe0hVBeklV+RVM2hnDJCbwpAIF4Z34BL4zM7yMYZKcHOZxyxaNgfQrW8ZV8e2e++
         mU6fdzUZqxpe6oeiDXzA9uCIoSJgVAhr7b/1QtNaRVNHvUBIUY6Bxm7G53FA5K4NPGBP
         GJ9CZ3oqTM9W9cQI1PIcE25klx96XF5SI8Gl7A9qc0jz4/DEbFLlCrTcO9BvbruNLsSK
         tmOKG1nUQiVkFT2dRCSVlZfCqlryUNsXrx6ZJlbnHlgsnfZP6qlzw28VHIwg5NpK3UBz
         rRNpgLBG/ZYSofRzRYBaA+B/CL5/wezGWuTonyTcxRinVMLyG161MlWQ/nUg3xsn/S5X
         s/Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RzXz801WN8Wx2siaVGOD6DywcY9lAErvVsKc+KJI/kM=;
        b=Ur+tNxdNoNNNMjwZEQ1OfebOzetglwOZ7kMCrlLqvbKQFFZL3xohjjA08PMdXIK+oM
         tA1N5DpC2zXuQEHv9i0wFYNM+1YqcyMbF/QMYsps4L39oMtHIYk1aD27Of6MlnyJtzNy
         QPMF0q/G23izoVAcByfHHk/Pb9YyW8DB1d2rG/url8TO4nc43CpMhCJTVgYd0+9XWPFW
         BGX8SGFsSVUcZJFr3LtY69r49vRMENAx6m+b9+kx8y/t/QhH0QL3m8+BPuS0v2NnDWSn
         KpRKxfp1gZ+P9+3eAf6PkW5xw5GnN7mk+oWUm96bjt7AkQVjNJ+AxGBIPpRXdkNpXsYZ
         jc5g==
X-Gm-Message-State: APjAAAVZNbUDkkdCef6n2Y6/Edv/wbkGVsDctSXqyUsxqIFdnaZspQo1
	BFAIjxlMLhwYIDYbaDRxfZGMq8pk
X-Google-Smtp-Source: APXvYqyJwJv+kQe8FbjKTbzUGqNNcZWRvqFVq0poixXXwRZvPFUTVnAURAYcejKoEutFVdFYJQErCw==
X-Received: by 2002:adf:d850:: with SMTP id k16mr25717671wrl.204.1572997296466;
        Tue, 05 Nov 2019 15:41:36 -0800 (PST)
Return-Path: <beata.michalska@linaro.org>
Received: from moi-limbo-9350.home (host86-144-13-94.range86-144.btcentralplus.com. [86.144.13.94])
        by smtp.gmail.com with ESMTPSA id q25sm27295010wra.3.2019.11.05.15.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 15:41:36 -0800 (PST)
From: Beata Michalska <beata.michalska@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	pbonzini@redhat.com,
	quintela@redhat.com,
	dgilbert@redhat.com,
	eric.auger@redhat.com,
	shameerali.kolothum.thodi@huawei.com
Subject: [PATCH v2 1/4] tcg: cputlb: Add probe_read
Date: Tue,  5 Nov 2019 23:40:57 +0000
Message-Id: <20191105234100.22052-2-beata.michalska@linaro.org>
In-Reply-To: <20191105234100.22052-1-beata.michalska@linaro.org>
References: <20191105234100.22052-1-beata.michalska@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: LRJGf1rmW/Kh

Add probe_read alongside the write probing equivalent.

Signed-off-by: Beata Michalska <beata.michalska@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/exec/exec-all.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index d85e610..350c4b4 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -339,6 +339,12 @@ static inline void *probe_write(CPUArchState *env, target_ulong addr, int size,
     return probe_access(env, addr, size, MMU_DATA_STORE, mmu_idx, retaddr);
 }
 
+static inline void *probe_read(CPUArchState *env, target_ulong addr, int size,
+                               int mmu_idx, uintptr_t retaddr)
+{
+    return probe_access(env, addr, size, MMU_DATA_LOAD, mmu_idx, retaddr);
+}
+
 #define CODE_GEN_ALIGN           16 /* must be >= of the size of a icache line */
 
 /* Estimated block size for TB allocation.  */
-- 
2.7.4
