Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp6426771njd;
        Mon, 7 Apr 2025 07:48:43 -0700 (PDT)
X-Received: by 2002:a17:902:f70f:b0:220:cfb7:56eb with SMTP id d9443c01a7336-22a89bd53ccmr183317625ad.26.1744037323563;
        Mon, 07 Apr 2025 07:48:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744037323; cv=none;
        d=google.com; s=arc-20240605;
        b=JtlOTymUN18i8bkvAWctLZLYviYFFpOYBWdWItJV7nz7Edf5fVmp3TlP9xf3q9XWB2
         hMHU8OKinl2s4WUOOpZa/ZQQrzySR3iTHHq2hwzAaHTXbqDc+dAQ/T8AIcHvDROd1XBG
         bHenA/wSLU0emZOjVyjg2qwMFZAvavg/iiTbslq1H7d2rJncAXTmzSBXE4iYNq5zZxxR
         duNBsV8B6GPgb9/ClPo+ZGGsQAffJ+xNiQ8fRYem03bxjtMOofakyuYsYedhU9eYYlCg
         mrueHUFJvpHdCjizLSTFDgGI4Jrq5MrhruSwWuMQGehdlrGjokn5pJDLqFEpvZWM+WLr
         mCXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=lEH4N/I/i1s5vyVW9hh0H+Bl+rbHvsyMVIl7sWn6eKY=;
        fh=Z0ZHZD2ed13NVhxE6yyB8cqggOMkjMwuG7ZWT+BZzeQ=;
        b=LbgVNKzulWFQE3KMF0Q4cGt0E3Sm6FzceemoQjnJW0M5VQQTWo5L2ly9sBNBvnW0Fb
         7ZQ6zWm0BztAG0wxQs/c79QY/ruyUme/2ANi3/6/0qZNjNAMnkefJYeyMxZrJOvYouwb
         1+Lmfr2fBSBTLaWlUO00jCybPFxv9kP2+/mf6hcoXSTVjXW9Kf1pJZH/V+HxgcUXfSrt
         FQmoRY022ChMBiz+ND+Gna1ponylc0O7GKbU0ABXMlrddBY/vwKPDlw+oucSEVQYJNwp
         IKyDRRjXyxuUgyvn6lQrkr1HrsmLMAum3U/5ChKZ8D9cb/zcIa/eyvaQ56DPWhOlG3YI
         JSjQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=AGBDeL5L;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-2297863e8d7sor47541915ad.7.2025.04.07.07.48.43
        (Google Transport Security);
        Mon, 07 Apr 2025 07:48:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=AGBDeL5L;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744037323; x=1744642123; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lEH4N/I/i1s5vyVW9hh0H+Bl+rbHvsyMVIl7sWn6eKY=;
        b=AGBDeL5LxHbj2cS6z9grSmQoBqhu+FE8W48fVgt0meDKbDVK9sBwU2OPvUHa1GCKkn
         y5eRVYLtWiCUQCgQGz0t06ghRzFkMdQvVptbxhkuuHf2YNPhoWSEIaNW+/GwOKn23zv1
         HH4hBhq8j8tn/4wqrF52aRC4TgudWAtHA5VQ3YX3C4v6ektJuhYxUJ+5MPw9N9m0yraw
         1oTZ9yrvG07z3zhqznnwlfqs4T88Nr//ysHwSqgfnySrduvyK3XygC3zeEUNTt8t3L+X
         JBSIm7MFApbuUztpkgAFmMWJQn9sx5r/ACVZNlXaeh8sRa1LClwvVzTravGdu4zUWBqQ
         UScA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744037323; x=1744642123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lEH4N/I/i1s5vyVW9hh0H+Bl+rbHvsyMVIl7sWn6eKY=;
        b=SModGUTAa4KAXwbxzipZXkG5G4dSi8kb8WwRExA68ePPugZzWYoLwDk7BHQke3WKia
         TxAl5AJN/DyR4x5rd5gKoiNPNfBkRh6qjmzUczuaJF/d7A40SBG1Rz57rnH7RUyhbQeX
         RmY4jHsbrmIn1NTcVnfJC3ZROEDBtN/R9kAyxPbxNjJKpBIj8cZ+/JYIqUIVfmFlNtcv
         xWEMzVsOldgtuInN9JQ+V0YfibzRyIxapjedAhzrePe97g7/SF+53FctY/9PfWmJ2IJR
         cJ4O9Wn6ujnnsq1X5BiaRkI+LDnbBsJ0ckknYMttNB/YugMf12CJNTQiV64DFegz44DD
         d3hQ==
