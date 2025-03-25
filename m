Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2397152njc;
        Mon, 24 Mar 2025 21:59:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWnlfJeYkhuTrAuclXNc9sbvWxWmOoubTi8IFZjNinbHIeeXezhdnvPNscTWgBptyK7nPkzm0kKAGC2sA==@linaro.org
X-Received: by 2002:a17:90b:28cc:b0:2ea:a9ac:eee1 with SMTP id 98e67ed59e1d1-3030fe93e6emr27765467a91.10.1742878786140;
        Mon, 24 Mar 2025 21:59:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742878786; cv=none;
        d=google.com; s=arc-20240605;
        b=ScWBz0N87CrYHBAUz+bwcPvHI+YKU+nDJ2ZWrbrfGiRehzbDrz4r7N3YtrxGDyOaOP
         o4AMLcB+5qDfC2FH2M0BBEcKnDrozCgWYdDQnIvvIUyFr/cIG8Ke2KA3cNhj/YRv9jet
         NfONZW6DMkBuMi39YJ3ZopqXZVcyq1kBfSHSA/rbvx63C/V1O54xBATpxs+lfrydU2RR
         fodF5NEL74GQ9LXCYcRhxIi0CQG/C+G56/KTfjk9iCwgYSTykjijdfsitay1Pc8b0Qo8
         7JpoE9802a6iOXDhC7ubD1dURNLkpg9OEQcEaPUK4RtOHZ4V3rUpVkVMrypS6MYBqfHc
         DuFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=pArVD1rsNNhsePjAEu6qC315uMjwLbUtwsk4rPFCwig=;
        fh=VnN04IKxmhR4wl6wukDkZjbvG/CtLL+INN5kEf2aaCo=;
        b=lj6nKj1X/0nQ40U/aNJ0eL568Ln2Add+XJgcIL8wxCSxA/hrZGc4RgSoCvwDwLnW6U
         wYeo6r7ezVHtorab13TqtElYUEDAlORg2xaBd7nLd4y8vpnMadV3lIJrQdccPzbwlVA9
         I2C3xk/8beJrlJPxbUgYwB9lQyYpp+qHaWr/EkAmT/2qiBIhfrG3agLYTKSAbrTGRmE3
         fHzBI3rEvPVmh6q+WwSNcPb+RViUldYXxrSuZYe8SZykeH4HtaleFqxyCSjeVqX3rksD
         21nEFirGyNakK8SN4Dqf+25Zasx8OJFvYOvewH1BufQYluUbQClvYGWrLjbJeCyApH5h
         7nTA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ooa6JEy5;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-3030f5bd335sor6960752a91.2.2025.03.24.21.59.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 24 Mar 2025 21:59:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ooa6JEy5;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742878786; x=1743483586; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pArVD1rsNNhsePjAEu6qC315uMjwLbUtwsk4rPFCwig=;
        b=ooa6JEy5dsdhF3GZo/Mx0V7MId3cwKFopLCUOuvOnTlm06D0WH1wJjeob+STPIOjOT
         eQLA4gEmHBzc9iPYQg8fjmyCuGudb7pfNtAoY/3wJUr3Ld/d+6R3ShnlH3LX8T2Yg8AQ
         54r/uweiRC8msFfGU9fvixPr4hi5LIPVbpBIzAumqnei9PQopigKLJAq18W3er1BEiTz
         s8rfw+I0ZbSmpojt2x4iDHMdkMGnD/3YNfGgScPti/q/VN0WNZLJUo52/hQ9o+IMJp28
         LfY4cUnPPaCmfrcJ6WyYr+KmCCQ8VD2BDkn5qI6l9ASIVJYjM2LJro4sDCdKBi/wY03t
         bGJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742878786; x=1743483586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pArVD1rsNNhsePjAEu6qC315uMjwLbUtwsk4rPFCwig=;
        b=ZPVUr1MDYrOIWQMB1ot/QzR2udq3qKWCPoVOg3xX+KzJz1tvn3BvnXH/u4AQwmvk0X
         eSG66R5RdEdIDK8BPoFVFNyOcndIQmpKAStOCq+P6OKVnN+ME7TCB4VkwlchhdBqTkyD
         0sAu/xECotNJOGiHeGCO362ULNytrNwYwCCEn3bzUX6SP1fw7ssqm8n59y34xtx67ZJd
         THn8FH7FDxy3DibFbV/8fv4/DWYuV/LZs1bNjbDeQ44HiDx6LGih7zYi8agk/eoDqZii
         l3bXk50rXmtmCzZURpUd3fIfIorJRy8fEgz9aIfZnCCc8dv6LrYX86uSaDE65UgOmOUd
         3xLg==
