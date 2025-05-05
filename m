Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2178869njj;
        Sun, 4 May 2025 18:52:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX4+YoS5HiLJYEAQXO7apECxE3jIgaCJtKTiUvFEslyaEoHiJlebDVCs/JF/TAec/FOiVl2yiM989eA0g==@linaro.org
X-Received: by 2002:a17:902:d2c5:b0:223:4e54:d2c8 with SMTP id d9443c01a7336-22e1e8e638dmr95072735ad.21.1746409976462;
        Sun, 04 May 2025 18:52:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746409976; cv=none;
        d=google.com; s=arc-20240605;
        b=gTH3JYXsg8qydrqQsT12akS3NZsHjtS39U1+QvwuGxRVGmJZisi9wv0uxQSKj3oH6C
         CcaVzxTr0RtORazUnJdogrtuog/O4fHjr+54TuRYtk7WP0kGt5CoLcP2SVlF/wXkTuS4
         JzZ5FI5KJQ6w1t8zH5do8PGdwGmej0Vt/bjShJcvupaZEFw83LQwJagzKpNx2OeUVTjY
         FXCecbJdq1uf7EJ0WysMxokF/BK9cCHgRSePSn0t9bfMSbyDDB7dqqoKNBJzAkehdF0B
         qGULr3exE7TbA5F7TEIWmcbiPZOVDZvg5B5csh6QCj3r7KHkXon/d/ln8xSZ+0Rmk5wF
         2EJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=rVtP/RnhHG9awohdmhc7BZy6oUycGDI8ImSQa94LuXo=;
        fh=rbZYigDReHDj36GW9/ax+nFv3RQwDAwIzQ4zTmX2YnA=;
        b=c9Zzusus1t7ZFtSIMu0mhwh+JjBPpsCscVR9VWlbKKqyVzbyz890UBucO5liTkPDmJ
         3NT9OGq0F+ufzLdSVcTg0uUInOXHbFO++icK6cOfCukgWUtJ61Exs14/GoAVN7XKBVfB
         FbbASPX8X16oUGZ737S0gQzhHj3mGYucJDGAeuTk+UJkplILz5u18ihCZ5il7aR8MGnV
         fAI++nUhh7r9rqhcE5+R+fUmzwEP/dg7/twJb1URIszoBAgJBmN9tjCErf0u86iZAqvt
         nX2ahR7XBiYRYxvp7EiddkAIl6qK78GgIf44tPCFIT5l41rZ3KISQSOUOI9vzqi670B8
         Dxng==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GYvazZz5;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-74058d8f56esor2115286b3a.5.2025.05.04.18.52.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 04 May 2025 18:52:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GYvazZz5;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746409976; x=1747014776; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rVtP/RnhHG9awohdmhc7BZy6oUycGDI8ImSQa94LuXo=;
        b=GYvazZz5cx61/3BlEvHAGykWFWQvvejVkrpt3QdewWwsZasN2qxysreuVpZi1LwRa3
         YNHs0BqysuJmyukYpNuVequIwsTJXMp4mIPM5sCpO1RB5UyVOGvtrZrIVL+g2fHPgfBN
         wNZILb2iArxkrDLNvomjG6+ff0a1SGmw3fgPgTa7vJPLF8JUFloRqCgkHThxgiDvrjzC
         8QZi9uY2QfYRJdZQXcDeDjargjeOZEbtT7w+N4Yl5SqwUWhKLnZA3Wv7o5CGcqBXm505
         yKtq7bS/EavbfD/0ft3+hAWzaOWjTIYExefdwMGgfOMDwYEvMWYmCgtHDhYuS9ln4nZ3
         ZY4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746409976; x=1747014776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rVtP/RnhHG9awohdmhc7BZy6oUycGDI8ImSQa94LuXo=;
        b=hVKkqCwWu/7OckrnOE15mmIpobZ+JO8wcM1+F/a9pavmvr+VAinSyyCFuEb4Y4vyOc
         5oMeuEowXfzG30F8wDML7t4DkszwEsXkZNjyRMcU2mDexoTzDZloZGoq0q9ywjA3hnFh
         injP7ma3Hu1tLScrsortgYZ2lm+4qPwjU3h7PjWWYNtGu07vxIUsb4OrhYFMigENcvpG
         lb6ecVaQSi7omNeB4t6sVaZp5xYAw3RFyAN43mHpgSbBdp4+93DkdUyfzn53oL5tIqkL
         sWzVv/gO5EbC3X2XKA9OPCy7nto2Agzrp48670oSevgTLxMn/+Gc5fZxhG9Im6tMUIyN
         Io+g==
X-Forwarded-Encrypted: i=1; AJvYcCUUYdzbSw+bDPAhXtpDf3GQNTbjSHycsaLRjwCgj2UMPNfaiSHv7ac/B2uUupQwjWV4N4Z30IX5qTgoaw==@linaro.org
X-Gm-Message-State: AOJu0YzWPUQ/sVqUdYeoaNGRrv6CNxAbKuNbS7rlgvnV3uSbgEwpYjTv
	uwcjt6UXiiP74sI8dnwRbH39QeDLbxD5Br2WSh5Ra2qWsErEx/DGuhUUWlVIsTMBaw==
X-Gm-Gg: ASbGncvhZzu4xRl78btznJ5EAwTmMEgQpWpUCsnm1WyRrRvs4fnaEJ5C4sJvbyptmnB
	6eBCMGGsnZZ5GqlvSQZiXGfhIbpuXpsuC/vFGenRgZF09eNBun/XQYQQPf1X6nu8t5D98vs1jiX
	LxLkWiZ2/u/QANhIPom5FQR7WMWtZRs1hF270vOX8Gsh1IkLZD+oSM8zlybSzI0WeF93WriC6Rb
	pLS1KIQIMaqdcnG5IfXtOS9gbZe/hhIrhqhjyv6kqzU5dZF1VBP6+eMlAoS8aaIAyQD7rzXlDRp
	u0dPWg7KOq+Jis3yIk8YN8lCGfoCH0vfgyDQW8hdasHMRBb4ysI=
X-Google-Smtp-Source: AGHT+IFCVf22Y8b++NohiLhDf7F1rpFLdSCNO7L9sTB0r+8DXUCBJ/9XAzockGK74r3gOY9XTNVHLA==
X-Received: by 2002:a05:6a20:cfa9:b0:1f5:8e33:c417 with SMTP id adf61e73a8af0-20e96206094mr8736271637.2.1746409976114;
        Sun, 04 May 2025 18:52:56 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3920074sm4462101a12.11.2025.05.04.18.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 18:52:55 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	kvm@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	anjo@rev.ng,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 30/48] target/arm/cortex-regs: compile file once (system)
Date: Sun,  4 May 2025 18:52:05 -0700
Message-ID: <20250505015223.3895275-31-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
References: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: ttbMawKbikcx

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
