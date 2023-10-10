Received: by 2002:a17:906:b756:b0:9b2:89ee:1eb8 with SMTP id fx22csp300699ejb;
        Tue, 10 Oct 2023 00:50:02 -0700 (PDT)
X-Received: by 2002:a17:906:257:b0:9b8:8bcf:8739 with SMTP id 23-20020a170906025700b009b88bcf8739mr14631483ejl.75.1696924202058;
        Tue, 10 Oct 2023 00:50:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696924202; cv=none;
        d=google.com; s=arc-20160816;
        b=TLIgpkIMh+0wiEYHyHYtfV3BHASLVQOYczI80isvV7CnDo801EPNdxl/GZ5qfs7npO
         ve22CZwt3BrBM6b3MqmV+vMKT5vcHoaSrBz8DP+oWMDWzJmIN+QD95MyXYNoCqv/fYAW
         n47E/oD/WvY6hRSsIuWawrSCBL08BGJpThx/Z3FpgIp7GuWxucJMwz3rzTC0vnmFr8ms
         bCYalEFn6YUJsPq/X8ADBXdHzBbRe2Xpgriosejoy0x09UEyHVTgLqhxYo85NL4hn4MG
         B96PpqkNwwamPN9obIuipN6n5npezzV1WtQtuW/i4arM9ckmZu+5yYIjYnmam2CxFVW1
         /b6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=xBzDwZo1XeWt7ItIGhOXUN3QV+md3tt2cNhSMxgmiwU=;
        fh=fvH34tHwViUOu98hGoeGCIVUhAkw1BzDAuMB2MXJND8=;
        b=wLh9rdFqeb0jLO94ypvhF/l1Nxy8XU7RnkaK08KUWkH4zHomxvZuMd6Ew1WEKNZ6wC
         RkLtSeCXVPAyRIFUR1l6hA7qNsXJMUub3NhspEo4vwc05UoN2kDNZNcavMd9M13z1v7B
         XkF3XMxoXWxKnQZ1Ex/NtcRTsO6YglCpBn+w0W19/8y6ivsu2DJ6TpKDcB0z7/ZoUIP8
         //Igrn8ujZbBXmdxWTlqR9bATf+0HauSz42cFG0eyPFecgiq90EVt+i3oEbpNCDBtVEZ
         iZj8HQ7vfH1TcFR2TAhlFEuUu2y+WOQqozuDZpxh1xiqwq1p0wMBktSL0XjDUIQN3lZN
         YV0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=is+SdqdB;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ss4-20020a170907c00400b009ba0a38f293sor2110769ejc.15.2023.10.10.00.50.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Oct 2023 00:50:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=is+SdqdB;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696924202; x=1697529002; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xBzDwZo1XeWt7ItIGhOXUN3QV+md3tt2cNhSMxgmiwU=;
        b=is+SdqdBR3FdYGRFUzPCNYA56GalprCdG6vNgA40AtD9hPzMx8Ncb+xzd54Wr2ZJCM
         52szOEV2adthd0s2OGfty92vP89Lyc6S6k0FVlgiEZD0i/P2EjQ2LuaEWQybSZioT3c7
         UpS4fJIxy160ZE1ZF9+57SvxaWIbaj4E3W6DWxl7B6ZY2PfZjLi9F9ACarjupKn3Yn5Z
         KlcvbAqaEqIJ1nPBPlrbaO7qhjwV7ifYpckE/xC++gZCpAelZkDzBc+0i8d03xRWYdxV
         PKz8DxWlshLN1RhNT6yIM0m+Dq8xZ5BsACcXZUvy5RAs3GUf+Cj2iRVx8mMWHQT0qHnv
         J5Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696924202; x=1697529002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xBzDwZo1XeWt7ItIGhOXUN3QV+md3tt2cNhSMxgmiwU=;
        b=NGPdVLIKfy9VW1Nv2ADc5z7HaW2OoHeSF85HrgVaxEMIB+kd6RbI5uGG3UrD2oQFVh
         C9xCSrkbR8B4EpPSLCyrERCMf0O8wLtpszjYoSbBXgIwX7a/QBCwo3KgKj6JX2wGrfT5
         GTRSdexptdKz0TERWPZN5IgHOzB1HmVHnmSvp0W/McVRSFHPHYELiAA/pk62JEMWqgt5
         EQfTHwjY9JZkp8y6IrZ+DEDj1b2DqDVz1DVfTAdeelKRzhjJfBNyRdSrpQTlt5BXD7D6
         AOYL5zn6htmYW2h/al6kGkWxA18FCzbFssWJPovN50+mS/nGPP0OmJ0FnyT/sWlIYFM1
         vsew==
