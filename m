Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2178908njj;
        Sun, 4 May 2025 18:53:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXPjTG+ekn89DXxj91cAN2TyhnwJ34kdCM+oloZFkLOLgnqGOcWIjKjljhgJhkflZtodA6OZ1FgJdtLpA==@linaro.org
X-Received: by 2002:a17:902:d505:b0:224:76f:9e44 with SMTP id d9443c01a7336-22e18b660b1mr86803865ad.8.1746409982213;
        Sun, 04 May 2025 18:53:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746409982; cv=none;
        d=google.com; s=arc-20240605;
        b=CZwgClbc+o4qVvX847gXzOBaJNtoOUDZcgaQuXeW1edKN0wQEk/pADpAIpao0A9F0b
         WldExvzJypTiFCQk0lBGuJgyLy0acnHkDHxR3sCraG4PlR175W05StVntAeNWLL0A29z
         sulVDVdJVSciR69FnSOfgoHjIxS9VuKPpCviLx492bTcQ+8ZsxR6Zlibxl3IlF/clZ3E
         vJSkQwengCKL8dDPMum5C15fbKeoMLkUJ2+XZz+xhEXdY0jOJ4wT2upf0JSEaToXdtak
         auQfFMnErRkooZ4G9lvQVINL+bxRJMCfXAGZvpbvSKz+k1lrReWWj4rpUrj5EviVN+Sl
         GzJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=oONThx//EO5WSiuREF023HuwIIuJ5yNwT7cwhGAiXZE=;
        fh=kAg+WNilP8gLQJYcgwAohxQbkTjuFNgKZxaajuBRsm0=;
        b=DouIXnjlCGSyUO/Gocgv+mYUf3PnGESHoRfaPTsb0YY7TIvfwviNEyYAaEQv+xBBec
         TyPAFVPh9rD1YM4QOVzkKf7hA1EzHVTxhtO5nPWabson0jZqJIAF74wHWwUf7Kg4Q9ow
         s3+2vgHF4Xyus50fok62fz5F1PXQmXEWsphGcictqBKf9lFzIR4CiDNM6UxIaHn/PjZq
         xY4CEs0Cg/Wm8bdeTE4W+wKcpGwLgDu99vZsV/08F0rrQVjnIjZMuaGuB0OBRJLIR/p/
         ttx5MggMSHw6+T7EIwmJt/DWBokHNmknDLEkXHH7gCj2oFwO/HjP9HuCIfwWC+Qi1Ymx
         sCZQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Es5mxisC;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-b1f9d0d7bedsor4721632a12.0.2025.05.04.18.53.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 04 May 2025 18:53:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Es5mxisC;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746409982; x=1747014782; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oONThx//EO5WSiuREF023HuwIIuJ5yNwT7cwhGAiXZE=;
        b=Es5mxisCj6rLt10NQDbHm9EnKBInPmb+1q121ajjvPEPl/5ZyTSwaNmoyjCk2IMo6X
         l+wasEftQPIGM4/lL+sVNpDjHxvf3cam9oN1+wWr+BTzT74zURzGAfqM7DWtzItGFmIm
         DMxZ1b8GpDCyX8qGzsG+GYG3qdTWe8Gr1ADBXCB0q/Hb2Kul7HdqD4/IqGJj7vxSDWTP
         WYYpmcq9ZXzzycmzB8XOyx7ACkkfzJRIb+cRWVrq1Wj4s5bReC+xXme6tz936TDfgeD5
         xf7C4uxjBKnWZhiWAESja3SrX9DPxldHh33unF0iCLvKdt6Gt6B7hP2LJVkYP9bl7mQX
         IxzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746409982; x=1747014782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oONThx//EO5WSiuREF023HuwIIuJ5yNwT7cwhGAiXZE=;
        b=nRZMSnQLcN1c2shW7aayT1kX+BfT9NF7H0j+0aQgzDAXjljw3XqS8fNuf6xj4EBQXs
         psMmj53n60O1mJEemxYFyBAev3GB7zzUPoArFf/ZTvcgjIYEiF49XMKR+TElUf6CVLEU
         djwA3uWEz/00kNE77bw3z4HUOmHUZHmfRddGyvx+14RuTDxsk4aa2J04cox+OI9gx52Y
         TnIibzW4+pf74wkivOKiv2q/En3Iz1kgkY/lvv27TuCAidAmcnjfx5hOM69DRkxvjKOt
         eHc0UkOH+E+8MS9lofh+2xn7MGMZFXeBdZne4ArzoxcdEh6xMKYdiys6t1wKmGiqEdS7
         +qlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNiiGFiAgpvEh2gfpmWzqHQ/pxjwBcUQ9qd/3tOF8n4jZUnOSZdEiz2VKYAFotQXWRwIE0jc4xxxNvjw==@linaro.org
X-Gm-Message-State: AOJu0YyHmxWcgIIvOADZny8nxMX7XjfVR+t9AobKHMPB+6pJ1Y08zMjQ
	6FVFSvkmZUj2FDqSvTsOZ5A1oC8jWV2b3ALeVbLhnONLcxfT5jYAzPBEz4F4p05zaQhBMddqGvF
	to1G3EQ==
X-Gm-Gg: ASbGncvKV2t1WPT1H11lex2eZl2VJkxuGCEMmtp2queNc4yv3KkV414VJVtZUgUU3d/
	nA0AC1XpPAmlRxRTNY4QoKM5oujTZI4rwtKkhwZkhGeW5b77GDloz7huov1/hWbXNJ5XhokBcnu
	X3tMfR5CS/+bwbX0Iala6eDyXWjt9rIh4Gxupcoq5e0vWazCHC7TBfvHZVaPtb8s0dpgrOb1fVt
	VqkwhYoweACPNPPB2uR45wFJBVzTdKNuC5zmdrojk5SZYGP3EU3XNOFWQq+l8Ke844fXmSmpwPM
	i1vGPmt78C37LcAOGYucEyKb0b1If6xFFHBkK5lS
X-Google-Smtp-Source: AGHT+IHr0qzcLKdRFzKhMCewLOWMtdB62i1QsUpnVafjImETUYvckCkVS/LSQ7CJAssIR78evsGItQ==
X-Received: by 2002:a05:6a20:3950:b0:1f5:8b9b:ab54 with SMTP id adf61e73a8af0-20e06823c71mr10780816637.23.1746409981839;
        Sun, 04 May 2025 18:53:01 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3920074sm4462101a12.11.2025.05.04.18.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 18:53:01 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	kvm@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	anjo@rev.ng,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 36/48] target/arm/machine: reduce migration include to avoid target specific definitions
Date: Sun,  4 May 2025 18:52:11 -0700
Message-ID: <20250505015223.3895275-37-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
References: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: cf2ce4g5xKiu

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
