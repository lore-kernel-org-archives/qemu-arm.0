Received: by 2002:a17:906:fa94:b0:a1c:d2de:9065 with SMTP id lt20csp1703626ejb;
        Thu, 7 Dec 2023 07:46:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFZfLNuVN93MNVPmHEGNj8l3qsek61TcyRetiGrkvsrTdNM09ijN/T0/Ob9Lqt//ORz7DFF
X-Received: by 2002:a05:6358:9f83:b0:170:17eb:14cb with SMTP id fy3-20020a0563589f8300b0017017eb14cbmr2526715rwb.59.1701963968525;
        Thu, 07 Dec 2023 07:46:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701963968; cv=none;
        d=google.com; s=arc-20160816;
        b=JcJwaSGO3zEh7keFyyvUZHo8OABIYyqL8hYxDPR6gapJNJ1rVAae6ijWR1gFKMywMK
         iHSSGRDNeZXXpzEmF8Aaimgx418YaMNM+D/Y2hCUCCO/QHczLjFgEBjtUCSmp14hceJE
         OjzI2r3rc0ThexS71vupzo8zDI2rxTB/223kDbeKF6ZtF4pDGVgBb1CpXYa0OpMI86B0
         w29Hza03xEzEJ9btRPc6oxx2Zqn+BILVMCG4MrNfD79pu9WiSv5Y2fliw8RWwJtfzky4
         +Ttt8Db2VLv317cmKDpMTI8RgqXR1VW96X7AsDLo9uPAU3Ljk2/xowDbpbkOtXsrTDFK
         Tamg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=qIgSJSXHt73pYKp369uQ7oGZDAJNmZg50+PsPECtSzM=;
        fh=A8ftaDMzewcMA0xKw++MSYMuCBPymoWdeCEx+9KcU8w=;
        b=x+6woZVB4pttXgc2v6J1agPtIZuUyDf12OIeKjNQt82bw+7mD9yiECz6R3YmTyvB2p
         4eUzSFByMgz/YZ2VsW3FGoXn+qM3b6fdiWNh8gS0WjOOJOnBNVxQc0SkBkPEQt7f/yV/
         jGST+7NNHchLAx4qWkaAbGVXJmGEqHkoUNzO6/+SBLd7Oe3U+RlPMfGX6CIHEZBPw7Lv
         xqmrlQeRXFWR3SnwhuxvdZmHK7xQjOPJ/b95EruofdiLu7t5k4DiSAD4uAlWWOEDMEa/
         lfnp2fsDSNirKd2J2rNnLI4dqxQuSgBpH6qpUxvi7zgOl4eakdo2VDGBEHwGITFDV0TD
         KTwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yPmOcxmt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m6-20020a0ce8c6000000b0067aaaf41fdbsi1473628qvo.218.2023.12.07.07.46.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Dec 2023 07:46:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yPmOcxmt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rBGZa-0000dD-M9; Thu, 07 Dec 2023 10:45:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rBGZZ-0000br-1S
 for qemu-arm@nongnu.org; Thu, 07 Dec 2023 10:45:57 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rBGZX-000284-6Q
 for qemu-arm@nongnu.org; Thu, 07 Dec 2023 10:45:56 -0500
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-9fa45e75ed9so117809766b.1
 for <qemu-arm@nongnu.org>; Thu, 07 Dec 2023 07:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701963953; x=1702568753; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qIgSJSXHt73pYKp369uQ7oGZDAJNmZg50+PsPECtSzM=;
 b=yPmOcxmtk1uZRWr5zPeO3h132lPrZLZeOyb/rsCEz5o1FWpMqjIG5sSbC4BQgjv8Uf
 M00QUCIxBUZElgBEiDgoJOxlJLvnsTeltLPYQ6117WFYn0b1PccxkUMwWlgXKrSgQ/VV
 lQC0ReU0jn0C+5vuS75V9Mk0leu7Fear5HPRmEf4oteeIzDTBnFDa4csdu7MckFIWKyS
 nMABy5MDbI5GVVX1sHk8ITg4DbNxyb0ceBOTYCO4dNhiR5Q9DDtWal2/xwacAupZ8E/M
 tPhvklDURjArcv7/2tZKVXgWt8YHTiCgvTAkvo6u5NcISB3gsm3igAgqKSawX76SQLDy
 UtGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701963953; x=1702568753;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qIgSJSXHt73pYKp369uQ7oGZDAJNmZg50+PsPECtSzM=;
 b=QosPZuVIXTiuhF+RT/Z4c8OJ8IoE16HPRDzBpwtRQmQn1Q35MtASgZrQzztx2+5q3f
 js4gmgET9FLDXZ1GYovNEZYU29a+s4wXh+f51NnqDUx30QwyIGzzYFSimDF+tHqyk7l5
 IKvsD7e8ZaouTbwqvU6P2iAg3fQODpKeL4tnvrNsOy6lpGB3BicR0oMIaFCEpysjIkUy
 B69HGaVI33j/PeIWW3at2py2hHnjaekYvG3JxdK3IT1o4ivS/KkId9Wreq7ezRFmNxMf
 C92IijHBmMI+7fm4zzvrIbuiFVgE3PHUzOgu9baj+7qjeshq2wLorUitPzfLWvwBEF8O
 4rrQ==
X-Gm-Message-State: AOJu0Yx0bzmzebN85k9AmCFE+B2N4qRUgT3/Om6YrJZmyiWX7yEhhe3B
 wiOBWmj0bWrwSr5kTSoCdFfdCg==
X-Received: by 2002:a17:907:ca1d:b0:9be:7b67:1674 with SMTP id
 uk29-20020a170907ca1d00b009be7b671674mr1542810ejc.3.1701963953651; 
 Thu, 07 Dec 2023 07:45:53 -0800 (PST)
Received: from m1x-phil.lan ([176.187.202.111])
 by smtp.gmail.com with ESMTPSA id
 t15-20020a1709066bcf00b00a1b65249053sm969126ejs.128.2023.12.07.07.45.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 07 Dec 2023 07:45:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Fam Zheng <fam@euphon.net>, Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 0/5] sysemu/replay: Restrict icount to TCG system emulation
Date: Thu,  7 Dec 2023 16:45:45 +0100
Message-ID: <20231207154550.65087-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: hB+LUecrPIQw

Slightly simplify non-TCG and user emulation code.

Since v1:
- Introduce enum of icount modes
- Fix ARM INST_RETIRED event

Philippe Mathieu-Daudé (5):
  sysemu/cpu-timers: Introduce ICountMode enumerator
  target/arm: Ensure icount is enabled when emulating INST_RETIRED
  util/async: Only call icount_notify_exit() if icount is enabled
  system/vl: Restrict icount to TCG emulation
  sysemu/replay: Restrict icount to system emulation

 include/sysemu/cpu-timers.h | 22 ++++++++++++++--------
 include/sysemu/replay.h     | 11 ++++++++---
 accel/tcg/icount-common.c   | 16 +++++++---------
 stubs/icount.c              | 29 ++---------------------------
 system/cpu-timers.c         |  2 +-
 system/vl.c                 |  6 +++++-
 target/arm/helper.c         |  5 ++++-
 util/async.c                | 16 +++++++++-------
 8 files changed, 50 insertions(+), 57 deletions(-)

-- 
2.41.0

