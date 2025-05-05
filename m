Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2778340njj;
        Mon, 5 May 2025 16:20:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVWMuGLMrGdVlL06D13tlkRMs11y7kxPVAxdZ3Dl6q96E0SENGJFBZ8fE4iOqZ4aZKjhw+ENy+pyon/Fg==@linaro.org
X-Received: by 2002:a17:903:1666:b0:223:5ca1:3b0b with SMTP id d9443c01a7336-22e1ea70d2emr147635525ad.40.1746487247674;
        Mon, 05 May 2025 16:20:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746487247; cv=none;
        d=google.com; s=arc-20240605;
        b=kDgn/LJukDSV25xCrq6efd34kxpS6TbZevYjKbMtD8MdMnHvqxQQvKplbTwQaSO+Do
         r7iPRUFePqJXdnjTj3Nb1lEofB0zB9pxLG9RzR6tHgfMRJ+cgrXhwoEKHlzZ9Z8srYXW
         Ey2gin3Iu0KNL8IbTCwyc1QQnJ0lncBnJkTKEVlw48y4/MZio+h1mIBRsdhAyKGKoVI2
         0RLL7NAJwTHjm6L2fJsHg7dDWFB332lXd67CCP2HY0wPcUErN4PaInxLsH80rsUq3gw5
         zj0HipvJhrolxAfh4fQKXt2BqODkfkQEyuiqQOG3bKfZAtbYBOgfAcw4HrXuAjH8H6oD
         4FbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=rVtP/RnhHG9awohdmhc7BZy6oUycGDI8ImSQa94LuXo=;
        fh=mipm2obxdrlcIT6aocogS22MoOmAA1a7EHSg207A9p8=;
        b=Tiwn8bVWjqMjfvhtqIhHIvjF61dTtGdwOHxbY2cgolrGBovSB8NY/60gSD6j9v9kQ9
         FXEpBHPjtepAxfxS5bmkHuTg3mDbMjB+JqcwfCaC7KNRnsITRP5qHGcKEyv4hDTuwJTD
         2WnkCkTWfPMLFlt0fkktqJEv9060b4IRncz2KQTMsqwrISUVu5smJ9yWkKV6ex0GpEjs
         vUlazR85KcU+2E5xQ5Sg0l7Etp8AfpyjwEVLQj6l6Jo9bPI3/VQmoL9P8ssA/sfgVs/c
         TI73/uDX05v3hnuCNvK8mAkmmH/L298cu3BlcH9Evl6dso6nY7n6/5H//AMuwHnaKmzZ
         iwJA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nDxNangp;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0be7f757sor32440855ad.16.2025.05.05.16.20.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 May 2025 16:20:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nDxNangp;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746487247; x=1747092047; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rVtP/RnhHG9awohdmhc7BZy6oUycGDI8ImSQa94LuXo=;
        b=nDxNangpoxFwqBqtIIIxKVYaWLV3DFRQbqU8T5spVrFEHWC6jXmqhm0DxDO0W0Bjs5
         N8myDUOXxLMQxi6Sp0HWjS9WUt8KKsqU4mks5TRkR4bw8KIH2biSRrj4cXqDZloQsDyg
         MkOv7rdg0KCou9EPXasCHTYTRbJAcGWguwcuqMZWdrctZrHt53gfuBaCMtvscpvXnWIa
         z5Nujgq7UNNDzX/XxkmASC3UQ9b8WMO2tM5/afmaURzCRLoBECGGIMWIFBB/LWVHem1M
         e2xoIfuYNr7nS9SVu56RqA32EnDdiV4P50bmo0LfYZDmkd7nW+rOXTsdopwI4g7NJgco
         t6+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746487247; x=1747092047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rVtP/RnhHG9awohdmhc7BZy6oUycGDI8ImSQa94LuXo=;
        b=vuG2SVxBECIZaVhKkGxqm1PogBIFv408vdiLDONKidqYLccnwRPzL5KF4+J4WOrlcY
         xDHQq9bhbVFjhtbE3RQ6Asyx+2ruf2ZNxXXaKWP7io1YW2olxlRpA1Xxx564uF41RhrY
         579z45y6Unc8CK/UavkWy7mxn88fQrO+0u0nQwQyfzNdkZJ0rTnkEaFDu4jEem5bF3Ux
         nVohAzzQn1IcPZhveoknl9ZsMEGyZfhIvg6kFmeYrNAjm1q4fm6ZdnWdynBeqkOvM6Yl
         cusqGsJAEaXzufi8j6aJjBUTWEuwDYpPaW4uQUYG/1VXqW/AKkORhBbacANXMRvrtuVX
         Htkg==
X-Forwarded-Encrypted: i=1; AJvYcCUTyqomyFGs2HGMogrFMLf1o9oFg44JlX2wB8e8HTNKlZ+UVrbzBw/mwnL7ExZIHD1EMR1UuEDXUyeJ+w==@linaro.org
X-Gm-Message-State: AOJu0Yy+Y/L6mgDeqjlhubtVlh1X6bM2l4EqjpWytJ9TvUlsqiJfKdAI
	tSb+XGo4TvdAqXg3M2CUcfR7BJuL+RLv0TnXppmHJkEyqgeOPETU6CrxWlJbFQrBCQ==
X-Gm-Gg: ASbGncvn/wUjvQ+SO44Z1V7tv4BymzwaUx2vnqofEQS5jXruUToyx3Dm8ZcNW+1nG5m
	LWn6dzTfXAEAoUUuZzI4lCqu6kV5rMccVZrJoOVT2QWn4p9WDhyn/EqM/OwJ3ELjHWC+p0cip8J
	jxazRoNGRqvxBqavDi0NhpKYJ075E+MEK063AVKf6kNdfFt5PKU1OMjPbDbLJSijWf8LYl6QaI5
	Lx2sMIsp1m0mwZz6rlgO4PUvGHcl9/nX5hcKXHLkBU4LWRPsAe7jCC/kiOu/C4jEHlM8Bf2m6BO
	BpC/TnufhnsLSKmXjSVVdJrpNIDXUrWKv6ahe5ZT
X-Google-Smtp-Source: AGHT+IEMmS6ciWk/Y5QYiejcijVDCumZ8eY2Sx72qIxgeSdq7SZvIl1V5RaehgZdSDls9z4ASH3d6w==
X-Received: by 2002:a17:902:d585:b0:223:66bb:8993 with SMTP id d9443c01a7336-22e1ea79d91mr141126175ad.43.1746487247181;
        Mon, 05 May 2025 16:20:47 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1522917asm60981715ad.201.2025.05.05.16.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 16:20:46 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	anjo@rev.ng,
	Peter Maydell <peter.maydell@linaro.org>,
	alex.bennee@linaro.org,
	kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 30/50] target/arm/cortex-regs: compile file once (system)
Date: Mon,  5 May 2025 16:19:55 -0700
Message-ID: <20250505232015.130990-31-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
References: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: JNQU4YofKP/j

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index 7db573f4a97..6e0327b6f5b 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -16,7 +16,6 @@ arm_system_ss = ss.source_set()
 arm_common_system_ss = ss.source_set()
 arm_system_ss.add(files(
   'arm-qmp-cmds.c',
-  'cortex-regs.c',
   'machine.c',
   'ptw.c',
 ))
@@ -38,6 +37,7 @@ arm_common_system_ss.add(when: 'TARGET_AARCH64', if_false: files(
 arm_common_system_ss.add(files(
   'arch_dump.c',
   'arm-powerctl.c',
+  'cortex-regs.c',
   'debug_helper.c',
   'helper.c',
   'vfp_fpscr.c',
-- 
2.47.2
