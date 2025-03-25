Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2397172njc;
        Mon, 24 Mar 2025 21:59:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXEk1oH3EwCYzSHdsullrz5OW/PfTpe1QaQGLg6udGAN8nVMvWBt6+X/ADq3I8sHAyDMGSxSZGMz2NAtw==@linaro.org
X-Received: by 2002:a17:903:8cb:b0:223:33cb:335f with SMTP id d9443c01a7336-22780c53ce6mr236548565ad.3.1742878787909;
        Mon, 24 Mar 2025 21:59:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742878787; cv=none;
        d=google.com; s=arc-20240605;
        b=A7kJxqilESGi/YpeZr9hZ3KtTtPh/sZY0E42qpp3q7VrQ858drngfvLWHGvM2iW2XO
         b3d3YBSwarFkZE+Bima6GMWfz+xFTGqZIhWDcHrtE2qD/XXTRLnHiFro83e77dzI+l5T
         DXZf/qHiAGKqEnPlvqyOTswl4UejMLOPDldS+lTUa0Vjlz1EHy2WSUPaWkENJuV7pVsP
         JlyADgpHj+J4r77tY1nHjPJKinEc7AtxuBAUUYHc4X0RPBhW7XF3kbmgPufGpC7pJb73
         ZPCl/7oKOs+7NF2StuY0G1loO8ohv7gDZOF0FZABXe+RhKunYcEpAPU/sD/US+DMhFW9
         uEOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=CSiomrkJehve/L+8sWorbqlbLNaYCEo3w/Nkej8WFsU=;
        fh=ngCoFiizLs2RV8t2GuAu2811Pp/PdbKQsaCJ05ZlZlk=;
        b=P4Hkc+8ssaTJSAnMxk5zpxtTcq/MOYwlSlaTbHByVWgzuErGzLlAAlYiub2XK7gGiW
         oYbyhQJtd9z+VFUDzckzV3p3D9IHfhxmAx33wTMYeTRhRuELwxiLWj8IJ5jcGVUyVh1i
         cgulrn+zeOMKarZHVRMgCYF6pFDGqR46eIlRI4vXOgi5A18xwnDQdAoorVuZCVuKOAzK
         +roVn5kJM8EXg/8kPFAnz0e3I9zxCCr8QRPmY1yGBSY6BjbiLuaIfauWOT9yRwIrqFv6
         +8xbBOQjzFeTccXF4Napeq1pYAgMQsvHAX4lHSwwNt17EXNBZB2qvOuggEzWjZXPqDSL
         chgA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=t2DPd0G9;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22780efbcebsor52096945ad.4.2025.03.24.21.59.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 24 Mar 2025 21:59:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=t2DPd0G9;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742878787; x=1743483587; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CSiomrkJehve/L+8sWorbqlbLNaYCEo3w/Nkej8WFsU=;
        b=t2DPd0G9TIpauhaguxVFe3vS3CplXsliEDncU+zwKEg1HEHslARLntR9B4QeHjW8Db
         hZ1r7yxaDfixu3Z44kUGmWkoc25aVK9CJPZW1eTSlOQfH3Wv6fwkoFmmcPUI0oJmgYh0
         LOt8KDv8ARDSCt5/oAMgcQUNYGcT6RCbn/YlOn9GzTSKae1RZm22+xBgq8YOPg0nHkCw
         pNuD6YROvcp4dMW3oyv9Mw/7TmRVKdhnK+x+FjjsqdgmkbLbCSabfhD3B5mX+5f8N6/l
         ckNFHYACUdmarSSCA9Tg79kJaSgTC0lOR/gvBCsOoXCL89rwDYVHRvgDlNQXRKMNXv0i
         Os0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742878787; x=1743483587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CSiomrkJehve/L+8sWorbqlbLNaYCEo3w/Nkej8WFsU=;
        b=NU4B8AIKafgP+Xd0UpImVPquFrfgxH0zMbZUeW3ZIvYgbn2pgrY28wOKG6mEaqhtrv
         hvmcoelY8u/lgsdHHSUMvVy5UTD0LZM8i+iPUUwFBAfWrX6Az0t0Vwgk66s3ixCE0FIP
         ESeKQ8MCk2KVBmVHAwOEX7Ma4j0BPJSlqkXEzQXVUHfstFlZb1SKcUgGCdHUp4KuoeRw
         mu3LUUV1aLCkKJXaOsjswNzv4uvKOx3JIzfNeWabKH8ttfXfmwl6ExHZGnKZz/hY/My+
         fblK3r5tGVVEy6xWTGO1xFSms14w8mHkYChoKa4XfCVLuXDOFXltfbG8Rn4lhTi0fbD+
         PRFw==
X-Forwarded-Encrypted: i=1; AJvYcCVrkk6clYvbNzLna6RRza0V+hqFsVM60cjWKk39t0OZww/qlrIn8JDLiNq+SM4IaWac4w0Ujrdp0nxAWg==@linaro.org
X-Gm-Message-State: AOJu0Yw6RitfQj/9Ht3UPN0fikViq8EdZb+F/Q85RRTbfBPT94wShoT2
	dlbEPBgKPDZL2G3P+88W2N/tBQ8Xj/IZ0LeDn4E1jnkUHk/A4EEwI/LD2+Vzl/9CGg==
X-Gm-Gg: ASbGncsL97Ah8uDwradsF9zdV3xDXooCmQVmsRS3noJZo86xc/S2u2M49RWkFc4xyfQ
	aOOz/R/plOPzOTRkAmnrhtcD+L/dqVKSN46VHoC2NzY81eOa73NssECCBq0QJohofFCOHVu1UU8
	LAJ+sLAfrU74l0V9xLmXFBzu00/8Z+r9vimjA0ROUrbz2DAQ7FHz6rQGyKpHaFnnwzOeTlEwjVY
	s+DDyCOKmzE7/73kzxEprOwxKrEuL9/0pJvNKScUhWdI197HMv8KdsZc1FiViJhJoRC1fFoYxZc
	I8wZvP7cVoDCk/enSDAKpYz/1smZLXN4svceKnc7brB1
X-Google-Smtp-Source: AGHT+IE+CatLymkvFC6uB6GAY5APi0WQOW6EQGEeUyVT2LFSOsFWDTpOfPwIrlpBqEe5gBdtrM10Ow==
X-Received: by 2002:a17:902:e846:b0:223:5c33:56a2 with SMTP id d9443c01a7336-22780da6237mr279448325ad.28.1742878787203;
        Mon, 24 Mar 2025 21:59:47 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf58b413sm14595120a91.13.2025.03.24.21.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 21:59:46 -0700 (PDT)
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
Subject: [PATCH v3 27/29] hw/arm/xlnx-zynqmp: prepare compilation unit to be common
Date: Mon, 24 Mar 2025 21:59:12 -0700
Message-Id: <20250325045915.994760-28-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250325045915.994760-1-pierrick.bouvier@linaro.org>
References: <20250325045915.994760-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 9OAsPhc0LBjm

Remove kvm unused headers.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/arm/xlnx-zynqmp.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index d6022ff2d3d..ec2b3a41eda 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -22,9 +22,7 @@
 #include "hw/intc/arm_gic_common.h"
 #include "hw/misc/unimp.h"
 #include "hw/boards.h"
-#include "system/kvm.h"
 #include "system/system.h"
-#include "kvm_arm.h"
 #include "target/arm/cpu-qom.h"
 #include "target/arm/gtimer.h"
 
-- 
2.39.5
