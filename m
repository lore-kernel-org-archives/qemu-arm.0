Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp2694705njb;
        Mon, 17 Mar 2025 21:51:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXisSkl3R8+o1Kc1fp6kBlrox9O8g8+yvUn0W5OLCjlHZouQ6+QunOMl9RLdjvxwx/ImvxOSEjliPN3JA==@linaro.org
X-Received: by 2002:a05:6a00:1398:b0:736:3e50:bfec with SMTP id d2e1a72fcca58-737572301a9mr3542177b3a.8.1742273515320;
        Mon, 17 Mar 2025 21:51:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742273498; cv=none;
        d=google.com; s=arc-20240605;
        b=V2+rxGZRQ2uyzq7gaGzYXT5GnOQCY+YbNI6WbFbe0uAPHnOUtQm0hfFLNqZsySm7Nw
         o5Bd5vv59SeB4GGmZPj2y3cBujVOPGzZuhPBS6wW4AhKIh2BHyNRv4EHazvAo2UP5dPx
         q/vH3MjiTl8SxW8grAPVkfkhGsPfsB8Og21kf20TevbEBS5JKy+OXSDcEBULZIegumhd
         pKrQ9V2aHirfwo7DhQN+cPML3Dkxdu9L84fLQbG6Gtmxrx3yxYK1ur0+bxR/tVMXiXxi
         Q9LxLwdai0sgaBIoipLuSFHe++2KB6DrBq/w1QULG+rqpoGp1tV2wFFoxwmT8jrq+7kH
         PXJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=OcGAZaWPVIysHTdBCRYBHO7NUCxy0k+KHYN46Zgiu4k=;
        fh=IgQXc9yQrHwRUxuOD4L+aFbl2zdQ7rLolmWwbmFelO4=;
        b=PuRAI74feoGDBl1hOaFqLmLmTX0s8g7L8zSF5wYOxxj+IKnUzddyUjUnxAjk3EhN9r
         ZiQyTK6joTOe0lUdh1ytRqemx+XbMwTkCNUw6g/KvTrhOrN33DItBWn5zdO/BpZVP93x
         xRPrS7OxtwzoZ7HNOaHvYFd8wcWq32GPYP9Nyc02pwncudrrzj933RUvY8B/jyw3erj1
         SaajBcx+IMO9Y5zsoA3SExjcIbvGYk3YTHUHQuTLomAvCZHUXVKMXdCq9zuVKEqdZNuh
         YShR/42xFb4z9cpZQ+rYjJ5N2CdxPkAR63wZ4bZyp+f+K0FYO5xayYy4EzvlJ1m/+LmF
         92VQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gKmasMFe;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-737116a3e70sor8507951b3a.9.2025.03.17.21.51.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 17 Mar 2025 21:51:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gKmasMFe;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742273498; x=1742878298; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OcGAZaWPVIysHTdBCRYBHO7NUCxy0k+KHYN46Zgiu4k=;
        b=gKmasMFea1n6Xvj09Uon9o/4y5eGcvIvf+sXR2Yeb5C8R1joNgfUWg6LUMY3pBwx/O
         Um4ttkf/fXxCLuBTnyqikwEdVt9V+nIkFWyS7h8hJf6mvVPwAeLX3fNdD5iwFQzD8F0H
         QI2cofpbtALpf0pqJL884P9a9SRn+P415nZHKsqbMnIIQ4VB+XGQQGuJWAqbWi4zrf82
         SwuOZEAZfzTrmLnnyAKGJQSC+yonWJ19RoOJjJEHPfFpk6cSPm3sQG2Q0C5/AdK3SLQR
         lGSBG4gJlLKMRvN+dOmf+ytdAVBnyCC69A4StaP0vAjAXVdE3j8+qGmqQyh+PvFiTG/K
         cgWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742273498; x=1742878298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OcGAZaWPVIysHTdBCRYBHO7NUCxy0k+KHYN46Zgiu4k=;
        b=p8MqTtp7VlsmozRL1IcJLk9Q02x4oVJXGIkbZX2BNmn0z+lkEFcJw4pRKbflpvDy+f
         WoAkt4WEIwboj8dKquKG1/lqiox2g5RUXGDAQMNhPAWkz4ryirT045UimL7c9MSY+e7a
         7DF4T4qCPTx+FTgzCWUYGVDLwqNSH+tbRa/x7weQuxXPI+yv2TPAXE9iqjLZxa1ISo/n
         oKuMJwNt+au6kHwt/NruKyJ3EOZUcMKER/2XQYP4aebQCnvdnIRkjnDxnkZcLSp/eQAS
         QXVQEsQJQ2Fv7HO48syaWSRDdhwtoboHmnlV4mb7yisBKQdgjEF9AUqrVVsyFTibmEJ4
         9zrw==
