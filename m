Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp3425770njb;
        Tue, 10 Dec 2024 08:05:28 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWUVuaK6T5TehyIdBwjG33/G+4YREem8o1CW8kCyxOJ+tGm5+Byq11DwtihLS/yDq1O+2yIn8lI47rUvg==@linaro.org
X-Google-Smtp-Source: AGHT+IG3pSuOxlKn8hiocwpSjScg3Gwxajhiru/fZR5hSPsjZR2znB1D3VqAOXTf2nB8ou08lAdi
X-Received: by 2002:a05:620a:8806:b0:7b6:d9b6:b53 with SMTP id af79cd13be357-7b6dcee33b7mr795298185a.60.1733846727937;
        Tue, 10 Dec 2024 08:05:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733846727; cv=none;
        d=google.com; s=arc-20240605;
        b=IP6N48jF+UaNRfSTEqpW0OD+rx0/E6bQ9vRdsoEy/klVu4/mtVoD6zg8wTI08QTyrY
         qEkS4GLl33G9Lr1NVqIdcvYXyPjGR+Xnn2/sBSKkKFGaroWXD2a9LM+TnlN0Io9uvxwV
         0hma3f2lvR8P5osbuTZSybRpjaj0SU6w883sPHuhImo8kGRRmEY0YnTKCk42g/qcWd4U
         Vtrr4WX2WDxZXuGL3CO5NNeyIr+R2Qmo4JitM8774J7ltUqCln8gu9x040vaGgSVr7jL
         aJJnSyxNIcCznbLhdN+bzbNds1gLsLXVb1O909dqn8R8t/+vCLh8a4ZHW6/c1fXKhM0d
         VwlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=FoswyhGfKme1kpeEV97ZDIIbmDczfqis10Qe9ki5BgU=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=C3++OGgRG9GIF2pNzRxnWU6hXwrxVgROElk6vAruXI5Bdn20dn1fT6UUX/ys+2jdJO
         0Evtusv9ubLVat3puyhuzkWfcxREv/h4MMXXphXkMAepMyb5uwOvUr7Lvfqy2RLYtw52
         kxmSa1cVHAG5O30GK4oNyA5/++ZgwKWdarlK0YyrpTixxnj2eyxb/jbY4AYbsm1JFxep
         VRLB8JXT2+CAzotz1hLBZNrGRkFYLb74IAd2V9mnBicOJf5+wt8HUmmgrvoO0sndgVrv
         U5G+CPKEEvnhEGgW/gCTXUCCtAXWYVfGLYLQ3PHMiQSZj0mrl98RcAM1cKyhyyYdKeE9
         xAcQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SoUKW+VH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6d351da33si608110285a.104.2024.12.10.08.05.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2024 08:05:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SoUKW+VH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tL2jQ-0000nc-Pj; Tue, 10 Dec 2024 11:05:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tL2jO-0000nN-C1
 for qemu-arm@nongnu.org; Tue, 10 Dec 2024 11:05:03 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tL2jK-0004M2-Tu
 for qemu-arm@nongnu.org; Tue, 10 Dec 2024 11:05:01 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-434ab938e37so37394465e9.0
 for <qemu-arm@nongnu.org>; Tue, 10 Dec 2024 08:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733846697; x=1734451497; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=FoswyhGfKme1kpeEV97ZDIIbmDczfqis10Qe9ki5BgU=;
 b=SoUKW+VH1z5Cku/Qn2WCKEXnYk6n86LWogY+XplQs5ftHmLYKUDijiQaRqGVZyxDZ4
 9grgUxAc2m1Leo5GyqnKx28BjDycfyREEUd6nwt8l+0woBosen/JDQ2yVOoKwnnebtRQ
 4GgklA+6yp3KeaZR+27t/9AaT/CgghF+HB5FUG86lyhZXMBwe2zCliZkJfEiFOXpezWj
 3tzuW705aofQJlUvJjWMW+3mh2BFSoxLKsHFi3BwOSPKWamb13MhEHsE+CI9Nh4SVB4g
 d5ptmmLYVXIauWXH32oRK68Elu/pBZuoN2gWg0kfq3v8RDqALfYOIJbEBndeJ7m8Ezwa
 0R8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733846697; x=1734451497;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FoswyhGfKme1kpeEV97ZDIIbmDczfqis10Qe9ki5BgU=;
 b=j1EQTSOS8AkGx/9fBSHdvqAYBr9CwS0ts0tA2IJv9AdPNXbMMF6n3GGOElOn+Av4Ii
 HffNobfKvtcah+SxasE+Ep2xYCrtkrGR4qUJTZPbRJIzLjKe24PVdxTKQ0VBmzCxF22G
 qmycAEFlBM5oVgKk1864dukKwfOFvaNi1fZOElXg7j2GnlXNrP1lqJPjyIzzux/OVSQ+
 FPIqelTpZk/XR2nca44QaVrESfR3NyAnx6bUy3NoNXA4rO/NLB9ogmh0KovrhNsUV93K
 mRDSa04hODkmulEBipKK4XoRaFZq3fEPnQuUuzCd/hCKT48lFv2k2Qbo9DTzVdolJg5B
 TEag==
