Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp1279091njc;
        Thu, 20 Mar 2025 15:30:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXugVaR/85eeG9pVD1JUYTSSyCNuucv7XnLTVh2w20udYFjHSK1ZXb1FthlLUevOYqVAzT3BmjNbZPzlg==@linaro.org
X-Received: by 2002:a17:90b:3143:b0:2ee:d63f:d73 with SMTP id 98e67ed59e1d1-3030fe812d4mr1365022a91.11.1742509834946;
        Thu, 20 Mar 2025 15:30:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742509834; cv=none;
        d=google.com; s=arc-20240605;
        b=LSXgYI9kL8Nn5xrOtlRsgFNZMk5wXN/sV1CsGH0/KIoDRE1ZYzGHlbrGaApkdWzimm
         qw7cXCfb//zANSAzrRbyoJg/9hgBwddYJEk25t0wJ3NNywWslDSkC2INRSMcCv1+FUDD
         I4MXYauyzEFd6xEcUHCb9KWl7oD5BMVYBe0gl+OjGC+yxNZVjXV0rmyMpBoSJeOb0L6D
         dpYM1uJm9Qo7GmqjPQYpCXJm4EXpbtFWAAhyXnaAgBtBH3GVMdWVQH8FL+kMoJzZTDBZ
         PvH485u5YS06CFukR+Nck/C7C6xzDemuGedaLdAHiNeWkfSnKLUXnNf1/SDMPxwrg5F4
         Yeug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=aUQD3Wdd1LujT1Sus7xanYZ7bZ9IH7iAgdXy0WNcaNg=;
        fh=AKiGyOXPIR5Pawhb7RR8LaHfIY4I/NHMSZzPBK5XG7U=;
        b=lpOvC+k8JQsCOgSkkdgPUAvj4uBf+qC814nkblHCDDpc3iWx7ercYghos8eGLrwCuC
         gTr0w3hEmG/SDhoKOo8EqIb+Abfwt8nFHqQiKN67QM7bR2Qs/klbqcmMe9Z9pPu1WiZp
         0H0YblMOC3dj+2SrmdwrLWHDZsTcSUqu+eogU4leTLEYLqidvREWMj1WgJL6xDRi44z/
         h6ZZaF1y03lS7dHgdghHvUENe+ofwhV8JW/36h8AUTJALsnkf8WhJASIhQyrroO+9ISk
         W9GJyHJrZDdToFpHWf7XUXNEipXPPYdcgxjwN3qg9MQ4GImqbxdbGWX9Gy1EoY4gEcTg
         ZTKw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZxCmCfPY;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22780f77641sor3226415ad.11.2025.03.20.15.30.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 20 Mar 2025 15:30:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZxCmCfPY;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742509834; x=1743114634; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aUQD3Wdd1LujT1Sus7xanYZ7bZ9IH7iAgdXy0WNcaNg=;
        b=ZxCmCfPYcUzGz4hel6np6ldAnz+JfyYAotA5w1axFbJs4gvIEtGGVz6NUjSSuS+gQb
         1SxL3uEIXa5QMjx1DJWuam0Q3izQZxSVjaRmS/zgUlWad2KE7ahMA12bVdDepxt5B3Lo
         EAX1ePRdIm7S4x1KJBVIM8yq1BODlmcdi9dvErxWANeC7J5mZEKX1xcRjfZ5sAIKVH0p
         lc/HOGjr7zEprzF9PFPPbpd5Ie3xTQIoDfSO8CR757PirfmdydQA9KzcZ/rziitFXSL4
         va4Fvex2JdA3dt0TF7lbC3xa2ap5ucLeQ4OLPLRFOf11erZNtpqbU9nfC8UdVUa8G3gI
         /FYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742509834; x=1743114634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aUQD3Wdd1LujT1Sus7xanYZ7bZ9IH7iAgdXy0WNcaNg=;
        b=aA8x154Ddo6twXs1msIpGOC0uH1hDBAXr/7nB810Z9ocM4AkL97RugquNhYyX9hcof
         bjggMEhXIrUeJAQhr8KeciAq19w3CAfbvrNfOO+UEFFTiy5DZ08WXFk2bewAVofazbrl
         EMjzLr5fH5OpIOZPZ60zejliONMpGBybM/Xdd4yylFeJ44kY4HLH8IhJIIK4miVO73Ed
         YotBFi0RY8Xrd4lZX06guXogw7FjWTZwMwzvXyHC7KBOXxuysRAr8FfjjQSvYaBYbJZ0
         DcbsHOkJzDXe+gGYlFlXWuPVFnIdKzY/ykSeiUG78HjLw4pYa5x1yWmk++wjvGxcha0U
         L5FA==
