Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp775212ejj;
        Mon, 25 Mar 2024 08:29:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX9cDR9e+7oVQnvpQxidEE9WBRFipcenD+QkOPgaOljCF6aPphWFKrWoJbnt2CXx6DpPsiBjcSCCX7a3hvjGCTaCPY3EBbz
X-Google-Smtp-Source: AGHT+IGgCD9CybWMXGNK0j2yWoLyfWGhFgl7MVGqCiGQNWgf0ifyUZuP463zhU3wSOu0qmxgbb4y
X-Received: by 2002:ac8:5a4f:0:b0:431:5f25:d316 with SMTP id o15-20020ac85a4f000000b004315f25d316mr2199970qta.19.1711380561286;
        Mon, 25 Mar 2024 08:29:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711380561; cv=none;
        d=google.com; s=arc-20160816;
        b=LPXo0nQLxT2VJawKP/5N2R5ETB6wzl7G8WYTq2Vob8s6uqfDZXkzDmR8C38ZjI8FxF
         DOjSLyX6oROVeDuDrTD/b1suBu6CwjxRp79nuLbpzVvsLdcQszNGId9ekveCEFTfQzF5
         a6pgBwo1akEAhz2TrHzy3oky+1CYTVnt+ec64TFRbzMmTOFJmDAX/FENra5q+O+jjrzy
         7oPobM50gwwUOhhMh7WPhp2Jb3wdEVu/c2vO8qFVNuu5Q0whZN7C1NwCGa8kzr9Sd3bB
         IYVOzeDu8xhLaF9G+Ok6QBs5jDgULM2WXUWhFKTFqNSwRxzm6gbakyygm2Da63MUh6YJ
         HqJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=TCoF0Ik2WJOdiDikaxpQR9jUBlogBxY6ArmfBRiXluk=;
        fh=Hv6XT3ucCczLoyAeOmfm/4MRQVDFq58PMFC+XPl/kt0=;
        b=gLPgZHFB2c7N6dN5/gktqF0glFWwkVbPSNDCby+O9/KpsdkTs+TJ9NVtWXeRrkv8d2
         3e4zzZyuDjO0+6lSgHZztgdHK+SfIfD/N/mMqjD6aJctIhuXj0NC680cq8vda/utdkfr
         D2raSPlfNDzFq6r0NlHQliavK0cnKCphiKgj9R+hap2d5MUSRzlJuBGzS69mmNR5bc9r
         VylBWZQibJ17meKx93lR58khbLJ8G7HOjX5UeLl/x4ioU3CEVjiYziLoliLugedXE5Z8
         W5CYsnqI6B0g7IzUsItHiPCUomZZy08hntHcgJYlSLxfvfjALjYkrVsHAlVDlOAoffI4
         IsGw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F3+kZXes;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u10-20020a05622a17ca00b0042ef82bb7d8si5649295qtk.506.2024.03.25.08.29.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Mar 2024 08:29:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F3+kZXes;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1romFW-0002iD-Lc; Mon, 25 Mar 2024 11:28:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1romFV-0002hw-BT
 for qemu-arm@nongnu.org; Mon, 25 Mar 2024 11:28:33 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1romFT-0000EJ-G4
 for qemu-arm@nongnu.org; Mon, 25 Mar 2024 11:28:33 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4148c65e890so1457025e9.3
 for <qemu-arm@nongnu.org>; Mon, 25 Mar 2024 08:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711380510; x=1711985310; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TCoF0Ik2WJOdiDikaxpQR9jUBlogBxY6ArmfBRiXluk=;
 b=F3+kZXesV0U7HLq97j6uR1pPmQIwFdk/6BIVMoBjd2pC7PbcN+HfsJOmgpPZMQFFuW
 k0MlIlgK7kmBT5d+CUHqDmKcwBfIpLMar79bVQBXhsKf0uVaNThf3MUbgCr5gf44wkxG
 K6V612JhtH6kkRwZqCYxQuBVExhgVXc2CHN9my1Ko+lPg8beZO8MGxMTc4GqzdlONBZi
 UzRjyXrTRZOvWYK8I3rXwVM/f8hUXpeez0OVh+Im3JHsb7kzWsuRivaWTyJlBnNEuRRw
 acycl64UWHiTYyoSnLVL+p0DGm4WBxfdJ/+NbPPPxQhaLzB8zs5wjZ42dCTZIR6AO0AU
 Expw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711380510; x=1711985310;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TCoF0Ik2WJOdiDikaxpQR9jUBlogBxY6ArmfBRiXluk=;
 b=m5JB6i3M1i5Zu1Q8R80RJr4Os1wMClr0smav/0vnVuqkAf8TIwoIyzUcaJ/c3SYiIO
 VyBdZ7zua3FgbK45C1TNjxHrVXiPdbzZ3D+sUeGzYVe/Cx9KiUqrSde7BzJJaw8Ju8YS
 tTb8v5HBXDOQPQItKRWvKKQvNQJgLm0HAAC6JKychJB0m78XfHaT6GAHfGtjfZlId6fv
 COnzJD0BIg3BUcLYo6zn6QpS3kFUw33JX4GrbtpLExogazVG1dh7ZtuWbYKFUn4DXx3e
 KmZwC2nOaRglhYnUyiRgc4Zs4yL7iNacivjQyEDYnh/XfjapbnByYdtcQI17tG2IZu7c
 q8Rg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdF5dPn3RrtCdScoS7+oBcYrbREB6D32rsjSUeg66q1oSkcUIABDMrRuvXcxtMLvtrjO2kmIg1yPGN5oIboLzGfCGN
