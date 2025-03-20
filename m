Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp1279076njc;
        Thu, 20 Mar 2025 15:30:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXA2jWGR/z499TqLq2idaADDrjB7RX01lEbIhYI6lssc658WFgIQ1ZRq5sjKc2zkECtwjrD3Cx9l0cIwQ==@linaro.org
X-Received: by 2002:a17:902:f652:b0:223:5ada:88ff with SMTP id d9443c01a7336-22780d9bde9mr21055465ad.24.1742509833442;
        Thu, 20 Mar 2025 15:30:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742509833; cv=none;
        d=google.com; s=arc-20240605;
        b=K18P4yWiPxaj9Q3XaMQ/eEKW1qU5nZs7Q/0lpwI6KTBq3LsMbI6o9nAGWFj8aXKIZ2
         OOkyeIYIbHxgmmK94XOBdmUZBeSan0zdFlWQtQ1ktoGPFucnFPLM/uwLuUk1jn1XmPAd
         zqqMYnzINALeDOR/O0AAyPVYFXyKF1SYSd4KKs9BSvBqnTQ0Z0yW7tOBaIn3ZSKYXSXu
         b/p/1NNsGVyTFumpjeXofwTEj62ztItDHaQNdSFhFUxFdTsQ0zBwvBLoMy4Wt/zxOWlp
         +KofcAUzCz1p0Ol3/6SO1q8r7UDuvKOcRN6z7mVdfK+I8pJMId/XIffybn8vAHiJLxtx
         Yt8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=H6JY17RXIOhpi9WGu5PHvZc/K1MBVjPo3G9pvjwYgCU=;
        fh=LV6PXzlGUmrnj0RyGu+J+32GWdxr0tJ7w/lNMgB6ImA=;
        b=bDTz7llJg9A9XPrqy91en9wP2G9/Na43yfY+3zuUPnKQsknMNtF0h8ySQBKmFBNh/V
         azIUcHTmjY3WC8T062xphAUVTy3cHj5Ts8D4prZ7118qdy+y8GsGZ/pFJgRQLmch/Km2
         TpPSPn5yJRAHGsaFIy1xSuRCVaiGFn+deGTlY24homGgAhbau/7k3wxbNu5rb0ZLI1Zc
         wtDogDfn+Xz20Z3eNTMZyY0bDbrI4OvlVSqlUATSqtOJ0xDOIv8xbHfDcNEr3lP8BFEU
         FMvYSacFUGngnvAs3VR3KEj8RhfVZfuHBkdDQtIaOwCMETGpEiUAx7WU/8NUYEFqLk6Q
         BZyQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U4SKQ1sg;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-227812380f1sor3573475ad.15.2025.03.20.15.30.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 20 Mar 2025 15:30:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U4SKQ1sg;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742509833; x=1743114633; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H6JY17RXIOhpi9WGu5PHvZc/K1MBVjPo3G9pvjwYgCU=;
        b=U4SKQ1sgVi8ggUC+YYXioYJ8SrecgmUFA76cfpvKwn8246c/E1eQ/NnPDX4//o1CpE
         ZBYl+lYqn0lFEe2lZacvKvWCOuDaq1/kYg9N7dVV4DG13zbLRmvdBYU6qOjrYZUPmmC6
         X3895tBRUQd4kL2QSUkTFyW/RA8g2FOwqM+wDFSt8J7NqXQE/rXx4VAOZcW5/gblVGaZ
         N3Mop4UmH9kNdzjwI9rV+21AYNAXRccTeidYzbnpNIMkH3u1r8GvhFKb4DrLFU81UDS8
         8GOlKGXCbnyoDd3rRRL7xzI1VLrWte19mFiTMT5QdAfubaPmwtQvOJBauchKy+VgBREG
         xxiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742509833; x=1743114633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H6JY17RXIOhpi9WGu5PHvZc/K1MBVjPo3G9pvjwYgCU=;
        b=S2mHcfbQ6GR6bmlrgfm+y6s4+3nqecDfO6wX4d/3/UK4xXNzbObTKMf1nRWDbQSnoX
         6I7NIIFu2puM1DHRlV8DSeKY+sjH+KLB8zI6uSaOB+bxuoWc5GgwD0reQ2sppiHYcsTc
         OipVu6EFxXmNjnSC33fFTO6x2C396qJVgCJCqaVaNfrNIujaq+eRrCFIECYOPIA7U/hC
         0UbSCn33Ch08fuBwv1jdIM/Gvf3kaG4Sh6igQp85zsv122tdgP/phI+I82NGXgiZIxTf
         XBkuErdOz9CUvO9rPHKNckymzoTjCd8dLG5QI1Gq1t9D1HnLPiS5UJt2aFegQCP8z4m1
         JDEA==