X-Forwarded-Encrypted: i=1; AJvYcCUONws1+KoSE6rqelLf4KV/vMJrE5OwLQX2oEHg0hlALv6BfRQMzK0D47dhf2/+YiZrzqCCk2jsxLDOwNPg@linaro.org, AJvYcCVfx7kvobTftbaYA/+Agq7pcLV9X6cK66UlkIeHWUHfgINIdmG7ZoreK8gz15AMM2P78E5k3BFf@linaro.org, AJvYcCW8rTkvF4Jju0aHmgJjR80vY2fVEPt7twXIfQehOP4ckaqLWvNNyDHQXe+lOoWaR/iFlPL5Ud3L96HIE8ML50OcyTw=@linaro.org
X-Gm-Message-State: AOJu0Yzll2ZiL6A8BQOMjja0KckrrjOuK0kp5qCUkHg2kvVlyLwfHcm9
	f9LdV2HbCI4XPJwFnIxUgQnK2W1ea4MFAfPQRjUaNtjI/gjvjsiK
X-Gm-Gg: ASbGncsgQYelG/yV6Vl10laJ3F1ztQZFwKimNe49aqsVCjTDynKxN9ZFVBp9LMfR+7v
	OtMIIPx0RqN76dL2Ow+0ZzFAP0wi/LfwctGh8p24PPsnShsX2tvea1bVcdRODSihIx0V5oBw/73
	+x644wdKGu3eBXdA694XxdIHnO/Ay0Cn0sZ52MTsW+u+DI/LwVqJ3mgv/oWYmy3C2RE946FedhY
	ZsWV0y8o6Sue6qKtZ+wf9E55G2PjHiQrmdbLfVLGkWqDnHUmZ61Iz4G7GEkIlaORG0wNQI3jzpz
	jfmT+Yaomwik15GcCz7DvAVFarhFNAiyiSGicmnOwLINn0zFQ/Aktrq+bOW7aw==
X-Google-Smtp-Source: AGHT+IFVHb0USmbrtgolvVJ002qQw3Dst2XwZdUHXHObbdn3W+d22R0f9QZhrZRZ9w1sgrYEyRLgeg==
X-Received: by 2002:a17:902:f546:b0:226:194f:48ef with SMTP id d9443c01a7336-229765d1ad7mr251187095ad.13.1744037322987;
        Mon, 07 Apr 2025 07:48:42 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from localhost.localdomain ([240d:1a:3b6:8b00:8768:486:6a8e:e855])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d97ef3c2sm8856960b3a.59.2025.04.07.07.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 07:48:42 -0700 (PDT)
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Kohei Tokunaga <ktokunaga.mail@gmail.com>,
	Christian Schoenebeck <qemu_oss@crudebyte.com>,
	Greg Kurz <groug@kaod.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-block@nongnu.org,
	qemu-riscv@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH 10/10] MAINTAINERS: Update MAINTAINERS file for wasm-related files
Date: Mon,  7 Apr 2025 23:46:01 +0900
Message-Id: <ab804f360d7828dd281c337e897c5817410e075d.1744032780.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1744032780.git.ktokunaga.mail@gmail.com>
References: <cover.1744032780.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: LIqQvrTaTvDp

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d54b5578f8..ea5fde475c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3903,6 +3903,17 @@ F: tcg/tci/
 F: tcg/tci.c
 F: disas/tci.c
 
+WebAssembly TCG target
+M: Kohei Tokunaga <ktokunaga.mail@gmail.com>
+S: Maintained
+F: configs/meson/emscripten.txt
+F: hw/9pfs/9p-util-stub.c
+F: tcg/wasm32/
+F: tcg/wasm32.c
+F: tcg/wasm32.h
+F: tests/docker/dockerfiles/emsdk-wasm32-cross.docker
+F: util/coroutine-fiber.c
+
 Block drivers
 -------------
 VMDK
-- 
2.25.1
