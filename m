Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp9357275wrv;
        Fri, 9 Aug 2019 08:42:08 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxJZ0pAcdrx6xRVajqYkwgsx/Kycv9LFwwddpF5A0iRmLPQsRqi74j62HGv3NCDRh9WM8/H
X-Received: by 2002:a50:f74d:: with SMTP id j13mr22516362edn.254.1565365328695;
        Fri, 09 Aug 2019 08:42:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565365328; cv=none;
        d=google.com; s=arc-20160816;
        b=ipLF03broPBeZa3d8H3ahf5D5wFNbqiHysuN6/yWeZ1h20j/RcC5jVlM9Df76yMWgV
         TDSUNLtt1MGISpKc+GIjfzZckosBGsTF4I+ZBb3De9JOFyHmxaBwm+bapcnfURgyz5E3
         KF2HTOdqi71HVnobWOsx5vfLQP2KtDpbUAyE8+ZJzY0wD7jd3AInaTYeAp7rkBY9smkK
         EPaGXhNtK9NNwH2+8Kt5cYrifwwhY2cJdGmmxpwwOCX/tFo2R+71bTWzGtZKNckbVE2C
         DsFsDh5eQswoA7i+ld9Xf5R6zcujK6WDez7nBJ38HpJE44TQymXQRNAG8pqjm857bWEB
         QiYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature;
        bh=1N0mIyh5t8eVenXRm3PmSJuWeZ0AYiNkiWHu272Cug8=;
        b=XQxAtuMzTefAL0OzJ2s91H+5pLA3G/sYV0Kl0pBpzOIgF84/ZOe1/QXVWAH9f6I6I6
         084WHR7VoSkxtfSVbd4fa8wSxA/2/iqicgMXnwZZPTOcmDsdBb9ImssZHpU8XT4nQHx+
         Ufm5cWF2HAC/XPsqbLTGglRfIYMLXgM3FkshkPIzgDKXp5e9FArJuwN/GAVNa1ULx3q9
         PzfJQcqivFENOzqevjy0/y+pmNr2CYj3JMJpZ38c8ZYlMjq+v1Qup7SD5nHGni7Zbjba
         sM4EFrjpBMAiU5BMWo3z71eBCqF/HMzI7IdRuVP1geKDqX8g0hqAAg28ATJX5MPL7rui
         nfIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JKbKK+Kb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p32si36707560eda.51.2019.08.09.08.42.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Aug 2019 08:42:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JKbKK+Kb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hw71r-0000Zc-Q7
	for alex.bennee@linaro.org; Fri, 09 Aug 2019 11:42:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50725)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hw71k-0000YI-Re
 for qemu-arm@nongnu.org; Fri, 09 Aug 2019 11:42:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hw71h-0008Q9-U3
 for qemu-arm@nongnu.org; Fri, 09 Aug 2019 11:41:59 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:34430)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hw71h-0008PB-Cs
 for qemu-arm@nongnu.org; Fri, 09 Aug 2019 11:41:57 -0400
Received: by mail-pl1-x644.google.com with SMTP id i2so45149099plt.1
 for <qemu-arm@nongnu.org>; Fri, 09 Aug 2019 08:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=1N0mIyh5t8eVenXRm3PmSJuWeZ0AYiNkiWHu272Cug8=;
 b=JKbKK+KbdfXoV9FaeFHdlxOgEmWNEvRysMHVRs0Wa1QDVkXrz3sQrqVvmHzzaMgXf0
 KYciDrXlDWnD9uBKK8b3pGQfyfb2eb6rUGqEWzYx9gybZTzwWlzhLN4bvcDEH7fD61/Q
 3x+G+DCc+dhsZUt7tEOrW3J9QDbTsBsij0Ts4TmCwrXCdTNffwsI+UnL0FQa2/GXBmK7
 5ei22cJcv5BtL6kOEurdy9UmiLAhYNa/cxD9AXAVUW+bJL7+n4prVUh0R6ZPWmR6Cg9s
 YndGCQbgueEfxFJAgw44wifI92VKt4aaZQZOQ5TwP1TBOKS9ApahxIYI9mSWcfyJRN4M
 VisQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=1N0mIyh5t8eVenXRm3PmSJuWeZ0AYiNkiWHu272Cug8=;
 b=J++Vxjw8aPtUO5I+wYsvGU0wmvPxhC5JKOsOOAqhC8gW4NWES2ORNeeFfIdL/Npnce
 ABpwSSCsPp/8AGDWcx9WOpQF9gaytZFzdY/zpTcLDZEery001e8doRkIgrbFbmHPLOif
 YQTNRGR/gxq/HQJomp0y3y2WCckr7GwE+QoHJ1KG51dfEsthOlA7diHzjEalX+2WBs/M
 yoVfLkh0KGsFv5o/KQ+BzZtaEn+S5gH9kv2/Lf2ovHWkMR5AjCmPnSqH4pSb6MQfO4UE
 pNkltz9IHEl/NmwXIL94IdhWYC+pHYASR86+mJecmULNBVX6Z1zgiiBZhqqedyBio/pF
 3jIg==
X-Gm-Message-State: APjAAAU2sWN6zVvU2J/zIcpLf/QjneLxor11i+IicgHPfPh7YjTpjimp
 F8ssnvtzfi8+pIX95QXTwav3pA==
X-Received: by 2002:a17:902:2be6:: with SMTP id
 l93mr19920795plb.0.1565365315993; 
 Fri, 09 Aug 2019 08:41:55 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id 67sm80452179pfd.177.2019.08.09.08.41.54
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 09 Aug 2019 08:41:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri,  9 Aug 2019 08:41:50 -0700
Message-Id: <20190809154153.31763-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: [Qemu-arm] [PATCH 0/3] decodetree improvements
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
Cc: peter.maydell@linaro.org, Alistair.Francis@wdc.com, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XA6PGBRsLrRM

These are split out from my decodetree coversion of the AArch32
base instruction sets.

The first patch has been tidied per review from Peter.  I now
diagnose nonsense fields containing no bits.  I eliminated the
unused integer argument passed to the named function.  I improved
the documentation.

The second patch is new, a suggestion from Phillipe.  This then
enables the third patch, tidying up the existing usage in riscv.


r~


Richard Henderson (3):
  decodetree: Allow !function with no input bits
  decodetree: Suppress redundant declaration warnings
  target/riscv: Remove redundant declaration pragmas

 target/riscv/translate.c          | 19 +-------
 docs/devel/decodetree.rst         |  8 +++-
 scripts/decodetree.py             | 76 ++++++++++++++++++++++++++-----
 tests/decode/err_field6.decode    |  5 ++
 tests/decode/succ_function.decode |  6 +++
 5 files changed, 83 insertions(+), 31 deletions(-)
 create mode 100644 tests/decode/err_field6.decode
 create mode 100644 tests/decode/succ_function.decode

-- 
2.17.1

