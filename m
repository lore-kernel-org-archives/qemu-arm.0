Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp42647lfg;
        Tue, 9 Mar 2021 16:29:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzB0B62+Qw/vpBHAr05cBS0ofJKRR8fnBVfzfKfG7mAw/3flk83Jxas9f1czq9unOsE27vk
X-Received: by 2002:aed:2c61:: with SMTP id f88mr579524qtd.337.1615336198380;
        Tue, 09 Mar 2021 16:29:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615336198; cv=none;
        d=google.com; s=arc-20160816;
        b=YrxJM5Wwm6rds7moJgZ3C49nuVRdGjvSnGRo36Zb01irlU+YWqC5Uyi4yNOKVmpQIp
         +fVoGflqDkRmF6zns9NeywsXqTIpbu6NKzaAUflR9nx9o/BJ3TbfMmSEkUYiR08vXN6+
         MHzSF2z2scrqWdV9NQ0O9o8v4Gae065RnR1LK/iXyY9qoIkCPgG6dBERwyhEhWTimBw/
         G1I+xpHajI4LsX/9rPoyFYWs4/R/nk1GWK9ZhXHr4lDgz5P3Zye79mhGgVlkdkYy3W86
         j3zL1z58PqmoTHOVNk/dSi8AWvpt2+eO93/8VDHhe3FbPSaGAmvCfqCB8iRVX0KlFDBo
         8d5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=MtrYd2+kxak4VR0FTDOw2marOmVpM5v4db/Bahi46Lk=;
        b=zqO3kJfwzXXF4guaxXox2AI2sD/hn7WswOBaoFrVtTgOOsB1xRisKEtxyxNepom865
         WKUBQflJmeKe+GTL+vGc3EgPw14uvXKH0i5sA3X6oIT41MyTtxPNNhUGWBLNg5RyIHGl
         xzjeEtDZ5rWI09oXzAs37Y/gOL0ApuRMlC7D90KmZceEIiTMsmLquHHbhjTe1QaE0s4X
         O1X1JRdV1eY0BJ5d9G6/bYgT5vSGqqUPODV+66IXoFHHrlc9XiS2yMeDW6ExJDn7V2p3
         Z834/GZoXyTRaIiibRApnm+sg0JVJk9VcsHs3o3MbAavcwuo4OmuZ2xoqNDS8xg2BIOM
         mSyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=TxsM5xMY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x13si8881617qkl.217.2021.03.09.16.29.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Mar 2021 16:29:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=TxsM5xMY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lJmjd-0000cC-Jq
	for alex.bennee@linaro.org; Tue, 09 Mar 2021 19:29:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lJmjH-0000Vv-0F
 for qemu-arm@nongnu.org; Tue, 09 Mar 2021 19:29:35 -0500
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133]:41793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lJmj9-0001Ir-Hq
 for qemu-arm@nongnu.org; Tue, 09 Mar 2021 19:29:34 -0500
Received: by mail-il1-x133.google.com with SMTP id c10so13903600ilo.8
 for <qemu-arm@nongnu.org>; Tue, 09 Mar 2021 16:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MtrYd2+kxak4VR0FTDOw2marOmVpM5v4db/Bahi46Lk=;
 b=TxsM5xMYm4zV/19duA2bA2Ow9hoMsbDBuZdcnbhlAd3cs0X7IwXTlnNW34Rw9aXafs
 omeeNRN40pV+wNVfdJO7aSbjjBrdS+jnCtBQCaaBYyAA7PTXtwsh+cIqSL8WCnMJ2eki
 3xzsYbBLUb5kPaj9ntyyr6mIc/2L++mrkHkXfYt3s1sQai8JuIKcvP5RlYeWO0SIH/gy
 lDdEJWd+6izdTjIuGxWNG61FyoMQA+baXph9s+Yii/PLfjGaimYH1R7hbt+YTmpWFJmA
 jg65ifQcf4Hhw33gWLIogvSlj61Ruj8gv8EuBJc7I9MhgQw1Dhn3iCdXQvYT4PqB6Ca2
 yC5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MtrYd2+kxak4VR0FTDOw2marOmVpM5v4db/Bahi46Lk=;
 b=EKQyYR7W5jxPpAg8BNuCWVwsnld5FLg1zRg+C35EiOLisOhbWRCPhqVOCBU678Qfg/
 pd3pBQ33N5snMHDZTnX1qUVYlSiUSB8KTa4LU3572nwL55LtOosguRY469D6iQH/NolH
 +6CFZCG7pTduItkT4WOxEtLyqHyDRwRnN/HD2Hksw/zlzRmG+53eTFjD95gmNCsQ9vjK
 Gnwx+RvMwWEOkV5KNZvIaNYYkAm/4hk5Q5ii6if86ncaAnsCYL/phw5/TfMxyvvyaKaN
 ohjyKXATh8n22CFy1j2wM16uqsnEnhcPHJmQTSbQofutdexh0cGDuEa2/ft45nB028D/
 kv0g==
X-Gm-Message-State: AOAM530vSXmYh/12vBfRwRvOGEFUjC5Y8cAarlH/DsCt/yGzSVFacNuu
 j4iCEiPuNfC+J9wWYfoebSfP9w==
X-Received: by 2002:a05:6e02:12e3:: with SMTP id
 l3mr714513iln.24.1615336165181; 
 Tue, 09 Mar 2021 16:29:25 -0800 (PST)
Received: from cube.int.bluestop.org (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id h23sm8048808ila.15.2021.03.09.16.29.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 16:29:24 -0800 (PST)
From: Rebecca Cran <rebecca@nuviainc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
Subject: [PATCH v3 3/3] target/arm: set ID_AA64ISAR0.TLB to 2 for max AARCH64
 CPU type
Date: Tue,  9 Mar 2021 17:29:17 -0700
Message-Id: <20210310002917.8876-4-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210310002917.8876-1-rebecca@nuviainc.com>
References: <20210310002917.8876-1-rebecca@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::133;
 envelope-from=rebecca@nuviainc.com; helo=mail-il1-x133.google.com
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
X-TUID: LVkaUomyj8O3

Indicate support for FEAT_TLBIOS and FEAT_TLBIRANGE by setting
ID_AA64ISAR0.TLB to 2 for the max AARCH64 CPU type.

Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
---
 target/arm/cpu64.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index f0a9e968c9c1..e34a6a6174fe 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -651,6 +651,7 @@ static void aarch64_max_initfn(Object *obj)
         t = FIELD_DP64(t, ID_AA64ISAR0, DP, 1);
         t = FIELD_DP64(t, ID_AA64ISAR0, FHM, 1);
         t = FIELD_DP64(t, ID_AA64ISAR0, TS, 2); /* v8.5-CondM */
+        t = FIELD_DP64(t, ID_AA64ISAR0, TLB, 2);
         t = FIELD_DP64(t, ID_AA64ISAR0, RNDR, 1);
         cpu->isar.id_aa64isar0 = t;
 
-- 
2.26.2

