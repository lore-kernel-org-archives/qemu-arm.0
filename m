Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp1273857ejb;
        Fri, 16 Feb 2024 06:45:24 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVtfLVAO1Lp487BRuBZTeMkAg8pqct/lAIdNRcv8zUA8domlxwJ7sw30J6mbgNYylqJQYrCFW92KnT1y0dL6KYhOnIbdIZW
X-Received: by 2002:a17:906:b0c:b0:a3d:fa7c:db2e with SMTP id u12-20020a1709060b0c00b00a3dfa7cdb2emr570277ejg.32.1708094724520;
        Fri, 16 Feb 2024 06:45:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708094724; cv=none;
        d=google.com; s=arc-20160816;
        b=hq5Z2MN7MBLoZ7bBH1VL4iXC5l9RAktMOe6XiUS0ZGUW1sN3yZbRPjPHJ51JVUmxyj
         U2dkmMU/r7Nb2jj1DlfbjALBfWSSlcdyaePN5S8aKHY37CzRytRLKTG4WVzrg/baxClD
         kteidiE4cPrrxmU1LBA1WXE1KeT1y3mTSf6gqarKlna+TBp1T0dNoaUbdMr7svxzdjVt
         o5UB8PlGOdAM4oDSkSqTcmFn7n67djGypUnJTo9oS0G7T/IWw5BYxus7K5R3H3EY91Og
         oqcZ2nDs3tZtyQfKt/ZNKOlDTbBKoAB2ygiMpcu/fxdpj4aX50oBVoP6CCFESs+jLh08
         DhOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=qTV1hvk+3GXPfy1FUvwkBJo4EhZOBPRYeMtALlPmFCg=;
        fh=bhG8giV2NDr+apBaZyyg0nAwu25Wdz8xDXkrN/SdSOI=;
        b=W5myk3PcUPfsORHsVvC7qa5FEwAQ7+xNEFuAK4PU9d+8/EodmyFQGUv3GP6zd5JMsU
         kNjMu6mCPvzcEpVQRh+KOFW4VI8Ub7hgu69ax7AHAMri5IVzVE9uWrbo9w85gbamAjEF
         2ggQLWNoCrQnXPnJW5Ugi7vzvsNo3u4dZEv8GYbDp4wdgh/a9HnrwdjO9D3QkekofyYh
         aBnLfPUoGweUUgsHBObPdg+DGU7jRRbImEmj5uHtaiwkLVZOIPUKKzp/f6LpUrPgbbEn
         YdkT3d0+TWj3m+MOvfGpjk7dHMpN3kAiMFfatbL4/uXMP0V9qKfeJ4VvV3W1w86QLQne
         jc0Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HKmAWNKt;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ce5-20020a170906b24500b00a3db6b0cccasor16908ejb.0.2024.02.16.06.45.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 16 Feb 2024 06:45:24 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HKmAWNKt;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708094724; x=1708699524; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qTV1hvk+3GXPfy1FUvwkBJo4EhZOBPRYeMtALlPmFCg=;
        b=HKmAWNKtShMhWl6oQdLm80GtDSfbMRY/UK3wGFABEFkabL89VFi0gHvrdEHOie2AYL
         PBh/on3s3p+0SRaqs+y3JL114/GBfjxDy6iwUb7M5QBL+kJ1muRozMBY4fsM0K6WLK20
         QK6Cv6mApLIGvU1FTZORF+Bk+KL4jS56B8jaAIGyrRhY222hRKr4PHmOIHIRkdM908Bj
         q6xJjdxieBVT3yaAnobDop4J/GS/2unx2wrstX3Z9KVuQijIIj7/mZLMWlcsvbHc97hJ
         hP8R56l4MfxhAJHB9rXjEvldfdvT5pMiM3RbYJA8MOX/QjxojcK1c6neR/9AX0Mw3hCS
         j4SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708094724; x=1708699524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qTV1hvk+3GXPfy1FUvwkBJo4EhZOBPRYeMtALlPmFCg=;
        b=dD1sKj/T3H/oDXSAH20mwnSttiZk4dUmDURdO1mBPR5uw7ILSsgrx17jV/QoMaW3jx
         6tks8WIYnWRUCHWhBf0U609go837LRSN18wlmxkrRkP4OoAKIhvW5IJVyRY2V8yWq88O
         KcSL13XH+zqzv7Hif88Ge4vOugUjVommEicOO4UQQ+wPFm496h/6p9DzetBos9GnIq3Q
         uP/5kiRyWfiAOkZtFUQBG5t5xW8WUi9/xElrsTpxTEQysCQY36ODpfdDJsIH1S8t+Z39
         /80clKVQDh9qXs0dIBF8Op///7bYUbD1tDXDtf4p6B/JH4H5BwIfTgKcSaMchQ3bAkb3
         5Ybg==