X-Forwarded-Encrypted: i=1; AJvYcCWaqX9ZA+dUrCz/HuuBeSg++jGsRfPMHvIi2cAwEsJSu1Drueb/wU8kWrfSqUGUrl0n5ZV8//YtyEwbrg==@linaro.org
X-Gm-Message-State: AOJu0Yw1ZJCGmhX3bsg1RPhZR/dM117Mvse64Jb+l3YhnbTcaqoVC07E
	JCn/Mma2+ZggG3ZELLOrGumLWP2Y9kwpIvPFwU+MYz83En9zwEzls8O4XiQKEFl1Pw==
X-Gm-Gg: ASbGnctF0bPasEiGin2B89KrxCwYqtfUZz390uOmEPhmceiq24USfqa7m4eEd2cLbMm
	vEi2MqHaiCCvSKT+T0lQ1gYcDzYfGgUH+3vOen5PTsu6BVw5J234R7KIoIEIwVSgPt8kcGBb5/z
	uSXlyioNCn+e0ZhgbIuCKJXTJgv6lvD2nMSPRCVVO/mti3ASSNfC+knOozM59xlN1SVtPq+QfE+
	ZlZanm2meMrc/TFE+D6Tgf5SGrTJoBXF0+mhys0aeMIlIuaaNGkUOSwkmqn4OHI24b31wHp1Rt9
	VmFnKr1qj3zr0ncaZxRlBraeyARmiPC4LmWEzt1PLH7IcLhdPj7nnB8=
X-Google-Smtp-Source: AGHT+IE59Qwtp5nBxQhisMzue6LUyvUvNBhkAAgS1BGy24OByXsm0hDrGv8KdLQQ/IM83anAIbBe6A==
X-Received: by 2002:a17:902:f54e:b0:223:fb3a:8647 with SMTP id d9443c01a7336-22780e0a4b3mr14803805ad.41.1742509832795;
        Thu, 20 Mar 2025 15:30:32 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f4581csm3370145ad.59.2025.03.20.15.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 15:30:32 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 21/30] target/arm/cpu: flags2 is always uint64_t
Date: Thu, 20 Mar 2025 15:29:53 -0700
Message-Id: <20250320223002.2915728-22-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
References: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: L20RVOP3r43h

Do not rely on target dependent type, but use a fixed type instead.
Since the original type is unsigned, it should be safe to extend its
size without any side effect.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/cpu.h        | 10 ++++------
 target/arm/tcg/hflags.c |  4 ++--
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index ab7412772bc..cc975175c61 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -194,7 +194,7 @@ typedef struct ARMPACKey {
 /* See the commentary above the TBFLAG field definitions.  */
 typedef struct CPUARMTBFlags {
     uint32_t flags;
-    target_ulong flags2;
+    uint64_t flags2;
 } CPUARMTBFlags;
 
 typedef struct ARMMMUFaultInfo ARMMMUFaultInfo;
@@ -2968,11 +2968,9 @@ uint64_t arm_sctlr(CPUARMState *env, int el);
  * We collect these two parts in CPUARMTBFlags where they are named
  * flags and flags2 respectively.
  *
- * The flags that are shared between all execution modes, TBFLAG_ANY,
- * are stored in flags.  The flags that are specific to a given mode
- * are stores in flags2.  Since cs_base is sized on the configured
- * address size, flags2 always has 64-bits for A64, and a minimum of
- * 32-bits for A32 and M32.
+ * The flags that are shared between all execution modes, TBFLAG_ANY, are stored
+ * in flags. The flags that are specific to a given mode are stored in flags2.
+ * flags2 always has 64-bits, even though only 32-bits are used for A32 and M32.
  *
  * The bits for 32-bit A-profile and M-profile partially overlap:
  *
diff --git a/target/arm/tcg/hflags.c b/target/arm/tcg/hflags.c
index 8d79b8b7ae1..e51d9f7b159 100644
--- a/target/arm/tcg/hflags.c
+++ b/target/arm/tcg/hflags.c
@@ -506,8 +506,8 @@ void assert_hflags_rebuild_correctly(CPUARMState *env)
 
     if (unlikely(c.flags != r.flags || c.flags2 != r.flags2)) {
         fprintf(stderr, "TCG hflags mismatch "
-                        "(current:(0x%08x,0x" TARGET_FMT_lx ")"
-                        " rebuilt:(0x%08x,0x" TARGET_FMT_lx ")\n",
+                        "(current:(0x%08x,0x%016" PRIx64 ")"
+                        " rebuilt:(0x%08x,0x%016" PRIx64 ")\n",
                 c.flags, c.flags2, r.flags, r.flags2);
         abort();
     }
-- 
2.39.5
