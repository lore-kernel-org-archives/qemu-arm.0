Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp94416njb;
        Wed, 7 May 2025 16:43:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUL8Da13e2/YmGSNZRzpTp+YTKA2vjeDf9z1kPxz6zn7Xue9NtCBGkR363zhAtdKSdXK6L9G+XY/Tq5JA==@linaro.org
X-Received: by 2002:a17:902:e5d2:b0:22e:4a29:629c with SMTP id d9443c01a7336-22e8f0b60d0mr17117595ad.47.1746661388796;
        Wed, 07 May 2025 16:43:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746661388; cv=none;
        d=google.com; s=arc-20240605;
        b=BeU06kVmFkZye2VXXTbygg3/bw7uid76CBJgfvfXiiapoRiCtJpszsc3eDvNSvykZj
         NQbCYunGAgbNPBu9TSty217QJhC8Mp5O5nauwlcCjOBmoAT04Db5gdQ/gKIjavQPRqRQ
         7kC3T3fJtjV+tE5SYm36QdC9ZvJpm/xECIbdG7ZoE9B7hFCUxzS4kSRjBZt9To6SeoWi
         JxPhgb4O2YhLS0x30pLO54UiFT9GtM/OMjInWfV0OTFEUZxmBT7h2FNpNbxDxd3Myog+
         j1XbbRVXxlMi2rL/DczcVw4q//8i0z/7xiAxHtzVLBCkCZMl12m6Qknizm75xKQuVo8O
         og4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=rVtP/RnhHG9awohdmhc7BZy6oUycGDI8ImSQa94LuXo=;
        fh=5nAG1mfuVWmLUkm93W1yofzihZEx2CfJdbOykcK6IX0=;
        b=MD7ouTd9csvkrzERv+BfkfUpv3a7T/05MvNzZia0fj+M8rg5/FUz+qaRuuBCl6mB3e
         M+UhmBlsJvCWNEsdClrJr7NLd8Y4JVusfhyJ5cB9rL0JEHCebVmct8Ihl/SahkZkrPBd
         +gqr9Bz+AMzWXYBuqTIfi6FLngfsPco01Pu0TLZRIFFHJEyALVvTAeweRE5RAl8V9Kwk
         YLKyUPglFIndkxzMYrSQN7zu/wr2f0uH2KSZfQ/60ZcnctYPjUH9MC9dG9Jfp4s5YCvY
         ZzZs51QXZLJeIOGEHmuuOKKeS4Cz+plitjEoPR4ruIz6dzctgtuGYnQc6tK8X6JLn8UH
         qK1Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jgKLPKj5;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bb2242esor120776615ad.8.2025.05.07.16.43.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 07 May 2025 16:43:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jgKLPKj5;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746661388; x=1747266188; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rVtP/RnhHG9awohdmhc7BZy6oUycGDI8ImSQa94LuXo=;
        b=jgKLPKj54CjnOqzSEQ0EYuux6ZAKl36ZarIuBJOovwOl+DtMUwbPDUBOmDdDxTXfj2
         i16wrrNqnzDoXJDKIoluwX2KEc7E0kpe4RPaYQjh9Z1WwEWmkNg27QC6Kiqbyeio6bPr
         PfNRMU+98n1bYNYXgzJ9G6L7TP8WdqNeGuCRcEUEZPcWL6pkdZYZsQoejYKM5cmq/4mN
         LOy5OFSURkFZYnZPSoOsAtlJ371XO12W1tcXgt0bKf0K/jsxNiLeh6vkDl69HxFNloex
         AR6UpALgLD3oIb0Vrclh8mSfQCEGEkQ5y5MMbrfxhwO4XnpwFakY7OvLrYkqveeAd4jJ
         wy8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746661388; x=1747266188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rVtP/RnhHG9awohdmhc7BZy6oUycGDI8ImSQa94LuXo=;
        b=p+INqKeZOR1gGajv1Io2msA1tGaqKafSBUgfxkM3wCoa7eMuPVGU5ggF+voSbpBonY
         Z+iur4+8RooM5xmHxidhorq/umY4lTDzfODYsvd+3paNjOcDkMYri3WYe275V5pAWCHL
         2lhemrH5LLjUJwilKbqNjwWpKGvXaWDWgcbgPqkCHlEM60WYRUGl5AbNpdSkYaUw+VjE
         1flyaGP/IuwrUvepbzJ0NRudeVCcebsu3eozglzgGRiCuct68xQcVaMkU8RzpTRAmFWz
         x4QHOoyvZYXMhgFd+aMMyWvi4SELLRq0n47TB2PTm/vGMM+qSxccdXTEka9pAoZTDEjh
         yHGA==
X-Forwarded-Encrypted: i=1; AJvYcCW1TdqgYFjQefNcvJMEEVrKlseuOnhhwcxw6SxgfyOzUFYM2i9j6vmL9CSq1ZHiqx0bFUTO3ZgPpupDDg==@linaro.org
X-Gm-Message-State: AOJu0Yx1zr7AU3Mnm5Aiup6dgbJqzFZlfduMeFouexp3o+hFJiIa3J05
	AVScb4QMZHK+KitpEXrLQb9u3arcbzHX7NlzrAWX6NoQAdoxslWiA6hlUsslNe6wYw==
X-Gm-Gg: ASbGncsbrZDSdyQb9JTg/Ihhief9LaP+4ZYbR5x/5lA3F0oWvskV2Jfa4Ik0H+94ikv
	Sko2q+vqiQoXhUFOisZfEIny3xViWv6LyxpG5QtplcD1/LstgPm6F9yr4dcXT+jGKK8uL9ROgUh
	tuohJYNZiNVwz7vD0lVsk6AdxFSk7c4ejEPDBtr8Enj41SLbWUMSSMI5zdKK8AQmM+3eIZySK7A
	6kDi6VSJJywvkFrgeF3HKBvOQZLnPXEl8FRav386MVw0FWGK7CoQAoXY2P937GbygVebimKYSuf
	GSjAE1Fe4j/0MkAw/Lc029kXnMWomPdCIuVw0sWw
X-Google-Smtp-Source: AGHT+IElhneOo62MjSKskYIQy7VHQ7smeSPm1m2Q80DLuetPyAssqqhuGAhjwKmYU5VfAYntwmXZvg==
X-Received: by 2002:a17:90b:3a8f:b0:301:6343:1626 with SMTP id 98e67ed59e1d1-30b28ce15d3mr1418228a91.1.1746661388386;
        Wed, 07 May 2025 16:43:08 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e815806fdsm6491325ad.17.2025.05.07.16.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 16:43:08 -0700 (PDT)
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
Subject: [PATCH v7 29/49] target/arm/cortex-regs: compile file once (system)
Date: Wed,  7 May 2025 16:42:20 -0700
Message-ID: <20250507234241.957746-30-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
References: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Cro7Uy+c9fF2

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
