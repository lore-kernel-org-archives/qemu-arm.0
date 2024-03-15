Received: by 2002:a17:906:4a0b:b0:a45:b507:d90a with SMTP id w11csp989159eju;
        Fri, 15 Mar 2024 06:09:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVEg+5QDgjRnwCeBPBKbqvJTyIhcweFu1ZaYxa+wH2zLH1UVP9WIH0WBsIAzqqPbybI9nF6+9p8ifga2AApetHxj+TlxTAg
X-Received: by 2002:a17:907:11c7:b0:a45:c027:372 with SMTP id va7-20020a17090711c700b00a45c0270372mr2791496ejb.68.1710508187500;
        Fri, 15 Mar 2024 06:09:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710508187; cv=none;
        d=google.com; s=arc-20160816;
        b=UKOVmhqQpRl4FgLDpl6EXt5UaQCYHEDfl5EP7zukPR9WmdNt0zJmZlle3e4hmpdlGT
         SP5GrtW0nVhVLPfcijFvGGZow9hQAnjjgHupTIymJin2ZPISmurE1vGaFIoDj3TtSixC
         zKhg4EhWeNpefoVu9bPflP3biCVtTIqiWJgofjbeIjK3WGm1MFmKarUPNxe7rcNSYwT0
         oInvnztAF+3ALdfCffY3fjDIHO7y5GsEkhTwjCex3vY/CYI+yOxUCOjAy9yyGeMIrJdr
         CMnvgYmyqvBFcZEbqHmkQy92lr7EI5S/FkyK+ySuk4CBmAGxbKB0Zsj3kpKv7I81eltM
         4TUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=7ztA/s++99kJlJQVkkhi5KVYRPW5VID21TBVzyIGr2Y=;
        fh=pWm0c4S1uihOaoCOtXkjZPIdauq9mKCqA22CiGYD7eI=;
        b=FRYYvDMEUkqHDRTBYn3Q1HSxlx/01Gyt5UfNH2nqKmk57zo0X/JOG6qYqLU8wKBX3d
         ImDldrINZ2NYvBITC4Gpn39GvcerKymhc/N3Y3exrJegYjoIOReRN96EPI1vWAFOyrcN
         vDNLrLvHppYkLhAVi5EFunqNl+aefnM9cv3L0fCjNu2Vg5rPMXkIchCfDjb736aruhpY
         8aeqlmxCY6wY5BXMig/wvzr6TvIA70/Yia47OTzpeSCDJUpSSklkBVmEpKAMpE276diV
         C15kzoLxVvihTAlyoF1vPNLOsDY6xIY73aOjBuKstdtHG1A33tnkVYt88rqf+85tTR7T
         dhMg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HqJrtJD9;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d3-20020a1709064c4300b00a4635c9843dsor1389853ejw.12.2024.03.15.06.09.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 15 Mar 2024 06:09:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HqJrtJD9;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710508187; x=1711112987; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ztA/s++99kJlJQVkkhi5KVYRPW5VID21TBVzyIGr2Y=;
        b=HqJrtJD9MKFD2rzIItQ4PATxEB0UFa0Wn1U05bchdPuQbxfiBGRESP0+YbGnvE8evS
         W2brTkR37UNPT7ze0KoC/s4+iAtBZFu86EcujB+2LzHC6fueqL9tB4ZkJKULsoIadEFj
         qHTpsVsPuVIFTSCp5VeBY/KPwpPYUomlzeFYTuVM/jbOb3JSnJHKL3WgbdV9vAnijskV
         soG2t9zSSN1STBXZKou5QBJPxsxMQfmsbHED7AUD19gTAqpHVoFf/InpxOOfNpTMnjoW
         APr10FRYy1r2QFNDvptwg1RBUYz+MX3rEj5Ttn9VjqaDDcHs5XbQ1VQVYszhQnFQHXcc
         12AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710508187; x=1711112987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7ztA/s++99kJlJQVkkhi5KVYRPW5VID21TBVzyIGr2Y=;
        b=jUG4DKcJOyyP7ouyZ8Ocitzwm1+pZnJC+9DnJAf9BauqlpovWwHlEab2x9eWix6Y6+
         cgllns8Xi1VkbuDNzz7/B5gfwc9sVDay5W8yNFEpkFrDDEpZUrp2Ds7vdHW5ARLd3j9U
         VScL3PCppquAhdSc/yUy7ajtz6DPqbL5Wiqg4RbY2VjTcIyvxHWuDuLrr7Wnala83R/+
         vKGtJax4VkmmcGC22vVRMtULnQVz3FhdCODs4k9aE/yGte8NMuCGBDOgW4ajYRawtvQw
         opCqcTKhLSJMkwJwNPz5lVnuuWCOnZ99YEjYyld2PbqZZpzVGjtXBFZaEWXh7IK1Eitb
         P4hw==
X-Forwarded-Encrypted: i=1; AJvYcCWWWvu/51vYrM5XNcOVaunVlKr0ceZ+9suOKVacAto4CQymHHCxlzbK+tJlylYxx3saiTQEc3XrTRLLZhBK3RTaxLWxJ2R2
X-Gm-Message-State: AOJu0Yx1+Mln6b2HfOZX/GNm7rxE/YrcviR8d5nyq1R6XfJ4cwQvPOWa
	ex8AKRjGEoIpRjNEDfni3k9deJRQOzhXzIK8fXlXcLqz8YSBEbf5ii9i8YFOlqDIqA==
