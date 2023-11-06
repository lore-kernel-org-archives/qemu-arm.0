Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp2678748eja;
        Mon, 6 Nov 2023 03:08:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGkteN8NiRo25izuOjN6+AHLD5gSKI0jYLJrYjEO5fDLtehtAd6QmVKL5c1xPf/tECdRzbr
X-Received: by 2002:a05:620a:172c:b0:778:96fb:736a with SMTP id az44-20020a05620a172c00b0077896fb736amr32171217qkb.57.1699268917796;
        Mon, 06 Nov 2023 03:08:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699268917; cv=none;
        d=google.com; s=arc-20160816;
        b=CBmmftXnad7QiWbDfcPlChR5ZzjBEGk6VY+CyJwlAdHA3WIWOBs8tsO3FFRC99nEFu
         HVy+D2cPq9bvaH5NioWhOa9B9DDlPVjnJdK56WdtZ0YG9GvWLIKxv8dLOv5QnGPrUcNs
         lJxXSgaeYSRp5lYP+GQ423dbxC2NVZAUJe0KHFKbCK4HSs6uOu7oAi2P7Qi15ZHcoK75
         MMOYdApI4eGfLUkCl9qGgAj4NhSIFaU29i/SH+3Fu3jYGhZ1AOvqTpo3blv6M3/CaOWP
         Ijvr7B8r0WVKZ2roa4SteZgMwgT/ygZGboRzbnVddhYGhcrF+QF/g2SBc03n0I0vQezL
         XlfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=bC2TdykjktUVtXbtq0twsr6zjowOcVE1/YbXmtopUl4=;
        fh=kP45t4pKNiiTQmfRdGnr9XVYBc4zhof3GMRpciaSK0k=;
        b=K3RlaC+jHikOuT1PK+beXMeX24zQ1NyP+8CETuK+2F2sl1LaBnNxtKdXBO03J/jP5e
         zls9wtSZ4wCOyBrxW5Vlof0mVbNSXb4TFLaL0tZJ2ug6MpIPJx103vEzWW//tmYxNNha
         Gdp4iqXD9cr1lbxuAhkDhhwOslZv5mfLq8xy5ah+v3faBInLqTTyxlPsF1Wga0wk+I3g
         0VK5xkpE8/LzoESrnGlVdhCz47iUri4Dds6Z9Wl/4BJ0F3IGcHg9BPXk1A8+xHJNbtHB
         SbJ2DLNKtvK+bZ9LbtM+gVgONfQBvXttD6ryGrsI9cKFoTE8vTnvqWIOoLXtrQ+vnnpC
         g/JA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MfJs3QM8;
       spf=pass (google.com: domain of kvm+bounces-711-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-711-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-711-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id i9-20020a05620a27c900b0076cadd6f855si5688212qkp.219.2023.11.06.03.08.37
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 03:08:37 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-711-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MfJs3QM8;
       spf=pass (google.com: domain of kvm+bounces-711-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-711-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D1E81C20AB8
	for <alex.bennee@linaro.org>; Mon,  6 Nov 2023 11:08:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF822171D7;
	Mon,  6 Nov 2023 11:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MfJs3QM8"
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4467C182DF
	for <kvm@vger.kernel.org>; Mon,  6 Nov 2023 11:08:30 +0000 (UTC)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31B3798
	for <kvm@vger.kernel.org>; Mon,  6 Nov 2023 03:08:28 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-408382da7f0so32558925e9.0
        for <kvm@vger.kernel.org>; Mon, 06 Nov 2023 03:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699268906; x=1699873706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bC2TdykjktUVtXbtq0twsr6zjowOcVE1/YbXmtopUl4=;
        b=MfJs3QM8TxrTXfQDIFKLKw7vTkX6L5gCSSFge+xeD+nfsQrF6jt6/VjZ+XLxgj/5AU
         ouM5VSUdyr732rEOG+4ojTNwq2t4usiaJ1wUnrJwiS401uxJzIF3TG3B/tio1XfNr0vn
         xJumv1hn33SAR9dQNZqlFUpJX32gNLnPOKRoxCmPd4FhK7FrKzQkiTOanS6BA9W98xAM
         mxXy4s0s2MqHZQ8+8/uSQZVXoJwaTKVWE85chr9WDX/rl4ZZARwVTBpxPJYi1RQMducv
         ructVHZu0JJKbpnWRR40PEJezDmCntD40vpuse641OctOEF3rG7I0ODcOOiA89Seru6P
         pQdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699268906; x=1699873706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bC2TdykjktUVtXbtq0twsr6zjowOcVE1/YbXmtopUl4=;
        b=c2okrl/lhyQPywv7qlRnGrVIqlex7n1A0rnBn2NF7/isVVRdNh/tpaf5zVHzF61Mxp
         unODyG8vGAoeAk4DuefdGd22c7fCnvg5oCSOtJS8JEj1W/4kRE7+RRaqHkrZcBEQ47NM
         XQeo+QDaWsR4gRVt0TFJneDmES0vDGlEtP8iiZlBDQPeC2jPW7eI1lkspSlq50Bzaxvk
         iLTsZ96IQzOhbpBkPKRciX1Je9XwRcmHCMz/dvnl3JPL051wvka27hAI/W+SQsT0yQ5/
         rEt4PoYqyMPbFpUvfowrHbaXerXBn+JpZjnGJwV7lb5BYiTEXSnJtVHnk9FQxURq+or+
         +bFg==
X-Gm-Message-State: AOJu0Yy3/pulqMgERbVSHhv/GkDYIXt+Fxf2EZNB4uwuPv3iRh5dAQAv
	PsDI7oVzwy6vI35UzUMmxYI64w==
X-Received: by 2002:a5d:62cd:0:b0:32c:c35c:2eea with SMTP id o13-20020a5d62cd000000b0032cc35c2eeamr17839736wrv.6.1699268906698;
        Mon, 06 Nov 2023 03:08:26 -0800 (PST)
Received: from m1x-phil.lan (176-131-220-199.abo.bbox.fr. [176.131.220.199])
        by smtp.gmail.com with ESMTPSA id m1-20020a056000180100b0031980783d78sm9136370wrh.54.2023.11.06.03.08.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 06 Nov 2023 03:08:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org,
	qemu-s390x@nongnu.org,
	qemu-block@nongnu.org,
	qemu-riscv@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Bernhard Beschow <shentey@gmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
Subject: [PULL 42/60] hw/isa/i82378: Propagate error if PC_SPEAKER device creation failed
Date: Mon,  6 Nov 2023 12:03:14 +0100
Message-ID: <20231106110336.358-43-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106110336.358-1-philmd@linaro.org>
References: <20231106110336.358-1-philmd@linaro.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: yIxGjhTP3S9x

In commit 40f8214fcd ("hw/audio/pcspk: Inline pcspk_init()")
we neglected to give a change to the caller to handle failed
device creation cleanly. Respect the caller API contract and
propagate the error if creating the PC_SPEAKER device ever
failed. This avoid yet another bad API use to be taken as
example and copy / pasted all over the code base.

Reported-by: Bernhard Beschow <shentey@gmail.com>
Suggested-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Bernhard Beschow <shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20231020171509.87839-5-philmd@linaro.org>
---
 hw/isa/i82378.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/isa/i82378.c b/hw/isa/i82378.c
index 79ffbb52a0..203b92c264 100644
--- a/hw/isa/i82378.c
+++ b/hw/isa/i82378.c
@@ -105,7 +105,9 @@ static void i82378_realize(PCIDevice *pci, Error **errp)
     /* speaker */
     pcspk = isa_new(TYPE_PC_SPEAKER);
     object_property_set_link(OBJECT(pcspk), "pit", OBJECT(pit), &error_fatal);
-    isa_realize_and_unref(pcspk, isabus, &error_fatal);
+    if (!isa_realize_and_unref(pcspk, isabus, errp)) {
+        return;
+    }
 
     /* 2 82C37 (dma) */
     isa_create_simple(isabus, "i82374");
-- 
2.41.0

