Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp3989017ejv;
        Tue, 2 Apr 2024 07:24:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW0FC9a5iDIQybOXFG226oxaYYSF+PMEmiyl5ICiC6ezfFRveqPj0uo/yPYdGGhX9vgcMwqWI87TzkrF0l/RhYWwhtoK+/Y
X-Received: by 2002:a2e:bc07:0:b0:2d8:357f:44da with SMTP id b7-20020a2ebc07000000b002d8357f44damr324426ljf.6.1712067890148;
        Tue, 02 Apr 2024 07:24:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712067890; cv=none;
        d=google.com; s=arc-20160816;
        b=ktFqT+RN3Kg0jSUzIKT1GJ51a694s8luxQ+O4KFOqDZPSzZKoWtfJWWMn762IbvW/1
         VKoxBEr4NEprCvNGei4D3u3zA1b1YB5nVbdWEwLn81hswGrjLR53kqcdxRZ3412vXDiO
         SCoFe8w2k2g86VaKoiXuZ3kV5956JKX1Y7X+o1cxOtd9uqP60HI6kq0Gta9QITxeV6h5
         C7qvVZ5mZ27szYrsb0oEG8bqqSG8Oo8SevemJBIdV0lIBY3i0DphPM6B6+f60tjH7s1C
         EuuHm0nN8U2Io++69J60lig8sP/5N6EfK2X4yAUhtbUrwDTxlFUOzDDfaT6PWk7udRrG
         a/uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=1SmMA2WUYuMdtgR4elvc+VfJjaj3cdDvnYNz/tQrOUw=;
        fh=w0wUO0BlzsbxW6CA6QGN0vDd9oyZg5osTBDCp4bpVfk=;
        b=i7lorfewec1jYUirCmjsIAcNuKHwH2SiWGJ6iXKINr392OT1C/nr58dSY13qhXGoaj
         r6sLgsYoK+iHojqYVEUGNwmweIAdqhLXa/WkpBPFf5aCy3YkYgSaKnmmYU8HoZgLxcAn
         4N980viI6Q72spKYMdhmem+jhnSWc/JtzGUKPlmaqMarV4a6IpgrnngNyzdvlUmYbsW/
         X7K3+eOQ/FFnN4Tq4MBL+SyHl6g9m9UPIDO8r+R6B40MugA7w1X0XBRQKg8IouVfO9Sa
         Nr7WBTVvU6OQAum0cR6HvZIa3CSe6zH9Fpg/hU7u5CWAidC/JP/aE4DAbknTJxeUahWS
         UkBQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aNUSujoN;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id i7-20020a05600c290700b0041553ef4391sor1958431wmd.13.2024.04.02.07.24.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 02 Apr 2024 07:24:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aNUSujoN;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712067890; x=1712672690; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1SmMA2WUYuMdtgR4elvc+VfJjaj3cdDvnYNz/tQrOUw=;
        b=aNUSujoNjlw5Er1IyLHd85x/EPpz3aKYeu0+pc5Yf+tVtpmCkO2Bxke8CzFihvND8N
         cbgh9Ctto3dLK2kOJIzneg56rAAQhhmce7hmLDZz6wjJ3W5jtiuPt+93uZSvRO5dP1CV
         7qpUYu3MQ5wjKAIaRerY1wMzFl+AxHvGNEsf1O4DKEBHJ7eiwS2w3wmGSnlUqNEH9s8+
         SoKjc8dATqH73cSa59f6ikOV+PYsxqpdSqGs2S8RHyR/SlgdLlN11jMzFaMUzTK9XgT1
         g7nZ8v3tOxpmyKsmcnvdjDMpRXgJTKSeXKMex0NIFpv1QhNkuT5y/lejbUT9UGOZ3p78
         eylQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712067890; x=1712672690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1SmMA2WUYuMdtgR4elvc+VfJjaj3cdDvnYNz/tQrOUw=;
        b=n76v30bAFPXk3OXKH4FlIf71y3kyMieD8de96SUue7oRQzpk212M1yO+Wez8IghTQG
         zs0F1srUvdqOtnEaD1x5qTCREr3z6spvZipo8zN1LGcTcqNzExVDNkX2hRGpj+a0u0Q9
         75zcm1NXw9WOCU+wobITxhW6R1FDpEOwvnVMQT0R609oOv2Cy9vLqhRwak+InqR0r5pq
         FUvCbSlyl4OaISMDkELG8UYpJkt9ggnIPJvu0KtI8gqdY0RqR2HRvbKEyEcMGzC0qaWX
         K/e4pu+PWDMAC/JDef3qTz6dbz+xwD7Jmv+ayvQyzbxT48kw/PZHBTCtbZKDdn9UiGMh
         6aUg==
X-Forwarded-Encrypted: i=1; AJvYcCXr1dmQM0OmR/A3uE3D0d/r/BRrzsF3BfNXxakeCVN+EBS9UgGODX8OYT+T2L2CNoR2kzhldav5chjipZCMxGSd0+Lan1kE
X-Gm-Message-State: AOJu0Yzje0yQO3knScYJ3Q+JO2X5am2RtlvsINIEOvFr7SfRTkC0Gei7
	ZH/RYhJT+TvJUOcGiNzTgMgOPxrTLIZupqc2mic1uHm5XmUwmEQ1y7L/EVuZQb+zxfOb8Jx7vIQ
	V6DtnAg==
