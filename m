Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp724154lfm;
        Tue, 18 May 2021 12:48:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJys7Ja20qEFwwSD19Jr48AYmMaem/73I2RNMRyA1LLZJZlpbJK+TCVoltUumiZY+grtrHd5
X-Received: by 2002:a92:db0e:: with SMTP id b14mr5798660iln.171.1621367336491;
        Tue, 18 May 2021 12:48:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621367336; cv=none;
        d=google.com; s=arc-20160816;
        b=Rrrg2Fe2LL2D7moEkyfcGyptDpd6LOCBatDrdToLl77Iaut0T7R6Qm56fts2FytOIL
         ddX+K7eisBFvMesf48vzuCmXVf+hh1DQjyXVqOwVlMCUfBLoCnetO1XL8cBeG4qRPSu9
         +rQNQfsWA6B91cNpD/AQzRXYgXISHQauJmYzk92gI1OudepN25kilXJMbrEhdtghECso
         NfmTnuzG2Pxk3S63GY3BFJUAZE1jHzQfdo3HnW2RNVKM3KqFETYBpqEq54ZS4a5l7HD1
         6oX8aEwC5RlVSIgoAI5gBzeVb5BEECDHL0tGfBgCOVPbcCsHzu2ZXZMm9wiflE0XUx6m
         ad4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:mime-version
         :message-id:date:dkim-signature;
        bh=LsVPgL3TR/DLvNR166EDGInKD/HJObu0z2fv8TpJ1yE=;
        b=Ye2T03ca6SnB8Ovls2vY0th9W10rEOQvA+m2NT1TXXQvIAZKTbP1KF3qhH98521Tv+
         szolAoODzvMG0+rrQM30OjZ2UFSZf6E/ATV51k8pj8vm9UHp4FxzQZdXc833D0/rngs3
         u/Hwi7XxcvFvColSijM44gTc9kB+eYqFPxlIIoSxTecWMjGKjRv5jt4k+7VTdhV8/wNl
         1qdTUQFTlfgrHa6a5IXjpfkACTmv0NcfPnIPR4YTPjAYL1+PySSO3wi7lTwpF2LfIfWH
         9Mzj3QiRDtrCOv8m9M4dLXqYUAOVt4Gz0TKJ4f2GXibcBnmdVkpBiYr4hTgmuGcQlauA
         UtOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=rO5lwvv6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w36si9361392jal.44.2021.05.18.12.48.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 May 2021 12:48:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=rO5lwvv6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:50452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lj5i3-0002bZ-RJ
	for alex.bennee@linaro.org; Tue, 18 May 2021 15:48:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3xBmkYAcKCJMI1AGHE13BB381.zB9D19H-xE9ABA3AH.BE3@flex--venture.bounces.google.com>)
 id 1lj5gg-0007r0-1G
 for qemu-arm@nongnu.org; Tue, 18 May 2021 15:47:31 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49]:39612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3xBmkYAcKCJMI1AGHE13BB381.zB9D19H-xE9ABA3AH.BE3@flex--venture.bounces.google.com>)
 id 1lj5gV-00077B-79
 for qemu-arm@nongnu.org; Tue, 18 May 2021 15:47:29 -0400
Received: by mail-yb1-xb49.google.com with SMTP id
 d20-20020a25add40000b02904f8960b23e8so14932247ybe.6
 for <qemu-arm@nongnu.org>; Tue, 18 May 2021 12:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=LsVPgL3TR/DLvNR166EDGInKD/HJObu0z2fv8TpJ1yE=;
 b=rO5lwvv6Opr3Nbkamv65643pioqO0vHSPf1ycfSmMz5VIvPJWb2OY2mqHvwzjQ91KV
 7iah783zLoZCnBURuV3NO7CuK0G82M4whSz5EZROZWI1BPiVh/lVvPn7zZYzbZ8q4EaR
 nwDOhWJLowcdx9UYcjBQwQSE+0+0ViGF6hITuJpnUIRDsm60cIQlbJIgWfd9UaoH4PYw
 S5WBSYzbR7ToIeVs4S+htcQVK2mjIlpDpGRfzscJ9Xt+23UNtyNKdC8cYZJ4m56ly/wK
 SuiBhE4u6QgvkWH/XPJ7L6LKXipG2LAmeinAJ1OZzJnvt3yfRX6jrRunrwmiTmYIRkFa
 FaOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=LsVPgL3TR/DLvNR166EDGInKD/HJObu0z2fv8TpJ1yE=;
 b=DZk24fixHnkVE3MhXN+YoVrIaN/sYwmhpi7KYAHD8wsBn81eHEJAM7fMLzV6ETlBC8
 u1HWWpmeldBxm079NZ1CQOEP0g5xSlB5dpmqO8M0stBq+5dlG7BKIcY6Bg28YgVVXb+B
 xkEGo4JyVywi8vypU7IvbC5LJphGvx7Z2bWXSk9KsnMkmMiqqjWy6DFZ1f63HQLLsvBi
 PxlcADx/eieDN91vQKw6CkoMJQgosyxfXTkzIHiJGYS1xuPQ2DIkgeHWUtxbtxcYmoaB
 42ZVJwnm0u5PREmEKessIGB7W629Y3zvwgw8c1aKIVVZ5sjLeHEiV1Q0bPSi05VoqJIp
 2xoQ==
X-Gm-Message-State: AOAM531eJfNNPP+s4jCgJCFVkqbrXQuscpqFstyKulJ6FSEsIO52Ip6m
 m9XlKHPtGXazqsTfxPOPuuJIeTkyQfV+
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:5902:8a04:d917:4e93])
 (user=venture job=sendgmr) by 2002:a05:6902:1147:: with SMTP id
 p7mr9592485ybu.3.1621367236386; Tue, 18 May 2021 12:47:16 -0700 (PDT)
Date: Tue, 18 May 2021 12:47:02 -0700
Message-Id: <20210518194704.764241-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
Subject: [PATCH 0/2] Adds quanta-gbs-bmc machine to nuvoton boards.
From: Patrick Venture <venture@google.com>
To: hskinnemoen@google.com, kfting@nuvoton.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3xBmkYAcKCJMI1AGHE13BB381.zB9D19H-xE9ABA3AH.BE3@flex--venture.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1nnmQOr4ymoC

This is a board supported by OpenBmc.

Patrick Venture (2):
  hw/arm: add quanta-gbs-bmc machine
  hw/arm: quanta-gbs-bmc add i2c comments

 hw/arm/npcm7xx_boards.c | 93 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

-- 
2.31.1.751.gd2f1c929bd-goog

