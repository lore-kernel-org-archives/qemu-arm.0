Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp5567933wrp;
        Tue, 10 Sep 2019 07:44:57 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz+BgHXAXMxbbQBpUQ355crBorZDFAihVaf6zfVw8A9Ts9ZpOzJGk2jXwvsrtd2meALxJeG
X-Received: by 2002:a37:8f04:: with SMTP id r4mr30227084qkd.244.1568126697797;
        Tue, 10 Sep 2019 07:44:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568126697; cv=none;
        d=google.com; s=arc-20160816;
        b=a7EMsevDIw1/TM0ifoyqZ8oc3YHNRt90tHnR5mDala9mK9cXeHXCxOG9s+t8lSdL20
         3mdgDq60lbJR9UmnI7UAQUOiCbGPLPG+B7Nh13EZoylim1Q6jaJSuZ9ZhiPWIgreJJL+
         8yO6G9kSLwyDl7cBtTv+ne3/GUhp43hukS9jwIfHGtZXg6jlYGHs0YJf2tU/xtbvYZc2
         VowoK7X9/9PRno4O/nRPSAEXFzgihCU0SDbTgI5XrZO8J1STcVl++yEcs0mDJKfKY+kW
         /KXw3U+uopMPgWypp6EkubzCDY0M/9MgnW/MdcyW3pDdOX/W9BoaWxURnfmjtjcg3Rdu
         AYWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=xTjf3hmMk5rbmJgPO5PWGWbjlNL8080SfY7U6rGODTo=;
        b=ZHKJYlawgezJb6bP4cBXv16lQVa/Yr8WuRmcyZ7JDXIWAp+m1YC0jULC4Zt7OLp9Us
         afjWcnIrcdlZjSE75uF61BsyStl5lBfGrCHJfCDyVgbC2IR19PbUn0mXGFCiRoJOsLkK
         ZrRyacuLMJv4d/3Vp+SWgFVJ/BHbgm379tQlMdi50oo4q8axV1/6HSnN40LCCRjE+e9c
         rY32xAvi/j6Kkpzt4d2gYH0Q9Cy3H3zZH/lECqCIVUPB53ZQ7RW3RyBlr9L8GnEfLps8
         Mjs+xBmMHRB8GmOY/EpIH6WWWla5GxHuAn7kEmA6BWrGgEJBJHxHMbjib0PeFmyGoyJU
         COmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bUqpQ6K5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y32si12793031qtc.203.2019.09.10.07.44.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Sep 2019 07:44:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bUqpQ6K5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i7hO4-0005OL-Pn
	for alex.bennee@linaro.org; Tue, 10 Sep 2019 10:44:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53873)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i7hNi-0005Ks-C6
 for qemu-arm@nongnu.org; Tue, 10 Sep 2019 10:44:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i7hNg-0004xF-SF
 for qemu-arm@nongnu.org; Tue, 10 Sep 2019 10:44:33 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:36620)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i7hNg-0004wp-Lj
 for qemu-arm@nongnu.org; Tue, 10 Sep 2019 10:44:32 -0400
Received: by mail-wr1-x42c.google.com with SMTP id y19so20838277wrd.3
 for <qemu-arm@nongnu.org>; Tue, 10 Sep 2019 07:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xTjf3hmMk5rbmJgPO5PWGWbjlNL8080SfY7U6rGODTo=;
 b=bUqpQ6K5odLPzxzHikD/LNM/4ehLGw8tz+HBXQ0FQgvStfMhmDKDw6wucYPtuA6b7d
 zGolzHBXoKBxsjjwtTwGFC8Lvp40WGguivRLGy5FLcETEC3s6It/ln/p9jlpORdW7rSP
 uTdudX+i8cuT5qcLNC5MYrneALDOYc943GcHHU/6YrHiVlUZFxD7z340hcyvSJtmETE9
 IK/NRc5hA0Cl3aJXA/2a6WUPAii3gS/VlLJHyxJOZ500ZJ1vpM0fcKyhBfapeEZjtIPh
 z1Cu00+Qi0T5cLrzcNfr8f++HZdLToAvDZeBtVfKXBWdR4YFIyIPaHQ6Y1Sh2xqLQHK+
 ylGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xTjf3hmMk5rbmJgPO5PWGWbjlNL8080SfY7U6rGODTo=;
 b=AKAqktKRn3HuLr7Pe044s34jZBYvrINj8mMg21XJQn9XsvSqErl9yAzjitcUtJTfiN
 CPX7dM8thhUd9Zx00rxZ2QcJj7bd7ARggREqmRJqaN1Nk0cYmxWeRGjTbO8rZZ5FChLh
 CrLHhIi01Rx32pDcfEH203ukekCuijf9sK+UBOWFaHdaiLAKKZk5f/lF8DuCs+dIrS/p
 LQCXa5gttwSH/+c3b5h+herFsHNUNfS+Wj2JhDaLtaQoG9Ew10H+i73awKmNsiCruEAl
 pWt6EYlpNrSzYJR8v6gerzTV4x3dOEJSuGhmEXoex0zT2vxhTM/K4tGq/WR+vt8Q7gjI
 HDeQ==
