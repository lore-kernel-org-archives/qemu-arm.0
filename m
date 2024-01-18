Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp520045ejg;
        Thu, 18 Jan 2024 12:09:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHcEM4/Ly7DhvIHR6VllHAoo4thFLODj+l4tG3ERHjnN92e0u3lc/qGWQTnLS02NxFp+pOm
X-Received: by 2002:a1c:7c07:0:b0:40d:6045:e847 with SMTP id x7-20020a1c7c07000000b0040d6045e847mr345400wmc.88.1705608549019;
        Thu, 18 Jan 2024 12:09:09 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1705608549; cv=pass;
        d=google.com; s=arc-20160816;
        b=pWqAi4XRwcnNHX9r4yxlmt5NlyieO12lqlEhrYvonXNkx8U4rXm3xXwOE5sWtw1FIK
         j4zJFlS6T+/OXgJxqERAmAHSmoz6dJWYdszVZRdRnSCgam6kmtcd+U2Rxf/j6WbN2CtI
         dU4PoZHRWXdaZayKvWSpAoj7z16NskO1GAmt90X5uLRsUx3cKsaFaI9t5H8dXGK6kWrG
         /k4kJundQl/8abX3OfZwQPPscP+KGuYknWi9MDqAXBq+Tw9EsK+Ytcb7znDsOEJV5/kB
         8b08lmziPzsYKbSRl1t9LGJJe9mF/NracWcMT3gIfKCbOkhSyPhY4zXBIib/WYnLO4KA
         58XA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=zozAuekXsv7RqlLM4guzPZsrXewV7KaaXnf3wtjaQAU=;
        fh=cUgEM3TMHOIH70RmHTmTZxZmItZJnKfBWHSaci49aLY=;
        b=ls5JM7OYMygcX3+UgR97DdQuWHjwCLn30ek0IzjlHbruMK1q8lQXUaoKtkrGfV3BbT
         RIc3U8Nx3ac8easfYllRABvPMrdNrYieelZFCID6Vc33e/llAT3BPQyjsAyEnqknu4n8
         mVyxKKZk/Iik0TI+LJ2+A8JW/jscg9eQxncmnIqwv4i+SuaURc/04vtCYZBPX9g1VsXj
         DtxajgshvLclaWABj3f9syhl/y0v4hqPEqgJ2G8lEHkHXPhtEoeViuNy6quXg2XogTLD
         Uu340jwKE6WvYcJCkgXilbjIUctZQHlurzyX5JskWkehgKIicVSmxFWH+yE7h1Znof4D
         HjBQ==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zwZahr3i;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-6449-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="kvm+bounces-6449-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-6449-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [147.75.80.249])
        by mx.google.com with ESMTPS id x14-20020a170906b08e00b00a2d357a9c7bsi5217256ejy.747.2024.01.18.12.09.08
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jan 2024 12:09:09 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-6449-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) client-ip=147.75.80.249;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zwZahr3i;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-6449-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="kvm+bounces-6449-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BAC9D1F224FB
	for <alex.bennee@linaro.org>; Thu, 18 Jan 2024 20:09:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F4052E65E;
	Thu, 18 Jan 2024 20:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zwZahr3i"
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982F32E658
	for <kvm@vger.kernel.org>; Thu, 18 Jan 2024 20:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705608513; cv=none; b=D7jVCAvaxUdHwhkK1GQeYV5IraatMVQWWUVg594EyzytmTl17eEs0vnQK6qhPgMGDdaznE28wPkE0gD/vOOHj8PHjoC4foy355oQjzG9dWU8ATa8/gtwPbYxLQCpSPpGHF+SNP62MR/S52kBrbzdQwM50NCw95Hf82zbdf6vv1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705608513; c=relaxed/simple;
	bh=Hnh/huIxk9oKiDNxRXKE/+Vj3qHOp/qPw0nj5eXC7SI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HEShg0acG+WTztWfVVDVp1lLgox3ZJNLDqyhZoOdNu7gzPtY/KXck3jBuRGgrzTGav/K3gijj+u3B5pOlp5sFSZzwxBVMsc7lYZtLzQtYJzr5epJ9lr71Gtz9Y0WVBaHlj2a0STktvVapMqWelP/r5AmuOJlVZfRFL299CkvzwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zwZahr3i; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40e90163be1so344075e9.1
        for <kvm@vger.kernel.org>; Thu, 18 Jan 2024 12:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705608510; x=1706213310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zozAuekXsv7RqlLM4guzPZsrXewV7KaaXnf3wtjaQAU=;
        b=zwZahr3iaoyXwAflWMCA38CrsUwl1MH5/ri8doUxJVcXzxoqihcRcdLcSC44iAD+hy
         VN1nq5yjlsS/mZmmAJAaxQsroew6aoETrq7xOVNId7nbzvITGBqzFqT1eXGXbFyVO/+N
         D9Jn3jrtCRkGSH7larc7BmvyYVr4ORT885VCSwoce6RKFAeOHCEj3rUMEprkNbUtF7O+
         3dgGQbv/rgjJjOSNjP0tkfOsXiDeLFcEIVrtZcnSyXltHXOTYt8J6puQSyk4XbPlg3PT
         tcSUppfLxnjj3fEVrRm/AtfDYOLC1sm7Boj7GY2d6j7K+M0SgU58Fq3akdJbZf2HFdJe
         RUdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705608510; x=1706213310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zozAuekXsv7RqlLM4guzPZsrXewV7KaaXnf3wtjaQAU=;
        b=Cgfpu3IokJuwy3Arkqt5sJQh1XjHiddd898pF8DOJcNgy9+YuXtNg+otW7l5ffS6kU
         hJUEbZ43M0f4gq/bJUDqHv/r7+yvtZI4klcsbxHlKTBwsoiP45V7ZwRLcwnCewH+2INr
         8d777htQuaHN7A4tWsQLIGbH3uDnTTOvK2ItPIhni0/VWpIYjtkXE/FYEZD4BFsK1/1N
         x63IMsiBiMkx41ABwhsuLwZjZynBmBaSe2ZAX2aIid7Ej1Lh51/YIgsxf+Hu6m5FRDY5
         1WEpx5OPeoptIPRbIvH4jiLSof4asAyl0izrHzBwixHdPMBjAl3yWKCJJPr4ChxtEf7q
         pk7g==
