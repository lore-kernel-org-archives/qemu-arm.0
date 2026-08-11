Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E273C5AC67
	for <qemu-arm@archiver.kernel.org>; Tue, 11 Aug 2026 19:15:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wtrwx-0002FM-6r; Tue, 11 Aug 2026 15:15:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtrwu-0002F5-R4
 for qemu-arm@nongnu.org; Tue, 11 Aug 2026 15:15:44 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtrwt-00027y-70
 for qemu-arm@nongnu.org; Tue, 11 Aug 2026 15:15:44 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-38e041ea211so98185a91.0
 for <qemu-arm@nongnu.org>; Tue, 11 Aug 2026 12:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786475741; x=1787080541; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=PSytBMJaQ9G9l9syB4XOENPGWna1JnjRQcf0lvpH1T0=;
 b=RZsOGAopDBwGD+nU3+fYsBxSfRoQ1Zk2wJ6/1H+5Is0ubaIWc+2T/EmjMSJ2rel5mL
 vV7WOjr3ZfNb/1EmVlucVs6rG7O2AgRJ51DTDcgNuphm+4pRzj53fNgcXWXX8jslPcRm
 zi3L8JFpiQpAFRhoJ29RlDdbW6M/iVKrNxmOOt2txk75TPQZbkm1ykJPbpHtb2M3gmb1
 PLhZt6ekxJPaPEzFz7Qy/SMCdSxrRYCJeeumUoXd9++BnqSfu+jyVL7ic7yR1P2C9Rvh
 SMKmi+A3gWq9AfeXiDxCaxjTM32L7A18GAby4dS2f3G6mvdqulKGWMlkVXTzqXOEEFqF
 WXUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786475741; x=1787080541;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=PSytBMJaQ9G9l9syB4XOENPGWna1JnjRQcf0lvpH1T0=;
 b=nm8AcGRZijXKm0n+yEVe7J1Uu/T/DuRzTTujT9keGzJK/dZqEYanENNN2AxEA3Nmel
 cDvmecmX5Y8prPUGFZQRMMbjuLimQwvLuA/lVXk0ukc/QIdhj0ABrQp6MDaa0ThzuT0k
 joN6ZoK9U/j62nPWqo1vAZLiatgY1nGkEnJFXqLnvYSWxno0LffJG0g2rDzX6uuFcyBb
 0Aj4kjUessrv0CBGqSdJdTjN+NGbOQBU2rFlzFFdRikwKoOPrC+wrvkXZmZuEJ44AwWn
 ar0+Vo3im7XEntlWZ+rRiYlK2JHq1LA52+2zx0kUYjsLfirp92MM4nNneS4L8DdW1EpR
 AZDw==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro5P/dL7fiji+kg784vOUJlDDiqFvS6//6nmFRMve/nRPx1a++wjAwHkN9MyuJqpknFn3Taj39lDw==@nongnu.org
X-Gm-Message-State: AOJu0Yw849KRcNXq1DDza5pzw1E2hZ/EhM+yQt81ffv3GnEa5YyzDn0y
 eihCRLnFlXCT+M8ODjOmlYiLZdhA2/8VfVypYrzoBqGorHogJ9pCwf0g0P/qce2nuxd/+SwvDhf
 zKloX
X-Gm-Gg: AR+sD10sm9zUe9eG16Z64I4j9/4ld+y9eeadufPQPad1DL3i7ayoNhCsQVPL669mnlO
 NT4/TDSJ1UXZWjqDXZSLwlDVkokxEoKY7AYkQsiNmJgZm9k9KXa5fBbuN1nMgnuGhdGz6/gGr9d
 zDtBecD9u7V8xe6zCbQfiL1Q5EJ2Oh/SrFACJ+lJl4eqejmNxufjFuITjdurEfo9oKx9X223Zg7
 J3bm5QsQZawNil14ENN/ShocXGFL1JPy0AYvb/YRioQNhgLOWcnyc5huKsrkOmYzCnoxv4PclSW
 ge6roUjLWhCsoX/q76ufLEG77i2i9csElKf4/KM6ZJcR4kjwCovwpm0KIjvsUbr0gg5722XnXAp
 230vlMVYcRAPmXO0Z37BJ8le1Kb3lNb9mYMHZloWLF4+i81eviwiUa0L+gQU3PzRHO7jwGj259D
 ieBOfszPcsXh7q5IImXqhWjG6+j7O6jFyBZA24HWpDQgrg+X+t2YpNlbsDSxsCxz1LDCsa83TI1
 9NdALLZxi79ElDQZZ8H
X-Received: by 2002:a17:90b:530c:b0:38e:e9b:ffa4 with SMTP id
 98e67ed59e1d1-392f4727915mr2357031a91.6.1786475741323; 
 Tue, 11 Aug 2026 12:15:41 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-392f97fc409sm209668a91.1.2026.08.11.12.15.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Aug 2026 12:15:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: yang.yanjun1@sanechips.com.cn,
	qemu-arm@nongnu.org
Subject: [PATCH v2 0/3] target/arm: Fix SVE2 WHILEWR/WHILERW zero diff
 boundary case
Date: Tue, 11 Aug 2026 12:15:37 -0700
Message-ID: <20260811191540.79882-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Use tcg_gen_ussub_i64 for WHILEWR.
Merge diff == 0 test with bounds check.

r~

Richard Henderson (3):
  tcg: Export tcg_gen_ussub_i{32,64,tl}
  target/arm: Fix SVE2 WHILEWR/WHILERW zero diff boundary case
  tests/tcg/aarch64: Add regression test for whilewr/whilerw

 include/tcg/tcg-op-common.h       |  2 ++
 include/tcg/tcg-op.h              |  2 ++
 target/arm/tcg/translate-sve.c    | 38 +++++++++++++++++++------------
 tcg/tcg-op-gvec.c                 | 14 ------------
 tcg/tcg-op.c                      | 20 ++++++++++++++++
 tests/tcg/aarch64/sve-while-ptr.c | 28 +++++++++++++++++++++++
 tests/tcg/aarch64/Makefile.target |  5 ++--
 7 files changed, 79 insertions(+), 30 deletions(-)
 create mode 100644 tests/tcg/aarch64/sve-while-ptr.c

-- 
2.43.0