X-Google-Smtp-Source: AGHT+IFCfFzlxgMnREUyncytBY03AG2ycFfrVg2xQ9fXZDUncxBQQ/fBaP/YQ6jaH0P9nFaeyeQWAQ==
X-Received: by 2002:a05:600c:1797:b0:415:8651:9bae with SMTP id x23-20020a05600c179700b0041586519baemr2547892wmo.41.1712067889798;
        Tue, 02 Apr 2024 07:24:49 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.187.202.91])
        by smtp.gmail.com with ESMTPSA id l2-20020adff482000000b0033ec312cd8asm14249866wro.33.2024.04.02.07.24.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 02 Apr 2024 07:24:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	qemu-block@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 02/15] gdbstub: Correct invalid mentions of 'softmmu' by 'system'
Date: Tue,  2 Apr 2024 16:24:17 +0200
Message-ID: <20240402142431.70700-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240402142431.70700-1-philmd@linaro.org>
References: <20240402142431.70700-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: BltkH6KH1YL3

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20240313213339.82071-3-philmd@linaro.org>
---
 gdbstub/internals.h | 20 ++++++++++----------
 gdbstub/system.c    |  2 +-
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/gdbstub/internals.h b/gdbstub/internals.h
index e83b179920..66c939c67f 100644
--- a/gdbstub/internals.h
+++ b/gdbstub/internals.h
@@ -115,7 +115,7 @@ void gdb_read_byte(uint8_t ch);
 
 /*
  * Packet acknowledgement - we handle this slightly differently
- * between user and softmmu mode, mainly to deal with the differences
+ * between user and system mode, mainly to deal with the differences
  * between the flexible chardev and the direct fd approaches.
  *
  * We currently don't support a negotiated QStartNoAckMode
@@ -125,7 +125,7 @@ void gdb_read_byte(uint8_t ch);
  * gdb_got_immediate_ack() - check ok to continue
  *
  * Returns true to continue, false to re-transmit for user only, the
- * softmmu stub always returns true.
+ * system stub always returns true.
  */
 bool gdb_got_immediate_ack(void);
 /* utility helpers */
@@ -135,12 +135,12 @@ CPUState *gdb_first_attached_cpu(void);
 void gdb_append_thread_id(CPUState *cpu, GString *buf);
 int gdb_get_cpu_index(CPUState *cpu);
 unsigned int gdb_get_max_cpus(void); /* both */
-bool gdb_can_reverse(void); /* softmmu, stub for user */
+bool gdb_can_reverse(void); /* system emulation, stub for user */
 int gdb_target_sigtrap(void); /* user */
 
 void gdb_create_default_process(GDBState *s);
 
-/* signal mapping, common for softmmu, specialised for user-mode */
+/* signal mapping, common for system, specialised for user-mode */
 int gdb_signal_to_target(int sig);
 int gdb_target_signal_to_gdb(int sig);
 
@@ -157,12 +157,12 @@ void gdb_continue(void);
 int gdb_continue_partial(char *newstates);
 
 /*
- * Helpers with separate softmmu and user implementations
+ * Helpers with separate system and user implementations
  */
 void gdb_put_buffer(const uint8_t *buf, int len);
 
 /*
- * Command handlers - either specialised or softmmu or user only
+ * Command handlers - either specialised or system or user only
  */
 void gdb_init_gdbserver_state(void);
 
@@ -187,7 +187,7 @@ typedef union GdbCmdVariant {
 
 #define get_param(p, i)    (&g_array_index(p, GdbCmdVariant, i))
 
-void gdb_handle_query_rcmd(GArray *params, void *user_ctx); /* softmmu */
+void gdb_handle_query_rcmd(GArray *params, void *user_ctx); /* system */
 void gdb_handle_query_offsets(GArray *params, void *user_ctx); /* user */
 void gdb_handle_query_xfer_auxv(GArray *params, void *user_ctx); /*user */
 void gdb_handle_query_xfer_siginfo(GArray *params, void *user_ctx); /*user */
@@ -203,7 +203,7 @@ bool gdb_handle_detach_user(uint32_t pid); /* user */
 
 void gdb_handle_query_attached(GArray *params, void *user_ctx); /* both */
 
-/* softmmu only */
+/* system only */
 void gdb_handle_query_qemu_phy_mem_mode(GArray *params, void *user_ctx);
 void gdb_handle_set_qemu_phy_mem_mode(GArray *params, void *user_ctx);
 
@@ -213,11 +213,11 @@ bool gdb_handled_syscall(void);
 void gdb_disable_syscalls(void);
 void gdb_syscall_reset(void);
 
-/* user/softmmu specific syscall handling */
+/* user/system specific syscall handling */
 void gdb_syscall_handling(const char *syscall_packet);
 
 /*
- * Break/Watch point support - there is an implementation for softmmu
+ * Break/Watch point support - there is an implementation for system
  * and user mode.
  */
 bool gdb_supports_guest_debug(void);
diff --git a/gdbstub/system.c b/gdbstub/system.c
index 83fd452800..a3ce384cd1 100644
--- a/gdbstub/system.c
+++ b/gdbstub/system.c
@@ -1,5 +1,5 @@
 /*
- * gdb server stub - softmmu specific bits
+ * gdb server stub - system specific bits
  *
  * Debug integration depends on support from the individual
  * accelerators so most of this involves calling the ops helpers.
-- 
2.41.0
