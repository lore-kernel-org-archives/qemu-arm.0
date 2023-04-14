Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp210169ejm;
        Fri, 14 Apr 2023 09:05:13 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y1GhTFa/0Um6EzWezSO2Bd78F0wuBMnAT/XT2IMH0a6HMxD48JpsJfBWUMa5bD5a7mjPAM
X-Received: by 2002:ac8:5b83:0:b0:3e3:8655:76a3 with SMTP id a3-20020ac85b83000000b003e3865576a3mr10023795qta.1.1681488313001;
        Fri, 14 Apr 2023 09:05:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681488312; cv=none;
        d=google.com; s=arc-20160816;
        b=kQWzyPjcxkL1RKX50lru/SFsa0Xb7RML4Ul+a7zyDz4AnfLHar2yj0hXmvBtBzJ6mC
         GceJbWsXR7Sxgna8shIEAquYeCGuvdpLIDGF41A6l+I4O4JJLGWgx4mqXNRXDG7nQlds
         kMTLqd2xVmR4s9CI+hOdTexS3i+udTXpOr+QAqzmTBiRDtV0mgEbHKNzcXY0jrdIL5wG
         dbSHPpqVq0hRdh0UwZuWTTM4PExQJeR7qhtuK74izH4JlZNGBjpzv/kikTcogVGMyk0Q
         JvjiZeXTdNDcTSacH66OUhaktB2/kxYghKOq0ynh+PIuI47R5iox03acm576k9S/Oq7e
         iniQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=CVppDgiSC0bLO0JkaFk7PJdJ9Tl0xT2sLkX+JcFhZxw=;
        b=JlCo7VxO4b8zxFs6c2rp6ZqZyq70kNvc6dAtY7/n9EmAkWxnEo52jhTZnLSh/qjXcX
         OqT0mgEvHKiSA+5UgeDKOq+fo6lnqGEkoSOaJT9WCwTMAo/Ttf7boWAziDZPaJUf8pJE
         Nm/4tS+k/TjW0RrP198JCJHjDCQHe7p1bEdYSPs9XMgV93IUI/q9ulaNSDDjA9QFvdAG
         TLtlxeH+Rtvd8zP4fyq0pDSKqwDsYq5ys+y/2ecgTv5n/orTKATiv9wTTk6usXbIXHEx
         WwJ/9jBjo2q87P1GMptaCyo5Odwuje+7CjDazWiq+KyiA4Ov1CUfx2IaJoQYpY0AqUQM
         Wqzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LD5f1+iQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b1-20020ac87fc1000000b003e8284a2690si2977388qtk.802.2023.04.14.09.05.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Apr 2023 09:05:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LD5f1+iQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnLub-0006JX-Rg; Fri, 14 Apr 2023 12:04:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pnLuT-0006Bq-2C
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 12:04:25 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pnLuN-0007u6-FC
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 12:04:24 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 eo6-20020a05600c82c600b003ee5157346cso12206234wmb.1
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 09:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681488255; x=1684080255;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CVppDgiSC0bLO0JkaFk7PJdJ9Tl0xT2sLkX+JcFhZxw=;
 b=LD5f1+iQfWiLt/GJQny3vjp71qcf0SMPr2kMxir5ThTOM9d+PSXulCkWB8eQm0oudk
 QqEV7M2kPxZddb6L4zW4NIZ1dmfzkq1THEv7TncZe0RSZQN8amXVld0r1xgKJLv+uhI9
 JDyUmNadY6YP8hbxFBDqJQEbeK4XbCPetvXq0sKCyPY5hRyj6ZjXRHk74nTz0xC85IL/
 MX6LrGJIG/gn9ALf5Yv0ZqFCyTbRTAMssFGKelLQ7sUKyc8YF0xCFW5xEieXFsfIh+7G
 rS04cjzQQZaAE8MTZ8J1YzAhdHUfyyk2yiTznXabxgOucakGcijN9LA1QRA5PaEPAXXP
 5I2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681488255; x=1684080255;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CVppDgiSC0bLO0JkaFk7PJdJ9Tl0xT2sLkX+JcFhZxw=;
 b=KwtB2hegYtzDdtyT+sqs2eZXmMAkzWI9CPsKjdw3tQIa5p3qxgcR/3nvTZSRosRJUF
 5hH7+dt+mAKww/xJYsESqIMZxpLtkUKbGGzge8UnkGKJutmY93BkPaybDlZAb+olYF4v
 rxjTmr7gRc6nMiLURQpolopKE80QqsJhwkX9oCdhlpS1g3fmUIozzt04kPDsvGw/DXZ5
 PGdXIlCSYemQeK46Ss9Qeqk0Wih9JImUyMFiAzJHXAwaFAnUKC7aHDmJXh0Hpd40w2lS
 MEAJTZYMbCJYIOYXpOEA9wl68kXrypjOPWk6+w0kWUrb+oFjVHB0hrCWNf0rRZrUgzGp
 EMSA==
