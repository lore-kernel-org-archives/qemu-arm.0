Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2397011njc;
        Mon, 24 Mar 2025 21:59:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVykuro/qq+bGUjIl/m2jCtHvGfrUD2C12s50tv0q1gDZ/gLT35x4d6ForqzrwbITInq2qhmAdnVrgAjQ==@linaro.org
X-Received: by 2002:a17:903:2f47:b0:224:376:7a21 with SMTP id d9443c01a7336-22780e0969cmr233452125ad.42.1742878771273;
        Mon, 24 Mar 2025 21:59:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742878771; cv=none;
        d=google.com; s=arc-20240605;
        b=LzDMlHhAzuA9ZPniOFE9wGWbocswufvnIje4BR6unB9UyFa/jHT96Fs0Udfgtkc/yw
         VHNFsUOO96pxtvJM81MPZE7YUIufn2eONv3f80r/OwRNrAHJB+xCXjmjJDtCAHtmjSzB
         kXgSWmOs2/YO/qiFpbZZ/Luz9IguR6IuW1rNJ9k1Veig3V1jreCQZl2YwASzMm/UqQaC
         DB5Gg76XHaIfYKr1bK+SwoUt3QSrfeLJaPOvo5HdC3nxzeKfLk8wkAWOyAf8ujd3NoEZ
         Z3rPtm+QhraKXM8LP6iGHd7pym5js7aBtefl1ksKuGe7WoCBKUtHWQObnkYRk+8xu64T
         MAKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=4oOs5VbZVOvjmzXBjhiG3M4+ph6BhOZ9OEQr0J3OxEc=;
        fh=8iY9zrGuZmkLkRIXed0zLBjmjyfqLHcUOPRaWlh78sE=;
        b=M7aBQsuQRccA8yDpy3Qv+pVuPTAZ+40jXToD3u/Llc1EgofkrvKsmRQcL/2gOP9uz/
         rhgO5nPg2IcqZBsXgsAhbbMPp4OhUcsehCw4dzKKAMPnxWAs75qupmBj+oWO4hkLZ/6k
         msdAYK8beYLftiiDCSo+zlb0zkS79Sh9kO3/39hjhq/eXAmMzssNpteoNR4xbRG9wvac
         jcL7/Sd1ThVgc6Pa5eV3zwXmBNJQ7d9dLcHC4c6TMi3MUs16iHHaRbEeTgUNUk/0ESqB
         BLVz6U6oc+g9AGsC1gjx/HSDms/avTahNnRnOqwRRKe9ZxVyTkGT9VI6T32X6XDddz+b
         QKrQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kMzYsDJT;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-227811adb87sor79333805ad.14.2025.03.24.21.59.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 24 Mar 2025 21:59:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kMzYsDJT;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742878771; x=1743483571; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4oOs5VbZVOvjmzXBjhiG3M4+ph6BhOZ9OEQr0J3OxEc=;
        b=kMzYsDJTSGp5w+R79neeTNnx2VBe/IxnIEzng1z58aoBNTEUSeX6fh1bvARIwWGtJx
         kMjPI+++WGj+KuBoeS/GdMizumb57V4yorIGVRuYJhZn5m2oyYnDYFI1usS0eU2D7fmg
         tdbPvMH97Oq76yrQ0wiGFKX4L9/cwGOXX+wFdKCyI62kMgukzyq3VvTKfD41IbYVuZVG
         NJnhXATXWSQNBHvrjdS9IVZApxeqAPtJ/Yy8XxPC4s8KQJmjcI7cQwVXc8OD/wtstxJh
         5fL9B6otBVpXY+QTVRXdzjnIBiA5ceX9toJYCEknmfSeHjek8Q16D6TkPWou1dVZd30W
         aB9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742878771; x=1743483571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4oOs5VbZVOvjmzXBjhiG3M4+ph6BhOZ9OEQr0J3OxEc=;
        b=pezVXasi8kgitOHo8M4We69NXnKP8FJafvDPyyaNvnMyqznVqFaUw7WpwDma3Jh3zz
         sNuCcMrPvEt9p35BDBaIxlfmfsewRpvZaN+BjqVXbs6zBZSAJReiRyIEtVd1m6Ud4nLV
         Gvq/1ePUjjmaBJRYRsE6uPtBH7TzlY3Wz8sQ/XQ9ad7Ata6Cm+aUMWF6Zfdfj6jyaQ4+
         KLsDQqfPHkafZg8BTfqOs0iL2lHR1WsmG5l5nY4aL+8BCxFJOPBpCUSI3PgTQmLWpU5v
         4izRuiWrAY0ccMCJPxSm+FN6LaBshlU1FgFkvkjPHI+zuF2hSMPG1+M5UQBEIGCK7R51
         GvQw==
X-Forwarded-Encrypted: i=1; AJvYcCWxu3teo/Lz60MUSrf4ijpf43AXxb2w5QkDkxZP0rHeh47GrykHWVl6fwmEG1MNcMq8PjQHynd55d2NxQ==@linaro.org
X-Gm-Message-State: AOJu0Yx8NTdt0kadJP2Faj8/ouaoiJkj8QNCc4F9xGAcosXMU/IlkKsw
	qSisFfZeLpx8+JogWgvJTNPXXtzSF4gvWhU+4e5P6IFA492lwdrrazXfnoR05Hm3qA==
X-Gm-Gg: ASbGncuengiVzE3CDk9uNzMs7UJDTYObLherdjr/FaSXEwTO3vP+XA+1E77MmA3EbCW
	FexDVcFMdfj+vgleGpmldC0kcByteKCy7f7j7a+5ms1rgHK0CVA3+NAgN+BIWTZL7dUhcUYwfMl
	mt7aZ+pBKJSmLFXVOFXQErhqsieBIaLR9d3RhYoe1IOspWNJZfbevZVBNP8Xe74KMJElO52Y/KZ
	UVEcEUHD3L6teOeTyUxl31ZA5UOb8HM17GVK9CjcCWPoY8UTLiUxAh9KGVJ26kHUx37/1bU0+H0
	bnABhdvI+Zmk9ntuhfSDolrk2wIGuPOw6brvNCOW04qSGOTj/0qEUH8=
X-Google-Smtp-Source: AGHT+IFMmlkYsXzeL5u3McRmsvIC3ugcT7OUO/5VRCqbHDoGqy5n9HjN6AzZXS/dqwuovLHKOYS3Dw==
X-Received: by 2002:a17:90b:4cc1:b0:2ff:5cb7:5e73 with SMTP id 98e67ed59e1d1-3030feebe86mr22119927a91.23.1742878770766;
        Mon, 24 Mar 2025 21:59:30 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf58b413sm14595120a91.13.2025.03.24.21.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 21:59:30 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 10/29] exec/cpu-all: remove hw/core/cpu.h include
Date: Mon, 24 Mar 2025 21:58:55 -0700
Message-Id: <20250325045915.994760-11-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250325045915.994760-1-pierrick.bouvier@linaro.org>
References: <20250325045915.994760-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: wUDBMeHO23lO

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/cpu-all.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index d4705210370..d4d05d82315 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -20,7 +20,6 @@
 #define CPU_ALL_H
 
 #include "exec/cpu-common.h"
-#include "hw/core/cpu.h"
 
 #include "cpu.h"
 
-- 
2.39.5
