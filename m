Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp94928njb;
        Wed, 7 May 2025 16:44:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUF+IZLQNJv9SToLy+SUclmxT1aTHgOfV8GWh/aV2GzWdspv1lAFwGow7zWuHERfNA2NhxPDKSiMGWnXQ==@linaro.org
X-Received: by 2002:a17:902:f543:b0:216:2bd7:1c2f with SMTP id d9443c01a7336-22e85be8904mr13331595ad.18.1746661392865;
        Wed, 07 May 2025 16:43:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746661392; cv=none;
        d=google.com; s=arc-20240605;
        b=PPUkuuLONf5WdcOKwkb8td6dtKmf4MNYyhMAUue+bQqIhlXm9dSrchfuWn1vUZU9pq
         MwK0kPcfoLipbGc8IXT0CagUc57uJ2d+fpJroh0hYQOmhDgpS0v90FHDMLjiG/ZTTOub
         5BYBLy81Jj1v4dSbMHkiwdx0v5JZtX3/JYSMpt1yDyCIqdJQO8boq6KE64dno8X9IAT6
         qwFwzxq2Jh5DWCAlalVvTC19kD//n6IS5CD9lq5OlmWliS+FdfYFzLiNQ9GqGJfvQ+C2
         +j5FbdgTDTqLYvsmyV817yJHT6G77mZuenjd5TIxPSTVU73glC0Hb6hGz9h4xdksfXhV
         PkmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=rXLXuVNGEyfjK9Yd01QUJZvt/uyYRhxbr8cOAxNhYLE=;
        fh=W2Nb9oAEDzfMVuS405Eb0ZwL/BYGi+oKixvR6KlEEFc=;
        b=fu78vwdPNsnxaVm6L/H7zOsBlJsTeDTUXzQcTDP69/bJWgg+RzCBOWpZ5NsP9ohzFa
         Sjpv/jRnHDbC/4TLr2EVy5P8kkImfN+rHRcyjeqXIXLzFnsnV4buuKuHX+uIXVCuCun0
         LjNT+G2aQ4vXAC2MA1O6yUuEZ8DLHSZhO/4/oKBVkoS7Hk8aujQeXOeP31NZ73s/h4Dd
         NdBcmXU80Hs2Kwmw40VRJgDAdcyzRySAd2H1IHZBUzOEYRjFwCRZA5Z1KgJx8Cg34NU5
         ibT3dW693rFfqHfkPDmOIb1XqOc89SYYP6Oyq4kLRTahBMZ1o/Xp1xZOJIOzx8gJn4Kg
         KBKg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lLRbv7NC;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bb27ba3sor102921075ad.8.2025.05.07.16.43.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 07 May 2025 16:43:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lLRbv7NC;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746661392; x=1747266192; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rXLXuVNGEyfjK9Yd01QUJZvt/uyYRhxbr8cOAxNhYLE=;
        b=lLRbv7NCuMU2gPVzVNzC+wmgHwV3Iel7g5t8vYJBP2TR7herirxL5fR7ra3YOUKBT3
         XrXjN1qGnPvjD2lXHT0jeFj3rf3mREILtTJN/JzQsifJYvKuwCdYM2wS/XWwIb+eoVwh
         ripB3ilFAPj3R2m6BBBC6o9y4MIJ0EOXzPy6Ot/pKCKt4pDIYQUf8ilWmReOJiKyUqVx
         tuqgUCj2L2qXMam6Wh/ZvLQK2qCg1oOHvem7gi/T+eDNXfp4kop9nAkZU+VIRifA7UxF
         dqE7IjFGfUevFIqJpPgo2yNUhOTECbaDVLYK3Ke5BqsgObDFBQXvmvUZ9DmaII/apC9i
         MtnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746661392; x=1747266192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rXLXuVNGEyfjK9Yd01QUJZvt/uyYRhxbr8cOAxNhYLE=;
        b=umc7ifOxfEuSiBd3tZUSxEW28QLqcb/moLa9kPCVxkevdEM6nrwRXY6giZz3AsPoER
         Xw7vrIaOXw4GEPp7aNMza8eNx3j8JXkgBacI+DOkQPJGEi1hDhq63JgoM3HgM02eWjkI
         PFhMWMtHzwlkCewvpWwDtsevi7I0Ya4WaMdepPnuIznvdpl7bYksF4OFWrGSN2rTKYSd
         X+DFghrZTTaK6UDrjPHOBWbcU0XiidAJ5Hd2XaTaSiBLIKqsrD5pXG7/WdQcRiAB/U6W
         qWNpbfLbyE3qRbTcjjrrDh5ugxvgaLHoOU4lGXmIZX9BNpRfNdj8HyAaUIQPTJMmpBo+
         D/cg==
X-Forwarded-Encrypted: i=1; AJvYcCVOsi67EgOSQwKn6QRUQNgbWQoPysQYTWXk6xuDjAviowxpP5Bb8KlN/T9QDbecdffv532ZIpDbldMgrA==@linaro.org
X-Gm-Message-State: AOJu0Yy7npUO0jGyXhXp1Gf+gy9l1RoVrtf0LcnWwI68qrUPZQiQomjs
	v9fWYZ2a9iThdxQL3XRAamCFipcEDWK1/SHL85cv8O+8AqvezwkZAW81ygVeCNmDqQ==
X-Gm-Gg: ASbGncuniEyCdDTxcdI1IiBvWLzADmGNmQkSzs5dgN7vWeslUfnoJQMdC07PWRv+rN2
	sfF0aBo8u8ug/47eQ181ePSWh57SRoNxmfKa9W1GzZrv4msNlnMuUQtp1jvSEFqP+jBDozQl7ME
	0BJP2eFFBDTQtjfUIJ9STM05wHd1B3Gus6y78HcCy60GMYFj0vWKslauNuZdKIiOPMUYy6O4RJS
	5Rvc8D0330B+sBMUcEW70dmjlg/Kmi1+VYSmVlNIwNy8IW2Mrt08CfYuk5h6H5GTJ9VmqhzeJqV
	i8YUILQTryUDYoXPyKg/5aAK8DOFqoden2RaCWJN
X-Google-Smtp-Source: AGHT+IGl8QMLkXX0N5h5JsKWC5nqHNtFaM2hyM/uoczjU3eRHoUb/MaTp4KT615HMMrJAssEpmZ66w==
X-Received: by 2002:a17:902:cf0c:b0:224:a74:28d2 with SMTP id d9443c01a7336-22e860ccf77mr15541875ad.26.1746661392516;
        Wed, 07 May 2025 16:43:12 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e815806fdsm6491325ad.17.2025.05.07.16.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 16:43:12 -0700 (PDT)
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
Subject: [PATCH v7 34/49] target/arm/kvm-stub: compile file once (system)
Date: Wed,  7 May 2025 16:42:25 -0700
Message-ID: <20250507234241.957746-35-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
References: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: a99C37aeoZS2

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
