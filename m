Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3418313lfq;
        Tue, 15 Dec 2020 03:50:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxh1wng8q+9tf0nAnPVotyw1EKKymV8CQ1Tv9PXQkJ54EkZVf4pK7IiFGfuFuof7DxLdlJW
X-Received: by 2002:a5b:44d:: with SMTP id s13mr39968801ybp.300.1608033038200;
        Tue, 15 Dec 2020 03:50:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608033038; cv=none;
        d=google.com; s=arc-20160816;
        b=Zaa5n9RxbelyWuNTZ/miZ/Q4/Tni6y+csBSHvcTGuiQmlbYd4DfIB7Bo58+59fl248
         m8QY4puSugsxlDQKk1oyu60Ulybie7v/j0w9Gxc5d/c6RIcLw0e4juqt3c6tigcUkQUc
         RjuBFvnWyiXmgywr98Xu4U+7E/FcfnVwQg2YxY6cmkheVQLOT7HsOOTQXWbeXZMxhwSK
         RTs3wT5MPih9bPd/KTN0jCBrBadGhnu6Kw0LToA/NYOec4JStYw+xAyYwB5IS30D5oGD
         V39q5qhUdgWp6lxL+HP/AAdcbx1L/wMScwK3A40y41TbGME1A2Fbpos9DBTVQwPf/TVE
         ZBSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=mrjluUaox9O/GuGcT66MzvHqCruw4iiBn+9QuZijTSY=;
        b=FzKaMUKlUKBfCjng56sR/4hGQ2mH9or3zoNHStIWNbI5FQWC0pRXzxOr3CPYZn0MpZ
         y4rVbMQTUkIbK6MHEW/wBNmQlyeaUW6YA2MtN03cikXIidLsSplY+nVzKRNeGxfngS+b
         KqjNmKFbt8qfYZp5dY1OErURiD6o5FrTis4WR3aqnJlwpJI1CWKR8od37oyENjJuixp3
         zUhvll9vN8fH56l45G9H4XgiXxXYQci4ak1gQbxvUP32ezRtHWQj6NuCsL/HUXJaO/BO
         KnxqRQEDIcSYId75hjNaccgsrSPbh5xEhG3QeoQgWQXCCiVYqdV/QhkZSvz1g5T/eDjl
         xfSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=GPZblvh9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c17si5836424ybn.462.2020.12.15.03.50.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Dec 2020 03:50:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=GPZblvh9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:33998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kp8qj-0001X4-J8
	for alex.bennee@linaro.org; Tue, 15 Dec 2020 06:50:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kp8or-00075g-E6
 for qemu-arm@nongnu.org; Tue, 15 Dec 2020 06:48:41 -0500
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:35515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kp8on-00013g-9m
 for qemu-arm@nongnu.org; Tue, 15 Dec 2020 06:48:41 -0500
Received: by mail-pj1-x1042.google.com with SMTP id b5so1022962pjl.0
 for <qemu-arm@nongnu.org>; Tue, 15 Dec 2020 03:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mrjluUaox9O/GuGcT66MzvHqCruw4iiBn+9QuZijTSY=;
 b=GPZblvh9i1SL6COgx2p1gw9Ef+OQXIYyVTeunJwySArRuRlcLn4r8psh7Z3Mp9bIP4
 AmEA2dbSlMleslqJGjCKAnmze0i8RX2Bkm4r20vekefussArHPLSZ0RaELXh5HI7kAVx
 YOy8J/QALYOsQVLn9MZ2/pwqNOhDb6J48uXthp8oGR1bXbl8j1lMht3IweMW7VjJVudR
 /y3y6ZDa64lUomcEfHdEkp+z3aJh0ucPF4I5spnsv/fJVGAf66AHcOGuzYzWnp/qGp/C
 rTsbITvvkODoEMqnhqCyHg+3S0AdKsHQ+b/PG7WheTeYDwt1kWe/w0fWE0N3dZdO2iqp
 Mvyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mrjluUaox9O/GuGcT66MzvHqCruw4iiBn+9QuZijTSY=;
 b=GM7KgBmo7t2wd0C6HNlV8wVN3hRmq3f8zwZjIKzshiH3BNpF4Ct/TPaHeIw/aWIaD2
 Mx965ot2FrGBb8qfIZXEQfgMeKcrKflB05YY6lkiNzotfJv+xcjWHLOMg6csq6gYa7Te
 vUj9EwaT5LAHJX7k4B9sG0cVYnxGYpxSlH9uv/SnwlC3XJNY/IEqTboCWPzgT97b1rYz
 u/IlNLYZ23+2euP3T0buYUa1TudauhjLty7yyHvz6Px43RRX6NVJniuALV2FwBjacIE6
 sr9cLAo8qwExgLw4bxzzsTWajLx9XrQkB7r9On1lFGEOBbrEipfQBnCheSA/df7ZSc76
 XUjg==
X-Gm-Message-State: AOAM530nHcALvFBkDROejBRZbt816+5Sn3u+/703h3RqeXh6HGF9kLHp
 /U0cm69MYdktoRgsikqm3W/peAW3cGogpgbMBifQ2hMP9EcKwWmgj5VbcfIKiD/YQRbEU93Oujn
 AvlhEtXMuY+RowzF5RBTYNPFZTAZbI/CI91rGdH4a3DQ8ZvF18rHwbcYMlhiYqIV6
X-Received: by 2002:a17:90b:16cd:: with SMTP id
 iy13mr29350787pjb.182.1608032914880; 
 Tue, 15 Dec 2020 03:48:34 -0800 (PST)
Received: from leonardo.ba.nuviainc.com
 (cpc1-cmbg19-2-0-cust915.5-4.cable.virginm.net. [82.27.183.148])
 by smtp.gmail.com with ESMTPSA id z23sm23340001pfn.202.2020.12.15.03.48.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 03:48:34 -0800 (PST)
From: Leif Lindholm <leif@nuviainc.com>
To: qemu-arm@nongnu.org
Subject: [PATCH v2 0/5] target/arm: various changes to cpu.h
Date: Tue, 15 Dec 2020 11:48:23 +0000
Message-Id: <20201215114828.18076-1-leif@nuviainc.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1042;
 envelope-from=leif@nuviainc.com; helo=mail-pj1-x1042.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Es5WFmwek1lz

First, fix a typo in ID_AA64PFR1 (SBSS -> SSBS).

Second, turn clidr in the ARMCPU struct 64-bit, to support all fields defined
by the ARM ARM.

Third, add field definitions for CLIDR (excepting the Ttype<n> fields, since
I was unsure of prefererred naming - Ttype7-Ttype1?).

Fourth add all ID_AA64 registers/fields present in ARM DDI 0487F.c,

Lastly, add all ID_ (aarch32) registers/fields.

Some of the ID_AA64 fields will be used by some patches Rebecca Cran will be
submitting shortly, and some of those features also exist for aarch32.

v1->v2:
- Correct CCSIDR_EL1 field sizes in 3/5.
- Rebase to current master.

Leif Lindholm (5):
  target/arm: fix typo in cpu.h ID_AA64PFR1 field name
  target/arm: make ARMCPU.clidr 64-bit
  target/arm: add descriptions of CLIDR_EL1, CCSIDR_EL1, CTR_EL0 to
    cpu.h
  target/arm: add aarch64 ID register fields to cpu.h
  target/arm: add aarch32 ID register fields to cpu.h

 target/arm/cpu.h | 71 ++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 69 insertions(+), 2 deletions(-)

-- 
2.20.1
