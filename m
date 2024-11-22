Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp5748580njc;
        Fri, 22 Nov 2024 14:52:06 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXI8lR4pIFi1cE0sF6h9A+aLABwcizNu/EdcBIlmgkqIZfTsiZA54DU/xhDqcWXbgLN6cLqfuV01BHxyg==@linaro.org
X-Received: by 2002:a17:903:22c9:b0:212:5d53:d024 with SMTP id d9443c01a7336-2129f233bb7mr76581565ad.22.1732315925998;
        Fri, 22 Nov 2024 14:52:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732315925; cv=none;
        d=google.com; s=arc-20240605;
        b=NwffAbvmfdahQMI21TZaOLppKbZfiFYZqEQgQeR7OgmMyfyDHAArMUL+GBly4KuGQe
         oNjjIuwKfJ+cqZ6ewMCzzLINj+S+G5VYPWe2h6G5t4wLF2GY12tLEerWWqMzSxx3FtPA
         u2bnHcMA6ILijCSdFS4DF332TXykbeUjJYWamoa7yS4uZT0rbwzbL0Byok6YIegskQqM
         8JK1oRtJYztEQp0VKcvH09PmXpIPw6E1EU5e1J5s7DwlfGMWphNX8ZYN5QIBAvSLzUGz
         c8duBRKKjt76QSB1KJsCqEXPaEgJrueucfaLVGOODsXXJzmJn77Wr/LOTKJVqwvrOjdg
         O6Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=oMGyDQYSWfYuxqAd92U6ssjLzVraBx5dxtJzlIPJIio=;
        fh=usD4v5pjLPWYYX9S5QXk/6V8TMNO7f/eOL/1OzXz1v4=;
        b=iOgAU8sJCHaYOZgEKCzAyusRh/CdeItZpeMcVojXlFI8hjd0jTm4/naBIrCjGwsRTb
         //QCuJtMXyYUnxeb9g6SwDUWfuX6GB2FXOPIWwAksGVrSQIROyeKBM5w1mPRxHQYphrP
         iMbJvTNz/HZKQxvXegN4YoMJI37PK+lq43mKZRTd6kf3tWS47sjw5+Si313oLVMBlJKe
         RV1hKck3XwVzjErw326Jjwlpc7ofzG6zYvr3JL3HIBp4q9lZG6UHSUiuqsXDaenVtJ0c
         L8TWTx9xmGg7YhD88qkQUh69zKqt6fsC1aBEhThjHzEPX0/SzbPHddX6IPQ8wYQinjOH
         JOKA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mI8rn912;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-2129dbf1b6fsor22649395ad.18.2024.11.22.14.52.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 22 Nov 2024 14:52:05 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mI8rn912;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732315925; x=1732920725; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oMGyDQYSWfYuxqAd92U6ssjLzVraBx5dxtJzlIPJIio=;
        b=mI8rn912XTXj27rNy/1FNTjYGnvPPrhggboMKARfsN5upVtsCAKX6RLO/nBZYkANcp
         k/H7FuYbNXIN/qbazDshEf2tqUlC+OkU2KWxJuzVJ6zKecEDG7vTTAmTSmciV5PZg0b7
         6l78svDO23nD0+hu0yNgj5A/OZCI3WMNWYAItj3oRGj7BGHGnWO1M1exmypvkUaEc1nJ
         30jYvHJk4O5VIQFVeV4JFO9eqhfaRB1MYd4HGGK+ba8NFvGviRjGonI5rTAVEdY6o1E2
         4/xF6Uwu+tRp+uf1mc3UuQN/bWBxXMRWg+FrBTJ4WnTBXdpBZ8iO2LaaR0QmPu6oeLOg
         HVPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732315925; x=1732920725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oMGyDQYSWfYuxqAd92U6ssjLzVraBx5dxtJzlIPJIio=;
        b=sa0bzW4B7D8UUw3lJlUi1plVbFaxI/6ZJLHUpH7tawr1L7TR9T+ykWRzSgnG3yrtir
         0KMVr07yLpYuXudpG4TrcmBknbruI1+JUcWO92H0ec8oNHbp7xV1pMIrlRfc9NEJ8UeD
         h1+QcR3jJSa0JEh0fejm6fMxEY25V993PhN5FuW7j1fOJkLnfDMT9tbLIIPx/bZYWaix
         AKzxAdtZC1qC3M7KR1jEW/EY/TFCJFNkfvNXmT03zAwByLNM8yG4WkTFsTSrvwvQUvxD
         /4V25lgdBkSz0coB9Tu+olQ5Gy4IOKFK8C2VL7MaDv+/55shdgCQJEh/fJR35Y9o7j8+
         NCkg==
