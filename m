Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2396916njc;
        Mon, 24 Mar 2025 21:59:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU2L6aP+bg0d/ZsS3ykaI9qxPwO5+D/WHMCvHCf1LB+dvqIpqIHwbfpbdSaNADc230HeB5D51SOXKTsHg==@linaro.org
X-Received: by 2002:a05:6a21:788b:b0:1f5:8179:4f47 with SMTP id adf61e73a8af0-1fe42f557edmr28274358637.20.1742878764231;
        Mon, 24 Mar 2025 21:59:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742878764; cv=none;
        d=google.com; s=arc-20240605;
        b=VCj0xHETQhjgEmMdi3hwMIgTSsjgL29K9T/IX8C2AkmW1wQTk5Lm9iZv4LCAERzzrn
         U+su+hs1MR0+sd6C4VTJiCc0Dwpbmt58Cer436GU10F0wjPtLi6PRVrfrp12e/03caTz
         8v2gPZhzHZ9K0duIqoWUf8BcO4R6bfg8PB4DRtVhxLF0mwarO7TLqLWfP6E68+JuLXgl
         LuJ9YOHnN1LHGFek47N3qaqNvWThetDIGCa5qOXA86M4L+fD+c15Dc/9dBsRIgjjGK9I
         zyCSjUoxX2/AmJOv1gur9RcKLciAzFqv6CSYa6a8SXMXrd/dXUb6TGIaqhIci7bgfqMA
         X1YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=jR5zdvst1499BI4mZMYVh63tqJtsj49dtruLLQFFpJU=;
        fh=MJQ2x8UVtsuwQdDuImshnNPRvmS/QuZ4iQw4FT6ZkzE=;
        b=jnhw/3JJf/TzeWfd8b1nLE6ih27oQjEU6qh0EsxDcFqT66G+9DYt/wCMLLeYd/mdrm
         SxnPyPC/aNOnSWx9h8awOorHxn8ylAYdl4Qrkr6oNz+Bw8nECoWmEhm5RMP4/u9a3jPj
         NHSZi1gkiHfaCJnDoM+xA5w/A4+BdPkw6aM3PlTAvxRbN/Z5NlT3THNC/RrFOumlRFXi
         omvh3+kdswWkjnC8miTrw7+LQX9iJwCxEYZXd94mv6v4sNNd7vqGXZbViwKtZseRGBoC
         wgQ5lAVo5bALe9jDNe4AXw4B604lkHzDliANqkOAfC0bvZmolLyAAzCKSvD0Z3l6Wi9l
         9FVg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="CN292gr/";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-af8a2417c1asor5296521a12.0.2025.03.24.21.59.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 24 Mar 2025 21:59:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="CN292gr/";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742878764; x=1743483564; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jR5zdvst1499BI4mZMYVh63tqJtsj49dtruLLQFFpJU=;
        b=CN292gr/xT1FCX+YXAqsNhgw5lIpiQUZotCQQgzy/00nr4w54C7rT0ziR+TLHMNWWT
         lGwhVHMRIPXSkI8K+Jkomdtm7ou4eRUzGenFTfhbyzT7hBMvGxyw3lqUTgLjKQALNCC2
         zm6yXwF/pF86W5ZLYrK9Gh+JYWzhopie5ELP9abZe5AO3IfU7vkut1mBEUQYriraV4px
         3QzntHtx5ZFta151qLhaYKpVYL1+KiTyr+SP9vHsxo+unyfd/9ndZAEnpINGmQINnMG6
         DbllmuIa3HbRR8sr7vZh3A0QhxFbcGoIgog6xaBPKdbPIKtE0TM67sZutI8diY6ZxpU5
         OWRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742878764; x=1743483564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jR5zdvst1499BI4mZMYVh63tqJtsj49dtruLLQFFpJU=;
        b=vYQDBMMpnHuT7MX6x2tFBQS0EVBslFHCiOBBNYswwlCHBz+M0AOWSzn9Ob+UPrztcv
         Mi9AKSFb/29wF616YxksmxXaJ7aw7iogY5aVNFuy9+ZWWGH8IOjQTui6yOsY9M6493cR
         OGQ+e8vfR7TyT6V7Kstb37gPNZC0G3QTWCPmJTJgDy8Dz2WDg2SPriHwhB5HQC5D/Sg9
         4Ig6HvHZbyMn6tAoN5SOt8JsFmNRd+OUCpf43208NBGolPCHSy4Oqek0bqHg+U4GH8TJ
         LvKt84rqBedtNHWiQdrONMiHEApEiUAXIRCxwVwnyu/aR9AfQSQYFJcLd+8Zb0p2J9yh
         EX0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUXP2hp/b0An1L8jf1uBSmOyrJ3MB2QBjhHuVbJ18GAGN2oHEc4IyZpjToLabinM198KPLRt4Dhv7pI9Q==@linaro.org
