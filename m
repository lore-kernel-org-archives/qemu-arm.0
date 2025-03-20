Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp1279024njc;
        Thu, 20 Mar 2025 15:30:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXu3fQEn3cLyrozZkIjvMUhaUHxKcesiCX/nqFvognLv6GOZMlzkAc3XcC0/ELrtrFrHmzEem1FFNqKBA==@linaro.org
X-Received: by 2002:a17:902:e5c6:b0:224:13a4:d61e with SMTP id d9443c01a7336-22780e23574mr12886395ad.51.1742509829800;
        Thu, 20 Mar 2025 15:30:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742509829; cv=none;
        d=google.com; s=arc-20240605;
        b=QGL4U33rT4y6hrVG1YOusSdwfQSnqTx1WTl0Hmyrs7DRykldMSX41bn6lw92+S/GlN
         vb9o9ej1KneqJXAgKmN4lsGmWyGeHh0PZrH6W/ysXgAxGzWIKHOhEl3FJIReaUMsM76r
         oWOD2RQ+sX/L9UCJ8Q2xiDYYsGVRBBaPqXdqXpp8TWsx06Wxm405fKPCWl9rGlElpJqE
         FWUBIDPiaoVyDk2+VTHkpjpsXJp1w/+fbt42Rc6y/J48dANf/DEGzHp60W420lpgNqF6
         RrAj7lRtLiMHTwMOJsw64PtDGjm+UHVnsAeOBoCHUj/GBuosM0f5GW1OV+1yvCuySojU
         ef8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=7b7Pa/XivG7M4hjK9jqso2S4d+dz1DGry6GtvIR3C8c=;
        fh=vmFU7vPgiMpQ4G3LjVNZmQv/QDpahxkvp4tqB65Le7Q=;
        b=lwUFN6jV1bAUtQVLcrubwqhZvWmbe7EPCrIBwmulp5Eow04kysxtiPDsa81LeY6Sow
         P9ArtzMG93jFt9NHZmYp0HqnI1njgrKTQvxmkHJefxOZKFN2kbcNVur5S40MuOUCzQfZ
         yvKbC3ZhoP2THIfIMXSX56on/6/Mz3B0tdF3C28vDLvmDWd1lTGuaERycCP4iPyYj0n5
         GJBTE07kRRGOlAFwVOP4ZVlnA7mVS/5i7Gux3c+fH5KsjCVyBbd283jORgiAM+YCr/DP
         pgF7Og/tYchjvwYuGfmxOuswwe8jApo/B9UIYy3n+hpDfsSO1eFsq/CQXHfJ9EBXWOcd
         K9RQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X8BykqMp;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22780e24f29sor4581075ad.0.2025.03.20.15.30.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 20 Mar 2025 15:30:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X8BykqMp;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742509829; x=1743114629; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7b7Pa/XivG7M4hjK9jqso2S4d+dz1DGry6GtvIR3C8c=;
        b=X8BykqMpNty7ZOtumiqq7//YD29wOdWwWo4rHISO3OgFbnPc1LJB3yH/N30BtslkwU
         jqHKPZQIfm3SLBJkXXqiqdIOX9QE0Ghnqd4WIdmmQrp+yfAQkwIUuy+HDh21fWZlEY1/
         t9vhcQOFNfkMNNfLcN0aiZi/wNzvBem2WHQSQzpFOzwrFEHeRYEuiQxHiMyudNrirwB0
         nFEGtwn9OULjLqsoTFwTXqWWKchJR/ViRU1q2HEtyOegcNdYtc4nuhGeK53bUx079eLW
         iqhGacztM/WrJ4DMBCYSwBuSG44LuIUUX7RZYFfX5eHy9/LnPqR0PzjsogdNiBMDFry5
         fXJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742509829; x=1743114629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7b7Pa/XivG7M4hjK9jqso2S4d+dz1DGry6GtvIR3C8c=;
        b=vyD1SipXuVZG2V6KTu1zk16+kvW6MIUSML3539SN9+gLE5L+Jr9QO6utxSCTEKGal1
         eAcvaaycBGO+OcCCPe67e34qxN7oO5SbsLKUIl1K20kX4h7eEjlVu6hgXKXrWKC2impj
         644z75nMIjJ6nZR2njjsOQXVUE4EZhaLVBkkKcmBB7C7UF8V8bV9ftYWuagHAIQ98Dsr
         u66w9UgAkPXfdVKFq2uA6k58U3rNgtjcpbDhQYAXMfAv48DC3gdcsK6yGUftEo2A9M2w
         zgFQa5+lUHhHMO7tfcZ1fm+OAh+WbVeJ2CE1jIWcA0AxgJ4/APFULuMAz7bIrOf6oQTY
         NpwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWL0PQ4LsEGUHWm5G+WsZtbKBd0C9cs/qMID565eskpNnkJBVi4UyhqYH+rAoEiIIUfirXYKnN/tbuTHg==@linaro.org
