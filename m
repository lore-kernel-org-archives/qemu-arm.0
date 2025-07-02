Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp73500dyc;
        Wed, 2 Jul 2025 11:58:44 -0700 (PDT)
X-Received: by 2002:a05:600c:1d24:b0:450:d01f:de6f with SMTP id 5b1f17b1804b1-454a9c7f6a8mr10191475e9.15.1751482723781;
        Wed, 02 Jul 2025 11:58:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751482723; cv=none;
        d=google.com; s=arc-20240605;
        b=CZvYlgipunwRoVH6HvJ4ufYBqgBILKxPSbaxpuHkCRfwkqFYpd2F7Dm8T6tpskTm6u
         FvclsuZdCTXVJ/l2Ix3qymnfNp7XVF6Q6r8OhxRZRyUCZyCc2ZLWkUj0TUTVlucE+Bry
         9ABvU6rDiNVLNwiD0Pzkg7P99MxFJ0ACNSpj4h80VGRyMZmZ6L46piFk4RUqI2Rh1u/u
         XuhPEY0kq5Zu16kH6ZoQg7a/9CM42Xptk8a5jtSHd7HlSh0z6OBFOyzEyiDGu+KChJ1g
         a9wC3RgF/TOXybn1ebp5JGx5+xb2R5KAZ4ZN1jgz7vTAenb5IjyBXae3+fZHIaJ4W8Xi
         78tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=+E/J0LnrR39EtKwfOEb6mQjjQJ2XUYL/z1tOblZJ55o=;
        fh=2hZXzuf3xk2f6pq8vdd1ctoxCpF0gFxrYZClGSg7MHQ=;
        b=XnMETvSTNVYsRaR91aqz4/h2dxo9V2wUEmqs12EypEmHx2F2MkcNpGq5ImxRGpkpvD
         bdxpNA4IuinD+3jcGEHFlPNT4E1W5Xe4oWGTedzBOnijm42nAvy7KaK0yN92j7HNbhEb
         IYbx77qxdNqronfIce6N/rs3t3BtfFyN9t6nPlNOk9dZeuCmlYzadOLoQEvzJBtF+xJA
         Cv7NoWSI4pYR9Oc1HZZ1HcZ+IYHMjPc9DMBqSbPGU4m9N90vaEqN+170xs/XV+k0Dpv3
         JEdZhaR5VOMP8d86edN5c8TCWZZxNGG0rkBf7o2oZSN35PzuBZy5IJv/S3Y6iLx/ELHN
         aqQQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gGdRn1Y4;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4538a4050f5sor60988605e9.6.2025.07.02.11.58.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 02 Jul 2025 11:58:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gGdRn1Y4;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751482723; x=1752087523; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+E/J0LnrR39EtKwfOEb6mQjjQJ2XUYL/z1tOblZJ55o=;
        b=gGdRn1Y4AQ/rlgmfvy5joF9mLjepdC0TTSEn3PQ8euD7BD1w+gpQtrodmb6y/mb5RR
         kHEHkApkWr+9haQm7Y/4IA3/temCn3g2cKhv9XYZs8g+cJo6bi432ET2vu5YkuTCFIXg
         gPESNpVlYWSKMIk3EiVGGyGH7gDEyyY/EnnOR+tPeh940qYYVDA9XleQENCSLaiS7nYs
         dG03L2H/czeerKT4KDmvf7gvQQOviKZXvAkOgnlZejH9t/WqjM8XdsgF0wU1CKkGOfmr
         gL1aIWUqD4sQNlu3ZtsXfdgd5T3l4MAP/TTAXRJJD1vZe6fZdNuLW5UtpTtoWG71XRDC
         zDfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751482723; x=1752087523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+E/J0LnrR39EtKwfOEb6mQjjQJ2XUYL/z1tOblZJ55o=;
        b=UKWuV50PVl0AnSqt19m2rrfjee0o2xuWhccbbYlsIS59qqp0fOc3B7Cfz2J1Ai+dQu
         CR+NHsGwXM3TZkjV1JhLL3FZhJsJ+Ydyk1Re+QLj2RKplz0saf+y/IQGBA94zrTHQZs4
         fihroVw6/QWs+JaAJRgyhKLUR+PTadP+iUH/kvLJs/2pQc4YrhTbaDtE37BfGHrwoV3J
         qxWuDXgZxl70dIR2A9KQmr0txAnOUQZCxXY5sweoftJzk+TGCoVuD8FKHEnquZuAQmw6
         5uQpQ/3lr7KAyy3qvJI6Fs+p8tr2p9ipOIptP5YxUOAmHQyMOIbhitakEQ2iv5GcxsIN
         XhBw==
