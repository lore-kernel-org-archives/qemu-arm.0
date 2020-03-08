Received: by 2002:ac2:4942:0:0:0:0:0 with SMTP id o2csp5885085lfi;
        Sat, 7 Mar 2020 17:30:03 -0800 (PST)
X-Google-Smtp-Source: ADFU+vtIncI87xed/umEI9kdUg3Qjymgt4iGr9BD5jJQrsG6/tcLcCyWkcmL48FcTzFkojuIlYzX
X-Received: by 2002:a37:a50d:: with SMTP id o13mr9204625qke.37.1583631003708;
        Sat, 07 Mar 2020 17:30:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583631003; cv=none;
        d=google.com; s=arc-20160816;
        b=VUEyfucWzNrR9J5FzCYp5aUyEUi1knsv1Hg/7eRifFK6cyihezEam63jbhVTZLiueB
         jVp1IN5Yh6mJmB70ka5Jm+LgRdNgDi7CrPMxxN2/rIPFlPFyrBg2XeQh2ep7MjEEJe1m
         l+ThXBP4Bf+vRb/VAYg2iKUnObLlCNekUEgW2ep3/oQNP6aabep4yNO7UNlhooT48Tga
         VkUGigpdLA9MRYf6dOwfh2RT0XF00PiE2yCx1qdv4v2Y7+cG3lEj98+p/BsdTkD18k4a
         nw8zXnQRoVKvZ2p7NoamuvQrFf7cbWQsJ8JMemxVyCKXFPmqU9i4nTvidQBOYtMmKufn
         h2mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=wo/STEifr4nmC/0JpTEtkvLorS3QUThlr96fAb4k+0Q=;
        b=zlKS59yTiNKHCKpbGr15lNeELsg2fa+5K8kZXAqhgRkGo7czQxGFD5yR6a7lvgO63W
         HyOyYKATyqCxxzTEQsUUMzGXqZAp7VQBUs6O0agtMVOJ56gOIH3rPdzzcL/6q1N1mX8y
         1RIjAIBep+xqoviOeZhnN2CJh4B3xVh4bJJCqi2moEaxu3Putf5/ln9ziICuNr2ScBUA
         2clG+mB4TIy0Wa40Rogb9bJf+R6rcRZg3wfc4nhObPj/3tsGMX6mcCZUzjwa3rc1sFUU
         dpaPblNHIV9b/eLlJp/xQhrCbyoy76gV0LgMkOtzXenv0utw9cEP10eeffL4LvH5PlPO
         M+TQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bSEf8TIg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w24si3773641qtb.14.2020.03.07.17.30.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 07 Mar 2020 17:30:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bSEf8TIg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jAklX-0006pm-1s
	for alex.bennee@linaro.org; Sat, 07 Mar 2020 20:30:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57937)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jAklM-0006p8-O7
 for qemu-arm@nongnu.org; Sat, 07 Mar 2020 20:29:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jAklL-0003qM-Lx
 for qemu-arm@nongnu.org; Sat, 07 Mar 2020 20:29:52 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:38822)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jAklL-0003pa-Fk
 for qemu-arm@nongnu.org; Sat, 07 Mar 2020 20:29:51 -0500
Received: by mail-pl1-x62b.google.com with SMTP id w3so2526584plz.5
 for <qemu-arm@nongnu.org>; Sat, 07 Mar 2020 17:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wo/STEifr4nmC/0JpTEtkvLorS3QUThlr96fAb4k+0Q=;
 b=bSEf8TIgp2EQdgsHPDk/JkLSeAVw0u/t2cUQk3VV+B0z5CSxrnhpm3BeDO55+AZx43
 oh5CEyoEPIEFtent272LOWWrywr1RfNoX7j89oYKbBCdcYEMBss8jEXv42b3EHRGbD4m
 YvaoLNdpEkI3+mKzqdhCdNsYslE5xCueG8AOXuVXaK+4pJcRm/ur04oodWyLtlJ1XyoS
 JpqRPCuVbx5zClyubMEh/d4UFyOcHKvEn16kJcYrUpFcHOCEDNzYDqJ2nc13Ai/oNvCp
 SHzyfnurMkm1RrRNrUZZgoHXDzhl0JcvEuablqJzvrKeyyY90Td5oZpXgukQL4KIbeoj
 Uvtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wo/STEifr4nmC/0JpTEtkvLorS3QUThlr96fAb4k+0Q=;
 b=RanqJ6oQ+U4w30Yzkk9kFfWJ6iImmeJt4QXQdjrKFOwFQkUuVWf4+9JD+hVZMcb8Wj
 lYG7lY+aQHxL8EsmT6Em8OexRfNyC6595UllUJ76vG2ONKEQ0cp1NkPjVvzlYlXAutVX
 9BnMvn8Pduj6TIgxOk5jj7czIYX2EEd+IWHiQoZCMXtZDd4q0j9RcpvmswTAdu7cEuyc
 2W2L+AVnj/iFl/D0SEstzW3x3OCjz2oSAYbSYVHFduQrqNhmNHcCKJ3U3kQmBFhKNJB9
 GOo6eBOve+NhODee55ptfrCc84MrEphEYeY1A4IvcEbx5jPd/byzPP1ZXUWF8RU4sWAA
 oFrg==
X-Gm-Message-State: ANhLgQ2TJM47sHDcXESoeDxMuKzI1dWMH7OMUZy42wFGUqxyIFQrmBz+
 1o1KHFd5EWwSTGmCZ00ZCgz1OA==
X-Received: by 2002:a17:902:a511:: with SMTP id
 s17mr9408207plq.317.1583630990251; 
 Sat, 07 Mar 2020 17:29:50 -0800 (PST)
Received: from cloudburst.hsd1.or.comcast.net
 ([2601:1c0:6100:5580:6886:21be:91dd:78be])
 by smtp.gmail.com with ESMTPSA id w19sm32636891pgm.27.2020.03.07.17.29.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Mar 2020 17:29:48 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/2] target/arm: Misc cleanups surrounding TBI
Date: Sat,  7 Mar 2020 17:29:44 -0800
Message-Id: <20200308012946.16303-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::62b
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
X-TUID: fS6sjqO1iQk6

Changes for v3:
  * All but 2 patches are now merged.
  * Use regime_el to determine aa64-ness of physical memory addressing.


r~


Richard Henderson (2):
  target/arm: Check addresses for disabled regimes
  target/arm: Disable clean_data_tbi for system mode

 target/arm/helper.c        | 35 ++++++++++++++++++++++++++++++++++-
 target/arm/translate-a64.c | 11 +++++++++++
 2 files changed, 45 insertions(+), 1 deletion(-)

-- 
2.20.1

