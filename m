Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162BB606A31F
	for <qemu-arm@archiver.kernel.org>; Mon, 19 Oct 2026 16:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KZz+ud+X
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xIq85-0007Zm-Ul; Mon, 19 Oct 2026 12:22:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xIq85-0007Ze-Dr
 for qemu-arm@nongnu.org; Mon, 19 Oct 2026 12:22:29 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xIq83-0000zb-6b
 for qemu-arm@nongnu.org; Mon, 19 Oct 2026 12:22:29 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4a1e34ecb02so10420065e9.2
 for <qemu-arm@nongnu.org>; Mon, 19 Oct 2026 09:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792426945; x=1793031745; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ASvd06Vj/QEZKs5daEjChhsW+tV/2E9ZjYHvF+a12V8=;
 b=KZz+ud+Xy64SaBnJJUcIhBMoBPJ2PI5XFwUMnsBbblX4GFiR1MSdO74xYi7XnV6Q4V
 dCPKoHRCDL/8RlmMo++UOUmhtLuujSybEDaQ3tPvOzRt95g1V6rLfN5sKH1bqa9UPG5B
 lGyCCVy3DIn4fttg66Aykzqi00ABy3EjknQs77n5G7j9xM14rKKidpoUf9zY7EqIxsjS
 RJfMxb5bmlPrKykANyElVa4+VRXWyCyc/J9yjbC1a7+6uvK3aFuAn5SzQ+utAq7U0j/c
 glFvT5WALlGYlYhi2OJSKElfUfj6u4MlmHmOwx4FlnxftCsLzw4vDPLu27Kp/6sRuV2G
 jL7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792426945; x=1793031745;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=ASvd06Vj/QEZKs5daEjChhsW+tV/2E9ZjYHvF+a12V8=;
 b=oTtInTLgU0taZ6V4Pdi2Z5vNHCFPmbfl9Pn54cImgC/GJZ2e4v3sr4OqBdFl4cBPjb
 9QLDYiPd6GQIIGsd5syIdIMWX7w1UTHrRm63FSTtppjIlHpXosl4EtK+P4h++opEpQoH
 xoMPcYld78qtdc5bnhDqFmgkSqnrLul8z31kiYt7poiRAdrFeVIn0uyn1gFHhoI/MCPs
 foPHjFEXyw3bzOCol4amwLUwTHvLBrrAAS9cdpI/Cc5BS3zuKVrClhg9p4agGchm1Szx
 57EY2SNNt0pJie9TwEIPkhkTMuE8Pf332KhY/Ux9kb0RcrTetJdCi5kFTw/JWnanwAIj
 6zFg==
X-Gm-Message-State: AFq9FYKVVPjlHbojIu/d4MMkYNvz44XSyjaEEcAsRGK6/24+s6XKTGO4
 r1xZB2cRWelxB7TxONM5WGHvQfKw4YbOmi1wJVBYrxzWPvR6S60+mxK20wWJHcORNuSleEXJg8z
 W5YVycXE=
X-Gm-Gg: AYBFou2cxZA1kscw5jo44cBpPtliwatXXyFpbgFUaPsN7y3ImeSUY40Ogjhbbu93HB2
 vsU/LZ3hpvnxKNT5GrxhU2LDgwYk1X95ylEtq/sAKXYu03qE+L4UIj38o1TotqXBbbHGfK04Fjm
 u7bKaY9huGfc+SqCW4/cjRQmkSeqodgL6jkUsuuv0REw7HqeXFYKCpVJufI3A5eKYdRXtOOZzVb
 oY+Us+Z+2GGCNwlb1/7f7RumRfo7KxXkB+7obwUEEaVTGA9Fj0dEMduh5hq/8fZhrGVQI+bK/R9
 4ehpFCoPq81hkKcLMY8m9V0f3EKiQDgFcwSZRxBVtDGmQ2IWdpcGxXStzZ6xLOBK6hX2Upoe4FT
 h4PoG0cut8uNgZDNEtsnTzAwD7T095PbWqFAOncwWVN+fIiayqSiIgVdKWz/Cv3HKoclz4DTCaH
 CfP28vMyEQz9vOsSPi0f4AZo9Pg97+kzVB5PFyKfgRLtT1gdSXbXdx+Jf4mX9VsKcbO5SeQeL15
 4BpnmuurQ6Naw7+Xfh3jNik1lWV9RGHJBKm5s6eFcucpAXvshZnR/UsfjMFynOmbSmlWk+LinhM
 R5Y=
X-Received: by 2002:a05:600c:4fce:b0:4a0:1b14:e283 with SMTP id
 5b1f17b1804b1-4a1d75ac25cmr194943135e9.1.1792426943894; 
 Mon, 19 Oct 2026 09:22:23 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1f2cdc342sm3100095e9.13.2026.10.19.09.22.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2026 09:22:17 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/4] hw/intc/exynos4210_combiner: fix misc range check issues
Date: Mon, 19 Oct 2026 17:22:13 +0100
Message-ID: <20261019162217.3272337-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_ZEN_BLOCKED_OPENDNS,
	SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This patchset's meat is patch 1, which fixes an incorrect range check
that allows us to index off the end of an array.  The other three are
cleanups that I noticed while fixing that, where some checks that we
were reporting as LOG_GUEST_ERROR should be "never happens" asserts,
and an array we use for register contents has an extra unreachable
element at the end.

thanks
-- PMM

Peter Maydell (4):
  hw/intc/exynos4210_combiner: Fix group register range check
  hw/intc/exynos4210_combiner: Clean up reg_set[] bounds checks
  hw/intc/exynos4210_combiner: Make reg_set[] only as large as it needs
    to be
  hw/intc/exynos4210_combiner: write default case is unreachable, not
    guest error

 include/hw/intc/exynos4210_combiner.h |  6 +++++-
 hw/intc/exynos4210_combiner.c         | 25 +++++++------------------
 2 files changed, 12 insertions(+), 19 deletions(-)

-- 
2.43.0


