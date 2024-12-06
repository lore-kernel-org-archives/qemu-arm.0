Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp586040njb;
        Thu, 5 Dec 2024 19:13:02 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV4frnqN9Jy3gxu+Mz4WxqiUK5HGe9Fxqc677BNy6wPw2L2dEBm8yxofyx8ZsCwpi8NcF9YledB/3fFeA==@linaro.org
X-Google-Smtp-Source: AGHT+IEHMRffCjcmJAqDgc1BxSOJU8YQJpDuYRKBhMX9Rqih5zqBFAZYx8SM2m7oKTbXh4rZoMYD
X-Received: by 2002:a05:6214:ac2:b0:6d8:8496:6b00 with SMTP id 6a1803df08f44-6d8e7182294mr26216616d6.35.1733454782308;
        Thu, 05 Dec 2024 19:13:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733454782; cv=none;
        d=google.com; s=arc-20240605;
        b=dQFwa2Q+wI7r8eK9suU/XmTZk5V52jB9gdp/KNzC6+l7jFlhD9mdcVtG8F/BJNU7qX
         NTXiwmfYPnfgkm6Lq/V3Xeq0boU6sOtoq1S9+DdPv9dLaL6Rg8/E0WhzZpj93eV5cfeE
         pdR24qsgBi31VRZLuvzBXe4QhTj9vL6pGG+7H/dErdsAUXR9qp649kdwPZC5MX3lykEZ
         jGqQS9+O+zKBKW8o63UpJ2xw/HhvCeX8BIClKFAtnmaQx9HrXNQbCaLEcHmxK0u5FA64
         wNC0UIEDjlmiSPOqHIl4pAlF4WNvUioyQLW+piOFRJ86vYGpsK/aE6s9+0cEDltlqIiZ
         uzTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=P+kwPXUXhBd7tlX6IIB4yH2oiMxaqbT5fblYS9xF7QM=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=Z7UKJPRwGp8WpIsV2NrWDrpsrskLW7xBReKjSAE0PIxcvSk3Bnif7EVaprgof39i3n
         OZhwQypWecgH+Kbpf0k3KsF+cGjfn9e2G91pHP7+A8pjMxxfiP2xp7/M8j4se86/Pus6
         uXA41CxCJTaYONRzNXZ97Ya0nINvwEjj+9+l6VyWYEcX58iCwzLWwE/jlsgtbW3eUbpQ
         iGcxjlbmRbYIaAMAkHXbcz23tJjY49QUpjnAFxaPI9M3O5ZRvD4qwK5Yhqzlz/TId1WO
         dSe9PVyNClj8LrRz3Rj4PyBdAZr7bcSu2vFZQwp+cIvxMBXqOp0pMqpuDNjYOftFTMJD
         LZrg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uhnDGe9Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d8dac0b555si35682876d6.351.2024.12.05.19.13.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Dec 2024 19:13:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uhnDGe9Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJOlc-0006lp-Q1; Thu, 05 Dec 2024 22:12:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tJOlb-0006ku-7q
 for qemu-arm@nongnu.org; Thu, 05 Dec 2024 22:12:31 -0500
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tJOlZ-0004Q9-NX
 for qemu-arm@nongnu.org; Thu, 05 Dec 2024 22:12:30 -0500
