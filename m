Received: by 2002:a17:906:b756:b0:9b2:89ee:1eb8 with SMTP id fx22csp300669ejb;
        Tue, 10 Oct 2023 00:49:56 -0700 (PDT)
X-Received: by 2002:a17:906:51db:b0:9b2:b9a3:d20c with SMTP id v27-20020a17090651db00b009b2b9a3d20cmr12579219ejk.74.1696924196556;
        Tue, 10 Oct 2023 00:49:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696924196; cv=none;
        d=google.com; s=arc-20160816;
        b=lLhMqTQ5GfemJkGvFnO00yH6Vg5Cif+Sh1aGv6TuwSm8PAkh8M9Pg2iLpmdpY26xX0
         5DlKzij5uv92wyulS3rxFHLz1F7FhU54wvxYoYrVysGXzGwWQAZcCmMOrMbAzWRur8xo
         qoI4tE1GpyyUeQs8chXiDIqSkvfKShrVMPzyuZi7IUhwa2B/LBQL7nam8Xwz1nXAs1He
         rT6Nf6LeQOgJQnACRJ2Qy0h569ZmQ0xHR4kJjbpNzNa+Wgb8z2YZm0bY/1uOVe0Bqwtp
         BOfGxWzoc/Tjn0fnIBDFbfLrA4kNFwKXALZTN9LBlDAmurNACxq1vOlLt2Zfkqa/uxUh
         W/PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=JOtqibj2dbLOoy6fkge4kltiRjME8crv5WjHZGdx+Tg=;
        fh=H5ieliU25sye5YHfIOtq5FRCn6jB3GWQIglrsMrNJhA=;
        b=kpgNF+YbecJZnkr9mrWQW4mCSy3SvXOXv6fYjg7PKkHHV+lZLS1rlKJhGXbkrq0L4/
         3bcOHEg/Gu+m1oJWdKGUNbfIX+teGjexIxwUGL6SL2MNO16KnMaW4z+N5Pqp+Hv6R6QU
         xJv/HehC6ssfnwKq7vBRbKNNAhrb57sPDIVqs1pCQNRnB0Jfiqn93iWRa3NmaWERtlrr
         G/XnK5REW2iMuKX5e+ZWiyvZ3eCAMP2WzU40sCrLOcnJru1rEMTyrmkIyxiYSch7ZTBc
         H7TnHnofEQWgCN2+Nj0Hc+fV6CuXinWQt5M8XKfKcjFBQ05bBK09HkmtNSR6HY3PnyzL
         kYPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=trO6c6wk;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id jz11-20020a17090775eb00b009b2862c6bbfsor3944688ejc.20.2023.10.10.00.49.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Oct 2023 00:49:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=trO6c6wk;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696924196; x=1697528996; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JOtqibj2dbLOoy6fkge4kltiRjME8crv5WjHZGdx+Tg=;
        b=trO6c6wkMfBNpjmj8i21HBrq9+/4vbdb4sscL18tlYKZbeY0SDtcVAsY09J2ACipY+
         XLSyN2MhcrDMqiFO1RO86micp4KAS5lusCrqiH14+2RpjwJ5xm7kgT8ic0zNzbs74ghY
         q9/Qhd6OOYKcZsJzG5l+rR6nUf26c39uw4LnaclreOv2gO6XooJU1atzVxDz5SxEhbSX
         EU3nEyypl23JB67H0/6wi2e7coTxmFg2dgvqm0s5jthdxx8bzDo5RNQEL8Zn4BFQdo4P
         SOTbGtz3pQ9zoTZ1zeItcYgwx7oZvBgpXjMA8sAdgt3AmiqO6xBddAx60gR9Lv1dg2Q2
         cf5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696924196; x=1697528996;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JOtqibj2dbLOoy6fkge4kltiRjME8crv5WjHZGdx+Tg=;
        b=U/LWj7figYClWI6WO/YbmlqDljtN5raF7HMzWSl53VkQ4x4sIXpqI0h0Bvm8Moelze
         4wZCAGVPqOUCL7hOXnpgomsUQILoJtGcFKeBSp3oLwX8a5/AH5vxB43DNzFs2CA3dfAW
         KceH7YADwodNIRoV4gx2ujEga+edzk0rsv9KwDy3JNV/3wDdYpMPGOxP0VtodtlYO5aZ
         azAZBjqoZ1KE0d5BHjZ2/ZiGqV+zHmkdovJe13SwzRah3e6gTZZBOd4lp0kEnGC8KBvX
         7b6Pkwov7aWgYkEVd52kA4eHDtJFU/hsqHr8DReHJ1UHyuhWAKpIlxgsX5HBJsgmWajp
         7prw==
