Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp1539315ejb;
        Sun, 11 Jun 2023 09:01:45 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7SU/O9dfVPmUZfeohfSKp5joG2rkdnAN+e/4uH9y61dGmLh2dynAirjKwE76nN7ztByxdN
X-Received: by 2002:a67:ef9a:0:b0:432:81e1:c296 with SMTP id r26-20020a67ef9a000000b0043281e1c296mr3107241vsp.24.1686499305382;
        Sun, 11 Jun 2023 09:01:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686499305; cv=none;
        d=google.com; s=arc-20160816;
        b=zCCnXr7hF6GkRf0BvswkSsU0FahE1YAvEdOgrF7UdsSWcFsGwf1mxSqVTyitofQucC
         KLsCm1KnW9Xtf8DLr8N5TWdAjSC8DZZwV32kgKWfwao+KUr2TIUZXqSPYUQ10lgSvZzL
         /iggddCwqVzphbB90LM+nntEOnbHo5cFYlazfay9kMIXWzKDVit/LbgAwPpTzx5i3IvK
         s54+1QimaTKhv8cjct5v+2BVk4TZlft1JIv8J1ZhojfkXJiCz9XxVZ5KLEc9Jd6PJD84
         xyFzVDKbFwGcKSInMs4+SOJlvoiXOm76jiUTG29A5PMOWrceEv8d1Y+vVPI8MGdlSJ+D
         /u/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=nyxEjBGzggeyRWgBQZTI8w9VpDGSwhlVvemGPQ5cKrA=;
        b=E2Y1XrD1i/8QLjDwpUVgwJ6DzKfG6pqfAHUS/l759rgM4IO0l7FfiA+WdmLTEf2OWj
         pA6jtF1dx5UjruUYtyMxeIr/h7mpIWJrmnHNgseU3QbCABY7zfwBiSp76rftQTV8MBRg
         6wk8mJ1WC0T9Ea9FmuE3viVIT6hcRA79npmowAjjBg2YCkB825K5lk2ShMCepnua2kpq
         bjTJEQRGEMOLMoXnMzJ9PNwJq2kf7/lyYNVgOrlx9nMjM86EBhjf/HH5SF+zb4M8uEdc
         62EX4fLvfRYPE/WtOTvDI6i4bbPNm8gB5bWuDBoPVnd35nSYAl35e9jGsEGRiZfkZKBJ
         f3Uw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bC8QvIN2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x9-20020a0561020c0900b004357809847asi507629vss.134.2023.06.11.09.01.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 11 Jun 2023 09:01:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bC8QvIN2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q8NVa-0006OV-C0; Sun, 11 Jun 2023 12:01:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q8NUe-0005ov-E9
 for qemu-arm@nongnu.org; Sun, 11 Jun 2023 12:00:49 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q8NUa-0000Qy-Uq
 for qemu-arm@nongnu.org; Sun, 11 Jun 2023 12:00:39 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-30fbf253dc7so244475f8f.0
 for <qemu-arm@nongnu.org>; Sun, 11 Jun 2023 09:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686499234; x=1689091234;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=nyxEjBGzggeyRWgBQZTI8w9VpDGSwhlVvemGPQ5cKrA=;
 b=bC8QvIN2etvlv8XzAZWwblicx/LLaXNhc/hSdG1dN1iJ7ENIzyKr4UjkU0kvS7mO2e
 jvvTw+0Mb7yid7d0TqM35zCKa2aMKv3Sn5uk5ciF+W+AuYPH3kgLWeXckmcI23nx6V+Z
 N1g6k7JIA/XM70OGq13rtHE32oWFZd42I6XlZdu4WEILqCHD7cLDwWvz4ZFJ/dlHQb8/
 nCQbJlVkdnL839ZR/3/GZQh4wZufybl8we1m8Dl9T/evujnn/3S8HQZz7gFqhlF4i5hm
 +HE8elQNPQtpOrWDPR28S5iBWNenD+aMw6JkhNALNTILG0sOmsxw7VIVg++iqtFd7bv8
 YP1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686499234; x=1689091234;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nyxEjBGzggeyRWgBQZTI8w9VpDGSwhlVvemGPQ5cKrA=;
 b=Px1cJcdmpfsiAIOwIQDw7iGK7xreqRM52HbaBvClUp1sVni3nk0aJhnHYbtn6Wh+9C
 XOGC9TDqkRgrXIwn5EreF6RduZySVktAUeuA0yll8d64wQJrIsyLHkNGTZNhriYPOol9
 kRCTwZZi+5f6yjPgpt59LYJCqaFC6tnu4PLrTdrkeqNd8c2RsjbPFIokoOhvSTJqNdv8
 5JaFvqCa1utq7Dei3XMdGPUHq2BnB325lS0Jeb91XW75dmuvEIEKOT687dDq6t46gACh
 lzyEZS2sAXrE2g5iuALhSMl6pWx+iwyozR6xfGsHhXfeqHx1QAwJCbHUuCNIcPwLE8n/
 D1DA==
