Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp1757168njj;
        Sat, 3 May 2025 22:33:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUeKdKGqMKd9ArS/g4pBgMwjZDacStzBgaKyEazY1d81bE9P3Tipt8oFDnNm2z1aYBmQRSlsJsYKCqTCA==@linaro.org
X-Received: by 2002:a05:6a20:d524:b0:1f5:8605:9530 with SMTP id adf61e73a8af0-20e97ac0020mr4382848637.28.1746336785183;
        Sat, 03 May 2025 22:33:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746336785; cv=none;
        d=google.com; s=arc-20240605;
        b=RWkR8Zulyqyftg1zYAdSH3EnTb3rJVB56KZCwRwIPOoP/06ty3d0WXoZERTdKCUw0H
         bTsMYS/cF1P7zDfLihpNK3HPE6we1hLnEaga0Y5nKnwjOqJt5IMAPdPZma7LIqKWOl0p
         FKGvI+1mltYK9/L/EiSuSfgkxKyPy1TwQtWIbwpjtfSmleH6PJOF7W0lapSEF3GUgr2n
         4c0/Zk6ZmiyltbK+xwt4OPQj6kwDPdWiENiajkYq353KasXH9TBDzJZAaDHYJSFUHmA3
         Z5QuWVe3XRvwg274e8Zgfw0bHqnpsXQtycEbv/RxlG677exQ2CbXM7D6I0zcHsHFJpP5
         cqhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ZhP0z8+DVkBnlSxtMGbkJypdQb1sgmbB67l7Zk5LpFM=;
        fh=61084O3hhZN28bXpoepmfs1UkW2M93NJBb+ltnI3mp0=;
        b=eJW3WC1iyIlWhA8BfQ0haW0HgHcFF3jd1HwnaXsuco5pxXAQgIheEuZ3FDeGF5e0NO
         g/XznrWh6MUdt3OMR5EPA0FmZnht3tPQCKaxFK2NGcW0UNlbNcl5iWcS/6XaEK1ue1D4
         KSx9MM0Kp21WeJxxJ+0oTdUcJ62azvYAHmeJ1sPHl/nKuoW6p5M+OJ9T8tD3Bx5CX8yO
         ITKz+5UZ/m90BeNp2Y7zgR+h6rZHF6QjKBkv6HzhAccbRey5Mky/BhOGUSuNRCYaRStT
         P7D7n1xIvqFRPEnF4tvTJzDyUlrjK3Fy3xy1WQLEZhSDnKx6eESm7kzqT7d3s8W/lv4y
         FrVQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eSQazzpN;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-b1f9d491d24sor3123894a12.1.2025.05.03.22.33.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 May 2025 22:33:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eSQazzpN;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746336785; x=1746941585; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZhP0z8+DVkBnlSxtMGbkJypdQb1sgmbB67l7Zk5LpFM=;
        b=eSQazzpNUj5MCb2HtKkGN9T8ACT7wjuweAfSUhrTBnegp+CUa2nqMsoqXEu3b+YmmA
         RoaUzzBQoXvTFl/khGFbrMPv73u9yWh/QoFO8zu93NdRJ8tkkOiaWNpz7+WRZcX1KktU
         a9+iuI81nlj+Twh2bqwsqNdrXzAZr4JmNUao8JinEj1koRc1ddVH1Q+6XnJ1kdo0I7sI
         fwbuAkt+ySOYBiZ/LjO0XPYq5TB71Gd84VvZl+Yvgz7nR4jlzCQ1N1i74MFyrNZya6kP
         H1YIE8Of8Cqo/2kaVMg2IjqAf6iN1fkqfJXpXhpOJFRFog/bn8eBl4S27gTZrqMByZBR
         SUxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746336785; x=1746941585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZhP0z8+DVkBnlSxtMGbkJypdQb1sgmbB67l7Zk5LpFM=;
        b=BWM2Kp8fZ4phh+fNi10ogrrTxNfifNftRMcXP9ja2Yim0cWcbA4tl9MskchWQS2ArR
         RZodrbVz2Rf20PXWcrJsCIJAnMnFafhzrOPF6bfPJrgJ6nJWLM2Cgo2GsxlqwgUZGKEq
         k657u6LD4tKgOfVjrksBjpdzrHRgTSXNTgagyLr3doJLSxy52752VfYFMazIEGF2BfMc
         tti7gFqqTXRvLNor+ktvmQw0gsmAOy/Z0HJuW0BnBlgKmS/sTz1qhdCBv1rfdbFQ7DjM
         b8RpHgnJBaOI8k94h+zu4CGoGgLI2LQVO8ynXn7BO1FZeugzh9QOnQZq6X/aD8z3KoMB
         6xLA==
