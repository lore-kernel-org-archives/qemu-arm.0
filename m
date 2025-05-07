Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp94249njb;
        Wed, 7 May 2025 16:42:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXoVxR5lLsuaRchItnUuJWDNHmXpjM7mEp4GrbNtztk0Viuli77Vuwh8OvGAgiOyLnK8q5eCeEcv/rtkA==@linaro.org
X-Received: by 2002:a17:90b:3c08:b0:30a:9025:84d6 with SMTP id 98e67ed59e1d1-30b3a6ea5dbmr1590273a91.29.1746661368123;
        Wed, 07 May 2025 16:42:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746661368; cv=none;
        d=google.com; s=arc-20240605;
        b=bOZ+/lufc9CbYh84fqDslxIPKL/vqNR2wDptRmG0bPSWrQlLvjJvs/mwyg/Rm+gcx1
         kHip0xUokjoRRZAcb/n+zrYfR2tUm6DRzbyK9cXTrUQ+cl5Oi1BWuyiKiOgk64YLS0Yy
         XMW27Cwny1abc1PjlDqVhc9iWvKQ3J81ovXcWV9Hw8Hm9ANdBRB/CqaCQ2/6rIal+4e6
         JpU6hijT7675dIiQWMoujGgWFAzqKrN4KlVJRewnMOrCK0OJV3ec26Z+BFYfAxbMdQPS
         ZxCuig262HTV9EZaLSD7YuVwwrmPrHiZZPRzgm7yTaU0Grx9NcrkLOU/gSNCDs2bWZLb
         z00Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=hckfD0sziqBh1sSWGP9c0OUCVTgvBeVKgVHtB7xMeJ4=;
        fh=iGDiFXVBDqqQDuIioQfXANsL1SGRGGNcp38LpKjz7GY=;
        b=Kv1FdZAbRKJUBHWBbHmtir6hKR8da+xFPo4EBlygacq9mROY5mKH7cTt4ZVtXLh6EL
         W9+BllosJIRw9YmVSxrv3i592Z6fSc1q/FeBotGV4Ud0AYQiiloe9I5/0npEZr8RC6Bh
         daZF2Os4k52t9aCHqGLXCZH0NMf0G13W6zCxkGRng1XaBvfoJptnShixoM/uzNjR2BXF
         LPctIk0W4Pe1b+pgeVz9n5AM6fVTi5Pc+x6qe0dVZ9huX0dw3pbVCpkcUHvxy02heUgL
         9HAmKZ7Vat16GV7usqZPhz6t6PN12P44XQ14UV1CHGos5IqPShTl15F+x9h8i6Gpwg1E
         YmKQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=R4olPoqy;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0be8bbe6sor136243775ad.16.2025.05.07.16.42.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 07 May 2025 16:42:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=R4olPoqy;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746661368; x=1747266168; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hckfD0sziqBh1sSWGP9c0OUCVTgvBeVKgVHtB7xMeJ4=;
        b=R4olPoqy26niakzaQFV+EVPBPQSPafGhGoUtcqeuBF3N0j81SD0Whw+cCEoJMnDi9W
         VEqGI9HdsGEhiEM+DqpNxtFmK9r9gAMuJ3QRY9yKqxir3Aj4F+ulu3hrDfNGok4+UQve
         LljBS/fbzajGboklq0x8YzAEiQur9GwZcWSTLcevJJe7VY4AUHNUK+Qi+z3exBJAw2B8
         x5lhM4c4WPKM4ITe0bHRldum20fYIyYhoWlhe8o0OQiVIPaEjkapDINs21bj0L9vAqrg
         8Rpbc9ajzX4betrBOA2t/N9cvsuuaaXDlg/So/b7xT33A8Hsw+YhkLYOozglj8AkE5Hd
         /qrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746661368; x=1747266168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hckfD0sziqBh1sSWGP9c0OUCVTgvBeVKgVHtB7xMeJ4=;
        b=LIZjFrQK90YK/i71qfI2II3wNnvfjshEJfkn2xgEfFx2dG26R7cGb74pBj4aI3f2Vv
         Bz4ffzsj9JxwVXlRxK/KLeRumVcYOrcg70MzbH4ezjT7wfjGaF4TdWiABlpyAZpvXe9L
         nNn+qTNT/3oKY+vI0knKi8cKzoJq+csHjlzU0RAxukr6lMUSQw1UgG6qOak64ITRYjTL
         LswNI7Wz0aPFpNXHBsA/6M1bt80sRFRp8kYxJokporVxrkJHfMB6W+zaTRe9g8/2R73P
         doAuA1Xk0qq0z1Gq3aUY1noEcNQ/6pEf19GhzwlZM11o2Gth2/20AOPsTq+L4D2geeZM
         maJg==
X-Forwarded-Encrypted: i=1; AJvYcCXu13pih1+WTKJ2VpKD7fqnqFqR2CZiB/7U6RDCHuzl7DH+WLT0JO4XdwmIKwzo/BOtOHwjtpRZoNJ51w==@linaro.org
X-Gm-Message-State: AOJu0Yxnw1O7eodmmENoSJYL04uLBfM9XNX3Tz2YPfttj5rkKxs41xkW
	sFFLas0UH+6zh4wW6z4mvbi0ziK3lnietyHZAPoBJH92dThu8xo8TtQjQ3UGCyS0zg==
X-Gm-Gg: ASbGncvWVF2qLI19mdre5gPbwmdOq8RDajIE8zpmYeh3z7O/u2i3H/0PnR0mTPt5rHZ
	kzQSZwxsL3zf8RNcEJ7vSl6CT73rWcXguwycWXlRPl9buAD3eXPdCiolOM9A9x1Mhc/YNttp7tb
	RcLMZ71KSz+e9u5iHrPZABiunWmhF2CQBKnCQF29h2QxzbAdkYviAuGKZQvdjgVIlMo+6c0wnZU
	zTHwwTrs1wi7FYQb+32Opu2GBhKqsVPwlyM4K9p9Zx0DnMCDbMZpXa64AtTUPmjcisIf2LBQSyu
	iqi/EBr3PnBFefjcOtRdp9PfJHdbQKi/n0aK6pmPqDSNQ9XBaHQ=
X-Google-Smtp-Source: AGHT+IHhqOsHNXPZF4TnzOtAP6h/+c55CQlBQVlH/8L+pGzc2viJ6SxyDzkoMnBGSlSBqkYi5ON24Q==
X-Received: by 2002:a17:903:d1:b0:224:194c:6942 with SMTP id d9443c01a7336-22e8dc8f2dcmr14656095ad.34.1746661367784;
        Wed, 07 May 2025 16:42:47 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e815806fdsm6491325ad.17.2025.05.07.16.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 16:42:47 -0700 (PDT)
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
Subject: [PATCH v7 05/49] target/arm/kvm-stub: add kvm_arm_reset_vcpu stub
Date: Wed,  7 May 2025 16:41:56 -0700
Message-ID: <20250507234241.957746-6-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
References: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: EiPu2CPiELQM

Needed in target/arm/cpu.c once kvm is possible.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/kvm-stub.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/arm/kvm-stub.c b/target/arm/kvm-stub.c
index 2b73d0598c1..e34d3f5e6b4 100644
--- a/target/arm/kvm-stub.c
+++ b/target/arm/kvm-stub.c
@@ -99,3 +99,8 @@ void kvm_arm_enable_mte(Object *cpuobj, Error **errp)
 {
     g_assert_not_reached();
 }
+
+void kvm_arm_reset_vcpu(ARMCPU *cpu)
+{
+    g_assert_not_reached();
+}
-- 
2.47.2
