Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E071606A31A
	for <qemu-arm@archiver.kernel.org>; Fri, 30 Oct 2026 19:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ir+w/pt0
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMsVb-00061x-I3; Fri, 30 Oct 2026 15:43:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xMsVZ-00061N-2H
 for qemu-arm@nongnu.org; Fri, 30 Oct 2026 15:43:25 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xMsVW-000087-HG
 for qemu-arm@nongnu.org; Fri, 30 Oct 2026 15:43:23 -0400
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-8470d7d430fso467962a34.3
 for <qemu-arm@nongnu.org>; Fri, 30 Oct 2026 12:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793389401; x=1793994201; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=SDmC1B9f85S9cuFY2KAgb1tzj716RADTzBzBLvsqcRw=;
 b=ir+w/pt0xUqEU8bLB306/ESMh8YlJbDwF0vuFaGRPV4f6sZ7ibkHPMGsw1XPmN5EMr
 7BiNDU0vDMa9IJqD7N0pniMJ4u7cC+FN6QLVSAaaOr2kTBs7b+0yP6z36AXrEdcYzUVr
 +Iu15JbhRf4UhvYM20Mg2CdhCjBJIfwPlza6M3o83naQ0ljU4uLITSdqVY3uS4enCQaK
 32oiSz+/UsYa+BzVRaQowB0oCqYS8z3PFW6AnzKkbi0y8Jo2MjlETIZg4/7vbph6RFlE
 VOG1H6eYD53L7NbPVpIdlRd3jWiqjFPUIi8WxW32siEpZvTKfdbH8H71Wb2uLKhKIpOp
 V3gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793389401; x=1793994201;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=SDmC1B9f85S9cuFY2KAgb1tzj716RADTzBzBLvsqcRw=;
 b=Cu81MEVMttY4LGHo6bIkCA++pKBi839x8aWhmfZYdA/kNsYpQSkInpOOUasocUyhnJ
 QYSwNBeoC6b19vv2nwjBtKvOaOBpSAIC0UHX3nZ+dmqcWtgb4c5TFmcUg5WAQeMh88os
 QuUI2HbRyD5nP5RZgmLsGGj1gGKPuwFJXTKQLGEWef7xyZWIgGJxFQuoReHyYowd+f5o
 HBNnjjgXno9nbEK4aUg7pUsBgfin0HIrEf5h/pe0B04TbH+j1j7UP9/zbbbEjvlczB50
 SkyDBaiqB2DqkL3N6/4RvZOsUorL1A2mVfQlHTi66ICKa7H997LamKeDCauUvJFE1NUz
 fkMg==
X-Gm-Message-State: AFq9FYJ0Q1C9dHSpIFAEmR+PFmHrIWvZ5fU1uRfxOzB4NDJyewAyPYFw
 NC4Ri4AeuhKahwEO2qvICEKEDt17GPxAcZOvOFVEc3LZv2Otm0/OMcAauBiCah/BZLX/D2Y1iKN
 I3qfs
X-Gm-Gg: AYBFou1lOgeO6H3Oo0rYMbBUSF7CkHnlu1F/GRRWt8whOxm95PFH3j93ktcSD1k1b8s
 HyyIh7v82WrgTsDv0IYgENNjZjMhJeUbOMxe5XDN2l73ZYAPJ8hdjPQf9q+c0Oc6wv1lk8ULLgz
 9etjt9Wg6AJI8aYIHoEx8fIUWA0xiLfuKWtg34T2bAFPlJB4smFbChNBapKaW95iD9GiJecVHID
 dUHaDC6i430ol43jCQqJ1K35ZPnSpP4EUy0ZQjIVBlNBJ9oJp3/K6N0DZ/pOCsgEGBXmMyAuSKL
 G5tiPAueRO1IOQk3zQ6EIgHA5dlQITHVzOOJ6gKPByCDmGEsC1N4rLsyj0d6SABhkMppGYcOxzp
 +vVwU//rY8oX6EDKKH+Kp9hrBhwRNcZL0Jevz4gCKjWt5OD/F95aUZ6EM+yVUwz8Dr7OgDGMiAF
 OxHWOo9ioM3R1S9I3/wHLYiAO3+9DJvx13iomCY8GJdpiGSUmAaa5eKYss6AolJRmA+n2Gp1gPX
 DMvq+LIxcSBWAtRMDez8f7ymMvR0hAOJVnru9OSysihIZC1iCj0+EFQ2nCPYGWSoCZKVFxM1i7b
 mFQd0Nxmlu38CdWx2hKe2wHeY1gyNm0gas1MwlybflOHfgKHDX8reJfo
X-Received: by 2002:a05:6830:2b20:b0:828:ca8c:f880 with SMTP id
 46e09a7af769-85d36610ecbmr2526472a34.27.1793389400901; 
 Fri, 30 Oct 2026 12:43:20 -0700 (PDT)
Received: from stoup ([2607:fb90:5e62:412b:1381:b0c1:1339:9c82])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-85d351e77c8sm2654768a34.2.2026.10.30.12.43.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 12:43:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 0/9] target/arm: Use tcg_gen_goto_jc* for aarch64
Date: Fri, 30 Oct 2026 14:43:09 -0500
Message-ID: <20261030194318.319310-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x335.google.com
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
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Based-on: 20261030185551.193092-1-richard.henderson@linaro.org
("[PATCH v7 00/14] accel/tcg: cut per-block dispatch overhead (parts 4-6)")

Because btype is in tbflags, using goto_jc in aarch64 is more
complicated, and requires accurately tracking changes to tbflags.


r~


Richard Henderson (9):
  target/arm: Add tbflags to DisasContext
  target/arm: Retain btype in DisasContext.tbflags
  target/arm: Add second value to DisasCompare64
  target/arm: Split out gen_goto_tb_int
  target/arm: Split out gen_indirect_branch
  target/arm: Split out gen_cbranch_goto_tb
  target/arm: Use DISAS_TOO_MANY for simple TB breaks
  target/arm: Rework gen_goto_tb to gen_direct_branch
  target/arm: Use tcg_gen_goto_jc3_i64 for aa64 branches

 target/arm/tcg/translate.h     |  16 +-
 target/arm/tcg/translate-a64.c | 400 +++++++++++++++++----------------
 target/arm/tcg/translate.c     |  60 ++---
 3 files changed, 251 insertions(+), 225 deletions(-)

-- 
2.53.0


