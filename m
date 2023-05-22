Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp1286404ejb;
        Mon, 22 May 2023 08:31:47 -0700 (PDT)
X-Received: by 2002:a1c:7911:0:b0:3f6:76e:604b with SMTP id l17-20020a1c7911000000b003f6076e604bmr1483676wme.0.1684769507479;
        Mon, 22 May 2023 08:31:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684769507; cv=none;
        d=google.com; s=arc-20160816;
        b=rnXmnMm3BD7LMG0bRp00YjNWfC9SdsKs3350BMRlN8htLRVDiVVuH1NN3AGGxzbHeF
         OjlwCzd7PCVb24/+ASWp/6aeSu/JKpMkrrextfOBSSTfkDW78RGV94TZC3fchuZx64rw
         lIG10XMSZcLHeCQBMXwQMuyzlR8G/cuxAI9Poo04JWSeJyo2bP0AqRM6hmS9IpxH9Tt0
         PEsWibTfgTEfltBnOHylvrRuKT3Ok305oWLgCP+ZFW2AKsoq3X3PXGjHQ4nbjol25GEy
         Z/4s89p9EpkK0OcSN6N7DZbxhhBtFYZYPuTX3xn5SjmbGt7kjUsjDXar7eFjgs1q8n6B
         1qTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=/wKkfjSufx3DW+zYa0E7GEJz1aH+QHJBoM2dYSQDuDM=;
        b=fh9dyonvnCHrDL6aRldp7FmdRdPrb1AD445/cn3uWVV494pWPOmCLjrUvC32LVdexl
         NU/mBSl8dJAMkQBcjVtS7I7pbCRHsqFiJ6uf5E7aPlLndf4KEx4Z/Gw5UxueAkn+hDCu
         n3Qw+ZLL+/yLVv2PDQ+GMx6gyDR1A3lpgvgFL5ltp9ugrn8JJl5/ZVDnuANroA3RdJqR
         nWJ1aIy7XpCxQHSVINOb0P608rN60Vh8yJt47jtswEewlA52+E/pxtzUdWBho5kF4YAM
         E8Lq1zmXZtQtC6jNTZD5aVBz46L8raYNC4fkl4xWQuFcvPzy6VbEtfC2ODatcfmffT5o
         k1Gg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ls+YTqEi;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l16-20020a7bc450000000b003f09f293d24sor1721890wmi.3.2023.05.22.08.31.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 22 May 2023 08:31:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ls+YTqEi;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684769507; x=1687361507;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/wKkfjSufx3DW+zYa0E7GEJz1aH+QHJBoM2dYSQDuDM=;
        b=Ls+YTqEiXNT1nvjLPQxPfMv9S5eAVqJSNAlaIst4auvrLVJ+PGfJ9b8XWD+DU7/sIR
         wVw7kmV24VNxMAVUsIaW7JwVDAoK7DfCvNCYJrIfW0l6ceb/e0TK9ijR5b1O1DuP1B6l
         GDbc7ZhQhPpW1/HeKKqmmnOk7VaAAD3ToNZl1tN+lPsPCr4NKLSQICo/FmgcwLn4rSn4
         9QTb9vaxZkY40Su9eEVhdXCXSPBoxlGdHbB0aYOgqNX9WnTVYmHjQK5EcDQlTOiPwKDl
         a3BFxYZSuTzvql9VkStkSMRnC4OAcTuKzXJm1DRhyuj9sKI0czdm+gThjC18tQNKjNLz
         +4yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684769507; x=1687361507;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/wKkfjSufx3DW+zYa0E7GEJz1aH+QHJBoM2dYSQDuDM=;
        b=MZVfm14atRM4CFaUP8gAeql76pEAP5RB+X+t0w3PZXMCet42TPx1Le4kpQLxEI95IL
         o1LfTfIxJSrI76R71qtsYSa+V+qBlu279ZURPB+qn26W/QVk4pK95p24xHToU08kzC7J
         3+coptUPHNEw2hYYglF8vNMCgH7TtcHvqLQH5sqrhm9z/pi2xuCzkiUiQqtxPOqldFIK
         33DVUwfjnD0wjlVnKSrWI8aCK41Cnop488qMNO/SryBFnnWN8zW5JEWyb1Ls8P8ySX63
         rzgcUSLPSgXMfhn6iZs3o+FkGoIK0nk2LEWvIPSYK+S8yaBlx43qPoA4Kfq60GAH8jF8
         7yhg==
X-Gm-Message-State: AC+VfDwxv1MKBAfIHirr3115xB4M0sUSOuj62CfDoW7kTrESDLopyySZ
	NO5pNGD8q/DaG5KH9/S6ovCl7sYq
