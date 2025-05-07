Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp94891njb;
        Wed, 7 May 2025 16:44:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVbRRI/OnvpZb+mbLokE8/ePz90mj0PjpgQ3DczZUO2uXajontSEpWBsKy8k0yjcAkFANAzxgUOLSnU8Q==@linaro.org
X-Received: by 2002:a17:90a:da87:b0:2ff:4f04:4266 with SMTP id 98e67ed59e1d1-30aac2a1033mr6273770a91.23.1746661393677;
        Wed, 07 May 2025 16:43:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746661393; cv=none;
        d=google.com; s=arc-20240605;
        b=X/CNlizxsSDXzYd5GR2CPoxfiatmNrUtWu7mSQUQQuPsO+wvRLLO2IySVRZRJuGTpX
         R5VgnbpT5AC/dOQczp+42URdFP9QMVdVPH+VeLJ56QTom7Wg5WV5T4d5XDY9+HpNpG65
         1niBeuwAF0QKDj9Yc9RncTAWxTCiQ5k4suVLCOEe4dSQYIzsGv6iXnFkMS08/8tCmqig
         8UY7v9tg/f+qsbYJ+56ZybYY3qCyypsekpXRv2ETTYuBB8vUnsV/FbW2nqPxbEEgy8R7
         IdU6oVAKgKTOURlkchagII9tJ6jYYOyUJGrQW4DTfWKcK2kzAekNglOEYh9HeJyk8h5U
         8FMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=oONThx//EO5WSiuREF023HuwIIuJ5yNwT7cwhGAiXZE=;
        fh=CtCY7r5Y0q53hYoSRO8km7moHU+M18yKo4UIn3OUar4=;
        b=dkzrzErqDs7ajuRo+Q9CWtK5Stw16Aujvjfkg/7WX+79IW7ZK6ToZm1EnSPff1C1DY
         9qz34le1RqCM5rSPULpIrfpvZ//AXgrMbJbc8QqmE/Y+ZSdrL2kDhDoMbOIA3Lo+993A
         Yu0ceRAU2sE8vlcuAuqquWxyte47YDPCcV3M4zLgV8lQUPAvZJht5p2d66SHUngukZJK
         CtobjCyQi73932VoynYsWodLPbPO7vOa79vsIpwjlnYupOaIXEOOD8+n4nnpdtlCLc82
         nvGjQeNZpeuGPolGPo5dKAU8fnvSuqHAfq84uh2lvnNDrEaWjU7sdDWgMlDT7FtcFZXz
         LH2Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fiq9SHNj;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e797ca7bfsor11888035ad.12.2025.05.07.16.43.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 07 May 2025 16:43:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fiq9SHNj;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746661393; x=1747266193; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oONThx//EO5WSiuREF023HuwIIuJ5yNwT7cwhGAiXZE=;
        b=fiq9SHNjZSfCvW+NDnz2SCMO0jbA1OLzQMlbuv0ijW5UqFMncWbNm8EMHUZUjRLE9k
         rkjuBXpXEvqJTy1k0+CSl/f59ysA031k6CoJH+eTqmQb5czLz+aRKnPz7pSOeh4hNSxm
         OhJfLe3DlKfiddmdesXioYxY/y+dbtb0G2gA34z4JkRivZMaV8FT2XT+OMbB7R2AkScV
         KnPVKenAtqwRTDqFg5MTjpmshPR+9SkHa6Nv8XgF4gEobb7fX+T3nMDvxHogLC63V7HQ
         uIMEhH/lfLbqjqNDteeZ1HvXboscBvZaYs147EorCaO+o/MP9DxewdaURhB/Tn8kAomh
         4BJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746661393; x=1747266193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oONThx//EO5WSiuREF023HuwIIuJ5yNwT7cwhGAiXZE=;
        b=PwPNy//MjeQSMrs77T5GfjdZ8c93B7G4SErF7weJ8+tIZl7eroZUy8hiV+LFwqltXT
         T4K5aUjmGgAjxjhm07fsMejegs0crHuasWrlXh4GP8Fb0Y8+hI5QlB0wVsaaCjpTijFQ
         bFZKZrD3k+/s3MZbg/VHZfc2yLpBtHK/UO7PeqKD+hAomYY9g+SPDfm6lQP9jqKcVhF2
         vwD4LfMAg+izMS7w2W582DDIujdeROz2ZeyJlYMiXnCj89flK4/9UQRlgD2Vr8sKbYcx
         vslKrRsF2Lfr3S3qUiCzYE+4WOhtErG3qsMkqI3ifBtErrD8FWbvnxqIpcfBviqxh2Ks
         WItA==
X-Forwarded-Encrypted: i=1; AJvYcCXk/vxhPVNn+oChI50ir3uisGira5PxTRXRz/nQJYbTl+I8zv1XVkubfJhQGBGqtI4SM7RKs324XfFCgg==@linaro.org
X-Gm-Message-State: AOJu0YwMadZ10p8/zmrW/wgenp8l2sXYBBjYqIXU8r9JyWt7Eqshh8Pw
	ro3/yzT4onVA/6bmwIIrAS8LUH2PuNgvuiQfKPcUUB1L4RpWREwsvH63kn2tG47KhA==
X-Gm-Gg: ASbGncv6ZA6CEchlih++uSEJ97KZ9+u1KecyIFGMizDbypFjKEzAM5qPY2kiXh0TXPU
	6wc5F55YG1xPUKvKFDnkfsndRlFWN599BHRzdwKRC1QSh8Gb3NopbfW8mXdKjjgPae7oY3xhYKd
	nmfmliLfCxSLEPwX5nh5Xxi5RUQ0jXRuD0q9q1O/IGFlK5uIq+a9KUWXhMwVRblcx0NsgpVYzDJ
	ioQ//a9y1LAg5iV/mAWsCoNvXKxAlXFINlfFTn6X+7iU7IaiiEZUN8ThrtGu9eshD0WqfrSjye0
	KvtXHo+6RAW/lq/zM3/nsNs2NW5KUyCAf/n8UTU5
X-Google-Smtp-Source: AGHT+IEITMKovnAbZDNWcvLBKoaDhbNrpqSwM3KB7CHEJv8zt/wd/TnrW9sZ9exZAx7o97xXo3VB+Q==
X-Received: by 2002:a17:903:40cf:b0:22e:4cae:5965 with SMTP id d9443c01a7336-22e5ea8cd1fmr77512185ad.29.1746661393321;
        Wed, 07 May 2025 16:43:13 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e815806fdsm6491325ad.17.2025.05.07.16.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 16:43:12 -0700 (PDT)
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
Subject: [PATCH v7 35/49] target/arm/machine: reduce migration include to avoid target specific definitions
Date: Wed,  7 May 2025 16:42:26 -0700
Message-ID: <20250507234241.957746-36-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
References: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 6R6bHjK2TMEA

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/machine.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/machine.c b/target/arm/machine.c
index 978249fb71b..f7956898fa1 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -6,7 +6,8 @@
 #include "kvm_arm.h"
 #include "internals.h"
 #include "cpu-features.h"
-#include "migration/cpu.h"
+#include "migration/qemu-file-types.h"
+#include "migration/vmstate.h"
 #include "target/arm/gtimer.h"
 
 static bool vfp_needed(void *opaque)
-- 
2.47.2
