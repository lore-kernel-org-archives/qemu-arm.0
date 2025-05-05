Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2178749njj;
        Sun, 4 May 2025 18:52:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVld9PBzn/8IxpeOvpzqeEqrUJVo7b+qozM0k9bQH7dBzsotWk2Q30QVILVzQ5D3tyCMuaSIIeNsrMF5w==@linaro.org
X-Received: by 2002:a05:6a20:ce47:b0:1f5:8d3b:e294 with SMTP id adf61e73a8af0-20e9660530fmr7476078637.16.1746409956812;
        Sun, 04 May 2025 18:52:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746409956; cv=none;
        d=google.com; s=arc-20240605;
        b=WI9WBxZ4q9hv5OxWOJkM16F1nJ3cfuPxd5ScjodjouB5o01w7meUsf6UnuFHcWJ5iD
         ZKfrSVOPbRlA9CskmDMbpfiuOPG0I3rycybqeIFMjgrY8BKWkr10XuNtkEEFCMgVUlEM
         Gk8PuXtHojQ9+odDDQ4zztVmtw1yIQ6dumHEO9t34HAZh6Zjqs/1nd68vEwsl2ngM0Vu
         v+/pmEIZBDoYhrzaoowQVVz0ki02SM9VpRar2PYn4Sdn9j6S6QSWoQvjLisvi2NXa0Fm
         u+3/Pngz+/3cfxU0uzgtAyKYINVGs9feBvusPL5TBoxhS+zkArWAYeLzs67fionSOVyW
         areQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=LuLpPX6X06+NE7HHzhZQmUoQgosCpwXTe/wCgu+rNqA=;
        fh=Qs1+AAa69cvp/73xR6LKgpdev5GCB9Cxr3blSu1FLv8=;
        b=bcBYZb1HDQXNJp6mlI8V9LAUIbIB/Q/MMJZQAckSp4WSRYvRLeUTBnwpvF8xzMO7To
         mBLjQtadVnohx7+kOMC3Aj5+5EaSmFYOWghliVIVm/p4fJ96yNRICfnUa1V0J93ckJq0
         PCRs5T1U8V5TecHJOPyEJ6mKu/xIp471lLQUnIw6ruMnut0huZ9TpgXv2gFlPdi+fKi/
         jaNdxvH3tNiSOefv72303CPo7h3hQMESJVziBS/6t/3PNFl488Btq80jRjMsROuiFLqI
         pOcK9vewlvHVUwd7M9Eb3+RY3XN+obyZ6LoVBlM67D4tQQCZ1cszrm+VCRaFEg3Lxdni
         w2RQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="fnI1Fq/I";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-b1f9d5c6a65sor3951973a12.5.2025.05.04.18.52.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 04 May 2025 18:52:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="fnI1Fq/I";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746409956; x=1747014756; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LuLpPX6X06+NE7HHzhZQmUoQgosCpwXTe/wCgu+rNqA=;
        b=fnI1Fq/Ih6P1fDN1NpTLDL6oJ+2QIeSAL9PFOyJPbFCoSCMOh77G3y+YFFgAJTc0nU
         o3YumBwqV1eQZ0PREDf48TXACLNvTxlxyAnRygWO8rZxBmFmSpt2FDarbkvqeRb0iGBz
         m6s7rl6PXCO9fg031BeAdM3gjuMe9GCCCAx8x4+0FCAA8OfyC7JOYMNU3EUUB2Sa9//D
         M8sUKJyTEFmku3jPpUL0KKZdwFyspLnSrHzKXUnO5//171kGYe0B8A68saEs5i3OD2Zw
         SfFWEoV/7+GJbV1VvEDxynvN/iyYLV6/Ei/6BrrN3OI8mO6gW8YYkE1nG9suVFm/cZ5c
         bGog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746409956; x=1747014756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LuLpPX6X06+NE7HHzhZQmUoQgosCpwXTe/wCgu+rNqA=;
        b=X2xIbJMct+pCC+ZT6PgftyYr9c3AifmI2ft09qFXGrtQAYc5vciDiElPRE8lunV6Ir
         0KUIBxecdsdlmI/IsyfJ53BqXrXDUnvkZPV2/2lYpUOTTSCd006neKf9elb/bCsG4Szo
         B1QhgXvwgijPrMJBI57ch/uOXlLBHvQ2rjLH5Cm+Shlj4mmMdxjDyATuhll6xwsIlH+O
         AiVcRF2bIEPj3Imz8SYkJph/g+tdT9VFHMOtM+VerSKQkxuLwWWT3pk8/dT+2Wpd6ks+
         eSuyqI00yDC1Bpu8LbqIY3zFVGTalkO1UKi30AAT7m/JmjFMEBiRM8oALOkjFkLF5kfR
         Qjyw==
