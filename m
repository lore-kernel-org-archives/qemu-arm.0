Received: by 2002:a17:504:d692:b0:1be9:327d:8ee3 with SMTP id na18csp514699njb;
        Wed, 4 Dec 2024 13:12:48 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX3DSnBD7MESCp8p6LmNP6mLL9rhRoJrFf+dOi5dk0fuwbN+E/T5KjzeDpWvROgTxRjcn631oNHFzfFSQ==@linaro.org
X-Received: by 2002:a05:6a20:918d:b0:1db:ed44:ba68 with SMTP id adf61e73a8af0-1e1653bb673mr11123726637.17.1733346768126;
        Wed, 04 Dec 2024 13:12:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733346768; cv=none;
        d=google.com; s=arc-20240605;
        b=WUFQA2aKuHwbmf8fL8R8i51Ewzn3wlFyCqCWOlmnc0hDVgjO+aKuFEl2jF3xXyXw61
         zv/Ywbs5yhM4qONc485E2TU1FKtBIIgP7otscI7AwxGh5r8HCAQQmB+BbK2i67njWzP1
         C6oUAoPUjYKLWr55AsodMs++2G5C7ci6TpqI4tBdh7ZVzAsxplzpQSVttYDINDdOZ1TU
         /FRK4AALVeFH9NqZsHn9HUMR78f43J0JXOCpg+jS1s4MRgskrRnNRsFCBz4joxMyXPek
         1tg8+6QM7uPeF87ose3CWdEqmjSUAwyWZGxPpri89hX7feU3/zAL9YPy/12FKYABhVtq
         /dHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=okXND1T4OJuVtkNA/GEh6VGd1mAgkVoLXbl0XLbMi40=;
        fh=t1jpF8kzvL4nq+dw+733SRGgTJiDJdq25ywKssDLgZ8=;
        b=kZMyXZesVHSNN+ihDZrlorVWavwZNg2/nwhoA/I8naHi3yglUrSgyZVepcljN52Dhi
         tJdQVNy3BDQ7cMTsbAQ3uE5Sq6hmORWKNAfhMUkAEcnJdh4cakF1zb1jP8B6xZrITn3F
         KZ7GyLh+OuCyo20fOgPwpbJWH0UO+MkPW4avxoVllH811vf0IARcPhcYKPutAK9lrA5b
         KuewN5UM5p4i3Z9M7zVGVhDYUgCWMt5KzMjmw91DgIUY9efxsGKUEmZgPhV7HvWwSwzU
         7uHYutx2KM9kPRGz6fzJ2MJ/7UrYkyTTCeS5sniv/NyMrVkG4J0Qtw7sp7pYAL0WHog2
         VA0g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rOx9sPNp;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-7fc9c2440c6sor12835162a12.1.2024.12.04.13.12.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 04 Dec 2024 13:12:48 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rOx9sPNp;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733346768; x=1733951568; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=okXND1T4OJuVtkNA/GEh6VGd1mAgkVoLXbl0XLbMi40=;
        b=rOx9sPNpb9RLDBXJe3fRcRcT9imIdUma4lK2581/LQd7UwEvXj7O+XInN6PXpOukUS
         tFovgi1bdW//7o7E1egwm+or4dmG4Af02lRKEV+oiuwaiD6SRXI/yjvRfUBpsVUABQD3
         DRr3is3pVrjmLVchTNYgIZDR1nES218uTfeViOVJrtIVykCFsfjkGttzND4Ir6AVHZJK
         riGlLVh6ROpNqO5TtU8RLrwJ4/o8ZE45uRG4+DZnxPfHz3NgS2Umm6hf0Ru6LPfZioGd
         4oBawpfFr3NoglQOpQ7teOtA50625RHlOjDJ+8WSS4noG8bsrA9C5hw7dbXtd2jrRrGO
         sXkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733346768; x=1733951568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=okXND1T4OJuVtkNA/GEh6VGd1mAgkVoLXbl0XLbMi40=;
        b=kb1bOqyC3tvI4A8E7d0k9Hz1AVuhRoJhgdjmFiSQF05up4sFj68ihQas87iAWr8q3B
         Lvpd9i3zMRddjei5Om9JSzIZuaZypR62thrgxiDMTXdTodPjjPGKb5RMhIKIdblDh/0a
         v8aUi/iCtv/beDBX+/d/bwhQ9EU0GfFlqtEbtCcABRzOkvYvcGzrAQoP8jDOUdDwdosV
         Nf7dL3L2Cikt6rhalLl7hKLCqMExfSOHT7XfUH5INnG5oPT55kit6SHw6fhJYJTNhSKG
         oZDPI7izP65hzQQTZnDZCG2cxyK+HPJZn/qwS/Z3aShBWw4PiWWQ8+gfhsZqKxoEJljV
         fFVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkIoIz5cgoWuhqRgwM8I7gcmGY+1LYCxDs6sONMapq4QWTPDhqyf5Fx8cqRI93FI5uvnwDhLGVJBYaiw==@linaro.org
X-Gm-Message-State: AOJu0YxER7gcmipF1S/dUvhjSEqThyQMnQ5YEDGA25/OH1Z8K/SWw4Pb
	ACsTE6IcoBBOdhWvLRbTeYjWDUG46CRBS4+diY8eRQbOSC+79nPATjrZ5j6bniDkpA==