X-Gm-Message-State: AOJu0YxCQ16p/pW/2EHyj4zLgYkKT9PfB0t+6htyGXhTih9Hg+TaoqjF
	RSqhPGCSqTBbxzkttId7HAN3c5/3
X-Google-Smtp-Source: AGHT+IFQGorWt50yPZp6SZlf30MT4LJGbzbBrBk41keq9CJV1abUY1y/RVlMjL7hIVgZoMmgXiOLig==
X-Received: by 2002:a17:906:8455:b0:9ae:62ec:e897 with SMTP id e21-20020a170906845500b009ae62ece897mr15259871ejy.4.1696924201747;
        Tue, 10 Oct 2023 00:50:01 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (aif79-h01-176-172-113-148.dsl.sta.abo.bbox.fr. [176.172.113.148])
        by smtp.gmail.com with ESMTPSA id a14-20020a17090680ce00b0099cb1a2cab0sm8012503ejx.28.2023.10.10.00.50.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Oct 2023 00:50:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-ppc@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	qemu-block@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH 1/4] tests/libqtest: Introduce qtest_get_arch_bits()
Date: Tue, 10 Oct 2023 09:49:49 +0200
Message-ID: <20231010074952.79165-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231010074952.79165-1-philmd@linaro.org>
References: <20231010074952.79165-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 147FFx42h/wd

Add a method to return the architecture bits (currently 8/32/64).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/qtest/libqtest.h |  8 ++++++++
 tests/qtest/libqtest.c | 21 +++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/tests/qtest/libqtest.h b/tests/qtest/libqtest.h
index e53e350e3a..1e1b42241d 100644
--- a/tests/qtest/libqtest.h
+++ b/tests/qtest/libqtest.h
@@ -654,6 +654,14 @@ bool qtest_big_endian(QTestState *s);
  */
 const char *qtest_get_arch(void);
 
+/**
+ * qtest_get_arch_bits:
+ *
+ * Returns: The architecture bits (a.k.a. word size) for the QEMU executable
+ * under test.
+ */
+unsigned qtest_get_arch_bits(void);
+
 /**
  * qtest_has_accel:
  * @accel_name: Accelerator name to check for.
diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index b1eba71ffe..a643a6309c 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -925,6 +925,27 @@ const char *qtest_get_arch(void)
     return end + 1;
 }
 
+unsigned qtest_get_arch_bits(void)
+{
+    static const char *const arch64[] = {
+        "aarch64", "hppa", "x86_64", "loongarch64", "mips64",
+        "mips64el", "ppc64", "riscv64", "s390x", "sparc64",
+    };
+    const char *arch = qtest_get_arch();
+
+    if (!strcmp(arch, "avr")) {
+        return 8;
+    }
+
+    for (unsigned i = 0; i < ARRAY_SIZE(arch64); i++) {
+        if (!strcmp(arch, arch64[i])) {
+            return 64;
+        }
+    }
+
+    return 32;
+}
+
 bool qtest_has_accel(const char *accel_name)
 {
     if (g_str_equal(accel_name, "tcg")) {
-- 
2.41.0
