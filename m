Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp94839njb;
        Wed, 7 May 2025 16:44:30 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCVeuWxID9gNk/xLZQDaeqjhVTqv2Twrf3p+QjxMoSp4y9zI/8toMXiZcE4Zmy/Y2NHTFiSipfZta65ODA==@linaro.org
X-Google-Smtp-Source: AGHT+IFWDcxkhRygQEK1/lR2NeuIHXpacFtuxPemA8cu1Hn5VuwwUKUQh3qRzOIzqycTppDoHKIw
X-Received: by 2002:a17:902:e950:b0:225:ac99:ae08 with SMTP id d9443c01a7336-22e5ea64de8mr85803545ad.5.1746661470287;
        Wed, 07 May 2025 16:44:30 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1746661470; cv=pass;
        d=google.com; s=arc-20240605;
        b=EMUJVoaqG+EDiOovxTU8ZIVDZBC162rXlFRJohigl4ubjKVZhDPU9ZneAtDrH6R0rp
         boVWn8ha9JJeEXRT8p7BMjKi6vOlR13V5kcH745DgZ1nXXU1y9xUWoK61cDqjGlRMmVR
         sKYrr6CE/tdHPf23l+1inXNlDpibxJAUx46YC/KzN6SLDZL360dF0R8E6+p2W5QalODt
         ey1+JapZng8pKg6/uPqUx7dSETm3LzsJRAeYYcGyvI3oPKaUfIg1ywAzrty2VosqBthV
         Da97c7rzlFsN1p0ZEDHrY7JVo4CCXPw54OW3xC8iH3eGKv62tyn3vCGkJ96s6Ntu+K5O
         dnIg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=kfHS+52V3f05Qs2m5d7Nh2wTK+yUmoJBcA8DI59GOAc=;
        fh=4fmpkdHjEsI8Egx9Z6bUz+hImy64t4i+Lmu4zgjisYg=;
        b=aJuSA5Sp9bfec2j3s0snHkkJ6s3wmJxgFLUMml4c+H3X63F5OzJUZHQNcjHVNE7Bl5
         lCjbWu5ADL+Fame7pU8+2Z5kxoGBuorbAEz3++bjS89SegI6MNp0D8q+glcFA/R1vHAP
         GzBesYDoyrHFkHX5A24j9kSNdeW3rqWvgN1bbL6eiy0IrPA1CS9Xi+FeXxe/kfRSqDQZ
         u2h28yAjBb/d534Eo61aDGK6IwyTuqMRCTMFJ6ZQTC4UjrMlNwXu5GFntfNfWKdyYquo
         xTkxM22tGw30hLvkbKFhRkHyaKea28//yxZzzPA72Hc2uKL4WPdSY7W/DZANIby3xZf/
         VQHw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UBOBBMye;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-45782-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="kvm+bounces-45782-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-45782-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id 41be03b00d2f7-b1fb2a8ad49si15234319a12.0.2025.05.07.16.44.29
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 16:44:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-45782-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UBOBBMye;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-45782-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="kvm+bounces-45782-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBB23986BF3
	for <alex.bennee@linaro.org>; Wed,  7 May 2025 23:44:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AE322918DA;
	Wed,  7 May 2025 23:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UBOBBMye"
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDEFC2920A4
	for <kvm@vger.kernel.org>; Wed,  7 May 2025 23:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746661380; cv=none; b=c+W0NSUY1qA7P6/M2uu1O0sbZAemQM3pjlAnjBZZm2A0ruZbSoTJWTbjhA1EtqumN9UJ+29WLxwNszdRoAVoIj1VPcxPG2jNBNkNsgP0aKC36cbCVkki6vVivUau/87cteKWtldNxCQCvY+W4l0cIRhAABpCHHtDsFEDIoEtGsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746661380; c=relaxed/simple;
	bh=E9jacJWcyZhRxtvgQxT+RUKTpQhm1PIlSntRw9cKGQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S208B4fxq20qAHdl5PavdpcUoTprutfHcQQpGYkWqoQWDL6ij4/TWjCsx2ZrrnsiXCSigoLAAedCB9SFoB/NNW1DR8rWGkWiolbad2rXUawODmLesDlcaLPo1AxKDd1A3Ilul8BqZLkLN1miUMbZeX4xB+XePwzUVPpHqUdIDhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UBOBBMye; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-22e5df32197so5421075ad.0
        for <kvm@vger.kernel.org>; Wed, 07 May 2025 16:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746661378; x=1747266178; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kfHS+52V3f05Qs2m5d7Nh2wTK+yUmoJBcA8DI59GOAc=;
        b=UBOBBMye4ZspDpguaVaAeH3YeJ1+1f/XCYuuZcj7Hkoni8qV+bxADt5UTlYNR5GHNX
         yEidxroqy2skHAaQCLRcmcLMbK2sqd49NCjMcO5OAQywUulRsJVjsJfN8CJJNURKHUgy
         wrx79AFU08t2crDoUFG9J6BnLxtKt2rXa24kmS0tA8nCBMkbVbqjbArzirkFh/z2w4iz
         vYAUha62/Ekjmq21tI6lsTUw3zHRFewiDaB+ros9VtNa/jrhUxmDLWt+M3WjSWyy0ssD
         km77SOS1sND1T+EZIq/+OZ/YHum378Jf8remfEWa3mjSfOmOENjDoInhmDxPZKcIiwm+
         euSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746661378; x=1747266178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kfHS+52V3f05Qs2m5d7Nh2wTK+yUmoJBcA8DI59GOAc=;
        b=cvQ6QuaxMDkbZFJ4UNCHuP/WdlFo3tmeOOnTHFZ14Ik4f1yG6PcXPBwHpjD27zG1HF
         bdDjyTj/QiS8WWGPqjufmIkFgB+e0DgFBWVgivMsbD5QLVeKhMcqlzReqT+/HOJfzsms
         ucsg+iGPT8LkUxfXV71sPRpvr/AwAilJx6QCV9A9G/ytBNmYVITcxphx1HfDH70Swzu6
         nzO5MjtgEICrzmAabOTqUFLMeE/zZkQn6yiZn5eGfeNeU3G3BvURjLbeVQqqD9HjtfFR
         434rucetX9570KhtvNWnQMi3n8DMCtiy4VMwQIAP06NGCIWetoozTtvQ22Ar6M3TIEc0
         Squg==
