Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp3300829njb;
        Tue, 9 Jul 2024 06:46:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW+Oqf1LUmmuBxHCCSTrfGvP69nqJlNp8mKsqskqIOY0kA8z1yFcp4EeTyCRDY2ma2UW2xBejKyBYfJimnfbRCvze3w/70E
X-Google-Smtp-Source: AGHT+IG6uyLsjXLZcrjpPpZ4xLUSXTxdTn1hd+8PEeWPWX43MsrKLtAlvSuG1bT5qzjhIMKaA029
X-Received: by 2002:a05:622a:5ce:b0:447:df1a:d977 with SMTP id d75a77b69052e-447faadcfe1mr22768161cf.67.1720532797535;
        Tue, 09 Jul 2024 06:46:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720532797; cv=none;
        d=google.com; s=arc-20160816;
        b=McWQkDi0q9JCLTi0H6SPR9c9iS1CVH4NzrvOjF+2TXiadv6zf6lJYcnA1lluEuFY+u
         D/X7m1bQh6sIDU6RAuBeXmZn1N3upxyAQ3+j8pFoOXPRN4Pyj6yLFomCFDdr5gIh2EL8
         RKEqnSXsm6VQnTogvS6ylg7AO/SKf13amAA6sYUhTa0ys66K23aLlfOwh5T0dTom4byI
         DH/hhHa1G0L5U1XjJ1jwhiNTZO2Yc6npbBvbFqt5eVP4Keydy3Q0xHRd3URjGb3VKE8D
         BwicJGHNzsv5u99B4tG9rYE2w77VKSYcjcJiHGRZDhHzkSNujqvSOBg0CyTMsD4q3BWd
         Ak+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=q9AlG6+FXP1n91wl1O/VJALhCvFdDSzdm0zLyKo33M8=;
        fh=aIiGSz+HW8zsY/dnv6793V9aUIRBjqMNPa1qe+G5ZaU=;
        b=GgiBvgo0DW6i01oxE9OlXKhB6spu+Lin29i141mPVfUS0Oe47JVW2DYD9yupSWHMbr
         S6CXP6eteFBRzVpNIithhIsBW8H288MnwIfHZiFdH77gpZ/kp3dO9IZCGCaP7rG7axp6
         ktoG0gfxbvOf+3zc2CBV5fhtQxHWfBLePONsbJm+CuuzQ1UgsJ77ZqVhcCTKfi8ISOM5
         E7XPGQSa9MstxWUpFQabjsy3otg0rjdZ1Ye3GV5w8+nv9EZvAtDSz9QixbFzAnZJL2gt
         58s8oenm6tC2dumYTrE1kZwic0avlu7h9mxgdVWe3pQnZc+RsRbXy61ydP27JyM3GvoO
         zH/w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FL95AWD2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-447f9b23cc5si24457531cf.223.2024.07.09.06.46.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jul 2024 06:46:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FL95AWD2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sRB9t-0001kc-1r; Tue, 09 Jul 2024 09:45:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sRB9m-0001gb-V3
 for qemu-devel@nongnu.org; Tue, 09 Jul 2024 09:45:24 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sRB9Z-0002IO-4B
 for qemu-devel@nongnu.org; Tue, 09 Jul 2024 09:45:20 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4266f344091so9551425e9.0
 for <qemu-devel@nongnu.org>; Tue, 09 Jul 2024 06:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720532706; x=1721137506; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=q9AlG6+FXP1n91wl1O/VJALhCvFdDSzdm0zLyKo33M8=;
 b=FL95AWD2wYVuyQVLlGMm8l1cHPhAZ+r33Z1svLZV7Qrx0sgMAKPqWoUg5MFYrJ2zGh
 gkQ1rNjy1Nao3j6RHMmaiEL0YHSLqWwg0xzkJYiMSh7SGQ0gJX2N6+u0CxRgUh03AZSb
 CUxJfVXhPZTtI0nrSWnyvK8UTth4hRjO7uAZn8sXBa2vgur1WRfz1Bt4jIE+nRrfxkKt
 erjfpoFtMx3RmCEs+Nt+LRErQmfnbQygSQFfjmw2QC1XYT5ttejEJY7aOe5gv4zX6CpZ
 NuBFfGhowk0aiU8K+IgVMQ2lO0FME1avgtz4Ms+6eeR61MOJAMfQY1fbyk++R+3Uw8+V
 AcMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720532706; x=1721137506;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=q9AlG6+FXP1n91wl1O/VJALhCvFdDSzdm0zLyKo33M8=;
 b=Lk/QR0E0pKAxRpbOo9M9dsNhvxibp9YjezKVD0teuXY42sJPuO98aR3/JlROJ4FdDF
 3StRTGzfvScyHyhVDK72U14Xbn0AflD8YXnOJeWggDtkbWcenuoRMMsCv0+kRvzfW+vc
 JULz3rMZVLb9qQohgjAP3SIjSIejVZCg87IlKwDz+7KEBm6hV08RJrSe1oLeYXcS57nB
 GBOCDUXBi/1rWQtio1h5BaIMA8RLkf8ksYMlReJXdLYiQ3U2pktWP9leWqBtOAsIYQOe
 zfY2Pv2D+uL3LDmiZWGCW8LP18Zom16Sq89m+uqscOPjAmdZ2b7Bdacb7fvfKU2eNaQl
 jY1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOLbKzLeTYXVq6qKhsWcAieYWET5NyX3ImnC2y8hcOBB9+58P9kZouz6X+bE7CbTN2mPFBYeeDZhvqNacs4WE/dd1nu68=
X-Gm-Message-State: AOJu0YzhqbDEsw8At3HXYi3b19aIALLmYysWlT7+It0DABA0XeWJVP9g
 +F8o+aqFAw/qttsl8zjejCQ9qPO2mdBhF0eSIK7TERuoo30Qe+LurliGD5oep+iQKorzOuo/m8L
 S8WU=
X-Received: by 2002:a05:600c:2e14:b0:426:6573:7058 with SMTP id
 5b1f17b1804b1-426707cf7damr16443825e9.11.1720532705803; 
 Tue, 09 Jul 2024 06:45:05 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4264a1f22acsm210426605e9.24.2024.07.09.06.45.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jul 2024 06:45:05 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/2] target/arm: two LDAPR/STLR fixes
Date: Tue,  9 Jul 2024 14:45:02 +0100
Message-Id: <20240709134504.3500007-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: MB8XspJthDrG

Patch 1 here fixes https://gitlab.com/qemu-project/qemu/-/issues/2419
which is a bug in the LDAPR/STLR-immediate insns that I introduced
when I did the decodetree conversion: the immediate field should be
signed, not unsigned.

Patch 2 is an unrelated bug that I happened to notice when I was
looking at the code: the LDAPR-register form incorrectly uses the
stricter check_atomic_align() rather than check_ordered_align()
(a bug that's been present since we added the FEAT_LSE2 support).

thanks
-- PMM

Peter Maydell (2):
  target/arm: Fix handling of LDAPR/STLR with negative offset
  target/arm: LDAPR should honour SCTLR_ELx.nAA

 target/arm/tcg/a64.decode      | 2 +-
 target/arm/tcg/translate-a64.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.34.1