X-Gm-Message-State: APjAAAWCpbHHGCKvlOOGDNWbJcz6PbybhgcGeekYHi/JYicuXi6qJ4fM
 yR2ZOEfUO+65hB4pDyBfEGBscODvAascYw==
X-Received: by 2002:adf:e2d0:: with SMTP id d16mr15254677wrj.245.1568126671179; 
 Tue, 10 Sep 2019 07:44:31 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a192sm5703814wma.1.2019.09.10.07.44.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2019 07:44:30 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 10 Sep 2019 15:44:15 +0100
Message-Id: <20190910144428.32597-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42c
Subject: [Qemu-arm] [PATCH 00/13] target/arm: Implement semihosting v2.0
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
X-TUID: abQeQHLr4gSF

This patchset implements support in QEMU for v2.0 of the
Arm semihosting specification:
 https://developer.arm.com/docs/100863/latest/preface

Specifically, v2.0 has:
 * a mechanism for detection of optional extra features,
   which works by allowing the guest to open a magic file
   named ":semihosting-features" and read some feature
   flags from it
 * two defined extensions:
  - STDOUT_STDERR lets the guest separately open stdout and
    stderr via the ":tt" magic filename (v1.0 only allowed
    access to stdout)
  - EXIT_EXTENDED lets A32/T32 guests exit with a specified
    exit status (otherwise only available to A64 guests).
    This is something that people have been complaining
    about for a long time.

(Technically some of the things we already support, like
having an A64 semihosting interface at all, are also part of
the v2.0 spec.)

This patchset:
 * fixes some bugs relating to errnos in some cases
 * makes semihosting hand out its own filedescriptors rather
   than just passing out host fd numbers
 * abstracts out the fd-related semihosting calls so they
   indirect via a function table based on the type of the fd
 * adds a new type of fd representing the magic file
   ":semihosting-features" which is used for feature-detection
 * implements both of the extensions defined by the v2.0 spec

I've tested this by improving my semihosting test suite:
 https://git.linaro.org/people/peter.maydell/semihosting-tests.git/
(if people have other guest binaries that make much use of
semihosting then testing would certainly be welcome.)

thanks
-- PMM

Peter Maydell (13):
  target/arm/arm-semi: Capture errno in softmmu version of
    set_swi_errno()
  target/arm/arm-semi: Always set some kind of errno for failed calls
  target/arm/arm-semi: Make semihosting code hand out its own file
    descriptors
  target/arm/arm-semi: clean up TaskState* usage in non-user-only code
  target/arm/arm-semi: Factor out implementation of SYS_CLOSE
  target/arm/arm-semi: Factor out implementation of SYS_WRITE
  target/arm/arm-semi: Factor out implementation of SYS_READ
  target/arm/arm-semi: Factor out implementation of SYS_ISTTY
  target/arm/arm-semi: Factor out implementation of SYS_SEEK
  target/arm/arm-semi: Factor out implementation of SYS_FLEN
  target/arm/arm-semi: Implement support for semihosting feature
    detection
  target/arm/arm-semi: Implement SH_EXT_STDOUT_STDERR extension
  target/arm/arm-semi: Implement SH_EXT_EXIT_EXTENDED extension

 target/arm/arm-semi.c | 613 +++++++++++++++++++++++++++++++++++-------
 1 file changed, 513 insertions(+), 100 deletions(-)

-- 
2.20.1

