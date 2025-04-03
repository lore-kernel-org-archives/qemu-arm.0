Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp4377200njd;
        Thu, 3 Apr 2025 13:41:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW82kIkMdXgDU5Z5ATC+0h7+hfK/+RiStpWhRD1jVgdHJLfZqOzjl2cSVrp41dRRPU40sWxYxPDl1rUVA==@linaro.org
X-Received: by 2002:a5d:64c9:0:b0:391:4684:dbef with SMTP id ffacd0b85a97d-39cb35bd99cmr524447f8f.17.1743712873966;
        Thu, 03 Apr 2025 13:41:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743712873; cv=none;
        d=google.com; s=arc-20240605;
        b=dhi3N1jZScqEJX3HEebcVJyqkVAwQ6Kt3jD9tWb5D0NAHBAvYXe6VlpROSFYi9BMM8
         sZP0d6gH0OGP1uXodH3+E7vbIdwsKFXPCZYx0uyJU3w5+FUjraEE2mKoM169tVRh/kn9
         4jGMGXnP68RaLoLcPjRFlSfh1+PzzuryTad4FDqfccKorpQCeiqQtj95rTADxIH6IxHt
         wMcdlraGEgoSHPln1KjwmUNZALmdFgVEGjrA+tfNgJmDZiC6O/t8p9WE7aeE96Xe3dg9
         0nk0rP8pu/LchlPo4mve8EiocOOvR4GAd8g8++LmXam90yqwZjBAJqYWmdnpWByx4Bi2
         cRhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Y1ud80T7n6XBN/Vt1w60MmBJZWVmW7lhw8QbR2LN0sI=;
        fh=uugdP5NzWP+ucRMWbdgzv7OFgwcMI59A1F4jndtUld0=;
        b=enaHuhhHft8ggZs1gO9k4k5507wcwxFOSzR3w2LaKUEC0v7urwanJzGzL4+XOFfqI1
         5BjZl8U9S/CJ+Z49hwXh1oYqYwbmxvPnKoafSy+ZCzNtvD0NfR0wW1ZAOSChVwwSvPFY
         15rO9vtS2RwO4XH6KnTK6HysbgtWRkbUfkjfhwk+/P2tbEnam73ij4yAdGIaGCYsaC9O
         g6HGqClSnEf88VhOiOPtSN+C+5CU4b/2Slk8RKZf+AjZg35zD3E0HXWrIlAkBbFeHkc1
         cxqHcMzWfBSNP5RDL74j/YDfVtBKbwNJoj88isN/iEtN+jDBZjgyjlTIqfvyFSdo7LJS
         AY/w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kgRpL7Bb;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-39c30208102sor779014f8f.5.2025.04.03.13.41.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 03 Apr 2025 13:41:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kgRpL7Bb;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743712873; x=1744317673; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y1ud80T7n6XBN/Vt1w60MmBJZWVmW7lhw8QbR2LN0sI=;
        b=kgRpL7BbKwSlgrZ5T29PLVRem25kUBKhYGHjNKOTbnV4S750ZXoCHy+NjE7uQPW5S5
         rF9ShnOxdN5Fh8vjikvc/McAPzD1chaNwvftHInleg7fauwOxlDYfq+UeDq8psAtyYHB
         JKZ0bifAeofXWuxc/TOG66nfr7qozkHEXVPNf5ynGvHd9uz9I/XxHE8D7UvqMvGIeBJL
         1jbQTNxnCKE4P7BpoCxe/F+j/ySQhLiTwdVb1j3FDr53SiZTD5QkSHFyjZi0Cx89nFL/
         hHEs5EoQ5JckHFI7s/jqwLJWT7bm4AVffZqVo+hvXBmpiieLOB62Mb8Mfed36l8MDh6L
         km3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743712873; x=1744317673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y1ud80T7n6XBN/Vt1w60MmBJZWVmW7lhw8QbR2LN0sI=;
        b=vCfT+uT1x39GIAzFDB5xu9VQTKD0K/KwqShHMugrJ80udsF3l/aiS3bCIe5xt0Mmch
         oxio4duofQctH+0BRU+vYBF1GN+OWG05GFY7f65TY0eF0Nnus2i8vduYhAgVoBljIVX5
         E7aLvkuES7BUmFoh/lEenPIv4PCH5dl7TGh+eMvcQKFybvIB8gqASYpHwJYZyJ/gShjr
         vT5WDSLBn/yllBWquFfFGgKxJcK5o/EM6kuGWFP49tgCZMT8DliHNCHQ6xcFowqrj+3c
         7bpkBjoY3HtY7LvsXow+5V4wfcNxMvuDGAYTmgDVi+hMxLxxSJOa00j9nSSfik218Qpq
         6DTA==
