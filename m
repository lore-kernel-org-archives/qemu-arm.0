Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp2242677njb;
        Mon, 21 Oct 2024 02:18:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVLJ1jAK6WUEIWxHRL2u5qFHQ0IUU/mZJYHXQnmoaT6W3T8CV5T+phlzQElL3M5w3CG+NBhqjCubPhGNw==@linaro.org
X-Google-Smtp-Source: AGHT+IGC1hRmQh9HEunKR45dpTWAPH8a3/J8avu2er7xsnrIBT/g961I+Ch5te/gA5gwoaMrEn+G
X-Received: by 2002:ad4:5002:0:b0:6cb:ec7c:857a with SMTP id 6a1803df08f44-6cde165080bmr128576706d6.50.1729502305372;
        Mon, 21 Oct 2024 02:18:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729502305; cv=none;
        d=google.com; s=arc-20240605;
        b=GAm1cBKWDy5vYgfgaw0Al7SvzjhTfEQB87ImaEm9/bFN1B8CnCvtUfLrWEJ+a0J14H
         r/kS8xoHfnK4wj7l1sEszWVgu8doXhhl50b7PgQU64UGKP22W388+sZMSsTLP7r52iWq
         DFSJ/Ljmh+mEyjA4NRs/j36ejR0uBvKZhwS4op9W1MGY3m4x0gjeBXzZ9euzBPiLicX6
         rV9Ucq1D+PVGIevGZP8HMP1jnDsO8K9IC1xGv03LP2MpRspb/TMK3+ADXFYJSDXH7oB+
         wQ56QZ1DWd9sOAzbhITek/nV47Am3ojCHAh/6Djk/P1sw2kJu9OIZFBGEcjqXtn82kg+
         9kRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=92cuFzD+3hd3+6TatQY/j5FkSK1hjyM372fU+PFVM+k=;
        fh=yVPl0tV6ax2VanK/QWhwoKqh+icGxzKysQPiYfAq5RM=;
        b=cQ84sm723lrH6FFpGC3YBmqNW7pBepywnE1w4OwAgJVTl4rsdKoyzF4vGP6gxzTfCy
         tsyhAdPpOnpnfRtIGUMDjtpV/dG262xqrui9bi8OSGqagclMRxU1R4/+UVlyBo/EtNei
         YuH9SXECdFPPGmn5ZXslc/qBzmWF8/TloEMQ6lNmIVU6We2B2+zoG5oRv5oFUY0MfjwE
         sB+xOesgfhO2G0RJXlGjFm2X5mtSKzkdD99mP0bNmCRyLPSOT29GjzN8cQvC+6T0wD+b
         gPoz5+zT6wZWS09U3w9LNeWaINgtlM10wvg27oFa24pTl6ZBSLkul8ChlfDkvdYMU8CH
         RYGA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Jzv1G2OR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ce00a019d4si35306626d6.489.2024.10.21.02.18.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2024 02:18:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Jzv1G2OR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t2oY3-0006vF-Ge; Mon, 21 Oct 2024 05:17:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t2oY1-0006uQ-GU
 for qemu-arm@nongnu.org; Mon, 21 Oct 2024 05:17:57 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t2oXz-0001Im-TL
 for qemu-arm@nongnu.org; Mon, 21 Oct 2024 05:17:57 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5c9850ae22eso5306466a12.3
 for <qemu-arm@nongnu.org>; Mon, 21 Oct 2024 02:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729502273; x=1730107073; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=92cuFzD+3hd3+6TatQY/j5FkSK1hjyM372fU+PFVM+k=;
 b=Jzv1G2ORndTl/oUt6aqsW5l8h4Uw3TTBz1QAoy3cUznseWRelvB7NFqefjeZ1BZvnK
 MeXvz6xPNxuaVzDth7MRhsaFZOUSDQuMcXAMSUWTOugeswAFO5SpYjo61YGF5m/lzGeJ
 mMW0UJYpU2Dd5gcIrmIn6N+GO+s6i/HGiNRHhP4Ufe0LNZHiMMyjCjGCjPYLw614Ob9E
 E9T0l73qaoZsoRjaZRl+F92zAFi2A/RMjSOs5XlrNUBmEXY5tCl74aorCdpKE2i+CvA5
 gYD2VeHmT53E9JOYpuJwmC4sMOeW6DCLpFG0PNFTWhQT06FrCUalAIZQFA4tER3tPT/g
 HSLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729502273; x=1730107073;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=92cuFzD+3hd3+6TatQY/j5FkSK1hjyM372fU+PFVM+k=;
 b=RrMrW5EUf9OtohHQnH3thq11rgt63PY5B01/UyAkdupVXoUDwFPsyXYBqPa1SGENbi
 jNjRLNcqwld1KnklXTkaz+q8nLyXbT3IW3Ff4xwAuEcDosGa68Fhe7Dj8Uq0ydXlb9Ah
 BD4f3NlUsVmXcR+rs0BwRIvcYEA3rbtpcyz9af7YMYir2AbtXA7Zw/aUIDM90TExWwkq
 9+N2NxbGkg/uQCWb1Ghvec5GSer+jgxtOBnozGMKakjGTTd4sZIwZtq9zB+Lkm8yMQvI
 X/FXJ5nclytmpSn2D+uRj+ZC56Seeex1uL912Yzpu5isZI04s/P1n07MPTeanCNP7I0B
 JiPA==
