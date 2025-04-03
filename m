Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp4185797njd;
        Thu, 3 Apr 2025 08:19:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXUEGOZhicMMTsq0+50lGOyni0mhLAmhcn6bxf5JWdSaFMLuYuC1fdHXmQaf9b9wD8LM7WpzD4cy0JZcg==@linaro.org
X-Received: by 2002:a05:6000:2509:b0:39c:12ce:1112 with SMTP id ffacd0b85a97d-39c2e651984mr3957313f8f.21.1743693596687;
        Thu, 03 Apr 2025 08:19:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743693596; cv=none;
        d=google.com; s=arc-20240605;
        b=eun7OCkovp+qdoAXnnyUx4QThzGzndeMU8h4vaYXC/FptCtV2lw+hHenctlRCCpU6I
         mxJX6tl7KMLrq5esgxnMWS4i4G7Qye1A6/9XIaa2OJwLVlvmAA8xk/H9//bW/YdKhRo4
         W2d6iehbSrW11MRPCwWSfiE9NaW/FGH9jE9PeFGhrjhtBr3g2NQc2T0D6N6hKsgpwd7N
         W9ye/lEFRyjySNMHNpSFBtCY5wXCWi5NlkJCyCWmIY0qeaeZWjiyvHth0xBY2OwXfEDn
         sbeLf5w82a4yLDH3a3DlX9pyG9Z/PJqVxtkT8wad2nzyV47OcwxYdBst1bhr/IZuyfuo
         LiGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Y1ud80T7n6XBN/Vt1w60MmBJZWVmW7lhw8QbR2LN0sI=;
        fh=ZQl5v2bFNxa4bqZ7Z0Vt+l0eX3N1rU6KmG501iehX60=;
        b=ONeGNffANGXAE8lj/iKA5iXNhbc3PM/Tpa6HEbsbtncw8chRTooXzsXGh4J69Z62IT
         6+EoUd2rCfoUqB+mcEEievkCsiCWjifxJ5ZP68knYOcfpTzuI9CVMJbpW+62DI2cD1eO
         a5Pr/MTXBFs5Num49nrmBijR8CMEBwzAa6yCj0aWTFY1ocG+bQimLilcm60B6dxbLiLY
         arU/nEGb1HL+irw++Ip/AGP9JafljcJinLfvKiECQhifLmySoCCC/rGORvPHyD3KFyCY
         TSYuRlBIk6glQX0dDnwCGBt0EEw94ZDeYRTiw98Ds8uptjXrKh0KwencNtCRyajwYkD6
         tiLg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OwIAEaIz;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43ec245ad93sor5104765e9.3.2025.04.03.08.19.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 03 Apr 2025 08:19:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OwIAEaIz;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743693596; x=1744298396; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y1ud80T7n6XBN/Vt1w60MmBJZWVmW7lhw8QbR2LN0sI=;
        b=OwIAEaIzpAwMlFvmprm1+1wdaPr7NqBzcJ9fXCMkBbrXT0PAKSjOfeFc8Lh8wFIQYP
         9aWzOE1ST2APTqnE0TDVnZcC+hgVH/aA0pki1mqOwHM7zpKmgG+j/fs5BbOc6J2CG4zZ
         pKSCREadB5oN6ds19eDgBoyl96o96TPvIu1G/BpnRG2K2nVR2onOsnmVXVjK0Y4LJcrM
         A6Ib5437/220SkX+SGmK5QyL+vf+Pfv/p6t09I7aXG32P2oQi6R/AAIdpJQ2Bbod/HMX
         1yG7ZICFlZvx3cw1zIHOGPu5YDuPmiYhRGHdU72n7T3kMP9yxKYhA2h5Vrse4tBBBzKr
         DpRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743693596; x=1744298396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y1ud80T7n6XBN/Vt1w60MmBJZWVmW7lhw8QbR2LN0sI=;
        b=v+sYL6CJj/ZDreLyZ0JGXm9iPDFwDl+zICvKhZkF+gxHqAJ/kUg9CPChN/CEaYBNEI
         7+ktOmlbY+YQPZVYbHAXlZuJlJjpTw+Ko5wk8H9BFSmeM/PztxV5+27SQFnGB08Juqxw
         sZhMgGfBtba2+zlls3v56MRjge6WjEdImoFie6ID+yuiRXHu63xdwnjV+xo6SuPoDw18
         m4kd9IKFcfP+zX8ePVoFvbakgjb4ePVfqFzt6jO4C7ZrWd9bN1Gd0A8z+EU1waDVtfVe
         ed+INUZBayJVjAXdr78fdVc6XfH+zng/E7sTtsBCw22kEExVLCuI090A2fVVx9wPbefb
         8kUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCS+7DRNjxlbjQhMQ+34jvb9UhNw01X2+hgD7s+oM5QLdEZX+6LhSTIMR3I+gsk3hO19OLiKVdl64hQA==@linaro.org
X-Gm-Message-State: AOJu0YxZ+euPrcFaHy5vGVLD+e07NzkRrnxznka8MillW+JcGF/BdTzw
	DLSc1h3fr++k7iJ6gcVdkoQvlYu+K1OPnZv7UIPqwh2cBnvzqKhdsJQO9eMlfV0bTQ==
X-Gm-Gg: ASbGnctI1HdPnNx2y74yAnpCGlLEJCdKQrnhFBZeFiqu5L8rb7hxJ9LXSxIM2tHLetJ
	qqYbqG5kPYaF8o1fSAdb+xbC/tg0Y6zNbn6+8I1AwGPpZHBTjW9RCXRbDu4nzd0jHANKEFNLdx2
	jyBr4cGO0MYgUtl3KQ5Hcbl39VMEAiEcWtB9o/kPe7hvA73wcYH9q3tyJhU9KNpNg7xzleAv7Bj
	QGAJERy6QO/OyJbPAB6tNNhUAKhUPa2Oj8XNRQCjWriF9KkQp8KYc2E8dvSl34D7OtUjtJwBmv6
	KKCS4BJcf97KoBxvu7/3srv5Ba4dg0CT7hzMxLlJ+VBDCw1FO7MQluPR1CaoClLK9N4UTbSmyjc
	AHAYvAHHZ831NJsd4XZA=
X-Google-Smtp-Source: AGHT+IGXXex+wNz9GVT0o7s7euMamWBpkIPOdC/hQzfNo4B70NtwGiAEHtEtjjPxs//mFKo8VlJjUg==
X-Received: by 2002:a05:600c:3587:b0:439:8490:d1e5 with SMTP id 5b1f17b1804b1-43ebee8dc60mr32622285e9.4.1743693596062;
        Thu, 03 Apr 2025 08:19:56 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (145.171.88.92.rev.sfr.net. [92.88.171.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec16602bbsm24505315e9.9.2025.04.03.08.19.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 03 Apr 2025 08:19:55 -0700 (PDT)
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
	Shannon Zhao <shannon.zhaosl@gmail.com>
Subject: [PATCH-for-10.0? v2 13/14] hw/arm/virt-acpi: Do not advertise disabled GIC ITS
Date: Thu,  3 Apr 2025 17:18:28 +0200
Message-ID: <20250403151829.44858-14-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250403151829.44858-1-philmd@linaro.org>
References: <20250403151829.44858-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 5SAElB0GDwae

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
