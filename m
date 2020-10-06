Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp871639lfq;
        Tue, 6 Oct 2020 10:24:16 -0700 (PDT)
X-Received: by 2002:a17:906:881:: with SMTP id n1mr589489eje.502.1602005056808;
        Tue, 06 Oct 2020 10:24:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602005056; cv=none;
        d=google.com; s=arc-20160816;
        b=qn8saWu2Dy7grExE22H1fhww0/eVR0K3oMEyBfTxXLQNP4b7jwq8QXICS8GOa1T9wr
         wRDo8a0acfkrs76x71TSxSswjnHvVCXzbTZ/0eJ9sn6E45Uj/ptuFLZ5J/gIX7NdTToq
         2j7DBBFsSa4HJ6EM+Tf9HKj7P1vDDIbuBoPHO9Rwxwo7TogSIBS0QfekXKJT4g9GpoNU
         Px5mf4QiSTiT3mmrYLEI6X4+9l7Es6DguMdClj0xgKmKUP15sIePw17gVNLQVsaskfjL
         f9MT7KwHsRTEd2Qle4nrVKJGrcTQ2g1GXEOLGDOZW3t3MxhS/nA7Dpc35kl4bj0Sshm0
         54Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=6EoYhQEwepyJOet9GdIdyEvpKJ7MIJ8V+HlUJhfVcb8=;
        b=ToUhTRFNwSuBppnLwKKXdA79g62VNLWTIOykQvmZus7ZQ41vMQ7tdHiqSxMbYmpo+7
         2ZEm1rhmbG8mXSS71/WhCUvwwWFo8FKBQK5cSsmSiGXRLnnyT7MXYlzNYYEcm9UH61cJ
         nqq2mcIbJNUutXBfWNtp2BZpjvtcF6Qe5NUO/jYPfCDE1/rSRCAP0oc+zxUHfK5lap4K
         0gay8DAM0ngLZCkv5b2CU+cSq8SdahAiZ9yWwYqieiZyc09y939BUyPBPSt2GFv8mLSv
         d2m20LrsSgQaDdL3K1xXWAAIzJLnrZCPiJfgAfXdYPGZL8JCRtFbsNhoE0gbtNwzbEpe
         zOVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r7h3Fxcy;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id bw9sor2395007ejb.91.2020.10.06.10.24.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 06 Oct 2020 10:24:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r7h3Fxcy;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6EoYhQEwepyJOet9GdIdyEvpKJ7MIJ8V+HlUJhfVcb8=;
        b=r7h3FxcyPANqlR9lbRX5DMqsDbiKZzS81YxNP1lvpKa2qeWgN0Y4LXWIobAgJSpM28
         TfOhtwBg3TOs0r50fheI8PyLLG775iTjjWEDnbdYVd/JLGYS8bvYXl6LFKOUZ//nSz29
         OnbIvc2ClB8DFZLYqpfUB7mlDtexmO8MvitC6Xo03gVi8FYAWB5bBa8isBP2+JjQ0T9K
         5rHqnepfU7K8VECvpUVAX7sTNpOYb/v+oaRReDzMZiEb2H5Z1/721Ad+wKYd3/idXq6a
         Oqdat+xB6tblQuPguqrBAMyhDm+PCSZOW4xJcsu7E1EW7DfHBidmg90/XePeCszB4vK3
         su4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6EoYhQEwepyJOet9GdIdyEvpKJ7MIJ8V+HlUJhfVcb8=;
        b=cRMKtPtx/fo5MyBaoJKCnOd65EM1lm11DpI7W+HsXSS2HHQE57LssMTuNiflmIJ3hE
         FZfuYv8nXG1kHgg5uSPXjluL0OCWgKyViOVd8DPr7aWCFWMqZBvucuwuA17qLj6NY8vB
         qG2X0ieITa6YvmJHoCVtgWG9/4rvdoeuBhe7MIWXBezSKgyiEp/gpf48Diwb8aUxcHov
         MzBVIF5tB9lmFNzJEVnMutsc5E1Cx18asU12XSv3zQNHPIFzJdmDmTJDv6vbPIsxruvT
         D48Y49ak36wFSnI5oEXGbrC28RwjNfPbjr2MUbheTl1H114EAyKV60fFP4mZFvwFUqs7
         NVWg==
X-Gm-Message-State: AOAM5323nskUOGO7RNXqfsboGqDH9PdZImguyoZCRVh2oz9f2GMRde+4
	nNNLjwAjpVUi8+MS5HADiTIMWKf1
X-Google-Smtp-Source: ABdhPJz+HxAmmnwP7e+6m3IVDRfiGdqhxXy6sPOPsM47kxiVccGeHhcAmMB3hRWQmyUurnYiMIbz2g==
X-Received: by 2002:a17:906:3ad0:: with SMTP id z16mr625735ejd.193.1602005056569;
        Tue, 06 Oct 2020 10:24:16 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain ([185.81.136.21])
        by smtp.gmail.com with ESMTPSA id a22sm2536968ejs.25.2020.10.06.10.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2020 10:24:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v10.5 0/1] tests/tcg/aarch64: Add bti mmap smoke test
Date: Tue,  6 Oct 2020 12:23:58 -0500
Message-Id: <20201006172359.2998-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: TyoGWhUJBB33

Based-on: 20201002215955.254866-1-richard.henderson@linaro.org
(linux-user: User support for AArch64 BTI)

Adding a second smoke test, which both tests PROT_BTI via the
syscall, as opposed to the ELF NOTE.


r~


Richard Henderson (1):
  tests/tcg/aarch64: Add bti mmap smoke test

 tests/tcg/aarch64/bti-2.c         | 108 ++++++++++++++++++++++++++++++
 tests/tcg/aarch64/Makefile.target |   7 +-
 2 files changed, 113 insertions(+), 2 deletions(-)
 create mode 100644 tests/tcg/aarch64/bti-2.c

-- 
2.25.1
