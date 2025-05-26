Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp3992506njc;
        Sun, 25 May 2025 22:32:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVtd7cA8RWsgY9B3vIKrSUnGX7W76Cfw8U3Pop2A59fUro488oplKgCGALEaoZnCZ6p8DwLaIrDDCi6iA==@linaro.org
X-Received: by 2002:a05:6122:6e02:b0:52a:bf98:55b with SMTP id 71dfb90a1353d-52f2c4c9553mr5815660e0c.3.1748237520305;
        Sun, 25 May 2025 22:32:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748237520; cv=none;
        d=google.com; s=arc-20240605;
        b=iPIEgRjhawc+fF4rP96VaugBKihNT4hrj1Y88fdhGVcqytM7zYssmCHdh07iqkuFNK
         z3rB35eY4mOcZtgLofKa9Aro5RkEraS+0pRQ1ragHzjIqnLJ5e7S9ZHMMOPFf5BfUA20
         cLbtAJngWccqt0zweBt7KybWVgBKhSskORDzGZuq+vRaGc+4ayO6kSULJe3zbo94BITv
         GWSCqIBrxsf1Uv4ToMe3i1z9ggtAP2CDsg+n7p2KQ1hk1GuvTxzOurzXApqvp5AWJD1E
         B2WCcFOCRS8u9dzvO6BUc3QeKxiLNcB9LQS96GSc5gsoXWIQyKVwjSmBomwZ/uq1fNH5
         RNhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=K5vADRSpaCj/9JLSnM/LCtAoOlQ6L/Ad7qAHo51qFbY=;
        fh=uV2TwEy0hac9lWM1K7hm+q76d6oGMHgNeXwlDMcaYQ4=;
        b=XvXKvYcE+atA0rTIvIGeNOAuNujDbKG0UtX5yiGatykDli7ZBIE/p1pXkNgsMJxBAg
         pQYIZ+n1EvjwBql0WFPxMkEB59gMIbnSyW0j8/PQDJk5TRTFqpg2OOb2aTpBKPgYRjHy
         Zz7/01DQAfoT/d93uralG8FmZ3qo8pT0ho1Fo4m/dErpKKFcaDI3zVO0Jn8ZGGpvbG/3
         OemG+Eq22f6WOH0XTynyHQsHGSmBExD80VEWtR/gFInRB9rvpvrXspbvA5LSrbmTvs0j
         uaX5Z5rh28AP5CNWVDlVvtywOfwRo34uMSSslpRCdzX/u18Xe6H7fbemBcW9rHonE90p
         xGEQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZkG0gezY;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a1e0cc1a2514c-87bec1f37b0sor1912836241.8.2025.05.25.22.32.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 25 May 2025 22:32:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZkG0gezY;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748237520; x=1748842320; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K5vADRSpaCj/9JLSnM/LCtAoOlQ6L/Ad7qAHo51qFbY=;
        b=ZkG0gezYM8xIfsapWvvdiTIMqhR7LxD1W+90EUFY348+2pL7o2Ld61HOzIUmHM0Ofe
         B7PzsDEwT9a071J+3Ktkp4w0IwngAT0olP+NA4gnxdrSrLBOiY3NzJ4zB/j1zgWMw+Dy
         LFElozXSP9m0TPMeOWXUlMNx1qNS5jBBVEsGlgDgKsUCBuFyAbweRRwclSZ2lg7Qvmxi
         dxHtAx9L1dP878JG4dSJHKztUO+SDdZ9meOyf1UehgwY38dn7xTKOyLaQmapY8rWOSsk
         2PxKhRNatGf7FAfKQ2o2KeoOjrfKO2wi/tNG0s6CMoQAeAfK4fM6khAv4Z89EMItBwHe
         9LEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748237520; x=1748842320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K5vADRSpaCj/9JLSnM/LCtAoOlQ6L/Ad7qAHo51qFbY=;
        b=u8H5Ax6FptxTLiWSiyMRPCfs/toI0EiI4ImPXonZBPNIM7vzX9sbXHheiiPvqQnOz2
         1NC4TEJZSpxml8F+8wDyXbL2O1k5wzg1c5KDMGnhx7x+PPLNGj685xNokuVhjr+jJrt5
         xBTq/EB9T2dV1XlH2G3F350MYq/lSRkVEPYt6NDv/7w0Y4N8tMz8kfvDt+UxeojJrGFN
         XEohpLrjFdbZ3Q+SLzNWF4aVZzG+K0EXhqw1i78BhJW6AJfUBLZwXmxQEcNRlQsiWhF2
         JIP8XisQMKWJYSQFzG3xk7h+UaWby1DLpKcMFNTeZr34YqrVvUwRF+f8ZpK0ZDVHZZQt
         8W1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWvopEpH8Ie2V3cBcvfOx6flQ8JrGhetSeVaCfybTj6Q4ubKrtgpKUkIEOvZPYj5pv6rG+kP8/48D6vvA==@linaro.org
