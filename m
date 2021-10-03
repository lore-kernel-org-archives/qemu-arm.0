Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp3029358lfp;
        Sun, 3 Oct 2021 07:42:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrj6i4olae9nt+FXoMEFNE6F+U+Q07IbEERmGwrB67TxNdJdL+5MILMedyQpzblewEMjrA
X-Received: by 2002:a05:6638:1483:: with SMTP id j3mr6885908jak.63.1633272149091;
        Sun, 03 Oct 2021 07:42:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633272149; cv=none;
        d=google.com; s=arc-20160816;
        b=b00PP+z2Kd5l+XalDUXUVocc6uFGCRw+n8woefLHO5kjkosN6k2GYjlbEELvL7Mpek
         /zGg+iYmPNHAboU+/h/w6ltwmJjVo9/EEo+jhXAwX43AivWe+X62wyzgARoCFxOeI6Uf
         AzWyu5udcIlYF5dmssfQZpnibuZbQjKqVaw85QHV9dTJdJ4R6inRIrvzwRvjSr8UQlAg
         3gQs7ueNMqZTzyiQuPVO1EoX+kcaaN+raoqiroRvy/mrC0YWYU7MwdlcS3r9QY96py4W
         9vcqLm899KLnfvLdP8JLPIog87MnvBVOhzujPhGcZ0pt3JWaNs6Q3XCUVSqdr76BIak5
         pIjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=CgMSqlqoKfmo1kPEeBZX2VovojnyBKTXCWVLnPfMjQA=;
        b=z74OR64SugCf7oscZ9w55GR6Vza/u/Cx0TvHm4JVBmyvU/q5xBoJVD5ajFIhTigp0H
         UTf1No68rIRSijz0TsjEbnMIdNOLKbG+mh4J7Kpu2THOLG7OLB6+HncaWohwVuR+M8Nu
         woxnvAg2tgPWSPNADJrH6lWJactomELh/3/7b6qTNogFbjOALs1ImSs853b4Owbi0HKo
         JT/XO5pRZGVbdqhgCtTrD1aY4GZaSviNoIojBAsWXvJIkNmqhVex+z/rFwSmuTDQrNUF
         mKNofzj2ZXs/Z1Qyy2bvec+Q7ZT18TfFa+LoSC+sXpn9lARy82KwCs0ew+evFYy8we34
         u4Qw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b="nKRpzAO/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b21si14183926iob.51.2021.10.03.07.42.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Oct 2021 07:42:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b="nKRpzAO/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mX2hA-0007uP-E6
	for alex.bennee@linaro.org; Sun, 03 Oct 2021 10:42:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mX2dv-0003vX-8X; Sun, 03 Oct 2021 10:39:07 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:44770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mX2dt-0006aV-DO; Sun, 03 Oct 2021 10:39:06 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 m14-20020a05600c3b0e00b0030d4dffd04fso5441708wms.3; 
 Sun, 03 Oct 2021 07:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CgMSqlqoKfmo1kPEeBZX2VovojnyBKTXCWVLnPfMjQA=;
 b=nKRpzAO/C9TVARfuojyUTTxM1bfpsHVms7dqYpBgaxAmZaCJ3Awmn7CrgeYHNbORpU
 14fbBoPC4/gtYkoFEgJLcaU6ZWc0ljbz3MtWujvVAovTIOAuxpd0k9Sx5udoqDKLxC33
 KmkgOi7o7BpDKsLQ/hLA4KTJCjWLkzZ1s68XQz11oyxiSlF1vpH75qqnG6L2CXd66xtE
 AEQ4ObdcXyV8xXmoSINCrFWxbjpDWXsoI5mvYmAI6KYOFI67HXFuCDN4tAbC9/U2Eb/n
 a/4WBKCSlMqZl+MXVZW08Wj2xJRKYj82NntbFfRRQd/dXBJctw/v9T4PH4IzQv6EoQHv
 aKdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=CgMSqlqoKfmo1kPEeBZX2VovojnyBKTXCWVLnPfMjQA=;
 b=SDUNK3N4nxGEHnpvpasWD8u2vWbA7sbDf72Ww28VKVeNQFy3ORkIqMsu4qeA++MSuk
 yYX+BM755FwQAQvKZ4clWLxYBPtJVcr18hXlbkBBqdLvBuG72PJ+R7pXhNiUKi/Z6VW1
 WxcKEvbXSuset8Z4WpoPzIytRn+yPozYxtMPMdtLs3q54BccoPpgfDQFWpMngiX0hHu/
 rdFE3IqQeSJiIedTJSUP8Dv9y/Ddz75TdaclzcybW7deWsq57WEou8JdyWMC3hQxNaTv
 vsQXPcksN0xy2VBAEmUJ4nLJma/7AQWWGTh+mzqsWtJNBoWwBToP0uLrtnDuRFksMUda
 MGew==
X-Gm-Message-State: AOAM531guksRyOne9ZDUcTaVEXKqemqrwsgnuSviY+jMb+4a4Vee2HaI
 tBacVY4r4ARtc6j0LdXkamc30Xyw8IM=
X-Received: by 2002:a7b:cbc4:: with SMTP id n4mr14127889wmi.37.1633271943307; 
 Sun, 03 Oct 2021 07:39:03 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 q8sm11509391wrv.26.2021.10.03.07.39.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Oct 2021 07:39:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] target/arm: Use tcg_constant_*
Date: Sun,  3 Oct 2021 16:38:58 +0200
Message-Id: <20211003143901.3681356-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: db7qZjabcjSW

Introduce store_cpu_field_constant() helper to avoid using temporary=0D
when the value is constant (and read-only).=0D
=0D
Philippe Mathieu-Daud=C3=A9 (3):=0D
  target/arm: Use tcg_constant_i32() in op_smlad()=0D
  target/arm: Introduce store_cpu_field_constant() helper=0D
  target/arm: Use the constant variant of store_cpu_field() when=0D
    possible=0D
=0D
 target/arm/translate-a32.h | 11 ++++++++---=0D
 target/arm/translate.c     | 24 +++++++-----------------=0D
 2 files changed, 15 insertions(+), 20 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D
