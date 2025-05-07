Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp94338njb;
        Wed, 7 May 2025 16:43:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWO4dvxhkk7EDpntVYYMOzih8DPXcjrYTa/7JYP7cPwroRuOrANxvkq9U+iYhsMPr4ZSAV3IbCnH9saHA==@linaro.org
X-Received: by 2002:a17:903:194e:b0:216:4676:dfb5 with SMTP id d9443c01a7336-22e8476ee2dmr19555405ad.21.1746661380468;
        Wed, 07 May 2025 16:43:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746661380; cv=none;
        d=google.com; s=arc-20240605;
        b=H2pOXWjIp/8g62gP3U//+TDnyij9P3bbFU/vZFuFBgEiWtVfA+W2n1J7mAdsSIzF5e
         rRNCjD+sXPS1hqKItpFHVYC1KnQPhbuiPBOTkCnHh49ulEjgJDNI8nMrGU7hagLeaq5X
         WsBSD3Rx9K7RXTv/wsy53N+VjQRzF8CRV7kuy0HnmRfg3YsMBaibwYq/Alr1YqeoSsVi
         +SbpO+Lotp8yxG5KQqF53W9YRef7gCmacUpLi8CmgkbEnjj5YZIih4oFxYqt4Wq+POOS
         jXEzKr7J7rHqSvX7hJ+MQ7Q8QOau0XGRsej6JBzU0znSWPfUm/mew0Da+MmTHwGsN24o
         tN8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=u/RowU+G9lDkd5OLEKmfnzuDeOXrVzkwWk098+SYGJQ=;
        fh=/IrG5WCEuZSoFHww0kx7biGqlJjHdAGIyasIqGzVKwM=;
        b=bYubMUKT8UPc++iG0TCB4YWnBHW7FNsgxJUIu6lBQ88Sw8YGx7zwZwuck2I8haqPFK
         a8rHY36ear1iXp/C2hZHd9OpHwodckAZq3O/7uMvouMWvV2gKf4qFxps1vytZmWxcNeo
         JWXuKMX6ighIHoOLSTMzPBpPmY7SEqxKEUhZYZ/txe9qYsud0b+RpBlEEE3ZbFi1PKm+
         JKvde9gyAc6g3wf4hxCVM8XMNWi64mTmEkFtfvQmY10W2E35ttSnbtbz7+SvUgoXn28Z
         g6gUU3MQXr9ySjkMOy6iP91suc9YVe1u1jjt0ZTJ2OcDvV6FUO4Eo0dMOH9V+cUD0gpr
         vRoA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=be5KErRf;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e7f21268csor5945555ad.3.2025.05.07.16.43.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 07 May 2025 16:43:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=be5KErRf;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746661380; x=1747266180; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u/RowU+G9lDkd5OLEKmfnzuDeOXrVzkwWk098+SYGJQ=;
        b=be5KErRfpnEe+PXKl8Af5gabM2I2ta/tcsozdCOX/fcZ31CHacprFGhFJSfn6u8H3Y
         aYuexJVTuvPkOCz2ZVWPYYJnSEJBkKjWKiJCXTyYk4EOLSnqx/JrmLPzCEiqg8mjX8l2
         Zqt8jfT8j6K3lqETGRsbSm4l4d3Jt5GEF5Zn+QePFwdc8vKJbCzBogeyR8fWbZqFNVhp
         kAKNJWTygRRtG8HJAjqEGzOp4KeTYBjaZuUTJwZs2eStZQumUO490zKvOgShE6VOKsLK
         bJkrBZHQtLgRLD0ikSyQv2fM8T0z5aJHTqNZKbjlfVjFqhJPmJTJrq9O2CE1ljoWFnma
         GwJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746661380; x=1747266180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u/RowU+G9lDkd5OLEKmfnzuDeOXrVzkwWk098+SYGJQ=;
        b=lmVFJfHn3Bg6FRPnN1z5AdvSTyHoLE0BelFKypBIPVkbGMvWkYeATd2eTg5rGwR/1C
         WnyXCppPUnql7wIr+ApKilBXK1ccpvqgXJV4Mq8TEB8QR/xIfyrTTAy+llB4Cs0Ik/0y
         bQXAvDdZplaJZqk3Q9slOESIoVKKpl/3dL96JD/CHg1f5IMv40jIYUMtAmnkbiZ/2BTC
         q7Ma9Wijwd41DMS/p6KQ7+rePBqqY9A5VOKiWaIyadaKmyP2TDjB2oabLsTVGYaZZp+j
         gXwUBJYhGX+dCJ0/tq0A0P6U7AuRI7TGxmxwBp8Qwy9qwINlUAQ/qnKQivy0teorT9f3
         7Hxg==
