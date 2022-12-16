Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp1733251ejb;
        Fri, 16 Dec 2022 13:55:30 -0800 (PST)
X-Received: by 2002:a17:906:3694:b0:78d:f454:3762 with SMTP id a20-20020a170906369400b0078df4543762mr17666958ejc.5.1671227730046;
        Fri, 16 Dec 2022 13:55:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671227730; cv=none;
        d=google.com; s=arc-20160816;
        b=RoJJdqf4p+rJ5w3vSeNKeeXP4kHGrrZiygt+MbzI+mdX3AyoNPl1KL0T/WUZiHyuez
         GFEP+g4I4ljdBauJf3+EM6/9aaWQ+FM/i6Sbw84QKnMjdRm9m/GUvSSKm5mbwbtD1mC4
         9oZUKDa5V7BbzO6PCDDCAxx/097q06SoujOAfT7P39XRYr1Jnyu6UlG5p9hHJwik70Ru
         TG8es68axlVi6IS7CuqsAUfxwCPU8afU1KJnnJLQjm7mdsKK3skbvb496f+d19yahw/E
         IGkVkuOGU2GV+0g/pVfRzb0HkA4RoxSngLyWB0YKTTk/xQ75EUCKC7W/byWPNkJ+gTnT
         FlJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=xssmHoWXJ6SK5gCkViO69Q35oM9uqfLm45e7wmSAEiQ=;
        b=d35xcOPdb56Q4nfsrWbyJxbULZ3a4EJHFP2cxTzbzDHaj/MGd56Ylfl0wIQA1lTbVR
         Y+zr87ZFgLY5CeTVMignq+CqxvmX+xnszMenGPOTHpYtN1TKRmnNedB6JGObKZ5d39Fi
         cYIP+slEcSEeaaEfmi+Td2buEz7dx02FayX8Mcwk3WGBSjP6QZUIiC+Alm9UW4Sfcazw
         dFsD37m4ZtVLw6pzFfI80Vk1dOFPlzxgDIvOG6iYYhN/oK3B1TrrXC1+WuzJf3DU8DF3
         PrZKqZkiWHNlsHuvtzT9dBp2B0CK/VtcdfxCGMRVX2oboI3K5hWzF09SVgwaYcXfM+1l
         VPFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OpENGvV9;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v7-20020a170906180700b007c07f0c3789sor1751530eje.109.2022.12.16.13.55.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 16 Dec 2022 13:55:30 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OpENGvV9;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xssmHoWXJ6SK5gCkViO69Q35oM9uqfLm45e7wmSAEiQ=;
        b=OpENGvV9zNK1kW2Y7ktPT/UEMrwhPfBX9OCoT6BvQzow6Z8RdawcCPkv1jvvW5UZNN
         BkJLBj2jT5SzemHxcvMn5J0HBpDDJw/3EstPP2YSFB65vnD729EA3ms0Ldpw13TdUYSq
         ApjgAWsRedsCev6ZI3O3XLVMI029rL/+Sn3bY83RmMuBsNMCkT0xTE8tAVBSwR6dbjd0
         H+8RBAE1UCkHKwZGjrlsH1rgpGDJIpwefc/J+tYBcuHKjOgTFE+MO+69ye9fcnaTsQH7
         DJsocgUOkRXsyoILarEzNMbhawurjJ9oJZOiv3jTOU/igoYaYIYIWwj5kTMMXS1kMDM5
         D5Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xssmHoWXJ6SK5gCkViO69Q35oM9uqfLm45e7wmSAEiQ=;
        b=5/V2/Ia2L9GAPlG6edFrHp7jhOmblwAFqmaqqLydKdtKwRzJTxTqNEKIAPLDXev8Hu
         Agoh963vOIKuAWZveFXPXPRc80pc1BiBewOQC3dRXv2y+Qq31ZGsSL7ekoEzVcyxfpg5
         cIRoAGV8Qwh2KO+tS580Wx2m9mg9dD0miuLlLSgOQ9W2RaHlVrufEJY2AQQbxTiPxT7W
         AEKH3F3iJ9yX0uCrjK09qMregd1YULLabpamsJFxQfB8t9iv57avC87izKzHB4r+EeAh
         RvEQ26pGDfGj16YS/nRJuYRgIlBvfrH7CRqSip/VClLZq9ittfD4QY5faNWBqtwYwpw6
         QNcQ==
X-Gm-Message-State: ANoB5plEdPdXPjhUoQ+UkD1bmq3Xy9IrJJeT/B5QWZwrrD22bYtfXEWx
	LvVf6aNHaoHL0A+FRb0LcU0NATZO
X-Google-Smtp-Source: AA0mqf6xT41BcyZh02Z2thOeHZOU9KTDZSfsSUSOjRb6fHLKc0deeuEgfS6otC9br60FYAiYkf59nQ==
X-Received: by 2002:a17:906:4c4b:b0:7c1:1ada:5e1e with SMTP id d11-20020a1709064c4b00b007c11ada5e1emr28189213ejw.26.1671227729771;
        Fri, 16 Dec 2022 13:55:29 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([185.126.107.38])
        by smtp.gmail.com with ESMTPSA id r20-20020a1709064d1400b007c0cd272a06sm1276141eju.225.2022.12.16.13.55.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 16 Dec 2022 13:55:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>,
	qemu-ppc@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Marek Vasut <marex@denx.de>,
	Bin Meng <bin.meng@windriver.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	qemu-riscv@nongnu.org,
	kvm@vger.kernel.org,
	Stafford Horne <shorne@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Chris Wulff <crwulff@gmail.com>
Subject: [PATCH v3 1/5] dump: Include missing "cpu.h" header for tswap32/tswap64() declarations
Date: Fri, 16 Dec 2022 22:55:15 +0100
Message-Id: <20221216215519.5522-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221216215519.5522-1-philmd@linaro.org>
References: <20221216215519.5522-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: L6x9QNLTuhM1

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 dump/dump.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/dump/dump.c b/dump/dump.c
index 279b07f09b..c62dc94213 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -29,6 +29,7 @@
 #include "qemu/main-loop.h"
 #include "hw/misc/vmcoreinfo.h"
 #include "migration/blocker.h"
+#include "cpu.h"
 
 #ifdef TARGET_X86_64
 #include "win_dump.h"
-- 
2.38.1