X-Gm-Message-State: AAQBX9eWJ0PVQNnF/Rg8QPzW5xKQihZQfZcMNmzNycZIbvJtmcWUOXPT
 AkmJaE+aMejK5kcfmQu9RFutXQ==
X-Received: by 2002:a7b:c4d6:0:b0:3f0:3c2:3fa4 with SMTP id
 g22-20020a7bc4d6000000b003f003c23fa4mr4710566wmk.12.1681488255114; 
 Fri, 14 Apr 2023 09:04:15 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 8-20020a05600c22c800b003ef71d541cbsm4673752wmg.1.2023.04.14.09.04.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Apr 2023 09:04:14 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 0/3] target/arm: Fix handling of VSTCR_EL2.SW and VTCR_EL2.NSW
Date: Fri, 14 Apr 2023 17:04:10 +0100
Message-Id: <20230414160413.549801-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: G+dNrB7tp7+W

When FEAT_SEL2 (secure EL2) is implemented, the bits
VSTCR_EL2.SW and VTCR_EL2.NSW allow the guest to set things up
so that the stage 2 walk for an IPA is done to the other
address space, eg
 * a stage 2 walk for an NS IPA done to secure physical memory
   (where the translation table base address and other parameters
   for the walk come from the NS control registers VTTBR_EL2
   and VTCR_EL2)
 * a stage 2 walk for an S IPA done to non-secure physical memory
   (where the parameters from the walk come from the S control
   registers VSTTBR_EL2 and VSTCR_EL2)

We tried to implement this, but didn't get it right -- in
get_phys_addr_twostage() we identify whether we need to do
the s2 walk in Secure or NonSecure, but then we fail to pay
attention to whether we were doing the walk for an NS or S IPA.
The fix for this is simple -- set ptw->in_mmu_idx and ptw->in_secure
based on ipa_secure, with only ptw->in_ptw_idx depending on
s2walk_secure. However to make this work we first need to fix
a couple of places in the ptw code that were incorrectly looking
at ptw->in_secure when they either should not be or should
be doing something based on ptw->in_ptw_idx.

This fixes https://gitlab.com/qemu-project/qemu/-/issues/1600 .
NB: I have tested that this fixes the test case in the bug, and
that it doesn't break 'make check-avocado', but I don't have a
huge supply of EL2-using guests to hand so the patchset hasn't
received exhaustive testing. Plus this area of the architecture
and this bit of QEMU's codebase are pretty hairy -- so careful
review would be a good idea :-)

thanks
-- PMM

Peter Maydell (3):
  target/arm: Don't allow stage 2 page table walks to downgrade to NS
  target/arm: Set ptw->out_secure correctly for stage 2 translations
  target/arm: handle ipa_secure vs s2walk_secure correctly

 target/arm/ptw.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

-- 
2.34.1

