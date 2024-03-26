Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp1432569ejj;
        Tue, 26 Mar 2024 08:46:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVJFMjKxkYXBQ0YIBFJHgZJobQOVcYo8W7zj+LZGMm+k1mjBbfpZKHz+8CFsNvLTbbDCis7zJsDAZWH6B2lOCaM5XYFHCi+
X-Received: by 2002:a5d:6b82:0:b0:33e:c6c4:43bb with SMTP id n2-20020a5d6b82000000b0033ec6c443bbmr1881011wrx.6.1711467960085;
        Tue, 26 Mar 2024 08:46:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711467960; cv=none;
        d=google.com; s=arc-20160816;
        b=F/g5C54Q20LlLrId0JSKLHihTQGU4dUOU3apq8mpk35Z/EICNbSF0qBB2eU+lR7NXY
         2KjMwWSOfKuRturYa5PCsWx8j5mSQObz95XcJJBBlCL2BagZ8lwNkYZkA5rmjsmfPDyv
         mhX0uAjyepxkGlxSC7dZwuOv6jFLm3DAt2kPHTiOeuMLWJA+LT53KYHGW0ybSIZSEn5I
         C240HvAT8bj++Ef1+5njNQ0d8eQ0x7NSPDX5njQwxDJcS1Y3smPLoz14kes0UIg3REUZ
         vTeljBPfoW4yi+v9qFxseVCJ8pxnYEs/6fwa+8YpM/QSYIJ41JaB2Q2HP/+xm2k4wuLv
         QV5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=PZoPdLMWukYfNxcXkCat/bL6sGsc7qqjORe7Wmplu6s=;
        fh=IRJHYUsl4pUMP/W5Atc7wCQLfIjWr7hM82cF26esyfM=;
        b=zO31QybRre0B/agnGCEL7ObdXrin9KvhzGo8xgGrX7d+S+AQ/yW8oPzKxa3BsM3KRl
         EcsHA+JQqmqbF7/6kSB3xqcDUOVlM+9NFiJvcxCxN7IMYO5YtCrIutt5y8Zl3Hs+Qg3f
         k0j3tXdILNPFJmNsdvQeZyudE493RfePAx71qdKXBOTpZIXg/0V8PmNWMfOSPjY1D68b
         Z4Gf7JvZ+KAvTG7ULUUa2qcYOizP/qMsNT5laC0/bCUx9dL9naWn4QxxhjLYh6TtO+wR
         AnvDR3g2Wi0ojln47DiWDjvySIIlXxkAl97dNLn7abrOQW6TNIl1RTj/8Z7ZI/LYif0H
         hDxA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zotP3w1l;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id g2-20020adffc82000000b00341b75b4c8dsor2054216wrr.2.2024.03.26.08.46.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 26 Mar 2024 08:46:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zotP3w1l;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711467960; x=1712072760; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PZoPdLMWukYfNxcXkCat/bL6sGsc7qqjORe7Wmplu6s=;
        b=zotP3w1lU01Km2bAGx+FUm4KFCQ0vmnWQ+ufJFiQUBkhLBMgHhtgpbs8NYXVOdycYT
         NH8rIIFg0fS85elRh+k9Tw2pUu5wYhnXxWu1+WxScrguUVdxuezsl0QHTCi2eZle2MLT
         GRxVzSF33CUEJqrqz8U8YLovhwPiRzdxooZjXfx6Gu6G/LZEljxIMA/eTTKz4qCWYhUC
         ubt7bE3Fl4VMxZtPDn5n/SIq/fyQhcp9MvTKLTAK5mn9IZQWg8y5PLUDr32QBW/z/LUf
         eGuRBFbIwdQSWwXfdu+Bp11Ns6MAKSqIUJQ4zI/h5pSWdPm2X/Os/vEpOk8KKnIb7QEi
         /vzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711467960; x=1712072760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PZoPdLMWukYfNxcXkCat/bL6sGsc7qqjORe7Wmplu6s=;
        b=NmJJhpN3rjAom9SJid1LBUgVD8X+qGj8YzHDH6XPwtZ+HvmTGJxXySLJZ8IithGXtO
         +6XZ4gqh2zPAyRwjKibzzNDFCULQy0IGOWLqRMNNyfW+Cfr2WC0uaN7zAEPOPZWWTEFv
         SI/qRASGAdChsoSyuq4+1f1Sm/3dY/vQyITgxMlzfcMnhcmxizti+DukkEc/W6ICZOxQ
         Jmbf1TWr7dPoS2vi6k+w/q5vUTVkPzc3n9TV5OkO8mLvpGJg8a/4A5cNuHvhYSelAdQY
         aOtOrNYU5/e9LcAZcC71wTsgVxJO9jG3hyNSmsI7Nj0fnXUA5OTmfXtHKGMN7yYGfNZn
         ko1Q==
X-Forwarded-Encrypted: i=1; AJvYcCW5KLk8ydcGZ3cWyOsQDHrunE9/Fg2X2FCbuh/ndxS6AjdXMzasBINmg8TQSm4g7k2hnZz+TmuzqJEzGEugR02xNNkK+L39
X-Gm-Message-State: AOJu0YwM1evAxfwI+NNdX4kGBwdegi8tcHcKFJVnIYoC4Z/877qiFQl3
	XekUjDGzjJ+sPAenJZjFYe0Q/e7m2pMMSR5TrmtoKcu2X8X+TRbTODLapeHYL3JU0Q==
