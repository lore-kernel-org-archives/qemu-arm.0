Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp8336213wrv;
        Thu, 8 Aug 2019 13:26:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwloi+dM+TwzTxG4/0cs/QipSTaTx5UfaI8D3LOsdBJke0CLGQiUYQ8ocXjCKuAOXw0WAkZ
X-Received: by 2002:a05:6402:789:: with SMTP id d9mr554803edy.25.1565295989528;
        Thu, 08 Aug 2019 13:26:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565295989; cv=none;
        d=google.com; s=arc-20160816;
        b=JCi2BNqIYm6k9ZMlrIez76X/RA1xyYlloEJ+j4ewMrg/8g3sopZUPckH8nF5BXtyDn
         oqCW2hXikGvqbW4P87JzpH3JQBUgeGsvwEpIkXevwfwOc5xsIjRwO1k6OyEvgfoNuocs
         Fg+Xnz+azaAUyTCgBlniIAc3O2/M/jOyM4g5Dhp83pF6jN5+e73/t7Eb9wfUiZgaYDZS
         sniiISZenNcYkoSuBxyDcB3KFEI5ITWNzJNllmh7mKrOGklUUjYcKWAHmpf3oYymu/QS
         X+WjhWL2yVjXU2B9nbFTG8F0+K8gMWqjbLIdG9j02qwwMROONT2bwPXlu95xT28/zvyW
         b01A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature;
        bh=E+V3l19qjvp2GyZbaaWVRKF84AAkyJUqeZHB29ZNbdg=;
        b=0SrfycvHUMpve5xLOLkS0G1Rxg0iC+KUJeWLnhz544BQHqox9RRyIEGN3tW9a46TeN
         BiKVGBuT7HbefJV3+VCR/mxtAZAv4eZG07TuhjmISU6V/tbhJACQcBqYVnGjHJlhI8kW
         ysiDY3PX+U0YzapO4B0HdmersNd3nh6leetaR4zZdxA97kv18unXJicNfC2hGIh5xDU2
         s/6Q4S8PCIr2wJcgyh3iAXX+AllfWPeZuiPxbmwZI97KVW0/fQkHxMwkSjuwxRbRloNZ
         BDChXaAuug8C23/zugSXNQmNW+NV5X9mTh9hZ0KtYz5nxK47BdgewQreBtS9W0Jk1AaA
         A+Vw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qUImm+wU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l17si36608563eda.278.2019.08.08.13.26.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Aug 2019 13:26:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qUImm+wU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvozU-0006yW-JS
	for alex.bennee@linaro.org; Thu, 08 Aug 2019 16:26:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59727)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hvozN-0006wx-9a
 for qemu-arm@nongnu.org; Thu, 08 Aug 2019 16:26:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hvozM-0001BU-AR
 for qemu-arm@nongnu.org; Thu, 08 Aug 2019 16:26:21 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:36655)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hvozM-0001AQ-3i
 for qemu-arm@nongnu.org; Thu, 08 Aug 2019 16:26:20 -0400
Received: by mail-pg1-x544.google.com with SMTP id l21so44633045pgm.3
 for <qemu-arm@nongnu.org>; Thu, 08 Aug 2019 13:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=E+V3l19qjvp2GyZbaaWVRKF84AAkyJUqeZHB29ZNbdg=;
 b=qUImm+wUxZ95+zy18eOUgcv8UXleYjqPVYyWbw0/i+/wIfanF+uklwODhr1GlgWD2K
 ZVaTaBpBFkgdEjDBgKHCg7crZDiQIjwaxZI9c1scLQhJWFitV76rxOo8pN03GDQhmBeA
 Dc/nQiMt9qFd5cyFZNkQ45HO6B1t6shw2VsArymKYWiLX97kVZQ6ztKwDOJFVgFL8ePz
 LEqxERc+3hJ3n+U7UG//0rIuQuU5N6r7qIwrOBqg1Fd0Xx3rRETU0SfN7gzAX2cEu3YN
 3lhFOLPZ5W7PQsobiGUTBuY8oISE8IBtOKvDKuFK72t10N0+orSSU0JYyCLvhtmDz12y
 J+Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=E+V3l19qjvp2GyZbaaWVRKF84AAkyJUqeZHB29ZNbdg=;
 b=Z3GwPmVnTb7+cXZNexBVNzFtaKxSIo/cvvZIcV7FGufyE4Eu3BwHzQ+zlzdwd7yN7F
 qaeZ+iy8aF9FFzeVvcss+TTR77HUWHfXJ9NR4Z5idBHJUMN5vo8FpcMiuCIpFvph+Csb
 v1IuSr263YkEgO1NlnWYi+bObmfpPcNqJr0WBL2E/hc+OfQ1NPm3CfmDQEMwNsDNm5in
 i0tGOxCGl1vR7XkDeOC9Lu/Y5AWeKYJin6GKK+oi3ihFIA+tHKa1Z8HO7APnsTltbHSU
 uemBBlnaRbRfzBAyHce0hEQoln75UPvc0/x2cAnTNqSDNEEUBo50S/HlnM43OXepDIZY
 SWRw==
X-Gm-Message-State: APjAAAUhh14uZoa5z0emeVFWhjNta7KNSmmI0O7pC0ad6Nl/+Lzk7/RL
 NhHzWEC/9Lnz6IpSxjjsYUWKXQ==
X-Received: by 2002:a17:90a:2ec1:: with SMTP id
 h1mr5870423pjs.101.1565295978688; 
 Thu, 08 Aug 2019 13:26:18 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id v12sm2850146pjk.13.2019.08.08.13.26.17
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 08 Aug 2019 13:26:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu,  8 Aug 2019 13:26:09 -0700
Message-Id: <20190808202616.13782-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: [Qemu-arm] [PATCH 0/7] target/arm: Misc cleanups
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
X-TUID: tS9pH75z7uX6

Some of these were cleanups that I was making simultaneous
with the decodetree split.  Let's do those beforehand to
make the split easier to read.

Some of these are new, noticed while I was in the area.


r~


Richard Henderson (7):
  target/arm: Use tcg_gen_extract_i32 for shifter_out_im
  target/arm: Use tcg_gen_deposit_i32 for PKHBT, PKHTB
  target/arm: Remove redundant shift tests
  target/arm: Use ror32 instead of open-coding the operation
  target/arm: Use tcg_gen_rotri_i32 for gen_swap_half
  target/arm: Simplify SMMLA, SMMLAR, SMMLS, SMMLSR
  target/arm: Use tcg_gen_extrh_i64_i32 to extract the high word

 target/arm/translate.c | 157 ++++++++++++++---------------------------
 1 file changed, 53 insertions(+), 104 deletions(-)

-- 
2.17.1

