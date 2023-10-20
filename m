Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp1360751ejb;
        Fri, 20 Oct 2023 09:37:50 -0700 (PDT)
X-Received: by 2002:a50:d542:0:b0:53f:a4f7:7bfb with SMTP id f2-20020a50d542000000b0053fa4f77bfbmr1828121edj.17.1697819870042;
        Fri, 20 Oct 2023 09:37:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697819870; cv=none;
        d=google.com; s=arc-20160816;
        b=CX31Ct3w30BLbbhcjiN+jLbvUqyhjpztFLqGXFsjHMzAXF+TUOd5elMbTRMVHc93Rd
         iA6ajvclvYFy9I0q6eEgOqOu2INjhFYduB1RCrSoO56SIFXl6tZJrWcUW/0OGgTS8TnQ
         j5jibEgdttm9Yw623BTVYwprS58EOpnDVDrKidFfnmbwd6dEcGbcLGqwGFjhYWlgI1NJ
         VoU04hm55I0wr5xOhPAV//oCpd9BM27yhfEsdWWr21opmdthN54SkSk3qrIUM2J3Pl1+
         14G0ae2YnkAMPe2CtCCqUyGVHc0vG2MEP89F187ARwsoMwl1OoXnbIdl2NLrgwpyLZa8
         ozxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=q4kg06JcXQgpZkYD+aAuvNPHOfoXMdKM9u+t0AGSCsc=;
        fh=oSlZfSRRWU8mSYQl0tamVh8RcW+kuw5yjdTq8DPQl+0=;
        b=nSnlJxpk76bFw5gqtybbIW0vtVO87lkO/1NpkCka7Ak1NJTRnojwsNlGpkKQz3YsJh
         0AXuwLo2oTJ44QCKb8Fb1WfaO1hg7B4oClFWCEzzZhJ8YE17xmTZEx+VXTMu/1dXRti0
         rS1m+XHB458MZNZ9bEPuUA4V5f0zAJBy5kSn5Vm/gx/bCnvdqg+dEQ2arBxDak1lcjLF
         WmjaJ9c1JYymbzX8859bY2nnCxE5gRdpluSD5tP+JUYW6CTVVb5Z1X3RU8owZEQK7ZGe
         tSRD2djvnYtgjLi+mRq37hqeKUAq3cermTSnkPn9MsGHI8MrCuCFu4XZvetaWG9+MuGl
         OVWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GqkrT3je;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m22-20020a50d7d6000000b0053e09f0b5a1sor739082edj.8.2023.10.20.09.37.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 20 Oct 2023 09:37:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GqkrT3je;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697819869; x=1698424669; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q4kg06JcXQgpZkYD+aAuvNPHOfoXMdKM9u+t0AGSCsc=;
        b=GqkrT3jeA4lcjO8Rj19AAHZ2gN1Xf5b7xmTbW4r+g+MGPPW123hbFS+mPWqZsdkl/I
         ny6s8dYF1my5ECdaBhzmtrnMecQDSZCq/0EieFlarLK6atO+qzuZmFHSNGLlvd18nsJk
         f0v9nU7Dq+Ql6qowHJKdhU0BzS3FjnYq+o02fvBdir1LhWhlc1lAyAUnMeJzNgknPMe9
         0wtqReo3lUNFM9b6JD8lVl/SRToHFJJ/25ECLAH0+0iJb09QwoomkNmDe0UUGXR2um/B
         lS6HZmWCbhw7Eu9tASmkUWPWcD8JqT7bbR/wtVS2USYRRXt/iI9hb/KEpCfyQ7N652XW
         nfBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697819869; x=1698424669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q4kg06JcXQgpZkYD+aAuvNPHOfoXMdKM9u+t0AGSCsc=;
        b=SQ79QY9HW8LPEBrFuolsTquzvEyRauRGArq56etQh7tPx+LDA1t3OmQUdiJjTePysK
         dCwyzKskO6PQnIVAzzbFyzd8tJ35fDrMbiBfIK0rqgMgttNS75ABlDN1n7MSBr8bwPQA
         oPxetv1S6Dad7rbsvyNPy2nk1s1bUQv1EBmJBNAFdOdUyyXjLjLOr5oGSxp1CldiXdeE
         2oZo+y/y3P/XEkqzu6w9G4+6GczTr79y6i+602ZE3+mUGngCeUjpbCgO/DTrtd8afLMe
         r8behLXBH44Qx3E7jsGelRUwJTvNZe3TAcT+e5qDkUb2u8z+vWfSdV6LTwjFYf1fMffX
         LE5Q==
X-Gm-Message-State: AOJu0Yx1ibePjlt4IbWVIDPv1ftKkPklZS9QnbwWCc3wEIGoVLBKwmga
	pdFSZYRqvLLRxoZtCMNlVFqcGOVl
X-Google-Smtp-Source: AGHT+IEdrkG9FwSyY/AKa9oPX4+3ml15l30g0cytwWkx3WA2O/VxxtOxCvAUt/yP8dWulgtn962GBQ==
X-Received: by 2002:a50:d542:0:b0:53f:a4f7:7bfb with SMTP id f2-20020a50d542000000b0053fa4f77bfbmr1828115edj.17.1697819869764;
        Fri, 20 Oct 2023 09:37:49 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (tbo33-h01-176-171-212-97.dsl.sta.abo.bbox.fr. [176.171.212.97])
        by smtp.gmail.com with ESMTPSA id c21-20020a50d655000000b00537963f692esm1813284edj.0.2023.10.20.09.37.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Oct 2023 09:37:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	qemu-ppc@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	qemu-s390x@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 08/19] cpus: Filter for target specific CPU (ppc)
Date: Fri, 20 Oct 2023 18:36:30 +0200
Message-ID: <20231020163643.86105-9-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231020163643.86105-1-philmd@linaro.org>
References: <20231020163643.86105-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 6wa/wGBDmOJF

Enforce qemu_get_cpu() to return PPC CPUs in PPC specific files.

Mechanical change using the following coccinelle script:

  @@ expression index; @@
  -   qemu_get_cpu(index, NULL)
  +   qemu_get_cpu(index, TYPE_POWERPC_CPU)

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ppc/e500.c         | 2 +-
 hw/ppc/ppce500_spin.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index 380bbe1fe6..c4bf3fef32 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -495,7 +495,7 @@ static int ppce500_load_device_tree(PPCE500MachineState *pms,
         char *cpu_name;
         uint64_t cpu_release_addr = pmc->spin_base + (i * 0x20);
 
-        cpu = qemu_get_cpu(i, NULL);
+        cpu = qemu_get_cpu(i, TYPE_POWERPC_CPU);
         if (cpu == NULL) {
             continue;
         }
diff --git a/hw/ppc/ppce500_spin.c b/hw/ppc/ppce500_spin.c
index 3b113fbbdb..142bd45f18 100644
--- a/hw/ppc/ppce500_spin.c
+++ b/hw/ppc/ppce500_spin.c
@@ -125,7 +125,7 @@ static void spin_write(void *opaque, hwaddr addr, uint64_t value,
     SpinInfo *curspin = &s->spin[env_idx];
     uint8_t *curspin_p = (uint8_t*)curspin;
 
-    cpu = qemu_get_cpu(env_idx, NULL);
+    cpu = qemu_get_cpu(env_idx, TYPE_POWERPC_CPU);
     if (cpu == NULL) {
         /* Unknown CPU */
         return;
-- 
2.41.0