X-Forwarded-Encrypted: i=1; AJvYcCWvvqP+Wr0DhB5VLZJDuRjDxiwdrvrz8AIOYGNXuzUITlfc+PMHWDBK5N5dq8jSxOE4OWKWmCSTNXUBKA==@linaro.org
X-Gm-Message-State: AOJu0YyOnEaDjPE4Rl/r0ScfGirt5crXJlYZQ11lCQpktHvduADQatjH
	lOQFmEIVLPAJTe2er3EdEc/vN3G63MeEwtFQmnQFyHJzy8FLOoYZxEWUhlwnda1Q4JkjiQNcVi5
	/ti4=
X-Gm-Gg: ASbGnctwAWMyvQDLKHaWt0kO7zimElqPavgSH+dMTD3izlB4imINem88ab0UILCxQVI
	urerroisiHNe2PjXi7c6PcFYWpYjJzs2Bx8d+5ZvC6LyFVsSflxv2ePQ2opyL+L/ILj8QwVN2Il
	MYeCopvf5aYpjA/DxlsyMiV+elHBEAYmxcqAjE3AFW3qrkXta7ncpRG6xl8o/JdNV2mITuox0vq
	UDofwJXZO4aLKQVLLsxsKdqToi8PkjU8V3n00A1lSeGGIqklfS26X+ZUj9MY8fi0BZCZYV9uw66
	2mji1Ksy1CJZ4/+ZBaxjmwuZ2S7S7/n/mfy/tYcseSVR
X-Google-Smtp-Source: AGHT+IGR/KzZA1+eUmHk6ei4WiiUVCtTEYWPQAWgs9sRPdujUcwem0sIhUGOyH56NiEPvMBjKDnRdw==
X-Received: by 2002:a17:90b:2b8b:b0:2ee:f076:20fb with SMTP id 98e67ed59e1d1-3030feaa4b2mr29857443a91.17.1742878785454;
        Mon, 24 Mar 2025 21:59:45 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf58b413sm14595120a91.13.2025.03.24.21.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 21:59:45 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 25/29] hw/arm/armv7m: prepare compilation unit to be common
Date: Mon, 24 Mar 2025 21:59:10 -0700
Message-Id: <20250325045915.994760-26-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250325045915.994760-1-pierrick.bouvier@linaro.org>
References: <20250325045915.994760-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: ppVIhfFopWfU

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/arm/armv7m.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index 98a69846119..854498ac51c 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -140,7 +140,7 @@ static MemTxResult v7m_sysreg_ns_write(void *opaque, hwaddr addr,
         /* S accesses to the alias act like NS accesses to the real region */
         attrs.secure = 0;
         return memory_region_dispatch_write(mr, addr, value,
-                                            size_memop(size) | MO_TE, attrs);
+                                            size_memop(size) | MO_LE, attrs);
     } else {
         /* NS attrs are RAZ/WI for privileged, and BusFault for user */
         if (attrs.user) {
@@ -160,7 +160,7 @@ static MemTxResult v7m_sysreg_ns_read(void *opaque, hwaddr addr,
         /* S accesses to the alias act like NS accesses to the real region */
         attrs.secure = 0;
         return memory_region_dispatch_read(mr, addr, data,
-                                           size_memop(size) | MO_TE, attrs);
+                                           size_memop(size) | MO_LE, attrs);
     } else {
         /* NS attrs are RAZ/WI for privileged, and BusFault for user */
         if (attrs.user) {
@@ -187,7 +187,7 @@ static MemTxResult v7m_systick_write(void *opaque, hwaddr addr,
     /* Direct the access to the correct systick */
     mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->systick[attrs.secure]), 0);
     return memory_region_dispatch_write(mr, addr, value,
-                                        size_memop(size) | MO_TE, attrs);
+                                        size_memop(size) | MO_LE, attrs);
 }
 
 static MemTxResult v7m_systick_read(void *opaque, hwaddr addr,
@@ -199,7 +199,7 @@ static MemTxResult v7m_systick_read(void *opaque, hwaddr addr,
 
     /* Direct the access to the correct systick */
     mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->systick[attrs.secure]), 0);
-    return memory_region_dispatch_read(mr, addr, data, size_memop(size) | MO_TE,
+    return memory_region_dispatch_read(mr, addr, data, size_memop(size) | MO_LE,
                                        attrs);
 }
 
-- 
2.39.5
