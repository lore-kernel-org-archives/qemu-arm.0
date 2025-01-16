Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp3809262njn;
        Thu, 16 Jan 2025 07:02:22 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUhySGEEqJBuMUrPfpL5Ja7dBfA599GBXwxL6Ek9hkHjWUMA/Q+4heeOvqv2/oeDvB90kTA4RYqFWIx6g==@linaro.org
X-Google-Smtp-Source: AGHT+IG3M5klpDSkHOvXQhG0tnZkDucEGs49XwyLXm3hicGwWpVGEjJeO3G1TXXf0zx6nVR/8dx9
X-Received: by 2002:a05:6102:d86:b0:4b2:af6e:5fef with SMTP id ada2fe7eead31-4b3d0f8f84cmr29324643137.9.1737039742395;
        Thu, 16 Jan 2025 07:02:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737039742; cv=none;
        d=google.com; s=arc-20240605;
        b=AVYwmbfTxwsSL7kEF7jAtnVyjcLT31K/fEA5cJ/Jj8iZR65GIHe2dNC/h2kT/lXpfp
         ptB4Zdrx4oDFTnysRvwJxvkLhdwOhI/JnogXAtjalKEsbKac8OM9MXUcqoxBLxHAVpj8
         PmCY+qvrNKlTPzwDAZ7lH4ONgCM9ChddzzUmGp6AfU46Tx6IL8OcmNjoL+m7GNeOzIOU
         I/DOww1jJ/RaXsE/02bTNXHnFQSXaTh1hRbFROG+wnGuRNlsPP+k/fNm/Hs0ojvUk7Ml
         cl5MWA2VgKFgGhEnNJZl75LJuOXl8hoqtXsZDk6ysg73MHTfzreYnIzqnxveOj0VbWm5
         iL7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=su0CZjE/5ewS32kCJYLrA1GOf40qLVdjf6VbZ1IHg8M=;
        fh=1Opc2Tt23rA6mbogl2oGTs4VnUhEKWArIJxhYHub8sI=;
        b=UsiZefPq8pxxDQONWTWqlkxVwyy1Ev6raDDZnaL5QDn2kTkn9fDES5eiONPIqe9lBF
         AsSoNLpKqamv/dNk8XT8dNhOdvI10tG48p6w1mDtEcETCoTu0iMTnRuhgfdmuSQ071Zu
         OJj0yQ4l8tQpc3JQzIba1D/G+i5/X4FvNPHui7cXyWpQVyFKIZ8URq6/I7XhDO2WbjMi
         73fC8jn3EEk3+IcErOKnWi7p+eOjIxNL3yD6jq6tm36tsrxj49HkDyjhiIT8WZ+9apUS
         jqEs/EXFyqUCm2lsloDzEA9IEfWCWJ+ZSeCivgUhi3XGsrXnVLh/7cndBrW8vA50OxQp
         5SMA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nWnCKHWk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4b68a37a640si161161137.653.2025.01.16.07.02.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Jan 2025 07:02:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nWnCKHWk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tYRM0-00025m-Oi; Thu, 16 Jan 2025 10:00:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tYRLt-00021q-1u
 for qemu-arm@nongnu.org; Thu, 16 Jan 2025 10:00:09 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tYRLr-0008WD-JO
 for qemu-arm@nongnu.org; Thu, 16 Jan 2025 10:00:08 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4362f61757fso9726075e9.2
 for <qemu-arm@nongnu.org>; Thu, 16 Jan 2025 07:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737039606; x=1737644406; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=su0CZjE/5ewS32kCJYLrA1GOf40qLVdjf6VbZ1IHg8M=;
 b=nWnCKHWkJiGnnISfTdsXdywkWElwOhJDH2klqHmdbrX9yKVmdVJ4LYMdSyfGzsnBUE
 4NfhTnmm5qe2qRGwcoWPKo+mcAXSnsohmRQlgg3iWQAxG2gYT/ggx8mw9c+OlODfSouW
 S55FDqdJ32LuaCzNY9aBkzWvRONccdQz02tqU3VLK9ShdCjSY/NNyGE79XEstx5yrJ0V
 /dwrlnygm0ZgzkmSdH/sOXHW5a2jdr3W7yKycQG9oeofF6tAMiiy3/7iUW+lmWxE3j5F
 26uAsAEdrDKjZgEi38lCwXtHXlvnyxRpgQCShAi+gdte1L8a9suVeB3M61Me4wm/u2i8
 8G7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737039606; x=1737644406;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=su0CZjE/5ewS32kCJYLrA1GOf40qLVdjf6VbZ1IHg8M=;
 b=ZKRqz5IARJmoaOHRAG0iaFym9swjbDMMXooomLE3FW5bv8lE6P+r5hnuT6jwGFL+zb
 Sg6W0maXYRtkJGVJvrQlv/P66VdSVzHDSQerH9bvJsDjFAgm/sJ404fP8TGuCW/utVrV
 lNJpz/NFwnRX6hfNYknArA4VMD1UXec7cFzkLo79ODeDbwPQlG1P9IA8dFpqpwlRRp1W
 PdXYwonWpuUeWLTNb15P1upnV95ojrbbbodoVzxjJBaswVfjMDLroydb74zNlCwPDUOS
 sUFAdaSMeK6HTnMn9SWBwwt2fBgrZGWMivokpJ7NgV0tdOwY4rYG4fzyhhj0vDyNVCeu
 09Ig==
