Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC744CCD199
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Oct 2025 15:31:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v9mPw-0005Mw-12; Fri, 17 Oct 2025 11:30:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v9mPr-0005Ke-W0
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 11:30:52 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v9mPe-00014v-2D
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 11:30:51 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4711810948aso11321225e9.2
 for <qemu-arm@nongnu.org>; Fri, 17 Oct 2025 08:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760715029; x=1761319829; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6AV+a4VK9i5eCGB6i/mZ4rJ0/eiGZuZktFjKNZJiImc=;
 b=oSQUZYX+Kok9+JL43WNgKoXaR4M26UlrIbgdk5G1+5bkWcrzC/dlQtr6tQ+xfS7eMV
 zOKrBW11yLYlddaS96V7yvSOP6E+YHV+AufYRyfCKf1RXRh/jQFam1hH4T0n2ffX9WDo
 xFhs7OuIy9S2n48Y4Nl0VVR8Czv78utDi1tsBdueuU7mktQDw6ZTepkthKsKOBfy3E9z
 4s4knlL3tWTn1T+nWa2j+IoJHOKczgb990WtiDgxkpzBqC9LJojacKYov3RBQyKIhzqG
 rguIqXf/34D8OkE5DA2bIpgkQsr5f0s7a+v/CtWD68a3+PLMhSvrxr1S7ic02kBmOwEc
 /RIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760715029; x=1761319829;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6AV+a4VK9i5eCGB6i/mZ4rJ0/eiGZuZktFjKNZJiImc=;
 b=MrFL6nd7IQYap1rA9qnfURthDBUS65Esj2LPutvFyPVlnE74+y8wfBfp+XeMpaik7A
 Ti2oR4KRylM3i6XiD3AjJtuo0dRm95IgpkMw+hG0oWuCIK9S2LqD8UHgfJs6e5nWblZ3
 06PSbjlZYpOBxnrv6fq3AQFvNeVzQhtRxD/k4K6D5QifJ5/Y7L+cCk9BTdVVo5Rvyr6Z
 2V3QpQVOx9xXBhV55W2YKzzgzlv7vSqCTM5XkmQRpGs6DGR8s9AlZxKSKu1lux7BQt0j
 vjup+Fhx6tgfXwG7ESpnvK59wuQ0jHoxj9jYcgPX+piisfdYgvWBuLDbMrZddOLp7J9n
 SThA==
X-Gm-Message-State: AOJu0YxrXaFAz41da3P6Biii6lvSAqInp22RkZ1/NWhH8gIMirUsdd8X
 svXye9X+2UimYzI62bfs0aVcTY9DgJQEuEL/N6O2TVXWohFdIzu0AFkV/gMK3wN2ZDeeGfu4HGH
 iWBrh
X-Gm-Gg: ASbGnctw8grShCBP78dBMRSQXEQocbUU/3UyYg8S1gsgOoM54agtITJM/AOqizOYNdY
 lE9MOp8rTqLR8MOujU6jC7CE9sAmhKOTxvcKcQMqHKI1Vgh4BQvuOOd2cmCGqbyDcSiH2X2fddR
 pacqOpdvV+5CZkpdEyp2EldF92hWs7E+nmQQHQEbgFJO51cAR4cg3bQuNSwUiv+zgv6Bo6J7pdB
 2MC2LEju2RT2mygDNLiTo4SmYKGzJovenZxaJHZ9vAD5uzwzUbuj60O2RMqCeoI4/6YyH9G95Ac
 AQoCWk4HCEfGtX3l2VJxusxCgwd+bKt3U2fOwNhrA6S3JyFm8Vs2BPa4XeuAa7MyaNKwomtjLd4
 M+O7OQ9nfgC6lLss7nV3Eu5dhZs9aQZDnvPDpSGjwJKTR1/X3rGVOXEv2b+cZaMUmKzcwfwyiYb
 NJBetO5CiaAcDEvSMZ
X-Google-Smtp-Source: AGHT+IEfsmWDVH2D/mkgb8t2QRcK3JvhDYhgDqU+ZCr3dG9hHbfCVGar0ykvnyuEPHHXnh7ldMPsmg==
X-Received: by 2002:a05:600c:5298:b0:471:9da:5232 with SMTP id
 5b1f17b1804b1-471178a748bmr33366515e9.15.1760715029056; 
 Fri, 17 Oct 2025 08:30:29 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-471144d17cdsm85038635e9.18.2025.10.17.08.30.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Oct 2025 08:30:28 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>
Subject: [PATCH v2 0/3] target/arm: Support SME2 in gdbstub
Date: Fri, 17 Oct 2025 16:30:24 +0100
Message-ID: <20251017153027.969016-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

This patchseries adds SME2 support to the gdbstub. This is
fairly straightforward as the only thing we need to do is
expose the new ZT0 register in the XML in the way that gdb
documents that we should.

Patch 2 adds the TLS section that we should in theory have
been exposing already; this mostly will become relevant when
gdb implements the SME lazy-state-handling that uses TPIDR2.

Patch 3 is a simple "check reads and writes" test case along
the lines of our existing SME tests.

Changes v1->v2:
 * use static XML for the sme2 section, not dynamic
 * add patch 2 for the tls section
 * tidy up some excessively cut-n-pasted stuff in the
   testcase script

thanks
-- PMM


Peter Maydell (3):
  target/arm: Implement SME2 support in gdbstub
  target/arm: Implement org.gnu.gdb.aarch64.tls XML feature in gdbstub
  tests/tcg/aarch64: Add test case for SME2 gdbstub registers

 configs/targets/aarch64-bsd-user.mak      |   2 +-
 configs/targets/aarch64-linux-user.mak    |   2 +-
 configs/targets/aarch64-softmmu.mak       |   2 +-
 configs/targets/aarch64_be-linux-user.mak |   2 +-
 target/arm/cpu.h                          |   1 +
 target/arm/internals.h                    |   5 +
 target/arm/gdbstub.c                      |  12 +++
 target/arm/gdbstub64.c                    | 115 ++++++++++++++++++++++
 gdb-xml/aarch64-sme2.xml                  |  14 +++
 tests/tcg/aarch64/Makefile.target         |   9 +-
 tests/tcg/aarch64/gdbstub/test-sme2.py    |  36 +++++++
 11 files changed, 195 insertions(+), 5 deletions(-)
 create mode 100644 gdb-xml/aarch64-sme2.xml
 create mode 100644 tests/tcg/aarch64/gdbstub/test-sme2.py

-- 
2.43.0


