Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp2764173ejb;
        Tue, 28 Mar 2023 09:02:20 -0700 (PDT)
X-Received: by 2002:a05:600c:2909:b0:3eb:383c:1870 with SMTP id i9-20020a05600c290900b003eb383c1870mr13157125wmd.11.1680019340550;
        Tue, 28 Mar 2023 09:02:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680019340; cv=none;
        d=google.com; s=arc-20160816;
        b=FuHhMQuSOByqCDqymQ04/Co8Mw8LPioe77CzVKYNZP16hafCzXrlzUOBhY9LsNNOc+
         gK/YNbRN6SRoVkVm9jiFkt3mziuZk/pyfhBwPBUKAOLuhLUOGBY/GyCas035W9O8l7Sm
         qgSA1ZLjUiXmpLIEnfsZ7IkZ6t6CAx2ChhPftB+KXkAypXEs1XVpQRkDm/ADABB3YZJM
         JmznjWXUZRJ8IO6S5//dzXQCpg6wTN8bPYr1OKAgX7e5uzNuUDom//3R4pPaO7PV8Mpe
         y7BAX43SY/9ONcesu2M+eyeRPZegI2NBL6l9a04uhP2T3gU36R1/NsRZF2kuj6vVwV7y
         ehlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=OyRcr9DasCtgvInsYY6GlB+tbhS02lFwPYhN+M0bqAw=;
        b=oqbeDQA2vl5PbZDLUk83uDZca9AMPBou0PlthKCPhJa3JDSbzxZln3EN/Xz8oqca0X
         OHp5qpzVYXGRmA1/e9yrBSMKMPgKjxGEMk4FGB26sHL2MJ1Hyy/suX8rsG6nFBReek3e
         ewdJKCS0DwQHJSxWVRtS+lQAKLpG37gxqU8ziFGhm6D7Wrn9zyjtn2qN2UrBajc4sCMz
         kcC5Kh1udl8rc0GEPoDt6zvbAQbv2HNFSwoQfIOQ0nxBg9n57VpKpEKSBJgu+hBHkVPH
         D+PUhsKTh1tQ+fdTtJYGByvPYuBExOmtwkyr9gYFrWBktLIi5lTHVoq1xRLuaYL54Ud7
         xL6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="M/V1i9iW";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id z26-20020a05600c221a00b003e21bd7e573sor4297665wml.33.2023.03.28.09.02.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 28 Mar 2023 09:02:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="M/V1i9iW";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680019340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OyRcr9DasCtgvInsYY6GlB+tbhS02lFwPYhN+M0bqAw=;
        b=M/V1i9iWetntCRWzrdkWeGidDB588xHxXoR+BeABnw3ooUjzybpg9e3+r+Q0Zmkd70
         5/EG66HBTqiYyxNjit8pVI20J/nY57KRVTImmW4VZBbiy2Mt2waNfp70Ig2F2w7ut11a
         JobQqrP2ocleeTiv5b6UCHOEedXqK5pZIQwPGEciAV2ECerpZV/tDlyCQMjFn2xYy8MJ
         ydi1oyXJkFMW3im5pHwawf995v2kV5hq3TF7mtas0/yt8U9QHyp6cQZ2h9Uky7LdPUZo
         lzeeJKxX4uC6TYUYdREct6y9MssE9rjbVyt+B1Rz+HoPMbEANrrY5jxR23Mmme4zuG1q
         vJGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680019340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OyRcr9DasCtgvInsYY6GlB+tbhS02lFwPYhN+M0bqAw=;
        b=arw5S5XFXPC6kLXYfBCxx/4sSPYRIzIt/8uXnHeabxzORFbw9bHnJP6KJ9BTBTPgaC
         8Vv+OvchRCCymuQ7efnku1eqLfjNJkKLKcE17JBMd9TF3v45TklIO8A/qiA9GpncQ6gW
         KXMBlS6H1KCWTVAF8y1PsWYsbLlSACwgXadUU5ofiz+ZTRv+/+qTBT8ZNCUrcSKTbIDA
         Pvp/hAA52WpuuUS6nGrJDfnhbofbThbesMNfB+sTV7gGE8GIyjlsguLE2LasOXCsb0KP
         IqBss2g9ZOtLcHEi9iEB2eUea2LOmfafZcP4plc5JncGGNhpHVFt2yARvQ940nJx/WWb
         dyJA==
X-Gm-Message-State: AO0yUKVpmeZR47z+OT2pqNO9f69urbOHhO/5FrP35Rpdg/AEpFY1qDYP
	NIvQcKIpkqBwpDZZ3hcaabqP+jJg