X-Forwarded-Encrypted: i=1; AJvYcCXgqDEbuu7dTaJYUDNWHm3QcP1ux2KrMJ2I+g5lEow3h+WYYpSfLK3OTulPJ7kBhccgt9FA05bsoE5GyQ==@linaro.org
X-Gm-Message-State: AOJu0YzJrevQQNa2sKhcYFEgV1/7zThWngvWfvdzIMXluZJGDaz5hqjD
	RsTT0htnL/Ik3kjO1eAznaNWbZ/V+lD+Yyr08sW/DacbEEsAXof9/xFhHnX7N9pkXg==
X-Gm-Gg: ASbGnctNJ4WAVfr9tJQ9Lco+dgmOu+O3IVPn44I2SPA/T9kLHHMEdWFEIArtd/mIbcS
	Dj71L+OwaAguozLgM9Dpc6JPLMVLl1M6aZRdjviEI56y2jVNlu9dku5XgoGARjjn6m27f40v8ao
	Kp3DtEJsEBiDvF0+ZvXnripzrdPXsKTXAZuAGO5iAmsDUvvVrMroLGB6vZ4UAgNYi9aWbJ5FA8S
	UejqFrJTgra23tTH3TBJuxWR65VtAT/DeJAOr0KEVBuMqcfeyBZnbm0hHpPFXgTjlrwQ1Jsryi3
	SuXesL7otDhkEcdKJBd5jaRKnLtDG59mfEg+UE4rm0j5pDXibYya4PtWr3IB8ddbhno9vj5xWJ4
	8GAJfV3ovNj6MTo+ncD9QuUja
X-Google-Smtp-Source: AGHT+IEU+UhUNAfd9zMk+eAeD58yweIdBZ4ugK4h46Ifvyvwj/FZT0/mzLLDu94w+ivy3mHLgSMRbA==
X-Received: by 2002:a5d:6d8b:0:b0:391:ab2:9e71 with SMTP id ffacd0b85a97d-39cb35bd8bfmr546809f8f.20.1743712873478;
        Thu, 03 Apr 2025 13:41:13 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34a7615sm27325625e9.9.2025.04.03.13.41.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 03 Apr 2025 13:41:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Andrew Jones <ajones@ventanamicro.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	qemu-arm@nongnu.org,
	Udo Steinberg <udo@hypervisor.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	Gustavo Romero <gustavo.romero@linaro.org>,
	Igor Mammedov <imammedo@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Ani Sinha <anisinha@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.1 v3 8/9] hw/arm/virt-acpi: Do not advertise disabled GIC ITS
Date: Thu,  3 Apr 2025 22:40:28 +0200
Message-ID: <20250403204029.47958-9-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250403204029.47958-1-philmd@linaro.org>
References: <20250403204029.47958-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: lYe8da5OecAj

GIC ITS can be disabled at runtime using '-M its=off',
which sets VirtMachineState::its = false. Check this
field to avoid advertising the ITS in the MADT table.

Reported-by: Udo Steinberg <udo@hypervisor.org>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2886
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 hw/arm/virt-acpi-build.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index e7e27951cb9..38a9e6fe0c5 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -212,7 +212,7 @@ static bool its_enabled(VirtMachineState *vms)
 {
     VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
 
-    return !vmc->no_its;
+    return !vmc->no_its && vms->its;
 }
 
 /*
-- 
2.47.1
