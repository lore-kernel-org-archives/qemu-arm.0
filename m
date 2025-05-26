Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp3992481njc;
        Sun, 25 May 2025 22:31:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU0LfW0iclHc5PS2fX/o6SEX3A57KGa0mNPV5yznBULEDN3ClRwGzckDVZOCgrR/n6i0vlOtoMiXKfVzw==@linaro.org
X-Received: by 2002:a05:6102:32c7:b0:4dc:81b7:f031 with SMTP id ada2fe7eead31-4e423ea7f29mr6435048137.0.1748237516868;
        Sun, 25 May 2025 22:31:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748237516; cv=none;
        d=google.com; s=arc-20240605;
        b=BCcHoB1LjH+eraCnGE3MdTf/2o0SVwvS6eQFZ3YUHzco+KO0NLmlnNL3/uk+XjHowV
         Eh3tAJqozg8B7AXbZNX0rVfmufEvIwgcFCAIYOCvPC00eeMpgQmbyRC9I0bjvV/x5wjr
         ENvVlNjkGOhKWXnXaiHuiiGWrwVMaREuT20gRw+CU6LSTrCRiPXxRqLT9BE3O2vj1s00
         Bs+tTIF8847l1lxU0X0aKRBolz0ziCAiZ/ub0hrEjDhNbY9FvJqCHodf1wnG6yLLLt0U
         F0K6KoLP//LQYKxlMYBSMQipE4GojsV3C6wub5StPiK4AxVvdqQZ5sPIzF2yiHuhYM7v
         bT7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=FE5dwy+2bD4ehEe2dm4zv+l8JLivF5Ay29z8XQyry8Q=;
        fh=jAH52VGK0Kv4AZgQt17nBrkIaZliQWeN7hUC39bsqWw=;
        b=OhMz4jfBJfLmKg8qhJ9EKKuc8+T8rzMXteaMyIK32NWc2Op83F2PvBlouAaaQRRdzL
         VDEu/oxMkWsURX8Mq6EH3leoTdfubeSzfcaDKHYqecTA0uTcGRwfcgWwfvhlQR/CtvKF
         ZCe6kb9Ly5M7w8FsrbvP3VL+gre1PwYSFEqETNYvDyr33IWg6TeXQjFttrJAkbswrcpc
         TtzZWOC1eozvyDgBWcW6f+6bGAHr+EOa8dGpuFg7MqumWxFNivDtGLGBfPTYL3VFjpKP
         fguZRh8ak5YNR0Lbq9PDHGxAOyBeThL445QOnAHA2VfF4v26E1Am5wdSIbKFPJyXD1tG
         5hWg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oh52HRvm;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id ada2fe7eead31-4dfa67fa2e2sor4053672137.9.2025.05.25.22.31.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 25 May 2025 22:31:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oh52HRvm;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748237516; x=1748842316; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FE5dwy+2bD4ehEe2dm4zv+l8JLivF5Ay29z8XQyry8Q=;
        b=oh52HRvmKvQRF6lT+sNc+lq94aU+FKApbOW2/TiJ1bY6xhZSXaLv2kQSE/lXXl45pH
         nNxi+QzxH8AV6eGsJm5FGjSalAu78mPhcA4p+cWUyrsFplxya7dPXV/M4jPrrWe/Shin
         6zkxtcOTbliuV68+DtBwKlTdBOoCJUjrFRCtpw8KYe9gkeHR6dP5jhAC9aEWcbIAZwru
         Q+LlmiDUh1aVNIE22yflpo+g/d7k29pnHIn/ZFK5NJsJtdMqeiKRzPhkkkH/Rnh/+XDM
         Gkw6EPtBQh4aGEYecVd0lIxvU9Nama/A6nn0K+j4ci//SumyGSINm8c4GFtjtDbge9IZ
         Ox7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748237516; x=1748842316;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FE5dwy+2bD4ehEe2dm4zv+l8JLivF5Ay29z8XQyry8Q=;
        b=vYvMlLq+CDDRBfm+E+KgUAjP7BzLFY6uYzPP5Fn7zTpX5JVhBpRE64X6HWQvVM53MB
         WPl7AmlRU0+P0PrbJCmyS0lU9u3cSxQF2drueYNjeeHop53I5Y1IVYozKOJkQGsXuyBO
         G8rBzxQTkXyxyzjRne/cQAV/tt0OqqndrYlbrMKR5odCHrKyqZvSw0rzl/5TRKJwy4Uo
         CWW5XJlb3pz1PUr4nyXAfmAped2JKIbB2JRHd2d6sakeXI1oGUEQcQqf/gHI4OlFsVeI
         cmpyXt/MazBDiUEoVhwukbUzCUFV05/V8QNigUdRAeRfBkue4EC664AcCkBUaaohtubS
         5gtg==
