Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp9470092njk;
        Thu, 2 Jan 2025 02:58:26 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUyqXBXRTZ3fxqzGlW8YPGiK6kkbjechW57byNBBbpfCwbP8zT8gFcNu1Riy0ZNPxzQq4aWHTWHSYHqSg==@linaro.org
X-Received: by 2002:adf:ae01:0:b0:38a:615c:8225 with SMTP id ffacd0b85a97d-38a615c82d4mr3449687f8f.15.1735815506707;
        Thu, 02 Jan 2025 02:58:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1735815506; cv=none;
        d=google.com; s=arc-20240605;
        b=BauHdw0BqUc6cfttMgFiMux45NFkfQA2VUjBAZLusXROkAD1/SRv0FYVpQRpy3XvK9
         VIg6un9ZVlNZE8ZTIKqxNu4Y/zjF13j1MXeyjPSVbSYr1afvwTe57OU7z+YjASgZshw6
         EvvGBTBjeiHXYbr0XxslDeIBECg6UHHnFN+KXw4u0Hf4dHn2l80FKUJJAgVvSFkjSa2c
         P0ZNS9akj26BVuBk4bPztlhEPY2d5Su/TdzzI2yiCNMh539dAsFFlyKZq2NLk0fxDyUT
         1N4Md5R1xC+WkdKFEkjKxqiy1N4Yzo/YGrgi11yuwlr5mpVhg+e4QqsUExRd8EaVMqxP
         Fn1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=L/j8G5JVfC/edLaXM5aXpQItqqKBeIwBiIxQO8tVbYE=;
        fh=czYd4mjDcwKXiFHPnxKkPXinCBcIKTJkXvwr64v6bB0=;
        b=eqOOYCCxQn3N75cS0d2+ujg7GKaQ18jr2FRnRNs/SfpTkcvbCx52BNMvq2X4yruH9G
         EQZcfm+cNyMRTl291HiBK7GqY6IeaU7C/rnEZuDRDrb7fhxEHN4y72vRk9TeFRYG2d2m
         R6HAxw/V0ctWVWZWuWx9D5S8nUtqMN98bU399FP+fTP9XSnCT0xzA4qi1Dc1IipOfxQI
         301DQVZfjJ5J4kLUyhfz2UTbHobl9ys5ocj5sy4G+yNn0ur6V+WhRpVk5VJfJp3yKxB9
         7xA/L9EUyb2HfnnZO0klOVfApm615jDxIOCnrGzYMmqSjv6Bb5euAIGLpgAziM41NUc3
         1M+g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KEm4DNI6;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-38a1c82748dsor9589060f8f.1.2025.01.02.02.58.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 02 Jan 2025 02:58:26 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KEm4DNI6;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735815506; x=1736420306; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L/j8G5JVfC/edLaXM5aXpQItqqKBeIwBiIxQO8tVbYE=;
        b=KEm4DNI6mUQDAoPT7917Ny9Lh+RDqzJgMRssWtdv2jr1yoA228vyIjJXMxusQtkegd
         TsFaFe9q+fQWYyd6gbLoAOLIXvv40pmtMM8j5X4eJ4BP2LzpYeJZ9HaB4q3JYcJIcL/f
         Baqec83x8n+2fjOIhB/51+BfwBu/TffpqpRxvDsfdpjmnXI3/YmiwyWrChFIUhtmtVPU
         q5+IwlOQcTvqUfLw60DHFVKoq5KmcFqPUVUrb3vdPxkpcwnSLgFTSF2vIhv4HDf+w8Iv
         7wtZeJDajsztAGEeDPS6izXOUypTU7+XBxW8P7KjCSYVUbrpJBnxnyCzdK/hhrvwr4Fs
         CDTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735815506; x=1736420306;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L/j8G5JVfC/edLaXM5aXpQItqqKBeIwBiIxQO8tVbYE=;
        b=mVYlmR0e+PfSesxKO7DqbJL7v7/FXqwDVSpffLaju4RMzbFl+76Y8ehVKXR/18sYUx
         H08VCm7J4knxo79GcafjFyqsnWJZFXPfMET6eAmaMjbxBRG3lWJ7NcNwVh3OVEm9QGCP
         tG8zse0Sd7e4zu7PEBYxFwYON8WXhIqlqO6kzKHBXP6Hk7dKVaq51o1TAG7BKC/afFHd
         R12eo/Fer0edCB7Sl5XDd2UNYr6WZ2HOQh/Spa/z7C5QQJRhoMocyFMNtrKkQ6zEsgt1
         o1J4/Ew7JacjevwJdQf347fY/y8OvzVQmNtDwNHM0Mi86+i34hXpS4QsyNzBOSygXXJ5
         b1eg==
