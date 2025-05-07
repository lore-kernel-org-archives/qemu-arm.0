Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp94369njb;
        Wed, 7 May 2025 16:43:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVcnl9HgbZl1aq2/ZnwQfbihrcEUsu1nT8Geyvd0x64kkMiNlaoTVTl7Pjuc7env6qF43OUyPl+JMoKkA==@linaro.org
X-Received: by 2002:a17:902:d543:b0:21f:35fd:1b7b with SMTP id d9443c01a7336-22e5edfd12emr75790325ad.50.1746661384650;
        Wed, 07 May 2025 16:43:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746661384; cv=none;
        d=google.com; s=arc-20240605;
        b=Tm0rQCw7H8vqePrIESfkZGeaRFMMTpIc8LBjcWHLZ6C42X/TRjWmEgoh1OOrIEpu+N
         hqMSbhHEub1GJGF6BUa4Fa4XJGU3UJVuW5g/sgAXE37dgG8YLWM99+0IHDO6W56vio2E
         q9uD8YNweOwOKrjqkz7u5kOrUUtW724e22q5M2UamOmwA1d9WvKPeY+vAv0mdLjIxwnk
         nV5uZEYSSme/8yfveaLAXrC6jkoIVTP45CWhCdi3ik8O/srR5WP733TYZ7BOvaNbQyoS
         frHYupZBJOXFyVbHEoOibKKKNBIDeJpVyUw7eGE6mIaUqRoqTkgzaxM8Q1eMii+PvqIc
         9H0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=4DYtSZEbP1atLGb677pRK4UuiMz1CYlbqC5aWBJkLTc=;
        fh=y1oPrrt0jFpTQ1wWLyqPD1PZHaVYTygafCXMoOWxKK0=;
        b=N5P4wM4zfbSNtJOVH896GqfFhkMWtxi0MGdA1OHGNjAcZ+LMG6iqnNNOo2PhfjsgE4
         WLJdBiAh4UhEzoHgh4sA9tMmSApLZNLpwXTCoVRf6SGJJelmZkvzKaeoN1MuuK2yKKiw
         3/esl3KtCqRGQ09Tp5x7yrPaynAe7gR2dHUKjZK6Dhxz+tOJVHqJyClyC2I1sN2LCnCt
         vSTgEcUai/g1q0robmTvM1vB0WCU4UBFXp32pnVIsNz95ml8SXvWENisdyayXvAKMs0n
         WSrJyD/HlWScHh5OzE6tUAPVPRVStcu+Xhhhow4IguvJHobpp6GS2DjnGBlOXl1vm/+z
         Gm0Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eENbscAd;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e62c670c7sor23843885ad.17.2025.05.07.16.43.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 07 May 2025 16:43:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eENbscAd;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746661384; x=1747266184; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4DYtSZEbP1atLGb677pRK4UuiMz1CYlbqC5aWBJkLTc=;
        b=eENbscAdLOpmnpAuwEDE2dVFi6h49sDu0laT5MSGjJrGBQYmziNLam3CoO/iSkRHxt
         tQw9+JvVkssIG2vJ+PBKZNBjGNzFPuorjM95y9rYbWVsVawNFe077oV4OoHIs4s+xrA1
         h7y7SAEhVOyFlIYiqO+Lq81eJB6wzrmPZ2aTKvoGY+3YVP6EYC8i5yPvd4YdaMrNt14C
         E7EPr6gU99mdUZnCQBBGIij8JYNZK+8G2UsE43g6yIMYqCsBWsTvj4DaMCC7lbz+0Bq6
         Gc1NOEXdZAV3v+dWIA39n80N1q/lWOp0RDJPOpbLwQBNyKrW0Dagy+Mh+hUk5tIH82Ab
         rb4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746661384; x=1747266184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4DYtSZEbP1atLGb677pRK4UuiMz1CYlbqC5aWBJkLTc=;
        b=xEGIOTd8kzc0ma2oH7RAIbul4V+C3sLe+fiaEwBAVCrpSHvOIVqyOTFsk8ix1dVlHT
         4B37DqTZSibDIFkdO76lvrdmdVw8piXNMxb/IlS86WFwNVT/aGrcaWDel41+zyv6zlMA
         r03QLN4qFq+JQL/5hYKztYDlr9bDCnciRpE2hhIgcT09nb8HQvoug/0rVJKURud3P39+
         Z6qVWajFiDNaOTb+6n+6Z8SeXWGfcP83ZN7MnYwdLZSy23MAAV+nNZvuvxDtRjNFdG9w
         GnfAv78EkYRrtAzI9ShB2xilW8U3h62wOcP/AGPiHJSzasZ+8BeY+ezRhyW1rspqFsRa
         hJBg==