X-Forwarded-Encrypted: i=1; AJvYcCV8QCZ9VnOEUUCCtWtAUTxl9ECcgyZgy4TEArI5Rw9IR9xEpDekH2hdu2KUWXU+yrqd2OZnL9Gx5uFVnA==@linaro.org
X-Gm-Message-State: AOJu0YwWfzx0kZSkBelGWkYsqgM0FzT0J0Nx//cNyQYu7oZDtlqLCup3
	Jrv7PMcW8PCvywYYU7o4yCSfRCaRM+2T2WrsHv0ZLcPUMTAOK12PecjHaou1XNC9UQ==
X-Gm-Gg: ASbGncvxzN515ir38KDuV7ub85Bgr3f8CbPF2iuSJRTbdBn7tgHpiQUmo0HZSQMsOAW
	7kjXQgcwleJuHyIWqQMoHTOZoBlWOla1WxU7+K4o9K1FvaT65qmmicGUcK1McuIXC5yP9foLI43
	NmvchQP16xDzWey7uPb2l3fhFId+DosbqDSV8L2GS9bcV7ZatglSCMnMNSwq2zXM6XiLGmwbLCV
	Za09oGXwuFxKp+ghnukaLYq12EIWTuWhvmG4LQeYRL+zznG16U85uZwh9EQtByacutY36OuYmeh
	/n8W8kQE1XnaGyYCoonTJQ+Zy2k5OEeCZ7Ge7u7n
X-Google-Smtp-Source: AGHT+IHzGUohRUeOSCShyTBQEz3+cx/ASVTiK/6WfrdnkCq5fA8tyIn6zcD32STw5IjqBUMIm5B39Q==
X-Received: by 2002:a05:6a20:d503:b0:1f3:41d5:65f6 with SMTP id adf61e73a8af0-20e979c90f7mr9100293637.32.1746409956419;
        Sun, 04 May 2025 18:52:36 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3920074sm4462101a12.11.2025.05.04.18.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 18:52:36 -0700 (PDT)
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
Subject: [PATCH v5 09/48] target/arm/cpu: remove TARGET_BIG_ENDIAN dependency
Date: Sun,  4 May 2025 18:51:44 -0700
Message-ID: <20250505015223.3895275-10-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
References: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: SdlMAwO4aZ/9

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Anton Johansson <anjo@rev.ng>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/cpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 07f279fec8c..37b11e8866f 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -23,6 +23,7 @@
 #include "qemu/timer.h"
 #include "qemu/log.h"
 #include "exec/page-vary.h"
+#include "exec/tswap.h"
 #include "target/arm/idau.h"
 #include "qemu/module.h"
 #include "qapi/error.h"
@@ -1172,7 +1173,7 @@ static void arm_disas_set_info(CPUState *cpu, disassemble_info *info)
 
     info->endian = BFD_ENDIAN_LITTLE;
     if (bswap_code(sctlr_b)) {
-        info->endian = TARGET_BIG_ENDIAN ? BFD_ENDIAN_LITTLE : BFD_ENDIAN_BIG;
+        info->endian = target_big_endian() ? BFD_ENDIAN_LITTLE : BFD_ENDIAN_BIG;
     }
     info->flags &= ~INSN_ARM_BE32;
 #ifndef CONFIG_USER_ONLY
-- 
2.47.2
