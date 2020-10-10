Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp3413756lfq;
        Sat, 10 Oct 2020 13:37:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzVd3b4kWGbnvWBJo+3DNjWa7DDdIBY78MLE/gyPxfXFOFAbPSDZLTYITPWBQipVZg5NzGv
X-Received: by 2002:a25:e0cb:: with SMTP id x194mr24439679ybg.329.1602362279569;
        Sat, 10 Oct 2020 13:37:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602362279; cv=none;
        d=google.com; s=arc-20160816;
        b=ZdRgRkA10VHOV0qhyBQekPnP+Sy00hj3suj4pLi4y9hCyjAFLAi7iZwNHh6f0knl9H
         7kc5eudhvOSjCB7pAv48cpNzok3f2m4DZ7onO2nUYY8ITvX2jFxBPQqSrU6GBY6jorF6
         XDGvXWJchuIUPOC1oF8GyYvkj1rZojStyeGKs1F8HD0rHza1t/3jIJTLV/+A/SC3lhsE
         c53BeiZq+nrgJksXgyIInlckQiTr3lM3oGQhwlNYblexrbRA/pA+UdqnTPy/0W8waMA/
         ljZYf2xZqdjtPsdXsHQJHDoT7hL2Q911f/i7g476mxC3gMeAp/gvG3VbzN9VSLFXxRhf
         qAQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=MKLhlBcr1fnaFhXqyra0aBMsEq9q6pGWKb7Q7VW2MGo=;
        b=MjRYSt3AyH1L95Ka2soXvl80B1IGL1SKv1TqLGnwRYlljWr3nmOydQWKA22ObT5xnK
         1fd2HP4wlIDmdnyhcQ/6VH5l88Lr2IHWC4NzEPesFwsfw9exucXyrNtr1vFYB9C0ocS3
         /g/VeCVaNA4mh6zL/tXsYy3IdRGpp0f/WpsV2GYiwXIWXyPrg3j5PAjr2XfV/tcWtMRf
         9v7j1F9EJMTEf19cdP/MF7Gav+UHEUru5q+AOf7XboVyQJm7w+Zl0RFZ5ytymDb3w4Rs
         bFuusKtrtgHAOkOyIhMFNAFnmSay8oJYcXiW/2L1z4XCE3i3D+3cvlBEA2lYrl5W5dZp
         zbJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=r5WyRtrb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o10si10898600ybq.187.2020.10.10.13.37.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 10 Oct 2020 13:37:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=r5WyRtrb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:45186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kRLcs-0001yE-UY
	for alex.bennee@linaro.org; Sat, 10 Oct 2020 16:37:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kRLcC-0001wc-BH; Sat, 10 Oct 2020 16:37:16 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:33495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kRLc9-0006cU-SV; Sat, 10 Oct 2020 16:37:15 -0400
Received: by mail-wr1-x443.google.com with SMTP id b8so938810wrn.0;
 Sat, 10 Oct 2020 13:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MKLhlBcr1fnaFhXqyra0aBMsEq9q6pGWKb7Q7VW2MGo=;
 b=r5WyRtrbPZYGegLj/GPuWHRcMJLVs7l23Uih3yKEthLwKYt9OOfYF93dqSi6Kjgdob
 rQ06Yu0+rkYmN3jmrFyqfI/mjMDCZYsRvIcbVy6r6c6g/rLiAjKvuy8SUbeqrrkJ34ER
 RKa/SRbnXLD0dKbfsbWjkVRo+N0zmpyPdGk4kQ6+ZOqpXnTXFyh+iVJ7vlCo1JuS/fFq
 jvdtiGSariFzBGGNaI+QFIOml2Tr4fPMJ4rlea6nBrW3DeHfaBS2kNTSRVbJHJ7kTK+N
 1dDhgXGn9o50GrCy5G5UIwB0mtKEe3hS3oTyoZqTFQ3AZgFWY2DNSlrZ9JdB0HU+djSy
 3BYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=MKLhlBcr1fnaFhXqyra0aBMsEq9q6pGWKb7Q7VW2MGo=;
 b=VFsk6cMGk9Ev+lrMUoizEyv4MlN9cDYiXVsrf18SGmAs0R0nEVcthE6DVOSCcQEbnc
 UOI45tk2dvT8iol4MwvMtk42yU75HJTFkwKPJ7ROGcSHhvwnW64J2ELoFjMPUDg0gJpX
 4M6P68StaDQmMkggvhrr7pFIvpoE9iaQpqmo1kVHxhyDVD/Iq42oMvHhvGOQ3Pofysh8
 UNQ35VqOAJQqi7ze81woajPy9q6/o3QcxN1TqPzT79uIEn5QwbY+IeUH3mtxOFArN3k7
 Mw7o6K4OC4rvdJJSSMVeIbhh1HRLFxP0EwPxg18zOZBuG7J68t4rTAxYjiGVwicZifnM
 uDHA==
X-Gm-Message-State: AOAM5337G51BBzGvXSBk4/bfwDQApC/Um+tIBMSzKAL56n0fXAyT1jrF
 owI93YFVFGjukyIPwyUZfitoRyR41Jo=
X-Received: by 2002:adf:f54c:: with SMTP id j12mr12190928wrp.413.1602362231446; 
 Sat, 10 Oct 2020 13:37:11 -0700 (PDT)
Received: from localhost.localdomain
 (106.red-83-59-162.dynamicip.rima-tde.net. [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id v17sm5661341wru.44.2020.10.10.13.37.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Oct 2020 13:37:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/4] hw/arm/raspi: Fix SYS_timer to unbrick Linux kernels
 v3.7+
Date: Sat, 10 Oct 2020 22:37:05 +0200
Message-Id: <20201010203709.3116542-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Luc Michel <luc@lmichel.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Paul Zimmerman <pauldzim@gmail.com>, qemu-arm@nongnu.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WOeO9WvgQA9l

In this series we implement the COMPARE registers of the
SYS_timer, since they are used by Linux.

This fixes the hang reported by Niek here:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg682090.html

Since v3:
- Addressed Richard review comments (arithmetic fix)

Since v2:
- Fixed issue in COMPARE register reported by Luc

Since v1:
- Extracted unrelated patches to previous series
  (which happened to be mis-rebased)

Philippe Mathieu-Daudé (4):
  hw/timer/bcm2835: Introduce BCM2835_SYSTIMER_COUNT definition
  hw/timer/bcm2835: Rename variable holding CTRL_STATUS register
  hw/timer/bcm2835: Support the timer COMPARE registers
  hw/arm/bcm2835_peripherals: Correctly wire the SYS_timer IRQs

 include/hw/timer/bcm2835_systmr.h | 17 ++++++---
 hw/arm/bcm2835_peripherals.c      | 13 +++++--
 hw/timer/bcm2835_systmr.c         | 57 +++++++++++++++++++------------
 hw/timer/trace-events             |  6 ++--
 4 files changed, 64 insertions(+), 29 deletions(-)

-- 
2.26.2

