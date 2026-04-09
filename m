Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3B87E98FA9
	for <qemu-arm@archiver.kernel.org>; Thu,  9 Apr 2026 03:50:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wAgPT-0000bc-QA; Wed, 08 Apr 2026 23:50:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wAgPS-0000bL-HZ
 for qemu-arm@nongnu.org; Wed, 08 Apr 2026 23:50:26 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wAgPQ-0003rb-Lz
 for qemu-arm@nongnu.org; Wed, 08 Apr 2026 23:50:26 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-2aae146b604so3612925ad.3
 for <qemu-arm@nongnu.org>; Wed, 08 Apr 2026 20:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775706622; x=1776311422; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=G00wOYvj65EA1zo/B3ngd917DbHwZK5hc75QqbKtctI=;
 b=jyFsVy/VLQtvLXS0prljD36xO4Bwh9GkZdQHQzm1uweVCNMKPOtFP77YrPoBp7D1gH
 iaB8QMqAekY+IMD3GhZzIeHQDCTkEzlPznyy+/k19yrwZ9T9Y7hmTZFPIJGUXLFmGgFf
 /Lzf+SCyPzdQzrVS575z33viodbiYbPy+hSf5iMQtlKx9g90iw1IAWpyeFDYEVu6pJhE
 5WY96eN4E6sdB5G0rhNPdIGs5LToVOdyN0H7yG5sRrZWU4Hq7JduBKKrdWPehxYLn5uQ
 AGfQ3ViLf4rdUUPoC1XwhfYz8yVzBj0S41N/2m1HC6+3RJ/FHgV1G1/aIV5d8NXuTECy
 dFHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775706622; x=1776311422;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G00wOYvj65EA1zo/B3ngd917DbHwZK5hc75QqbKtctI=;
 b=XQTxnDKtFPL/jZWfCWU0H+oARe4ZhxjkZ/fCO8PCGr7vTQeO2h6WbJ1szb8CjOgD+C
 85Zk8CDZLxzyJ97ffqk90+5JJFiobeaUcDXXa6PlzQ5CKy7BpY9W561iYzsCpFh5Y40T
 fhc+Swc4MjfVbH6GtT+90+eF+C5fkygw4A1XXwTLRS6+UPe7TzFdYQTWLFhlRD9+8nt+
 +2iv5dT/SbJ5sDuVU/Hee5F1rz9gQ+/6nsjUXz9uXFXSzYfWWJiwAS77zesHMhBtMLWy
 WV32Vow1UN2o64tO5E5PzUtr8TgSyhff54sqa0Sk9dvu7i1TR/2Sq8+G5oT0G8hm8cmy
 7n7w==
X-Gm-Message-State: AOJu0YwkUZz8RtriovtuglZkq+BlRNEW9jznD2WjDE3QRoFaPrdPeTUe
 sWI0fqqhWOGptVurPgoIKGnBxYIXzI+e7DW4GIPuYr6IxtISN0hBoIgfy6qL6FOOEN4=
X-Gm-Gg: AeBDietnxAwDRX/ZGslpYxW30ba+nR+4B5IkkqhewMEvmegfcvigRl+075lE2EbXInf
 2YRvmXyUINMQhnIGbDJk38Nsb7FBqFQzmC1IpCY+zmEL70lDiQi6SIkkZKdZY6PJ76CvCOsMmVv
 +LBSbOyl5CQeZ8oiYVkrRj+otgB5rWI8Bd013siUwNTcUsYvRw4KGuFE5g62/xxm5vYUlry4YIy
 8Ya/AVevJSkHXOHXVDVcbXorERlZCihvJWFnEfQNJKp0KaDTkYw5rQhpZhchWTP2AvsUkXzJDPo
 46771pz1RKDmhtM5YG0/gmDw7QI0ErC60B8Y2ZFSQuQEZsTP2hu00MWu7zookUce4Y2ngEFXOJN
 nYyDvFBhliJ5W47o9vTz/gxNyIcgJGpDe4xaC/tV4XNzXGy6y0s8bVyvDsgE6qjv9kT7fEp8I8c
 kjnX/YWEXkIosD9zyDWOJiQNAlLRg02701ZVc5bMQ8YBhGWj7iElfQEc57
X-Received: by 2002:a17:903:3586:b0:2b2:6b58:9317 with SMTP id
 d9443c01a7336-2b28194ec0fmr241096465ad.39.1775706622076; 
 Wed, 08 Apr 2026 20:50:22 -0700 (PDT)
Received: from stoup.. (124-150-69-109.tpgi.com.au. [124.150.69.109])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b2745c480dsm277830605ad.0.2026.04.08.20.50.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Apr 2026 20:50:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, pierrick.bouvier@linaro.org, philmd@linaro.org,
 peter.maydell@linaro.org
Subject: [PATCH v2 0/7] target/arm: Remove bswap_code
Date: Thu,  9 Apr 2026 13:50:08 +1000
Message-ID: <20260409035015.132370-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Based-on: 20260407222208.271838-1-pierrick.bouvier@linaro.org
("[PATCH v11 00/21] target/arm: single-binary")

Version 2 here should probably be RFC.  This time around, all
instruction loading, and more decode, is done by translate.
A new CPUARMState field is added for passing data to EXCP_SWI
and EXCP_NWFPE.


r~


Richard Henderson (7):
  linux-user/arm: Restrict regpairs_aligned
  target/arm: Only define aarch64_untagged_addr for aarch64
  target/arm: Segregate target-specific user-only fields
  target/arm: Store SVC immediate for user-only
  target/arm: Recognize linux faux BPKT
  target/arm: Introduce EXCP_NWFPE
  target/arm: Remove bswap_code

 linux-user/user-internals.h |  2 +-
 target/arm/cpu.h            | 27 ++++---------
 linux-user/arm/cpu_loop.c   | 75 +++++--------------------------------
 target/arm/cpu.c            | 28 +++++++-------
 target/arm/tcg/translate.c  | 63 ++++++++++++++++++++++++++++++-
 target/arm/tcg/a32.decode   |  5 ++-
 target/arm/tcg/t16.decode   |  1 +
 target/arm/tcg/t32.decode   |  5 ++-
 8 files changed, 103 insertions(+), 103 deletions(-)

-- 
2.43.0


