Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2178766njj;
        Sun, 4 May 2025 18:52:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV9y7XYFWBc9OlH7I6p30q/RQZRtj+7HQ5z3GZDaB91GVTrnWaK8KrAyYNpThYfQRimiKrngTjHEqUl2g==@linaro.org
X-Received: by 2002:a17:902:f64a:b0:224:b60:3cd3 with SMTP id d9443c01a7336-22e102ecf83mr184653165ad.19.1746409959461;
        Sun, 04 May 2025 18:52:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746409959; cv=none;
        d=google.com; s=arc-20240605;
        b=RyaDutKfc+tivCseW9le0cfHCvyhxQdYjLs1bK6VtVosvRGbRbZ8aQ/MlJTFArQJTl
         FUp1lA9oVt9RdS89pfOJ/T05JHLMCPBZ/cvMQukoDbmWEnaxOlLNf0Jr/lmPhxkmM7xH
         MVrNtdVtMAD60zf7XQ8WxdcJ3olhWM0wqTBD2OAj5wZ+Bmob1pw4swabizkIcDpuUygf
         7IMsJkM7RVdy2klgX8oiEqKrDuNqJ/9yciqFmTb3IzKih16fl4NAewcTeCk6MIXwN2h1
         4bpq9HdaxiuioFi6crkOYjyDGU3j+t/Z5i0677dHbVfqeuYhj6JY5jkdLXNedetAK3bd
         NdCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=mduWzGcqrbCCMCYuVdtTD2ZBid0+LWN3eUl0cLQ5HO8=;
        fh=sq5C4DKbDq24S7TYW6+i9VgkBLYbSZL4X8u60AdpWQg=;
        b=iPvuEnt/UJgsesHLKu3fwYh50NLlbx01/WZhmY38ftw7w2OY0bjb+LsfGYAimR1AIL
         w1r5Q8iX6FtyqPV9GiI5z4S2cLqyu10LcnaAo6kLSOJFuA6EPEYM9xRf7LFIdn4Yc/qv
         xdqRXx4Cjz+8VohYNyoahJAnsJ60dyaw4OHE8028hQl/xtE9OH34BqbbzZo3CLWzZmiQ
         2e6tq3Nff/6KCQhwh2ok7ezfYsoygqZRXO0rZoF0YXXQ/CK3q4nlR9XUpuHhq+sNAvKi
         sRb3elnDfnW3vxj33HaTiDYVkyka4ExfWIWWDVrad/7soVCDHjJfFvtp2NJWoSbK1dQu
         t16A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Bs4IcbcA;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bb0ee24sor43066725ad.1.2025.05.04.18.52.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 04 May 2025 18:52:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Bs4IcbcA;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746409959; x=1747014759; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mduWzGcqrbCCMCYuVdtTD2ZBid0+LWN3eUl0cLQ5HO8=;
        b=Bs4IcbcACuLb6IhYKKD6Jw6xucxIQQ9iPongOGzrMj/Ob4yXFTb0fd2qBzEF899+Zt
         8+0wEq2IobETmVtZuta4EjPK6tdJQb0MGPOj1vQVBXRD0WgdmlaIVQYQU4xn7IIFvwE5
         K+5gQDsMfH3BWVKks4l33bJ58lltLgMOQ6kH+rIOI0yz6E7pm3yotxetBd3nPcTdQCI/
         ykUQV2jGGoDsRNbtZaKi31UN8zDsZiNxnrFe9V4c6eZI6Xoi2CL4xCa5CnczQIh5q/b8
         zC3WbPdzpjkGHTNRsVprkHsV+efvMA7i44m1rKWMrZ6FEifMOcnSpPflADceCWIgTDux
         X1GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746409959; x=1747014759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mduWzGcqrbCCMCYuVdtTD2ZBid0+LWN3eUl0cLQ5HO8=;
        b=N0IYonjtN/2aVgv+cf8F+6q9FJI5EkOLom94enmFhcgauPm+d9XYd0N7vW8crQ6ZfM
         zl+WjhW2/t2ifMM+un9WlFMqIBVF8KptcHdtqqjY0doXMQL16NRs4SiiSFQVF4WpXgVf
         MIepdjUasvIZAp8GDum9wcHNsv8MdNxR1ZDBOzNuCcanAQgfkbr3uuw6+q1jnNbm95ir
         N1nU6U8g+9w/fS0MZWMUPoIU7dU/T0fTc9Pu7mT8SRRwZ0sPNWtZsn5OkYY3PIgL2cah
         C8ydFnttiaHqXdiJ6YuLz/0pg5Pz3w5TMqz0dr16i7rPRIma0B1XMqZonu8rSD5yeKIJ
         1FNA==
