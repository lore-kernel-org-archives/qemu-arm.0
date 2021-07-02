Received: by 2002:ac2:593b:0:0:0:0:0 with SMTP id v27csp1222966lfi;
        Fri, 2 Jul 2021 03:40:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw0JwMVdVLLV/g5+kHgx3ij3OIwmLmbJijPkRFeIdSc+R9WzHa2Rvkt+7VCMUpgHihG73ob
X-Received: by 2002:a67:8c4a:: with SMTP id o71mr5336227vsd.46.1625222447893;
        Fri, 02 Jul 2021 03:40:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625222447; cv=none;
        d=google.com; s=arc-20160816;
        b=Q39FtsIzkM14SCAvzcQLdFUYLR7W96pUW8rrub15cMCdHbXJ66bQ3JDHvMgoJxDwaw
         GQSFURBdmv0dLDmDTiqSIhisYQYhiNjQrYfgbNPKIJStCMOrMKUBYu2el59TP9v0Wpxp
         a28hNeBvEoYB6Cx3pKwrBKytt6s/Ch1wzhDZWQ/cGhM4FrRvYQCyP+DuibYMcZmSEERG
         kJV1JSNPX99EEIUFKIVhJ7xqA8SUi3ylnwjRDzdwnTeSsniRE3GqPDKyGoWT5FMTR0XC
         2fqCTh5+46ANVWYhPfUPQ/QjAFNYn0z4TbulZuwTVbL4H8XC29UP3/I+GSicZc0vnzJr
         cdDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=9l8mJiWTmQcwSlYgFMsdpN9KtlV96vw+qWV0Yyr7sbk=;
        b=ODEcZ2sbuzx9Kvqt0HuycuLZCOU15HzkD312yAmPCzJeg9+6jp/xiQx3/w/j5JVxPx
         /hy5UnSySmkqhft4XO7ZJc/PUnvjn1WFMWaqnimXThBc/EyoXG1KVIWhm6NIDf437ykn
         EcCpr7nFY1xkoTv1F972C77OJzkJ9tk3h5w06mCCE6MqPvgq6p30WbvuBnWqdxYXZH7a
         CM7sGDEdNKTo0rvrgZWJY8oscM8Fr8QtMT5fOLPz9tn5Glft5IX6ifeFXIet9CvXCxoV
         0Nkj+mHrKCGFuaX/N7L2y7//4pDv3+CCEcQDDLtJOzwq/EqrTENGCWOOfF9RKtVfE5pa
         mpHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Hy/m5oNy";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x6si2731699vsg.16.2021.07.02.03.40.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Jul 2021 03:40:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Hy/m5oNy";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lzGbH-0004hA-23
	for alex.bennee@linaro.org; Fri, 02 Jul 2021 06:40:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzGay-0004eA-Ec
 for qemu-arm@nongnu.org; Fri, 02 Jul 2021 06:40:29 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:33357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzGat-0006Xk-Km
 for qemu-arm@nongnu.org; Fri, 02 Jul 2021 06:40:28 -0400
Received: by mail-wr1-x42d.google.com with SMTP id i8so11965332wrc.0
 for <qemu-arm@nongnu.org>; Fri, 02 Jul 2021 03:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9l8mJiWTmQcwSlYgFMsdpN9KtlV96vw+qWV0Yyr7sbk=;
 b=Hy/m5oNy2BwbCMzeEpZmNWQKRfPFIlBPwMeen7+kU55VCvGcJx8Ll0QVx/fg2oxouL
 N7aQRFEjj0b8PtbCTzYE8b7+fhFHC/anokB6yq5CgBeEjswrU46zngk/w4kVZQDvSqK1
 w89JjKP+Xfckrh/SwvqKWxd7FqvwjHVkSh/e0CQ4fvKo6KrGGKWhaEDIio/CUQ4cgQrd
 g1zPOFFhiNsH7Go2qGqd2JDqBPEzRdgq8xx+DcVnjg/FXMJfYL3dZPxkCCIE9gTDsWu/
 jeDoz5wivS1PVyZLjz97ov6mtgAaMPq+edHUdKYdaJ1Mrz02mXWHEpNcNb2oT9BcbM5X
 spow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9l8mJiWTmQcwSlYgFMsdpN9KtlV96vw+qWV0Yyr7sbk=;
 b=b590huSq6SJtmsTwNAAONRsRzQA2W78ehCKLk4E4kbFmAlwtaCnwJEFqIS5k6KRHkl
 nthHgpXjdHU25oxJvBGHfHgd2UNbC7GdlYki7igrsWPt1dpyKDcvDVScg8aameGlp146
 uPvYnAdrh+W60qC5tsXmGi+MwOkBmLXiTFxfnYXNNXVikx5LG3pRJbraQdFBGXDA3goI
 UlsleWN7jPLX7ukU7Wb+onDawCswp3eYIIAO3O8nt2QWSVIgSab+OdlD9vpwgyHfToV/
 QAUa+tI3YTcCzS3NfQtcYmk+2n5d5y5J1De03yiku+Tmzyn3PVejaqY8dvCXqZ2yJA5V
 2Aeg==