X-Forwarded-Encrypted: i=1; AJvYcCXsAvd+MhKFgbdP4ARhhap9lFLk6Wn8qBg2Hu1bMnrY3POMzLTdRqXDXAdoriCMmdGX0BNEPnsDsffWEQ==@linaro.org
X-Gm-Message-State: AOJu0YzUnzF+UqLSFlm4L/5R+L9dp+JXbV6aa9WMJHDMeW5BTy11xtpO
	55/p6TRy5D2nFXY0P2Vnpjrq65Lr31EtybJpV5DSLSwHqm+FvaoLsry9uHFNpAvv/A==
X-Gm-Gg: ASbGncssI/3bpxc1czFc46zWyVMACfzfH3mOoPSmvbjSSuyHQ+ZiMdF0Fbj8LtHZVFX
	48gow9CUXtf2ppRQf2RrYw8ZOX+HYFUkwiOJ5y4KPwWyycdy877U4Pr2ok6r10Moxrfp96Bf3ug
	3qojVxa3m3b4USvqixs2M7v39md32jF9bf1VHg4EpDa/ZnJi23X4PHJD/gv5TgW4lzfmNir7H3Z
	KLNYL1LzQ8yLGdcsLb6q53UMvHmoBrASzGlGOTX2toq5zvvWVQsoyUGkoENeWegVPPWHLpYTacH
	b61m+3JO0PizyCoPY6215KeDfsjY+KHegZ1lWgMSTRNeVOoSI7c=
X-Google-Smtp-Source: AGHT+IFxzLf5brOirIah+E07icoYpHpD+eH8Rlgkwz7ETNho3CAMflgpUA/uxvEn58nCtyo036kx9g==
X-Received: by 2002:a05:6a20:9f8d:b0:1f5:8cdb:2777 with SMTP id adf61e73a8af0-20e9610a719mr4360406637.3.1746336784802;
        Sat, 03 May 2025 22:33:04 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-740590a1c09sm4237101b3a.168.2025.05.03.22.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 22:33:04 -0700 (PDT)
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
Subject: [PATCH v4 40/40] target/arm/machine: compile file once (system)
Date: Sat,  3 May 2025 22:29:14 -0700
Message-ID: <20250504052914.3525365-41-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
References: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: chRy/qlYmzFw

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index bb1c09676d5..b404fa54863 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -13,7 +13,6 @@ arm_system_ss = ss.source_set()
 arm_common_system_ss = ss.source_set()
 arm_system_ss.add(files(
   'arm-qmp-cmds.c',
-  'machine.c',
 ))
 arm_system_ss.add(when: 'CONFIG_KVM', if_true: files('hyp_gdbstub.c', 'kvm.c'))
 arm_system_ss.add(when: 'CONFIG_HVF', if_true: files('hyp_gdbstub.c'))
@@ -39,6 +38,7 @@ arm_common_system_ss.add(files(
   'cortex-regs.c',
   'debug_helper.c',
   'helper.c',
+  'machine.c',
   'ptw.c',
   'vfp_fpscr.c',
 ))
-- 
2.47.2
