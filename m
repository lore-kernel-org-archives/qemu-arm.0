Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp3989076ejv;
        Tue, 2 Apr 2024 07:24:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUZElYEZvmydV0CHgbPUKjDBDWZrlZgzKbc7zlhjfo55EV+937PQxMh+vgQQhXRjcs3gzYiBReTgUSJYa0hJF55djDAJxeb
X-Received: by 2002:a05:600c:5710:b0:414:9103:e38c with SMTP id jv16-20020a05600c571000b004149103e38cmr8563451wmb.22.1712067896185;
        Tue, 02 Apr 2024 07:24:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712067896; cv=none;
        d=google.com; s=arc-20160816;
        b=YtHmciGB7ihG6g6guYh4aKd2oahv1hMPdSzXet+tZ5jhXq5M9svc2Hs7mlRF27eaps
         jIq7WRm2FVFfE0UCyqGz+i5EiCsFh6CuMTLG78Y1nVT+ORkk+yhcNuhJuFIkT4ciXz+x
         OmZjjROtWhFfKMRopItqMr/spTdgjDycmtm4OKYDHD/fvQSna51M8UA1qOZfCP1h5RR/
         ebPCme0xoo5u5D5ibvMbPkExvt6ghFcAKry6fwTXCEMEblsQbFA7r2Z6TGQKnfDk9LCI
         RnmNYBR6Rq4kRdCBt5pZY8WQXdetoJFo19P5a5dkKppkidnl5vFuAxdgRfwUxISqSZNv
         y8Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=AnqQaUG1ZoPVgZF2Ex29MI5m2mNV0++IO/ZIMEDgcJ8=;
        fh=7Z8cl1MrPkBtzn89dOXZPK9rKEy1+JIbgnqa0lx6jHo=;
        b=ymoj8be1it0jcP5XvHclKTX/woGIhhpx93+aPyw4zPc2s+W61p+6fq24ffdmqLWZpx
         Ecw3qHroMsqyWejYKgo1XftKmD2+sUnUyR8TLUtG79CT5aqPXOtO8mlENLdKzg63HXF0
         v2LmBS4JZYLI9FTh4tMYAwRVi7NhekssFpiv6LHkAGls2QVtHLswgqc7MDwrLk/mRtSI
         V0t8MqY2mV0MkZPW4WtO3JZybgUJ2HH9597i9Ncp1gnhCU8ai64Juh3k+EA1vz6qZPf2
         3TdlaSVBDflD7jhsAENTrr8z/cEJ8InW7wCunKC5d+ubxKD9Eru7BecD119jAR6uxhig
         5Z+w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="cUj5sl/c";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e21-20020a05600c4b9500b004146fcabfadsor2791547wmp.11.2024.04.02.07.24.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 02 Apr 2024 07:24:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="cUj5sl/c";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712067896; x=1712672696; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AnqQaUG1ZoPVgZF2Ex29MI5m2mNV0++IO/ZIMEDgcJ8=;
        b=cUj5sl/cIsu1+E96XJh0OjST+yg2s7xsCujtP8SKt+DmlDCpSBoEs9tfPlJADVDppR
         mMqGdWKPC0Hyzszy1Pj1V7YljrdKJu5FalAneOyYaSNnztULMRJhgnw6berUj2lhtok6
         cS5FcmlDrl7XU9dPAPj43rTgK4xrK4v4BArx3aYwEs3oaxcBD8R9xzsMLTSHCfXnPikX
         icUxax6r5g1J9ny31sBVT6JCA53hwTY+RRpvgx2IAs30F3aPOK9xNmky6Sn4vQiYFuZx
         sh6N7npvdRScJxjj1xU7cL3DD2ZqxoCJpdtFyOClf+PSMGmyi4bcb78BTmvBSV/Sr4tM
         IHvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712067896; x=1712672696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AnqQaUG1ZoPVgZF2Ex29MI5m2mNV0++IO/ZIMEDgcJ8=;
        b=BEIGy3KjJNvcgi+RDQCGV0lKPc8xoqJn7GSpp9df0xy6II71kMaSOyffknzVa2/shJ
         Bl0VGVZKrTwgnQNFkv1+XBppQzFgLnw2tb25oGhR/qsWrFb3mPkt6nzNMFiI/DB7kD+a
         ve2DoviRw42e7XjR5yJvsQpch2Z2gbJ9xRUQOWe52Lh+qEsKqw6SBzgZPfyckCOK80tY
         uSmCtnnrHRRQStMGqkskL4sCB6/9FbCZmBm8yK+ybNM0JWPXAKU0AgeVOi/Qg2lOO+MM
         MpIBkAcIW/JKsQIokOjEY+fqpSAwzMYSNUXJ/50GpVfn8ImIwQgEB7v0Sna5DvCZyMbB
         c0Kw==
