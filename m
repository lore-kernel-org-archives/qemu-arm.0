Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp94259njb;
        Wed, 7 May 2025 16:42:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXSjQxLiDZgO28gwvABZOwMYidRx6wlh89FbEgoQzHoxi4j91x3kv46RmqMspuN1Cm9lLPPnltVNCMXLA==@linaro.org
X-Received: by 2002:a17:902:f381:b0:224:376:7a21 with SMTP id d9443c01a7336-22e8dc8f2b8mr12245695ad.42.1746661369863;
        Wed, 07 May 2025 16:42:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746661369; cv=none;
        d=google.com; s=arc-20240605;
        b=GXsfD6prQj669uG6CcNQ0eZkDFTuZjCJocO1MYxQwESOfGQ+imD1gjBeAHu5zZN252
         PU2WrAgCM7TMcjONS/faCCztxKIuHJ4s/heAbkdjOjfP2yRPxJbPkHK968bQR/7sXGHz
         rj0i5S1/5IicXz7b/HJQp9U3Ay3CMjKR1HiKvG1kk4mMvAoJdyj7egfICf5Ek/0JqnkK
         YeN1WzOJKB96VrwVPWdVqBNvEmCz8jr1T8ornwlePe1OA+9hGAhCvTtLErtG/FP1TwkH
         Va6HfojwSk2cmyJh+/shk+wUk+0rQJ0oG/jyZQwuYe3n6E8g2xh9EEDu9mOtiAc3Cld5
         O/HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Gch+3DQ1xFSIgoe8nsFHA95PeotLzKWriKqshNx+4Kc=;
        fh=FYnwEKG9+uPbmp1DgnlXojK77HZYugAV5Ic6Tx2G3Vw=;
        b=HxQNFP1khYGK6bjwIisRo02YW7z81hcUjaJp2lgDWqNfqjwSS62URcQXo8Gj9PMQi4
         f3zcd+/vhv+UXOlTZIwu2X48rkNF4JtcR9ODKv/HNugzB+yhVeX+IMe/akVPbNoq/SVX
         htgj2o7rJb174NbhSklSjzhhxYqhTIcH7JLkBZDRzsgya8UWBirmF+WLGEtROgU43QnW
         35asmuo3Lf3pGjHSN9lObC+GbLgWY8cHI+vh5Hyp37J2+ODc4rf9EHGz3WRFqyBL6Qxe
         YZqCktNtfQMR/gkspnoMy6Xa304JygAw0YbEshRzsYoFYw9sZmwM+wn4imUxWDYTHjtq
         5DlQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XYJbanaR;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bb2242esor120772465ad.8.2025.05.07.16.42.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 07 May 2025 16:42:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XYJbanaR;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746661369; x=1747266169; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gch+3DQ1xFSIgoe8nsFHA95PeotLzKWriKqshNx+4Kc=;
        b=XYJbanaRQqaFnWGCkoprMII0KOHAcYxoDr+h0sDACUpG3Y55D2g7u+lBqT4S7dKRax
         NVpkorjr3BOwufwb5jaDLrMAEdCbsqaKAVhRQG0sSPAC8IgQuU5D+l75sq6CRv9cumAQ
         YOi7ykD30qcQQNAhrP6Xnzz/FKmBc+IvOXSOIyls7tU/1Q9T4BBFz5KDQi6pc4GNeUmP
         dC2iHIyaTJoZYk6QKeK1UE3ubGERFs2ruY7SPAyaaSSHDkcAtZssAt76it8QLypiZr43
         YThe+YMcXOX3YMIu79a6DsB8AmZIwQieRrVvQh436QjmGlgVKeSMT4H7o2EbetQnujH4
         kpOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746661369; x=1747266169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gch+3DQ1xFSIgoe8nsFHA95PeotLzKWriKqshNx+4Kc=;
        b=l2vx6eQi8nEGA6AQf2OjPSCRzWQRNqFJbWeRKERLaG+0b32nndHAY4nDXE7lTw2bTQ
         z5sa72iEMjYHXx5DeqHWAopCCXxZYyqCVWzflCq9pbUBJtbNPrKxVafXfVZLLFEzs4cP
         9rrALHagbLs8N1OBTbWMJU6ROfBxaplR24ymuatCh9XeVYTt2zdrVF9k1iZ5QBPegKuA
         NPO9H1BYOursYTCxw7kydTRDqcKH2PLdvG41rKJMJGX+DKjAqwSSLVBTT7nJffef69U9
         z/EyvUfXCy7R25qNdfsSAwBXSz4zXAflABA+EHDL+bRAon+PFKMj54WN0thifTU4RQu2
         39Rw==
