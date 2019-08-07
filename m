Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6071906wrv;
        Tue, 6 Aug 2019 21:53:55 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyltlHsUlwaQjj0yvTQIMwq5X/4y/+pl5lTs4dGh8nGEtxDx3FNxRQ8o1sS7/a6ffGfIgYq
X-Received: by 2002:a05:6214:13a1:: with SMTP id h1mr6136198qvz.190.1565153635590;
        Tue, 06 Aug 2019 21:53:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565153635; cv=none;
        d=google.com; s=arc-20160816;
        b=E290AKZ+xTuSRkNjXbql6r0Yukn83gymUg8RgZHpSf+dvhSkBG1nWyGJ+jfrmMUNDk
         zwR8+vXURvl7Ozw1IKYlLkdKoQQ3BsLvjXlY4OvCvr6DAd8wWVmLUxedbRo0PAkvmZeZ
         sWIyPhUoJEr25+iZ1a6epJh9qYv/REqL2wYHZTUHusVTBCvo+3AUehW2PiCtLxuNNUCC
         e1sUp22NLwwQZd6k2M5Ry+tKPipQf76R7q/ojv+EjpyJOVWKTZZmZCNVdAu7lEaDzWCA
         fvzDQ4G+buAG2elk1HBdlefQB1xi1sOR66RlpHbSAHBGGbpYwLHG+Zm9b289YaolTE5Y
         3Heg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature;
        bh=PJ7zkpB+6Cwx8kF4V3bvovNm+nwQsltuqm4c6vQnd5k=;
        b=wy+8T3sft06LBaeEBloXVFeo6kBmbElijznTmHHbmWUQWneOu2XUgKt9GI9OUyBF/1
         +Bc+4njd/8OeNia02yJdMjM9ZyGOtYSFgqNShUppucM8MGVUjp5CL9HPq5sYXVG6HXsV
         fCYKokuG5rUgdZqsaM/a9+dzCJjQek4Sd65mz4azfcvz5e+3U4PA7A359xFFuBmvHxER
         33jl2FM5Fxa4wMrcxU3ekjtsL8oTcP6U1Zd/EwRd+NmgAz8byuPwgV4d/qhv69b4saJA
         ExCA0WKGpSCObAQHJBOgYEJdsLg6vYva668HHpddCB/KvQc0IjlJv7UrdjSVg/8/bAf/
         PPkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UZ19ZpGD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u191si49608216qka.299.2019.08.06.21.53.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Aug 2019 21:53:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UZ19ZpGD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvDxT-000143-4Y
	for alex.bennee@linaro.org; Wed, 07 Aug 2019 00:53:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40534)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hvDxL-00012R-9v
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 00:53:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hvDxK-0004iI-8z
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 00:53:47 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:34969)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hvDxJ-0004gs-Qo
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 00:53:46 -0400
Received: by mail-pf1-x42c.google.com with SMTP id u14so42781630pfn.2
 for <qemu-arm@nongnu.org>; Tue, 06 Aug 2019 21:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=PJ7zkpB+6Cwx8kF4V3bvovNm+nwQsltuqm4c6vQnd5k=;
 b=UZ19ZpGDrBudoEcAvtcKIJIr9z/nqqcWcZHSk2hwLQhioxsidWMMwBF5LEToPbjkRB
 SzNX1ol4cKWFvz6rytNMa6328UdDExzXI1B/trhI7IoPioxTz27zll4HGTg/8/iwUYKc
 D4MKto2gGQH+hZngYe1UKB1fjMebp6qYQ/Uibzlm0eMfy+M03mbtcrcT6gOmCdxSSgKa
 wksK+tRNIfmLc1qPSHWDFJRDC8v5fhWi+AmcNbpWB11/vDEBXbxpSUwqQCznG9IqxgJO
 ItoIKTqZshlTA4Kpkx9rT1wTgbjRrwskWEkTTv0T6hPfWtQ0HCAkXFzHv1YeMVYmXd9N
 4i2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=PJ7zkpB+6Cwx8kF4V3bvovNm+nwQsltuqm4c6vQnd5k=;
 b=P93WqG3i1qH00iHEGYs845Ksa6RC5kwrt6j0fQQ6+D6PERmaC03+gYV/InNDFTDKBj
 4F0EyRerL1BYSsuBJgvYcMJf4sukt6DXvRRI+zG/27pV3veCqkWhdQp0pw39S4eQ+B0t
 YcRyZE5dTaGGHy2GARBHGa6cb7qi75FY8Boa9CkDu/ZxMmJfV5+5Ku5e1WFK61Zetoe4
 51QF73KXFzfHJhXc3Uyz0C8oBwQQzDyzf5B2Q6rLLkALHSIOV6Xw3F5DtJ4FYDxwpydX
 VOZVUitjRWUHch/A/AXWBnsMmBOu0LrnZlTVpPNFwMvDkDmBp/9H9kaHksnWR/fjMqaZ
 F2DA==
X-Gm-Message-State: APjAAAV7/cBiAcoXh9OWEWcRfrzPRceN2jyd7ROoTr2jbT7bwGP8MNxJ
 RjOO2omhSLXGqv7VtOYa/v1BTw==
X-Received: by 2002:a17:90a:20a2:: with SMTP id
 f31mr6504650pjg.90.1565153623738; 
 Tue, 06 Aug 2019 21:53:43 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id t9sm24347921pji.18.2019.08.06.21.53.42
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 21:53:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue,  6 Aug 2019 21:53:24 -0700
Message-Id: <20190807045335.1361-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::42c
Subject: [Qemu-arm] [PATCH 00/11] target/arm: decodetree prep patches
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UKCE0qstIPh8

These are split out of my decodetree conversion of the
aarch32 general instructions.  With one exception, these
are all related to cleaning up how we refer to "PC".


r~


Richard Henderson (11):
  target/arm: Pass in pc to thumb_insn_is_16bit
  target/arm: Introduce pc_curr
  target/arm: Introduce read_pc
  target/arm: Introduce add_reg_for_lit
  target/arm: Remove redundant s->pc & ~1
  target/arm: Replace s->pc with s->base.pc_next
  target/arm: Replace offset with pc in gen_exception_insn
  target/arm: Replace offset with pc in gen_exception_internal_insn
  target/arm: Remove offset argument to gen_exception_bkpt_insn
  target/arm: Use unallocated_encoding for aarch32
  target/arm: Remove helper_double_saturate

 target/arm/helper.h            |   1 -
 target/arm/translate-a64.h     |   4 +-
 target/arm/translate.h         |   5 +-
 target/arm/op_helper.c         |  15 --
 target/arm/translate-a64.c     | 109 +++++----
 target/arm/translate-vfp.inc.c |  45 +---
 target/arm/translate.c         | 397 +++++++++++++++------------------
 7 files changed, 249 insertions(+), 327 deletions(-)

-- 
2.17.1

