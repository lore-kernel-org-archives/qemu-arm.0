Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp899635njc;
        Sat, 20 Jul 2024 02:31:53 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCWQZ3++/PrRP41ayLeP/E61hu6vgHw36YOANkPaWLprHPNE6q9Tvuz/zLCvCEIUFjd4SfsUxXMMZypn8PcXL7l/rsINAG0a
X-Google-Smtp-Source: AGHT+IGwPRCJERKzltvKCbNPm8vNLTN+NunmSELf0XjAHVw9/qjwTm0FqD4vj+Sc2M/TiQAP3RYC
X-Received: by 2002:a05:622a:164a:b0:445:32b:df03 with SMTP id d75a77b69052e-44fa52abfe7mr27457411cf.33.1721467912851;
        Sat, 20 Jul 2024 02:31:52 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1721467912; cv=pass;
        d=google.com; s=arc-20160816;
        b=TrRWeYuRRB6wLB3b5mmY29DAU4hrxtdVBThlReLVlI5RTr2J0c+MDLDpYYzhNPb7iJ
         UnlCQr/maibHf96ro9ijTeI23mY6hzyNklMJap/UsCpFBgDt4cGZdiYuTxAMb9ElF4zG
         UFAs3NPlWUA4E/c0lhJtbXbQ8seo3p+5gnHubhAeG3g3Xspz3W3GGFQCEiyszOqQ08uz
         t1XSNIvZG+KTkE70ITOqOvtoj7ystypF78FAvj5DLbRomRwruwv3Ck6yPwJMuQd51HCQ
         Yj9MfACreU4W4N9EH/swNGj9huLBnR/QpBLHhgT/aAbkcb7PMK13BaXaqgCcrB0FlGu7
         VTWA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:list-unsubscribe:list-subscribe:list-id:precedence
         :subject:date:from:dkim-signature;
        bh=r7Pn/awe7YFbUwLON8GOovUdtzCktNX5WHOGmuP4ywM=;
        fh=b/JXxVQfRZaX2q8ymMzLkkFIeqmUWR1qD2l1eyc6g3A=;
        b=TRdzkvXMM5qFBvSd9wEKOKD3io+QEY4zLls++E/lU19i0oqtag05IiWLjZJPKvSc96
         DyWRSclRHudhfLDC0LsKCXvxQMTZhxPBN7VGfAHsMliEQx8OLmKwbfC/hr430JN3JZvL
         n61K6oHXM03RwIWTk9SDghndgiwhaSX1wNNFNbSXR9YtT8J8JXuCeY2OtvWIL/JfpFOv
         L5NImY8sgNUURyZBHg8tjpJ0xpRQM94dr3r5EirKJcuv99lOjk2GkP3kYq+yCBF5/Ye2
         ziH2EDbfSED/XFlW7F16MzhFTn2tZIEULLdvU5emyFW2VjUzhehrpR2dYJ55XUnSh67i
         quhQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=Po4RNyB0;
       arc=pass (i=1 dkim=pass dkdomain=daynix-com.20230601.gappssmtp.com);
       spf=pass (google.com: domain of kvm+bounces-22008-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-22008-alex.bennee=linaro.org@vger.kernel.org"
Return-Path: <kvm+bounces-22008-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id d75a77b69052e-44f9cdfd390si34514971cf.564.2024.07.20.02.31.52
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jul 2024 02:31:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-22008-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=Po4RNyB0;
       arc=pass (i=1 dkim=pass dkdomain=daynix-com.20230601.gappssmtp.com);
       spf=pass (google.com: domain of kvm+bounces-22008-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-22008-alex.bennee=linaro.org@vger.kernel.org"
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E39D1C20D34
	for <alex.bennee@linaro.org>; Sat, 20 Jul 2024 09:31:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEFDB7D405;
	Sat, 20 Jul 2024 09:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="Po4RNyB0"
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6829078283
	for <kvm@vger.kernel.org>; Sat, 20 Jul 2024 09:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721467884; cv=none; b=lW/lDz7KRM5gmI/IhjI+Ckiq5oIN4B1dyVYU7nkgtn7SB8s9vlv0kPVrmlf5Iel+fPzpBR5wJNiq20PncYtdSGVFYr5QUKuVtUMwf8CtG3OBKq0ZIkgJcwBZjqvNj3n1rtkSl6kMbXn9vo/pjIEgE+kPKVcLGjGjpqWUuZJTuiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721467884; c=relaxed/simple;
	bh=tbQF5BcKxA0YVcarKDrPEhr3gUEFDSjtSMkqN4q5EFs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pRGqntVkgj2dWlX6nHoW7nOOBwIJM6CHYvfl6lXWFyv3XIh3X08zbDs+03QJr/pp3vnReXtHGiX7O6XtJHCmfuVp7z54+kBK5pMgg4mfV9HvGyl2cTJ27XSPOonJczpX2Ms6p4PM5mfiwFn1Mqdqpgu26aztUHbqqtuUk9ey+H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=none smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=Po4RNyB0; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=daynix.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1fc52394c92so23547585ad.1
        for <kvm@vger.kernel.org>; Sat, 20 Jul 2024 02:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1721467883; x=1722072683; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r7Pn/awe7YFbUwLON8GOovUdtzCktNX5WHOGmuP4ywM=;
        b=Po4RNyB0/3naYN2Fia5923QIRHDVqrqD+s2C7gFSKls9m/VkJ52e4YCD/8miGgtuVJ
         Itdk/cii/40RA7doHyDIgWUSbyaUsQsIZn7iBdsfEJOXZinYWYasN4H7WCZ0xceQmZ/S
         5LfYjOdq1Rcfc3Yg1926pqiz9Ns5TnUTjOUZog10wLkuyPls8XJSGczkUcrVLzAmxrhD
         78oR4l0wRUiuYmQLQM4aYKRCA+BkY58cHlF6H/6ylotDRIH4jJS4TnNaVZ/4nJoQDeQN
         uypk3wlPIP9sBmxmc7PpH4WR874i2/FzGZgL4DQZpGrBWmZ3bxkJVyuCeBBDX7CCJZVQ
         1yCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721467883; x=1722072683;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r7Pn/awe7YFbUwLON8GOovUdtzCktNX5WHOGmuP4ywM=;
        b=wKWCNVZlFQTfc8mhS7J/KrKyg7rJFZdPhKISjthNonJAXkkUJV78yfi6A6m8mkaSjO
         cPcUh6hghs8FsHSf9Bk9Gtb+0UDbvcV1QwKxOduKZxlcQrcpavuREXbXlwwIa2K9Y6IU
         //GePPXgjkwQzijD1Ea7YO2HGHMIymPFhz/1MchsM+rCIMFEDm5shETwPoHKgCSdL2gS
         Yo81Y5LVawiIvv7j0Z8GRshGF7pQ1x5aIzHlXT1vTDVr8DdZErx9K9MI6CF0Fq0V4b52
         Bo9+LnraPQmbdacLBfKhOI+7kjFZVO/lXlF4jzqo1beLcvKPRTN8s7EKfUocW/FGpZsz
         BSnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVccVmXXYgRkS5RO6Q/E6kzMZjCg1fOgP5DPZxsXyXIZ8VZaYLczV2+E7noLutL3Fm6wMrUWhLgyV8/gUF92wVJ0D3o
X-Gm-Message-State: AOJu0Yyi0u1kmJ/qVdqZ+7r21fPqa7kKIW5jUnbWs3wv76GFLuV6qp4e
	/XQpFCUkbWj21k05pY8wIx2gjxIcLPOGb06aV/6zF9bxfxvh+UGhglsEobCkMKo=
X-Received: by 2002:a17:902:f682:b0:1fb:9cb0:3e2f with SMTP id d9443c01a7336-1fd74573c4bmr20335395ad.27.1721467882736;
        Sat, 20 Jul 2024 02:31:22 -0700 (PDT)
Received: from localhost ([157.82.204.122])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-1fd6f3181desm18119545ad.128.2024.07.20.02.31.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Jul 2024 02:31:22 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Sat, 20 Jul 2024 18:30:51 +0900
Subject: [PATCH v4 3/6] target/arm: Always add pmu property for Armv7-A/R+
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240720-pmu-v4-3-2a2b28f6b08f@daynix.com>
References: <20240720-pmu-v4-0-2a2b28f6b08f@daynix.com>
In-Reply-To: <20240720-pmu-v4-0-2a2b28f6b08f@daynix.com>
To: Peter Maydell <peter.maydell@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.14-dev-fd6e3
X-TUID: JF2Fqdi7fqIM

kvm-steal-time and sve properties are added for KVM even if the
corresponding features are not available. Always add pmu property for
Armv8. Note that the property is added only for Armv7-A/R+ as QEMU
currently emulates PMU only for such versions, and a different
version may have a different definition of PMU or may not have one at
all.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 target/arm/cpu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 19191c239181..c1955a82fb3c 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1741,6 +1741,10 @@ void arm_cpu_post_init(Object *obj)
 
     if (!arm_feature(&cpu->env, ARM_FEATURE_M)) {
         qdev_property_add_static(DEVICE(obj), &arm_cpu_reset_hivecs_property);
+
+        if (arm_feature(&cpu->env, ARM_FEATURE_V7)) {
+            object_property_add_bool(obj, "pmu", arm_get_pmu, arm_set_pmu);
+        }
     }
 
     if (arm_feature(&cpu->env, ARM_FEATURE_V8)) {
@@ -1770,7 +1774,6 @@ void arm_cpu_post_init(Object *obj)
 
     if (arm_feature(&cpu->env, ARM_FEATURE_PMU)) {
         cpu->has_pmu = true;
-        object_property_add_bool(obj, "pmu", arm_get_pmu, arm_set_pmu);
     }
 
     /*

-- 
2.45.2

