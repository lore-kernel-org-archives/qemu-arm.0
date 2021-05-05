Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp4184186lfg;
        Tue, 4 May 2021 20:05:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzUqEIyPmqYHeqhkHOCOxB22YKzi2Pttx9YQA2yxl6nOrJuE9ZZfqEINYxX3Q/EFNnhR8qf
X-Received: by 2002:a02:6d6c:: with SMTP id e44mr5539023jaf.81.1620183953320;
        Tue, 04 May 2021 20:05:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620183953; cv=none;
        d=google.com; s=arc-20160816;
        b=uV0Z/HbjtwUdowm5jcweb2tVyzonOeFf5Be3lg8XSO9zS3JX8YAd5292YGbDLxhvu4
         PSQPmO+3j0WuK0+BDmcINb+x8zxprlRI7uoQ1hc1k/eAJ6BsqPEx2GlQLtfOZSMZWgOk
         xJ+oCdLL2QAwExqbzUxkB0D52C+NM8jC5aDR4BAqBN3rQ/VLaNufTldF15hiK9Gatkic
         IGRfuGkMaNby3Jm1aTUwU9J2vjsmUF1uWwtkTqKPC3fCbojx6oJIwLhCXTH+ywH88xgh
         SbiSinZF7e2gdAuLU2wrtmEqvIDIxWJairjs/EuisO4xmAigen+1D843Pdw7YXUe6Mw8
         pPKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=RmST3+WxP/thv66gQjHNnadA4mfLkZ9vI+xyDvn5FVg=;
        b=h0pb3KZyAWuhCLK2H1J4HPzUJRoV8YqJrACRjq/2D5B1LxhYXQbCEQQw/wM7gx6PBM
         SQUAir55pBYWaSYxo79lkULCwWtoZgBoqyNUu9f6uHwtsLCZNsC5gBnRq5lZGctj3DvE
         W8Uu49d0XJQNfZ1/djKoaAw3/dj3ElWyoozlTzciyj6mKk2URluTdzIL8tPO7j+nlI2f
         LfRWRs3KqnLK0DL3JaF26Z0Km8c1gSp3e/24vJjQTcReSmOarql8/J7JEPRwDWBKdfHc
         D+dpNgbps8WOZkH9JA0mPnTu/6QaAJVwQ7ZSDQ7Hned/qpEK9/yc7AOVsst2sQArBuNV
         Yr7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=sYRW4pUk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m21si4908968ioy.78.2021.05.04.20.05.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 May 2021 20:05:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=sYRW4pUk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1le7rE-0008Bp-JG
	for alex.bennee@linaro.org; Tue, 04 May 2021 23:05:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1le7qV-0008BQ-Hp
 for qemu-arm@nongnu.org; Tue, 04 May 2021 23:05:07 -0400
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730]:45984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1le7qT-00030s-GY
 for qemu-arm@nongnu.org; Tue, 04 May 2021 23:05:07 -0400
Received: by mail-qk1-x730.google.com with SMTP id 197so279807qkl.12
 for <qemu-arm@nongnu.org>; Tue, 04 May 2021 20:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RmST3+WxP/thv66gQjHNnadA4mfLkZ9vI+xyDvn5FVg=;
 b=sYRW4pUk6Gz/vwwMBOo5rrnHDD2fOH59E/TkUWtcbqMtKA1aVK9aX3WgrYT3eGda4W
 fh1oNAQqqpmtc2GqOGF9bdQjv9hzvK8BmAfKIRsNKbE2dBWg2DvvLXx1DxnfF81KGZZ5
 x0w7Pnvhz1I89BmIBEDlKO3mYbdbMaa3LK260xqA5iU2Zn8HnVDqF/75berVg0HkRmjL
 brhuxks/j98da6fD7fg8k6Jnji3mNsANKu19qmLtTHLfemyQJWfAffzrecFQF6ENvAAi
 wHiLNjaxBNtPuFxpKNMNLg+MaGBc6T2Cz+fkPCyxnMsEwLln9+IXFtjruesxmEZZYAE8
 PEKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RmST3+WxP/thv66gQjHNnadA4mfLkZ9vI+xyDvn5FVg=;
 b=DibwnVKbrAUc7zWVa6NQqHzUYNDvWuhLAQD3+IQpYyTLu5zvIhy+ypsY2xmDBE91a4
 9mRQqkBgL/ZSjMHIwbBdUGZamGElHnQG0YHfUW3iWUu2Dy2uR0ePHE0Ja7i4eYw0cb/c
 KDibYA5dxHWlqBK29DlKJQ35odZN1c0YZhqZfWu9n8EiHinC1i7P0NuQeO+8hUW/PRrh
 k/O12IfKaNwm28FMp//IPp7omlVa68SuKcLABAoGTGy+2xTm6v1yGk6F2/vunubRwnLn
 Aw/6CiemEtSg4v3q8HcZO9L9v6S6op2XRp01puOHJsAnFo0y6X6I8FQPvWsO3GccmctC
 khrQ==
X-Gm-Message-State: AOAM533/LbSn0Job3Cw/osTh3poKww8FVsTEyfTi4WdLSqLdZoZSGJsG
 09DyJTAVP+b9MPnuWzWNqU5P7g==
X-Received: by 2002:a37:a301:: with SMTP id m1mr21727377qke.491.1620183903395; 
 Tue, 04 May 2021 20:05:03 -0700 (PDT)
Received: from cube.int.bluestop.org (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id a63sm12270550qkf.132.2021.05.04.20.05.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 20:05:02 -0700 (PDT)
From: Rebecca Cran <rebecca@nuviainc.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v8 0/4] aarch64: add support for FEAT_TLBIRANGE and FEAT_TLBIOS
Date: Tue,  4 May 2021 21:04:39 -0600
Message-Id: <20210505030443.25310-1-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=rebecca@nuviainc.com; helo=mail-qk1-x730.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Rebecca Cran <rebecca@nuviainc.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iel97T/OuxdC

Improved readability and fixed a bug in
tlb_flush_page_range_bits_by_mmuidx_async_0.

Rebecca Cran (4):
  accel/tcg: Add TLB invalidation support for ranges of addresses
  target/arm: Add support for FEAT_TLBIRANGE
  target/arm: Add support for FEAT_TLBIOS
  target/arm: set ID_AA64ISAR0.TLB to 2 for max AARCH64 CPU type

 accel/tcg/cputlb.c      | 128 ++++++-
 include/exec/exec-all.h |  46 +++
 target/arm/cpu.h        |  10 +
 target/arm/cpu64.c      |   1 +
 target/arm/helper.c     | 371 ++++++++++++++++++++
 5 files changed, 553 insertions(+), 3 deletions(-)

-- 
2.26.2