Received: by mail-oo1-xc30.google.com with SMTP id
 006d021491bc7-5f1e573e65dso463449eaf.0
 for <qemu-arm@nongnu.org>; Thu, 05 Dec 2024 19:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733454748; x=1734059548; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=P+kwPXUXhBd7tlX6IIB4yH2oiMxaqbT5fblYS9xF7QM=;
 b=uhnDGe9QuiQ2Ru6gG+EiHR9R9VW5El11VoJHGY5h8QcoWculspITmnJavwJ5Pkxj33
 XlRWUuRB4sKfdN+aKdxQbjwOvqPnFWdzjtTQtnvCGqY/Ip5CEpjnu8W8qlnjEAqqoJLA
 uXWKkYBG3V1FnnYIiyqDCRyJvhqHHkvqLFrxwbRS/nVVkl/C74I79anaU7fuglFywXP2
 dn6VhIHHZcCKAvDchvc2GglShE9OFifnEgB+upwulTb2pjC4kx7JN3aYggPL9AYSLezz
 On4uE3dAhXHX5NtvizBwlm3AKR2gultJBgtHXaM12YEpm83+7dacZCyZGXM8Jjb2tPxm
 bOpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733454748; x=1734059548;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=P+kwPXUXhBd7tlX6IIB4yH2oiMxaqbT5fblYS9xF7QM=;
 b=V4ajNG5HDRnm4AV0Ll0yIGV3G7lQMQIL9Mqgnkht97Vn4L8kkE9HrNlicCBioK0Bvo
 T0be1wuBBJ8pPEBhyaM+u72eHHnFnPfuZy/ky3vYBUkhL8ndAMntLfBfK2/XZ/1vVYdS
 Vi2vLydJaTaO8ENAFzThGYdprNa2hlf70IBY57+yvjBqgpojmrXV3MjrOLLsU/kf9qdn
 xF4lZC09b2AauQK+U6y6TO3cpAQDxmqU6HqES+pyXShJqRSqUdWM3VbTuiXVcc2kedkk
 vEvAupAhTk4Div6ZMxlf+BTcoTwjb11iM246MaYuNg46Ze/bkQQF3ePS0SCTuT6+eT0y
 HIrA==
X-Gm-Message-State: AOJu0Yyc7p3N24qisBLKx/mFWgLorDe+zPJZnEs3w2QGaq4a5i9G4uk3
 pPTxH4aRorh6BTKc8AwP5sgjeWE85raVtKESy3Cdpkq97fl4K2c/H/PTmqA4lCo=
X-Gm-Gg: ASbGncvq2hqqNiAZVRbDAO2UStYX8/njyi3UROt7siiXw5SO6YYz+32digbG+atOfUl
 RSNmEQvljOEL/QysZtcJrUiArzcvqd4x0EMUSMY8RkBNHviLVwEld8uu58jrKkJ8i2PpmXuXd7r
 BfWM1MrWGIekRJj8tAUKyyQDAzKX12OhHaFPzVQALKPiTaLdJHhE9gEu15EFsGVXED1SHeAX9L6
 LHlaj9wqojmMSnEj1QZtujppGvxBNObGhOtHSvv6omJlcdN4zy3ghFpPdDaWQt+LIMP4ziU4rD7
 Kdcr3S020uDE0HNClLGuc9oUvynpVPXFI6Z/
X-Received: by 2002:a05:6830:6e98:b0:710:fef4:3c92 with SMTP id
 46e09a7af769-71dcf5c2d9fmr853089a34.21.1733454748065; 
 Thu, 05 Dec 2024 19:12:28 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-71dc493b2dfsm596442a34.9.2024.12.05.19.12.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2024 19:12:27 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 0/9] target/arm: Helper type cleanups
Date: Thu,  5 Dec 2024 21:12:15 -0600
Message-ID: <20241206031224.78525-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c30;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: HPlMt/G3tO5W

Add macros such that "fpst" can be used with DEF_HELPER to
indicate float_status* instead of "ptr" for void*.
In addition, fix a few uses of "ptr" that should be "env".

r~

Richard Henderson (9):
  target/arm: Introduce fpst alias for helper.h
  target/arm: Convert vfp_helper.c to fpst alias
  target/arm: Convert helper-a64.c to fpst alias
  target/arm: Convert vec_helper.c to fpst alias
  target/arm: Convert neon_helper.c to fpst alias
  target/arm: Convert sve_helper.c to fpst alias
  target/arm: Convert sme_helper.c to fpst alias
  target/arm: Convert vec_helper.c to use env alias
  target/arm: Convert neon_helper.c to use env alias

 target/arm/helper.h          | 638 ++++++++++++++++++-----------------
 target/arm/tcg/helper-a64.h  | 114 +++----
 target/arm/tcg/helper-sme.h  |   4 +-
 target/arm/tcg/helper-sve.h  | 426 +++++++++++------------
 target/arm/tcg/helper-a64.c  |  98 ++----
 target/arm/tcg/neon_helper.c |  27 +-
 target/arm/tcg/sme_helper.c  |   8 +-
 target/arm/tcg/sve_helper.c  |  96 +++---
 target/arm/tcg/vec_helper.c  |  81 ++---
 target/arm/vfp_helper.c      | 120 +++----
 10 files changed, 775 insertions(+), 837 deletions(-)

-- 
2.43.0