X-Gm-Message-State: AC+VfDzx/4OJMiH09z639o7fVt8cSHrTHGRzo+5Knw9lH4uPwIdCLZQS
 QhWr7LTyR7f8hju0SIgQcbNE3lQc/tA4AJRUs1w=
X-Received: by 2002:adf:fc08:0:b0:30f:c1c3:a62b with SMTP id
 i8-20020adffc08000000b0030fc1c3a62bmr395877wrr.33.1686499233980; 
 Sun, 11 Jun 2023 09:00:33 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 m9-20020a056000008900b0030ae499da59sm9923022wrx.111.2023.06.11.09.00.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jun 2023 09:00:33 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 00/23] target/arm: Convert exception, system,
 loads and stores to decodetree
Date: Sun, 11 Jun 2023 17:00:09 +0100
Message-Id: <20230611160032.274823-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: f1t3WKVoMLTT

This patchseries does more of the conversion of the A64 decoder to
decodetree.  It covers the exception-generation, system, load and
store instructions.

The rebasing of this on top of the atomics work turned out
hairy enough that I thought it was better to send this out
as a v2. There ae also a couple of new patches at the start
that fix minor things before we start moving the code around.

changes v1->v2:
 * patch 2 is new (but already sent separately and reviewed)
 * patches 3 and 4 are new (fixes to recent refactoring)
 * patch 14 (ld/st pair) is structurally the same as the old
   patch 11, but the underlying code changed enough in the
   atomics work that I figured it was worth getting it
   re-reviewed.
 * The very cautious might also want to re-check some of
   the other load/store patches, but the changes there were
   rather less, so I have retained the R-by tags
 * patch 22 (ld/st single struct) decode reworked to follow
   RTH's suggestion

Patches needing review: 3, 4, 14, 22

thanks
-- PMM

Peter Maydell (23):
  target/arm: Fix return value from LDSMIN/LDSMAX 8/16 bit atomics
  target/arm: Return correct result for LDG when ATA=0
  target/arm: Pass memop to gen_mte_check1_mmuidx() in reg_imm9 decode
  target/arm: Consistently use finalize_memop_asimd() for ASIMD
    loads/stores
  target/arm: Convert hint instruction space to decodetree
  target/arm: Convert barrier insns to decodetree
  target/arm: Convert CFINV, XAFLAG and AXFLAG to decodetree
  target/arm: Convert MSR (immediate) to decodetree
  target/arm: Convert MSR (reg), MRS, SYS, SYSL to decodetree
  target/arm: Convert exception generation instructions to decodetree
  target/arm: Convert load/store exclusive and ordered to decodetree
  target/arm: Convert LDXP, STXP, CASP, CAS to decodetree
  target/arm: Convert load reg (literal) group to decodetree
  target/arm: Convert load/store-pair to decodetree
  target/arm: Convert ld/st reg+imm9 insns to decodetree
  target/arm: Convert LDR/STR with 12-bit immediate to decodetree
  target/arm: Convert LDR/STR reg+reg to decodetree
  target/arm: Convert atomic memory ops to decodetree
  target/arm: Convert load (pointer auth) insns to decodetree
  target/arm: Convert LDAPR/STLR (imm) to decodetree
  target/arm: Convert load/store (multiple structures) to decodetree
  target/arm: Convert load/store single structure to decodetree
  target/arm: Convert load/store tags insns to decodetree

 target/arm/tcg/a64.decode      |  403 ++++
 target/arm/tcg/translate-a64.c | 3322 ++++++++++++++------------------
 2 files changed, 1883 insertions(+), 1842 deletions(-)

-- 
2.34.1

