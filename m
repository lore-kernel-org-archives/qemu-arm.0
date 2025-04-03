Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp4184885njd;
        Thu, 3 Apr 2025 08:18:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU9flmYdzVqsMJgl4cTOkcZI4BuJYFvbF1bZiNgcIZNTFaJlsclrHj+sqV3AOf7c2w2nJ4XsPz8+YDUTA==@linaro.org
X-Received: by 2002:a05:600c:6d45:b0:43c:e70d:4504 with SMTP id 5b1f17b1804b1-43eb63d417dmr47747945e9.19.1743693519850;
        Thu, 03 Apr 2025 08:18:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743693519; cv=none;
        d=google.com; s=arc-20240605;
        b=f83Ot/HjhVLvNR/rBl5U5zBp63viZsjiccVQ6dm6iKh/YjMX9oj3JSGgPPkyVgYGlT
         MS2Tc0qVht9OjO55Ukg0eo1phuSTtmoxxSO9l/D5QsjFV47AJ7qNcY7Fjtr4AefwrkFF
         z3tRdl7H/+WaSc7dmR6Ng/7LTdOcM+g1qNqePp1yK15KAhJLxCaXLGqoN/v02MVlFzOz
         vQNYpxlgXzHwYDntROqZsmFs4LAcopW+3Lx3Th3BJq777IUUlSRrpnMgAKKVHGwqaU9q
         qcfYnnEKeBLj8SkLCo6ijIe7gz/amOIUF95Gf1CLjkOhoLn27eaz1v8KmHbZdkOSXhPd
         26rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Fuei3baK1sdFDft7gXrQyidqUa02cv4ewmtE/kL3GxQ=;
        fh=QQ7uvn/wJuUu7AVT2cNoJR4aKRxzRtJf7zmF1NfJMhw=;
        b=IZqAhvt1F8qC7Fa2tmDdIwbY8dgn1hrgfTu9ySijcGJOrfeUascPXF8WXaFX3yReI0
         veJmHP0adRqTu6/F8hOBYAkI1VChxw37FaX11UZzVAiYI8tGvwbVqz+LDrz2v+eaXMvI
         vndX0uTOTCfXhdhNqD5Y9/dXmdLxBoMtBh/NfdwcMncqtDka0mh1h6VXnvd7RxyFt7gl
         JBFJ6MPOUozroEOMJCZphb/mv8jD1QEftKNgb6hyYb39oqaZtPMilu+6btsQ0X6EztbD
         AIeCU4nCzqt+BjECzK2G5VWcirnuk3x01AHKPzNDsIjS/aG1TrDOwV71XD5ggMhhhnea
         O52w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WNfAF4LG;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43ec2504df0sor7617715e9.0.2025.04.03.08.18.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 03 Apr 2025 08:18:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WNfAF4LG;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743693519; x=1744298319; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fuei3baK1sdFDft7gXrQyidqUa02cv4ewmtE/kL3GxQ=;
        b=WNfAF4LGpqLu7TXM5c2+ltCfVoAhoRlK5s9PQr57SfRSBC8eo7a9GMYxmaHoFG8HKa
         3BZ7sB8gkGSpL+cWRszcOPLA/YauUey6smWflel3uwcwQLzal4MpDicp+gANNPPTMwhX
         jus/MPfSqNvh6WRIoDZGMvB0hqhrYZUrY19TIib2DxVePaHU3HGetS6kqNADI83hcwtx
         MSaCq+BfZ8B/gxI+obVphJy0UgLUUHqI/hZRKBvyjMDgp0HQK5cgOgwF7BTNDwVf4sNe
         wI4p++wzcRwtgrDrH5R4IlHNOznkzstYQerNh/BhbZPEhBOPIOlfI/9tW24t4PWJn13g
         dVyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743693519; x=1744298319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fuei3baK1sdFDft7gXrQyidqUa02cv4ewmtE/kL3GxQ=;
        b=kUORYcAnfVZEDQ1u8RQ9I+Ml9ssdg0yZHUwIIpwWSEkIDDPzpRq1DFxW2DS5tSTu1w
         1RdkQMoxRBfrKFP5+glH4dRN+YT1vt8avVfeXWGFH+n/pn3xUwblD0O0iciCX3n23WO9
         Dgx9ipjRgqB5SlCe+Ur6/aagJIYNs+XU5rZd/vO64OKenav3hspJR2wXOPdvobsc7jUm
         fGp4YOofLglP2MZxwfne8d/CgMkHg6KSJPbIMEvJ6GvsNMSi1SMjLEpcOZKqUmrsQH9z
         YXHUm/dX3vlKZuKYUhENx0CBPd4MsuyhhZjRoeYWfiFeB9o22nyOGOTezjLpmzyFV3Kl
         peug==