X-Gm-Message-State: AOJu0YysLklTCaOmOoxgLqpjc49ezWi0cVF9EUSvAPyqnkw07eU/gRxZ
	VQ8VX7QtaEOUQ6HE9ocSAoBLvx9WzwZ6TvCnXwBDlC3aoT62WztgRbwLldyQiBovtpi03w==
X-Gm-Gg: ASbGncu7qi3omARN8iizCG/Xdvw26Qzj74xHdriJ2c2Vlt9iVX6RWa9Da84MitR8MaZ
	khdHE3xfZ9lZpA9N4mbr7Dm/Ook3wD7zU6EasrC7H4kitcu7FxZEymlRHS6cqIwEcW+Qef+AQcc
	IcJ1T0fr37ij01aOv8fI6fSYkoCre/5NLZfdnSxJAtmVhheHglcbsSU0QXXoR7TVOU/HkTvRIL6
	1mcix2QCagruACYiqe9qroKdaG+ZvUtp4K+5ofCWAae3bHKosmBtV/b4dzL9sR9kcPlUSPp2U+7
	eaEz+Xl4DD/yIhovTxwp9KImhYmwC6SiHHDjwMPKXVNvLsYrs044g6b2iNoWjgr2wxQCDRfLG+L
	CHy1wDiCXbdJ80D2eJa31ZRgjgciOY2jfCuuX
X-Google-Smtp-Source: AGHT+IGHn6ZxpPshfR5wvuf8R3zCvqso2bXEWooi9BkpGmBlEXHOWIpLivNJNaJgccbmQciYmUaFuw==
X-Received: by 2002:a05:600c:3148:b0:453:aca:4d05 with SMTP id 5b1f17b1804b1-454a9cb3b11mr9056495e9.31.1751482723163;
        Wed, 02 Jul 2025 11:58:43 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a9bcebf7sm5793165e9.21.2025.07.02.11.58.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 02 Jul 2025 11:58:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
Subject: [PATCH v4 42/65] target/arm: Use generic hwaccel_enabled() to check 'host' cpu type
Date: Wed,  2 Jul 2025 20:53:04 +0200
Message-ID: <20250702185332.43650-43-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250702185332.43650-1-philmd@linaro.org>
References: <20250702185332.43650-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: dxQItVJhEdZt

We should be able to use the 'host' CPU with any hardware accelerator.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/arm-qmp-cmds.c | 5 +++--
 target/arm/cpu.c          | 5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/arm/arm-qmp-cmds.c b/target/arm/arm-qmp-cmds.c
index cefd2352638..ee5eb1bac9f 100644
--- a/target/arm/arm-qmp-cmds.c
+++ b/target/arm/arm-qmp-cmds.c
@@ -30,6 +30,7 @@
 #include "qapi/qapi-commands-misc-arm.h"
 #include "qobject/qdict.h"
 #include "qom/qom-qobject.h"
+#include "system/hw_accel.h"
 #include "cpu.h"
 
 static GICCapability *gic_cap_new(int version)
@@ -116,8 +117,8 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
         return NULL;
     }
 
-    if (!kvm_enabled() && !strcmp(model->name, "host")) {
-        error_setg(errp, "The CPU type '%s' requires KVM", model->name);
+    if (!hwaccel_enabled() && !strcmp(model->name, "host")) {
+        error_setg(errp, "The CPU type 'host' requires hardware accelerator");
         return NULL;
     }
 
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index a59a5b57af6..1e782865233 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1978,8 +1978,9 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
      * this is the first point where we can report it.
      */
     if (cpu->host_cpu_probe_failed) {
-        if (!kvm_enabled() && !hvf_enabled()) {
-            error_setg(errp, "The 'host' CPU type can only be used with KVM or HVF");
+        if (!hwaccel_enabled()) {
+            error_setg(errp, "The 'host' CPU type can only be used with "
+                             "hardware accelator such KVM/HVF");
         } else {
             error_setg(errp, "Failed to retrieve host CPU features");
         }
-- 
2.49.0
