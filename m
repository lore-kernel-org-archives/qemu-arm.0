Received: by 2002:a17:504:6615:b0:1be9:327d:8ee3 with SMTP id h21csp67054njk;
        Thu, 20 Feb 2025 05:37:47 -0800 (PST)
X-Received: by 2002:a05:690c:3341:b0:6ef:64e8:c708 with SMTP id 00721157ae682-6fb582b4a04mr208922767b3.17.1740058667413;
        Thu, 20 Feb 2025 05:37:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740058667; cv=none;
        d=google.com; s=arc-20240605;
        b=cFs5TwH10Sdx9RLqzT2/DUL+Sxx95TSCQo+eFifEJuGjDD/W/3mbst2Dv9zSOo9LEX
         5+xpkDeo9CGwSVKkBrB5Kz5XeNHZcion/BI+3RFTLvbZyzWY/MgoC64el++D3FJ4fG6s
         Y1fh7UgjvruTVVVe5zp+uV10fzCiagaCXAOMQEHYBWY8AoS9YjVnIVCAhX5VB6QLt3Ct
         ylAVOdOPWvxH7TbUE7bRYh6sCJPzeznZcvII3klKwOS0aiHSym1zu3bXpy2bjrgcv0cU
         54/1hCNH0L/aZ4pGCt/Cc2rxS4yNEUoCSnNaUslLQ+Yw078IojLzJbAdzekGafspodHK
         LZ4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fa4LnSpmWM+FWDXKWITXcQ+buHuFTcP2Sh2OxmYGuSM=;
        fh=Wpa46SpZDMN78hZs0lGDVz32mDHT0NNZcNlwn+8G+j4=;
        b=dZDHX9nTDz7FofMe7lNvYN1Iwp1f+RJrktRgED2O2r7QAjwD/YSAiPd3G8BoTwZebA
         LERGMuLmelPM/n+WD55613s8DP/mLzd8Vbo/6HzKcbK5bf4Co7Af1x8bD2dN4BAK2mER
         cNnjOnMTbJo0XGF+kglk9l7agFBCjZz3aFnU4e1Ai1ATOgCz8SlXdqku9VWsYVGw/jdn
         NRI3Le1M8h10uo6w1VDLox0lzfYEZ9yweUy7o4hUH85SL4AXxC+pJLEkxaARJaPBVCkO
         byIC+6yToTmI+SjENBAuXP0xK41RiZHpl0ajISknS+wr4bgfUapu1jyaUS2zsJBOfK2J
         cmvw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PzniMpnu;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-6fb35d16402sor101678347b3.3.2025.02.20.05.37.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 20 Feb 2025 05:37:47 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PzniMpnu;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740058667; x=1740663467; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fa4LnSpmWM+FWDXKWITXcQ+buHuFTcP2Sh2OxmYGuSM=;
        b=PzniMpnuWRUVvJm6r1QugSwWugp4+EjSB+Z4840BbZv0RqF2pPrrHQhdCc1sstC9C6
         GvhLiPfGHcNeF9dmGRZKQSTnfFnmxrx0f6nogti3hKX3QQpTVPTVAk+p67A2HtcPxir4
         N8TCAP9FAYbvDuDQtiSy79U+6gfmEEI8Iqo/eiPw6qtXRT6HkyvNnEV9PENybxD1Gvmr
         ZmntMsKPEURWtf/OUmT2cyBFdbbbBq++h99M3dcNc7+S8gecTQ5mFIqbpxymwq1w8lfi
         iioPNhKbS2+xCrllTpQXRaXPN7fZfnqmbpOhgjW+949lasTmh3bIbsneM8VRY6NjCrXG
         +fmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740058667; x=1740663467;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fa4LnSpmWM+FWDXKWITXcQ+buHuFTcP2Sh2OxmYGuSM=;
        b=RVwiUVr9MIp16WPLfnO73OGuue3tdxZFifCict/rhlKKSU1CxaqdGCTEEVkbTTCPSz
         SH8IciuLZnrwy7ARlyd+WNXySBlLAjSwHz1UR7sF4WQIyiNBLIU3BVp/0HGuENpaG688
         S2DeTFNjd025psUZELkwLZTZ9bk5sjFACfAkKb1lcHZftD/07/fJZO76umdOEXm8K7+K
         AuFQxCmL4vELTFjQ7jjFn0rF2BTfb8vVD+7nhH7HjWS4VGlolat1r+OJeCYzFNc9yj82
         dJJb7dRdgSBlRQw8jIVtI/CU0HlszpXcB6FFXKfxNblNoWefFNifFYHufEhkp9U4pKB7
         0AiQ==