X-Gm-Message-State: AOJu0YzWGUrM1kSan/o3+NbhpY7jB5gqwQ3yjZ1+ArBXTYk+E5CosglJ
	FgKQvxRluvJuUr90xpIdjQE/du/kpmqtWam1AOO6sIdU6BKDFeK01/9TWHII3EDsLxdFtg==
X-Gm-Gg: ASbGncvj4Q+u3pVhvbRPLD6qwPFnskQ21uL5WB6QtKza+7axMCmAyS6qejj1tfylTyT
	W1F6jw/hjTJ/zI+ceOp65CyNAyyC0DPZlHP0gaeDP8ibKcctGiB7a5ITSeRaE8NQ6V+pQuguGd7
	7dpEg1Ll372k+zieWTvtgrxjdhXm1sNkZ+w4MyPY4bU1CkPoycLC/eKSJv8wBEV7k2MECbH72qK
	N04xycuA/Nms6YcQ7qXzhAQmSJWUZGQ7dkTduycuIHKRM4oU4XuQk2655X3PaDdGuNqUHZZPe2o
	0mMpN/rnV7zhAGG7DpC0wmK1kwoQwl5v0MWwV1pJT14wgwuFYGW302O7vryLjErm5f43JXqD79S
	PIkbQ/R6vIZ5As2dOcPw/2g==
X-Google-Smtp-Source: AGHT+IFDV5nITDE+AAk4SA10CIGkWS8aapNvx5WzwccXba2SmPusZwhwjuTrqZfc1r3CMBUfZfbUGg==
X-Received: by 2002:a05:6102:6e8a:b0:4e4:3c36:9336 with SMTP id ada2fe7eead31-4e43c36952fmr3179463137.9.1748237519935;
        Sun, 25 May 2025 22:31:59 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from gromero0.. (200-100-75-183.dial-up.telesp.net.br. [200.100.75.183])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4e454da4378sm784310137.17.2025.05.25.22.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 22:31:58 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org,
	eric.auger@redhat.com
Cc: qemu-arm@nongnu.org,
	thuth@redhat.com,
	gustavo.romero@linaro.org,
	alex.bennee@linaro.org,
	mst@redhat.com,
	imammedo@redhat.com
Subject: [PATCH 1/5] tests/qtest/bios-tables-test: Prepare for changes in the ACPI tables
Date: Mon, 26 May 2025 05:31:19 +0000
Message-Id: <20250526053123.1434204-2-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250526053123.1434204-1-gustavo.romero@linaro.org>
References: <20250526053123.1434204-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: CnaoDLog3/lc

This commit adds to the allow list the ACPI blob related to the base
aarch64 'virt' machine and all of its variants, in preparation to adding
the ACPI PCI hotplug feature, which changes the _OSC method, the GED
device, and adds a couple of new methods, like the PDSM.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..abe00ad4ee 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,6 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/aarch64/virt/DSDT",
+"tests/data/acpi/aarch64/virt/DSDT.acpihmatvirt",
+"tests/data/acpi/aarch64/virt/DSDT.memhp",
+"tests/data/acpi/aarch64/virt/DSDT.pxb",
+"tests/data/acpi/aarch64/virt/DSDT.topology",
-- 
2.34.1
