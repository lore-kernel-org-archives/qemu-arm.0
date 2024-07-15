Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp2061684nji;
        Sun, 14 Jul 2024 22:59:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXLzQ54E43gTB2DFgJQg6RR+Xb5E8F89P202yDK5s0AuPx2EakUh7vJupaUNhenD+p8Ykmp0tVPqcRYMBHuyTNFsuPoHpUP
X-Google-Smtp-Source: AGHT+IGDjngh9TFGWZfU3rmJWx1QT4+X+DAcxqgCdSpFvNjiHrrAnnNbnd1nvu7EXhjoKxqb03ke
X-Received: by 2002:a05:620a:309:b0:79f:c0d:782b with SMTP id af79cd13be357-79f19a78e3amr1830914585a.39.1721023150466;
        Sun, 14 Jul 2024 22:59:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721023150; cv=none;
        d=google.com; s=arc-20160816;
        b=ckJF/otfo7uGx0CDgSYsO3j5d4VLavHwWeUqicPgs/ycZ4WdvTyG1SQ9ukUk4WxP0f
         lS5ylbOk2dHg47BwLW6jxi60sqgFuv3sobAKgEUXbhkyrEq1VbRqNL/jTpHyzB5nv6fv
         6YUMo9t20OMuS6OGA8ERNABA97/kXj8QsAogVHrZkAKJP9ft45OrM90Cdyjb/X9EqGQv
         kuSYXwW/PUsB/EvATIrGTxDjEV7vh1GP3E+3fK9r8oXDXfgrg4Y+GWBePguPfRRNyw3O
         Hoxj40BYyknCxw7ZuKEJdYeunVkvxOgBJM6qCcG8DvIPnkIA1kXs50O7D7UCvTIzA7ax
         mR1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=Pue76RGo+eYbbGlezzj03dyKjEEGEgCD+K39biRfB54=;
        fh=jImhQggepTc+gijd+EhmRav1iZOkW+2GGOLPeg0CJfo=;
        b=eR+3lqpWvcjpgSQ25d7RGkUbuxxFNOkIrlr8R+I56BS84pN3o3B5Pr9Ib1yNxPVIhn
         51TBxhWITY4TmCF2J81amDoM4Tuy8ItfjO48G3bRGrFgZ3uAl0NskyFL+ZGPlu3+Ki0Q
         0V2u/ZwePDa2LoBAQCK42e+4/PmcZIF6D0/kZWy0F6wLDitPiisoySNesQDmvu2lvVpL
         64iduVvvmyf90kdggQthGsMMi/6eqk5aGJXD6pd4zjWznlsLNx3QGr+XuXbXxsMIMmWy
         DLUW7lwEdEMnfoxOa6h2aaMi0TKLA5OIFJBMDxy/bDW5LsRAiEZ+BuHimR9Hka4myXuh
         Zg8g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IjnF4rmJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44f5b7f7a6asi44644961cf.334.2024.07.14.22.59.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 14 Jul 2024 22:59:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IjnF4rmJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sTEjI-0004Rb-9n; Mon, 15 Jul 2024 01:58:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sTEjG-0004Q1-I2
 for qemu-devel@nongnu.org; Mon, 15 Jul 2024 01:58:30 -0400
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sTEjF-0008SG-4M
 for qemu-devel@nongnu.org; Mon, 15 Jul 2024 01:58:30 -0400
