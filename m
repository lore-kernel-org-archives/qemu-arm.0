Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp4458575lfb;
        Tue, 10 Nov 2020 02:49:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxEBrOGQT89/b/zzcUaspPPXyzURLIG2Ro4e0tYD5p2CUwc+ngMxe0IeS0xGLYL9S7HTwUb
X-Received: by 2002:a25:2f84:: with SMTP id v126mr24434014ybv.509.1605005384567;
        Tue, 10 Nov 2020 02:49:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605005384; cv=none;
        d=google.com; s=arc-20160816;
        b=G7tMiHq3qbnxwbLEj1iexEa7n/p1gM1v8d+/+sO7qdkAtRaDywk36CNgJ9ws6E7NDv
         bqCjvYYaxOAQxvm2dZ25k2Ar7rbBkqs0IrHRSfxMt3RHVB06pfoBaNVHMLPqcS+JyXgH
         VbcYhW5aOdOX0Zx0Asq4/g5jwfron+MO1IDbAr1iB46geEmi4Lwy3QwUkac3asartV1d
         uG8LUPEO2TC52gDmnC5Pm/8sdWKvn9Tp00oUtQ6JnVyLbMvJomzBACAlD+VCQGaAK6vn
         4WF0xiEHRIL9miJYdA347hsRn55qRVdeB+OEtNLU5Owkd8Zyxit3mVVv5uLxjMTz/Mbj
         a8yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=eVD5y4g2Rfc2yx6nNOaT3CPybZQkXS892G2CTFVz298=;
        b=bAWfSb0Nqm1N2i5XkgydHpAsjYkei10sVX2XtPQjbDHpPykKQfJWHASwC8Fr8Xyasg
         KBUO+qxI8MBxpzZ/jWzhJSu+WLPolyn3VT5pVCSzuS27Pji+N+x46W6XD0KMDZ3EY3ue
         QOxHWkfDaLqfQO1l0wLVvPtm03NEXRLp1rQdV+/7zD43NM2Q7fh4Ld51uRTwo11fEUNR
         WHB+1EpXpsMbwLFxTMPzXzToJEPQrqiykLFati9EEXnwJf/YbP09qq1bjDBkGdd0fp4K
         dhDAXIaThBBuruBpAJi1CQWH27ZOGIHlY8W9pDw9fBxdQsNh29mxwJ3er7M6xOfIJRnz
         7xow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bVW6tYvS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x2si10455697ybj.354.2020.11.10.02.49.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Nov 2020 02:49:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bVW6tYvS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kcRDb-00039O-La
	for alex.bennee@linaro.org; Tue, 10 Nov 2020 05:49:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcRCl-0002W2-Qi
 for qemu-arm@nongnu.org; Tue, 10 Nov 2020 05:48:51 -0500
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:38584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcRCh-0004ck-6j
 for qemu-arm@nongnu.org; Tue, 10 Nov 2020 05:48:51 -0500
Received: by mail-ed1-x544.google.com with SMTP id k9so12178372edo.5
 for <qemu-arm@nongnu.org>; Tue, 10 Nov 2020 02:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=eVD5y4g2Rfc2yx6nNOaT3CPybZQkXS892G2CTFVz298=;
 b=bVW6tYvSaLHDyGWgFY2XN0jvAQuXg8HO8vwem7A0JIrslp7m0xBzRy+q/hFL+zkmjm
 RtwFSAudSvlhd2jkQ7cM71OpClPC7xwCT3BOBV2PwjuY7rFhSPVpnGI3d7OjQI4IiGyu
 PVusUFkdEshwmF3weoGX2ax/2CXThQ35u2XBQtDSq8oqSjxf2/xIR1ESWf6E0K6NyE0K
 QuWBPjKDyG4pOLK7HtGByPWHBXex0U8eUaGloGPg9bSFGJmJgT+ofP0Imos2d0IgOQvJ
 q8qXqCmWzxoCjkOkLuq4dtHOl0FhZhBGquOJ2lcIAhLLgg/CxlymjJtYr0UVXKxdpPK7
 XNmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eVD5y4g2Rfc2yx6nNOaT3CPybZQkXS892G2CTFVz298=;
 b=gfpgiOs2njhvoupjU77516Mq9WhGBeauhvgGWsIAl+N7NujWAMKqi3pb5Xrfqncxv9
 5KhsXRQL/32XwAtNArlDfJlPFnSbaruGH4z33501/hiu0rgdn4Gr3p9Rl3ZxiK26p187
 WBm4dpkxZG9ZFVbR3PjfF/ZeOg9+J3YcfgwS40WY7H8DcSMHkoYY1oVSSTDgb/KsnO7u
 bTgBAWLsBDUHJl47e28xcButCV1rWLOzUpoFH2yDNun9I7o9726F0v/x8bWLIqH7aRxU
 M1yeaBTKZ3ff1eC6PQyIJmTzowxRqVWwnie4k0HEV8GJdfVYMD5ctg7q2PwVFTeEQtbb
 bvtg==
X-Gm-Message-State: AOAM532rzGOfRQ9W1DQglO29vNg2UW/QZgj/f7q9QYUHG2pWMcNTsDST
 b27x5nbrrEmtuLpWlPixbk6HyQo74UeiwfRYhd+F0g==
X-Received: by 2002:a05:6402:b35:: with SMTP id
 bo21mr20917837edb.52.1605005324597; 
 Tue, 10 Nov 2020 02:48:44 -0800 (PST)
MIME-Version: 1.0
References: <20201103011457.2959989-1-hskinnemoen@google.com>
 <d41219dd-6cac-f4a4-d559-27ac9b9d9554@redhat.com>
In-Reply-To: <d41219dd-6cac-f4a4-d559-27ac9b9d9554@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Nov 2020 10:48:33 +0000
Message-ID: <CAFEAcA-2Qf2=Qsgqw+s+E42vd-K0GJ0aNyCVnsZ-cF925GUK7A@mail.gmail.com>
Subject: Re: [PATCH 0/3] tests/qtest: npcm7xx test fixes
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::544;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, "Daniel P . Berrange" <berrange@redhat.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: szBtu84ZWAhf

On Tue, 3 Nov 2020 at 01:52, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com=
> wrote:
>
> Cc'ing Daniel (patches 1-3) & Marc-Andr=C3=A9 (2).
>
> On 11/3/20 2:14 AM, Havard Skinnemoen via wrote:
> > This series contains a fix for the randomness calculation in npcm7xx_rn=
g-test.
> > It also makes test failures fatal. The last patch would have dumped the=
 random
> > data to stderr if the randomness test fails, except now that failures a=
re
> > fatal, it never actually gets a chance to do that.
> >
> > It may not make sense to apply all three, but I'd definitely take (1), =
and I'll
> > leave it up to you whether to apply (2), (3) or both.
> >
> > Havard Skinnemoen (3):
> >   tests/qtest/npcm7xx_rng-test: count runs properly
> >   tests/qtest/npcm7xx: Don't call g_test_set_nonfatal_assertions
> >   tests/qtest/npcm7xx_rng-test: dump random data on failure

I've applied patch 1 to target-arm.next but will wait to see
if anybody has an opinion about patches 2 and 3.

thanks
-- PMM