X-Gm-Message-State: AOJu0YxFk0wFym26+rkJTjVsT48Wv9TT+v8n6dWCABaaaGRwvaTIS3eb
	8++MLcfltYpnK+uWSeshtOluvnmr
X-Google-Smtp-Source: AGHT+IGn5xd4xjifpMZWqv3hO+nMNbC6Ki6OXNgt2RSlF4Hs8lSBQ1LGvZ8ECrTZ0+6dtpz/ZesOUQ==
X-Received: by 2002:a17:906:25d:b0:9ba:1d1a:1e2c with SMTP id 29-20020a170906025d00b009ba1d1a1e2cmr5029409ejl.34.1696924196033;
        Tue, 10 Oct 2023 00:49:56 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (aif79-h01-176-172-113-148.dsl.sta.abo.bbox.fr. [176.172.113.148])
        by smtp.gmail.com with ESMTPSA id r11-20020a170906364b00b009a1a5a7ebacsm7887987ejb.201.2023.10.10.00.49.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Oct 2023 00:49:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-ppc@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	qemu-block@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/4] tests/qtest: Introduce qtest_get_base_arch() and qtest_get_arch_bits()
Date: Tue, 10 Oct 2023 09:49:48 +0200
Message-ID: <20231010074952.79165-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: TAmnngBxeb2A

When unifying some 32/64 architectures as a single binary
(for example i386 & x86_64 -> x86), some qtests fail because
we lose some information (the arch bits).

This series introduce the tuple qtest_get_base_arch() /
qtest_get_arch_bits() to allow the tests to keep passing.

Eventually we should remove qtest_get_arch() entirely
and rename qtest_get_base_arch() -> qtest_get_arch().

So far these changes are sufficient to keep me progressing,
so posting up to this point.

Philippe Mathieu-Daudé (4):
  tests/libqtest: Introduce qtest_get_arch_bits()
  tests/qtest: Use qtest_get_arch_bits()
  tests/libqtest: Introduce qtest_get_base_arch()
  tests/qtest: Use qtest_get_base_arch()

 tests/qtest/libqtest.h            | 15 ++++++++++
 tests/qtest/ahci-test.c           |  5 ++--
 tests/qtest/am53c974-test.c       |  4 +--
 tests/qtest/arm-cpu-features.c    | 49 +++++++++++++++----------------
 tests/qtest/bios-tables-test.c    | 22 +++++++-------
 tests/qtest/boot-sector.c         |  6 ++--
 tests/qtest/device-plug-test.c    |  6 ++--
 tests/qtest/drive_del-test.c      | 16 ++++------
 tests/qtest/erst-test.c           |  4 +--
 tests/qtest/fuzz-e1000e-test.c    |  4 +--
 tests/qtest/ivshmem-test.c        |  6 ++--
 tests/qtest/libqos/qos_external.c |  6 ++--
 tests/qtest/libqtest.c            | 49 +++++++++++++++++++++++++++++++
 tests/qtest/lpc-ich9-test.c       |  4 +--
 tests/qtest/m48t59-test.c         |  6 ++--
 tests/qtest/pxe-test.c            |  6 ++--
 tests/qtest/qos-test.c            |  6 ++--
 tests/qtest/readconfig-test.c     |  6 +---
 tests/qtest/rtas-test.c           |  4 +--
 tests/qtest/ufs-test.c            |  4 +--
 tests/qtest/usb-hcd-uhci-test.c   |  6 ++--
 tests/qtest/virtio-net-test.c     |  3 +-
 tests/qtest/virtio-rng-test.c     |  4 +--
 23 files changed, 138 insertions(+), 103 deletions(-)

-- 
2.41.0
