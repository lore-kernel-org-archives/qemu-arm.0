Received: by 2002:a17:906:b756:b0:9b2:89ee:1eb8 with SMTP id fx22csp300782ejb;
        Tue, 10 Oct 2023 00:50:14 -0700 (PDT)
X-Received: by 2002:a05:6402:14d2:b0:530:e9bf:1ea3 with SMTP id f18-20020a05640214d200b00530e9bf1ea3mr16651965edx.7.1696924213979;
        Tue, 10 Oct 2023 00:50:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696924213; cv=none;
        d=google.com; s=arc-20160816;
        b=G9ELOlDAt4ZjqGuOkUREMmrSs8sppRToePOAcnoCSoorWmDEEhBw3EH5rRFFAr/xKk
         9Zb+8rgbYcUf8jm5FFPIDItxfeHXcRjMEsuxNx4LGN8kg4qeNzeqZmfJkQJYldcy3fuI
         9uSTkzP1fMFnugKZo+tnZXXK9qz71c+k3GObn76OsiorZAL2QNAnrM7p2tyO7XLaIk28
         6fTuGDidqTA585rhD8MGBdnk+37ZpV2foDaUzUpVUk+0UmYIfBj4wadqHC0gG76zb2tB
         vh4bTWqrWbEZx39OiRVUv7JzGNZWTQQuOHBh6+XdM0A8ZlOZ+6ho29Aee2tixG+3sEjO
         UC0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=f2NufxNzPZ9pUF8PsDHQZGBUjEuicTHUoNMeMj86XSo=;
        fh=fvH34tHwViUOu98hGoeGCIVUhAkw1BzDAuMB2MXJND8=;
        b=LuSWVp1AC2QfaK7tjU11xWErf4h/Ci6tyxwn+/YNECTLgRo+XG9HnY4fnez4NMOitD
         xmjmUCGCbQCKNmwV15trSTYDVAYkG4aarbv76PVCuSPSqYUbZc/bStIFL4bS082gniE5
         Ubj65b3LijYiwGzJfflAhLpz2XkArP618d16J/GXmlKeLNV2vJv+qzlUyp0js6oY2RF6
         qpO4d12ZdoKNHy220fdwP/wPqcvBhbLFDAc1b6UWQZH3lKtiBUKAF2rSRrT9wZiQxwi8
         OaaUnl4vsJqogWaUgkK68/wWbUFgtkvMbHCa9ZAyhdUqXen3y9DD3qvLEHxLFau5Jgtu
         EauA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fjoigcDH;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e19-20020a50a693000000b005383860d2c8sor3649126edc.5.2023.10.10.00.50.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Oct 2023 00:50:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fjoigcDH;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696924213; x=1697529013; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f2NufxNzPZ9pUF8PsDHQZGBUjEuicTHUoNMeMj86XSo=;
        b=fjoigcDHG3NeNqqcNkFpvAKtr97i8/NDjR5PLggePoS5wwykAlD/83t2CV8VBw7GJW
         N3CR5858hDV8rCv+YKUoQB/v3837rvdwU96PasaGE9roq53/ZyCN+zd+E7gb9FijrM/4
         TeKwmwrHrAqxKi+2+3+H6WhVnfqnbGsQnpFMrxPS2M9z/T+bZjcczNhQiqdHviJXQZHU
         kmkWAb237LcnV4jifFX7Xdx0zzVTzKDV+3lX688NE+pHIkSCaBlwsRvA73sUD1PpP1Hh
         Ufpp3lFVdGs0rXK/wQBrmDBk804QQcUfp6x+2wueRU5gqphhAPtAZaONjhjHjnQWGJd7
         NtPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696924213; x=1697529013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f2NufxNzPZ9pUF8PsDHQZGBUjEuicTHUoNMeMj86XSo=;
        b=rZCatqRNXgqD9F84qhZg64829ZYqx+vphMwqNY+VxVn9RiUJF2JIZee9Mi9QuEtemB
         TpXSxWliCVAgG4Anc5fMvQ5K/poAc1ZZ/B89hIU1aoKxBmhOVbG9htPM8MVagOB2NEp5
         6tKGtckPZVKLx3lVJte96mMH9Y0ozvUSwIHm9F8MKIY1tP3iT9UqTORjHk4Uz4yA8MYm
         AGQQzQ4etMd+m2iy3JZcf2gFtgFf7ST9xYCkVV/hUzHvMFgGGSK1/W9U2e50nI1mUvU2
         q5gqj7j/hcfpgPO7uyOngA4AVj4ja4MbZEbFmkvXRiIMskIJcdx3rIvG6elVt45d9uz0
         Vcew==
