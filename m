Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2178895njj;
        Sun, 4 May 2025 18:53:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUKYSWho2dXaq2gtDZcR/Qq2NxSDFrdz+Y8Ohf2tkTzOXat/Xb4q0UQlQMIPh64UfpkVnvYlamYsN/YCw==@linaro.org
X-Received: by 2002:a05:6a20:939d:b0:1f5:6e71:e45 with SMTP id adf61e73a8af0-20cdfee995bmr17813771637.27.1746409980400;
        Sun, 04 May 2025 18:53:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746409980; cv=none;
        d=google.com; s=arc-20240605;
        b=MeAV5UY7JNQsaLxCHpxteN44dTKJXFY+uMjXBC4Cn4BtVisKfGqeL7wtadgsVKaSp8
         EHs0Dm5YWLWlfa+hmMcZ5hnzjb2UItQ1mT+hVnh5JwuKxhQrvVQQ5YmAv/gdagVzyys2
         KdGXuxdyYxzXKInFvgfl86GsP5zw0jRzoA2tOT/n0ol3OojW2sxuzuu2zpORRw6ie2nV
         qjHbFW1TtceEOQS4RcKok358L8bVOaAs18UMOg9WL23w8xbdpwuGm0Tk6ndUi1dqG9WK
         K/bqJt9B42qERlsXVYgs6t7QnwWKPfdjy2JoOj/ps0u7NRnZ28kZHQRVISb6qANAP3/D
         yP2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=vzXXutq4wGalZELe39I44dxOL/4dV/vBf09UEOe1qt8=;
        fh=6XrbPYlgK/2c2JM/w22ZlDZRrSYnXLiEyi1TAGdUuAc=;
        b=STXhCl3XFcVXgD3ectL7+2EnjKi0qGL2Z7t9Jb28bCqqKNuOhT/eIwr/hYyqu6XQd/
         LyLlmVh/UiUqBQN0vSbo1YQDnuq/tRla7zbyzSQBhkA+HK7bcPkZAWWTIi4BakiHxFLO
         zxBlSWbvK67oZ47AcXmjG7c6iBJaEqntXY57SeqEiFdcoDCk8q6JWhsTEloZMYyfU/EM
         uzIO9jXaWqfBEMZorroMaxvSsiSkOxS2ZoG+22u92HZ6IGRnUOYvz4XUt9eJDZwTzFwG
         opyPuL5+dy0DS26LB5UOsV+vD+VUSAUt/EPr62yrhqGUT8dU8wDj97qjJXyh0sjcFjLr
         uhAA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p6SmC962;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404f9e870csor3793944b3a.7.2025.05.04.18.53.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 04 May 2025 18:53:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p6SmC962;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746409980; x=1747014780; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vzXXutq4wGalZELe39I44dxOL/4dV/vBf09UEOe1qt8=;
        b=p6SmC9628r4GXI4S0P3fcnpwAktErDXGrQYU/tfg7/sfN+6Q96Zl4XbPRWxKOKG7cC
         to9EQOeB62qhfmWLGC8jZA9+gQXJ2duyOxDCaS1Nfys1b0mlsff/9/pVHyw9D/UaGQ1/
         dwmHJuyvDEgfeiYRYFvX/FuPT/3boLbsuQl7DOxTLtPq6iT6BS5GhAbgayQqRG1LGH2U
         DNXA3jCwSPZGlkiJlKYHlTP73JwGJ0AgAWjPlnCgCRe+YlKRDhr0ej3sPtRwYS/YJylM
         mcBpiT/UhTdWypPVaqfz/H5QXnXWoLVnHX9wwINTVSjq+EmdCP/cWz05jere28QQDUuM
         AoSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746409980; x=1747014780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vzXXutq4wGalZELe39I44dxOL/4dV/vBf09UEOe1qt8=;
        b=CN0EpeVCxWFlil4KjLtIG//O7vIUo2Emr5BdnqIaUPrkSkSmm5g6CFzc5n6RMSuHan
         2TwZzoGcbRc/53dWDEXaelnTm0xeW0Q6S6WdMRDa/ZnSNwRfgwBfCr4gbhm+4E9pk/LB
         iET+OeEM7J3n7/KOY2Rcbxw6LzwSlyfNOJROineAgBgLXyJogh2quodjkCwKl4bicOVm
         A39EkHrJNF97adzKxolRkiK1M1fQxjXoqnnpEJ2meZZwzTDNJJmOCSz18QB4DDXjdOaf
         YNra6nXNE3NebWF/w8/2PoaXJ/2CaTH4RRtaiXAtBk12kha5rLZIBLo//QZt/gxy1xAF
         IZRw==