X-Forwarded-Encrypted: i=1; AJvYcCVuMuX/EHVvgF103QiuNLwNesmI++iNTfHzoGGWJnV3YRWpcLeMng/TnBLmYmLOoZoZQ9yQPrejqx8PYg==@linaro.org
X-Gm-Message-State: AOJu0YwVnWnJU865n5A47lWekux6WTi+uh9focBS7c9/mWbb56DyIAiA
	2zFG7gDVg29Hyhc2eu6pCHFMz2LtB03beziF6FaXRKhYViq7fV9OzzFHVOXI91MlaQ==
X-Gm-Gg: ASbGncucbMczfZ9jreWQuN+58SL4Yxj/vkVwVofdr16TAf8acUxR3/epnsXc43AfVKP
	o/mwbGEyGxPyVuDXO8X78yE7sgc3VRfRLaUrBsbkO1DskSCjsgfdSNqMUayCj73eNK6ZrHWMxQX
	QPPMcaqzMY6xU0bFJ9xClvGBDuSAzkkMGX3gKw+61VkZqOFS+5vIUVNmmn3IK0OFJ9AJhHrlToT
	/HgohyaBauTf5XGoqd6gVkCcSkixGN6Pgo2QaxsP4uuBTTy2JjbbE/OeTe9ttZqnw/rnIcnYM/v
	x2eIOjdKXy8hZMj9+BYAtY5Ukcai8o0k4LW6XY8r5SSe5w==
X-Google-Smtp-Source: AGHT+IGkPhm9Fit7zgxsHHqVLXU0K+bDv6jss/V1DIIE2ndr2jYlM1HJ33ssoTVHdOXAP1gaPtsqMQ==
X-Received: by 2002:a5d:47ab:0:b0:385:e16d:51c0 with SMTP id ffacd0b85a97d-38a221eaca5mr38013414f8f.18.1735815506135;
        Thu, 02 Jan 2025 02:58:26 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (161.red-88-29-191.dynamicip.rima-tde.net. [88.29.191.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656af6aeesm485138145e9.6.2025.01.02.02.58.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 02 Jan 2025 02:58:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Fabiano Rosas <farosas@suse.de>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v6 0/4] tests/qtest: Update tests using PL011 UART
Date: Thu,  2 Jan 2025 11:58:18 +0100
Message-ID: <20250102105822.43532-1-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: 5Ga1S9KODPND

This series split a patch [*] which was previously posted
too compact in multiple trivial steps. The last patch
initializes the PL011 Control register, enabling the
UART and its transmit channel, before using it to send
the 'T' character in the boot-serial-test.

[*] https://lore.kernel.org/qemu-devel/20240719181041.49545-10-philmd@linaro.org/

Supersedes: <20240719181041.49545-10-philmd@linaro.org>

Philippe Mathieu-Daudé (4):
  tests/qtest/boot-serial-test: Improve ASM comments of PL011 tests
  tests/qtest/boot-serial-test: Reduce for() loop in PL011 tests
  tests/qtest/boot-serial-test: Reorder pair of instructions in PL011
    test
  tests/qtest/boot-serial-test: Initialize PL011 Control register

 tests/qtest/boot-serial-test.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

-- 
2.47.1
