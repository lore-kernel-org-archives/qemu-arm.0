Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp152202njb;
        Thu, 17 Oct 2024 05:43:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXRU+CVHI+WxziEejVi+6TcWG9paxRIrDBY8PG/0LE6DLPjOoJlujS1OUCKqYISnavcbmcAf72C/dZDbQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEudgMY1/bNdywE3GjxLrBK8kCZZ0e8AEP+Di+E+YP9qFHmZm7E5+nltcOpjaXPlXwUtK62
X-Received: by 2002:a05:6214:80d:b0:6cb:f690:c7a with SMTP id 6a1803df08f44-6cbf6900d65mr203579506d6.48.1729169001362;
        Thu, 17 Oct 2024 05:43:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729169001; cv=none;
        d=google.com; s=arc-20240605;
        b=S6pICPrPcRXyF742saRTCggJf10DpSg2v68pKCBZLyLDZqdk9Gc7SODMoWTTv4hI9K
         SFtgvJ8bqLwKeNFNSlxjFTm/f8tukyREbm21y7AoJ4cO1b+SJIQqfjimah02xMYXsDFQ
         gS99AHLLZ00uxL7qy4NvKam5syvC3aO0MtnFNIYY8k0Xl67SLcKUvc+GT3eQhgcwRkNs
         M0RN3dBE7vcdBWOFmux5/VuMhVH4VWE6BJE9x+6gzn0jYO8Ds4CSlgazTHIv4s/YgKgc
         X5cUiNbXSAAXG51Jr1I3TwOQfYSQijG6KFHdxIdQZ/b2cCTBMwEKu9c71qGYbIFeY6IE
         whAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=6ZuKCrkaLzM33sZ5bBvK6gUY6ZZ4l7azgsAmnHgjSa4=;
        fh=uFlx5ONeJTSiFooi/i8XDxaXW30xSSmpelweJ7FlXMs=;
        b=M4cBIqTmwuJ8ABlBNjnmcVJRNSM5J2fJ3DjJ/brYBJzrEzrh+4pIgG1y4L80e4C1M+
         I6JL2CeqUnZpTmMCvtXAzGM7xR/VxUVNoIZQ13DEnLms+Q1UYTDZlcTL9h3xxRaSYwk0
         4pO+2xeKO4ir4UazcV/sbDUujkczWYaG/cl5rtF0rxGHEth+L+3Sns+HxAYTf3vIzkaZ
         SOYSmfztuwQEnzPsZN5n+NN2ImUW3aGQ5jUblZN2mM9EjH47ck1JVr1QYbLmeYv52jeg
         TDWbEuA0tMfKW5pelxdjakazgLDma59bixr4rjunxP5YnOo7ntUdCMt75JVrtzPAn1Cr
         i/Hg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="o/BIDqRo";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6cc22b3b28dsi62888166d6.429.2024.10.17.05.43.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2024 05:43:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="o/BIDqRo";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t1PqN-00024r-MA; Thu, 17 Oct 2024 08:43:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t1PqL-00024C-G4
 for qemu-arm@nongnu.org; Thu, 17 Oct 2024 08:43:05 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t1PqJ-0006rR-U1
 for qemu-arm@nongnu.org; Thu, 17 Oct 2024 08:43:05 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5c95a962c2bso1164581a12.2
 for <qemu-arm@nongnu.org>; Thu, 17 Oct 2024 05:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729168981; x=1729773781; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6ZuKCrkaLzM33sZ5bBvK6gUY6ZZ4l7azgsAmnHgjSa4=;
 b=o/BIDqRohYZrVN81uqEv3e8i5sheaqfvt8QN7NcUf8HRzs3tCXKRtfladL8GzhTcED
 HQCOEcX4NmQktpPQab0WTpxrtIbv+D6i7PRB1XYg9fSQrTsv3twP5yJFClEJ4zJjg1+N
 Og/wisDOQURs3KjnqjZ6g0WSKw/79GIZNLQvhHvxG5D8jsxv8wZgpc9oSpPppWDCVMPG
 mAv5x1ilyHXkD2gHinO4ld2k062WvcGbDQEbmaKTELsPNPX42apxHi7lWSfQt4A3DCcm
 o9/yNqzGrsoLvzDJyQp9QOwlyqW3EIlhS8gHMbheI4IY89nAXeDg0YwxH/wZEQG/6S2f
 qNyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729168981; x=1729773781;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6ZuKCrkaLzM33sZ5bBvK6gUY6ZZ4l7azgsAmnHgjSa4=;
 b=rA/uUy6yGSNr28F5pp9z/9dVdCShtI7wJYS1lq9ZQmDrMSsba4yy41YgJbBuGl8IlI
 VnG+FkdvicFQui1zKCnVzMRxLz/mU9fJwH/5E2AQe/inLN9YnGzSIGCPMnVV/IrRF8LV
 oskaO+CBOd1rx575nwc14IzOI1u74KVCosmZSdxzpHhmRkJp+Y7y+L4YLt0z/WslpGoc
 xFwqo1tzLFn+U0d0/TPX0k83jmgLM05mCadWB0QBmygFgYZBNuBKiIN0xk21u5HCVG//
 oZznw5LCQVFpJRp81afr2myn6WkwQAjooiuMwwaMe2XVmI64JJZdeGmpc3rdGENoZc2k
 YeyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTY8dIRQKOVCF3hrFa6T+XC3SIJGDmZS/id8f9hYQDTQP1F9b9UhuoIeTgmZveiJqqB1/+pPxS8A==@nongnu.org
