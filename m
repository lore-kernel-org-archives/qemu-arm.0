Received: by 10.28.4.212 with SMTP id 203csp168992wme;
        Thu, 26 Apr 2018 17:30:25 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZpo2XQzFsngV6MYdvjnmt6nH7FlJ7mPe+IWInWbSPL4kbmsgzciPOGuk/I5T9aB9NB5rKeY
X-Received: by 10.55.176.129 with SMTP id z123mr163762qke.51.1524789025882;
        Thu, 26 Apr 2018 17:30:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524789025; cv=none;
        d=google.com; s=arc-20160816;
        b=QSoNtQQYao3n57mWQ5+0VEVpL+c9MXyn0nceKYLT0elIaWV+4ChhkO7uBwYvFu5EYW
         WuNZyk/MSTt+Dm5AzMZCwAv7Jm/TmBzVUgLwDdPcPIHZPOtIZ/JBulWFNBhVtFI0zx9i
         LL/G2ATETTtTXdRDty4voE6GVGfhv5EnCz37rW+KuqQsGk1sU7UUNFxwB+7S8zBhTex/
         ABsG16VhwMPxZdQtaMTrYbOrB4QJFPOsZyJQEJjMBx1MeMqIoeUcaRPlgBYv5kzGtk2W
         s3G/yf/NR3KENgZzUPj6MgyVm0Z+TruLR+kBMOwehMOCBU+zGWZClYZlm3RU1POmsEWd
         ecMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=+R0iLjuVp6A0iOuDys7qIxZPntnoAwMRWHbaH0zAWr0=;
        b=nQGUx+W3CnfBMYZmiK2rybVdN08bpxjSlUywiE6z7eaIGrFAOIwxrOjh8L0LCM9LUc
         ZeGRVyJHhlA+FhQ1I1djkkG+wh3S0ObTWJFLnxK3UHwHf9Rh+QEWr+vY2VQI8TTFoaFh
         +Si2fJtvxltba2sAv5J6vDUIBTG4AB8CGSG3CC/alj/vT6Qbr2wXrMySWL+OVkC6XnmO
         F4yzC/J6DAUO/JI5oGvGAUO/YWqUxK0sugA3mFDWP49BEn6HCSem1srhUroSpApsSIdz
         +Uw5dra5PJ0SD/biNgfh5/cO6Jvk+uwX5hHlmShiL2L6Ie1qjbiBdhnxWUoK8/XDDzBs
         HMgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=g3vHKA5v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a9-v6si124989qvd.81.2018.04.26.17.30.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 Apr 2018 17:30:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=g3vHKA5v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45124 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fBrHN-0005E1-Au
	for alex.bennee@linaro.org; Thu, 26 Apr 2018 20:30:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51837)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fBrEL-0002Cp-Tk
	for qemu-arm@nongnu.org; Thu, 26 Apr 2018 20:27:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fBrEL-0004h0-6X
	for qemu-arm@nongnu.org; Thu, 26 Apr 2018 20:27:17 -0400
Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242]:46800)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fBrEL-0004g5-0W
	for qemu-arm@nongnu.org; Thu, 26 Apr 2018 20:27:17 -0400
Received: by mail-pg0-x242.google.com with SMTP id z4-v6so134392pgu.13
	for <qemu-arm@nongnu.org>; Thu, 26 Apr 2018 17:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+R0iLjuVp6A0iOuDys7qIxZPntnoAwMRWHbaH0zAWr0=;
	b=g3vHKA5v+6uXHpg5PyjOLGg0bhLNJxeKhFu54KwYw5s6YFV2f+q+GXBLCIIg4PrK+9
	MUT5QqpS6OpBBpFpqLkWy7UjUOeklWYE7nWJFdhbHNv+5P0amuJQhFQUcLXjk66igGlp
	wN9KJjXHn6VIR1gOmP3oCtk5CG58K37fyhsoo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=+R0iLjuVp6A0iOuDys7qIxZPntnoAwMRWHbaH0zAWr0=;
	b=PJm9zy0wq0pRFHk+Y6/EgX712bWHkw6G+lqsgjchYkIc0O0VUdIhronhx9Jd1Pivtx
	fmVFF9YGeX9E7aIEhO12H3d/N0sJ/6RHIyZ9zYc2qrTMP+uY/q1b+JqG6k+zHvth3f+D
	Slm0DSN9zzpW6iwBIjMMwMKPCsFh8t7R0IJp6D8GP4yQX6vA0X+f+/XXSqZz+th2+2Gw
	gueHp0u6/eniylRrxFVsfmVKB/bya22ffq+JE/P1Vo+hcPHlaHCkSkU/TmOdOwQ+Li54
	FJcGYeFTCRePCCV3+BH3xQ+JIHbiJpMiLmhdOWiqnm0TS4t4OWwbsMfstJ3/23rl4Rc9
	dfiA==
X-Gm-Message-State: ALQs6tAhtoXro2hEO2K1SJxHArx9/46/fvTGrVAQazRioXYVU76D+nQS
	xFVQOMze1NCfDaFpoX3/HcvrEQiF8Yk=
X-Received: by 2002:a17:902:bd03:: with SMTP id
	p3-v6mr198619pls.236.1524788836216; 
	Thu, 26 Apr 2018 17:27:16 -0700 (PDT)
Received: from cloudburst.twiddle.net.com
	([2605:e000:112b:41da:c94c:5ee7:de92:7d78])
	by smtp.gmail.com with ESMTPSA id g76sm86338pfj.102.2018.04.26.17.27.14
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 26 Apr 2018 17:27:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu, 26 Apr 2018 14:26:51 -1000
Message-Id: <20180427002651.28356-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180427002651.28356-1-richard.henderson@linaro.org>
References: <20180427002651.28356-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::242
Subject: [Qemu-arm] [PATCH 9/9] target/arm: Enable ARM_FEATURE_V8_ATOMICS
 for user-only
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PzlrwVdb1MV/

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu64.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 991d764674..c50dcd4077 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -248,6 +248,7 @@ static void aarch64_max_initfn(Object *obj)
         set_feature(&cpu->env, ARM_FEATURE_V8_SM4);
         set_feature(&cpu->env, ARM_FEATURE_V8_PMULL);
         set_feature(&cpu->env, ARM_FEATURE_CRC);
+        set_feature(&cpu->env, ARM_FEATURE_V8_ATOMICS);
         set_feature(&cpu->env, ARM_FEATURE_V8_RDM);
         set_feature(&cpu->env, ARM_FEATURE_V8_FP16);
         set_feature(&cpu->env, ARM_FEATURE_V8_FCMA);
-- 
2.14.3