X-Forwarded-Encrypted: i=1; AJvYcCXRC1F8RR8fqbtWUqVK9klsIeDsiKFBU4XcD4dYCau41uassFWTq/2GoZOjgJVNmdCjWSqoPyr22zu7uQ==@linaro.org
X-Gm-Message-State: AOJu0YzLgO3QiOy14xNVDLe4uDcU6T2BNGtXz7cXkP173NOUGPxFGSnR
	LYyy9QGwiGhTaSyAf4NnPazmiLuG7l+vvmP6Z97r/rq3yzav/KHLzjNk2+gxFYPqxA==
X-Gm-Gg: ASbGncuxRvAtpBh2kP4xvw1HL5V0vwAY79bbhJVV9jTj9zofalORzWv6izAPt10IlmR
	orxVOOEvBinnM0pQuIohxy9l7f2yUV4VNpfshheMjZwStt/TtGL6yiEf20DQR9Z0JfWgNj8JYAB
	NxnEj/iBj33wbkrS699JITVI3GFJRQdOoX81ocR+5PERcyL1dBcbjpDK+1kOaGqAGDvA3Uy/lVo
	hznwdFmdkOFd4ittk2+ORIgJhWNSHgN4px5XbqIIVsBcTUwq1YHspMNKmnTFkb9nuCEyendaH62
	HSPNW9z1WfD6vmphb/6zY8zxT7Rw8tuQGpuevfNvcoerxL6X3dKeeDo=
X-Google-Smtp-Source: AGHT+IGlfrWg0bBEua+CzOZalX3WCoH9cy+wc/InKanm94Z9NrDL7g5YrDWENrVtS87EAmZz7TQInQ==
X-Received: by 2002:a17:903:2284:b0:215:b473:1dc9 with SMTP id d9443c01a7336-22780e5ffb1mr15478685ad.46.1742509834560;
        Thu, 20 Mar 2025 15:30:34 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f4581csm3370145ad.59.2025.03.20.15.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 15:30:34 -0700 (PDT)
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
Subject: [PATCH v2 23/30] target/arm/cpu: remove inline stubs for aarch32 emulation
Date: Thu, 20 Mar 2025 15:29:55 -0700
Message-Id: <20250320223002.2915728-24-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
References: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: wMd4yWO/QlZh

Directly condition associated calls in target/arm/helper.c for now.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/cpu.h    | 8 --------
 target/arm/helper.c | 6 ++++++
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index b1c3e463267..c1a0faed3ad 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1222,7 +1222,6 @@ int arm_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
  */
 void arm_emulate_firmware_reset(CPUState *cpustate, int target_el);
 
-#ifdef TARGET_AARCH64
 int aarch64_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int aarch64_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq);
@@ -1254,13 +1253,6 @@ static inline uint64_t *sve_bswap64(uint64_t *dst, uint64_t *src, int nr)
 #endif
 }
 
-#else
-static inline void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq) { }
-static inline void aarch64_sve_change_el(CPUARMState *env, int o,
-                                         int n, bool a)
-{ }
-#endif
-
 void aarch64_sync_32_to_64(CPUARMState *env);
 void aarch64_sync_64_to_32(CPUARMState *env);
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index fa23e309040..73e98532c03 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6564,7 +6564,9 @@ static void zcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
      */
     new_len = sve_vqm1_for_el(env, cur_el);
     if (new_len < old_len) {
+#ifdef TARGET_AARCH64
         aarch64_sve_narrow_vq(env, new_len + 1);
+#endif
     }
 }
 
@@ -10648,7 +10650,9 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
          * Note that new_el can never be 0.  If cur_el is 0, then
          * el0_a64 is is_a64(), else el0_a64 is ignored.
          */
+#ifdef TARGET_AARCH64
         aarch64_sve_change_el(env, cur_el, new_el, is_a64(env));
+#endif
     }
 
     if (cur_el < new_el) {
@@ -11665,7 +11669,9 @@ void aarch64_sve_change_el(CPUARMState *env, int old_el,
 
     /* When changing vector length, clear inaccessible state.  */
     if (new_len < old_len) {
+#ifdef TARGET_AARCH64
         aarch64_sve_narrow_vq(env, new_len + 1);
+#endif
     }
 }
 #endif
-- 
2.39.5
