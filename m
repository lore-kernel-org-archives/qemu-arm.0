Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1162360lfm;
        Thu, 25 Jun 2020 03:46:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyq3eRdhZG40B7yQDrtCGCtZStnpr8Qx1r2knQx/uGERoHVHf/zGiJ5VP3mOm7U2Q2ApvAi
X-Received: by 2002:a5b:5:: with SMTP id a5mr48119644ybp.514.1593081981906;
        Thu, 25 Jun 2020 03:46:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593081981; cv=none;
        d=google.com; s=arc-20160816;
        b=F0Y2i76C3gheIdDASvJRpDkDBW12866ce769ONuDql/1DUBLz0NF6KRY0uka0Haar9
         jM69UCpm5mga+yZJD7PSWozH2b0BVFxRK5J+4LqOr8RH9UMoTULeJWS1EUzqmjlniPQq
         G0bBadvrV1SNusABF9DDnHLWuzTdBsuVv6vhaWPsVXNxqNaIv/OVPsxuJZJ/AIkvJGAY
         mwsFupCN93+qIf0BZJTmmt4YZZSIj5ynUKq5vh+WeH0A9wvWo9YOMSnt75tFtWYnv7hT
         AaB76Ba2gPF/ZuCzbipVI9D8hsxhWFzBMPwVdURDf0FUd8kX6qxjGoq8W2WTyAmYTsPe
         nAzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+Mx21h3y+Q75lM29HgRdR7KtzfXMxQn8kCmJI0yVOGY=;
        b=Qurv0N4ozkNwvSafxfBdX2E+M9tMt6MzS9r1wOqTOabop3ly+/PECuRXC9J2ubLja6
         5mG3TEHHGQPI7aeDxa3ewjHpScSdQuVT6JCS0UMG8q0Pa3KiFtaPTe1NE/kfeKTvS+xK
         AvNUo4LcNsAo+o+E127NHLQVSiOwjYyrGpgEFoBHVNJVlZSib6O8OgDEocyqhNfHESGr
         n29d1FeOlukcrMCiW/QdZEFxfsvVLeBoN5qptslyZdbnXV4L3T9YTmMD3+KmnwJCkbhl
         ks+lFBEKdbN+TcxtP1e+0xSEBNykhtEMOlVC4qAQecmaN0olm94kVlHhwRSWWaTtdlkg
         h/2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XEeBBj7Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e69si22551322ybc.305.2020.06.25.03.46.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 03:46:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XEeBBj7Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1joPOa-0008Q4-Qb
	for alex.bennee@linaro.org; Thu, 25 Jun 2020 06:46:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joPOS-0008PQ-Kq
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 06:46:08 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:44562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joPOQ-0006bo-0g
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 06:46:08 -0400
Received: by mail-ot1-x342.google.com with SMTP id 5so2802989oty.11
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2020 03:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+Mx21h3y+Q75lM29HgRdR7KtzfXMxQn8kCmJI0yVOGY=;
 b=XEeBBj7QU+2ZevEeZYp7+lBSIwViX4f+XJGKXmphsyvyNrDq1UngL+/g8qbbTZix75
 I1UgEcTvcbeKqnmCvgzMbSpceEubY8NqxznZNheyi54CWmhBLzwrSXZFryzIumdKO7Fv
 38m0HwknUOeFufXGEMl+dVhmYI1Wd0qJ1nvp6o5r1hNTMgVkvhw6tBmZdnr6qnjgGxQ2
 UZ11Jk/buXcrABjgZpKDHSHYXYUPhy66Jvkw2T5SrKzQ28W2c8BFRZnC4hszOkMIeLhm
 uRKGGzDIX08Q/qCYCd7yvBF1UczlpUyfIT82uT9L42t3sFYF7IGUaHwh+t/bu5MUOs0U
 e7yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+Mx21h3y+Q75lM29HgRdR7KtzfXMxQn8kCmJI0yVOGY=;
 b=N+F94oemNzImZemiPoNDxvo0ck6c9Yw9MvBH154SPHWqlYebKqdTXZhkSrFwMdOo9h
 9EkqgLcL6O+1LE+7UYhuOXJe0+kgA0z8wXlMVRUWH/XFgMlkxzDhrbHptDxWagWJYisL
 Uo4qW8bcvMTpzQVs1ElmP9l8MqSbILOaqGqWMM8Rp8Yg3TfniE8rOUl5q7WeLQtT7uIU
 dDhVJY0bdxLHAVu/8m/OHziXp6w41cvheCIrHJlgW8RWZ+/Cqt8pbxEs/+vo4yHLcR/T
 /uRZk6+ShOI80G1x9kiC0zt+78zLInDNHV85ifBI1L7V0xW3490zkoijhKwak2IR+0Ct
 vNyw==
X-Gm-Message-State: AOAM530cdZupnrZpVhW3C71GsxeHdRVzMKAhSWBuYB1GxfC3Vv7lXl39
 f+d3YFkphgjWy6pitWJDXDgB3QyvwHcvxMNH/nqtqQ==
X-Received: by 2002:a9d:5786:: with SMTP id q6mr12336731oth.135.1593081961502; 
 Thu, 25 Jun 2020 03:46:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200623193658.623279-1-richard.henderson@linaro.org>
 <20200623193658.623279-15-richard.henderson@linaro.org>
In-Reply-To: <20200623193658.623279-15-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jun 2020 11:45:50 +0100
Message-ID: <CAFEAcA-JDMyGiiypfz8uDqT7yf9Fv2AhLbMNELXz3Vm9vMJxXg@mail.gmail.com>
Subject: Re: [PATCH v8 14/45] target/arm: Define arm_cpu_do_unaligned_access
 for user-only
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: david.spickett@linaro.org, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BxRGFIK7H06E

On Tue, 23 Jun 2020 at 20:37, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use the same code as system mode, so that we generate the same
> exception + syndrome for the unaligned access.
>
> For the moment, if MTE is enabled so that this path is reachable,
> this would generate a SIGSEGV in the user-only cpu_loop.  Decoding
> the syndrome to produce the proper SIGBUS will be done later.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v8: Raise the normal data exception + syndrome.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
