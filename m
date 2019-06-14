Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp795509wrg;
        Fri, 14 Jun 2019 03:46:51 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw4r0ED+OWyf80RPF7kB3Kh4BnPwiuHf0UHcUxPnPXXkE5Y88oiWSgcvgdRFjHyqVacuLUs
X-Received: by 2002:ac8:1751:: with SMTP id u17mr66936321qtk.305.1560509210971;
        Fri, 14 Jun 2019 03:46:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560509210; cv=none;
        d=google.com; s=arc-20160816;
        b=my5XjOGoFZW2aSD/8hQrlvOQEM+lO5tAy2fJWMniPio9Le1cbnZotLC/bZ/HsnToGm
         nKdbzvcmzUpxrumrZstXStMs2jlBNwa9scZffocSpuPCbvY+GSaKQ5uPsZkr6pxbb1bW
         CnDAQq5TJmDYEj6jyQEJQOm3KoTbLLR7QgoF3g287eEgri/J1x8lbx5cXJ+aB/lQ0cif
         r9MnZ5QFHk7yfNdjGOmVehW+RjvIEUODx6EI745soWcNa0OtBJMm+689f7T08bnM42Jz
         kvINwYvYHYTaFHwPDjIJWZTZs6Rl+EukylWrZEKa1IWij7exC7B5Dr+URySaE3WMgueo
         5Ohw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=G4iI4xbE++btRAKqNuYcXwMPUFwpVIy3rzD2DOH8RuI=;
        b=ffHCzZV43e96zbP4KrYJMkCVoXKKFZxumdL3YSAkjHAvHzeciORsUs6EYkLx9mWF/G
         rCiOj2jq1kiN6dRWBChLTuxe62CQBlzxlzP5SYKeKugwg+XUhr9hpsjvpffYdNYjusFa
         URie9C6yuhcecoYs0+h5gySNv4ynjI0T4TLsJz6sz8oqnhhS/YEWHZGUVBE9FCTXueqm
         05obe9GSc8oobd4YNU7NRHZ1ODFuPUxohV/N6ZuIxBDtEenFSimaNU8n8Dn8Le4gMZjl
         5xIj1/mdoTjAbYI4wUkONpDCxUIHlIE8wDi3YoEjRc78R/l8FQygUr++ofwZ41lxvt79
         nc9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ufr3j0Ge;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 28si1539269qtx.181.2019.06.14.03.46.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Jun 2019 03:46:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ufr3j0Ge;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50102 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hbjjO-0007wl-9h
	for alex.bennee@linaro.org; Fri, 14 Jun 2019 06:46:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57619)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hbjhe-0007wY-80
 for qemu-arm@nongnu.org; Fri, 14 Jun 2019 06:45:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hbjhd-00075W-96
 for qemu-arm@nongnu.org; Fri, 14 Jun 2019 06:45:02 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:37964)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hbjhc-00074U-R1
 for qemu-arm@nongnu.org; Fri, 14 Jun 2019 06:45:01 -0400
Received: by mail-wm1-x32a.google.com with SMTP id s15so1822500wmj.3
 for <qemu-arm@nongnu.org>; Fri, 14 Jun 2019 03:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G4iI4xbE++btRAKqNuYcXwMPUFwpVIy3rzD2DOH8RuI=;
 b=ufr3j0GetZWdwGkwSW8r8oA2ZQxw6qaTnohIUoNWl2sVT8tbRL6l3zJ3rOPTDSr1CQ
 JBuz2HvEUj+bmLVVWSxJijMdBxldd629mMY/w+4hLT1c0Bz+7trW9QVShH3CGySf8lZs
 Rfbtem3Jv8n9o9zqWhQMlqO62yj7sQb52qf2PB9p9uVz5zSu3QTn6vaxz5OcZwCSymdJ
 ddgbC9ia6j97+wNGtWtN4yY2jCSkqwqP1QGpMdtPFxkQscnZ8rfFhKsRRzaOYfxanjpg
 UpIaTLesalFbF/vHD2mlQDxy9j6Iab5qQZCtiOnKExSZrspyMrCJOP2wgkIUcgaSJlj+
 Z9eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G4iI4xbE++btRAKqNuYcXwMPUFwpVIy3rzD2DOH8RuI=;
 b=PDkt7soCel21WDNWGW9sRDtjMqqCFVKeLzuJ6V8iSghxCZJMyGFjkXKeJOGTwckimD
 vGkmUm0MkRLkgAov8jYONtcUgluubVgjE2MKXBbvZZwJmYTPiOiHXdidCcLr9/J7mc90
 pbkFbBoONi0mifAgGgcLJAKdmt49w2y7xHipn0M+xXPp8nSjeb3NrGyybZt1pbcGMpDq
 jwNxkmEwcmdttzKR91Ku4SxS7MH7N19jz84ofKL6hhOI6BECRPi0tI+b3GP3uHUURXcm
 CWVp5ejFQhje/9MGGFmnrMyR4nALjrDzsneORRu+agGnu6uV3jw3OYdFaBBY4ki4ATVH
 /l5Q==
X-Gm-Message-State: APjAAAUcUCGNuNODSOl2v7sEDJBzuVUlAWfV0koWgPP7c+bCN1eoeWdJ
 2MWcbOlQDnne06RMyQGQDEDJISm/BwZqnA==
X-Received: by 2002:a1c:f512:: with SMTP id t18mr7301111wmh.47.1560509099255; 
 Fri, 14 Jun 2019 03:44:59 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y24sm2091238wmi.10.2019.06.14.03.44.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Jun 2019 03:44:58 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 14 Jun 2019 11:44:55 +0100
Message-Id: <20190614104457.24703-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::32a
Subject: [Qemu-arm] [PATCH 0/2] target/arm: Support single-precision only
 FPUs
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bVXzvwJPAiH7

The Arm architecture permits FPUs which have only single-precision
support, not double-precision; Cortex-M4 and Cortex-M33 are
both like that. Now that we've refactored the VFP code to use
decodetree it's fairly easy to add the necessary checks on the
MVFR0 FPDP field so that we UNDEF any double-precision instructions
on CPUs like this.

The first patch fixes some no-visible-effect typos in the
names of struct arguments to some functions (caused by
cut-n-paste errors); not really related but I noticed them
while I was working on this.

thanks
-- PMM

Peter Maydell (2):
  target/arm: Fix typos in trans function prototypes
  target/arm: Only implement doubles if the FPU supports them

 target/arm/cpu.h               |   6 ++
 target/arm/translate-vfp.inc.c | 112 ++++++++++++++++++++++++++++-----
 2 files changed, 104 insertions(+), 14 deletions(-)

-- 
2.20.1