X-Gm-Message-State: AOJu0YzsDs92pP/kqlB3YR4gMuzV14CqsrrP7+S/dFil2IRerKFszn+y
	lgEUYIRb0JDtN0ouvLtdFnbHNjMiOZ4n2FxuLUURb4R+GohPGGMSwErKMIhfdnc=
X-Received: by 2002:a05:600c:4216:b0:40e:4a71:e140 with SMTP id x22-20020a05600c421600b0040e4a71e140mr430671wmh.342.1705608509862;
        Thu, 18 Jan 2024 12:08:29 -0800 (PST)
Received: from localhost.localdomain ([78.196.4.158])
        by smtp.gmail.com with ESMTPSA id jg1-20020a05600ca00100b0040d4e1393dcsm30281752wmb.20.2024.01.18.12.08.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 18 Jan 2024 12:08:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	qemu-arm@nongnu.org,
	Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Eric Auger <eric.auger@redhat.com>,
	Niek Linnenbank <nieklinnenbank@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jan Kiszka <jan.kiszka@web.de>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Alistair Francis <alistair@alistair23.me>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	Tyrone Ting <kfting@nuvoton.com>,
	Beniamino Galvani <b.galvani@gmail.com>,
	Alexander Graf <agraf@csgraf.de>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Ani Sinha <anisinha@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Joel Stanley <joel@jms.id.au>,
	Hao Wu <wuhaotsh@google.com>,
	kvm@vger.kernel.org
Subject: [PATCH 18/20] target/arm: Move e2h_access() helper around
Date: Thu, 18 Jan 2024 21:06:39 +0100
Message-ID: <20240118200643.29037-19-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240118200643.29037-1-philmd@linaro.org>
References: <20240118200643.29037-1-philmd@linaro.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Tc0SvORHZGrD

e2h_access() was added in commit bb5972e439 ("target/arm:
Add VHE timer register redirection and aliasing") close to
the generic_timer_cp_reginfo[] array, but isn't used until
vhe_reginfo[] definition. Move it closer to the other e2h
helpers.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/helper.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index dc8f14f433..1ef00e50e4 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3342,20 +3342,6 @@ static const ARMCPRegInfo generic_timer_cp_reginfo[] = {
     },
 };
 
-static CPAccessResult e2h_access(CPUARMState *env, const ARMCPRegInfo *ri,
-                                 bool isread)
-{
-    if (arm_current_el(env) == 1) {
-        /* This must be a FEAT_NV access */
-        /* TODO: FEAT_ECV will need to check CNTHCTL_EL2 here */
-        return CP_ACCESS_OK;
-    }
-    if (!(arm_hcr_el2_eff(env) & HCR_E2H)) {
-        return CP_ACCESS_TRAP;
-    }
-    return CP_ACCESS_OK;
-}
-
 #else
 
 /*
@@ -6543,6 +6529,21 @@ static const ARMCPRegInfo el3_cp_reginfo[] = {
 };
 
 #ifndef CONFIG_USER_ONLY
+
+static CPAccessResult e2h_access(CPUARMState *env, const ARMCPRegInfo *ri,
+                                 bool isread)
+{
+    if (arm_current_el(env) == 1) {
+        /* This must be a FEAT_NV access */
+        /* TODO: FEAT_ECV will need to check CNTHCTL_EL2 here */
+        return CP_ACCESS_OK;
+    }
+    if (!(arm_hcr_el2_eff(env) & HCR_E2H)) {
+        return CP_ACCESS_TRAP;
+    }
+    return CP_ACCESS_OK;
+}
+
 /* Test if system register redirection is to occur in the current state.  */
 static bool redirect_for_e2h(CPUARMState *env)
 {
-- 
2.41.0

