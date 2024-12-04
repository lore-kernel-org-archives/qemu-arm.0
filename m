Received: by 2002:a17:504:d692:b0:1be9:327d:8ee3 with SMTP id na18csp514674njb;
        Wed, 4 Dec 2024 13:12:47 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUy6uYl6aFptVXurdTTJp/QteXSnm/WhHynDJUOjEcH+p8DFsBDnFLaETZjsy2p4101lzE1/Xn18KaETQ==@linaro.org
X-Received: by 2002:a05:6a00:1492:b0:71e:2a0:b0b8 with SMTP id d2e1a72fcca58-7257fa45d42mr10780491b3a.1.1733346766862;
        Wed, 04 Dec 2024 13:12:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733346766; cv=none;
        d=google.com; s=arc-20240605;
        b=WGt+R97R6w7KIlppeAcD719RzpfaaYTzUEcBGnL096oNzv1oGWzLE/kYn7ieJejuNc
         Qo0t55XtxfZx6+YwPq+k0DKysd6SbKF1ZQkpvhPc25ozdT15/DaACaOoUmKENx1e2XyV
         l3vEpB4M/o+LhysiHSYKPuU9pPFbtGI6+j9jyOMPhBTAHGmQGVeIgm2/0l4phv1IkuRn
         4wAWcNcd0adfkJl7KqO/Mzev4/LdDxDnYDeeUR+vrulXl8H4KduCSzsZ2hBa9BQWDDOh
         cJ12XELC9qmmDRX7GzG3ocpYBKVcVP6werFY7gzY91RIc9NDfLbae9yEAYTdznWicY04
         gk2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Qe8Fwjt3cZmqYIi+Ypk/U57pACJEEsU9bKkurpvi7fE=;
        fh=L0KybED+cANaobXiI9WIjNkql18WEYz/ghSqrD4O0Ww=;
        b=W+fPaUwwsnj5Gv8TIhkW+s6/+EbubNgdXaAojVyvkdY5Ic514q6maPpd/lqVeIGfZ/
         vUvASRXcs8idn+6/X6PQWfDKcBf4lD+tV0Q3WZCbxtUDvWyDeZJHbncpvUWMpPgJz2wk
         ZZt5S41Mv2MXGgZW7nFK9OZ6TnmGbiof0JoX++ZgxB+NOkhOYTiRK3NVWsBjp3yWrBqA
         5eKqJhWQpklkiQYLA8NURXwh2Sl3NKPTFUX40rno9w+op6wrj8iWUXIvr3CWGwz0pkXh
         rCAwUMrIFFNcrzBW9RKYuE4Uhq+EgFDlN7ZDbNvwDDYEL7QS1bNsNLxmUd5/zicV9Dj6
         cALw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cPw+MgI8;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-7fc9c3686f2sor10647983a12.9.2024.12.04.13.12.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 04 Dec 2024 13:12:46 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cPw+MgI8;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733346766; x=1733951566; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qe8Fwjt3cZmqYIi+Ypk/U57pACJEEsU9bKkurpvi7fE=;
        b=cPw+MgI8oG6iLnRpPO8PmJ0ao7erhx0ui/a52As2JcaS11NhpjxzGTIrgo6sDcXCsc
         pmKjWc6gU7hawoQ81CskgS9f6osdatQYy2VnS6bWSPXSH2r7p8b1WxP9yr1ODgIMAW7/
         3r8kN+1+y4Iu0FV7faRRq+ktjYorZ1osmjAh3nmCVBZhW5Cj4EQjv9t++2T+9z+wvsLD
         C1maTve/1QrrkJArQe4eMaQrBgkcPk3zXEzw4+7XnTCGJQlZbShh6FRoAd2L3ZbxkZ6c
         ApKT0lKD17ETdk5O3CEyH8fq2BjUvdgwVdQmWzEyy7gkrwbeMOWcv2hHFyBikzeYr8Ve
         02VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733346766; x=1733951566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qe8Fwjt3cZmqYIi+Ypk/U57pACJEEsU9bKkurpvi7fE=;
        b=D7+1O/I6B/7b0bI8YG4Cqrpqu+p28kaFF+fDxGng3sYkWMwMevMZvOAKpqIftOfsc+
         VYfrB/I/eKMX3K62bCCfz23eAoky6KFA/TBdRcNrmsmVNf0lNtrk6TtkNhZ+Gwwq5i4y
         muqVkHpamgF3CAttxkae9L0gEM56Upf0SP2Gtz0wpZYddxYCgNRPdSoIpjcobT/q9yvX
         pNBExwabU4i/eDyVxpBn9U60Ej/e1kKIbxJLTg4e0sUMSCg0hW7TKN0ucjLqU0aSE03T
         hMtQYUacIp2gYxLtfmNd33ek8U7RnQ8Pqx46NKN14jXTcIHWlYP0awHu1xAFxZfdY0of
         dQrg==
