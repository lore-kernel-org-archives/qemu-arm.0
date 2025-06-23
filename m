Received: by 2002:a05:7301:19ab:b0:175:694b:cb76 with SMTP id mc43csp2510284dyb;
        Mon, 23 Jun 2025 05:20:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX9P4vpbtHfiApizxHUqeWkHNUAQhXh+oFBV9v7Nfn+Zhocq5NXbGMu6H7CwSjdYJMc76VzSyA/Wn6qPg==@linaro.org
X-Received: by 2002:a05:600c:1ca9:b0:43d:aed:f7d0 with SMTP id 5b1f17b1804b1-453659d4325mr95110855e9.28.1750681245662;
        Mon, 23 Jun 2025 05:20:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750681245; cv=none;
        d=google.com; s=arc-20240605;
        b=X8s66BxmDjIFL8mbB/rzUJ52wGFzv3DyO+qwxgdfzEBEAj8WehmHHSVQSuqZIO9wh3
         zKH96pDrEvO06fq9nxRxml7Vdss2x0ibrYEmEYsuQqsthxwEMAtTBVfOIk3vQWZ3u2n1
         rlCpAdkiAJAOEjnc1/AM6LwGApqCw3LPdXI8FPq+j/FbGTZfMKorBPEEIEVmXrI2Vf/8
         cF2qVuBsNefXI/f63t5nBcb180xQhePtAdETeiWLWQJCMdM5iHtjdvtb8oaQZaiL7An/
         87GTkmvLh7RNOquwLStyJfbCSaAN6wm1Wi9MlwlQDa6FNIkBDWKmuqSYjeUVhcd4Bm5z
         5wNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Y66de3esKoxe7Lq7nXgyyvCOXzL/4wNdUP/QM7Hg6f4=;
        fh=0j4/RbUp5RJMWcHFsieON+6Pj5VrPZgg27fVN3iEYWc=;
        b=LjcKv75fAvuA8rcXTH2MPPkTHOeI5SifgVTqUiIz4PUKb53qAAY4ZX1/RySBmWJndh
         FDcXYcKJcVO1CdqJ1s0GSJv0Z0VRQeZdbY7CmJG5XiF54eB5ymdTx/uAEGQDVQHb9hqs
         UAzAZngn9LY8zCQbUiK22bblYBgj/KZMmHWWMFRKjJJT/8QPtcGUuZ8TgNLIg8H72ux3
         7hV0Ifkj/HWhUzrqYQfbb+MeFIPrSkohvYpE6d9tjK2U4vQUXdqu9c+uDDL32O7BVGQt
         3TrSH3PeTsDiFbvY8WmSa28HpH87UbXr8ftiHlgCSw3tQT7cy7gVFK9PQpTYOMdKOmuz
         j50A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Eutqj8Gk;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-45364708157sor25201405e9.10.2025.06.23.05.20.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 23 Jun 2025 05:20:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Eutqj8Gk;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750681245; x=1751286045; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y66de3esKoxe7Lq7nXgyyvCOXzL/4wNdUP/QM7Hg6f4=;
        b=Eutqj8GkYCr+e6pxS+dXL3/bcpILE+2iaL+o6yNWLGcsz54WAVXZAxriE5j7UfnK2h
         0Bzk1TCj4MK2u6ghjvRdC5+zcIQkL7fRHWkM0RyWev/NIcAK7jkaHrpcFY4Bt1O45jm7
         bjIJ3U//rXOfSPfkzhUlF6lfFPPFv3KRsTFa7V9GEbIFRkpps6u/AA1kLuDzMBaD7xhw
         TX2QqOyORdkbbge/CuCv3MBQBHXMLwcyn4/I4gxbkaWa5SXwBxHvu99u+1tYw4Jy64LM
         gYB1LOrexotrZn5VEXyrN6cuj6hDzj8EosgI0RVq7Xk6tJGvmLyxrnHq0Zj1jAmXjYhO
         aanA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750681245; x=1751286045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y66de3esKoxe7Lq7nXgyyvCOXzL/4wNdUP/QM7Hg6f4=;
        b=XGpg2BUNpjLz5INAzU8yzhafduLEhCseXp2z5IbOMUroQtN122B4SHkpCJG3aVZF61
         LjyWKgBykd9Whn3m6HUTxAZ0x89ooTyQqWTRe27tshz6dTAl27Zw9+H4RsoiV4eo+ECI
         WNNyWvovVysiNrWJJFsjdd4+0HxHdfyOjDDwCzP/M2iDSizqTv0nQk8pbdoxdUNEz2Fp
         wevmrZCGYVcZ2uoqH0QHPFp8Cy/Rt7diURai4PsuqErgTNWFL/RSMG9HY8rddTTDqQne
         OSMTrkOjHbsT6Eu6ZEiwskYRMtkeTfku1DMgShCbER6KK4/amVotRPbyoCISwBnWXOFD
         oEIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIv32mcdJhbhHucs5xywy5u5SUzdx5U0gcTerZk+lBAZXYTR5mft5vsgJZMF2I1UE/y/+VJRPj8JwlJQ==@linaro.org
