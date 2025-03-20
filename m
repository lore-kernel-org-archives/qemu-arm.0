Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp1278954njc;
        Thu, 20 Mar 2025 15:30:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXlAuzrSnLS95eW2ZRHAJK/lmQ1eLxCvvSadOu4re8B4uLf+rffC99Nk1OnvQR57G81ME3HR5dhCSuu4Q==@linaro.org
X-Received: by 2002:a17:902:f60f:b0:21a:8300:b9d5 with SMTP id d9443c01a7336-22780d82933mr17941435ad.23.1742509824560;
        Thu, 20 Mar 2025 15:30:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742509824; cv=none;
        d=google.com; s=arc-20240605;
        b=fD1VvAxrTZPt6djjQkcxa6X3KPCdf6JKi1losxWU5zhCHeQAfwtneh7iY+y5uRi71O
         iCEyCCA3TwoWhNatRjre3/zdixsXAT3Tss2+T8lDxljzwhLhn9c/N36vm2TAaZgwdlDu
         +5MSVxmgYzKMLlNKK/wPXfPimnmIfQxRt9CmUcXmGR/GRHCKP1640o53V7B6JrN55cO5
         P84sJwyY1ELmp1PAZrBkMTmYXpru3vL7a57sRNtUI6zpzQdS9Y3fvj3FLj4JgPCHS8vQ
         SAu0cjiyJguJd0DElOq1TyVzabP6S/itNFyANkvQgrLpjCDFzfQ2CsK8G1mretwwTo2v
         nnKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=eCoHq1TF4OuerztqGd91anfr0TMnNc3lHBgW4hpQzhU=;
        fh=d5jqfNDQqsPazOBhKV3Uyj28PXC/M6gDu67P68qzFHA=;
        b=AVtU3N9qprudxbQvgRioGf3JqMfSERVeLv9KlLUvHU/m/z1yEgqdFtEjzewZ4RcJMt
         0lwBCiDOZvDKnZigSF3yIOyIDiXLBs4FnArxZzycvHy9NxGera7WfIxglov0135nzpft
         GhRbAhQAWZ8A9u6GylFNsveri3Dg5x0J5RI/ao+UfhbTSB+BvRKtc+ISzQ+/JglNzEXi
         0+xZpCJv/2mII36PJwZqw6VvIuIdJpYwK7cldkPakffdutfjW/DniqEPGqMJjSxrQuSY
         6wcn+2suj5/w7sh93PqV4b23l0/WDvuTV/g2h++tUg61UnC/GAxtDztqS+TVLeQrB7sE
         tOLA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eWS8nc+o;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22780f8dc8esor3717365ad.12.2025.03.20.15.30.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 20 Mar 2025 15:30:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eWS8nc+o;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742509824; x=1743114624; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eCoHq1TF4OuerztqGd91anfr0TMnNc3lHBgW4hpQzhU=;
        b=eWS8nc+oGTap8uNgJvFUOLeVZtJ7LHMwPmu7oiHxwcEG0yXE47Rk03/d1x1uxyVVCj
         3GZtI5y2JtLLLRTW10GIzyszOK2JUDFQz3R44f5FumWNxQ/GHy/0GTGu72P93uXU8CrP
         psrCPPe0X0CHv3oszFi0wP2Z4lkqQxBoYLf03LzNJED11Oz8KTGBKLVxApeAQ5isU4eN
         dpC/So817y3PyLGdCQ9vGr6pT0qF+k1qiAANxyLV4YnXY6xsyf+TCq2dAizxiHYAWss7
         iD6nyWnnVu29aWjfXxf7CKPMgb6nQKAma4G+SdnNVvox7BOnCa0SCPJT97gGnY9Y0iWy
         2LYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742509824; x=1743114624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eCoHq1TF4OuerztqGd91anfr0TMnNc3lHBgW4hpQzhU=;
        b=f6/ihwmqsc/2roq5CkZXYOjkKq6g6noPs5459AE0jN5HKlmxOolyXG627mSG1+YcwO
         +W6suEUlr1P4hPCC9VQSrLQ12HJg4Lb9XszfnalerzvyKDQGCwDwTcqAKCaw8h8xF5Y6
         nsbziagjzzMVom4ikwJQgpm8JVk2yRy0+5QI2GGSCupFEYT52RlghAld9Ydg3qHlbReO
         RfaujpgPE5h47bYCOOAyuuSGuC2htXSI7xhBeYhCMIPMvm5UCVcb+Avjg0eIIjH//Z22
         Clgihph5i4ygvCAzwBDljVIeDrj6Coufg9XYqTNoli3bI8SfwOAhw/td9tZqyTzxpuOx
         EVnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWqDPD9oVNlI1BKH7c16J0/aFE1tkRXeCJYLuifcNJ0DR28ttG7hlUlF/sq8Tjl0C3D9cYVVAbQQXyhA==@linaro.org
X-Gm-Message-State: AOJu0Yzyc+IJpOs0RNcVIqAaFgtqOKHfauLC/lMpqD5C8HNuDMCTsSQm
	UKDPT7jFLf5YtVc2gFib/l8DU8CP+clV/+aSqikNSHniygZRR61VNcgRaJZ5dRD7Og==
X-Gm-Gg: ASbGncsjemAZItheC3g/Ooo53cpJp24VyZruPZ3RCTstWag4A2ZctIsRCL1meEQuMAC
	JzJf5Ou/PZ4uO1aNp/Z6xnphN5GveR8DRXqpLrcuFMJrck5/rn1mRONIaapMvXXhlCeoZpdi+6b
	56eJ0hPzpiM9M8FprdFzBKS+btJvlq1bK29oCIpWZyDVIwPGI/pcIcXV2VN0USRMiuq6PdNgKpI
	ymvlVIRiT+hiuuaiLtQLWY+/UhbGvcradl2jeoUXHm0q8r8kTHTw9+9DRyvfFbVb6IBix2xac8S
	NAQE/Bi6zUxDrpezRxRWWsi5+b6y96+s4GLhtn4sc1ng
X-Google-Smtp-Source: AGHT+IGI4h055zkEpag1yC+Lf9SXKqGgcc//U54r/YtVGXHhgxJCu9SYna1AurwwJwuLFCO6BJkVVw==
X-Received: by 2002:a17:902:ecd0:b0:220:bcc5:2845 with SMTP id d9443c01a7336-22780c5350fmr15267505ad.7.1742509824135;
        Thu, 20 Mar 2025 15:30:24 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f4581csm3370145ad.59.2025.03.20.15.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 15:30:23 -0700 (PDT)
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
Subject: [PATCH v2 11/30] exec/cpu-all: remove hw/core/cpu.h include
Date: Thu, 20 Mar 2025 15:29:43 -0700
Message-Id: <20250320223002.2915728-12-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
References: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: x08e6xyrgZd+

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