X-Forwarded-Encrypted: i=1;
 AJvYcCWG6MNziinldgQH/uqmlqg7/bYxL6YoNKWWnFsGMNHrhydkacu91zYkV4cXyMaULztdf2alFMqtQQ==@nongnu.org
X-Gm-Message-State: AOJu0YzD4XZ5lbC6YRMNoZ3eyuCNTuX/aqsl4Y0wqlE3sKI4rDQLKbiW
 QlMSrZ9LGW3BcpHlnwZjRgJvvsRiXEJbs6ZA/saA2HX26u9A8m0eNvJTH6vF/QM=
X-Gm-Gg: ASbGncvye6u1SfDZgwTx0yx7Ie2sqIiIo3TVOc/JRJa5Sv0kcrFXk3l10YZvir66h+E
 7/az+bMyaEvJ92x+jq6qMkQ+h/96cJz+NV0xQ1I1Dk9D+Rl2NTu6dCGZzKKhndS4Yj7q7qKgyth
 UGSFMzBuxw+iIxPbw1YFCrAenLey+K3KPvtujFnQh+I/XNh7BdZ+G8lzWZvma7ENeNerB3aQt36
 QBsdxsYMJyUiTaADwX3r3GI08UOyi/UYzdV2Sy5olt8BXYLZkvUJvEdyXcB1DfvWOlr/SHjF+eK
 JAadRLRV56PT2UBIEUfGeaDkBco5big=
X-Received: by 2002:a5d:5e8a:0:b0:386:3918:16b1 with SMTP id
 ffacd0b85a97d-38a8730fc4bmr33835844f8f.39.1737039606201; 
 Thu, 16 Jan 2025 07:00:06 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38bf32150a6sm95726f8f.15.2025.01.16.07.00.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 16 Jan 2025 07:00:05 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>,
 Andrew Jones <ajones@ventanamicro.com>, Thomas Huth <thuth@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.1 v2 04/13] hw/arm/virt: Remove deprecated virt-2.7
 machine
Date: Thu, 16 Jan 2025 15:59:35 +0100
Message-ID: <20250116145944.38028-5-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250116145944.38028-1-philmd@linaro.org>
References: <20250116145944.38028-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: OG1MJd7Wx8uP

This machine has been supported for a period of more than 6 years.
According to our versioned machine support policy (see commit
ce80c4fa6ff "docs: document special exception for machine type
deprecation & removal") it can now be removed.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/virt.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 53f4a96e517..eb27305dcd3 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -3589,16 +3589,3 @@ static void virt_machine_2_8_options(MachineClass *mc)
     vmc->claim_edge_triggered_timers = true;
 }
 DEFINE_VIRT_MACHINE(2, 8)
-
-static void virt_machine_2_7_options(MachineClass *mc)
-{
-    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
-
-    virt_machine_2_8_options(mc);
-    compat_props_add(mc->compat_props, hw_compat_2_7, hw_compat_2_7_len);
-    /* ITS was introduced with 2.8 */
-    vmc->no_its = true;
-    /* Stick with 1K pages for migration compatibility */
-    mc->minimum_page_bits = 0;
-}
-DEFINE_VIRT_MACHINE(2, 7)
-- 
2.47.1