X-Forwarded-Encrypted: i=1; AJvYcCVCXI8EcIs/QqJ0VIAn+YgcEbiXkqCSf5M7vzqVPpSQrEjX2+s3Gc5XeOr20695DI+czJiSwNdCuRLnVQ==@linaro.org
X-Gm-Message-State: AOJu0YyMR0dYI62jZSoiTvo1DOL7ZGUUsgWWfVuYt5kwUrSXO46YEvBY
	9nqOeiRBpyUGvOiUt7UWB2M5xad0dCBNp+eqUKzBbyTki7hnpsZs3WnBUEJ0sq7yZQ==
X-Gm-Gg: ASbGncupcOfh7qC4Guo0bZAPgiOLQ4XCgRzSPyfyFCTHThaVAVqvmj+AfPLbEV0VxQU
	UDtY8z1Q2E08h4VLpMxTJfNj4DALAFeuiMqZV1CZMSP/m6OTiVvViS9iVHgFBzsQauI5cNYBCM/
	8OXPkvdqDgMN8X2AhCFCl1K7BvduAd2YXNYST9qOSLKcTQ/jM/lMdfH4+ADKx7i6vzKJILDohum
	SLXwxgUPVxdu81K74xLHtgKnqV5e6lofAsWazPQL3ixzAd0vBOb1+VlNVJQLf33kQzQO/yisjRW
	fzBjmsSm+lY/UVJZpWIL4wOhh+JC9MTc4v+vJf4r
X-Google-Smtp-Source: AGHT+IHHvc0EvNKRFKpNtmu7GMOzbaEWqTdnUSZ8fl16d0tlW8oALJDg56XL2EyLWt0yNIiyINpabA==
X-Received: by 2002:a17:903:fab:b0:227:e709:f71 with SMTP id d9443c01a7336-22e8660497fmr17618375ad.29.1746661369557;
        Wed, 07 May 2025 16:42:49 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e815806fdsm6491325ad.17.2025.05.07.16.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 16:42:49 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	anjo@rev.ng,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	alex.bennee@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v7 07/49] accel/hvf: add hvf_enabled() for common code
Date: Wed,  7 May 2025 16:41:58 -0700
Message-ID: <20250507234241.957746-8-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
References: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: bK35BAPG50RQ

Other accelerators define a CONFIG_{accel}_IS_POSSIBLE when
COMPILING_PER_TARGET is not defined, except hvf.

Without this change, target/arm/cpu.c can't find hvf_enabled.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/system/hvf.h  | 14 +++++++++-----
 accel/hvf/hvf-stub.c  |  5 +++++
 accel/hvf/meson.build |  1 +
 3 files changed, 15 insertions(+), 5 deletions(-)
 create mode 100644 accel/hvf/hvf-stub.c

diff --git a/include/system/hvf.h b/include/system/hvf.h
index 356fced63e3..1ee2a4177d9 100644
--- a/include/system/hvf.h
+++ b/include/system/hvf.h
@@ -19,15 +19,19 @@
 
 #ifdef COMPILING_PER_TARGET
 #include "cpu.h"
+# ifdef CONFIG_HVF
+#  define CONFIG_HVF_IS_POSSIBLE
+# endif
+#else
+# define CONFIG_HVF_IS_POSSIBLE
+#endif
 
-#ifdef CONFIG_HVF
+#ifdef CONFIG_HVF_IS_POSSIBLE
 extern bool hvf_allowed;
 #define hvf_enabled() (hvf_allowed)
-#else /* !CONFIG_HVF */
+#else
 #define hvf_enabled() 0
-#endif /* !CONFIG_HVF */
-
-#endif /* COMPILING_PER_TARGET */
+#endif /* CONFIG_HVF_IS_POSSIBLE */
 
 #define TYPE_HVF_ACCEL ACCEL_CLASS_NAME("hvf")
 
diff --git a/accel/hvf/hvf-stub.c b/accel/hvf/hvf-stub.c
new file mode 100644
index 00000000000..7f8eaa59099
--- /dev/null
+++ b/accel/hvf/hvf-stub.c
@@ -0,0 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#include "qemu/osdep.h"
+
+bool hvf_allowed;
diff --git a/accel/hvf/meson.build b/accel/hvf/meson.build
index fc52cb78433..7745b94e50f 100644
--- a/accel/hvf/meson.build
+++ b/accel/hvf/meson.build
@@ -5,3 +5,4 @@ hvf_ss.add(files(
 ))
 
 specific_ss.add_all(when: 'CONFIG_HVF', if_true: hvf_ss)
+common_ss.add(when: 'CONFIG_HVF', if_false: files('hvf-stub.c'))
-- 
2.47.2
