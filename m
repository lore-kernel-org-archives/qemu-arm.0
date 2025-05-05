Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2178904njj;
        Sun, 4 May 2025 18:53:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWUl8zH83Hc0aQDKEoboX8BpN6NiVRTUli9G7oPaF0Nj4J/8Qz5BS/LBR/hUna6/qPSwwtljknNIaMbBQ==@linaro.org
X-Received: by 2002:a05:6a00:414c:b0:732:2923:b70f with SMTP id d2e1a72fcca58-7406f0df35amr8105753b3a.11.1746409981317;
        Sun, 04 May 2025 18:53:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746409981; cv=none;
        d=google.com; s=arc-20240605;
        b=NEAWjYOCVS2HyIJdx1YZYSCBvLpdOHBdstjTe3GcByOcQUGi+vGCsrNFspS5l84AXB
         FrYFd1huW1DOzwUHClcUyWZKCw1Q6l4XVoKEj0LVVUimT4dhzYQQw6ReKz1sKlK4avFV
         84cQosRRbxBQ3arz9ISeK4to6PI+g0N5jbm57P8DclD6eC2svsHwSmdM2JNxryT2eUGf
         RwFPpLFh1ADY1T6hpvDpl7a2co7CSj0gZxQNtGXQrGkGBW1oOaN8kScA1+C7XMPvWfC8
         QsDrNC4ibxjbxeBYJj/A9xYmYBhPRwjzbmPpC6YLwD7GLh7J08eIt2a5v1Qn7aVnGBJm
         pwRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=rXLXuVNGEyfjK9Yd01QUJZvt/uyYRhxbr8cOAxNhYLE=;
        fh=mak+NhgV3USoM+7eOS/w+hEkMybKoRK9zeYwGMTrisM=;
        b=e8w2uB1ks2CfuQ30YIdVV4dP/cZkxns2fj3E5kqAtUNJkx+vpqoGWJvxIubWQx17qh
         Ye0YrOKq2usEWajx1qPGkw+M/HiIBWg3NaF/mPVqEWKGS2U369J/uLrmFdFKxeD14SWL
         zxvC9iXCx66jZ3e+oWFUUw7eP3m9V98qSXjPgqz6qlq7YH+xsBn9+SYCGMGnEdVTxxHj
         4oqHxbmTjFuXM8W0u6QSmloIgytyd68IAeGBgohzN/SDaIhID3uG2HwITzrIrgK/kGD1
         nW34Uaw9c7q/oYKNmeq1RAOp29jyyp3b4O7nvWgh9Kk7dvQ5uW28nG+rIh4WYXmxLvUu
         gH6Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EnEXDPPY;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404f7ba0fasor3706639b3a.5.2025.05.04.18.53.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 04 May 2025 18:53:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EnEXDPPY;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746409981; x=1747014781; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rXLXuVNGEyfjK9Yd01QUJZvt/uyYRhxbr8cOAxNhYLE=;
        b=EnEXDPPYfWtB2fBsYYyMBXf1E+ztvn4DJ4HFwuGz+srnoSepgONugeRUkMiNMXeWSN
         aWlWCGM1esiyuoMJ5uIBL4e8ePBm81jLMOH/durgoVbHLskA017emwJKOkcKcxpagddz
         eo2s45y2La5HO3osBrVQDp5HzFmfQhXrcYi19ZIJLIxoOs5Rj2xY6/jlvK6i5sI8ZNYl
         qyEZPb7miwFATHeOQHRfdNVyTcWSObGeKQeLGCTeBWkjS+8GOb98W0veYadCUcq2JxUq
         46Fe0+H1i43/D0r8E4bU16DcdihUO6G1AeTuZt3DbUFhXZ1z/6p57HkmROjtO/1cMa9v
         1vSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746409981; x=1747014781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rXLXuVNGEyfjK9Yd01QUJZvt/uyYRhxbr8cOAxNhYLE=;
        b=btX/9zdl24c3kLkKTpuc1ufC7+LUXgh5oQeObgSpKLPzfqamNRoggx9c7hUcO2Nupe
         K/uTsDqTE10objaomyJ9Kmd3PC2jVGYwCYGCQaBoz+XxeBAZ2QLrvZG32gCn7eKkrcBp
         XqgfFqXdGZZbLpRFPZAmY6nZl4kPSV932OF4xp+MHN6WfZUSQKFRvTZyWiMIuoNRvf/0
         cwfwYinW9ejIN/QPtp/leDGRGy6eyBFjT7P6Sy1MdRT373+nUOVw0cOKcnKq3VVSEG41
         y0Kmh6oNR/KZG8H3NQoYcZWKcQzBiz8mNzoHzvUDYinlRS78XXKrIttyHAowvN20DDig
         Xgeg==
