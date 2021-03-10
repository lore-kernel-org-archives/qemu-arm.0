Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp42604lfg;
        Tue, 9 Mar 2021 16:29:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyZx0Rm/u8wvGX78/KPpberrdkHFZCo/xUGuXzHgBtF+TuZR0kMMEhYoZO5uMz6TwH7zuLO
X-Received: by 2002:a37:9e88:: with SMTP id h130mr306461qke.301.1615336195736;
        Tue, 09 Mar 2021 16:29:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615336195; cv=none;
        d=google.com; s=arc-20160816;
        b=xHiu9daAN+d7yXMbWUqx64xqmMvFJeOXat+bl5ECjVxH7D1fxqer2pM3qGGhy1nSLz
         2wqRa7JJD9nSwIOudS86/dgz/Aj1LAEtsgsARUynduG6X8yP4l+ZGsYpTdTg0QYaoQHf
         xnMJGIftl0YP09K/ycfQc4QDtYUMrA8JaeDaVDQymYO2w8yPxn6gr6dXUMHwEoegljua
         azUnlWaXw2HGaaAEHZbZqkWnmaVaSJ2BYS2YyMMg/Gf+eSdlf2AZKe/NKD0U0bHbeXvu
         WV2AjQLDERfoCfpsPuG9ya9BpN3DYktvj9UHuM0cqZBkwshZKCfTWBRJlhEOSKFBEwqO
         HD6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=My+j4KnGaAroxQolaO5aq5DcwlmNegq105KVJ4aBaAE=;
        b=ZP3CmLVSFUrecqFz+ypEyCzDUbCC95SQBLJXSeXddyU1QEkDMR44EMRvJkJ0wDxKZs
         Ta5NIqaRyLrnJ+x1+/GxN7mtPjBVMv05CzdFQraXoFEyHST2vU4oscB5pa/cDeHaoTa8
         oa2wXwFTG/wBpGyDhlwEzqy/KTSd1q882GanWHHRd6i+bWbWXpgzCa4iSLOpBOvDOonJ
         tyZJvRydgie/qh6XbruYfQxQ5VAm3kzU8Hwft+L4qsX66pymrdpOl51Qgzg6/GD09BiQ
         XbqfKQPjCv/OqHt0sCTQEmGgFfyAzrfiS9/H/btTWLo+zd58fEbo/BnL1QyU3RAH+AG6
         it8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=EBOKfENt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u67si5776415qkb.335.2021.03.09.16.29.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Mar 2021 16:29:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=EBOKfENt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lJmja-0000W0-Vo
	for alex.bennee@linaro.org; Tue, 09 Mar 2021 19:29:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lJmj9-0000Us-Oz
 for qemu-arm@nongnu.org; Tue, 09 Mar 2021 19:29:29 -0500
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d]:34997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lJmj5-0001HH-HC
 for qemu-arm@nongnu.org; Tue, 09 Mar 2021 19:29:26 -0500
Received: by mail-io1-xd2d.google.com with SMTP id g27so16041462iox.2
 for <qemu-arm@nongnu.org>; Tue, 09 Mar 2021 16:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=My+j4KnGaAroxQolaO5aq5DcwlmNegq105KVJ4aBaAE=;
 b=EBOKfENt3VrRvUhgmzAG823E9iGGLJwcC1oWRwmMntrR9p7o/m3PrRBFvfhWOlhIo2
 pO6AGA88uw6Vbo6zh3GSxIX9ggZI8AdeJBeZLLlKAQvhee7MXJ2KAdH1fZtpG35rX0jA
 LecuRIIrMGpcnXdWdIu+evYHalFh01zfMWZ/K7hN7+BQ1nVwDF0M9+7aDPlxAOFQSGaL
 ZwnWJbmA2LO9AyxgwIeHr4sBkUk+K6Le6jg6R8N+nMBLB96C3H/Xczo/wggZRT4wX/SR
 i3zK8byhKrbzmOyFQTma7Z8vrx76pa7SOFnKTZT7ThORC35KKginiFdwUlV/vYhbJpPe
 xyCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=My+j4KnGaAroxQolaO5aq5DcwlmNegq105KVJ4aBaAE=;
 b=EggXgQvvIdBBQSu0dWiSeTXJHpJWfZXY2NOIqOccmk0zxNPMmlwNcM9a2CMYcvjNZC
 qdR2FLsaAV63ADi2ZhPAlr6m/bTWbuQs810Fc7NahTPXRwZ4LUzaEr1f0Sv1shZz1hdE
 kpEVHlx90KVlqugtPTHugVBBWrBkNazU//5I8M1WimSDnZnNwlax6VT2e7j7QGcRKyme
 RadkMYKoon1obF8ZB2UIPgjyreWgJIxUA3gLadgp1KxHeV134CJFbxdfFOsg5j9qdobG
 xH3iBGC+y41y6W2erbFLp6KxzNLD4vC7YAqj4zW37DiJn6lRunzC+jliqv+df2dcQLsW
 uZBw==
X-Gm-Message-State: AOAM533JnCrV3Cu47a4uy5/4QhZcMkoEYSoIfX2K9sbu1m4/TyUNzHsM
 TvNzir1CVC5/7UXynjJzHDEiwg==
X-Received: by 2002:a05:6638:1914:: with SMTP id
 p20mr728812jal.92.1615336162248; 
 Tue, 09 Mar 2021 16:29:22 -0800 (PST)
Received: from cube.int.bluestop.org (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id h23sm8048808ila.15.2021.03.09.16.29.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 16:29:21 -0800 (PST)
From: Rebecca Cran <rebecca@nuviainc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
Subject: [PATCH v3 0/3] target/arm: Add support for FEAT_TLBIOS and
 FEAT_TLBIRANGE
Date: Tue,  9 Mar 2021 17:29:14 -0700
Message-Id: <20210310002917.8876-1-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=rebecca@nuviainc.com; helo=mail-io1-xd2d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Rebecca Cran <rebecca@nuviainc.com>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UJDgQioAMXI0

ARMv8.4 adds the mandatory FEAT_TLBIOS and FEAT_TLBIRANGE. 
They provides TLBI maintenance instructions that extend to the Outer
Shareable domain and that apply to a range of input addresses.
    
Changes from v2 to v3:

o Change the functions in cputlb.c to do a full flush. This should
  only be a short-term implementation.

Testing:
  o Ran scripts/checkpatch.pl: functions in exec-all.h fail,
    but I think that's acceptable?
  o Built all targets
  o Ran test code that executed the new instructions
  o Ran "make test"

Rebecca Cran (3):
  target/arm: Add support for FEAT_TLBIRANGE
  target/arm: Add support for FEAT_TLBIOS
  target/arm: set ID_AA64ISAR0.TLB to 2 for max AARCH64 CPU type

 accel/tcg/cputlb.c      |  22 ++
 include/exec/exec-all.h |  41 +++
 target/arm/cpu.h        |  11 +
 target/arm/cpu64.c      |   1 +
 target/arm/helper.c     | 323 ++++++++++++++++++++
 5 files changed, 398 insertions(+)

-- 
2.26.2