X-Forwarded-Encrypted: i=1; AJvYcCWrBOad4W0to0jvKTsssvSGp5ibw6TbXNEJaKGYAfJmEwXKccjDfNlIKaPsTlkMUYYF+jcfdctHNO3ZTw==@linaro.org
X-Gm-Message-State: AOJu0YywMtWLTmmBgbudzok2/3peJDVE6yWQM+14x9av0JdZCV4PcYnW
	iIol1ZY+YapfZzDdvzxCtU57HTqqcRKWLsf7sEvWRo8EJ7mmrSpz449wBTW0FMRAIg==
X-Gm-Gg: ASbGncvno32WHkMihOA4Cd3xijoylAFL6sznXtsaOf2Z36clx3xrEDt2PWl6bnhC1Wh
	iFV6ecTYSs/ftb3fUX4ltlNEmxrIxe6NsdizDMtTpVbivrtNKAWKOQyR6K/SKxIVQQqfETmzp1W
	wJXzZ8jeXYTHOgyxIdnb9WZyJeZQcV17NDjarNB2MX7lVTB6SeR2zkQVoFdp3/4z8+Y9qtkJywt
	HR12faWM9bFcjmMtDphsNp8QIw9omw0nj9FVh1869ilEbzP2Xd2xvTprAn4kjIuVtSzI4Is7TgZ
	+b6GBO51CJFGBNNjdAqzGlZ0RhwZKXF3en/yauYL
X-Google-Smtp-Source: AGHT+IH2XYPu0agU5NsK+ys/z2YA1Zwc0j1DLfKUy1KfhckHrNgq8q2AagzIWxHqSSDuA5GNwLG8hg==
X-Received: by 2002:a17:903:2283:b0:224:910:23f6 with SMTP id d9443c01a7336-22e1037eb17mr163332895ad.45.1746409959031;
        Sun, 04 May 2025 18:52:39 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3920074sm4462101a12.11.2025.05.04.18.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 18:52:38 -0700 (PDT)
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
Subject: [PATCH v5 12/48] target/arm/cpu: compile file twice (user, system) only
Date: Sun,  4 May 2025 18:51:47 -0700
Message-ID: <20250505015223.3895275-13-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
References: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: rPtsGbBxgljl

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/meson.build | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index c39ddc4427b..89e305eb56a 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -1,6 +1,6 @@
 arm_ss = ss.source_set()
+arm_common_ss = ss.source_set()
 arm_ss.add(files(
-  'cpu.c',
   'debug_helper.c',
   'gdbstub.c',
   'helper.c',
@@ -20,6 +20,7 @@ arm_ss.add(when: 'TARGET_AARCH64',
 )
 
 arm_system_ss = ss.source_set()
+arm_common_system_ss = ss.source_set()
 arm_system_ss.add(files(
   'arch_dump.c',
   'arm-powerctl.c',
@@ -30,6 +31,9 @@ arm_system_ss.add(files(
 ))
 
 arm_user_ss = ss.source_set()
+arm_user_ss.add(files('cpu.c'))
+
+arm_common_system_ss.add(files('cpu.c'), capstone)
 
 subdir('hvf')
 
@@ -42,3 +46,5 @@ endif
 target_arch += {'arm': arm_ss}
 target_system_arch += {'arm': arm_system_ss}
 target_user_arch += {'arm': arm_user_ss}
+target_common_arch += {'arm': arm_common_ss}
+target_common_system_arch += {'arm': arm_common_system_ss}
-- 
2.47.2