X-Forwarded-Encrypted: i=1; AJvYcCU8miOZaWdxHyIaKPGBo9VWXxW8rEDzJPLYQXNAsJ6fHHUpUcme6+8g9zn2aTSd4AAv3HtMUW/ewbbbDA==@linaro.org
X-Gm-Message-State: AOJu0YwmLQBUcE39JuUBK+K9smJ2JA4EZXEJmD0CCgbyHrWkd04SYI4K
	A7pcHtVIKjDXlPdWpv2I5NKc24X6Iykbl1pCvnOFRoO6vlijNNkd6OW/PMSvzlnKwQ==
X-Gm-Gg: ASbGncsbnJblb5OLEq8QoCXskN+c3OFbg7Unwi6n1hK8EF6yCusmpQjacfs+TLVN1bD
	se+QUZSMWoFjAyIuFc42J3bYaTi399GF8s4wf/Ve3RwtD2mcACbOKmwxBiV3UPF2Z+6LuHlafSu
	JXcG/z64K2T+muyQL8sV01JS4HSgNv0TzjiilVSYvbuIMWi1zfiaX+URKRG8lBPYvsnVIL3yvIy
	NMsjywfNzT2uD8kl4EQZClHncwnQR0kgQ+Cb/3FO+T1LCBbdG317byXwDdU0Xhk0y06g/ACVEq5
	6KOr3ktatVNztLAff91XeR0CBD5kEpqLbD1xqijX
X-Google-Smtp-Source: AGHT+IHfI0k8vkxFfPNj2aCSH0PSyH++uXGXhOEGH/b7PGVfp4DeG6fFush3rZ7gI58mdIV36AorCw==
X-Received: by 2002:a05:6a00:4c0e:b0:739:50c0:b3fe with SMTP id d2e1a72fcca58-7406f0b0434mr9256730b3a.8.1746409980959;
        Sun, 04 May 2025 18:53:00 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3920074sm4462101a12.11.2025.05.04.18.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 18:53:00 -0700 (PDT)
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
Subject: [PATCH v5 35/48] target/arm/kvm-stub: compile file once (system)
Date: Sun,  4 May 2025 18:52:10 -0700
Message-ID: <20250505015223.3895275-36-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
References: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: BCTzLPFrEvcX

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/meson.build | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index 29a36fb3c5e..bb1c09676d5 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -15,7 +15,7 @@ arm_system_ss.add(files(
   'arm-qmp-cmds.c',
   'machine.c',
 ))
-arm_system_ss.add(when: 'CONFIG_KVM', if_true: files('hyp_gdbstub.c', 'kvm.c'), if_false: files('kvm-stub.c'))
+arm_system_ss.add(when: 'CONFIG_KVM', if_true: files('hyp_gdbstub.c', 'kvm.c'))
 arm_system_ss.add(when: 'CONFIG_HVF', if_true: files('hyp_gdbstub.c'))
 
 arm_user_ss = ss.source_set()
@@ -32,6 +32,7 @@ arm_user_ss.add(files(
 arm_common_system_ss.add(files('cpu.c'), capstone)
 arm_common_system_ss.add(when: 'TARGET_AARCH64', if_false: files(
   'cpu32-stubs.c'))
+arm_common_system_ss.add(when: 'CONFIG_KVM', if_false: files('kvm-stub.c'))
 arm_common_system_ss.add(files(
   'arch_dump.c',
   'arm-powerctl.c',
-- 
2.47.2
