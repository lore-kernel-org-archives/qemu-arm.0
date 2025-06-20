Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp878663njc;
        Fri, 20 Jun 2025 06:09:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVyLCqHQijlxBgTBL+KjK4NzjsumdFJX1StLZx5dbNGkTCOO7L6DZGE2A9bWiD5p4AVLy4lhk1NxVkzJQ==@linaro.org
X-Received: by 2002:a05:6000:982:b0:3a6:d191:a835 with SMTP id ffacd0b85a97d-3a6d191ad25mr1913082f8f.41.1750424944730;
        Fri, 20 Jun 2025 06:09:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750424944; cv=none;
        d=google.com; s=arc-20240605;
        b=YovR1SbVR4ELZCEqG7Ycs3e6VPjWX89IfnMR7laeHDL8680bDDZwsCwxFIhOU144y/
         IzfjT374rJe4kghVNb8KfQPv0Z3pSuJqcZg0b7E2QAsD5+bbqGvErjgmTaxT3Zc+k+EV
         BZN7NH7agZkLNjVHh5sJmoUl9dxNdDrCWz6ffiImXI8Um6ps8N8ojkJ1BFHL7xUrMBu6
         gcJgEHDDx8NtQJZ1XITb6cEEsI+OBwzr2agwc6b35IoZTwOAM3bYVHKphAH/rgf1fUVz
         OI6dIrVx6yrRM6l5mvklL+2kUxK60J9/ioSeHwnOVnpFTaADHJ1NqTGEAoKjwiXtm4XR
         rh5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=jKb7+45W8wr+DNWypSxWBKVEj0bAIAzVgg/1Er2vy8s=;
        fh=VC55KH+Z2JvZNY70XiCIGAuQXEMD+YBgMoKnumym4Ng=;
        b=iQ4LqfuyD/u6Vq+clErrk7N6i7W2jDmrGo9fNeZ65JADJT5a5+Jzd1pLsivV4Pc2kA
         jdw4dMlAUSGUfoxW9xaxRGhIkjB2xGfStWgnZTbaQQSi2Dr9FfMYzJ3VLcST46EF7iCk
         SpTC2qD3fyhN+G5ksz7EJm6JFcVYgdaSfrCDxUdwp21h9TWk06mplRj8YY8PY1cdLqM1
         c/9b9XiX70gLPV7gDNd9DHmR/sXXBzPDy2+e4+iCB3N6zmKAsFeAuXkQHaCpUZQqnpGS
         UF4ZW0esdxVFL1+OwxdU88GzrGiEp6lH0WbyiNpx0ufh6RiuGsLstVNnMV5nCq+glaxz
         y/3Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=My3iinfT;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3a6d13c9e8bsor539189f8f.1.2025.06.20.06.09.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 20 Jun 2025 06:09:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=My3iinfT;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750424944; x=1751029744; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jKb7+45W8wr+DNWypSxWBKVEj0bAIAzVgg/1Er2vy8s=;
        b=My3iinfTiV9rA5S0x699Ex4+uGKZrsS3rmvruWTs1i5+FiGzhDTirlK2KViklxzxLm
         aq8poZLau2uNEaKGuG2JBMP+BAhnF3LEvmtspoRy3biAidKIIRWdqKa+YHjoIF0/xyYM
         thhBSnu6BslhlfPWqGmZddvT51AnnKyVBa8gAZOjOgMT9vJBs5yqGxRGK1b/Jquty4Bh
         C+BiFF7Tq+p+ZvFJOjnThzNywxvhQY3noC4sCEpqKdueE8cIwnhZnlWOm/b/1OplqYeZ
         X0jBkuL0qB7EXvujT2u334p324BECD4P9m1aR7Ugi8TvwrRxSzt2s/wia4r68Hlj+miF
         I4Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750424944; x=1751029744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jKb7+45W8wr+DNWypSxWBKVEj0bAIAzVgg/1Er2vy8s=;
        b=fT+MikMDRE+5D9aqmKgynSu23aBZ014vGk3rwD+eUxSciC53lNdHuNCU3xl/ijhTGu
         zdBY753OkU28azDBAAhfsg7KSXTvon+GWIeWvEAg78cV1Nr4bGkpvJ+ZdfGefuzZIp7H
         VrwGCMciVySdn1NwM68aG/aQyq0eJuRsyzoRsFqjiHAy6vP0pW4utJ2pZO+0fHYOwDo6
         wQH9bu25eNJTAi3BifXAgwXa+N9WI4GHNNJ2XjsSsGsrioUzrQhimE7ZnmLD7GPEvD5h
         L6oJs1OEIH5SZfcZHR06QT9eo7+dzfQ5gZOyhQliszwOkKgmbJd8odQ5xr3oxqwVlk2U
         USNw==
