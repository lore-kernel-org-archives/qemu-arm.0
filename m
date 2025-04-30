Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp1004603njm;
        Wed, 30 Apr 2025 07:59:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXGVHgh2u541B3TLrXwlZo62+2IMAVm3IbOP73tXQDBBt/l7ioulxy4/IvRD+9LVKpuJRDxkAZT9KPA+g==@linaro.org
X-Received: by 2002:a17:90b:17d0:b0:2ea:3f34:f18f with SMTP id 98e67ed59e1d1-30a33300da6mr4566772a91.19.1746025141650;
        Wed, 30 Apr 2025 07:59:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746025141; cv=none;
        d=google.com; s=arc-20240605;
        b=iVgm2S+jL+2umFo28uuJIo0FiJOzFiEK1O93308ru5+22yfKX+bX0CnagJDYBu9QsU
         zIFXwwGO+MCUtfsgEo8Ev7kMwFSPm1N2RBgSUAJCbrT9lZxGQtHyXKExPCw5hv8vhaYH
         g0BB+cKGj7p5uQo/ML0kx0KW9tPkNwJsshK1AzD+cBmdjFwyRYoqEA2sItNtnYKBA3JZ
         cTP3hxNopQYYkG77r5BRGSPJXX9yn9DWcfNQzgyk+NuyBask7xjVIA8jkwvEEiS/VenO
         mI6UmSHB0QprkeoS4ojJySiw52M2rp6tPr21/UPW3pNf2JYzoDUGCxlPyNZXXA9lfJq/
         YFeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ihSbjG4MVG/rPWJxnirZVcYWQR5uI9SkbcEMwpHCSZo=;
        fh=eK5Gxiobmrb6I9+Y/OAOKW+kGni+W+bAGd5ZCjizgvc=;
        b=evS8q2ta/qDG08ezNO14TDI+UjeC1WvhOnpbmCS3iRBt4Qj4EcK/PYuU/+jjpBEKRq
         96KwXcQw16eDt5Du54Pa9+ZNod/0/PcsHT9uOJjzKGoRS3qaoFdiZdDB3oPwBKR/ZPwu
         SS/jDuZaCX0CblVXMYJbkVpwW9aUEzGR//X0ems2SjmuTc57SkV2oD/J0jvg+zzp3IKx
         1QlG3zYz8wJA7bk+Y5OJkiAFmodmYihgaMfyZO3i8BHG1kpKl/IaUXy6MVsOKEwB1UFG
         tqUAEUtIfG74eabxjADJx7arBfgqdzi87VoKGbtvuuzQ1/Zkq0w8gIQcHiAn00EXNHEM
         SeqQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=msFfItRT;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-309ee83fcd1sor9100532a91.6.2025.04.30.07.59.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 30 Apr 2025 07:59:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=msFfItRT;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746025141; x=1746629941; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihSbjG4MVG/rPWJxnirZVcYWQR5uI9SkbcEMwpHCSZo=;
        b=msFfItRTqvdSKU5K7rjR5LZdjvOohReSTTpXHOiN2u1g+1xkrYbpz5W50ZQV2E3TAO
         U6tqL1xjkEcdkfCztMli7mw2jlxq8cBRaXQv5UrGYBw9qoLIoGIrJqUTwF6FTBWpagKx
         wa5wBfA3F77sPZUmDzwKv06nGXda6VT72iyZ79BJ1pDKejcljTGPJZ2ZFZgaCYOs6TAQ
         Q/0tGBM5SfMBQAvdnb5v6eYtDbuvSjAcioQ5EFGNuPnY2+Ik2sSnA0LyRnF3Vplotscn
         EIyhAhJ2ubtGzFzq2XoWaLdYUwmrrwIexi7NwCLADxA8FQP/EgeQfMUOt6sZvRnnfPNy
         Aedg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746025141; x=1746629941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ihSbjG4MVG/rPWJxnirZVcYWQR5uI9SkbcEMwpHCSZo=;
        b=H9XFio3UVDiKdWdfNutZeSA6jiWq/+kXRawl+/YmEhg2yzBrti/qFlbITN96qP4QIL
         Bzf3hKHwZMs5tHoWzcT3ty9e2OU0V6WGPhX/46cMrAnJ149/i35J/1NPuF4FmF5NyELu
         /PyCMLg7KO27WI5elSbmDMKZ/EUQJEqVzEo4PbyB8oP8ibg6JgpUmE+LZzgRohuUmaev
         WrFsIuXQazYaN8QnURnRki/WEBQjVNWJwS4WqEbGqJITV7h0yVzhrKpFewGRUhzO6nyb
         SjFse1Xs+Oyun9GfKnPGfar3cUFkdrPLTafTL0GGJn3TmfgJN56a9W+eqCsJtbHAZpN+
         uy7g==
X-Forwarded-Encrypted: i=1; AJvYcCXs6Kaq9pr65g0TTZXzBC3yQ6KNdM5Zg8i/mFeZpPs4mc20i+NxMq1na4dHklkZ8EDR5CyVuZEClSI7Tw==@linaro.org
X-Gm-Message-State: AOJu0YwSLYRR+uxZn6vaejiNjruS7DaVK+TPY3QfzakQu9NDLrEz0v/x
	LUO9Aj16je6kNvQ1EM+qlPCSF+nxL4QHBK7WCRyN+VuFUh429pwX0SEdpHs6lSXHYA==
X-Gm-Gg: ASbGncvrxrNf95XSQYIKSZNewTN0Hu+Ga5PFjVlToz0XPDpddWMSOJAaJj9JE3O5ykQ
	z3v3rAKm3/7ajWqWyb9cnnoRamVwBtvquCoIrL1YG453Hdq6lWhtv3n8KzGG/LLzf5Z7yyWnp7h
	CJBYyLT3EqnedxlCOZjzM81vlZ7Zyk4uMS2ZJxvMCC6ibbKj15RK87r8rzRsNYcXsWKkqEoWcs3
	8lbaor8NcRJloaoZ1wkPAWtW1LXYXlSYg6inN2m3eksncEdBvFlM5/NazHduH4xz4QNbsAcrtvI
	2B4SGjE+nthVLcDST/Z7U/e27XAHn3C1b78x8pwO
X-Google-Smtp-Source: AGHT+IGA9pNdoHeLJn92OPL0IB6b00oQl3HQsDFWbKDFlsnsZMi2Ohq9Db4ZFbtPnsSb3wjiFMJj+w==
X-Received: by 2002:a17:90a:c2cd:b0:2f1:2fa5:1924 with SMTP id 98e67ed59e1d1-30a33351198mr4339010a91.26.1746025141034;
        Wed, 30 Apr 2025 07:59:01 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a34a5bd78sm1705652a91.42.2025.04.30.07.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 07:59:00 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	alex.bennee@linaro.org,
	richard.henderson@linaro.org,
	anjo@rev.ng,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 12/12] target/arm/cpu32-stubs.c: compile file twice (user, system)
Date: Wed, 30 Apr 2025 07:58:37 -0700
Message-ID: <20250430145838.1790471-13-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250430145838.1790471-1-pierrick.bouvier@linaro.org>
References: <20250430145838.1790471-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: D15GAIgncvxh

It could be squashed with commit introducing it, but I would prefer to
introduce target/arm/cpu.c first.

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