X-Forwarded-Encrypted: i=1; AJvYcCWEdHYtfIq1pfh+muHIep/vXAJoqA/SYNWA+lcEQQn/Ql5mo87GqJWCx1xRXM3xwshuejwjDVWA4NSd0A==@linaro.org
X-Gm-Message-State: AOJu0YymcqaPcXXu3ieoGfK80+dsAw9scpAp49CCgWSiBgJsNN2Bdlzn
	M+mm34PlQQ+WQVBacoNcsprBQ5xXsXJunbXSBnikaOn8nNbUos8XTzTDsrCUFu7AlQ==
X-Gm-Gg: ASbGncsrUqG6EY+iZ5k37ViaBMpvVjt2ercSLJjAeaJHSPyv7rk+B7dXbo8JnmyUhjD
	0cTtMdqqsKz/SFuSKna1XvYdz5H9zAjegM0d9/8e6XkD1tkvZp4ODXaEXVkb3CFvo8f+rDGHAoW
	Y+AYFxxG6uKc+TXIjhtMkEe6soDejZ0Pl8nPp+BNVKc/jyNd1/+sogJFLYIa+G52wAf9bljWc7i
	2ved3QzJDNWzomu3pGXb472PxSSD6KDjTjpPCZ2zX+VkaYlgtjvd8F6Svp7bc/RH0nYcO+MX8b+
	YiVolU2W67XLSX9sP8671Kv7pasvHki0Qgl5EVbM
X-Google-Smtp-Source: AGHT+IFr6AonYuZbiOdyHtNzMRkQACG1nPGT85mHzH8LSDoJ9GfVu4Ipl9+GAoDhcc3RgvKKndBmow==
X-Received: by 2002:a17:902:e5c1:b0:215:58be:334e with SMTP id d9443c01a7336-22e846e735dmr20084035ad.10.1746661379975;
        Wed, 07 May 2025 16:42:59 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e815806fdsm6491325ad.17.2025.05.07.16.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 16:42:59 -0700 (PDT)
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
Subject: [PATCH v7 19/49] target/arm/debug_helper: compile file twice (user, system)
Date: Wed,  7 May 2025 16:42:10 -0700
Message-ID: <20250507234241.957746-20-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
References: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: r43eQhBQj1yB

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/meson.build | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index de214fe5d56..48a6bf59353 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -1,7 +1,6 @@
 arm_ss = ss.source_set()
 arm_common_ss = ss.source_set()
 arm_ss.add(files(
-  'debug_helper.c',
   'gdbstub.c',
   'helper.c',
   'vfp_fpscr.c',
@@ -29,11 +28,18 @@ arm_system_ss.add(files(
 arm_user_ss = ss.source_set()
 arm_user_ss.add(files('cpu.c'))
 arm_user_ss.add(when: 'TARGET_AARCH64', if_false: files(
-  'cpu32-stubs.c'))
+  'cpu32-stubs.c',
+))
+arm_user_ss.add(files(
+  'debug_helper.c',
+))
 
 arm_common_system_ss.add(files('cpu.c'), capstone)
 arm_common_system_ss.add(when: 'TARGET_AARCH64', if_false: files(
   'cpu32-stubs.c'))
+arm_common_system_ss.add(files(
+  'debug_helper.c',
+))
 
 subdir('hvf')
 
-- 
2.47.2
