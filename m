Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp10326063njk;
        Fri, 3 Jan 2025 09:22:42 -0800 (PST)
X-Received: by 2002:a05:600c:4450:b0:435:192:63ca with SMTP id 5b1f17b1804b1-43668b5e038mr376726555e9.21.1735924961764;
        Fri, 03 Jan 2025 09:22:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1735924961; cv=none;
        d=google.com; s=arc-20240605;
        b=JPBcRRnOme1Mqx+CKlJ6UEid0CJg8PH4cjn4pwMI0xtAZtviqqrm0wKxJ519mKADjL
         94+wS0HI0eGsjRFWHM4+uRhyNVJ8Eh+ObJBh3Wec/1xdFEZr0Sw5ejmAEPJW+tcOr9ge
         x+cWch4VdJVScBY6HYP25MBxEpZcmcqPxN5ChxBjjy37NxmE4R7PwL++ypLMAJ6D2LSz
         DA1Jl/FoujRMwRl1kZQ3srKqCvxTJDYiNYTpfk5pWgNPCEkeC+8p16kCKjEHnMtFr48n
         jDbHdGPFsou1sCmtI5OqLxNF93PSdHWejRhzIfP9hsoozfMWitKHRLKoeUHyVAs71+Xa
         r+/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=dNWNLD3TOQ90+HAs9bzy2nivedS6mvux2NVJyj5jEvk=;
        fh=VYVTokkxi90E9CFSUnDi3tRFS5HQjOSzivGA0Gm1Tx4=;
        b=XijuK/ZyzVAtbsO9jgB6Gtp34KBW1zqRd4IOt+IYey9ZGjdv2rMBEXooxAZP3GdSIl
         FXObG35UNgwlHzxL7FnBjwhtoGGEoG6+4w6D+p3pr/8FT8R3KjgX8Li9SLPo7443fznQ
         RV3LnbQ3bIOXYxEknXdlDZL1EJMW5TrZILRqBvUEMYPPElX5S7qyxl6dHA9EN/1lhi34
         HcQ861X90FtKxA8KxtEdyUHXnhCuZVFSdFkfF0sHyHA3nzRREAGiFMbs45I96oSwJB3j
         T9XK3xcFiDivKljKfzbEO7d9pxbgGyofC+Bqrl7dfznTrGjSk7pJyisFYiNPua8hh8cy
         KwCQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ctPQImH9;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43661260c6csor78150545e9.9.2025.01.03.09.22.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 03 Jan 2025 09:22:41 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ctPQImH9;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735924961; x=1736529761; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dNWNLD3TOQ90+HAs9bzy2nivedS6mvux2NVJyj5jEvk=;
        b=ctPQImH98+Ed9ACP0wUGQBZq/YfgMgW6o+k//twMK5vyD+SgLPjUJeIx6snFZZDyuj
         PHAR9tWFNUs2lIAhJFSugxpemf7DG1EV33fMP3a2tDpuklS08TBICzvw/7n2nLXGfvpS
         kR1sgl63bbAbjIbx/oupgVdtvD7luzysRMr83e60RdUsUUl1yJ+ElVYTvZcBy1Q/Euxm
         c+GgQgEQ0TNRm5q5HwqOWfbQ5JFpE6ijP9LVvGjmtgacVkiNYn2hmcqxhAt4jtoTVGHu
         yCb6q3wboDbidxeRl4qzQ3vti3by6KfZynu2IQ5/rPH2u4wU/S6UnAh0NG4z2AZz0c5E
         C+gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735924961; x=1736529761;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dNWNLD3TOQ90+HAs9bzy2nivedS6mvux2NVJyj5jEvk=;
        b=g1XrzvUf+r5nM++GmqxNQ7Pstdur63/Rwmbw/XS8NRibU62WhcVLGpeDK1IMI0GiTQ
         tzc6TomVVa9yhLSUpjT7HRe8c0Gekl2n9c2YiAJZdLZ+qyTO7apGEHW6hqTJloSDZrFL
         00rzQjgM5XmAwikKCk3Tjuh+zL2+0/jiDe6FxpOurxt1tqMjaTG5M0Xd4coNjZ2hfSpl
         AlzA++0nPIYnffvcrMueJgMGnxEszx6/FEM+6nrapnsBUOVbMWjp+z02NBbZHuqeaLfC
         K6j0j+6ZDCLBbEW5wA04xPgEkO65SkWm/V1IgRYMqNv0vi6xbgjJdXR4exwmiT7IkyhQ
         KPUA==
X-Gm-Message-State: AOJu0Yy4AF5TR3geFsV6t61lcqX2MpN8K8TsFmBlmOkyvcwRzU+EgnfK
	rgqshw2C1eAcZqj6obKl6+hXlPz5EIkImS8oG9jO9XfXmNgXK+1PSlFR4cGG64rsSa70bWzG4j0
	3Jg52zQ==
X-Gm-Gg: ASbGnctLjoYh2OO4X7CmnS0ZhtLNqHD05vwmugJoOuMLAEPnoEdpIdiQBaj8j8suV0m
	hZ3NWnEv3HcNoMzevIWJWCk9o0jJpjH0MAJPccI7AV2+Q/9AcME2l0Nm76TDt0mDy93ytzlgFu4
	r7FlwvNXK7ghcbMDV1qcMg3a4+YayEaLTOrSbAuQctngLq5jojiqUfrMXCS35XXASIKJf0ehXae
	oLUFKTJiIZwe/tK58r9zs8dEoJoI2RyZ9teBge373r0fhd9cXJ1y0VvNWtzzeJVLNUdDuJgjFbt
	6Ct1fVvVJtaQi5ZY+yeqijQmOvissi4=
X-Google-Smtp-Source: AGHT+IE0Z3BqSonF42KMbdKuboPrqf6YDSMmLjVUEI1ruCWv7zgfIMX8W/6w5URpwO7RduJufUUyJQ==
X-Received: by 2002:a05:600c:350b:b0:434:f8e5:1bb with SMTP id 5b1f17b1804b1-436686430a2mr451498585e9.12.1735924961214;
        Fri, 03 Jan 2025 09:22:41 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436612008b1sm484965375e9.15.2025.01.03.09.22.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 03 Jan 2025 09:22:40 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Fabiano Rosas <farosas@suse.de>,
	Laurent Vivier <lvivier@redhat.com>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v7 0/4] tests/qtest: Update tests using PL011 UART
Date: Fri,  3 Jan 2025 18:22:35 +0100
Message-ID: <20250103172239.18562-1-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: edH4Y216c5wx

(Series fully reviewed)

Since v6:
- Corrected ASM comment (Fabiano)

This series split a patch [*] which was previously posted
too compact in multiple trivial steps. The last patch
initializes the PL011 Control register, enabling the
UART and its transmit channel, before using it to send
the 'T' character in the boot-serial-test.

[*] https://lore.kernel.org/qemu-devel/20240719181041.49545-10-philmd@linaro.org/

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
