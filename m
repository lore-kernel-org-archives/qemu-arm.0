Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp919370ejc;
        Fri, 20 Jan 2023 00:24:03 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtjJWQy9f1z1kC9Dkv1Wwj47ixMjoaydkkqMfTWPyTGwBAyicsoEQ3jcpapswttzKC7DtQw
X-Received: by 2002:a05:622a:1f8f:b0:3b1:ca9c:6c38 with SMTP id cb15-20020a05622a1f8f00b003b1ca9c6c38mr23823835qtb.51.1674203043050;
        Fri, 20 Jan 2023 00:24:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674203043; cv=none;
        d=google.com; s=arc-20160816;
        b=i8ymsT8+F0cC0Aaak3aRVhg7SHqaOcPzJRoDFTmFGqf7vQtq6ez1N44B6aIf32OoDd
         Cxd7TmFpCUOiVX5GtH+Mmb9HgZ330iLC3CDkC2w4VSlXcU22fn8Hw+TcOKFCoNL+Gn5L
         zpxkSBlQgUQvehWWWKEidgNSkLeSc/AK1UfO5OFxAOISfwS8tyLA7EcGU8HH2nSLDsI2
         8HrVcZDWT3OeRQ9ZPUdkYiBMnlVR+EU6wbs5Ea9K3CVz4/If3/cIQBcoRxfrH2+qo79/
         +/nxV5ZnBysnKZIrslQL7nfAAsBnhiDWKIg4boMGOBxh720VDFDGUWqdTSZjPtdXzGh6
         uLGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=gq3KZjZqmhmt+ZIW81YYHELjkhaTdKj6nDlr4LtJu4o=;
        b=w16cg2yNBqcnxqoT0edfpsz1sR3LM0ww99Wtwg3GLoXzhNS0HgKAw4q4Bc9gVhJ4hn
         kvCvYUII9UBVsyPBT7qt5adfbzcsqxZ+jTQhNP6SDJgLQuAbdKa8Y8alBnm5+OFHMgXt
         6bnM75bDtkEIap2fX9OjW5Wt3oLKgd688qbWGDau/xgblmmfatU57RvVuHStXf5HgKph
         wBANIXYzksRCf4Aulkz1q7vyzEHhVLOxXO7zF2TNA0546t87OnwGi54ukoRLYidJ9H72
         0Hft/woDgkuTNYq2ePVXRJDNt3A61mKYnspIyG6BV0Ct5usOh2tW40OXHQgP2IgmV/wB
         B+kg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dkpd+UuI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w42-20020a05622a192a00b003ab5b7063c8si168942qtc.422.2023.01.20.00.24.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Jan 2023 00:24:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dkpd+UuI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pImgg-0004ap-KN; Fri, 20 Jan 2023 03:23:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pImgd-0004a9-Mr
 for qemu-arm@nongnu.org; Fri, 20 Jan 2023 03:23:47 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pImgc-0004YI-2I
 for qemu-arm@nongnu.org; Fri, 20 Jan 2023 03:23:47 -0500
Received: by mail-wr1-x42b.google.com with SMTP id z5so4128695wrt.6
 for <qemu-arm@nongnu.org>; Fri, 20 Jan 2023 00:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gq3KZjZqmhmt+ZIW81YYHELjkhaTdKj6nDlr4LtJu4o=;
 b=dkpd+UuIv826VvBxL1EgDvP83gMgAsmAP82j1K/rnbhKODBKNSufd3hFvnZ2k6ucLY
 J25yCxtHVxjsdmcGc0x78MN61GGhA2S1ZZKW+l34uaqH6Huz1N+nsM5171rkTgBBw3bO
 Z6u1q1lqoTwMgcXbXng/+NTnBAc6u6E8l1dN6SRO3XyK7Q3Hvrj8PlYOEOpIWLWC8Nmx
 b8l4NCBhqM3ZLCKdBIOXn7m8PY5SryMOBMl8CxJYR6OxJGS2VK3AoCJaqXiiSgXcU/sh
 znoSx4gBh8LUdLZlsAIObi+Qc1cfesTuIk2nhtLtu8UUumsdlKSbbNj/czkJ7zO44CgU
 /vCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gq3KZjZqmhmt+ZIW81YYHELjkhaTdKj6nDlr4LtJu4o=;
 b=7p8n0E7bNX0BLhR9CQORJE0LTw08V1ALui4oXSzx4GghF123S64mxoqJt5O8qcnz75
 cdrvUwltdbEMAnVwbU9743Y4PTzXiU3WyHvc0TISwUN9YtOWK4ZDoaz5PQA0WtKKlYql
 lhpsVkgAo57zcDADtZXCh/rvSz8u/BG16lWmdZdQ/3Z2/BIh/uFsiupoTGYz4kytWHND
 v0i4lN/fIblhY5kRh/At+PTvY3r9aa0MeV6SsZ2887UWDZRKS4IDh6uidSJWvU0oWbTR
 5vIE1ToNH15HrIqQlJhPQYBzFldJDdgyO5POx4EUEMOwxdfDdc//1Dn3P8Y9cJV/1kgu
 WvSQ==
X-Gm-Message-State: AFqh2kp5RuIUMrUYFMzYqq3xze7b36+2aVG0zI9Zrn1mvqIEh++iG1k5
 Ceh803Ze41GfoyLF5ZIVGPzFkg==
X-Received: by 2002:a5d:6988:0:b0:2bd:f18d:e909 with SMTP id
 g8-20020a5d6988000000b002bdf18de909mr11480342wru.1.1674203023407; 
 Fri, 20 Jan 2023 00:23:43 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 n6-20020adfe786000000b002bdbde1d3absm25418384wrm.78.2023.01.20.00.23.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 20 Jan 2023 00:23:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 00/11] tests/qtest: Allow running boot-serial / migration
 with TCG disabled
Date: Fri, 20 Jan 2023 09:23:30 +0100
Message-Id: <20230120082341.59913-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: uY0YE1kcHHeS

Missing review: #7

Two test were failing on Darwin when testing Fabiano's series
which allows building ARM targets without TCG accelerator:
https://lore.kernel.org/qemu-devel/20230118193518.26433-1-farosas@suse.de/

These patches allow boot-serial / migration tests to run without
TCG / KVM.

Philippe Mathieu-Daudé (11):
  tests/qtest/boot-serial-test: Constify tests[] array
  tests/qtest/boot-serial-test: Simplify test_machine() a bit
  tests/qtest/boot-serial-test: Build command line using GString API
  tests/qtest/boot-serial-test: Only use available accelerators
  tests/qtest/migration-test: Inverse #ifdef'ry ladders
  tests/qtest/migration-test: Reduce 'cmd_source' string scope
  tests/qtest/migration-test: Build command line using GString API (1/4)
  tests/qtest/migration-test: Build command line using GString API (2/4)
  tests/qtest/migration-test: Build command line using GString API (3/4)
  tests/qtest/migration-test: Build command line using GString API (4/4)
  tests/qtest/migration-test: Only use available accelerators

 tests/qtest/boot-serial-test.c | 46 +++++++++-------
 tests/qtest/migration-test.c   | 96 ++++++++++++++++++----------------
 2 files changed, 80 insertions(+), 62 deletions(-)

-- 
2.38.1

