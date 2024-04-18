Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp1953137ejd;
        Thu, 18 Apr 2024 12:27:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV2fE6HZclepNY/X0+gUOjRlAFnxlM3fSAfIDKbFX6Q1/O4hvBU/EyMFhozSGp9QTy2YsQJzWjRz0qhJGrpa6mh4l/cy1Zu
X-Received: by 2002:ac2:4d88:0:b0:518:8fd9:7a55 with SMTP id g8-20020ac24d88000000b005188fd97a55mr4519lfe.35.1713468471012;
        Thu, 18 Apr 2024 12:27:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713468470; cv=none;
        d=google.com; s=arc-20160816;
        b=Jiil5R0adAbuu8bRVNcYibgkBGRHKNxMQQnjnAf2SL6SixDQBG7PaxZCJZUNFZNqfG
         QaRu7mvKqH3/YB0817KcTZTcqF8/+veipzbJpEMYJTeu+LkYO+nO7J//Yuh2+2jvOfnG
         Kohcy9HRPtTpQCmTqc6hgymo7oXM/Nff3A55neNyoN53HXKQg7Mm1GU+ux+2DkHonGzr
         C91RiuK6f1++UTXVWqH40FdcB9Am26qaQmwn5vhZsH8dkWKVIYSadsqNNirWigYCyaXx
         mL5CvGeb0AHl1Plt5s/JqWoCc5SC3Nv25KW6domSL/q51qszpHmSYhAtbN6fo3WPDV5U
         vgeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=zNTjYBQSXlJdcfDAGNfhN/k6Tw+ZuKx0L+6ToWVAoUI=;
        fh=bRxqBv/AH6dA4t5gyXZXxDPeYl9qPxO/gOsnhLw+1Ew=;
        b=E8tlzSRitQGyjzezAO9EQZYmN2hKnj/sWSKmzm01eF1Axd7jIJk/dQn/oMsVDLjpkj
         Z0lfTaKFXZZi399BPbaEuK2XyI2klVsR0t6VRzj4oi4tMkaW6AakY3qTyVNl/uEW5MAE
         fGsFhB6LJP56XNSD8cxLDY0ytHo6biT2r7Y5lhOLFDTXUKuKvtZTeUXjPGf3EdMjGGtu
         GXIuYmOLw1HnI+jXUaAYXA1RPYwyBupQFqgwdId461GFL9sym9b8NjQUZNmIFR3p/P0n
         FzU0We7QDy105nEz+/Brr+s2LeCGRR3MhlIAxUexxsy9jBFDO93uivMWJSmCzJWrtjXg
         Tpfg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kfWTl5U1;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o7-20020a056512230700b0051974fd422csor1044430lfu.26.2024.04.18.12.27.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 18 Apr 2024 12:27:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kfWTl5U1;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713468470; x=1714073270; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zNTjYBQSXlJdcfDAGNfhN/k6Tw+ZuKx0L+6ToWVAoUI=;
        b=kfWTl5U10Kl6NUkFLX1ssasM1u/JlLkzOH/JMXv7nl0Pbpnt2oXdRlhUOYTWxy4d1K
         K16h1BKYKLFcwXvce5nrH2vGgI6byTQpKC4NGBl8VoYOUg1+xepqIwGy6nAnbg203vtu
         36DKvpByBDyMVGKHXR7IBxLeFEwR1aFvHOxwSI07WX6tioidTBz43vNtTlHF9Jc06rr4
         zBEY4r4wpmflejM7kbVjV3dnMvaYewYl9kQrmDf8nEp86h44LchG8fRvdqEQnqRPZGND
         XzfsnLRsJ/233KtP7Liou+x8bw+38GKJKgIlBpeCVP25I/OznAovPzSqimexjvsMsHw9
         mJdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713468470; x=1714073270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zNTjYBQSXlJdcfDAGNfhN/k6Tw+ZuKx0L+6ToWVAoUI=;
        b=iTX1JOUI9ZzF+mUJjnRkFmJ0tTv+J71cbqSpp/6RT/h2UBBCIlf2UxipUITu7gvEYc
         1fj7P/n0OKBgL03+MpKKm93gL6dD7VDUkNDo9F4u+02h6Ln3ZtBeE5G8bSZ4v5Lf9FEe
         TkWDdM4ImHF4HQadSfAAHH1eBjVPYoqtvUqciF+H5xFfv+KqiKclslQRzypxkrF+Oe2+
         uZ7kOENFWIZkmu9cf6/s2Ap9pC71s74ZZ4KgOuDYGRYh85D5IhQGRnwGozh1sZDhlclX
         INza/LPUulqbPMIxQo7mmJtQ6ilw2IizzWkT6oToWLdK2KOa5JYv1TjLfF2GsX5M31uo
         Ef4A==
X-Forwarded-Encrypted: i=1; AJvYcCVV/2hSoB0aeUJCrUNHqyipzuz6NjkhVFvnG5a/FaUmrq6MbbQxRpAR6Wiat2PiMnwplI58mcl6iZ7AEDqp/SqlvNbh3AeS
X-Gm-Message-State: AOJu0YyAgFJDFL8CsAuwYbsx8jFK3d0F1fH/PGAJrVVmMLP7JRByQmKI
	eUFOjP5cKoFrxUmRJdZGtRH0HmUIFSKAcXud1D+2AqijKEKFjmnnI9PkysC2IJDQ/Q==
X-Google-Smtp-Source: AGHT+IGRtbT7LlcI6CQVHjULTyTQXTmBNJ6XYFrkIeD3sIOYqal3qJsUOamHWsXIg/SR6F1S1/+Vaw==
X-Received: by 2002:a19:550e:0:b0:516:d250:91a7 with SMTP id n14-20020a19550e000000b00516d25091a7mr8569lfe.12.1713468470564;
        Thu, 18 Apr 2024 12:27:50 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.151.213])
        by smtp.gmail.com with ESMTPSA id z5-20020a170906714500b00a51bbee7e55sm1259679ejj.53.2024.04.18.12.27.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 18 Apr 2024 12:27:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anton Johansson <anjo@rev.ng>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 18/24] plugins: Include missing 'qemu/bitmap.h' header
Date: Thu, 18 Apr 2024 21:25:17 +0200
Message-ID: <20240418192525.97451-19-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240418192525.97451-1-philmd@linaro.org>
References: <20240418192525.97451-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: HRgjlx+A3ETM

"qemu/plugin.h" uses DECLARE_BITMAP(), which is
declared in "qemu/bitmap.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/qemu/plugin.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/qemu/plugin.h b/include/qemu/plugin.h
index 12a96cea2a..41db748eda 100644
--- a/include/qemu/plugin.h
+++ b/include/qemu/plugin.h
@@ -13,6 +13,7 @@
 #include "qemu/queue.h"
 #include "qemu/option.h"
 #include "qemu/plugin-event.h"
+#include "qemu/bitmap.h"
 #include "exec/memopidx.h"
 #include "hw/core/cpu.h"
 
-- 
2.41.0