X-Gm-Message-State: AOJu0YxwGjskAFGBpAImAtXC9ATXBGA3nRcdsQnE39mwP/YrYxkpW/Q0
 ZHck8a/cA/io/61dH2RzO+n0jO7JM2Pmwv9LbRFGE+6S0Y/JLMTUSD4MPCi0bq2C0vMqbH+RXG4
 u
X-Gm-Gg: ASbGnctH2015O5ZgSoIjIx2svcJ+VrS5OZyKeDGk/xwAJal+7/fHML3zbb7JdstkVXO
 tk8IdNQfjdhQIPBrOujJI49rqxqh8lNBlXtXJsX3d0DZv8SiSnvGAhw7XhEWgWXGkKbEh+C567e
 k99KHl7XuZAi36R94HygljKcl1px+nw86y5p8mO9mTae94rFRQyMxgAUWIojfMpNQ6e9V7KrqEV
 DRN57sPLzE1sxxX7hjKVwaBU+R9VfTCRVI7JQ085f3LIZ/59wcaLEN4IQ7q
X-Received: by 2002:a05:600c:470b:b0:434:f767:68ea with SMTP id
 5b1f17b1804b1-434f7676e9dmr68077905e9.5.1733846694173; 
 Tue, 10 Dec 2024 08:04:54 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434e8ec8072sm124671605e9.18.2024.12.10.08.04.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2024 08:04:53 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 00/10] target/arm: Pull TLBI insns out to their own source file
Date: Tue, 10 Dec 2024 16:04:42 +0000
Message-Id: <20241210160452.2427965-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: gUZEtnVAkL2e

target/arm/helper.c is very large and unwieldy at nearly 13,000 lines.
One subset of code that we can pull out into its own file is the cpreg
arrays and corresponding functions for the TLBI instructions: these
mostly stand separately from the other code in the file and have few
shared functions or other interactions with it. They make up about
10% of the existing helper.c code.

Because these are instructions they are only relevant for TCG and we
can make the new file only be built for CONFIG_TCG.
        
I split the move up into multiple pieces in the hope of making
it easier to review that way; but in the end the code should
all have wound up in the new file in the same order it was
in helper.c. (Hopefully this will make any backporting of patches
to stable branches smoother; it does mean that in some cases the
order of functions remains slightly odd.)

This is hardly the most urgent cleanup in the codebase;
and there are other parts that could probably be pulled out
(maybe the PMU emulation, and the timer/counter emulation?).
But I did the TLBI stuff because FEAT_XS is about to add more
TLB ops, so it felt worthwhile to move the code out to a
new file first.

thanks
-- PMM

Peter Maydell (10):
  target/arm: Move some TLBI insns to their own source file
  target/arm: Move TLBI insns for AArch32 EL2 to tlbi_insn_helper.c
  target/arm: Move AArch64 TLBI insns from v8_cp_reginfo[]
  target/arm: Move the AArch64 EL2 TLBI insns
  target/arm: Move AArch64 EL3 TLBI insns
  target/arm: Move TLBI range insns
  target/arm: Move the TLBI OS insns to tlb-insns.c.
  target/arm: Move small helper functions to tlb-insns.c
  target/arm: Move RME TLB insns to tlb-insns.c
  target/arm: Simplify condition for tlbi_el2_cp_reginfo[]

 target/arm/internals.h     |    9 +
 target/arm/helper.c        | 1208 +---------------------------------
 target/arm/tcg-stubs.c     |    5 +
 target/arm/tcg/tlb-insns.c | 1266 ++++++++++++++++++++++++++++++++++++
 target/arm/tcg/meson.build |    1 +
 5 files changed, 1284 insertions(+), 1205 deletions(-)
 create mode 100644 target/arm/tcg/tlb-insns.c

-- 
2.34.1