X-Forwarded-Encrypted: i=1; AJvYcCX0xL/fiMl7qYSMsHIKiFl8YM40T/yMrWVNJufbzDLWbOYno+Aw8ZDRlWbGvlYBWFcMJP1/7CAw1lOCSQ==@linaro.org
X-Gm-Message-State: AOJu0YwJQtjtLZKF/NYztAhAsOp1u9K081zSSYqXR/rGr8wqk16bF+Y1
	TIk3uSCrM8R2ZtNqvLhwB3Dfy5iWey8hdge09RxCwgUhuAs3sZObSm7Ao1RK7nh+Ew==
X-Gm-Gg: ASbGnctgdbltnX5rT2oOJMBVT96n+ZdKIwIkXqfMAxyaiZdTv/Aj/L3VPH0TvC4DXtl
	zQcmdCIkiDU/qfXuscfR/3sbSIWn6fMMeetq5jMA3ygbMYqWluXsyeclQ/4bm4r22rzFWVEcMTf
	5nAMkLkwu506PzA0hb4BX0XIJ45oUSwGika45AMDWU4u/rtMW2pzSXeBNhSdS4ljCjHyUZzR1n8
	BYm8cohwaHsyIRC+NzN2ALb7iouKYt3xDPhdRjp9iNcCpWZkeRofOqPQ+0HxamVZeoN1wqXgVzU
	aDB1z4C40P67dD8Gl81vk7VqVjCo6W87/5fRhyI7
X-Google-Smtp-Source: AGHT+IHBsVE+hlS2uD6FYqTOaq37pTfP8GERyb8nhVUO8aPu33fEdCr6kj7WpBfV+u7FbuN+nl8ukA==
X-Received: by 2002:a17:902:e88e:b0:21f:dbb:20a6 with SMTP id d9443c01a7336-22e5eccc4e5mr70654935ad.33.1746661384268;
        Wed, 07 May 2025 16:43:04 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e815806fdsm6491325ad.17.2025.05.07.16.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 16:43:03 -0700 (PDT)
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
Subject: [PATCH v7 24/49] target/arm/helper: compile file twice (user, system)
Date: Wed,  7 May 2025 16:42:15 -0700
Message-ID: <20250507234241.957746-25-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
References: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: qHScPERtLwT9

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/meson.build | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index 48a6bf59353..c8c80c3f969 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -2,7 +2,6 @@ arm_ss = ss.source_set()
 arm_common_ss = ss.source_set()
 arm_ss.add(files(
   'gdbstub.c',
-  'helper.c',
   'vfp_fpscr.c',
 ))
 arm_ss.add(zlib)
@@ -32,6 +31,7 @@ arm_user_ss.add(when: 'TARGET_AARCH64', if_false: files(
 ))
 arm_user_ss.add(files(
   'debug_helper.c',
+  'helper.c',
 ))
 
 arm_common_system_ss.add(files('cpu.c'), capstone)
@@ -39,6 +39,7 @@ arm_common_system_ss.add(when: 'TARGET_AARCH64', if_false: files(
   'cpu32-stubs.c'))
 arm_common_system_ss.add(files(
   'debug_helper.c',
+  'helper.c',
 ))
 
 subdir('hvf')
-- 
2.47.2
