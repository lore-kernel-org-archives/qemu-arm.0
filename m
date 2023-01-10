Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3316638ejc;
        Tue, 10 Jan 2023 08:44:26 -0800 (PST)
X-Received: by 2002:a05:600c:1c97:b0:3d1:c8e3:2452 with SMTP id k23-20020a05600c1c9700b003d1c8e32452mr52102681wms.30.1673369066883;
        Tue, 10 Jan 2023 08:44:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673369066; cv=none;
        d=google.com; s=arc-20160816;
        b=xtw0ZZ8/wWkY1BTwMYW2+HhWbEIQpD+Zyj8ceH3oi+Uw1rIJ+Kv0vnAkjfmZ/uIss0
         FYVRJesvfblJQ0GgQaj4Q7yqcqjiSdAXsu+tqqknGdCLHMU0JpO9/hLDCOTmfXZSmBlx
         koVS/QHKSOVkAqHCI/AsfbfASxacL82pI8oYv53FMaUXv+G19Ask8ODAU0Udc+aD4TSk
         28rwa22p9HXfZnrN5FBDVQ/KmjjioLb9HADuxGMcpTisSBJQdA2zjiCiBnXQM/FMbgbt
         ovK2LOyJ6v5WJ+i+gNFuXbFW7QSUJvGa9aF993ztr+JiDkD50djQxQwsmHsR0He7useC
         ieDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=mv6b5BVX+E5dEjhJ+rRg+doFrBJfje2G5RxYlkiYMSQ=;
        b=ukxXjuBmQ26GonKqZQrbTN9csfVZaxkYulu9QRJMS0l/XfESVb2pzxL2dLKaXSdrao
         CHgVX4vRoa7kq5enBIZlOWDTQPBFQVqrl11kSuz+9TWQzarMDHs9sr92KiVpNjcYLaSB
         xAgBvvd3T1+iYIOtmgKx0Y8oklojSrTSLQZUHj+D2I15iLJCujGeDgQlPQA+4nt9ztA0
         HRcoiWnyeAgStCGwE6XJ+/Czx3NZr/A+iJMcZp86vZAtK0m7obuAWt7mHudXmbxUs7Uv
         feRpc8ANSCuMfSuCMpVAgVpl/u+v44GkefeTgxtNqkzEbB739mJ6Ej9rFiRdKRdIXK9x
         gZgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EGwEFMa5;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id h17-20020a05600c2cb100b003d99a390c37sor3840197wmc.45.2023.01.10.08.44.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Jan 2023 08:44:26 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EGwEFMa5;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mv6b5BVX+E5dEjhJ+rRg+doFrBJfje2G5RxYlkiYMSQ=;
        b=EGwEFMa5ohJrcCLO3bm4qK8JpoFkCAfd7aeQrdHSR7jEMKA0GhQWFpV7m9oded5D8v
         iSQOUOsKG2aE9Zu4cJWon2NmJoi4w+Cy/CWeTqAGQ3rC/tzcMms0e0yVRtQHXlHdreEo
         2hhGYpFtA5Ts4i4hBH7dEdXFipfbDDlM93SJNU5IVcvXZIvW39TgA8BFfqXboS/Ogu9I
         vjNQ1SiwD/lyek7RT1sQH0Ev13fPrDVFZVc+nc4znQsHd9N2nWuhSSvdXihDbxZnUxcn
         E0+Swo0iH1YjXRTLziHWQhPVSMetOfDX1lULv6mopRgd7Yg2GRAWv0qq0ggk6j153c9q
         8bTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mv6b5BVX+E5dEjhJ+rRg+doFrBJfje2G5RxYlkiYMSQ=;
        b=elmhQxxH1eCBLXRth0O0KVOf5c9RG+KcRaJPerH778Zva9LZqzCUfr8OrJW33VY9CV
         Wfz7AQxKYhaqYjAU5iKKzSHOxdKZefAEmsz1u9pHCNsYG7ufJguyqT0n1fSmnuWLe7Bs
         0nxEZ31YhfAkoSx5G7q9SuK+zKDosohm32yGVCrdrFMPFGiq7Z/kJxgjA7WLNT6+6DB+
         lazLRV5OuDDaeUplPtaxO0OrCLcyLLmuibqOLiAAJqlvm8pBFLNN3U623rbyETT+U3mP
         mT9pWWo+FxvgX+1cDVSXPJmjvkzVj2nkfqNOLh08a5qVdEjlbLWskvC6avwAst5o1lU0
         1feQ==
X-Gm-Message-State: AFqh2koJPqYvMV5SGCK7aqApDYw4QAX5U6olWX144hUhljuyppnKhvGL
	XiLg7mwCI3WXwO1uhwVYWQ19TA3Q
X-Google-Smtp-Source: AMrXdXvoNff2pdMsQLp8LwxhYT0eToJUKvKyvOP7gjM0ylrtULNkfWY2aeJe2dLduSKZt24Z3pw+Kg==
X-Received: by 2002:a05:600c:c07:b0:3d9:73fe:96f8 with SMTP id fm7-20020a05600c0c0700b003d973fe96f8mr43396466wmb.32.1673369066705;
        Tue, 10 Jan 2023 08:44:26 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id k4-20020a05600c1c8400b003d22528decesm23390981wms.43.2023.01.10.08.44.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Jan 2023 08:44:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Niek Linnenbank <nieklinnenbank@gmail.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Antonio Caggiano <antonio.caggiano@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Jan Kiszka <jan.kiszka@web.de>,
	Beniamino Galvani <b.galvani@gmail.com>
Subject: [PATCH 03/18] target/arm/cpregs: Include missing 'target/arm/cpu.h' header
Date: Tue, 10 Jan 2023 17:43:51 +0100
Message-Id: <20230110164406.94366-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230110164406.94366-1-philmd@linaro.org>
References: <20230110164406.94366-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: OsqTQ/qOcez8

CPReadFn type definitions use the CPUARMState type, itself
declared in "target/arm/cpu.h". Include this file in order
to avoid when refactoring headers:

  ../target/arm/cpregs.h:241:27: error: unknown type name 'CPUARMState'
  typedef uint64_t CPReadFn(CPUARMState *env, const ARMCPRegInfo *opaque);
                            ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/cpregs.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index 7e78c2c05c..63b645907e 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -21,6 +21,8 @@
 #ifndef TARGET_ARM_CPREGS_H
 #define TARGET_ARM_CPREGS_H
 
+#include "target/arm/cpu.h"
+
 /*
  * ARMCPRegInfo type field bits:
  */
-- 
2.38.1
