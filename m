Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2778218njj;
        Mon, 5 May 2025 16:20:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX/TKrfOmya4sxjjWIX2xffWRR5G62T2bkI7BNPo1VBCQwp2TrXTEp9qQKRpk+Ek+46dIbjwu+FHt1CQg==@linaro.org
X-Received: by 2002:a17:90b:534f:b0:2ff:7331:18bc with SMTP id 98e67ed59e1d1-30a61a3840emr10974004a91.26.1746487232555;
        Mon, 05 May 2025 16:20:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746487232; cv=none;
        d=google.com; s=arc-20240605;
        b=V5ccZPiaav7MgI+9R/GI38sMzhNtjI48EWluExCdol+/mt+NTKWX3B/f2ivhrdNjqE
         fsicgUHwZrf/l3ovgIADzpujs+Ajs5eeJ/DymdQYcWgV2AGgB6ZivuKFhm52HICLjFFd
         aakwK9bC/BvGHL2QEYaLpKrtYmqpo38UyNVaSsx13foL3sVmzwtO/J3c3apo1kQ5ix4x
         w5HOBbdGkYVUyBfECaxW7acPja6oX9DvUIrEj9ri90XBQzPCHNkS56DklVgzLW1+3WNK
         jTsYy/wbpBuwhRMnBC6krEjDFEsAkJHZQf9fP7euPTawT+rKTMLXHyAqSU62VXKbekOc
         wr4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Emf7r2NlJCGBegzvSaP4+YNHnVcvC5KK1KGZi+oKRes=;
        fh=TF4s1ljFiTSmf0pZBZLcMPP1rskrf4JomD7GICRgX8Y=;
        b=bz1racBfffkF+yCj4xj61lE+9Tf5LCdLg1CiGiHuzpWVMdGiKM2/8wtcJafkdtol8o
         BjuSutv6mst8FWqQmqEibERj2jN8+1Ca7aWcl4xayZ7eX5f/0CjYanWPROXbutrRKfSa
         7F90q+FL+qxh//iGTRp14A6UgbF74UHbZm63m+MWKjl1mS1f4wZXH6AwNOkhE7gcTcVh
         o+iHTDUmKGMw2Jjd7TWIViEFWBr05u4ouFyoOGjf9Hlkva8Ah05ytaQ+VvqQsbrAuvKR
         dJ4oPdu35CqAGFTUoQZxZjzPkZRwEJLHpIF+/1HwVwfw1xUoylpfA1wVEUvW0bPqLcHE
         ZOYg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uAZKaka6;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bc88a17sor55729565ad.11.2025.05.05.16.20.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 May 2025 16:20:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uAZKaka6;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746487232; x=1747092032; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Emf7r2NlJCGBegzvSaP4+YNHnVcvC5KK1KGZi+oKRes=;
        b=uAZKaka6glQjM3pCkGXAwutPMvVtanO+SnE9blr/rf3UiNpPPxQMDJ7ksh3Orjmd4k
         sifMwg4SQZZm2TpA3EBtU4sAZazH/i011uDzGDJyFhbqkwsZ9wl557TuyJPd7oh8IGTv
         4uiAsVRQXMr4251anKEAuQ8oP4+2MEn3me4XXBHRRLQLKsB/uUnSvR2D0R2Vume47SsL
         OZURRvSiapTOwQZmLLiBBuFaXNlhFdtGdHtYKsWcmJf3Dkg8w/ovVe/YZEuSr5d6eYye
         XrP50cl2qjR59UnM1GOYnTE5pdXq7Ina2rzEkdREuyhrEect4Yvg8cJaXwp3aGX9tvDH
         6zFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746487232; x=1747092032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Emf7r2NlJCGBegzvSaP4+YNHnVcvC5KK1KGZi+oKRes=;
        b=TK8D/sGTgMA2GdrKfH8C/yWiFx53c8x+3fOhzA2AmxpXhwMtZUTKU+peLoZYow8OLv
         yZSEAU6yAd87/JIWKTTgvljamtgF9Zz11nevUCAusYPz3MfoXwzdrXYzxLnbRKGkG/Wz
         slL8QVt5u2i/VK1Qm+tGY3dByPZaItactoqop8csj1aSviibz+jlIPiTTHII6meixuIB
         lyxureMOo3V1flVLwZ4PJRN9pTNyQdhMpD/zsZ0O07k+UXvN5FLpwQDmanMpT6/gh7jk
         kn/AMOxBaQTkMdneSmTF1UYdUl4sSHgqyL7ZX0Xwx8fRP1E8sQONcX9v0w1uvCKv6aXS
         o2Mg==
