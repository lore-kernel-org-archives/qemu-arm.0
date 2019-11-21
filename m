Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp2732006lfc;
        Wed, 20 Nov 2019 16:09:19 -0800 (PST)
X-Received: by 2002:aca:ccd1:: with SMTP id c200mr5179128oig.157.1574294959403;
        Wed, 20 Nov 2019 16:09:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574294959; cv=none;
        d=google.com; s=arc-20160816;
        b=TKUOEXvdJB63NhE94KeS9s9bfH8cjGfYlO1YcqGGM0qkDoVJp4zY6qjKy6qxAlLbqS
         GnIsNfr40Z1CI7EfGnp0El1W58BaI0Lx30aa20Z3IvcfBzET/fSTAfkkuWWdFNGyT0PH
         KovP/8chLcwJPrXa9HrUhwcCCcprxiuibCQZCGpjPAntxKziRsTLHClofPbTW+upi8Am
         SN7ZYeYMa5sWYdGRTO/MyLy7KcUMlJg0SObxeKkERV5mDHqTs542jo2nWDJHrD/cy2L4
         KFYoMu/lel1wUC3wknbzMitUMv2D+I9y/XSpJEo5Q+LslmOoS+03w4lbpd5Y1LhPIWmY
         twug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=RzXz801WN8Wx2siaVGOD6DywcY9lAErvVsKc+KJI/kM=;
        b=nfewe2e/zIQJEsX2T5nE3a3D4p6//ZImO38VHKPsxbw/PmtacZOAk5wNSLK4XTxU8+
         55OCTfZkZK4Ae9Uq9EoAhaM8RwaoLvCJ/Ssmveo1lAcOr55VzdqdY9RFq+UiT3HCvprV
         tqhAVdFZz3AzZGRpyZCE0+4HJeLlKMQbMIX7gmED9ipt5wlEkL9lCfG3Hkxa/CEGGYhG
         QkyHP5GieAO/QQLrz/WdzEhxFIryFIBXKA+m/OzZEwT8j0dxvtoVTLgQLcKXIfQEdIf9
         fsIGOHg+8vEiLFHTvLQuaUAgEfRn6uihCilsOyC9pcXR+GEfm01piTlIGYMiyRQsZ1hR
         ViSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vnfxoDEL;
       spf=pass (google.com: domain of beata.michalska@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=beata.michalska@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <beata.michalska@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id t206sor353324oih.147.2019.11.20.16.09.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 20 Nov 2019 16:09:19 -0800 (PST)
Received-SPF: pass (google.com: domain of beata.michalska@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vnfxoDEL;
       spf=pass (google.com: domain of beata.michalska@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=beata.michalska@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RzXz801WN8Wx2siaVGOD6DywcY9lAErvVsKc+KJI/kM=;
        b=vnfxoDELTvt6Rj+4jtN22TJcn899OQga2bZHWcpp8GwkPO0dWivtlxz2UIogyVyEhW
         6J33yNUhPj2foQbzst0gAmfepIObCDuTHtC6pM7xkOgSscB//EohEuPJgGKaL3BjuKLp
         C35g8Cx8QIOg90YO4gzskSGGprNRDJEuH2X8vpKKehWvRxYX84Xu7uMUmthcXvV2Qtmv
         60FgnvkJC7OInqDzlRqefSRMUIhKLjMlegGqGaLV/aXrfuMXXJiLRYY+bp2STDA/Pd8p
         ANtCmFJ0bFnA54sdA6cyVTP8mVVbTvpnGFZ//7IXKOIErwkoSZHgeqKQV7nJiBcbpd7Z
         A3ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RzXz801WN8Wx2siaVGOD6DywcY9lAErvVsKc+KJI/kM=;
        b=Uy2JkzVW7nvD6tKLMAJ63+b5id1t1TASfcqVXp8BuOF+60KwpFhJqaISDJQMQQb+Yl
         YWGA+TtRBmx9m9/5ji8jMKH8emSXp89ZzDrLp5Kq+wZ4aWwSC0JQqDoH2VYL6Zdr+sRP
         G0UxDJRmgvxi2aYVAeX38ucKcegTdYbj7OfkC1PSoA3UIIIH502CqttclmykKrFW7+0h
         D+KmEc+wJxdPSbesZAcgYkfOsVDi33l3NGX3t4SEo4plPkSiwBr8VWAGH870P/ErqrTI
         8VdSTpG9AM7sfHUkCKfqqZRESsoqyVYwq7Qj9tjh8/TQQRBImcY+5eELOibYWG8+Ss7k
         S1pw==
X-Gm-Message-State: APjAAAXlbKYOjcPRKvAy20hZuO3m6+9m2NuKf01kJyC3aw7reOFVQEZe
	lCPxkkzblG5ebHeFAc26bXHSUJxKhcAGRUZb
X-Google-Smtp-Source: APXvYqxxgq/skakxNDYVibmtjreM/9kF6IQUV7YmidOKqK2cN/CTVo39otn6Fbj9BkFpWEMCW9rw0w==
X-Received: by 2002:aca:4fce:: with SMTP id d197mr5319084oib.142.1574294958980;
        Wed, 20 Nov 2019 16:09:18 -0800 (PST)
Return-Path: <beata.michalska@linaro.org>
Received: from moi-limbo-9350.arm.com (host86-181-127-240.range86-181.btcentralplus.com. [86.181.127.240])
        by smtp.gmail.com with ESMTPSA id z17sm351439otk.40.2019.11.20.16.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2019 16:09:18 -0800 (PST)
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
Subject: [PATCH v3 1/4] tcg: cputlb: Add probe_read
Date: Thu, 21 Nov 2019 00:08:40 +0000
Message-Id: <20191121000843.24844-2-beata.michalska@linaro.org>
In-Reply-To: <20191121000843.24844-1-beata.michalska@linaro.org>
References: <20191121000843.24844-1-beata.michalska@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: c97YuR8Kx2mC

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
