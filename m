Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp878593njc;
        Fri, 20 Jun 2025 06:08:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUAzkHZEaT2bj5SpkFBJHiHF+BWN2gz/bS20t7Tejw+X1gEGxQ49P/q8rXB5w+3euyPYfX8mNGdQaryIg==@linaro.org
X-Received: by 2002:a05:6000:2dc4:b0:3a5:1cc5:aa6f with SMTP id ffacd0b85a97d-3a6d1322b77mr2375630f8f.34.1750424939333;
        Fri, 20 Jun 2025 06:08:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750424939; cv=none;
        d=google.com; s=arc-20240605;
        b=Lv2oA11FKlOUpoIi6NBq9Dn7Na5OozUfdv25MEU0n2vt/K0q8EJNDPR1VV2JkY7YFk
         Oh7X+g7yFqu79ZJEXqyWq+YtC+zzcV7Yup29K45THPpDhZTmJ9Jv0Rz9JF9uGjoZ6l0b
         QT18Y18hkoto1rwLRwwnMQ96boxeOaVG4HxITA4F3Gfom1XMhtVbmh72xtySWc/5j/WD
         RBpzymYAuEK1d/V5lwk0vzvONJND3jGpiBbxO33kgRmRo4rmonipCcWw2GKDtU6s7YFC
         vz7P2xJnlfB2TcFpLVK+avjfxYBGARIgsGsbDAMfdldn0KGApxYAWtI7Cxt10uOwHdeL
         3oLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=CoTleeCUcvYndolgWSxVbjuEBw5fGt+mb1nmRFlbWPU=;
        fh=y6TGe3/+003aPI4QCJoR0JJI5OVkOiFgCmlQCQD7qn0=;
        b=TJsVZQetrugvrWPQYDIL4QTFMomMAp1369nbMhnw12tfa4gJAMpGRc8a9riYyyjT8O
         +Y/evp6zVcx9gMCelEgvwkuICteg+MlbFyK+sLrduOUo6El7ukWl0buEilCv1IzoeO7N
         dUqLQsFi6w8y+KMcjIiWVdzQpQvvohBW4Yohw0wWCbIuEVfeNeN0xEdI6ImK4B3mkj1K
         /HOiv1BP1yFTCLGaAFWbfV+iCI7wLnWjVMpNqRdYjk9g2hipdm9zLKMA2SLAA4LOCxXO
         a5KceHbF5npROlIUHmF2p7zIPUIDd8gcohNoszr18g0+kfZDAPDHg+Msa1K8kYfdR3U1
         Kfcw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=giz4gdYm;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3a6d114a767sor440043f8f.5.2025.06.20.06.08.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 20 Jun 2025 06:08:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=giz4gdYm;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750424939; x=1751029739; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CoTleeCUcvYndolgWSxVbjuEBw5fGt+mb1nmRFlbWPU=;
        b=giz4gdYmqzu8sYq3rcBi6JVLgCZtXk5frR61e8JOuxsa36FWSulDtaJj7cf6Z5McoD
         ncSX0h7a+2FemL5fkmOrrTThZQRVp/F6HMC8M1yxH2nY9hLhmac4L1MKwyTzVDnkuYIt
         uoAUNmKOEybRw3p74lJibSX5Je35HaVS5NCFRWmSrkaK3dbXlQeDdGe3Pp8YGtwTFiNH
         2Lu5F0vce5D+JNMms7HtJpJTxAPuxLTayBlBZ4ljSMj4hnsSXad1JUGCisOiy24g4Gm6
         KBKWLQhspZRItn4EtQhWv084KFn5RXZ6bqIv08GiyZ+YcosCQd1KxK0QD3cKQPDnHhTo
         WYGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750424939; x=1751029739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CoTleeCUcvYndolgWSxVbjuEBw5fGt+mb1nmRFlbWPU=;
        b=G80sC1u5X2Vi2iatt+6QlVHtMOcs12k5w607bDXMNZX/0D8mB9agjKByvMhoLhd5yd
         WOqO/qpFwq+zIj8MiJbUhmzwqDkJIizs5fv69i/w/TzS4sfkxp2NG0tzwu8r3WdliTIt
         BWFQW4sJYDMyOADa8IkiK1jyUBcKVIoOg5h4oJQbYoWMUeeyLFRtEQIv59IjeraG3nkn
         BI1C9EMMh+3xkx3IP7PxkpR+XrqJRLaqvuPRn12FoDTeMMIGim6pXiBUoRyq5dg8NaLs
         Ip+YrU+hBniExEfQL+PviVz9s72A1Izsj8NGdxcRFElomAFxnknfjmy9Q+HcBuaVnSND
         6lxA==