X-Gm-Message-State: AOJu0Yx/5/73Q5mUS2TkLX0aGR6d9K9KyceFzYYchLkvABq0haUiv+mr
	oQ8Qxw9LFgwAj3docn7YVfqwUMUS
X-Google-Smtp-Source: AGHT+IEg81lyQK+4P+iuRE5K/osIKaqgw2DTDRSNh7brZNSNguuQuf7Lsy24vNsO4ZymjcfJ2Qlqtg==
X-Received: by 2002:aa7:c746:0:b0:52a:38c3:1b49 with SMTP id c6-20020aa7c746000000b0052a38c31b49mr13446577eds.40.1696924213730;
        Tue, 10 Oct 2023 00:50:13 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (aif79-h01-176-172-113-148.dsl.sta.abo.bbox.fr. [176.172.113.148])
        by smtp.gmail.com with ESMTPSA id ee48-20020a056402293000b0053120f313cbsm449545edb.39.2023.10.10.00.50.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Oct 2023 00:50:13 -0700 (PDT)
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
Subject: [PATCH 3/4] tests/libqtest: Introduce qtest_get_base_arch()
Date: Tue, 10 Oct 2023 09:49:51 +0200
Message-ID: <20231010074952.79165-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231010074952.79165-1-philmd@linaro.org>
References: <20231010074952.79165-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: rr+7Pl7tyo5O

While qtest_get_arch() returns the target architecture name,
such "i386" or "x86_64", qtest_get_base_arch() return the
"base" (or real underlying) architecture, in this example
that is "x86".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/qtest/libqtest.h |  7 +++++++
 tests/qtest/libqtest.c | 28 ++++++++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/tests/qtest/libqtest.h b/tests/qtest/libqtest.h
index 1e1b42241d..54071e74ec 100644
--- a/tests/qtest/libqtest.h
+++ b/tests/qtest/libqtest.h
@@ -654,6 +654,13 @@ bool qtest_big_endian(QTestState *s);
  */
 const char *qtest_get_arch(void);
 
+/**
+ * qtest_get_base_arch:
+ *
+ * Returns: The base architecture for the QEMU executable under test.
+ */
+const char *qtest_get_base_arch(void);
+
 /**
  * qtest_get_arch_bits:
  *
diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index a643a6309c..51cc92af21 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -925,6 +925,34 @@ const char *qtest_get_arch(void)
     return end + 1;
 }
 
+const char *qtest_get_base_arch(void)
+{
+    static const struct {
+        const char *const arch;
+        const char *const base;
+    } basearch[] = {
+        { "aarch64", "arm" },
+        { "i386", "x86" },
+        { "loongarch64", "loongarch" },
+        { "mipsel", "mips" },
+        { "mips64", "mips" },
+        { "mips64el", "mips" },
+        { "ppc64", "ppc" },
+        { "riscv32", "riscv" },
+        { "riscv64", "riscv" },
+        { "sparc64", "sparc" },
+        { "x86_64", "x86" },
+    };
+    const char *arch = qtest_get_arch();
+
+    for (unsigned i = 0; i < ARRAY_SIZE(basearch); i++) {
+        if (!strcmp(arch, basearch[i].arch)) {
+            return basearch[i].base;
+        }
+    }
+    g_assert_not_reached();
+}
+
 unsigned qtest_get_arch_bits(void)
 {
     static const char *const arch64[] = {
-- 
2.41.0