X-Forwarded-Encrypted: i=1; AJvYcCXEmSw8X+erTWoAF4agxZ6z+lS/DwIWu5yan0u1/4cPfEnzKDu2xfLE5Lo3kgnWX6FLU0zSe9ohhF3EfA==@linaro.org
X-Gm-Message-State: AOJu0Yzt3xhkTBk6dMtHj6670g+fUtTICxFQJjUI3lr239EZQpAsuY0I
	K+yBLUbYnx8zGh0p6I24AR5K0GaxNYywrv+s8UdCeS35fkTZFhhTtxbU/ntHCCwbdw==
X-Gm-Gg: ASbGncvUFFdKk0gTuvU/Paet7HXb+V9bu3+wxZ86wHTQJ7L+/Z5k/7doB0UJbt69GxM
	JVKRV/gf/qaKPKvhJ3hy5w9ure26a4bCVjRrdo0ANJvU/dKrZou3A9UCH91DVAyPabGIsBKibeL
	OIfL1hwEGOSIivHqllGT9o9FCzxnrw4nj43eeAoaUqWC3VHOWURwy97y25DyymXcOqnwEFewE4R
	LJ1O8UJWCOxuUpermDGyjQGWu/3pqivxBHHjOGpBLLCq6GHZ2T63/N//ANR7OtLT232LKJH9tUm
	X/dD6SCZ017xJFZp/f2oEfnMe9LYpd4TYl4m+l+zf/RkDc1VXEoz/vMtzTIAm/lEoVos1C6ATIc
	lW+Rqn+d5sW27zwEAz9ZECRZ3yataQg==
X-Google-Smtp-Source: AGHT+IEnm1d5jqQclVVh0+L43ZL/ydHkKrGZBsMRZ386WjgQW7Nmg/Rga4Nq4MA7R+Vd0OPKzFvQ9Q==
X-Received: by 2002:a05:600c:8707:b0:43c:fe15:41d4 with SMTP id 5b1f17b1804b1-43eb5c2167bmr71212425e9.18.1743693519299;
        Thu, 03 Apr 2025 08:18:39 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (145.171.88.92.rev.sfr.net. [92.88.171.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1660bcesm24437595e9.10.2025.04.03.08.18.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 03 Apr 2025 08:18:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Gustavo Romero <gustavo.romero@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>,
	Ani Sinha <anisinha@redhat.com>,
	Udo Steinberg <udo@hypervisor.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Fabiano Rosas <farosas@suse.de>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH-for-10.0 v2 01/14] tests/functional/test_aarch64_rme_virt: fix sporadic failure
Date: Thu,  3 Apr 2025 17:18:16 +0200
Message-ID: <20250403151829.44858-2-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250403151829.44858-1-philmd@linaro.org>
References: <20250403151829.44858-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: f+/xeURoQblH

From: Pierrick Bouvier <pierrick.bouvier@linaro.org>

This test was randomly failing on our CI, and on dev machines,
especially with QEMU debug builds.

From the information collected, it's related to an implementation choice
in edk2 QEMU virt support. The workaround is to disable KASLR, to avoid
accessing protected memory.
Note: this is *not* needed for the similar test_aarch64_rme_sbsaref.

More information is available on the associated GitLab issue.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2823
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <20250328183816.2687925-1-pierrick.bouvier@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/functional/test_aarch64_rme_virt.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/functional/test_aarch64_rme_virt.py b/tests/functional/test_aarch64_rme_virt.py
index f4ad4d33d58..a1abf584f0e 100755
--- a/tests/functional/test_aarch64_rme_virt.py
+++ b/tests/functional/test_aarch64_rme_virt.py
@@ -87,7 +87,9 @@ def test_aarch64_rme_virt(self):
         self.vm.add_args('-fsdev', f'local,security_model=none,path={rme_stack},id=shr0')
         self.vm.add_args('-device', 'virtio-net-pci,netdev=net0')
         self.vm.add_args('-netdev', 'user,id=net0')
-        self.vm.add_args('-append', 'root=/dev/vda')
+        # We need to add nokaslr to avoid triggering this sporadic bug:
+        # https://gitlab.com/qemu-project/qemu/-/issues/2823
+        self.vm.add_args('-append', 'root=/dev/vda nokaslr')
 
         self.vm.launch()
         # Wait for host VM boot to complete.
-- 
2.47.1