X-Gm-Message-State: AOJu0YzxbgJxbqh3UtLUrvtCEpgwce5PxiJNKPrH3/3BwyQfueLyCFux
	qJLLfeUZHLI50TFsLcZdXhYDzuIc3w+oqTlbdP7luZXrAaHNBwkqUrKMtiUNhRKDxxIWOkM2Zrl
	S0orb+T1Uutk85NwU/oHSG1fLadVmmPhSscCysAok4t4WTe7xuMQ=
X-Gm-Gg: ASbGncvcAD1bw/yP91D3KzbNtkzolEakL6IlX2GEdUTThlqqCM+86B63a/2B5X3afs7
	5D2Ikgf8fa7lRXvppv6Jww1CeWFWz3C04PSc5DopevUC9qWz1YDqUb8F/gPY/5YJoWbXCS4fTqw
	==
X-Google-Smtp-Source: AGHT+IFPGY9bQskzA+16G70k25BejPSkx8Hkhy1eJCAFVRVYIPSAPZ7T9bQEIpQXGjyIjCuRgNXZ+Q72FMkx0S4Xzk0=
X-Received: by 2002:a05:6902:2b02:b0:e5b:248a:bf2f with SMTP id
 3f1490d57ef6-e5dc92ef7ebmr16790092276.31.1740058666981; Thu, 20 Feb 2025
 05:37:46 -0800 (PST)
MIME-Version: 1.0
References: <20250219150009.1662688-1-alex.bennee@linaro.org>
In-Reply-To: <20250219150009.1662688-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Feb 2025 13:37:35 +0000
X-Gm-Features: AWEUYZlkaRug_jNCoWmm4s1_5JiREgJ4pWCXtTkgYFaAmG84oaTcEoeoMFXzxBI
Message-ID: <CAFEAcA8Tz97tUBLXD00XkzrbWu3ncOS7tciwkY_Pjq2-jCtBpw@mail.gmail.com>
Subject: Re: [PATCH 0/4] testing/next (aarch64 virt gpu tests)
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org, qemu-arm@nongnu.org, 
	Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: AMB1yzGTzeWK

On Wed, 19 Feb 2025 at 15:00, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Hi,
>
> As I was looking at the native context patches I realised our existing
> GPU testing is a little sparse. I took the opportunity to split the
> test from the main virt test and then extend it to exercise the 3
> current display modes (virgl, virgl+blobs, vulkan).
>
> I've added some additional validation to ensure we have the devices we
> expect before we start. It doesn't currently address the reported
> clang issues but hopefully it will help narrow down what fails and
> what works.
>
> Once I've built some new buildroot images I'll re-spin with a while
> bunch of additional test binaries available.

Running on a non-sanitizer debug build, I found that
aarch64_virt_with_virgl_gpu hit the timeout. Looking at the
output the last thing printed is
2025-02-20 11:46:36,864: [shadow] <default>: FPS: 45 FrameTime: 22.585 ms
That timestamp is 4 minutes into the test run, and the same
[shadow] test takes over 2 minutes on the with_virgil_blobs_gpu
test, so it looks like it just hit the 360s timeout and might
well have finished OK if it had been allowed to keep running.

Actually I'm surprised the other one didn't hit a timeout,
because its log timestamps show it running from 11:35:03,896
to 11:42:26,468 which is definitely more than 360s.

Is there a less time-intensive test of the virgl code
we can use? check-functional already has way too many
tests that take minutes to run...

-- PMM