X-Forwarded-Encrypted: i=1; AJvYcCWpxf47q6df5wlnvqrl8LU/rVi3u2ydYq3VNf+BUEchKVOzJercjpzotONZQcrrsdyP3KflUKHIgjoCKQ==@linaro.org
X-Gm-Message-State: AOJu0YwK30TSV6bCUg6REuLj99ljVCs03yT23SZEOJH+wSYY1H4jKqCk
	DcbfP5pfH4u4snpeYAz3PiZo5hbwbsDS36UZNlIQ49fYtTw+S153M0etmX2FD9HbhA==
X-Gm-Gg: ASbGncsBdlzdDMn6X0vARGYtqlE2lLdMHXhCalrYTlrHh8Y6fB6DZSmAQVdRgVNLXvx
	v2BCH6C8LuzTBBl06Dv/MhdbYX5+02EmyHEtMVm+IjYIGwo6YyPZWdzev+a6+sfJ0FdP43ZQk3I
	VUR4/SHUvfUJpuR1Z9PMvd3IrICF4k34c6pvukZq9L5kFhXJVlpkrw31HGo+zTPW4D8SN4++Y97
	JzSrSsZayesm4m41X4CrWg9HFeMnkC+MegERu5n2EDrEZOIIMSvTMwitE2cGCOmS4Rw5uyfPsml
	VyMHl9uFjyXIMTaYFfY+gOBUTKJuD+wwyNIQDSUz
X-Google-Smtp-Source: AGHT+IHhb5KrNk4Mgz8Jm32CJdaDgHXvMSFxZLzvYea86hfhE5UdJkPL9MIT+4Z7L5B0TwCmGOQzrg==
X-Received: by 2002:a17:902:e750:b0:227:e7c7:d451 with SMTP id d9443c01a7336-22e1eaa4478mr136820055ad.29.1746487232193;
        Mon, 05 May 2025 16:20:32 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1522917asm60981715ad.201.2025.05.05.16.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 16:20:31 -0700 (PDT)
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
Subject: [PATCH v6 13/50] target/arm/cpu32-stubs.c: compile file twice (user, system)
Date: Mon,  5 May 2025 16:19:38 -0700
Message-ID: <20250505232015.130990-14-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
References: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Bos1odJMqbKh

It could be squashed with commit introducing it, but I would prefer to
introduce target/arm/cpu.c first.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/meson.build | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index 89e305eb56a..de214fe5d56 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -11,13 +11,9 @@ arm_ss.add(zlib)
 arm_ss.add(when: 'CONFIG_KVM', if_true: files('hyp_gdbstub.c', 'kvm.c'), if_false: files('kvm-stub.c'))
 arm_ss.add(when: 'CONFIG_HVF', if_true: files('hyp_gdbstub.c'))
 
-arm_ss.add(when: 'TARGET_AARCH64',
-  if_true: files(
-    'cpu64.c',
-    'gdbstub64.c'),
-  if_false: files(
-    'cpu32-stubs.c'),
-)
+arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
+  'cpu64.c',
+  'gdbstub64.c'))
 
 arm_system_ss = ss.source_set()
 arm_common_system_ss = ss.source_set()
@@ -32,8 +28,12 @@ arm_system_ss.add(files(
 
 arm_user_ss = ss.source_set()
 arm_user_ss.add(files('cpu.c'))
+arm_user_ss.add(when: 'TARGET_AARCH64', if_false: files(
+  'cpu32-stubs.c'))
 
 arm_common_system_ss.add(files('cpu.c'), capstone)
+arm_common_system_ss.add(when: 'TARGET_AARCH64', if_false: files(
+  'cpu32-stubs.c'))
 
 subdir('hvf')
 
-- 
2.47.2