X-Google-Smtp-Source: AGHT+IGn9vVSpDNh8rQWuVgF1+Gw5LLVBbsr7W6HSykE2xDWZmuWfsooId8xN1cHVcfv8a/1nR/yzg==
X-Received: by 2002:adf:e6cc:0:b0:33e:ce08:79b5 with SMTP id y12-20020adfe6cc000000b0033ece0879b5mr1645151wrm.9.1711467959787;
        Tue, 26 Mar 2024 08:45:59 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.155.229])
        by smtp.gmail.com with ESMTPSA id s17-20020adfa291000000b00341b7388dafsm11861938wra.77.2024.03.26.08.45.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 26 Mar 2024 08:45:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	Yao Xingtao <yaoxt.fnst@fujitsu.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: [PULL 09/13] contrib/plugins/execlog: Fix compiler warning
Date: Tue, 26 Mar 2024 16:45:00 +0100
Message-ID: <20240326154505.8300-10-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240326154505.8300-1-philmd@linaro.org>
References: <20240326154505.8300-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: U+dWoczFBRr4

From: Yao Xingtao <yaoxt.fnst@fujitsu.com>

1. The g_pattern_match_string() is deprecated when glib2 version >= 2.70.
   Use g_pattern_spec_match_string() instead to avoid this problem.

2. The type of second parameter in g_ptr_array_add() is
   'gpointer' {aka 'void *'}, but the type of reg->name is 'const char*'.
   Cast the type of reg->name to 'gpointer' to avoid this problem.

compiler warning message:

  contrib/plugins/execlog.c:330:17: warning: ‘g_pattern_match_string’
  is deprecated: Use 'g_pattern_spec_match_string' instead [-Wdeprecated-declarations]
    330 |                 if (g_pattern_match_string(pat, rd->name) ||
        |                 ^~
  In file included from /usr/include/glib-2.0/glib.h:67,
                   from contrib/plugins/execlog.c:9:
  /usr/include/glib-2.0/glib/gpattern.h:57:15: note: declared here
     57 | gboolean      g_pattern_match_string   (GPatternSpec *pspec,
        |               ^~~~~~~~~~~~~~~~~~~~~~
  contrib/plugins/execlog.c:331:21: warning: ‘g_pattern_match_string’
  is deprecated: Use 'g_pattern_spec_match_string' instead [-Wdeprecated-declarations]
    331 |                     g_pattern_match_string(pat, rd_lower)) {
        |                     ^~~~~~~~~~~~~~~~~~~~~~
  /usr/include/glib-2.0/glib/gpattern.h:57:15: note: declared here
     57 | gboolean      g_pattern_match_string   (GPatternSpec *pspec,
        |               ^~~~~~~~~~~~~~~~~~~~~~
  contrib/plugins/execlog.c:339:63: warning: passing argument 2 of
  ‘g_ptr_array_add’ discards ‘const’ qualifier from pointer target type [-Wdiscarded-qualifiers]
    339 |                             g_ptr_array_add(all_reg_names, reg->name);
        |                                                            ~~~^~~~~~
  In file included from /usr/include/glib-2.0/glib.h:33:
  /usr/include/glib-2.0/glib/garray.h:198:62: note: expected
  ‘gpointer’ {aka ‘void *’} but argument is of type ‘const char *’
    198 |                                            gpointer          data);
        |                                            ~~~~~~~~~~~~~~~~~~^~~~

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2210
Signed-off-by: Yao Xingtao <yaoxt.fnst@fujitsu.com>
Message-ID: <20240326015257.21516-1-yaoxt.fnst@fujitsu.com>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 contrib/plugins/execlog.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/contrib/plugins/execlog.c b/contrib/plugins/execlog.c
index a1dfd59ab7..fab18113d4 100644
--- a/contrib/plugins/execlog.c
+++ b/contrib/plugins/execlog.c
@@ -311,6 +311,24 @@ static Register *init_vcpu_register(qemu_plugin_reg_descriptor *desc)
     return reg;
 }
 
+/*
+ * g_pattern_match_string has been deprecated in Glib since 2.70 and
+ * will complain about it if you try to use it. Fortunately the
+ * signature of both functions is the same making it easy to work
+ * around.
+ */
+static inline
+gboolean g_pattern_spec_match_string_qemu(GPatternSpec *pspec,
+                                          const gchar *string)
+{
+#if GLIB_CHECK_VERSION(2, 70, 0)
+    return g_pattern_spec_match_string(pspec, string);
+#else
+    return g_pattern_match_string(pspec, string);
+#endif
+};
+#define g_pattern_spec_match_string(p, s) g_pattern_spec_match_string_qemu(p, s)
+
 static GPtrArray *registers_init(int vcpu_index)
 {
     g_autoptr(GPtrArray) registers = g_ptr_array_new();
@@ -327,8 +345,8 @@ static GPtrArray *registers_init(int vcpu_index)
             for (int p = 0; p < rmatches->len; p++) {
                 g_autoptr(GPatternSpec) pat = g_pattern_spec_new(rmatches->pdata[p]);
                 g_autofree gchar *rd_lower = g_utf8_strdown(rd->name, -1);
-                if (g_pattern_match_string(pat, rd->name) ||
-                    g_pattern_match_string(pat, rd_lower)) {
+                if (g_pattern_spec_match_string(pat, rd->name) ||
+                    g_pattern_spec_match_string(pat, rd_lower)) {
                     Register *reg = init_vcpu_register(rd);
                     g_ptr_array_add(registers, reg);
 
@@ -336,7 +354,7 @@ static GPtrArray *registers_init(int vcpu_index)
                     if (disas_assist) {
                         g_mutex_lock(&add_reg_name_lock);
                         if (!g_ptr_array_find(all_reg_names, reg->name, NULL)) {
-                            g_ptr_array_add(all_reg_names, reg->name);
+                            g_ptr_array_add(all_reg_names, (gpointer)reg->name);
                         }
                         g_mutex_unlock(&add_reg_name_lock);
                     }
-- 
2.41.0