X-Forwarded-Encrypted: i=1; AJvYcCWWrYPPicsl5Xko0HzzGClDLxGSsm1cU6osroed9rURr9YiMNAdDlIoppi72fnvqRRLQsQncROTopzEcBzkKyI2CAIEtjSy
X-Gm-Message-State: AOJu0Yy5RFnGB9OgI5GeH+iPuIgZEyiltqUf0F1joAJmvWyJOfRntROK
	7I8rCu5nVQNe7gmVqKwaKtRWDHJrkxEUZZMgO333RwmOuWzn6c7dRVj1H5lhyf42qQ==
X-Google-Smtp-Source: AGHT+IFjRWWqwBYV0XJAWcClqbaYZG/hgJysFiD/espoX/7BuA6K9XVvWp7g04khszacdMl9w6MpwA==
X-Received: by 2002:a05:600c:3554:b0:414:6ee:a392 with SMTP id i20-20020a05600c355400b0041406eea392mr9854928wmq.8.1712067895857;
        Tue, 02 Apr 2024 07:24:55 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.187.202.91])
        by smtp.gmail.com with ESMTPSA id ay15-20020a5d6f0f000000b003434c764f01sm5886406wrb.107.2024.04.02.07.24.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 02 Apr 2024 07:24:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	qemu-block@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 03/15] gdbstub/system: Rename 'user_ctx' argument as 'ctx'
Date: Tue,  2 Apr 2024 16:24:18 +0200
Message-ID: <20240402142431.70700-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240402142431.70700-1-philmd@linaro.org>
References: <20240402142431.70700-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 5Day8cTrttYa

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20240313213339.82071-4-philmd@linaro.org>
---
 gdbstub/internals.h | 8 ++++----
 gdbstub/system.c    | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/gdbstub/internals.h b/gdbstub/internals.h
index 66c939c67f..32f9f63297 100644
--- a/gdbstub/internals.h
+++ b/gdbstub/internals.h
@@ -187,7 +187,7 @@ typedef union GdbCmdVariant {
 
 #define get_param(p, i)    (&g_array_index(p, GdbCmdVariant, i))
 
-void gdb_handle_query_rcmd(GArray *params, void *user_ctx); /* system */
+void gdb_handle_query_rcmd(GArray *params, void *ctx); /* system */
 void gdb_handle_query_offsets(GArray *params, void *user_ctx); /* user */
 void gdb_handle_query_xfer_auxv(GArray *params, void *user_ctx); /*user */
 void gdb_handle_query_xfer_siginfo(GArray *params, void *user_ctx); /*user */
@@ -201,11 +201,11 @@ void gdb_handle_query_supported_user(const char *gdb_supported); /* user */
 bool gdb_handle_set_thread_user(uint32_t pid, uint32_t tid); /* user */
 bool gdb_handle_detach_user(uint32_t pid); /* user */
 
-void gdb_handle_query_attached(GArray *params, void *user_ctx); /* both */
+void gdb_handle_query_attached(GArray *params, void *ctx); /* both */
 
 /* system only */
-void gdb_handle_query_qemu_phy_mem_mode(GArray *params, void *user_ctx);
-void gdb_handle_set_qemu_phy_mem_mode(GArray *params, void *user_ctx);
+void gdb_handle_query_qemu_phy_mem_mode(GArray *params, void *ctx);
+void gdb_handle_set_qemu_phy_mem_mode(GArray *params, void *ctx);
 
 /* sycall handling */
 void gdb_handle_file_io(GArray *params, void *user_ctx);
diff --git a/gdbstub/system.c b/gdbstub/system.c
index a3ce384cd1..d235403855 100644
--- a/gdbstub/system.c
+++ b/gdbstub/system.c
@@ -488,13 +488,13 @@ bool gdb_can_reverse(void)
  */
 
 void gdb_handle_query_qemu_phy_mem_mode(GArray *params,
-                                        void *user_ctx)
+                                        void *ctx)
 {
     g_string_printf(gdbserver_state.str_buf, "%d", phy_memory_mode);
     gdb_put_strbuf();
 }
 
-void gdb_handle_set_qemu_phy_mem_mode(GArray *params, void *user_ctx)
+void gdb_handle_set_qemu_phy_mem_mode(GArray *params, void *ctx)
 {
     if (!params->len) {
         gdb_put_packet("E22");
@@ -509,7 +509,7 @@ void gdb_handle_set_qemu_phy_mem_mode(GArray *params, void *user_ctx)
     gdb_put_packet("OK");
 }
 
-void gdb_handle_query_rcmd(GArray *params, void *user_ctx)
+void gdb_handle_query_rcmd(GArray *params, void *ctx)
 {
     const guint8 zero = 0;
     int len;
@@ -539,7 +539,7 @@ void gdb_handle_query_rcmd(GArray *params, void *user_ctx)
  * Execution state helpers
  */
 
-void gdb_handle_query_attached(GArray *params, void *user_ctx)
+void gdb_handle_query_attached(GArray *params, void *ctx)
 {
     gdb_put_packet("1");
 }
-- 
2.41.0