X-Gm-Message-State: AOJu0YyP+2TxA41bXu+VK8bjmLmAifo/Ld3SXY6GfkJS5KmW8laFN1Ct
 +VzafClwui6RMN3njon3J4FxtFDybGS9FMuupotfXXyXo9Mo1E0jSZUEXPPMxnSAlaO2deSNYy/
 pxbhrQhJPyJPRA4uqqhi6MlMvXGLTcfJLbm1cJw==
X-Received: by 2002:a05:6402:5247:b0:5cb:6690:eabb with SMTP id
 4fb4d7f45d1cf-5cb6690eb13mr4179971a12.24.1729502273338; Mon, 21 Oct 2024
 02:17:53 -0700 (PDT)
MIME-Version: 1.0
References: <20241017163247.711244-1-peter.maydell@linaro.org>
 <dcf06645-dac0-4099-8946-38ca9deaeccf@redhat.com>
 <ec2cb5e8-77be-435e-8aa7-4314cf412c4d@redhat.com>
In-Reply-To: <ec2cb5e8-77be-435e-8aa7-4314cf412c4d@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Oct 2024 10:17:41 +0100
Message-ID: <CAFEAcA8MY8DWABNuYuzH57k-nv3J4s0eMR=FuRt1TVd8P2GU2g@mail.gmail.com>
Subject: Re: [PATCH 0/2] arm: Add collie and sx functional tests
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
X-TUID: Nr+AMq0Zv4MP

On Mon, 21 Oct 2024 at 09:01, Thomas Huth <thuth@redhat.com> wrote:
>
> On 21/10/2024 09.15, Thomas Huth wrote:
> > On 17/10/2024 18.32, Peter Maydell wrote:
> >> This patchset adds new functional tests for the collie and sx1
> >> boards, which are the only remaining ones that survived the
> >> culling of the OMAP/PXA2xx/strongarm machines.
> >>
> >> For these tests I'm indebted to Guenter Roeck, who has kindly
> >> built and made available the kernel images, rootfs, etc and
> >> documented the commands needed to boot them. All I've done
> >> here is wrap those up into test cases in our testcase
> >> framework by cribbing from some of our existing test code.
> >>
> >> Based-on: 20241017162755.710698-1-peter.maydell@linaro.org
> >> ("hw/sd/omap_mmc: Don't use sd_cmd_type_t")
> >>   -- the sd card test for the sx1 board will not pass without
> >>      that bugfix
> >>
> >> thanks
> >> -- PMM
> >>
> >> Peter Maydell (2):
> >>    tests/functional: Add a functional test for the collie board
> >>    tests/functional: Add a functional test for the sx1 board
> >>
> >>   MAINTAINERS                         |  1 +
> >>   tests/functional/meson.build        |  3 ++
> >>   tests/functional/test_arm_collie.py | 31 +++++++++++++
> >>   tests/functional/test_arm_sx1.py    | 72 +++++++++++++++++++++++++++++
> >>   4 files changed, 107 insertions(+)
> >>   create mode 100755 tests/functional/test_arm_collie.py
> >>   create mode 100755 tests/functional/test_arm_sx1.py
> >
> > Thanks, I'll queue the patches [...]
>
> Unfortunately, the test_arm_sx1.SX1Test.test_arm_sx1_sd test is not working
> for me, it seems to fail the shutdown of the QEMU binary:

The interesting information will be in the guest console
log, which seems to not be in this log. But the first
question is "did you include the omap_mmc fix that the
cover letter and patch description says is a prerequisite"? :-)

thanks
-- PMM
