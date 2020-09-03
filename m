Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp848305lfc;
        Thu, 3 Sep 2020 13:21:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzYRZcJM9lSPA4HY7vmsjdNqBCTxiNJSaj3i6DNk3urB9dt8155ChDpcfHjFKd6OXlZGAbR
X-Received: by 2002:a25:f807:: with SMTP id u7mr5422431ybd.291.1599164484356;
        Thu, 03 Sep 2020 13:21:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599164484; cv=none;
        d=google.com; s=arc-20160816;
        b=dKSb1gyDqaOCWIRXsQi+TrhyLbaZX4T85nYGO5lxHZ0UDDNjRK3HJZqEDCWg0TOJD9
         Ae77oPk2NXSIx+K1pIJstYTeeo/ovdrb68buwJuEYyjOTcl5L9e2a0jJc1E8ABOj6NeM
         ULKTEn18vOjdzqujuAvuM1absLWmuwsxtfpdr/C6sHrc6osA2ydxkjYWg0mbIHgvGsaU
         mUvs03WDW7biagzDLWsnD+MPmb8i48/vKZUfShdq2j630Ewr6PqMphZ8/p6GWS44ORCv
         W34z60bVkvyXr4FDQliTX1VNheAnwRLlTZtkfrHC/kIrxXnnCsv5fh3gzTuCKLLEulww
         1dnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=iMf7PrtIvi+uTaRRjwphBu6nmGC3imxNmq1uK0cxKrA=;
        b=KM9vknYK62V1M7pMOcpFiaIFhFfjjhVGGZUKaO88pEJAdL/ecXqlaxJ86yUX1pj7rk
         f4zxwYHPlk4KzC9E7YKxBYrA0HI5T/j1jwdYvqbdMAI2oDxRP4R11BjVhuF9fpl9Mg18
         e4qnyXIkim6zHYBnW7UJLdJbaQINuNIsBBdZZzQ2k9dZYEUinFxSqf85LYliLXyHL597
         to0XrXyRK1Zkicl4FzLRIZY+s7Crq0UCBfNbEVZcp1fsWwO3WPDedvQltLOvuoPBatxw
         Ui1m9xI5xWsu6NW/lq/lc+qTqvKVUXq6yplCZ1KGapXyf4Zg/k85Y5Am0ft2+4Xb9cTs
         XPEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="OZl/kgeh";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x36si3932342ybh.121.2020.09.03.13.21.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Sep 2020 13:21:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="OZl/kgeh";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kDvjX-0006A2-Mb
	for alex.bennee@linaro.org; Thu, 03 Sep 2020 16:21:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kDvj4-00069j-Cs
 for qemu-arm@nongnu.org; Thu, 03 Sep 2020 16:20:54 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:36091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kDvj2-00084e-Jq
 for qemu-arm@nongnu.org; Thu, 03 Sep 2020 16:20:53 -0400
Received: by mail-wm1-x341.google.com with SMTP id z9so4126251wmk.1
 for <qemu-arm@nongnu.org>; Thu, 03 Sep 2020 13:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iMf7PrtIvi+uTaRRjwphBu6nmGC3imxNmq1uK0cxKrA=;
 b=OZl/kgehL8aVAhLxdcIUVooRvRiqWFsnQWtwOxAxC/ZJcNYL0S/hXps/zWYg3jG78X
 i2KkS0a4x90Iy5XfKXZnxxonw93bwFbo0KRHINYlefWrySh1rSGCUCtlVySzj4rz+tJO
 XT7YtFpJKb5alarKSrhBCmGayReJ7InJp2NLF9/ryXOM4hD+rLOIggfQI638LfMEXQHF
 wQqmU4MsY3CXVmu6htTtzz+2mGoJNO/yWYzmGt7t4zYmduIrrzYVTSYedXmsT2kMjMeK
 zKbTDyriD2NWcGbiCtzc+plHKK1yd5ji4QbgCa8Pwsn1popIkEV7MBjKcjD8KnbbFaRM
 THZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iMf7PrtIvi+uTaRRjwphBu6nmGC3imxNmq1uK0cxKrA=;
 b=TmbKGLbv8Zz0+mzhFwC6ol27oM2DvbBnbF36YaHh7PcdUgberqcO/anwPJXsMg80Ya
 351NEG6+P7/etz+qt3GIC0VPYb3EtbbFy+sOBVX7wO9tDGmAUCy//BUDr15q4aofUb2H
 md9anxz9K0uyKWq6rGi9+5RBGfUiCYnixYnkaJAAKyUq8bZ3VwQWKUs6VHksUUwJxw5T
 JILfRkCAMFB6HmbOf9R7Dd42ARET1HlSNPrLbhzj35hWfSnClYnLkReuOGM9a3n6cgUa
 ABRGpsfLkgbP00Hrg7bYXgFnfB78QzIrJD0Ld5wQh9lmNHauosNmjB8qvLbL72Y6Hnin
 +0hA==
X-Gm-Message-State: AOAM5301a8oNHgHp3Qep4brQTeuMISkW3nhS9T29fwHCiVkxM9ftDaA8
 25d1JYXMtxJHFWUzMSke4LYTDvmy0tWsHVfU
X-Received: by 2002:a05:600c:2146:: with SMTP id
 v6mr4076180wml.159.1599164450958; 
 Thu, 03 Sep 2020 13:20:50 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id p14sm7285023wrg.96.2020.09.03.13.20.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 13:20:50 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] target/arm: New boards mps2-an386, mps2-an500
Date: Thu,  3 Sep 2020 21:20:45 +0100
Message-Id: <20200903202048.15370-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Kumar Gala <kumar.gala@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: d5CRc6tY3P2X

This series adds two new board models in the mps2 family.
The AN386 is identical to the AN385 but with a Cortex-M4.
The AN500 is a Cortex-M7 image which is almost the same as
the AN385 but has a few minor differences, most notably the
base address of the PSRAM and of the ethernet controller.

The AN500 is interesting because we don't currently have any
boards in-tree which use the Cortex-M7.

Changes since v1:
 * patch 1 now also updates the docs to mention the new board
 * new patch 2 defines the mps2-an500 board
 * new patch 3 makes some minor cleanup to the docs for these boards

Richard, Philippe: I kept your reviewed-by tags on patch 1
because the only change was the trivial docs addition and
there were no code changes.

thanks
-- PMM

Peter Maydell (3):
  hw/arm/mps2: New board model mps2-an386
  hw/arm/mps2: New board model mps2-an500
  docs/system/arm/mps2.rst: Make board list consistent

 docs/system/arm/mps2.rst | 20 +++++----
 hw/arm/mps2.c            | 97 ++++++++++++++++++++++++++++++++++------
 2 files changed, 95 insertions(+), 22 deletions(-)

-- 
2.20.1