X-Google-Smtp-Source: AGHT+IHGdVDgE0BV4E6ET1vnyKOiNgQutr60WkuR7/igTVB/b/2IuiYcgezn/mIAKkIya0Cm/N2Kbw==
X-Received: by 2002:a17:906:6bc8:b0:a46:800a:6358 with SMTP id t8-20020a1709066bc800b00a46800a6358mr1492199ejs.15.1710508187195;
        Fri, 15 Mar 2024 06:09:47 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.145.26])
        by smtp.gmail.com with ESMTPSA id f23-20020a1709067f9700b00a466a265ffcsm1722093ejr.145.2024.03.15.06.09.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 15 Mar 2024 06:09:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Cc: qemu-riscv@nongnu.org,
	Anton Johansson <anjo@rev.ng>,
	qemu-s390x@nongnu.org,
	qemu-ppc@nongnu.org,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Claudio Fontana <cfontana@suse.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH-for-9.1 05/21] cpus: Open code OBJECT_DECLARE_TYPE() in OBJECT_DECLARE_CPU_TYPE()
Date: Fri, 15 Mar 2024 14:08:53 +0100
Message-ID: <20240315130910.15750-6-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240315130910.15750-1-philmd@linaro.org>
References: <20240315130910.15750-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: SNHIizWiXe6c

Since the OBJECT_DECLARE_CPU_TYPE() macro uses the abstract ArchCPU
type, when declaring multiple CPUs of the same ArchCPU type we get
an error related to the indirect G_DEFINE_AUTOPTR_CLEANUP_FUNC()
use within OBJECT_DECLARE_TYPE():

  target/mips/cpu-qom.h:31:1: error: redefinition of 'glib_autoptr_clear_ArchCPU'
  OBJECT_DECLARE_CPU_TYPE(MIPS64CPU, MIPSCPUClass, MIPS64_CPU)
  ^
  include/hw/core/cpu.h:82:5: note: expanded from macro 'OBJECT_DECLARE_CPU_TYPE'
      OBJECT_DECLARE_TYPE(ArchCPU, CpuClassType, CPU_MODULE_OBJ_NAME);
      ^
  include/qom/object.h:237:5: note: expanded from macro 'OBJECT_DECLARE_TYPE'
      G_DEFINE_AUTOPTR_CLEANUP_FUNC(InstanceType, object_unref) \
      ^
  /usr/include/glib-2.0/glib/gmacros.h:1371:3: note: expanded from macro 'G_DEFINE_AUTOPTR_CLEANUP_FUNC'
    _GLIB_DEFINE_AUTOPTR_CLEANUP_FUNCS(TypeName, TypeName, func)
    ^
  /usr/include/glib-2.0/glib/gmacros.h:1354:36: note: expanded from macro '_GLIB_DEFINE_AUTOPTR_CLEANUP_FUNCS'
    static G_GNUC_UNUSED inline void _GLIB_AUTOPTR_CLEAR_FUNC_NAME(TypeName) (TypeName *_ptr)                     \
                                     ^
  /usr/include/glib-2.0/glib/gmacros.h:1338:49: note: expanded from macro '_GLIB_AUTOPTR_CLEAR_FUNC_NAME'
  #define _GLIB_AUTOPTR_CLEAR_FUNC_NAME(TypeName) glib_autoptr_clear_##TypeName
                                                  ^
  <scratch space>:54:1: note: expanded from here
  glib_autoptr_clear_ArchCPU
  ^
  target/mips/cpu-qom.h:30:1: note: previous definition is here
  OBJECT_DECLARE_CPU_TYPE(MIPS32CPU, MIPSCPUClass, MIPS32_CPU)
  ^

Avoid that problem by expanding the OBJECT_DECLARE_TYPE() macro
within OBJECT_DECLARE_CPU_TYPE().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
---
TODO: check rth comment:
What about adding an OBJECT_DECLARE_CPU_SUBTYPE that omits half the stuff instead?
We don't need another object typedef at all, for instance.
---
 include/hw/core/cpu.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index ec14f74ce5..4c2e5095bf 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -78,7 +78,12 @@ DECLARE_CLASS_CHECKERS(CPUClass, CPU,
  */
 #define OBJECT_DECLARE_CPU_TYPE(CpuInstanceType, CpuClassType, CPU_MODULE_OBJ_NAME) \
     typedef struct ArchCPU CpuInstanceType; \
-    OBJECT_DECLARE_TYPE(ArchCPU, CpuClassType, CPU_MODULE_OBJ_NAME);
+    typedef struct CpuClassType CpuClassType; \
+    \
+    G_DEFINE_AUTOPTR_CLEANUP_FUNC(CpuInstanceType, object_unref) \
+    \
+    DECLARE_OBJ_CHECKERS(CpuInstanceType, CpuClassType, \
+                         CPU_MODULE_OBJ_NAME, TYPE_##CPU_MODULE_OBJ_NAME)
 
 typedef enum MMUAccessType {
     MMU_DATA_LOAD  = 0,
-- 
2.41.0
