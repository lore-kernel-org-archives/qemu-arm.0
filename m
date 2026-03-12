Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ECBC106ACEF
	for <qemu-arm@archiver.kernel.org>; Thu, 12 Mar 2026 22:47:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w0ooF-0002ap-6Q; Thu, 12 Mar 2026 18:47:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w0ooC-0002ZY-9L
 for qemu-arm@nongnu.org; Thu, 12 Mar 2026 18:47:13 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w0ooA-0003ZW-PS
 for qemu-arm@nongnu.org; Thu, 12 Mar 2026 18:47:12 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-82995242934so1044316b3a.0
 for <qemu-arm@nongnu.org>; Thu, 12 Mar 2026 15:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773355629; x=1773960429; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yhpDMj0yQTAm84IoeTbutcLAJiuwRR5/t32fx4iGcCA=;
 b=ztb1hX3hHm4iNqryPO7WOKEupMzvcvd0YYVSnTcKxHc48dze06xdZS7vQXT9GTZYwt
 6kZEqelZ0B5FYL7eX57lvJVNT+IINtA7iBfpqE8BYtJDN+0CE18ECgW/Yxk8WZMTnJJ5
 tzgj+4iIroxBX2U5Xln/vSgzm5HS3hqPIcZur4rPbaFscfpujsxGlu0OfGGFU8XdAS9h
 EhaTEmBIr6h28qT5t12nRCJF3tin3ImzOP4K2PJDGZkQJhh461FbeJsHhKag4o7cq8O8
 nsCqh2z7Ik4SnT06jBiKbTzNNeBr3RkcQqSOm0ZJ+iQh+kb5LlJON6EqAKyefy3T9pmC
 OUeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773355629; x=1773960429;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yhpDMj0yQTAm84IoeTbutcLAJiuwRR5/t32fx4iGcCA=;
 b=KpQfzTzlxMZwtVz2DblMHdM+LpJPMjbT5U9paX+6XJ+ulmxO8Mx8bdaunE3gKg3uIV
 jaNSb1JPf47WtfRDe5Bx0yyr6O1hl+4K0YRPekdu7YFtpY3/lOg5aj7O597EGqxHw6A2
 tqdi/fYLMR+MYONEuZyhrIAIx/Hm+z/xPEv3tuv92k9bwGcFfSXTyCkk0NrCdKzjSlC5
 oFDGKmwpaYWuz62HIKOVd+Wzww3dz9B0uUn9WK3NU2nVliagKQltxHw2MQdiiC2LdHIG
 +V9AcD9CrNblyYWr7XhED7mc8qtTrxlZRIGBaVdPvPav47inbukBupvPYkKerf+kXAQD
 Mz+A==
X-Gm-Message-State: AOJu0YyGrGgUSFqHpqveg2VE1pz4wRiAR+kr1m35+sm9i67XmkQCVc4W
 eaLLDU/IOsXvqNEK9XShkq4/rEQIexb49zGolBbSnv/yB8r2L/FiN9xAt+Uvvrwc9dK31jnCWfC
 kX678nZE=
X-Gm-Gg: ATEYQzykuMGwFSuxzm2GnekON+4445XCMpzs3ObD0uNeZJiXl++Zna7+Yevh8uSnw/L
 IcICRUl3fy461+6e0KvNy2VSLKWIe1ncdWIdoj8Ssvabb/DhbprT1cSKRR8gj2fGjvW3jKSz97m
 zVZgKSCdQVduZGEySq/YcqDZDkD7h0ynH2NF4vrtMP1YANG2tgYvOoUkwGvZnpPPzC6ROhck7rE
 RarnhSXebkr3yrWr2/cQnCqBHnr7cppaI3VdEk4GPg6O/hTVD8/HERtVg8I5bhF98SUnhc6lIW2
 hdaknPqG/UfdpwOzmOoJfREo6LUqpuLqMPf4H5lepK/fc8QXEPs2KE6SHK1jrzyNB/p4P2d/3N/
 ZqIa0VfGxQveSl9/bfxv0+P2LXT81PAUCScebbzaEYXM70mwfJtYnmIWkxuzV5dd8r/Zb5uQi06
 onsSpnSKFpRhMd9+Te88xn2cI/6p4Tt5U8K1HqjcGeSD8Ccu4xdj5Owzzo9YFJuCke8p1F13CKd
 c10
X-Received: by 2002:a05:6a00:bc8b:b0:829:f777:daf1 with SMTP id
 d2e1a72fcca58-82a194ea295mr948749b3a.30.1773355629150; 
 Thu, 12 Mar 2026 15:47:09 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82a0725be23sm3992698b3a.15.2026.03.12.15.47.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Mar 2026 15:47:08 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 philmd@linaro.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 0/2] hw/misc/allwinner-cpucfg: single-binary
Date: Thu, 12 Mar 2026 15:47:00 -0700
Message-ID: <20260312224702.1608408-1-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x433.google.com
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

This short series changes hw/misc/allwinner-cpucfg.c to compile it only once.

Pierrick Bouvier (2):
  target/arm/cpu.h: restrict cpu-defs.h to target specific code
  hw/misc/allwinner-cpucfg.c: make compilation unit common

 target/arm/cpu.h    | 2 ++
 hw/misc/meson.build | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

-- 
2.47.3


