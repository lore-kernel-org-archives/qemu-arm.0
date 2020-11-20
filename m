Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp1459459lfb;
        Fri, 20 Nov 2020 08:39:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzBPi7ablTww+fGjZD74s76yUIMsPL4JWmk0xvvR7ShzbE9TrEBqKC59QmgHqGeKXFyv4Xp
X-Received: by 2002:a67:8c41:: with SMTP id o62mr13845466vsd.49.1605890363440;
        Fri, 20 Nov 2020 08:39:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605890363; cv=none;
        d=google.com; s=arc-20160816;
        b=F6YstBwFWGpXwMjFLj6RlFvlnvO1r4ikiCX/uA5D4cl/MW1mzuDPMzCFysXz328jRY
         tXp1hgzKwDrEVbzk4yFkt5ugQzHubz+7XoT2bWk+HTkMufWUpliteMCtrDZ4vJB2mq1n
         GxsQY3bJ2qeDOwxxRwrjoVQw38k2CZbkBQALXbjzP+ZggwmZQWMt3rVFvB9Q6nxUX84S
         cXAFCTJ/jXJ19ksT4kon+uKrRt74j88+RWh/DiWhIgprV/h4DJyvriH0E1/KFoZnF6So
         HhPPDib9RDSF/qcQ9PcJWR7jpNBuYm6iRTmGydEBP3KxrZ4myg2syZyp0TIZF6E2qyfD
         fuQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=9lRlHFFKCdWP0KQA4oVpERWDC2UU98p0VwmPKgcL1oc=;
        b=GTL5kc0UzMY2oBnRtZGNd70mdjKWkvCacLww7tvIsgV7UYLLgVFFEFdq51aVOmXnIM
         DmhsSoG89670VGMVbgN2HDW1s5jascx+3IquyCVx8pfc95tK7RcAs9CpDD6zlLV8XD5S
         kroE8yZE3NOrXEl+JuvIKAOXhp+3DwBMr7iW2WsCy/ELKJXBtQL1sGdLnb9UYpw7cpBl
         PdgkNW0l1O/SZcqFkNIS6MpifGtrS3ebhSyZoplB68+rX4Ns+Fd3rPaMqRRLZITpUaVl
         8EUxhRgYGIjwJ5N8ViaertmE31UW4DxNXZO0+Q/nkL0mT3Wqm7GhXw8ve2d1vI5KjeP8
         YezQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wqmeCYRl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g9si724339vsi.110.2020.11.20.08.39.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Nov 2020 08:39:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wqmeCYRl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kg9RS-0004pG-P6
	for alex.bennee@linaro.org; Fri, 20 Nov 2020 11:39:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kg9RB-0004mq-7n
 for qemu-arm@nongnu.org; Fri, 20 Nov 2020 11:39:06 -0500
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:37535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kg9R1-0000TD-Rk
 for qemu-arm@nongnu.org; Fri, 20 Nov 2020 11:39:04 -0500
Received: by mail-ej1-x643.google.com with SMTP id f20so13730125ejz.4
 for <qemu-arm@nongnu.org>; Fri, 20 Nov 2020 08:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9lRlHFFKCdWP0KQA4oVpERWDC2UU98p0VwmPKgcL1oc=;
 b=wqmeCYRlAYKAnSeUI2avsaEEgbISS7JZ6ckyJzgaVWdKP8+8GyystuTLgV/QJBLofo
 /UOKui5Lsyk3WOQy2nThJAYvRRmlH1yZgSgDRHrrUram9Ojxzkga2lcbFNc0hsAv7aCm
 dqEpdJ5sUTbuzxBr+/BSYSTEDIcWXnc8zlGAUoUMNs57iavQUTk5BFOCHQGe5G2zecZR
 mpPikfEPpK1kLydgnV2XD6UlB+9BMtABrEIjbPnC7Lzbz2FCI5K8I5sxwqiK/2MPwKQc
 oG+CW6/f7gcuV96OaqFpDSepj0WYfHmyevqNEqCqprkinmqkSrZUY+7qiuAxQRE5ECAK
 xZLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9lRlHFFKCdWP0KQA4oVpERWDC2UU98p0VwmPKgcL1oc=;
 b=n+4Hd/jcCPl5TrSJ08Xf7AA3euWSn7qQuqMNcbKwe1nT+PSpbbwB93zT2zeVcwztcQ
 2mDJRhhojoZeFawr4IF3tXV1m02UWdL08TfsxQacbO3/X7w1XKZMjVJZQFWfI2OYL3ny
 Fk1rLNvYEe7/hFUgvNFxFcwLI5cn1Do+gSB5uPTdbORT9NA+zvmmrVaGdbixsPOIn1qT
 9k6JTyyQyd7YT+l3mQfM8pJ1wTngBIA+oruvAXX9/1a8L5gqgKb15EDSnz/unSjUFrrU
 pDnKwkpCR4yZJoyI/6Idtkob+VnNZvfCZsUy4UZRYccJdWiomt+cJqN8apCR1H92jNhO
 xnuQ==
X-Gm-Message-State: AOAM531neKbFvTU0uuTDKpGKQ2kXR6Kgf1io2tK8BO+gOabuXN1yewGn
 piSrxU1ZdVnBu9RHRaNwb3N5ro9JnX7vist3PiOYnA==
X-Received: by 2002:a17:906:b53:: with SMTP id
 v19mr1775586ejg.250.1605890333697; 
 Fri, 20 Nov 2020 08:38:53 -0800 (PST)
MIME-Version: 1.0
References: <20201118150414.18360-1-remi@remlab.net>
 <dcebc069-43b7-0a82-809c-55d6b090fff9@linaro.org>
In-Reply-To: <dcebc069-43b7-0a82-809c-55d6b090fff9@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Nov 2020 16:38:42 +0000
Message-ID: <CAFEAcA8gbMnWAT000Dsbk3=dh1+izXFhX-0VxFo6hCCNN0Og6w@mail.gmail.com>
Subject: Re: [PATCH for-5.2?] target/arm: fix stage 2 page-walks in 32-bit
 emulation
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x643.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?R=C3=A9mi_Denis=2DCourmont?= <remi@remlab.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZCGzGzzOy027

On Thu, 19 Nov 2020 at 22:37, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 11/18/20 7:04 AM, R=C3=A9mi Denis-Courmont wrote:
> > From: R=C3=A9mi Denis-Courmont <remi.denis.courmont@huawei.com>
> >
> > Using a target unsigned long would limit the Input Address to a LPAE
> > page-walk to 32 bits on AArch32 and 64 bits on AArch64. This is okay
> > for stage 1 or on AArch64, but it is insufficient for stage 2 on
> > AArch32. In that later case, the Input Address can have up to 40 bits.
> >
> > Signed-off-by: R=C3=A9mi Denis-Courmont <remi.denis.courmont@huawei.com=
>
> > ---
> >  target/arm/helper.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
> Peter, bug fix for 5.2 or postpone?

Looks pretty safe so it seems reasonable to have in 5.2.
Interesting that it's taken so long for anybody to notice...

-- PMM