X-Google-Smtp-Source: ACHHUZ40xk9g4Wq4zxmi/h1i1cAfDWib/ppaY5zlVyrnf6jwRFrWXtLjAk/JCe/7rmNUQ2oeqp1S9w==
X-Received: by 2002:a1c:f710:0:b0:3f5:146a:c79d with SMTP id v16-20020a1cf710000000b003f5146ac79dmr7210395wmh.15.1684769507111;
        Mon, 22 May 2023 08:31:47 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([176.176.153.164])
        by smtp.gmail.com with ESMTPSA id j15-20020a5d464f000000b00307d58b3da9sm8056538wrs.25.2023.05.22.08.31.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 22 May 2023 08:31:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 00/12] hw/char/pl011: Implement TX (async) FIFO to avoid blocking the main loop
Date: Mon, 22 May 2023 17:31:32 +0200
Message-Id: <20230522153144.30610-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: Hrve6C9FLa02

Hi,

This series add support for (async) FIFO on the transmit path
of the PL011 UART.

- First we add fifo8_peek_buf() to the fifo8 API (patches 1-3),
- Then we massage a bit the pl011 model to ease development
  (patches 4-11),
- Finally we add the TX FIFO implementation using a chardev
  front-end 'watch' callback.

The last patch is RFC mostly because I don't know what is the
best way to resolve adding a new migratable field without
breaking the migration stream.

Tested with qtest/avocado/TRS test suites:

 trs-workspace$ make test
 Startup finished in 6min 40.596s (kernel) + 38.786s (userspace) = 7min 19.382s.
 RESULTS - date.DateTest.test_date: PASSED (46.90s)
 RESULTS - df.DfTest.test_df: PASSED (2.29s)
 RESULTS - parselogs.ParseLogsTest.test_parselogs: PASSED (23.45s)
 RESULTS - ping.PingTest.test_ping: PASSED (0.05s)
 RESULTS - python.PythonTest.test_python3: PASSED (2.72s)
 RESULTS - rtc.RTCTest.test_rtc: PASSED (51.84s)
 RESULTS - ssh.SSHTest.test_ssh: PASSED (4.56s)
 RESULTS - systemd.SystemdBasicTests.test_systemd_basic: PASSED (2.33s)
 RESULTS - systemd.SystemdBasicTests.test_systemd_failed: PASSED (4.41s)
 RESULTS - systemd.SystemdBasicTests.test_systemd_list: PASSED (30.07s)
 RESULTS - systemd.SystemdJournalTests.test_systemd_boot_time: PASSED (2.42s)
 RESULTS - systemd.SystemdJournalTests.test_systemd_journal: PASSED (2.62s)
 RESULTS - systemd.SystemdServiceTests.test_systemd_disable_enable: PASSED (40.34s)
 RESULTS - systemd.SystemdServiceTests.test_systemd_status: PASSED (2.43s)
 RESULTS - systemd.SystemdServiceTests.test_systemd_stop_start: PASSED (9.23s)
 RESULTS - opteetest.OpteeTestSuite.test_opteetest_xtest: PASSED (329.89s)
 RESULTS - soafeetestsuite.SoafeeTestSuite.test_soafee: PASSED (272.07s)
 RESULTS - tpm.TpmTestSuite.test_tpm: PASSED (53.61s)
 RESULTS - ptest.PtestRunnerTest.test_ptestrunner_expectfail: SKIPPED (0.00s)
 RESULTS - ptest.PtestRunnerTest.test_ptestrunner_expectsuccess: SKIPPED (0.00s)
 RESULTS - systemd.SystemdServiceTests.test_systemd_disable_enable_ro: SKIPPED (0.00s)
 SUMMARY:
 trs-image () - Ran 21 tests in 883.291s
 trs-image - OK - All required tests passed (successes=18, skipped=3, failures=0, errors=0)

Philippe Mathieu-Daudé (12):
  util/fifo8: Fix typo in fifo8_push_all() description
  util/fifo8: Allow fifo8_pop_buf() to not populate popped length
  util/fifo8: Introduce fifo8_peek_buf()
  hw/char/pl011: Display register name in trace events
  hw/char/pl011: Remove duplicated PL011_INT_[RT]X definitions
  hw/char/pl011: Replace magic values by register field definitions
  hw/char/pl011: Split RX/TX path of pl011_reset_fifo()
  hw/char/pl011: Extract pl011_write_tx() from pl011_write()
  hw/char/pl011: Check if transmitter is enabled
  hw/char/pl011: Check if receiver is enabled
  hw/char/pl011: Rename RX FIFO methods
  hw/char/pl011: Implement TX FIFO

 include/hw/char/pl011.h |   2 +
 include/qemu/fifo8.h    |  38 ++++++--
 hw/char/pl011.c         | 209 +++++++++++++++++++++++++++++++++-------
 util/fifo8.c            |  28 +++++-
 hw/char/trace-events    |  12 ++-
 5 files changed, 239 insertions(+), 50 deletions(-)

-- 
2.38.1