X-Forwarded-Encrypted: i=1; AJvYcCVGxc4ZCMgNhIYyiCnKzAi5Dw5O2lI5lwsMwuJu2eaqKlcYu4Qzr9/NMhSqdzsv1wY20iOIrx1EMxdgiw==@linaro.org
X-Gm-Message-State: AOJu0YyRrqX3LkGcvx8caIwPE9KPDfR81Plu/SJXh/JrejVPyUzzUMNk
	Urtw6efbN41DI9G5zqdtKAuPgSnVTMkJEc7vji+b/H1zDXBME5/C/N6DdC971CbDFQ==
X-Gm-Gg: ASbGncs6LAUfLRWJsXXKuB9R5pWeYECZdN/zHRJnaRyPCid3DmONkBVtOZcqy2siiPg
	LVwIwP6G/rTJAHr3DgNnReMC2riBpPqFDqgRKegOlDbpmfp5rqLzmye5z/YuLOUV4BDbLQgP9+z
	dxHEmIroY1PecnDDUBbfDblqwnDMVVDVe2mT8w5ljEjK1eamm7gkHYrYMQa4K2a5RQcSc4g5g/Y
	xO6MCJFhqrhvwDzjkbdIJ0+8rGdZ8dCP2+iTcRhctWEOamu+hplZIk8UqLR1oQGizXp4/QmpLzj
	vgXtmYfgDQLAm/KD4ewFKU78HyShBE2q0DTB2A3pCIS0wC2Pkxs=
X-Google-Smtp-Source: AGHT+IFgLeVwvQpFcZ2xjxjTrl7k3WOiNHp3SqAmhA94n1nQpI7p9dI1Ond7jrjd4FwoecItT43iAQ==
X-Received: by 2002:a05:6a21:6711:b0:203:9660:9e4a with SMTP id adf61e73a8af0-20ce04e6871mr18561298637.41.1746409980047;
        Sun, 04 May 2025 18:53:00 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3920074sm4462101a12.11.2025.05.04.18.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 18:52:59 -0700 (PDT)
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
Subject: [PATCH v5 34/48] target/arm/meson: accelerator files are not needed in user mode
Date: Sun,  4 May 2025 18:52:09 -0700
Message-ID: <20250505015223.3895275-35-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
References: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: UmIEKmgB2nqy

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/meson.build | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index 151184da71c..29a36fb3c5e 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -5,9 +5,6 @@ arm_ss.add(files(
 ))
 arm_ss.add(zlib)
 
-arm_ss.add(when: 'CONFIG_KVM', if_true: files('hyp_gdbstub.c', 'kvm.c'), if_false: files('kvm-stub.c'))
-arm_ss.add(when: 'CONFIG_HVF', if_true: files('hyp_gdbstub.c'))
-
 arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
   'cpu64.c',
   'gdbstub64.c'))
@@ -18,6 +15,8 @@ arm_system_ss.add(files(
   'arm-qmp-cmds.c',
   'machine.c',
 ))
+arm_system_ss.add(when: 'CONFIG_KVM', if_true: files('hyp_gdbstub.c', 'kvm.c'), if_false: files('kvm-stub.c'))
+arm_system_ss.add(when: 'CONFIG_HVF', if_true: files('hyp_gdbstub.c'))
 
 arm_user_ss = ss.source_set()
 arm_user_ss.add(files('cpu.c'))
-- 
2.47.2