X-Forwarded-Encrypted: i=1; AJvYcCUhG8XTfFMEeWe/+l2JZiaqoONBcUB1bo5diQ1xmGdnwLMdK+9ynDs8rRzYhQyeEVGF3sM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEIzvAl9AckmHCk+ukQ5b2tRMECobCrITQB1MoXBTEYTQ0YYQx
	lO8Rjxy0ktzNUEYo97/6mEqrMJdRiZ7BUBdBPzWXu9K0shTNul/T9iZyrQe5XbM=
X-Gm-Gg: ASbGncvTCt7NzH0AyLVKu0Ka3HnhuT4U7o+wVnfd+dt5td0mh+CKeXKUtfeM+zgVdrl
	HJxGdRP4pFl5HbtZ+aUqgmGO2/CkDfQ3zwTweOYzQuFyQIrwEZfCj3K+ui57PDiHG1fz9ENLrX3
	iAMX3u+ddNvBd+vIvqz5Iwk3BGx9jcOvMacIeRmPEUPuFblRpuFpLk4/y87Cvp9uS4LtTzrkfAj
	6X5rZGlwO4Gmm0YJe4OxoDRfCLYkjFChPF1umUb/dFYXbmi6b246BQtsrXsKsd8lmqdiCiepsun
	VroclWUw+gZMA4saV+toDDV+0gxsOxx9CmBXPQ8q
X-Received: by 2002:a17:903:40cf:b0:229:1717:882a with SMTP id d9443c01a7336-22e798bc50emr38640465ad.4.1746661378306;
        Wed, 07 May 2025 16:42:58 -0700 (PDT)
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e815806fdsm6491325ad.17.2025.05.07.16.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 16:42:57 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	anjo@rev.ng,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	alex.bennee@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v7 17/49] target/arm/debug_helper: only include common helpers
Date: Wed,  7 May 2025 16:42:08 -0700
Message-ID: <20250507234241.957746-18-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
References: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 0Xr141mYtmkN

Avoid pulling helper.h which contains TARGET_AARCH64.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/debug_helper.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index de7999f6a94..cad0a5db707 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -11,10 +11,12 @@
 #include "internals.h"
 #include "cpu-features.h"
 #include "cpregs.h"
-#include "exec/helper-proto.h"
 #include "exec/watchpoint.h"
 #include "system/tcg.h"
 
+#define HELPER_H "tcg/helper.h"
+#include "exec/helper-proto.h.inc"
+
 #ifdef CONFIG_TCG
 /* Return the Exception Level targeted by debug exceptions. */
 static int arm_debug_target_el(CPUARMState *env)
-- 
2.47.2