X-Google-Smtp-Source: AK7set/ZtqVx903RDtVSYGptsz18zUVgqjMNZ/IkszSkzAZarRI2FxJklBhqfOllK+78VU2eGn5OQQ==
X-Received: by 2002:a05:600c:2114:b0:3dc:1687:9ba2 with SMTP id u20-20020a05600c211400b003dc16879ba2mr11868573wml.35.1680019340251;
        Tue, 28 Mar 2023 09:02:20 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([176.187.210.212])
        by smtp.gmail.com with ESMTPSA id n20-20020a7bc5d4000000b003ee10fb56ebsm17690163wmk.9.2023.03.28.09.02.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 28 Mar 2023 09:02:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
	kvm@vger.kernel.org,
	qemu-s390x@nongnu.org,
	Fabiano Rosas <farosas@suse.de>,
	David Hildenbrand <david@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Greg Kurz <groug@kaod.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Yanan Wang <wangyanan55@huawei.com>,
	qemu-ppc@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-8.0 2/3] softmmu: Restrict cpu_check_watchpoint / address_matches to TCG accel
Date: Tue, 28 Mar 2023 18:02:02 +0200
Message-Id: <20230328160203.13510-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230328160203.13510-1-philmd@linaro.org>
References: <20230328160203.13510-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: mFnhYA8S9iq6

Both cpu_check_watchpoint() and cpu_watchpoint_address_matches()
are specific to TCG system emulation. Declare them in "tcg-cpu-ops.h"
to be sure accessing them from non-TCG code is a compilation error.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/core/cpu.h         | 37 ------------------------------
 include/hw/core/tcg-cpu-ops.h | 43 +++++++++++++++++++++++++++++++++++
 2 files changed, 43 insertions(+), 37 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 821e937020..ce312745d5 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -970,17 +970,6 @@ static inline void cpu_watchpoint_remove_by_ref(CPUState *cpu,
 static inline void cpu_watchpoint_remove_all(CPUState *cpu, int mask)
 {
 }
-
-static inline void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
-                                        MemTxAttrs atr, int fl, uintptr_t ra)
-{
-}
-
-static inline int cpu_watchpoint_address_matches(CPUState *cpu,
-                                                 vaddr addr, vaddr len)
-{
-    return 0;
-}
 #else
 int cpu_watchpoint_insert(CPUState *cpu, vaddr addr, vaddr len,
                           int flags, CPUWatchpoint **watchpoint);
@@ -988,32 +977,6 @@ int cpu_watchpoint_remove(CPUState *cpu, vaddr addr,
                           vaddr len, int flags);
 void cpu_watchpoint_remove_by_ref(CPUState *cpu, CPUWatchpoint *watchpoint);
 void cpu_watchpoint_remove_all(CPUState *cpu, int mask);
-
-/**
- * cpu_check_watchpoint:
- * @cpu: cpu context
- * @addr: guest virtual address
- * @len: access length
- * @attrs: memory access attributes
- * @flags: watchpoint access type
- * @ra: unwind return address
- *
- * Check for a watchpoint hit in [addr, addr+len) of the type
- * specified by @flags.  Exit via exception with a hit.
- */
-void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
-                          MemTxAttrs attrs, int flags, uintptr_t ra);
-
-/**
- * cpu_watchpoint_address_matches:
- * @cpu: cpu context
- * @addr: guest virtual address
- * @len: access length
- *
- * Return the watchpoint flags that apply to [addr, addr+len).
- * If no watchpoint is registered for the range, the result is 0.
- */
-int cpu_watchpoint_address_matches(CPUState *cpu, vaddr addr, vaddr len);
 #endif
 
 /**
diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
index 20e3c0ffbb..0ae08df47e 100644
--- a/include/hw/core/tcg-cpu-ops.h
+++ b/include/hw/core/tcg-cpu-ops.h
@@ -175,4 +175,47 @@ struct TCGCPUOps {
 
 };
 
+#if defined(CONFIG_USER_ONLY)
+
+static inline void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
+                                        MemTxAttrs atr, int fl, uintptr_t ra)
+{
+}
+
+static inline int cpu_watchpoint_address_matches(CPUState *cpu,
+                                                 vaddr addr, vaddr len)
+{
+    return 0;
+}
+
+#else
+
+/**
+ * cpu_check_watchpoint:
+ * @cpu: cpu context
+ * @addr: guest virtual address
+ * @len: access length
+ * @attrs: memory access attributes
+ * @flags: watchpoint access type
+ * @ra: unwind return address
+ *
+ * Check for a watchpoint hit in [addr, addr+len) of the type
+ * specified by @flags.  Exit via exception with a hit.
+ */
+void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
+                          MemTxAttrs attrs, int flags, uintptr_t ra);
+
+/**
+ * cpu_watchpoint_address_matches:
+ * @cpu: cpu context
+ * @addr: guest virtual address
+ * @len: access length
+ *
+ * Return the watchpoint flags that apply to [addr, addr+len).
+ * If no watchpoint is registered for the range, the result is 0.
+ */
+int cpu_watchpoint_address_matches(CPUState *cpu, vaddr addr, vaddr len);
+
+#endif
+
 #endif /* TCG_CPU_OPS_H */
-- 
2.38.1
