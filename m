Received: by 2002:ac2:5fca:0:0:0:0:0 with SMTP id q10csp2535193lfg;
        Sun, 11 Jul 2021 10:50:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpX8JaUotT+yU5l0O2sk4SWiZz5crazGaeJHL0eSePZpM9OWiagi1Xbg7bdQGpItB29N1f
X-Received: by 2002:a25:3482:: with SMTP id b124mr59172061yba.297.1626025831345;
        Sun, 11 Jul 2021 10:50:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626025831; cv=none;
        d=google.com; s=arc-20160816;
        b=Oo81ZKsksdbUGbROVEoGTJnVWY/auHAPcCvBXzxggJkrLg0SD2jw8VCiF6mtQ353P1
         +PcVqXJ/Cq20KSOVYg0qY2PMnZEbQBYIgQ6Aulbr8lpdqILamfsZjjKdaottJk6jB97F
         caBAboJFjdyMxWwRpKuR1N7eXfyWWLD8lEvzrGIR7cYJ6d6Hpx9Yhq92lo2seZTk64k2
         wKg9Yp1sdir2QpnbwTXaZ4hztTYv5ffqFqflf+9DFTyD3WqnVSf1RNXM5X8NlrrYYPr2
         QiUi1M/Bxg+XdrfzD4EaSGOI8uiaP8Y0UHRZEJ+XiX08AZIt9JWnaS/WcUOh/0I32fAt
         GBwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dN9FmmmBIY6c0dU46bPhto/CByZ5ssIcx3OZqkLHHqE=;
        b=jcgBziWYEOO1MyJcLyQ7LSHJTwZZpFYxMAD8yYC6VyBXVBxmRblYzRDiS42es7S4YU
         vUftQ8eYZN3nCr1M/coauCjgV00NwcrwwJSefQEFfY0IojMVm9IYuPxYUzhjW4YQekIT
         6uOzjqFzFm+H+21NsBOlUG7l3pHdhwkEIcwEAXmREs76R/Mmtd42Sz0yE5gYLH/+koXb
         HE54sGkbmHcsBwPHHnSHrCfUIYXetFEcEVw3S+E1tmBssaWuoYDEMrPWKUxfjsLvEsnL
         o7HZ8RvqeAOJjPfcMzSsgqVBPdl0TEMZssV/TC0lcox/OUtbi9nM7Osw8vdHt1PzZgek
         u+OQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=acfW4XH2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r6si15197751ybr.386.2021.07.11.10.50.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 11 Jul 2021 10:50:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=acfW4XH2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m2db4-0004dz-7j
	for alex.bennee@linaro.org; Sun, 11 Jul 2021 13:50:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m2da4-0003y6-8r
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 13:49:28 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:42590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m2da2-0006cL-Ih
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 13:49:27 -0400
Received: by mail-ed1-x532.google.com with SMTP id m17so23497975edc.9
 for <qemu-devel@nongnu.org>; Sun, 11 Jul 2021 10:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dN9FmmmBIY6c0dU46bPhto/CByZ5ssIcx3OZqkLHHqE=;
 b=acfW4XH2YirSM28BbUH3Y9rIjRGFrxVcwGwJ7PbZTNvdogy/EwOKwhMPyAnlHjxycY
 BVXhMDCuDJonv0FDs9P/QrVJtdt074+NZgau154/k2yY72uSfQq+Bdz8Ot8kHpiqJo/z
 xICf6quKQSV13OZr84MX0HlZmGJXU27J3ITYcAU9pvM+/HTA8VhHXUtplK7gxMXfSkNm
 MJIbU2M6qJ2TDaDSmDpkm8GSF8ZjCpW50w2ULr+/T6FhgII7uPTpoiBAlilCJ8Q1OVR6
 KSCm7qxN+Q9oBXdp+loOIylUeuss7zukhm8NlSaIpt5oXDcpgribvTyYacsXUbqGEK7d
 F9sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dN9FmmmBIY6c0dU46bPhto/CByZ5ssIcx3OZqkLHHqE=;
 b=iuUC9m0jlGB4wEDGyW1EO5yth6iA0bKVvpX7P3+dRz/aFuoDpIi4y8TE/RzuQ5UDbt
 +AKIlRiGUaNOrgGK9aQeslGL5nWMvjNlvvvTP3yjKgb1Fp89WNXU3PlVX3GFCnvoSgjI
 Zp4Koa2p8eiMfdpwmHFTwOj9jGNCTBsjhu7ssmPLfF5fOtu3jSYDMymLV3xl4l85Az+P
 8P0QgPgJc9a63YSg46y1Cy9XkFKRvY5SR3kBPq0kFxLCvbOEj0whOZyTdrHoHvP0fImy
 ipyKSHP1Da0XfoXE4NbTJTmXdHW0SEh2Hm+3NvxBoQm3gECePorTAizFPHq0JAKI5O6Q
 LDiw==
X-Gm-Message-State: AOAM532oTFDWZbLwGKCtgINJi72FuKHh6fIb7j+CqMoOWmuNvKZ7OoZl
 4iPyZHRD/YdBbHqsrpOFeoWcFkLNyIqxx767EpPPVA==
X-Received: by 2002:aa7:d809:: with SMTP id v9mr7554736edq.146.1626025764798; 
 Sun, 11 Jul 2021 10:49:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210709163047.GC3599@minyard.net>
In-Reply-To: <20210709163047.GC3599@minyard.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 11 Jul 2021 18:48:45 +0100
Message-ID: <CAFEAcA_Ti=CCAaVV7b5qb1gB1nerKYUMPyjyYcVJpAXHfzVptw@mail.gmail.com>
Subject: Re: [GIT PULL v2] I2C/IPMI bug fixes for QEMU 6.1
To: Corey Minyard <minyard@acm.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Titus Rwantare <titusr@google.com>, Jinhua Cao <caojinhua1@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Hao Wu <wuhaotsh@google.com>,
 Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hZ4/fsUz/6Ge

On Fri, 9 Jul 2021 at 17:30, Corey Minyard <minyard@acm.org> wrote:
>
> The following changes since commit 38848ce565849e5b867a5e08022b3c755039c11a:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210616' into staging (2021-06-16 17:02:30 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/cminyard/qemu.git tags/for-qemu-6.1-2
>
> for you to fetch changes up to 7649086f455fe44bd076828749a93ab2a5bb0806:
>
>   tests/qtest: add tests for MAX34451 device model (2021-07-08 14:42:00 -0500)
>
> Changes from v1:
>
> For the 64-bit field in the PMBus patch, use BIT_ULL for the bits to
> fix compile issues on 32-bit hosts.
>
> I updated my testing to build and test on a 32-bit host, which proved to
> be a bit more challenging than I expected.  But compiled and tested
> there, too.
>
> Thank you,
>
> -corey
>
> ----------------------------------------------------------------
> Some qemu updates for IPMI and I2C
>
> Move some ADC file to where they belong and move some sensors to a
> sensor directory, since with new BMCs coming in lots of different
> sensors should be coming in.  Keep from cluttering things up.
>
> Add support for I2C PMBus devices.
>
> Replace the confusing and error-prone i2c_send_recv and i2c_transfer with
> specific send and receive functions.  Several errors have already been
> made with these, avoid any new errors.
>
> Fix the watchdog_expired field in the IPMI watchdog, it's not a bool,
> it's a u8.  After a vmstate transfer, the new value could be wrong.
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM
