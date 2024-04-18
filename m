Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp1952267ejd;
        Thu, 18 Apr 2024 12:25:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUYKjVUCjmDJJI/gk2R2wZ7TC1irdhNpMnnjkLvCqRhHW6zdmrhs8u4MOREBd38lOKjfc4Cwl3x0qr21eN/VFZeneqTkDKs
X-Received: by 2002:a17:906:5006:b0:a52:53f3:af3c with SMTP id s6-20020a170906500600b00a5253f3af3cmr60230ejj.10.1713468353716;
        Thu, 18 Apr 2024 12:25:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713468353; cv=none;
        d=google.com; s=arc-20160816;
        b=PAqwh9tciXX4Y9UTA2yCKtpLP5tJB7MZk6lZxfmBuayIWJHLbbbHsoVFeSpopebzI+
         UU+lusPZU6WYZRDv4CaKmmBjysxl3nfgZ0D7FZbGY9ajEpgf7tx9C/KiPACrOhyT7abc
         P0Cb1ChPeoE01dZTy9mLTXLwCbQjcMtPmT9KDD9/n9EsTXt80T3ll1/Qqcr1j/UZcv5W
         TOhFbRzCCclC4wvOMwktbsjeC4o7U4GQ1VWhqGlRfZB6AbAdDX9SH9GOcxsxWydb4oBc
         b1WXVeBX1jv5ieD7D2X8wf1BxsnyjK1Hs27FVHE80fBctpWt4VOwsdqMsmw7zSBUF2IT
         Ny4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=akXy09tUeGr6mCjhMUDCOqgVvIVDrIu0xemDF/6ToBg=;
        fh=lV50mQQztPE/4OGr1c9CR8X4Tpn8REECEwZRzsOZF7A=;
        b=zHCGrPjgI8S8/jKjQCrSUpG99gSebChOGDs7o82ugKM65WOPLfkvR9aWnhs8l5/jlH
         kREGBLXKbEU3ijr7Z4og2pjQDa6TpPnRvDuLDjZ/H1aQAkktFZvQ8a1GEt2dBv3cjZKp
         djAfNWhdCL1tGHW8gkyYPSww1XA/qW0xPEzrwjPzNw2SW+XOciOy/8oPsvCjlk/q1n+S
         xXbhVZHGis5T0+FMYUatBLYzyBxUzeZzXFH2FofNfy+l68iS7nW0b2x8Z2RknkopKJgN
         sVEklrm40QgefPVSL4zYzKESik+dM/WcMENu6ClXY5dBMZ8qT7j7vl+mj482JOieC2U7
         yztQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="djIraWu/";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id c14-20020a170906528e00b00a51a01b0137sor738122ejm.3.2024.04.18.12.25.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 18 Apr 2024 12:25:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="djIraWu/";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713468353; x=1714073153; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=akXy09tUeGr6mCjhMUDCOqgVvIVDrIu0xemDF/6ToBg=;
        b=djIraWu/aUQJJqOFT1wCib1g1H8L7RLU8Mhkebb7zSgoYe1VdGOfD+GpDIYiXTdgNl
         Tvx0/1zXaO5nh3Z7PLz4dY5BP4gmEvKEO3CjNV0tWRc8VOjUeJWuw7OSPUJJx9CU3h8C
         RL2nghpic8346fWk6bFNUeDsyyAjCWUGwbC05NcPnn93RGfUJmy2VHMbKp5Gd2vU1yb0
         AmkmNqRMRrpG7z3Cg5VCnKur8/m3hk1zU+JYlwGA2aIDV/xb0uni9fbkgvZyNoKMCO2C
         g01jBhiDI5B7ZlI6YRPpponZ1eLFe2ei6fnM8D95zfFKd/6RvAsj0lN2ILvsd4KE9y/G
         iXVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713468353; x=1714073153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=akXy09tUeGr6mCjhMUDCOqgVvIVDrIu0xemDF/6ToBg=;
        b=ZSLqmqwZ1Ium4hHDq2gOSbglmwbUxNxE4QP2nw+5h3TuHmb7oRkEm+KCDF0t5JODyA
         l4yF3ZmBvFH+ejAMag1WMj9N+K2NUq9xYT3j2soelY9WLgdr4RyOnx+uqlmYnEkuQzcd
         K7+tSH+aaA2VW4HS9foagFZN4PAGaAxqtyWtWWbd/VPTlEXocHApxuVk+fgchC90UGn6
         l8mISgxMEzAI6kf6PnmzPZeg+FU61YEyiCtBOS94p34deMt19AmUan6REoaBMUB0YwF5
         Z5fTokJT3AWT6frNVEKWnDsZMpseJsPWVUYW+wsqhg1wCC8U5f9oY292O/VutajfCSXt
         1Emw==
X-Forwarded-Encrypted: i=1; AJvYcCXTWajIM0Yii9pX7IPWmNvFFFV66gtpzmr3mnKS9GPu4QGLpb2NdWuWztQJdzxDp8IO2FkgKV5Hk35J9211OC+yTeQWMDGg
X-Gm-Message-State: AOJu0YzTx/2ZxaOqYcNvLtqe/7ZCpeN5U4Ebpa0OiCNrI3EZKFqEBgSZ
	IzZUsEC5BO+li2wYjPpK5odma/hJUq7xWtdqpZD4A6v+oKXpdP00QhuGpZgVgZCZscNO/c+cKmp
	ivuA=
X-Google-Smtp-Source: AGHT+IGHWdMJNoXaAn2jkLARpnzm1AkwDW/nssSUAmn21RnLFR4YTnbmDPzOOELnW5gLZFOLDS380g==
X-Received: by 2002:a17:906:915:b0:a51:c964:3cb7 with SMTP id i21-20020a170906091500b00a51c9643cb7mr50934ejd.61.1713468353390;
        Thu, 18 Apr 2024 12:25:53 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.151.213])
        by smtp.gmail.com with ESMTPSA id i7-20020a1709061e4700b00a52244ab819sm1270026ejj.170.2024.04.18.12.25.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 18 Apr 2024 12:25:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anton Johansson <anjo@rev.ng>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 04/24] exec: Restrict TCG specific declarations of 'cputlb.h'
Date: Thu, 18 Apr 2024 21:25:03 +0200
Message-ID: <20240418192525.97451-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240418192525.97451-1-philmd@linaro.org>
References: <20240418192525.97451-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ueLkHdQBHaqb

Avoid TCG specific declarations being used from non-TCG accelerators.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/exec/cputlb.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/exec/cputlb.h b/include/exec/cputlb.h
index 6da1462c4f..ef18642a32 100644
--- a/include/exec/cputlb.h
+++ b/include/exec/cputlb.h
@@ -22,9 +22,14 @@
 
 #include "exec/cpu-common.h"
 
+#ifdef CONFIG_TCG
+
 #if !defined(CONFIG_USER_ONLY)
 /* cputlb.c */
 void tlb_protect_code(ram_addr_t ram_addr);
 void tlb_unprotect_code(ram_addr_t ram_addr);
 #endif
+
+#endif /* CONFIG_TCG */
+
 #endif
-- 
2.41.0
