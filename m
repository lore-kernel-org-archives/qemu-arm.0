Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp635807lfc;
        Tue, 9 Jun 2020 09:07:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2Y8xYAZVkHH9QYNV/lgGQBFjvd0ihG7d7sG7/L4PiLaBHLopa6P4pzDoC+GdtLbY1nTpT
X-Received: by 2002:a25:230a:: with SMTP id j10mr7745669ybj.260.1591718855699;
        Tue, 09 Jun 2020 09:07:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591718855; cv=none;
        d=google.com; s=arc-20160816;
        b=Kfl/MHURAxId4yWIaCnOCFt7o8EJNkuSpfU1CCxKqnUNXVbzQ40+K4slWHMkPj5vcp
         wh3tKIyW4iuyItZ4TFuwMWMLtzIzs0eVg7VAlul/QHpVapDaxdP86cD14AkdVOKEwQ8v
         C+r7GjGoVb0BuI9w7hE74zuPSgFEtNyGaUwjZE/YC4tfhEGKCppCSJK2Ea3atqZlCyZT
         R2R5VQRwaczU3/+wZ4qdW9ZGAlzV0YMeZa9aBfExvdhXxgW2NGOcBN/bqxN7XV0AQkPr
         5NcJPUkJWLz8Q8xHl8763/GGfeMlKnzuypF0mY+ZwtpVGEK3+MMhV3gfZdk+3q8LtO/O
         2B2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=GT0l/xH7MMPijYPNg6WDVjyofLJ6ne/HsZdFq3V60Is=;
        b=MH3CB/lcr+FvO0VVidnbyKwIg9pLtOY/8iJaG2WJyHmzyrDRJOqfOQ+2XS8g+OAdiD
         ixBaiTK9rQtNJOzsDuvLE9MzoPUxwbZstER+iDUdLA88NX0H/TMmygP8VPlbHdTI0O4V
         dPRZ02hyeWZBGWjk2rqU7Hi39Do2RxtxcARqZdcHJrDAEVdI8UIHa69WqhY8yj1xS+gZ
         YVsXtOcuhgcIs9rIG9efYunOz1C01x2Ay6wyrasQy/LZKw9is7l3gHQquvMwkRNMWKV+
         gdQI0DGpkwJ+Zx/MhQ9IOeWvvSfVNeo1upwiHZ0Gz60n8zxTCPIk4Rll9S9BUUB4E1l5
         pSJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Whs8pyQJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 139si2807260ybn.306.2020.06.09.09.07.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jun 2020 09:07:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Whs8pyQJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jigml-0000fa-08
	for alex.bennee@linaro.org; Tue, 09 Jun 2020 12:07:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jighe-0003JS-EZ
 for qemu-devel@nongnu.org; Tue, 09 Jun 2020 12:02:19 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:55026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jighb-0003Py-TB
 for qemu-devel@nongnu.org; Tue, 09 Jun 2020 12:02:17 -0400
Received: by mail-wm1-x342.google.com with SMTP id g10so3342462wmh.4
 for <qemu-devel@nongnu.org>; Tue, 09 Jun 2020 09:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GT0l/xH7MMPijYPNg6WDVjyofLJ6ne/HsZdFq3V60Is=;
 b=Whs8pyQJEk+TiXojNYMlArz/xqhsNKjN8YifS/rJ4W8CzEPHQXFNVTF9aUU5bxvhI3
 +eQrobd2SaxRTGb+FAHvxCgF53STgJsa3dxaGifWRmLKeYn+vEfy9D1q3dCg0EcQVntd
 8M4FCoF9Q/3o5dBryblscFrcrzGUhCsMulIafuy63O0lr7jVsDmqarB+qv/bbM+nOB38
 Uwxb8WSig3ZDK8bTaXkz+M85uKKyjD8t9gMQJBB0Ti8X6TYlgXP7JHDJkHQ1FEbkUyCe
 wvpRGSzSuo0ChxUNYvARVy0P6dlKvuSPYVUErBAQReVorhipFtE1p/TPOUR8ao+yJClQ
 5eIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GT0l/xH7MMPijYPNg6WDVjyofLJ6ne/HsZdFq3V60Is=;
 b=WBGF92MP+v7BdScx0JotAUxmBzO+UXaAh+xGTgbNtgX7ROBCdzoj2bMliA7UMyxPgM
 Q1/JUWziLh1MaSbFYCND7UposeYIPPRUkXZRYEwW4p5gCM9UvWrZIlRnIFjsFLuUbXpP
 bQfuLPINQsZzxpbjQnYec319ZOC6KxbfBpJfxCZ2jUvGx/eCxIwd0fNtDfY/P2MrE3UZ
 /2IwM9pAIJVHlBpTubouHDc+VMT4smWvYaJZYFqnPPGDSoRn7aQVWkMFZlNG/B+NQ8OU
 x7NXGusSOOjQO+0i16Qvis+EiYZ0rxQDsIZzV8md3eLK4Rx51+9cG8HEFhkTWgI2kbk7
 ACAw==
X-Gm-Message-State: AOAM531liM98GZUp8H1Y3HUVmjWPNSCldf80GKwiXjS1saPt4Tk1kRn+
 XXjGpNvusM9q1rQuS7l7CX4IxzcbsEhTSQ==
X-Received: by 2002:a7b:c343:: with SMTP id l3mr4779608wmj.178.1591718532619; 
 Tue, 09 Jun 2020 09:02:12 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b81sm3699867wmc.5.2020.06.09.09.02.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 09:02:11 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/7] target/arm: Convert Neon 3-reg-diff to decodetree
Date: Tue,  9 Jun 2020 17:02:02 +0100
Message-Id: <20200609160209.29960-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lgqKHJCFO/rX

This patchset converts the Neon insns in the "3 registers of different
lengths" group to decodetree. Patch 1 is a bugfix for an earlier
part of the conversion that's now in master.

I'm definitely finding that the new decodetree version of Neon
is often easier to understand because we no longer try to
accommodate multiple different kinds of widening/narrowing/etc
insns in a single multi-pass loop: expanding out the loop and
specializing it to the particular insn type helps a lot.
(Or maybe it's just that having to read the old code and write
the new version means I understand it better ;-))

Based-on: id:20200608183652.661386-1-richard.henderson@linaro.org
("[PATCH v3 0/9] decodetree: Add non-overlapping groups")
because we use the new group syntax to set up the structure
for the "size==0b11" vs "size!=0b11" decode which we'll fill
in in subsequent patchsets.

thanks
-- PMM

Peter Maydell (7):
  target/arm: Fix missing temp frees in do_vshll_2sh
  target/arm: Convert Neon 3-reg-diff prewidening ops to decodetree
  target/arm: Convert Neon 3-reg-diff narrowing ops to decodetree
  target/arm: Convert Neon 3-reg-diff VABAL, VABDL to decodetree
  target/arm: Convert Neon 3-reg-diff long multiplies
  target/arm: Convert Neon 3-reg-diff saturating doubling multiplies
  target/arm: Convert Neon 3-reg-diff polynomial VMULL

 target/arm/translate.h          |   1 +
 target/arm/neon-dp.decode       |  72 +++++
 target/arm/translate-neon.inc.c | 521 ++++++++++++++++++++++++++++++++
 target/arm/translate.c          | 222 +-------------
 4 files changed, 597 insertions(+), 219 deletions(-)

-- 
2.20.1