X-Forwarded-Encrypted: i=1; AJvYcCX/GnDeBAD5yfekHJBmx8MMBpbqV7cfOlGAVPiGV/Rqr999kzoOir9zLrpw+F4IZeaWmK6h6XRCe5mXJA==@linaro.org
X-Gm-Message-State: AOJu0YzDYb5ohEPzwnKZQSanWsRSByeUP8tEXFNJPaMJ5IgIR/0puVGi
	yE2v8uGvEmAvgrKuTO3uaECGkNTicIWGUKELGuaUVrmUDJYyUQJBmnIk+U+eW9Y+Rqq2jg==
X-Gm-Gg: ASbGnctjl7/8lOJYDU5GFvrfR8aT4p5OjIs9DQ8dUBk8yy2RIMSoQ+RLdk3ozVj7Fv8
	L4CslpUnanrx6GT+5T/lyyST/Knar/Fd6GBR3yArRaEuHWdLdpCdMRxA1871t8/Ie8oJ14ENKcu
	bjxvr2MlNKsEI8Kl4NGvRrpLFeHO+QbiXRvf63j8RvZLK8thQkJLGTG2TP7Ite3C5murE/KqWTV
	NW65TBTytpaFrVncEwM3nD3oluxiJ6Ak9JRw2DxMtiLYdAiMO6gDBMGFztb1CzCuxLNEj9wcCrZ
	gNVnH9FocdtArounw7v0j3su2uU7jpaxP/Zg/HskCP/B6hDcp3hgPKUkhoWTBjkJ0XSYgJqx7Dp
	K8gNNFlen0et5/+W7RbenYAG3qW2hbAwdbSjP
X-Google-Smtp-Source: AGHT+IGU/PISgWAUAam3cXO827+5Gf2StC7Q8MM7jO79fbKmCjBYcioqe0LeMR+lxX2cddMN2HDweA==
X-Received: by 2002:a05:6000:4109:b0:3a4:eb7a:2cda with SMTP id ffacd0b85a97d-3a6d13071ddmr2045022f8f.30.1750424944090;
        Fri, 20 Jun 2025 06:09:04 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f1ac5asm2117585f8f.33.2025.06.20.06.09.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Jun 2025 06:09:03 -0700 (PDT)
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
Subject: [PATCH v2 20/26] hw/arm/virt: Only require TCG || QTest to use virtualization extension
Date: Fri, 20 Jun 2025 15:07:03 +0200
Message-ID: <20250620130709.31073-21-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250620130709.31073-1-philmd@linaro.org>
References: <20250620130709.31073-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: pDZXmO5NrPC7

We can not start in EL2 / EL3 with anything but TCG (or QTest);
whether KVM or HVF are used is not relevant.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/arm/virt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index b49d8579161..a9099570faa 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2210,7 +2210,7 @@ static void machvirt_init(MachineState *machine)
         exit(1);
     }
 
-    if (vms->virt && (kvm_enabled() || hvf_enabled())) {
+    if (vms->virt && !tcg_enabled() && !qtest_enabled()) {
         error_report("mach-virt: %s does not support providing "
                      "Virtualization extensions to the guest CPU",
                      current_accel_name());
-- 
2.49.0