X-Forwarded-Encrypted: i=1; AJvYcCXOeeZkgHWnrF5k0Dsv12JwNQJwELsVdQ3Fj/bAfk28YQ80tBIc2fhaUpTL13v/F8SbV6metTXiBliWFA==@linaro.org
X-Gm-Message-State: AOJu0YyiEnXWAGFWtPnwWrBCyfmAxwOJoTT278PwkQzz9+wRquA/zHFc
	Af9rHOsXp5iQ1aYx9OXDb0e4IiajDj02xLx+wnL+2jcYGzBsYeFme4LR1DYF9f2s8w==
X-Gm-Gg: ASbGncsxzNid788l4Vd4fxNsgeBMKlSys8G1rGon5tvSfB12/Ry+A9qAd+v4+XDmHyi
	lSIen2XsVLiwg9ahRNsnm7KvvwvrQSY4lk73tUMNsLJy7JWF8kgaZb7gMCrVj8e1Asluh73zu5A
	AWtPm11csQ4K9xOx9ZBt3rOzFkWmojoy8P/a9DKVm95cVzqm4jEUpa+XwPZo+QOYosmQTelW4/i
	ZKp8TwJ9ZAI3Gt4IlEfgAzFz2+h4US6oGUhPBp28iaOiOBlzk3ZiEhKPPjXVI/zGlybh/dU5cVL
	BNYFCFeh
X-Google-Smtp-Source: AGHT+IGAEJ+IkibZZ4NSFezHeXS0d9EMISHj3eKyt1xgsrO1FUjC0J5L6HjQJ7RuCRU5lP1yls71kg==
X-Received: by 2002:a17:90b:394f:b0:2ee:4b8f:a5b1 with SMTP id 98e67ed59e1d1-2ef0126210dmr11045969a91.24.1733346766435;
        Wed, 04 Dec 2024 13:12:46 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ef270089b8sm1905830a91.14.2024.12.04.13.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 13:12:45 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	alex.bennee@linaro.org,
	Fabiano Rosas <farosas@suse.de>,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 1/2] target/arm: add new property to select pauth-qarma5
Date: Wed,  4 Dec 2024 13:12:33 -0800
Message-Id: <20241204211234.3077434-2-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241204211234.3077434-1-pierrick.bouvier@linaro.org>
References: <20241204211234.3077434-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: UnR5Pir6OnAV

Before changing default pauth algorithm, we need to make sure current
default one (QARMA5) can still be selected.

$ qemu-system-aarch64 -cpu max,pauth-qarma5=on ...

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 docs/system/arm/cpu-features.rst |  5 ++++-
 target/arm/cpu.h                 |  1 +
 target/arm/arm-qmp-cmds.c        |  2 +-
 target/arm/cpu64.c               | 20 ++++++++++++++------
 tests/qtest/arm-cpu-features.c   | 15 +++++++++++----
 5 files changed, 31 insertions(+), 12 deletions(-)

