Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp153508lfb;
        Tue, 24 Nov 2020 20:06:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwAYlp+m6DZ3wj6oq39kanlt0XevalzIBu/Q85QGk+cs6viTw/wQVw5nsfMnE38AsRbvQs5
X-Received: by 2002:a25:e7c3:: with SMTP id e186mr1781825ybh.365.1606277218910;
        Tue, 24 Nov 2020 20:06:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606277218; cv=none;
        d=google.com; s=arc-20160816;
        b=Oyx2YctHiFkrJvBCbQhmLxEuTv/F1fizj1ynW18dv3C56p8FYJURXAPx3tGlZzmwlZ
         bj6MXYYwUVv0v19kTVL1AwdADJsiMD4r620MPe3CzSxZuA8bbRppQ7tG4CSpo0VY5Z0Q
         wp4ORgCCbvRx1UM257caurYTT9megVgvG25UkEKc6uuTRvBWJCmBxTt/2lG2nrrSj0E3
         Vixgz/Et5+pSXUGjIRBFUYkxajb0nGlUdTSU4emt7Q0QDFwKWEOrnpfuXIz1uW5WDMqe
         eBufPbSMJ1bCglzYfkWj/4zus7+1iA1X8luN20S4AcU3ju3mKj3uQd91N/vkqiwDZQSM
         GuCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=6ya5vofU6C1QM+kvPyUyuEWbvoQt6UR8CMi/DgLk2T8=;
        b=Gsyng292IT/wWQWZS9U5e8sBN9mjPDQEf3sKYXlJ+J0aX52klCx4tbLvd4axKeEoDc
         iNmd+K6tKd3RaWfx22dJfkaW470aJ/BImk9ml27EDcveyxvDoIYkk+uwe6K7+e76KvfF
         MmSslVQ2gvDgrmNW/LajD1IRKUsP39vEJKK9CMO7839lwFaYQd4LtZ3WWx3xrGVgUQPF
         j29X/mdvwuiwvP8vRgBMGKFsvKWdTOGB9UTTjLApVR8mgnwwakWpFsstReWlqqqbKhqS
         BCvSQG1QglFem1/Ns4AZwk3uzkk2fjOROteFGdtOpRMgy39WGMohfUoMnranVVQ3rRy2
         /NuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fXwrbVVc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a73si1178114ybg.279.2020.11.24.20.06.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Nov 2020 20:06:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fXwrbVVc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1khm54-0004f8-4q
	for alex.bennee@linaro.org; Tue, 24 Nov 2020 23:06:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1khm4u-0004ep-Oz
 for qemu-arm@nongnu.org; Tue, 24 Nov 2020 23:06:48 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:36394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1khm4s-00060Y-S7
 for qemu-arm@nongnu.org; Tue, 24 Nov 2020 23:06:48 -0500
Received: by mail-pf1-x42a.google.com with SMTP id n137so1107595pfd.3
 for <qemu-arm@nongnu.org>; Tue, 24 Nov 2020 20:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6ya5vofU6C1QM+kvPyUyuEWbvoQt6UR8CMi/DgLk2T8=;
 b=fXwrbVVctWGegyVHO5mu2f5hLPiYPtZbFnAWt4ip/6nIFHV/xR5lFLxs6k985JrzXZ
 SYpeG4N8RRC8us69gECHMlyWidenlupeX09VCXJGmsSoqh+I+vfE8FR6s8jILx8gBads
 Z/B0wYx9gjNtvhZwhpdXWGLICq/ALlGopTJdXLiq1ZdhT1np+PuWC8LJ6WI+oMIyBYMy
 fiLbi9yFOsWaewGM3cX+5OshNFYQbkr94ShhFuc2xmcrFRBryCw3PSLwUF5SGQzyDacX
 hWbUrhpWgSqoVtVlECk01zLLeLrIAdhgmPrY8upWu+g8jZWn1c8eJi7U/hJFknqQBxfe
 GPXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6ya5vofU6C1QM+kvPyUyuEWbvoQt6UR8CMi/DgLk2T8=;
 b=akPb8SftaB8+UmjbYT4Q48+Te4EuLdisSPJqEhQyRpHLJ3pA1/YesubHsCLDhgF4Nc
 C9s0L3ujOAOEY1aLkbC931J8DNzxko5Jck//XpRhyZ0F6UF1oiTVstoJw58nVflahUnQ
 DsnTD6Q28A4GHiE0TTGEzb4yH1BKB5nwHhls/Q6RFMk+Hw4F/xmjaGJuLlu3qFAAOkP7
 0UzQLlW2CuNAlJf4EfGIH0VNQyaMLPzByIRXPk+kFKvtoi6RzajxitBXkgfBSE0SlnJI
 ICckYrVHwh96jdMuAWY2c2GFvND4wG2jxjMUL7kZAS7N3crBasFEkqMW53QKYkMkIqa0
 oZ6w==
X-Gm-Message-State: AOAM531SihtP4gkZy+BhtDVRE+4EwRI3TuEWW6Q1QbswViLf5LYm8rea
 9fxpB0w9q0BVDb1lONHgzHA0kA==
X-Received: by 2002:a17:90a:5d0a:: with SMTP id
 s10mr1863720pji.160.1606277205075; 
 Tue, 24 Nov 2020 20:06:45 -0800 (PST)
Received: from localhost.localdomain ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id f7sm447806pfe.30.2020.11.24.20.06.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 20:06:44 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.0 00/11] target/arm: enforce alignment
Date: Tue, 24 Nov 2020 20:06:31 -0800
Message-Id: <20201125040642.2339476-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WrtFYwaR7bgI

As reported in https://bugs.launchpad.net/bugs/1905356

Not implementing SCTLR.A, but all of the other required
alignment for SCTLR.A=0 in Table A3-1.


r~

Richard Henderson (11):
  target/arm: Enforce word alignment for LDRD/STRD
  target/arm: Enforce alignment for LDA/LDAH/STL/STLH
  target/arm: Enforce alignment for LDM/STM
  target/arm: Enforce alignment for RFE
  target/arm: Enforce alignment for SRS
  target/arm: Enforce alignment for VLDM/VSTM
  target/arm: Enforce alignment for VLDR/VSTR
  target/arm: Enforce alignment for VLD1 (all lanes)
  target/arm: Enforce alignment for VLDn/VSTn (multiple)
  target/arm: Fix decode of align in VLDST_single
  target/arm: Enforce alignment for VLDn/VSTn (single)

 target/arm/neon-ls.decode       |  4 +--
 target/arm/translate.c          | 32 +++++++++--------
 target/arm/translate-neon.c.inc | 63 +++++++++++++++++++++++++--------
 target/arm/translate-vfp.c.inc  | 30 ++++++++++------
 4 files changed, 88 insertions(+), 41 deletions(-)

-- 
2.25.1

