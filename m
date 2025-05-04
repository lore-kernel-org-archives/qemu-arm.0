Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp1756221njj;
        Sat, 3 May 2025 22:29:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUHHIsbu4c7LkY7I74v5lpSJVrMxaCjKPsoCgIhs/K+aIkmvL4RHkSWE4tLrpUdkfBaUtP7MjvTVbqxnw==@linaro.org
X-Received: by 2002:a05:6a00:420c:b0:736:5e28:cfba with SMTP id d2e1a72fcca58-74058ae70aemr12813628b3a.18.1746336591970;
        Sat, 03 May 2025 22:29:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746336591; cv=none;
        d=google.com; s=arc-20240605;
        b=GFwrUppOxRDeo+sObnQgWv2Bqtz1WyYwLZQVrbBLfByIN4/E58OzvnCc7yDsci8MIK
         5QWhK0JznCossLOGT2CO5T167xZQTfiwPbOVp2xNCCvYKWS9NJCcY603F0/8tq8dzkB4
         5Y3FDEyiG9esasjSr/bzak9k2xQXQ5h1o3LruOPyZBVZ9+nu3OOzABmrcoAL8vvo+NPg
         lpLgm4/AzdGuRJ8mFH3lxDjqj2jVmMT6bHAar7kmcSekewLccahyILlfmAjx9Ak2KpPk
         UPrw44GXNJkWW7a5GezprQfY2agdNcWAwaQ8sngjwcZtzZBkh4MYXYTjjHe6OFULMYL0
         6Isw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=0KjypDvOEyLd05aeE7s1LeHvssR3Eurt4FNPjX1WjXo=;
        fh=0JHjRq5p2B7o4LjbYH/78uPRgzf/9KgDe+4xbjthy4E=;
        b=b058WK0bsnR67O0/OX9sYmJdg7W1Wl5dsGvBRMy6tnXeEqnkr63pHkOdLStZnN/KIP
         LriK+TVrGGfjV0TSf0f1Ob5MyOvUw8/wh0krtktiLAbgY8kCu5OKqCv2UWCYFRCedQAH
         lg4u5c6TuECtSpBGWke1ZXF/uZKLr969Nqb2fP2/D4CMZfUe2gZSdaPpRp/UCiSJPdiD
         f2aerJXi48zDKbUjryP7WfMD3BW8kDdZtw5OtSgd2sBEaejl4VJ0UbV9MDfClMrt6UWP
         lO/WHKjGIP52r5FD/b2lfrgXsnmBVWPorl2YnK7BTIu5o2aJ0t021+Gp52ildU2fs6T5
         lGxw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WXXAYKV0;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404ef17cc1sor3371383b3a.4.2025.05.03.22.29.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 May 2025 22:29:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WXXAYKV0;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746336591; x=1746941391; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0KjypDvOEyLd05aeE7s1LeHvssR3Eurt4FNPjX1WjXo=;
        b=WXXAYKV0NyG4fUvnWX23GqFtrG9TNKrP4G8X74wTwvJr2vCqvW3kquSDZ21IDHO4/o
         3ZOzxNKbIQzvF/zXi2GcHuAYCYnSOehMZqv5fiaDczpiI42+hZcr61ZF+JTMGw9VXd5J
         B5YO/5rfCC5XUHuTueuw4OGKzvDe1pvJamce2XC9BVrybLFiZnIrsCBJAp7xi321rFYC
         0rBkURaEkrvz0EySgy+j+Q7x9F2YlglQusBuw+ChW9Y+p4wOZkM3H4R0IkUACpZmS9nE
         7pD0AwHYE0/PezLAU0SIYqCnfWMyYQRJ/sUkXop7E1gl2UDhcmV0qfHYCZXHxifjdTk0
         nRsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746336591; x=1746941391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0KjypDvOEyLd05aeE7s1LeHvssR3Eurt4FNPjX1WjXo=;
        b=IXrinYOWMFCJHLkYzhApz/nDo4nzt4Yv6ihDGJgkcanG4+PrtDrSJOufbbbY0JEeJo
         B+5NcfxfwAwG0N5kbd1AZ2CvqD5Y9882ZWQt83FvSeM1otu83uAA8ibyav9KWEgq2Jrr
         12yoqL+tglJHQc7za5+4sufw/8SvWc2k3Pm4wZFt2zVvBFz/CSpWfbR1QFDYzw9QkWcJ
         Es9rQ56ea87SZXr08OsrF6akDxtu9MwRoeg/Ko+rIcCsrKTVfrsE4bpeHfQEGdXceeSA
         GSnnlFIG+KkXQGyF2eSqOBk4ZrdflfDcIKghg0N48PsIJcoGTeS4Nl+LSzlBSEdCLf7W
         2IWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUl1tNgEyX+orLetC6mtxYKvB3o9/PnCU8QwWuVNKhJ3eYP373vMVD2twhPhpTD7V6W/yfzzq0oGxe/mg==@linaro.org
X-Gm-Message-State: AOJu0Yy94GeRG8RF6TdQ9LgXSzynKshskxuj1kmopuuy9yEDZEdxE2Je
	Wwo1GdqhJJuCUQOMZxbhBSSCCI4GNk4fP64uxVZ0adlrpzfxFsnrhmRIuXA1LtIwOg==
X-Gm-Gg: ASbGnctkVYYpEzWZcb7iIG8Xu/SvDkWwKgrS7hS5yiHeTND4CD0X/HaVd+Z9UeEcsPS
	GEA2YFlJL1ak8QJAHMgIkSbEl1TessXI1XtRuYZ39UTqkZXN2GzmiE0sSrvRnPSXFE25SV+GGil
	tjmOktpUQJdjtSjSwSgJj6Y9gGQGZNL8SFP9ajJXnBXRNXFLD4JCZOF6YmDeshIGUiH8jjsAY9x
	68IBm+rHP6fkOiEprMuNmxQaqqEeeec5qBEuhkfEeDHnVTeuAhdil3NFFN3S3A/cPplIdWKeJVB
	7agMrw+2uD3HppGZTU5sQcUi+CYeN7+H2SkXtKwJ
X-Google-Smtp-Source: AGHT+IEHFx3XlGD3TXNpfIJs6MWCdr6hv+E8rDZjKYKBFe/d1SiWDCfxWojjHKMrjf9s3puH1FQGBQ==
X-Received: by 2002:a05:6a00:ab86:b0:736:ab1d:83c4 with SMTP id d2e1a72fcca58-740587626dbmr11929604b3a.0.1746336591648;
        Sat, 03 May 2025 22:29:51 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-740590207e3sm4400511b3a.94.2025.05.03.22.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 22:29:51 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	anjo@rev.ng,
	kvm@vger.kernel.org,
	richard.henderson@linaro.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	alex.bennee@linaro.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 36/40] target/arm/machine: reduce migration include to avoid target specific definitions
Date: Sat,  3 May 2025 22:29:10 -0700
Message-ID: <20250504052914.3525365-37-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
References: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 3/AUOTLrIQFL

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