X-Forwarded-Encrypted: i=1; AJvYcCWa6g4+NBCMUxxZ4ewRmLtUXJWX8SrsUdNCJSwyEAJsF01KTvEdSVm8Fak44hV7SPZi44V1z8aCrA8Sstt0ZQ5nnPLBvR7M
X-Gm-Message-State: AOJu0YxwblEEYS3tkn0AUmdfMarJ6v+5XprYz/C6YKE5/nNRG2edu5WK
	S5hbpNc4aKQPQkPo3Y/A2RUri3o5emiXeJiCR7uuP3VUqUkFwbStTHkcOZqIGwh8xA==
X-Google-Smtp-Source: AGHT+IHbqCH+Y3UVzShUZcHue7uudIxl1S8ppZme8kclN2WfkTatO0o1NHeI33w2VlRh4xPZbiWopA==
X-Received: by 2002:a17:906:6d0a:b0:a3d:d7ad:49b1 with SMTP id m10-20020a1709066d0a00b00a3dd7ad49b1mr1271394ejr.19.1708094724295;
        Fri, 16 Feb 2024 06:45:24 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.187.210.246])
        by smtp.gmail.com with ESMTPSA id hw18-20020a170907a0d200b00a3c456b0c0esm1614529ejc.108.2024.02.16.06.45.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 16 Feb 2024 06:45:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Gustavo Romero <gustavo.romero@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Anton Kochkov <anton.kochkov@proton.me>,
	richard.henderson@linaro.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 4/6] hw/misc/ivshmem: Rename ivshmem to ivshmem-pci
Date: Fri, 16 Feb 2024 15:44:54 +0100
Message-ID: <20240216144456.34992-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240216144456.34992-1-philmd@linaro.org>
References: <20240216144456.34992-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 3T0w+jd6tZZt

From: Gustavo Romero <gustavo.romero@linaro.org>

Because now there is also an MMIO ivshmem device (ivshmem-flat.c), and
ivshmem.c is a PCI specific implementation, rename it to ivshmem-pci.c.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20231127052024.435743-5-gustavo.romero@linaro.org>
---
 hw/misc/{ivshmem.c => ivshmem-pci.c} | 0
 hw/misc/meson.build                  | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename hw/misc/{ivshmem.c => ivshmem-pci.c} (100%)

diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem-pci.c
similarity index 100%
rename from hw/misc/ivshmem.c
rename to hw/misc/ivshmem-pci.c
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 84dff09f5d..4a9369082b 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -39,7 +39,7 @@ system_ss.add(when: 'CONFIG_SIFIVE_U_PRCI', if_true: files('sifive_u_prci.c'))
 subdir('macio')
 
 # ivshmem devices
-system_ss.add(when: 'CONFIG_IVSHMEM_DEVICE', if_true: files('ivshmem.c'))
+system_ss.add(when: 'CONFIG_IVSHMEM_DEVICE', if_true: files('ivshmem-pci.c'))
 system_ss.add(when: 'CONFIG_IVSHMEM_FLAT_DEVICE', if_true: files('ivshmem-flat.c'))
 
 system_ss.add(when: 'CONFIG_ALLWINNER_SRAMC', if_true: files('allwinner-sramc.c'))
-- 
2.41.0