X-Forwarded-Encrypted: i=1; AJvYcCVNGWjclBzL7JUDjuJSD8eqBdJ54DhdPGjfVlnFyNnsePHs5uO4PQXbRe8Lrl23gHEMkR9O1q8M3e+eqw==@linaro.org
X-Gm-Message-State: AOJu0YxhSDkBLcy7qxr81Fk/W0BQbSuS2JifAUx17wXrRoyWNYn+40H8
	nBVHVlYCc/lI6K+GTUitJ3i3o09jcMhGH84jPimDVoT67z1ZFoElktAMzkPPFbCvNg==
X-Gm-Gg: ASbGncslcgYO30TTC962in0izVVBvhSyU26FCNZK7eWgyjCvxIKM2XQjZrJcC7G3Ei7
	RLdK/L7J8BnpuolJHOhgEOyamWM7LtXHMLmnghlyymk6ZVSRV2JjDu2DUOS8AhUUoPIXSBfOhjq
	woPut6mU+pIrUHKTwBi4tXRbnE+kuftTopqRkr/0V5ZnGS6PtyJRGjdq/o8FtJL4BMGEGA6VlHI
	FdalN8nQkvT2klL7aiSPmAh/35Lt0+c4OmO7hylsUT1ke2/WLL998Z1Wm9JfZdM3KLuRqNr3R/8
	DtanO262spnVjOTiyIzuchFVD9Gq/AZPKyHHjttu3Rw1
X-Google-Smtp-Source: AGHT+IGd5D4o5uKL9Q2v7Y3e6Bm9G+stqVZhHdXsULQqp3gKY9DtvnzsLjdYrwnF2yMZJulAsCZvKw==
X-Received: by 2002:a05:6a00:1954:b0:736:fff2:99b with SMTP id d2e1a72fcca58-737572df1b9mr2862896b3a.23.1742273497827;
        Mon, 17 Mar 2025 21:51:37 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73711694b2csm8519195b3a.129.2025.03.17.21.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 21:51:37 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	Peter Maydell <peter.maydell@linaro.org>,
	kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 05/13] target/arm/cpu: move KVM_HAVE_MCE_INJECTION to kvm-all.c file directly
Date: Mon, 17 Mar 2025 21:51:17 -0700
Message-Id: <20250318045125.759259-6-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250318045125.759259-1-pierrick.bouvier@linaro.org>
References: <20250318045125.759259-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 2Q0ZQQglJ9rO

This define is used only in accel/kvm/kvm-all.c, so we push directly the
definition there. Add more visibility to kvm_arch_on_sigbus_vcpu() to
allow removing this define from any header.

The only other architecture defining KVM_HAVE_MCE_INJECTION is i386,
which we can cleanup later.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/system/kvm.h | 2 --
 target/arm/cpu.h     | 4 ----
 accel/kvm/kvm-all.c  | 4 ++++
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/include/system/kvm.h b/include/system/kvm.h
index 716c7dcdf6b..b690dda1370 100644
--- a/include/system/kvm.h
+++ b/include/system/kvm.h
@@ -392,9 +392,7 @@ bool kvm_vcpu_id_is_valid(int vcpu_id);
 /* Returns VCPU ID to be used on KVM_CREATE_VCPU ioctl() */
 unsigned long kvm_arch_vcpu_id(CPUState *cpu);
 
-#ifdef KVM_HAVE_MCE_INJECTION
 void kvm_arch_on_sigbus_vcpu(CPUState *cpu, int code, void *addr);
-#endif
 
 void kvm_arch_init_irq_routing(KVMState *s);
 
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 7aeb012428c..23c2293f7d1 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -33,10 +33,6 @@
 
 #define CPU_INCLUDE "target/arm/cpu.h"
 
-#ifdef TARGET_AARCH64
-#define KVM_HAVE_MCE_INJECTION 1
-#endif
-
 #define EXCP_UDEF            1   /* undefined instruction */
 #define EXCP_SWI             2   /* software interrupt */
 #define EXCP_PREFETCH_ABORT  3
diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index f89568bfa39..28de3990699 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -13,6 +13,10 @@
  *
  */
 
+#ifdef TARGET_AARCH64
+#define KVM_HAVE_MCE_INJECTION 1
+#endif
+
 #include "qemu/osdep.h"
 #include <sys/ioctl.h>
 #include <poll.h>
-- 
2.39.5