Received: by mail-oo1-xc2a.google.com with SMTP id
 006d021491bc7-5c694d5c5adso1879434eaf.3
 for <qemu-devel@nongnu.org>; Sun, 14 Jul 2024 22:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721023107; x=1721627907; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Pue76RGo+eYbbGlezzj03dyKjEEGEgCD+K39biRfB54=;
 b=IjnF4rmJsYXNSX/DdQL21SaJ5S/P0t3BSzQ/mSpdIw8SKOFy/KL9Cu4GyVyKgpSvY8
 2qIuWSoetNbS+7UheWdEQypjFFqJuqYKx6wJwXF5eXDCDraFc1Y9++BOom1vZ1THWdu7
 WkbaDvLkbPrWGGFMMieChCHsLUGoHE2eVRRl9Yw5BUiFAh2aRI88x1fAiwnA2H3/Puge
 ftLni9vtLMoWQ6iyWd4wfklhy3FergsvXS7WZmISo5rU8lxNNzopSDqdL9IjySXZjAtN
 NBd/SHukiClp0oS9niijU3VyhDiWuY0mCrO8RENtkUM2kpXSsR574ntJAC6FTm3H/Ete
 7AcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721023107; x=1721627907;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Pue76RGo+eYbbGlezzj03dyKjEEGEgCD+K39biRfB54=;
 b=aiecCsdjZ6UhiLpsUN5rD3np1zqCOdcOaie6hcoIl3ZY43sCnkqCKuOZW89Hfqlh7A
 5Et+C2WA9Ue/EV+du5KpxzBQqznKJg9lIF+k0SHSIS24PPyiQLsEFbKfHmZJ2qJl56/d
 y7u3+7QIjc4L413ZzwyTZfxbzJ4tH8+fk1fbTvR5ZWzXUkrAdGUr1CJrzmX6QRPk+vtt
 xj4vhMzT1FUQrKu+mTUHPczp3kplpKttPN84LAnyP9je97KGvsmfNR637dBTsiLUjRLG
 eUYjoxtvZORMVA2kAC5ZJbtX+t7Bj/PeyRsdS8jJikRGOiVK9F11ko5T4pKGBguDS1Lq
 HTgg==
X-Gm-Message-State: AOJu0YxB32sAelABzvjyGuEo1529ulWngfW5qQ81pOpuDFkGHQRkxaEy
 803XLswBFBv9nPYJaVuVMlF7hUtckLFKtNPN3i+wBncTUVAnpbdpmiWeBouUlcZZjcUtWkgds22
 ULfdsXA==
X-Received: by 2002:a05:6359:7399:b0:1a6:b034:b381 with SMTP id
 e5c5f4694b2df-1aade08fba6mr1381209655d.3.1721023107299; 
 Sun, 14 Jul 2024 22:58:27 -0700 (PDT)
Received: from stoup.. ([203.56.128.103]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2cacd419af7sm5463589a91.25.2024.07.14.22.58.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jul 2024 22:58:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: danikhan632@git.sr.ht,
	qemu-arm@nongnu.org
Subject: [PATCH 0/3] target/arm: Fixes for SME FMOPA (#2373)
Date: Mon, 15 Jul 2024 15:58:17 +1000
Message-ID: <20240715055820.319035-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2a.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: 0SG5TGZL8Ogj

Hi Daniyal,

Your fix for sme_fmopa_s is correct, but not the FZ16 fix.
We represent FZ16 with a separate float_status structure,
so all that is needed is to use that.

Thanks for the test cases.  I cleaned them up a little,
and wired them into the Makefile.


r~

Supercedes: 172090222034.13953.16888708708822922098-0@git.sr.ht

Daniyal Khan (2):
  target/arm: Use float_status copy in sme_fmopa_s
  tests/tcg/aarch64: Add test cases for SME FMOPA (widening)

Richard Henderson (1):
  target/arm: Use FPST_F16 for SME FMOPA (widening)

 target/arm/tcg/sme_helper.c       |  2 +-
 target/arm/tcg/translate-sme.c    | 12 ++++--
 tests/tcg/aarch64/sme-fmopa-1.c   | 63 +++++++++++++++++++++++++++++++
 tests/tcg/aarch64/sme-fmopa-2.c   | 51 +++++++++++++++++++++++++
 tests/tcg/aarch64/sme-fmopa-3.c   | 58 ++++++++++++++++++++++++++++
 tests/tcg/aarch64/Makefile.target |  5 ++-
 6 files changed, 184 insertions(+), 7 deletions(-)
 create mode 100644 tests/tcg/aarch64/sme-fmopa-1.c
 create mode 100644 tests/tcg/aarch64/sme-fmopa-2.c
 create mode 100644 tests/tcg/aarch64/sme-fmopa-3.c

-- 
2.43.0