X-Forwarded-Encrypted: i=1; AJvYcCWCdwZXfpKQ/kTrYc8kSZ6e3cBgHBB1+7poGcvSeX65vGd+0ThZ6WZ3j6qZ96FaAM2qPY8WWJCkno+Ziw==@linaro.org
X-Gm-Message-State: AOJu0Yw8eQghSqedBJxErRrMrJj4SBgf6t6BdfX7TlgQ6vvancQ8nvqO
	1xVYCoyjbHTeuaAuSqCF2WdAd89zOThGiy1Kjb1MQpca2vV4JFjOexGJYjNXuE/1rw==
X-Gm-Gg: ASbGncseBZDy06IgMV/L3JLmCu8mLoe91bhJ3rvMc0RnQ6IyhVy+NS8MfJ7v5gxvsWs
	hZGvf33r0ejnL7+rJFBgW71NNyy2ZzvNB5VsQ9lad7bmOYn4JGJtz9ABS+9kAdZr+a+JNuXSftF
	hWiOelFlSf/oFC7anSgVEyYPTuJnCYklEgSyjHoQr3VNtIDIIVbxESvZ5RDzZk47nKypP+sxiA7
	NKHStX17Jg2i0gAjHbjElBIYw/vj9OhaBaRzNCPoUrAVDvOi+XF3FPy5eIg7yYjplLnwFY6xa37
	Iw8at0lt3IyGXw==
X-Google-Smtp-Source: AGHT+IEOIBycBt6uzo9Fy9yo3WTNsXiIANTAUyn3WhjV/kbsUn071KG5dDeA84VVJw9kwvIhomjB6Q==
X-Received: by 2002:a17:902:ce82:b0:20b:6d82:acb with SMTP id d9443c01a7336-2129f244317mr61947525ad.23.1732315925594;
        Fri, 22 Nov 2024 14:52:05 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dc1539fsm21450335ad.192.2024.11.22.14.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 14:52:05 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	alex.bennee@linaro.org,
	Steven Lee <steven_lee@aspeedtech.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Richard Henderson <richard.henderson@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Niek Linnenbank <nieklinnenbank@gmail.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Troy Lee <leetroy@gmail.com>,
	Jamin Lin <jamin_lin@aspeedtech.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 02/12] docs/system/arm/emulation: fix typo in feature name
Date: Fri, 22 Nov 2024 14:50:39 -0800
Message-Id: <20241122225049.1617774-3-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241122225049.1617774-1-pierrick.bouvier@linaro.org>
References: <20241122225049.1617774-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: wi3bskrfravf

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 docs/system/arm/emulation.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 2956c22a1b7..af613b9c8b8 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -88,7 +88,7 @@ the following architecture extensions:
 - FEAT_LSE2 (Large System Extensions v2)
 - FEAT_LVA (Large Virtual Address space)
 - FEAT_MixedEnd (Mixed-endian support)
-- FEAT_MixdEndEL0 (Mixed-endian support at EL0)
+- FEAT_MixedEndEL0 (Mixed-endian support at EL0)
 - FEAT_MOPS (Standardization of memory operations)
 - FEAT_MTE (Memory Tagging Extension)
 - FEAT_MTE2 (Memory Tagging Extension)
-- 
2.39.5