X-Forwarded-Encrypted: i=1; AJvYcCXPadeUw2fFVHlfMSF5k3nE0WW3jVbfijD6UY2mPeNCYzEh9V3gYlBdzTv9PFcS5E08GURH8fHtlWH63A==@linaro.org
X-Gm-Message-State: AOJu0YxWRFBq4Lj64Eeh8VyRWYA7h+o1+G945Me/2Gap0xQdWLEAdZ0V
	p2v13Kdj+X5v7j/uMxXMs5x+KUuMOIPFPvOEJvSCisQTG/AE0gCEQgA77FwoXaASDYsanw==
X-Gm-Gg: ASbGncuQiaf8bXz6burJDMYQcGlNFx7ls1AJxXA1CIPngoJ7Yn13W1GU67z/8iTBJ5Z
	e3qiLhcAtuWtwLJ6cOWK07XE6YZxD1xlNXqVPMQDBvX+0l85vxh7aWB2UCTgdjzo0kMD51rOBzO
	52TEnd+bUQWnLPP2z6Z3eY5KtZIM+xoHWhXi2mCcknc2KcxOL2VpFZgeNIdlGqiAb1K0sSsM+9U
	QIx7X0eOJT5+pcwuI654BWzfr1omxJ9m2xGwdpKy5nl1NyjaTqjJrjYuEkvE9RL/cv7GynTAfku
	QfKaHWYrKpSX0vescrRRAFo0geMxyZ0IfWfvdPaJ+DIQi31cZ4tqQnryrXtLzx7gyYn1E9L/k0n
	OIoKLVKTq7efC2QEOp7DVBw==
X-Google-Smtp-Source: AGHT+IEuzcldqamOeAR6LQXYBr14vf8YjBhYIx3aqSXtNgpAd6Y6dkvNOFB6PufFOJQVFM9bvb0C0Q==
X-Received: by 2002:a05:6102:3e95:b0:4e2:82b9:b377 with SMTP id ada2fe7eead31-4e4241609ecmr5559911137.18.1748237516382;
        Sun, 25 May 2025 22:31:56 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from gromero0.. (200-100-75-183.dial-up.telesp.net.br. [200.100.75.183])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4e454da4378sm784310137.17.2025.05.25.22.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 22:31:55 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org,
	eric.auger@redhat.com
Cc: qemu-arm@nongnu.org,
	thuth@redhat.com,
	gustavo.romero@linaro.org,
	alex.bennee@linaro.org,
	mst@redhat.com,
	imammedo@redhat.com
Subject: [PATCH 0/5] ACPI tests for PCI Hotplug on ARM
Date: Mon, 26 May 2025 05:31:18 +0000
Message-Id: <20250526053123.1434204-1-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: GFes8d+UBdDj

This series updates the existing ACPI tests to work with the new support
for ACPI PCI hotplug on aarch64, which is now enabled by default in the
'virt' machine. Because ACPI PCI hotplug is now enabled by default it's
necessary to disable it (acpi-pcihp=off) for the existing tests, because
they use the native PCI hotplug mechanism.

It also introduces a new test variant, .acpipcihp, to test the ACPI
tables and the AML code necessary to make the ACP PCI hotplug/unplug
work, so in essence it tests the ACPI when 'acpi-pcihp=on'.

This series should not be merged before the "ACPI PCI Hotplug support on
ARM" [0] series (under review) is in the master branch.


Cheers,
Gustavo

[0] https://lists.nongnu.org/archive/html/qemu-devel/2025-05/msg03487.html

Gustavo Romero (5):
  tests/qtest/bios-tables-test: Prepare for changes in the ACPI tables
  tests/qtest/bios-tables-test: Keep ACPI PCI hotplug off
  tests/qtest/bios-tables-test: Update changed ACPI blobs
  tests/qtest/bios-tables-test: Add aarch64 ACPI PCI hotplug test
  qtest/bios-tables-test: Update aarch64/virt 'acpipcihp' variant blob

 tests/data/acpi/aarch64/virt/DSDT             | Bin 5196 -> 5178 bytes
 .../data/acpi/aarch64/virt/DSDT.acpihmatvirt  | Bin 5282 -> 5264 bytes
 tests/data/acpi/aarch64/virt/DSDT.acpipcihp   | Bin 0 -> 5993 bytes
 tests/data/acpi/aarch64/virt/DSDT.memhp       | Bin 6557 -> 6539 bytes
 tests/data/acpi/aarch64/virt/DSDT.pxb         | Bin 7679 -> 7635 bytes
 tests/data/acpi/aarch64/virt/DSDT.topology    | Bin 5398 -> 5380 bytes
 tests/qtest/bios-tables-test.c                |  42 ++++++++++++++++--
 7 files changed, 39 insertions(+), 3 deletions(-)
 create mode 100644 tests/data/acpi/aarch64/virt/DSDT.acpipcihp

-- 
2.34.1