X-Forwarded-Encrypted: i=1; AJvYcCVN5xTdVRQYQ9nsa/LSX+SYhl3iW6eB6SPLBBr6uquudSgXJfo6To+v8p2TcdEHAa4tM2N5q79dSIHIbA==@linaro.org
X-Gm-Message-State: AOJu0YxbHxV9+bbdSw50R3tZE7xHJpYyIBdDVSWFzY3MpOJyNmUzXWaY
	+7kWE7Mk8+wvBZlp5Sn6QuV/ZDVANm3Ye8CP2bhY+AVU73eII1k/g472cceFZYF/6PAmWw==
X-Gm-Gg: ASbGnctf0zUQ2EvT1BzdlVIlVOs8bQqWVwQOIzldVHPv9I8Ugtsn1c/6ewB4xlCe9Hp
	oaWY5cB13EKFkUy4Uh9fmotl21+OrgO4OohqO3+LLkN8EDBIRll5v5zjwMCURJlKANtO5OhuKtu
	72UsZwrga6rCri4+HuMEcmMi2lcpMaXlAkuudaCCPd/Z54NSZE8Ye9ev/w4ZM2H0KmqyG78kJwH
	qFUYlWRmDw4EoVs2DvgEqY4kAQUJMYBb9nUY3XF3JSttCrl8ena36YznWXacBfBS9f/+DAQkIcL
	AEXqM910xqDLebS+kO+s23isj11WXW0LPn5Jtqj1wxByCSGk0dXpGXRhfY43U6gPX/qWtKgn9Uw
	8bdVrWayXIJj/ISJf474QjW64s37G8H58nNGtSe/DSqGth7o=
X-Google-Smtp-Source: AGHT+IGuIbYoqiAUyyTvRzRx4XiSdr/lFqQmEELQqzVAO0UNUSoo47/0fUF0+MkjrXr0XzUJRZQK0w==
X-Received: by 2002:a05:6000:3103:b0:3a5:58a5:6a83 with SMTP id ffacd0b85a97d-3a6d13013eemr2649039f8f.13.1750424938708;
        Fri, 20 Jun 2025 06:08:58 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d1192680sm2076203f8f.95.2025.06.20.06.08.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Jun 2025 06:08:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Alexander Graf <agraf@csgraf.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Phil Dennis-Jordan <phil@philjordan.eu>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Bernhard Beschow <shentey@gmail.com>,
	Cleber Rosa <crosa@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Cameron Esfahani <dirty@apple.com>,
	kvm@vger.kernel.org,
	qemu-arm@nongnu.org,
	Eric Auger <eric.auger@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	John Snow <jsnow@redhat.com>
Subject: [PATCH v2 19/26] hw/arm/virt: Only require TCG || QTest to use TrustZone
Date: Fri, 20 Jun 2025 15:07:02 +0200
Message-ID: <20250620130709.31073-20-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250620130709.31073-1-philmd@linaro.org>
References: <20250620130709.31073-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: +m+yn1xhcOif

We only need TCG (or QTest) to use TrustZone, whether
KVM or HVF are used is not relevant.

Reported-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/arm/virt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 99fde5836c9..b49d8579161 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2203,7 +2203,7 @@ static void machvirt_init(MachineState *machine)
         exit(1);
     }
 
-    if (vms->secure && (kvm_enabled() || hvf_enabled())) {
+    if (vms->secure && !tcg_enabled() && !qtest_enabled()) {
         error_report("mach-virt: %s does not support providing "
                      "Security extensions (TrustZone) to the guest CPU",
                      current_accel_name());
-- 
2.49.0