X-Gm-Gg: ASbGncshoYMS51h4umrcNBXqOnuVOPl29AeQ9DKKdXYSJUHe9o0wdWUJp6u1P1zvNq6
	LSXt5udN9hzUN4kQz8kmoHIjUGVpFKOBhneSlfUfGcAYSpF0PkTjIzkbhFl4aqBtV1+h3SWnhGI
	kUVPufwbfKGwd7tKY57FyBwopK7ofTIcjVQYJxxDu00PCYLZACj/YXdL7ejjVHrTocuGZiUGdaU
	6+1xlTtG9Vv7gOJHXHYa3aHCGu0+cVq+ufUXVwMi89U94Xgg1/47s6g7C8sgleq7rmChsAr5+M5
	U9++jxMz
X-Google-Smtp-Source: AGHT+IFs6zydCz/aedghNnDWrbYfsm75thqJc6ke8CFCc8uPywde2n7KPs8HxmzH15WSEGUhXju5qA==
X-Received: by 2002:a17:90b:3b4f:b0:2ee:d63f:d77 with SMTP id 98e67ed59e1d1-2ef011fb85bmr11125389a91.9.1733346767525;
        Wed, 04 Dec 2024 13:12:47 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ef270089b8sm1905830a91.14.2024.12.04.13.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 13:12:46 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	alex.bennee@linaro.org,
	Fabiano Rosas <farosas@suse.de>,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 2/2] target/arm: change default pauth algorithm to impdef
Date: Wed,  4 Dec 2024 13:12:34 -0800
Message-Id: <20241204211234.3077434-3-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241204211234.3077434-1-pierrick.bouvier@linaro.org>
References: <20241204211234.3077434-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: qmh/MNR7RzFk

Pointer authentication on aarch64 is pretty expensive (up to 50% of
execution time) when running a virtual machine with tcg and -cpu max
(which enables pauth=on).

The advice is always: use pauth-impdef=on.
Our documentation even mentions it "by default" in
docs/system/introduction.rst.

Thus, we change the default to use impdef by default. This does not
affect kvm or hvf acceleration, since pauth algorithm used is the one
from host cpu.

This change is retro compatible, in terms of cli, with previous
versions, as the semantic of using -cpu max,pauth-impdef=on, and -cpu
max,pauth-qarma3=on is preserved.
The new option introduced in previous patch and matching old default is
-cpu max,pauth-qarma5=on.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 docs/system/arm/cpu-features.rst |  2 +-
 docs/system/introduction.rst     |  2 +-
 target/arm/cpu64.c               | 12 ++++++------
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/docs/system/arm/cpu-features.rst b/docs/system/arm/cpu-features.rst
index d69ebc2b852..37d5dfd15b3 100644
--- a/docs/system/arm/cpu-features.rst
+++ b/docs/system/arm/cpu-features.rst
@@ -223,7 +223,7 @@ Below is the list of TCG VCPU features and their descriptions.
   When ``pauth`` is enabled, select the architected QARMA5 algorithm.
 
 Without ``pauth-impdef``, ``pauth-qarma3`` or ``pauth-qarma5`` enabled,
-the architected QARMA5 algorithm is used.  The architected QARMA5
+the QEMU impdef algorithm is used.  The architected QARMA5
 and QARMA3 algorithms have good cryptographic properties, but can
 be quite slow to emulate.  The impdef algorithm used by QEMU is
 non-cryptographic but significantly faster.
diff --git a/docs/system/introduction.rst b/docs/system/introduction.rst
index 746707eb00e..338d3745c3c 100644
--- a/docs/system/introduction.rst
+++ b/docs/system/introduction.rst
@@ -169,7 +169,7 @@ would default to it anyway.
 
 .. code::
 
- -cpu max,pauth-impdef=on \
+ -cpu max \
  -smp 4 \
  -accel tcg \
 
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 34ef46d148f..8b1f26a9664 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -529,15 +529,15 @@ void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp)
                 return;
             }
 
-            if (cpu->prop_pauth_impdef) {
-                isar1 = FIELD_DP64(isar1, ID_AA64ISAR1, API, features);
-                isar1 = FIELD_DP64(isar1, ID_AA64ISAR1, GPI, 1);
+            if (cpu->prop_pauth_qarma5) {
+                isar1 = FIELD_DP64(isar1, ID_AA64ISAR1, APA, features);
+                isar1 = FIELD_DP64(isar1, ID_AA64ISAR1, GPA, 1);
             } else if (cpu->prop_pauth_qarma3) {
                 isar2 = FIELD_DP64(isar2, ID_AA64ISAR2, APA3, features);
                 isar2 = FIELD_DP64(isar2, ID_AA64ISAR2, GPA3, 1);
-            } else { /* default is pauth-qarma5 */
-                isar1 = FIELD_DP64(isar1, ID_AA64ISAR1, APA, features);
-                isar1 = FIELD_DP64(isar1, ID_AA64ISAR1, GPA, 1);
+            } else { /* default is pauth-impdef */
+                isar1 = FIELD_DP64(isar1, ID_AA64ISAR1, API, features);
+                isar1 = FIELD_DP64(isar1, ID_AA64ISAR1, GPI, 1);
             }
         } else if (cpu->prop_pauth_impdef ||
                    cpu->prop_pauth_qarma3 ||
-- 
2.39.5