X-Gm-Message-State: AOJu0YxAVbcCw9qHMja+pP9JWRfsslk+HYbhvL9K54237NcfSEfFgsov
 E0ZidbqEik1Hm1Lk8LpkTkTjqPzoS3xc9xI5VswlfsMQOn559CsjYLmVCxcIsnI=
X-Received: by 2002:a05:600c:1386:b0:414:9fa:1da2 with SMTP id
 u6-20020a05600c138600b0041409fa1da2mr5053391wmf.15.1711380509796; 
 Mon, 25 Mar 2024 08:28:29 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.208.214])
 by smtp.gmail.com with ESMTPSA id
 q13-20020adfcd8d000000b0033eab3520a9sm9740497wrj.43.2024.03.25.08.28.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 25 Mar 2024 08:28:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Damien Hedde <damien.hedde@dahe.fr>,
 Peter Maydell <peter.maydell@linaro.org>, Luc Michel <luc@lmichel.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.0 v3 0/3] hw/clock: Propagate clock changes when
 STM32L4X5 MUX is updated
Date: Mon, 25 Mar 2024 16:28:23 +0100
Message-ID: <20240325152827.73817-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: yfRspD/XARsu

Since v2:
- Simpler approach

Since v1:
- Rework API to only propagate when both clock_set
  and clock_set_mul_div modified the clock params
  (Peter & Luc).
- Use that in zynq_slcr.

Per https://www.qemu.org/docs/master/devel/clocks.html#clock-multiplier-and-divider-settings:

  Note that clock_set_mul_div() does not automatically call
  clock_propagate(). If you make a runtime change to the
  multiplier or divider you must call clock_propagate() yourself.

Fix what we forgot to do that in recent commit ec7d83acbd
("hw/misc/stm32l4x5_rcc: Add an internal clock multiplexer object")

Arnaud Minier (1):
  hw/misc/stm32l4x5_rcc: Propagate period when enabling a clock

Philippe Mathieu-Daudé (2):
  hw/clock: Let clock_set_mul_div() return a boolean value
  hw/misc/stm32l4x5_rcc: Inline clock_update() in clock_mux_update()

 docs/devel/clocks.rst   | 4 ++++
 include/hw/clock.h      | 4 +++-
 hw/core/clock.c         | 8 +++++++-
 hw/misc/stm32l4x5_rcc.c | 9 +++++++--
 4 files changed, 21 insertions(+), 4 deletions(-)

-- 
2.41.0