X-Gm-Message-State: AOJu0Yzwvd5E3VGfukP07yBsQ2G7Y82zWSZdnBNQ81ime+EGD9xVuZDZ
	oSf0nR28K0S1ULzTq3eckEaCpkKibpB8wCtSBpIeC8OUPkchn+35EDasaqyna7iNohTOQg==
X-Gm-Gg: ASbGncsdGUJpd1sqXOe75xLjYswhU8QVpDmXr+KEGVXWbw3PEz3UZQOKEifuomIKJci
	5jHrAirnOnwPkIglZxj4BiZEY1EPDTno+dUpnJtkpXgZaBWacx+9SvKUmP0yaVMZ2IFk5RCGjnM
	hSB5tdYGCKi/85RUu3nkfYwngERn6Vx2n7v/jxfQ/dRAHZ5W1nXvH26pu+DTRRXTNmC0fOzecHj
	IK1+UOx32ryHKIBLUyX/mTHZpld/SQVaOCll0eJr0ag30nYHp240kxwriz8sJ+VVrzUXsjXNLPw
	CNKoIXHjNdg8NQjuq4kCKSBEA08ozrRUWYQJOcury1vaeEggOlXnnh2Jvrd6KoWfQ8XG8ldPEZW
	Zr6p37dDF6XHU26Pmp9+aWnELDyt5/1V9dGf6
X-Google-Smtp-Source: AGHT+IEID5av1fp7z71GMDcrtgYTt/iBmDplBK/iwcImMCZA+DLu+Yd9shEYZ/xuGkpZgY5IEvOhLw==
X-Received: by 2002:a05:600c:c1c8:20b0:450:d3b9:4ba2 with SMTP id 5b1f17b1804b1-453659d4330mr62504005e9.24.1750681245056;
        Mon, 23 Jun 2025 05:20:45 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d117c0fcsm9565403f8f.62.2025.06.23.05.20.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Jun 2025 05:20:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alexander Graf <agraf@csgraf.de>,
	Bernhard Beschow <shentey@gmail.com>,
	John Snow <jsnow@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	kvm@vger.kernel.org,
	Eric Auger <eric.auger@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Cameron Esfahani <dirty@apple.com>,
	Cleber Rosa <crosa@redhat.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Phil Dennis-Jordan <phil@philjordan.eu>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 23/26] tests/functional: Restrict nested Aarch64 Xen test to TCG
Date: Mon, 23 Jun 2025 14:18:42 +0200
Message-ID: <20250623121845.7214-24-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623121845.7214-1-philmd@linaro.org>
References: <20250623121845.7214-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 96oYDTtyf2mR

Currently QEMU only support accelerating EL0 and EL1, so features
requiring EL2 (like virtualization) or EL3 must be emulated with TCG.

On macOS this test fails:

  qemu-system-aarch64: mach-virt: HVF does not support providing Virtualization extensions to the guest CPU

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/functional/test_aarch64_xen.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/functional/test_aarch64_xen.py b/tests/functional/test_aarch64_xen.py
index 339904221b0..261d796540d 100755
--- a/tests/functional/test_aarch64_xen.py
+++ b/tests/functional/test_aarch64_xen.py
@@ -33,6 +33,7 @@ def launch_xen(self, xen_path):
         """
         Launch Xen with a dom0 guest kernel
         """
+        self.require_accelerator("tcg") # virtualization=on
         self.set_machine('virt')
         self.cpu = "cortex-a57"
         self.kernel_path = self.ASSET_KERNEL.fetch()
-- 
2.49.0
