Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp1766661lfq;
        Mon, 11 Apr 2022 10:02:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZsakCIBJbMWrnlEd1pH9cBf7gQnZjeuUPs9/F5uM5s1hU3Yirgt43YcGfLj6YlPRq4A06
X-Received: by 2002:a0d:d850:0:b0:2ec:26bb:3468 with SMTP id a77-20020a0dd850000000b002ec26bb3468mr5244389ywe.369.1649696520163;
        Mon, 11 Apr 2022 10:02:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649696520; cv=none;
        d=google.com; s=arc-20160816;
        b=aDyY8QnW+2BJtTN/qJyQ1tqlA+JCg1N1skABd+FqKdvRWTmtTJkt2618juL5bt7adc
         k/TC7G2zQrlSUSfA/HpPwBCF9ldsiPvbrbPIzDmIGit9wtAob57RqkGQeLGG6j402plH
         7rbokivhgsiwiFFbD28259DtX7Eob4y0xzP2Il268yHjUlKRo1RLU6Oy7hEi5GHq0XMR
         T2R0+MzJTyErSvpFJPtAfW30LupJIcz18sAkiUBIgtQsdz25FL7NvYM/HmKKHAARiTqA
         xVC7lpDVQfMBCbR2b/jlVlyeKKsuNMJ0/X/7kPx987hX693FePM6dUhY1PCHozf8W5P/
         OgMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:mime-version
         :message-id:date:dkim-signature;
        bh=Gd8UzwIrLWhk2aACZcxX0dxsFtvg/lBvgclvrDWTjY8=;
        b=UjmdXPH99ZP3BWxpNM+uV8b9d8O4B++pBqa/Ge0nK3r0BI0eoMWs5WveXyFiub/l4l
         VlOfQuiFx1EygQ/PzFDYJZZF02nJRUhnQQHeOKILcBl9hVHRIHR4djJXniDvff++vKsE
         SZ41J9ulx+UF88Zo71JNC+bJ7KKoYwk70TgWBH0slH6Zxlc9JqjgOONe9D9z1DsbULPA
         LKgIQNZC9rkDJ7OHSjr8Tj1aXNDMPt1V2B+Nt06X7MuibIRCFPV08mpoHHWW1Q8VmlvR
         9s+2cYxB3OXcgF3lV8FlExnBhT3rsFUltBpukUTWpmJqoW8pBpDb1jxqa3h/CxMZpFMi
         tWzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=FJGCOlxG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j63-20020a252342000000b00641302917a9si3072615ybj.29.2022.04.11.10.02.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Apr 2022 10:02:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=FJGCOlxG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:52058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ndxQN-0002fV-Ic
	for alex.bennee@linaro.org; Mon, 11 Apr 2022 13:01:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3SF5UYggKCm8jhUNbgfUTbbTYR.PbZdRZh-QRiRYabaTah.beT@flex--wuhaotsh.bounces.google.com>)
 id 1ndxNM-0007rj-0Q
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 12:58:52 -0400
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549]:45753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3SF5UYggKCm8jhUNbgfUTbbTYR.PbZdRZh-QRiRYabaTah.beT@flex--wuhaotsh.bounces.google.com>)
 id 1ndxNK-0004es-NO
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 12:58:51 -0400
Received: by mail-pg1-x549.google.com with SMTP id
 b18-20020a63d812000000b0037e1aa59c0bso9173413pgh.12
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 09:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=Gd8UzwIrLWhk2aACZcxX0dxsFtvg/lBvgclvrDWTjY8=;
 b=FJGCOlxGIpnnej1SmC2PFY2uVtaZLf8w4k041Mj3A89mYeH4jYC8Yt0TQzHQYSZZJM
 lB1pzy7vhqcEb54hAuS/7WO0cgO1mgi4kpbyKxtXjIGUvSSw6VUT9JWBdSqJlx1LoYhm
 TOsPDSB7iy41t4O1ExqTuY/g53KR08M+ezT+dSpgxhnsUOoqVoIK4q/2yVg3sjF3RSG2
 VxOTqU2VO6gktR1r1NXEPJ18zRB9zqmN7TLmiQnLO28ABQYqLC06qHx8qYscGoMzmZqw
 KdegVAKgCt/vZ35yG0NLMpCKVPHwiPe7CvRyeH3WRn7mZYu46YvipFhDnAFtQHGW7ggx
 rCAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=Gd8UzwIrLWhk2aACZcxX0dxsFtvg/lBvgclvrDWTjY8=;
 b=dxRd2rKE+zS0rbcc9ZA6Z4e7XfkQWu9DhvZCpHIKbb4xCT8apRQn24RZreI7v7jgEM
 VXtIjKfV7XLKhA4Tnx9hfTVxyzo3A5kKdvtmAWuRCvH9ZIinVOYLQBx3rnyOhT1npbCh
 jUelZM8CwGcCQrTe2QYWW+yytHBqhU2WAObRitl2t2mTYneH4TqKJKO/2pjW0856xISa
 jHh/OsA4AOZtuXR2bNgtGzp+JIjNG/NRsDTGaoHne8CeOm3LqRaejDGpou3ap/5+NwUK
 23WXJO8eo4HNYTExODGmYwxz2LaI5pYZ6YQPXmseCbyZdQ6UvcPt2PJVwWugJzrAKjR4
 GWGg==
X-Gm-Message-State: AOAM530hITX0AT7x5CQ4Yjm+kEpdr/0NPmMADf1u3CSma5pkVoSDKwjR
 Y32QoTb+DePeB2Qv0X21ly/aiORjVvrvfg==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:aa7:9730:0:b0:505:cc11:5e9a with SMTP id
 k16-20020aa79730000000b00505cc115e9amr4085688pfg.66.1649696328040; Mon, 11
 Apr 2022 09:58:48 -0700 (PDT)
Date: Mon, 11 Apr 2022 09:58:40 -0700
Message-Id: <20220411165842.3912945-1-wuhaotsh@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.1.1178.g4f1659d476-goog
Subject: [PATCH v2 0/2] Define NPCM7XX PWRON bit fields
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, Uri.Trichter@nuvoton.com, Vishal.Soni@microsoft.com, 
 titusr@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::549;
 envelope-from=3SF5UYggKCm8jhUNbgfUTbbTYR.PbZdRZh-QRiRYabaTah.beT@flex--wuhaotsh.bounces.google.com;
 helo=mail-pg1-x549.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: E4zXXMVPBUOX

Currently, the PWRON STRAP values in NPCM7XX boards are magic
numbers. Similar to the aspeed ones in hw/arm/aspeed.c, we
define bit fields constants for them and use these fields instead
of the magic numbers in the current implementation. The code
should behave exactly the same as the existing one.

-- Changes since v1
* Fix errors and apply suggestions Peter made on v1.

Hao Wu (2):
  hw/misc: Add PWRON STRAP bit fields in GCR module
  hw/arm: Use bit fields for NPCM7XX PWRON STRAPs

 hw/arm/npcm7xx_boards.c       | 24 +++++++++++++++++++-----
 include/hw/misc/npcm7xx_gcr.h | 30 ++++++++++++++++++++++++++++++
 2 files changed, 49 insertions(+), 5 deletions(-)

-- 
2.35.1.1178.g4f1659d476-goog