diff --git a/docs/system/arm/cpu-features.rst b/docs/system/arm/cpu-features.rst
index a5fb929243c..d69ebc2b852 100644
--- a/docs/system/arm/cpu-features.rst
+++ b/docs/system/arm/cpu-features.rst
@@ -219,7 +219,10 @@ Below is the list of TCG VCPU features and their descriptions.
 ``pauth-qarma3``
   When ``pauth`` is enabled, select the architected QARMA3 algorithm.
 
-Without either ``pauth-impdef`` or ``pauth-qarma3`` enabled,
+``pauth-qarma5``
+  When ``pauth`` is enabled, select the architected QARMA5 algorithm.
+
+Without ``pauth-impdef``, ``pauth-qarma3`` or ``pauth-qarma5`` enabled,
 the architected QARMA5 algorithm is used.  The architected QARMA5
 and QARMA3 algorithms have good cryptographic properties, but can
 be quite slow to emulate.  The impdef algorithm used by QEMU is
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index d86e641280d..b7500bebd7f 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1062,6 +1062,7 @@ struct ArchCPU {
     bool prop_pauth;
     bool prop_pauth_impdef;
     bool prop_pauth_qarma3;
+    bool prop_pauth_qarma5;
     bool prop_lpa2;
 
     /* DCZ blocksize, in log_2(words), ie low 4 bits of DCZID_EL0 */
diff --git a/target/arm/arm-qmp-cmds.c b/target/arm/arm-qmp-cmds.c
index 3cc8cc738bb..33cea080d11 100644
--- a/target/arm/arm-qmp-cmds.c
+++ b/target/arm/arm-qmp-cmds.c
@@ -94,7 +94,7 @@ static const char *cpu_model_advertised_features[] = {
     "sve640", "sve768", "sve896", "sve1024", "sve1152", "sve1280",
     "sve1408", "sve1536", "sve1664", "sve1792", "sve1920", "sve2048",
     "kvm-no-adjvtime", "kvm-steal-time",
-    "pauth", "pauth-impdef", "pauth-qarma3",
+    "pauth", "pauth-impdef", "pauth-qarma3", "pauth-qarma5",
     NULL
 };
 
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 458d1cee012..34ef46d148f 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -520,9 +520,12 @@ void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp)
         }
 
         if (cpu->prop_pauth) {
-            if (cpu->prop_pauth_impdef && cpu->prop_pauth_qarma3) {
+            if ((cpu->prop_pauth_impdef && cpu->prop_pauth_qarma3) ||
+                (cpu->prop_pauth_impdef && cpu->prop_pauth_qarma5) ||
+                (cpu->prop_pauth_qarma3 && cpu->prop_pauth_qarma5)) {
                 error_setg(errp,
-                           "cannot enable both pauth-impdef and pauth-qarma3");
+                           "cannot enable pauth-impdef, pauth-qarma3 and "
+                           "pauth-qarma5 at the same time");
                 return;
             }
 
@@ -532,13 +535,15 @@ void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp)
             } else if (cpu->prop_pauth_qarma3) {
                 isar2 = FIELD_DP64(isar2, ID_AA64ISAR2, APA3, features);
                 isar2 = FIELD_DP64(isar2, ID_AA64ISAR2, GPA3, 1);
-            } else {
+            } else { /* default is pauth-qarma5 */
                 isar1 = FIELD_DP64(isar1, ID_AA64ISAR1, APA, features);
                 isar1 = FIELD_DP64(isar1, ID_AA64ISAR1, GPA, 1);
             }
-        } else if (cpu->prop_pauth_impdef || cpu->prop_pauth_qarma3) {
-            error_setg(errp, "cannot enable pauth-impdef or "
-                       "pauth-qarma3 without pauth");
+        } else if (cpu->prop_pauth_impdef ||
+                   cpu->prop_pauth_qarma3 ||
+                   cpu->prop_pauth_qarma5) {
+            error_setg(errp, "cannot enable pauth-impdef, pauth-qarma3 or "
+                       "pauth-qarma5 without pauth");
             error_append_hint(errp, "Add pauth=on to the CPU property list.\n");
         }
     }
