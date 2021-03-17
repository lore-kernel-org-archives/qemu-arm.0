Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp856076lfg;
        Wed, 17 Mar 2021 16:34:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyN5riOsd/OcQ1JTDd+PpCkOnNjVChCwiwgoZ1d95nUFW9ETWD5UN6H+13bwGd4XTYb0ZtO
X-Received: by 2002:ac8:5784:: with SMTP id v4mr1382094qta.168.1616024076273;
        Wed, 17 Mar 2021 16:34:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616024076; cv=none;
        d=google.com; s=arc-20160816;
        b=FihFvgY5t5KNk6hlnSKs1IXAwpfWijTXFemWIiSL32FDjJ4ZBxsv8NEJAIV5p8ureB
         6JPopqfXkL+wZAb75kufX1ha6FHhOWIAuHPXrTmYHc/x9tkwcjnqWKuEqd1mO435CDXr
         XsQO+HmJQ8tC0bFRSvDih2BAlLCcG08w0O7v2dgbgy7hJMtH69ZQInWkhs+Zpsn0d3xM
         FyMI2JbvSNrPO9nnXWQfDdlPhuqi1FGE7ZYanchkIl3oxUgFDymTbStAiWYaWGG/zEXi
         qShGR5GgAHIOcbEfsrUmXtUxLOTXgFnIVMsVRj1hB0Pi00tl1NzphfBZVsr81XP66QJ+
         0Syg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=uNizM5dd+njefSGglfwPGotA4yVew4h3gSREpFzckEs=;
        b=OmPdYd8OxN8uAWatRVEvtbBp+UpQ1yN5XFkto7JlEf6cUiTDAuGQfEfAYcfkeGJK62
         HzljpjB/Sp1AnWcmIXKrgKE7A8KvAUY/qtvAYRHZOQOXGP8rLuwl1rXiyi7FUONJHTRC
         mVCLtyt8Eo/ySTKSt7naxjK31ZLlmrFIaUMMZjnpYcyzmOH5/2vquV4Yun8huxdxMHei
         7opMIA1h+ZZrDd1c9HM+6MFxxNt9L6WtcTFEIrdUxoaG1t+2iK3V4Fh0Ys1ZXmGYP1az
         UR3hSHXOlMuDmS50FGOyUDWt3xgDIfxwrkpQh53wclSvR2eYY0tlxz1O9/gyOVij7Ek0
         xa0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=DShY2OX7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jm11si356689qvb.161.2021.03.17.16.34.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Mar 2021 16:34:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=DShY2OX7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lMfgR-0005MS-Hs
	for alex.bennee@linaro.org; Wed, 17 Mar 2021 19:34:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lMff7-0004Lq-UI
 for qemu-arm@nongnu.org; Wed, 17 Mar 2021 19:33:13 -0400
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:35602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lMff5-0001uG-UM
 for qemu-arm@nongnu.org; Wed, 17 Mar 2021 19:33:13 -0400
Received: by mail-io1-xd2b.google.com with SMTP id v3so374865ioq.2
 for <qemu-arm@nongnu.org>; Wed, 17 Mar 2021 16:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uNizM5dd+njefSGglfwPGotA4yVew4h3gSREpFzckEs=;
 b=DShY2OX7+CmpIs9ptXGSZ7ZKm5RRIVQQgd7ECvdiluNjj2N30+joFUYTgnkT04Xh6X
 JFCOwfQ3YeuRwnoehRDVCuVVja9Udjb8l9y2YWNBoUCo3rjT+mxUxlz0W6UAB9PWOBqd
 hHwqPAx8hnzhe7Zsvo4AErKkkucqRmZDKglkZa0gnYCqK6rDqz37C6UwLxO0P9ZUmNHy
 TtUP4NasdndFbuFJR7tX1qX0ynAlSKh0135uiYDPVsPTYgRAkK/SaM3A4QloCwhGS4T8
 Mqxm4Hh3j0UbAvM3nFNOMNmIpN+ufuqxjYy3gCCrzBRRp/E54yP9lVZfZ83Ucbs+to2R
 p/jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uNizM5dd+njefSGglfwPGotA4yVew4h3gSREpFzckEs=;
 b=pu5J4aRh0fYB3vE0mQrdELwPifiQ7YcmD7uMW3bwbCA/EhOI6Z4QwDBjIfbhTUySBZ
 4xWmOun0bijCl2mKqD/o0LuT3P3kG/jdKZnDaozB7MoiJI43sZjK2J3ibgMzp+6j0PC3
 5dbYSbYbrOBziWHkgbFYl1f8jN3QWQR9UKtLTsW65evGSnxkcPfcxnZVmhrapMJGtg8H
 bHaUauIOIsUQHRraCnqrY4DuAMnJY8hqZf1FKX2cikbaDdlcp5V7wd4P6tbd9K0p1maE
 0hm9j7Y63W5YA01duymuw1fwP074LE5H8fQRWcuDw7PEhyty4f9A12jZkCJYuxSUL62F
 VfKA==
X-Gm-Message-State: AOAM532R9KzyIyfGcOTBJoeTlVGfTHqLlHRZzq2J7ORpDzADuMkhAmUp
 GZRgreWJIMtPqXmyuBKJF1wjjw==
X-Received: by 2002:a02:c017:: with SMTP id y23mr4836204jai.3.1616023990989;
 Wed, 17 Mar 2021 16:33:10 -0700 (PDT)
Received: from cube.int.bluestop.org (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id k12sm235183ios.2.2021.03.17.16.33.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 16:33:10 -0700 (PDT)
From: Rebecca Cran <rebecca@nuviainc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
Subject: [PATCH v5 4/4] target/arm: set ID_AA64ISAR0.TLB to 2 for max AARCH64
 CPU type
Date: Wed, 17 Mar 2021 17:33:01 -0600
Message-Id: <20210317233301.4130-5-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210317233301.4130-1-rebecca@nuviainc.com>
References: <20210317233301.4130-1-rebecca@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=rebecca@nuviainc.com; helo=mail-io1-xd2b.google.com
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
Cc: Rebecca Cran <rebecca@nuviainc.com>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8TV88Z4Fjs+L

Indicate support for FEAT_TLBIOS and FEAT_TLBIRANGE by setting
ID_AA64ISAR0.TLB to 2 for the max AARCH64 CPU type.

Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu64.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index f0a9e968c9c1..f42803ecaf1d 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -651,6 +651,7 @@ static void aarch64_max_initfn(Object *obj)
         t = FIELD_DP64(t, ID_AA64ISAR0, DP, 1);
         t = FIELD_DP64(t, ID_AA64ISAR0, FHM, 1);
         t = FIELD_DP64(t, ID_AA64ISAR0, TS, 2); /* v8.5-CondM */
+        t = FIELD_DP64(t, ID_AA64ISAR0, TLB, 2); /* FEAT_TLBIRANGE */
         t = FIELD_DP64(t, ID_AA64ISAR0, RNDR, 1);
         cpu->isar.id_aa64isar0 = t;
 
-- 
2.26.2