X-Gm-Message-State: AOAM530LqzHc/aeK7gMc4qAuulDrswNWhBcxBsS+7/9pszSC5YA+Vutj
 y/u0IiHL3mJrIvqSqnV8cO3Swi+K1Jo3vPdi
X-Received: by 2002:a5d:58c4:: with SMTP id o4mr5022188wrf.320.1625222420885; 
 Fri, 02 Jul 2021 03:40:20 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id p16sm2745810wrs.52.2021.07.02.03.40.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 03:40:20 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 00/11] hw/arm: Make virt board secure powerdown/reset work
Date: Fri,  2 Jul 2021 11:40:07 +0100
Message-Id: <20210702104018.19881-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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
Cc: Maxim Uvarov <maxim.uvarov@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QOZmIadClZIB

This series fixes a bug reported by Maxim where the virt board's
functionality intended to allow a guest in the Secure world to
shutdown or reset the system was broken. Patch 1 from Maxim (seen
already on-list) fixes a silly cut-n-paste error in the gpio-pwr
device. The rest of the series fixes the trickier part of the bug.

The bug is caused because the gpio-pwr device and the virt board
wiring assume that the GPIO outputs used to trigger shutdown and reset
are active-high. However, for the PL061 GPIO lines default to inputs,
and our PL061 implementation currently hardcodes "assume lines have
pullup resistors so that when configured for input they act like a
logical 1 output". The only reason this doesn't mean that we
immediately shutdown/reset on startup is a second PL061 bug where we
don't assert the GPIO lines to the active-1-pullup behaviour on reset,
but instead do this the first time that pl061_active() is called,
which is typically when the guest touches the PL061. It happens that
OVMF doesn't do that until it decides it actually wants to do a
shutdown, so the bug was manifesting as "we got a reset instead of
shutdown".

I did an audit of our PL061 users in-tree:

 * highbank, versatilepb create PL061 devices but don't connect any of
   the GPIO inputs or outputs
 * realview, sbsa_ref connect only inputs, never outputs
 * virt has an NS PL061 which is used only for inputs, and an S PL061
   which is used for outputs (and doesn't work correctly, as described
   above)
 * stellaris uses its PL061s for both inputs and outputs; the output
   handling is for the SSI device chip selects (and is not really
   correctly modelling what the hardware does).  These PL061s are the
   "Luminary" variant.

The Realview and Versatile boards really do want pull-up behaviour (as
documented in their TRMs). For 'virt' and 'sbsa_ref' we can define
whatever behaviour we like; 'virt' needs pull-down unless we want to
redesign the gpio-pwr device, as noted above.  The Luminary PL061s in
the stellaris board have extra registers not provided in the stock
PL061 which let the guest control whether to enable pullup or pulldown
or to leave the line truly floating. I don't know what highbank
hardware needs, but since it doesn't connect any inputs or outputs it
doesn't really matter.

These patches make the implementation honour the Luminary PL061 PUR
and PDR registers, and add QOM properties so that boards using the
stock PL061 can configure whether the lines are pullup, pulldown, or
floating. We default to pullup to retain existing behaviour, and make
the virt board explicitly configure the pulldown it wants. Once that
is all in place, we can make the PL061 assert the GPIO lines to the
pullup/pulldown state on reset (by converting it to 3-phase reset).

A few patches early in the series do some cleanup of the PL061:
converting it to tracepoints, some minor refactoring, and a
documentation patch. The last two patches are comments only, and
document a couple of issues with our stellaris board model which I
noticed while I was making sure I hadn't broken it with my PL061
changes. Given that the stellaris board is old and not very useful
these days, I don't want to put in a lot of effort trying to "fix"
things which aren't causing any issues with guest images we know
about, but I did want to record what I'd figured out from various data
sheets so it doesn't get forgotten...

thanks
-- PMM

Maxim Uvarov (1):
  hw/gpio/gpio_pwr: use shutdown function for reboot

Peter Maydell (10):
  hw/gpio/pl061: Convert DPRINTF to tracepoints
  hw/gpio/pl061: Clean up read/write offset handling logic
  hw/gpio/pl061: Add tracepoints for register read and write
  hw/gpio/pl061: Document the interface of this device
  hw/gpio/pl061: Honour Luminary PL061 PUR and PDR registers
  hw/gpio/pl061: Make pullup/pulldown of outputs configurable
  hw/arm/virt: Make PL061 GPIO lines pulled low, not high
  hw/gpio/pl061: Convert to 3-phase reset and assert GPIO lines
    correctly on reset
  hw/gpio/pl061: Document a shortcoming in our implementation
  hw/arm/stellaris: Expand comment about handling of OLED chipselect

 hw/arm/stellaris.c   |  56 ++++++-
 hw/arm/virt.c        |   3 +
 hw/gpio/gpio_pwr.c   |   2 +-
 hw/gpio/pl061.c      | 343 ++++++++++++++++++++++++++++++++++---------
 hw/gpio/trace-events |   9 ++
 5 files changed, 341 insertions(+), 72 deletions(-)

-- 
2.20.1