X-Gm-Message-State: AOJu0YzItY44Te/+GD71kSjePACXcwZPDI/Lp4MV7soU/s5S4e4MJ/SM
	mqD0FeTo1wQqVeH/s6qG5f0O3XGVobOL9354iSzGHSH3M33brQ4z4F0MbA03ghScGw==
X-Gm-Gg: ASbGncsZ2Nisnzf6nG7pYxYECcEFluSYMzBuv6JTzFHLWm5SQGqgoODytbklYH+6pP1
	3uf4rr0AETeUPnCgXplFeurBo6isxeJkEx8BMs1+yLTOF3BTe0grH/y4bltE99HEMIprGxDNhH8
	fLAvb4qMF+LjW0rW0p8AUf44fz5h0qsRzvLHCn35bZaMdO/AsJToxd9CH8UyiwEdQ8VQ1I1abQ/
	Wubc/XnW3xOPBObMuUEMVMa+xstD1Z7qtN6MNK/kOdnDF1hsthqNFdvKpxMw8QHqK7r8OSoC6CH
	NUksFgl2yr5SaFZuhXkk3jQVaXv77j6bp5+SO6jTcUaV
X-Google-Smtp-Source: AGHT+IGVCpx0QpmCi1amSZVFcp3Lx1psopBE1QGnul4nGQtrAHd3RHBlWFA8EFnCJxNgJUKeuy/0dA==
X-Received: by 2002:a17:902:daca:b0:224:26f5:9c1e with SMTP id d9443c01a7336-22780c55312mr14787485ad.2.1742509829392;
        Thu, 20 Mar 2025 15:30:29 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f4581csm3370145ad.59.2025.03.20.15.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 15:30:29 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 17/30] exec/target_page: runtime defintion for TARGET_PAGE_BITS_MIN
Date: Thu, 20 Mar 2025 15:29:49 -0700
Message-Id: <20250320223002.2915728-18-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
References: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: EfotaNncKOzH

We introduce later a mechanism to skip cpu definitions inclusion, so we
can detect it here, and call the correct runtime function instead.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/target_page.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/exec/target_page.h b/include/exec/target_page.h
index 8e89e5cbe6f..aeddb25c743 100644
--- a/include/exec/target_page.h
+++ b/include/exec/target_page.h
@@ -40,6 +40,9 @@ extern const TargetPageBits target_page;
 #  define TARGET_PAGE_MASK   ((TARGET_PAGE_TYPE)target_page.mask)
 # endif
 # define TARGET_PAGE_SIZE    (-(int)TARGET_PAGE_MASK)
+# ifndef TARGET_PAGE_BITS_MIN
+#  define TARGET_PAGE_BITS_MIN qemu_target_page_bits_min()
+# endif
 #else
 # define TARGET_PAGE_BITS_MIN TARGET_PAGE_BITS
 # define TARGET_PAGE_SIZE    (1 << TARGET_PAGE_BITS)
-- 
2.39.5
