Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50DEAC5CFDB
	for <qemu-arm@archiver.kernel.org>; Wed, 12 Aug 2026 20:46:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wuFof-0003W7-4Y; Wed, 12 Aug 2026 16:44:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wuFoZ-0003Tc-2x
 for qemu-arm@nongnu.org; Wed, 12 Aug 2026 16:44:44 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wuFoW-0002Dp-Fy
 for qemu-arm@nongnu.org; Wed, 12 Aug 2026 16:44:42 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-84f38f3b36eso1188120b3a.1
 for <qemu-arm@nongnu.org>; Wed, 12 Aug 2026 13:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786567477; x=1787172277; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=68LE8+61OFW02iv+EYPpEpeOsk4G9IcBG+Tp4v4ly/E=;
 b=ax1RKfFdUq3p8rX+Kjh9aU9ZUDTUiT72io6psgEIIAXcI9R2l6J3b9WkDUnv0LlXa2
 opyjvXtsQmp7HVhVwj/IuRjNMWR8sFs6RhutN0hQCoA2+2DsKaGUXzYoIa/8OUlF5/45
 ieJzc5pof54qiDh11Bw2ynBlEWCJZW3mXvh0TltQobzqFvoPABzZ+UNqzVFcgMeH0+5W
 oGenSuG3/uJkVlsoqj22uSKJTLwdpBjiOZaFac6iS7THIqIdQscdw15N5SimcWLQV1NV
 h++tlI8HkK1G0E5b1n+DNcDQsflNsjCh+MBfIpsbSBinZ1JX6hRKNFlpyYpM1MJEypwV
 r4Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786567477; x=1787172277;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=68LE8+61OFW02iv+EYPpEpeOsk4G9IcBG+Tp4v4ly/E=;
 b=iLUTR68L9f0DKP2RYuogP4MB8ZIE4QPBWEdBkh2Lmd48finRso+JthhO42FkisAW7m
 c9cF2JsSrguzKANhCn79mjEzJni2LxYVqFHkxMq7cWM9sx/MgltHPugy0JDW2U4aLp09
 c2/PlHZ94zkNjilI02RdqlzAFPqO+2+CFFDAvu6cxKaz8gSOUtJVBHvCWwGwivrSzARi
 Dy+rr4k1punDdIwO+Lcc0eaxG3IANBcUC34ByDIBuYjgoCvH/aWNI8CT7HiVBcWhdZTV
 qtqAvw0psnPDFJayRs77ci516JA0pSW4CS2Z0hKjLjxYtLE3/zIfspmhLZ16JrpF4wsN
 ByxA==
X-Gm-Message-State: AOJu0YyDa2Wj2BDlgaxD59tZhxNtocVppL3xtFwMJHATBULlMjXGl7DC
 TnQOBXSXTQWQPd5RDNMgqUoQ5NKsok7aPB3Emkhlq1MQ5sbkTBbwtwnr2k/KALAfx48=
X-Gm-Gg: AR+sD13aK8poIy2cDpfrgCkGyOSQ+LlOA39/vihcJfYSlAZlS93aRuF0bY6DMwdezYi
 pW9K//HVx/2U5oqr/AXYYqrC09ZvmqhA1QVxC/C+aLcdoSdeUyeyDxoS53Tyz589S1M5SWrqIbH
 s9iQxX3fFW/G/ynoTEWew0Aeh9Dyd2DtAGgdi6a19Fw/ZW4try9TD9F5W+hSmBO5boExU5NtH3C
 Po8k8x29jmb0J9q+CizDcOAOPqLEBpU9tzI+5bjSDCnMF9RHP6sRe0a+EwacVuQfYeDQymbQZq/
 n7ZFeDFLTa/9mPspQIuicrF+Mo0O5lCmqJp1iHqp5v37DOygdNsO/ljKlj7dmba9heZXtPyBE62
 5NXX2JLq5gZ261alIm4hJUb0uWk34BEGME70NghBE1IHs4+MIoVemC8huy1vb8ArlNTppr5xR5Y
 Xa9qmpq2eg2SNUByuTRdQbFpO+ZYoCWWX05YaS3dCYrsMvK0amKDicOx1ZUso2MSJQw9gH4HUkP
 VtkSBv+8qW4sp559R4RQmvDqpilod4=
X-Received: by 2002:a05:6a00:4211:b0:84a:29a7:f3b1 with SMTP id
 d2e1a72fcca58-84fc6d4c6d5mr760781b3a.16.1786567476962; 
 Wed, 12 Aug 2026 13:44:36 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84fc4787325sm125308b3a.23.2026.08.12.13.44.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2026 13:44:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 00/10] target/arm: Introduce cpu types max-v8 and max-v9
Date: Wed, 12 Aug 2026 13:44:25 -0700
Message-ID: <20260812204435.295067-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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

This is something that we've talked about for quite some time,
having separate "max" cpu types for Armv{8,9}, because Armv9
prohibits some deprecated Armv8 features.  Retaining all features
simultaneously has the potential to cause confusion.

Changes for v2:
  - Re-reorg cpu_max_initfn, avoiding the build failures without tcg.
  - Move aarch32 tcg parts of cpu_max_initfn to tcg/cpu32.c.
  - Separate patch updating feature comments in aarch64_max_tcg_initfn.
  - Do not avoid aa32_max_features for v9 -- the registers still exist
    and describe the features that might be present at EL0.

r~

Richard Henderson (10):
  target/arm: Tidy cpu_max_initfn
  target/arm: Pass ARMCPU to aarch64_aa32_a57_init
  target/arm: Pass aarch64_enabled to aarch64_aa32_a57_init
  target/arm: Sink aarch64_aa32_a57_init into aarch64_max_tcg_initfn
  target/arm: Split out aarch32_max_tcg_init
  target/arm: Move aa32_max_features to tcg/cpu32.c
  target/arm: Introduce cpu types max-v8 and max-v9
  target/arm: Use -cpu max-v8 with aarch64=off
  target/arm: Annotate arch revisions in aarch64_max_tcg_initfn
  target/arm: Separate cpu types max-v8 and max-v9

 target/arm/internals.h                        |   5 +-
 hw/arm/sbsa-ref.c                             |   2 +
 hw/arm/virt.c                                 |   2 +
 target/arm/cpu-max.c                          | 131 +-----
 target/arm/cpu64.c                            |   2 +-
 target/arm/tcg/cpu32.c                        | 111 +++++
 target/arm/tcg/cpu64.c                        | 397 +++++++++++-------
 target/arm/tcg/stubs32.c                      |   2 +-
 tests/qtest/arm-cpu-features.c                |   4 +-
 docs/system/arm/emulation.rst                 |  11 +-
 .../aarch64/test_virt_aarch64_off.py          |   4 +-
 11 files changed, 379 insertions(+), 292 deletions(-)

-- 
2.43.0