@@ -553,6 +558,8 @@ static Property arm_cpu_pauth_impdef_property =
     DEFINE_PROP_BOOL("pauth-impdef", ARMCPU, prop_pauth_impdef, false);
 static Property arm_cpu_pauth_qarma3_property =
     DEFINE_PROP_BOOL("pauth-qarma3", ARMCPU, prop_pauth_qarma3, false);
+static Property arm_cpu_pauth_qarma5_property =
+    DEFINE_PROP_BOOL("pauth-qarma5", ARMCPU, prop_pauth_qarma5, false);
 
 void aarch64_add_pauth_properties(Object *obj)
 {
@@ -573,6 +580,7 @@ void aarch64_add_pauth_properties(Object *obj)
     } else {
         qdev_property_add_static(DEVICE(obj), &arm_cpu_pauth_impdef_property);
         qdev_property_add_static(DEVICE(obj), &arm_cpu_pauth_qarma3_property);
+        qdev_property_add_static(DEVICE(obj), &arm_cpu_pauth_qarma5_property);
     }
 }
 
diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
index cfd6f773535..98d6c970ea5 100644
--- a/tests/qtest/arm-cpu-features.c
+++ b/tests/qtest/arm-cpu-features.c
@@ -419,21 +419,28 @@ static void pauth_tests_default(QTestState *qts, const char *cpu_type)
     assert_has_feature_enabled(qts, cpu_type, "pauth");
     assert_has_feature_disabled(qts, cpu_type, "pauth-impdef");
     assert_has_feature_disabled(qts, cpu_type, "pauth-qarma3");
+    assert_has_feature_disabled(qts, cpu_type, "pauth-qarma5");
     assert_set_feature(qts, cpu_type, "pauth", false);
     assert_set_feature(qts, cpu_type, "pauth", true);
     assert_set_feature(qts, cpu_type, "pauth-impdef", true);
     assert_set_feature(qts, cpu_type, "pauth-impdef", false);
     assert_set_feature(qts, cpu_type, "pauth-qarma3", true);
     assert_set_feature(qts, cpu_type, "pauth-qarma3", false);
+    assert_set_feature(qts, cpu_type, "pauth-qarma5", true);
+    assert_set_feature(qts, cpu_type, "pauth-qarma5", false);
     assert_error(qts, cpu_type,
-                 "cannot enable pauth-impdef or pauth-qarma3 without pauth",
+                 "cannot enable pauth-impdef, pauth-qarma3 or pauth-qarma5 without pauth",
                  "{ 'pauth': false, 'pauth-impdef': true }");
     assert_error(qts, cpu_type,
-                 "cannot enable pauth-impdef or pauth-qarma3 without pauth",
+                 "cannot enable pauth-impdef, pauth-qarma3 or pauth-qarma5 without pauth",
                  "{ 'pauth': false, 'pauth-qarma3': true }");
     assert_error(qts, cpu_type,
-                 "cannot enable both pauth-impdef and pauth-qarma3",
-                 "{ 'pauth': true, 'pauth-impdef': true, 'pauth-qarma3': true }");
+                 "cannot enable pauth-impdef, pauth-qarma3 or pauth-qarma5 without pauth",
+                 "{ 'pauth': false, 'pauth-qarma5': true }");
+    assert_error(qts, cpu_type,
+                 "cannot enable pauth-impdef, pauth-qarma3 and pauth-qarma5 at the same time",
+                 "{ 'pauth': true, 'pauth-impdef': true, 'pauth-qarma3': true,"
+                 "  'pauth-qarma5': true }");
 }
 
 static void test_query_cpu_model_expansion(const void *data)
-- 
2.39.5