X-Gm-Message-State: AOJu0Yw9C/HLUN1hKnMdAkXrkNb74l8NCAEsXOMOTZxabyG2Vyo6rbDY
	3KLRqFs0w2R8xwbTDcp8OczfmZoikPHtK7fuH+IGDuhKf4GNlTV2M5mgvknoMWIG0Q==
X-Gm-Gg: ASbGncsMsyzMV8ujdLgEkgFBgQewGvSiTqHB9npI3UR1kWojri+J6LHfULMA716feNH
	F0To/eF2y/iIwMU4aIph8bo0dd2Z4Cl1fnxXBJjsq00PeB++JOb/Tw+vUr3UtSTx4IEYyXhEnhp
	bmhncHloBsahO+V6rEhzzx3vuS1Ez+0hBVJUkIf5Zz7odgC1woUATRoBAo3yRX4tC4FdL/RBHAT
	rP0NIdrwT1zWCSUjUycqk5poTXmCLp9BJ9cQGh5ux2EWh+UtZiGprDNBiykWvOpagDCbOJxkmmM
	Cq+O0QidN4mH2PGtPjmnIYBBCihyXYcqSC9o9iUmBLkg
X-Google-Smtp-Source: AGHT+IF09e4GpcORPL+fT4DQZe28sf2+KbqBTnwWuE5q2cPmPm29mL0bJJJ9ciPPSpM9sPRBfLk61w==
X-Received: by 2002:a17:90a:e185:b0:2ff:52e1:c4b4 with SMTP id 98e67ed59e1d1-3031002b8b9mr20134582a91.32.1742878763623;
        Mon, 24 Mar 2025 21:59:23 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf58b413sm14595120a91.13.2025.03.24.21.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 21:59:23 -0700 (PDT)
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
Subject: [PATCH v3 02/29] exec/cpu-all: move cpu_copy to linux-user/qemu.h
Date: Mon, 24 Mar 2025 21:58:47 -0700
Message-Id: <20250325045915.994760-3-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250325045915.994760-1-pierrick.bouvier@linaro.org>
References: <20250325045915.994760-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: P3lyFGbkN5wu

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/cpu-all.h | 2 --
 linux-user/qemu.h      | 3 +++
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index d2895fb55b1..74017a5ce7c 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -32,8 +32,6 @@
 #include "exec/cpu-defs.h"
 #include "exec/target_page.h"
 
-CPUArchState *cpu_copy(CPUArchState *env);
-
 #include "cpu.h"
 
 /* Validate correct placement of CPUArchState. */
diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 5f007501518..948de8431a5 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -362,4 +362,7 @@ void *lock_user_string(abi_ulong guest_addr);
 #define unlock_user_struct(host_ptr, guest_addr, copy)		\
     unlock_user(host_ptr, guest_addr, (copy) ? sizeof(*host_ptr) : 0)
 
+/* Clone cpu state */
+CPUArchState *cpu_copy(CPUArchState *env);
+
 #endif /* QEMU_H */
-- 
2.39.5
