Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp94373njb;
        Wed, 7 May 2025 16:43:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX7Zavf0FsR+LjiptN3Glqe5+S1OF0Wp6mp392b0DY/Z3zzJFeKJrIcMen86vZXe12Jns7E5Eb5NhZytw==@linaro.org
X-Received: by 2002:a17:902:dac1:b0:215:bc30:c952 with SMTP id d9443c01a7336-22e5ea1d380mr65689735ad.6.1746661385540;
        Wed, 07 May 2025 16:43:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746661385; cv=none;
        d=google.com; s=arc-20240605;
        b=g5G49IWmUR6fpLfK29raus0HbfqFU8GBswl0OIi8rzZyw2/lm9De04H+CcuNMtJfdC
         4eJvu8URLBBgtCEwGNQpqWtBdF3PA9nBaAhUsQ4xKMGhhaV6i37C0llvMxsVymRpq7Bs
         CZIsX3m38gDKivqSFWlPBbwPqpEqbKGM8/hFe3+fZpV7dEi3xpmJquZbtCI8geCMcBRI
         wKEZWxswBiN5N1dEzmMWJlIaWT3Nblt11kgQfrJLqw04dfecwsBcF3KeiCXBKXhmZLFc
         DAT9azR9iMYSXImXTkjceQBCNExCkzrpy/8fGTjVAp0EniF1enkxLFVHrgcDpE6r7JFg
         Wgqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=d146Pj4KjTAmT+769pG7plO/J3O67dCMeGHKPEFKjBI=;
        fh=r4O7zRmAcngxfZfaARuMm0xtg9czHixg03zpcwxB3Vs=;
        b=QoXWUAOCHFSEz7NZOAL8ujSd3hule70KuVwzAB8HauhYwwSXXLztJAIiRWR8XatOTR
         UwVesOo1uMWjm4grKSxabGPA8z9qeHV0g+RVWaCfwpm+ivudP8T9SM2mSbzNr165OUoZ
         CZDzV+gjcOINmoEWtONclm/VyyPBGRDQZa4T0NZJKc5svYH42l7Nzo4oCX8oDLzYOMb/
         qAx2Wl0bGQdUsYt5YYxTajy+Vz0D12bKmElIadr0o5eygrfg+muHXH2TYBvYw6Y8zAej
         HKq89sUqXOOdcQoaJ/4vDQEb574aaFePGoCMUFwUbkbHTn/67M3ynAGpGzi34Qi67xTw
         0w1w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=loez4sgW;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e3f04c202sor37088335ad.2.2025.05.07.16.43.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 07 May 2025 16:43:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=loez4sgW;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746661385; x=1747266185; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d146Pj4KjTAmT+769pG7plO/J3O67dCMeGHKPEFKjBI=;
        b=loez4sgWt9fp1e1cnlrR3vWurNhH5J0BTa/POdt6jMOzlQ1cG28yZZ6zmRNfYs6WWX
         CsT6DY6het5WS+FQX51p2i7G+bZ3TNVeu7TLxqaM0we7bwHA5rpNbgxnTdSNKq+P2NJa
         HeNTqRBXr0o5rL/rTK+Q+A/7UojoExtcKPu24KIbjYUVprE52j01TO4hjDvXuKnsjz9o
         vPJPlreQar5zuqXHm/lLuZxS4kmuZ/r8c67FZL9yWC34KF/qV85S9Rn8qQE5DZnEDFJb
         rMuMhnjPKZnzS4iGZsMuMC1THv8MANc89FT9lzl0sKhnn/U3fy+mgp4pnjo+GTmPJUHp
         vifA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746661385; x=1747266185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d146Pj4KjTAmT+769pG7plO/J3O67dCMeGHKPEFKjBI=;
        b=XyEoTao9P2dg3ZosLJSxmjr/dqxJF3hhU5JOruEccikD0Svd37DUHCjV+P2zD2FuT0
         hkLVPkfCoizVWYoy9KcmrDYtgLDf2SfltzU0yiXqYJNvE7KHCBkQdmlLxLV9ZAKrezl+
         I5YPpCRItvH//ngs0jCAPEwUUgpsRPkDShJyP2H5UfxhIDCGrLZyJtdM969USw8ALWuB
         AKhPjXqE0hHuh58s/87U1OtsiCwdEdee+NaRMiKPn0bb/pEFk0nQ/7sEvpjcjkuvGRIy
         6aYHrsnMZt7wckybMW1jJCYc5ca+E8Nz/JJe6qqWWTz5UrqAbj4LKvv4I7nKCLyLdGOk
         BB8Q==
X-Forwarded-Encrypted: i=1; AJvYcCW+lprU01NCpOvWrF3zLm/SOcfF3f+xc+OLzDySgQqgRWwKViebh+HcTAgCThGT5dJHsulRPKShWt0EcA==@linaro.org
X-Gm-Message-State: AOJu0Yzqz0niCrcxtdpPKUFX5alXrqF/Zx7fuM4IUPZhVl44uG4Gr6c6
	dRA+QWs1VOI5ve72YfTOR77sFEJyhOyZRSCfgDPiMXVYEcUpJlRdUluLprjgdiO5fg==
X-Gm-Gg: ASbGncuOWlf/W/FGec/gPYd1PuDoBH4dPBiVLBMbZl8/rCYC8229cnpp5EdAyd5g8To
	om9KIGDyWvKpokoClPZNQGlqPJjGglPWOsX0kOwnbWRuFYc5gYZH3juO8K1LXBqtynajQ5lQqLD
	zXUVNX5kTn2Q48kaC1uPPsMiDV9TAKSybEQjze1xtOB8ADTRjMmfC66dcbA1Mtj0CmvMJDtb26Y
	0vEHWAdBEz6MVKCDKRua5wvKIzDgg9Alc9LRspqgaSsdF+PkvrvOSow/2dDZ8Kzri87j6SS1GYS
	umW6+A6EiHhBmAhDGEeys/4ZVX8XPNV7d508Xtfq
X-Google-Smtp-Source: AGHT+IFVqPCNhJ/SeZ4WWES//nY2YQYeFl/MFJZQYr21OLGxZWrJfOfR+lX0wne2fBbdqAzOq0UHOw==
X-Received: by 2002:a17:902:ccc9:b0:223:5e56:a1ce with SMTP id d9443c01a7336-22e5ea9dcf7mr74347735ad.32.1746661385074;
        Wed, 07 May 2025 16:43:05 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e815806fdsm6491325ad.17.2025.05.07.16.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 16:43:04 -0700 (PDT)
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
Subject: [PATCH v7 25/49] target/arm/vfp_fpscr: compile file twice (user, system)
Date: Wed,  7 May 2025 16:42:16 -0700
Message-ID: <20250507234241.957746-26-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
References: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: wR09dnqYih2i

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