X-Gm-Message-State: AOJu0YwK4+mEgipgbAkacUcSgSuumhl6F8GC2osuGsVwQEFWrCnvNqYc
 ICuZna1955bw19MlPsHBLRG6Qs3dNhMnQF5k3hdmd8NHwPQC8/yoUse7/CaXYxlV1jaZ1KwODxb
 uwBnaVUexyvYnE2aTsJil+92Vss7W8sz7xWyZZBd+1RIaWO9V
X-Received: by 2002:a05:6402:3513:b0:5c9:57bb:b922 with SMTP id
 4fb4d7f45d1cf-5c957bbc823mr15253428a12.19.1729168981305; Thu, 17 Oct 2024
 05:43:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA88UGhjh8-iBvhxx6GdWg74dinYouiguTcz=qEe51L7Ag@mail.gmail.com>
 <fe5476c7-82e0-4353-a943-7f39b14e1b5b@roeck-us.net>
 <CAFEAcA-bqOM4Ptws-tsEwo2HDZ6YSX1Y+xGkR0WueRD_dUd0+Q@mail.gmail.com>
 <7bd858a2-9983-4ddf-8749-09c9b2e261f9@roeck-us.net>
 <CAFEAcA_-eTfF8tVaLk4yLgWMSA1+KjPBYyS3EjMQNC+59hT0Aw@mail.gmail.com>
 <CAFEAcA95QmpcsrgCj5uE-Ng8ahNir3MuVEHWBCvjb3UwBbOFRA@mail.gmail.com>
 <ec0e8a75-c59f-41b3-b559-43c057fca8fd@roeck-us.net>
 <CAFEAcA9AZS1dGaLG85zZE8U0d7AcrLgKXNbhxkCoP+PLmbFn2g@mail.gmail.com>
 <cf7c8f57-22d5-4a40-bd87-0f15f5457d48@roeck-us.net>
In-Reply-To: <cf7c8f57-22d5-4a40-bd87-0f15f5457d48@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Oct 2024 13:42:49 +0100
Message-ID: <CAFEAcA98=2OdT9ykg5ibDuVLtSXuq4g0PLmSbxkYmt1SyKe9iQ@mail.gmail.com>
Subject: Re: possible deprecation and removal of some old QEMU Arm machine
 types (pxa2xx, omap, sa1110)
To: Guenter Roeck <linux@roeck-us.net>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>,
 linux-omap@vger.kernel.org, 
 Arnd Bergmann <arnd@arndb.de>, Daniel Mack <daniel@zonque.org>, 
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: VuMWPdh2RlO5

On Tue, 15 Oct 2024 at 19:12, Guenter Roeck <linux@roeck-us.net> wrote:
> Please let me know if https://github.com/groeck/linux-test-downloads.git
> meets your needs. For now I added 'collie'. I'll add more after it is
> in a state that is useful for you.

Yes, that's great, exactly what we need. I've put together a QEMU
'functional test' case that downloads the collie rootfs and image
and checks that they boot. (I'll send the patches for that out
in a bit.)

(I've coded the test case to pull the binaries for a specific
git revision of that repo rather than always-from-head, so
we're testing always the same thing against head-of-QEMU.)

thanks
-- PMM
