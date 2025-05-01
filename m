Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp19658njj;
        Wed, 30 Apr 2025 23:24:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVenL9qxF9DNisK9greueUAI+quXnxNZ2jSWdFSGlc/qlz/5BvhXiDhC0jw/JsQy+K9LbL4lhU4Qag6ZQ==@linaro.org
X-Received: by 2002:a05:6a20:d41f:b0:1f3:1ba1:266a with SMTP id adf61e73a8af0-20bd9b26f11mr1480416637.0.1746080653406;
        Wed, 30 Apr 2025 23:24:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746080653; cv=none;
        d=google.com; s=arc-20240605;
        b=gXOGrh9Fw1MSDhJgsz+dqHbPp1t3K0MnQJv+duKHyrsTu8Ux6OcLWDjJQVGZ777n99
         ltF2rtXM8wgs+4WdwgA08AAemy1u3DE+P/68COh3ZByice1NjgrRi/N6oF4PSqPAi7e0
         cH3VhDF8QBKsb3RgBcXRHyiuoABP6uF+fUvjivWFE6VqY5yz3oR7Y1cEujt/Bjy7/hOJ
         auHD5tEeiXduwFJt6b/gjP+BFmI4hZvb2A0cJtswNIXJcZvu5JDdJPKeJuQIddofOzq6
         ZbJHGqgEv29IS2KF1IbND8SEM69rdtVSKSo9iWFgaN2FZBYjfQEX+keWJAFWEkGnYgCF
         P7rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=AbIHH1S4kZio87pXSHaHXNfuYgqfHo9zKgyYkp9Oz1s=;
        fh=CRpPU4Xrf0Y6UOlgJ/TLW9qallJkvQXUUmofMYP0tps=;
        b=GBt436Wa7aClSyYgH1v0biySIrV7OGhcawhvc6ZzBrDr+fSlmDYHtFmQWBJYWpWP/5
         DhAM9yRMIOmOOUVrS/obzZSU1yQpWrNcKXoSlJoPEDz9qthAO0XnnyKO9QctHrkOwswX
         95Fr99X+3qnmnLE56+ExRjN/QavJCX/smQQEA9dZFY3UK3uiD5TPk7rqZSDQv6JecWIX
         w7gqGkDg2TnPpZwXI4hGaJX3JIiumCdHMi+ZLYyHzEDZVY9SHbjPUTmvKrSnYxi5kI1r
         N1H+r51bc01R1hdDO041KgV2PXQqt6ccdEmjYNKcyZqIMu36yTzITee1LXcJuWipVy5n
         CESQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TNTDKVLL;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404ef18429sor68870b3a.2.2025.04.30.23.24.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 30 Apr 2025 23:24:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TNTDKVLL;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746080653; x=1746685453; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AbIHH1S4kZio87pXSHaHXNfuYgqfHo9zKgyYkp9Oz1s=;
        b=TNTDKVLL+ccrhMZJjm8Z2YbsA/70pEcYxRFKp/GzTc33bKny72HNQRfeA6pjvA26WW
         rwvIGr3F+KeqzrqJTBb9NGZqqXcbSvCoyJvAz8bLmluBjVXHT7xd7UM5unLsSxd16Vea
         BFayYDHE+iR8CokdOoFzJXwgycl8+iRdz3pTf5S2NhlE3J/fEABq0kzBe2BX0F30y/qD
         djFzqjMQAG1WIdD2IPuDRRDgUffnZNNq+9cWiR69RCecPBd+RTkBAsB7C+zmyPVZk6B0
         HD3wq31mONDzsM1LMTtPoy46jdTDMPY8wktGEgefeaXkfiA7H/OO3AULjnPKuU+SqpiC
         Bgkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746080653; x=1746685453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AbIHH1S4kZio87pXSHaHXNfuYgqfHo9zKgyYkp9Oz1s=;
        b=omB9U1jad1laDYpk7KA61Egn0HzZbO3k68Wt0aKxIRj1swDspjOkl2we6dr3HP1EDx
         9W8coUV2ElrUxzgfksJrxpyZ6RSwypoGMdBkh+lrMK860wN6fj/rlonPSXuH2vI0v8se
         Gyd6EHqaDghfLpoqYCxWa/XLsLdSfs4oZyUDjyXNGTzuyqMM3cJciLgyqY3YqQ6+Se/N
         uhCJxCdd4ziaKMD8i7jL/pNaQm4+fMELJXATdQk4JTR5QelwwkGuFdZnyGPbMBpXJElE
         DYXLNhoYMveB8GBTQgR0FL2E1QCFVcQZl61BVbJfJXrgWd1ZTvtuH4ptRHJhnl2ILr5e
         +mKA==
X-Forwarded-Encrypted: i=1; AJvYcCUtSay13LOarSAynr7Cx2frACBYLykHLe1ZIPMo9Rr20K1cmJixjqVgpP+Hm2angqRUmH/kf+JDzzJAKQ==@linaro.org
X-Gm-Message-State: AOJu0YxSYn4drR954t28hKRDWZDsBv22ejlgGk8MF5t/Ubv0uwxAMaD+
	zq48+9fkWBzHpsPHmatl3ZmvGwyejQubCSamU8mG6d7bpO1OLWmOhFTz9w4DBJZvbA==
X-Gm-Gg: ASbGncuLwWQYdyGo0b32sh1/4KVNJRbvKSD1h8RVdJMd/NggZ5BfX936W3If2DUiQ03
	BEvFMFexxfCeX3JIeqqupVUq2jPw5PKIp6Sy7+JCrsAYBf4VDFi+g5frkNgciMAvP7HOAFKuMjn
	pp5curxfgeWtCmxOYW5OXdk9KjzZ05eLSrq1ieef5UNGm0JFYAyPn4vu7JD6MXqGMQmTsrL6LZ5
	gqc7vSOeswMfCFyqw6NcSm/yL3b7+PCJ/ZghUJiD4eH5umgX+UyV4s64tjQjuZIMWFvNe5cPyeh
	mriYTnxwJvIWAE7KVtZNsDBfJyT5/WkhqfE+eFQqKRCOmqNLODc=
X-Google-Smtp-Source: AGHT+IE+M2Qhe1mZXdpj+BeqZNGIoeFOrdKYtLvcOBl4KLwgVIF+m/BYToT/VO8K7wQPtU8U+I0ngw==
X-Received: by 2002:a05:6a20:3953:b0:1f3:237b:5997 with SMTP id adf61e73a8af0-20bdcca171emr1844660637.14.1746080653018;
        Wed, 30 Apr 2025 23:24:13 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7404f9fed21sm108134b3a.93.2025.04.30.23.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 23:24:12 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	anjo@rev.ng,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	kvm@vger.kernel.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 24/33] target/arm/vfp_fpscr: compile file twice (user, system)
Date: Wed, 30 Apr 2025 23:23:35 -0700
Message-ID: <20250501062344.2526061-25-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
References: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: NSKdyNfRa2ud

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/meson.build | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index c8c80c3f969..06d479570e2 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -2,7 +2,6 @@ arm_ss = ss.source_set()
 arm_common_ss = ss.source_set()
 arm_ss.add(files(
   'gdbstub.c',
-  'vfp_fpscr.c',
 ))
 arm_ss.add(zlib)
 
@@ -32,6 +31,7 @@ arm_user_ss.add(when: 'TARGET_AARCH64', if_false: files(
 arm_user_ss.add(files(
   'debug_helper.c',
   'helper.c',
+  'vfp_fpscr.c',
 ))
 
 arm_common_system_ss.add(files('cpu.c'), capstone)
@@ -40,6 +40,7 @@ arm_common_system_ss.add(when: 'TARGET_AARCH64', if_false: files(
 arm_common_system_ss.add(files(
   'debug_helper.c',
   'helper.c',
+  'vfp_fpscr.c',
 ))
 
 subdir('hvf')
-- 
2.47.2
