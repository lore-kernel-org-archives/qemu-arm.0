Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3431922lfq;
        Tue, 12 Jan 2021 02:40:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxRmBnO5nim9FzeGaQ/J1da4KC0uSLfnvtgEP8tm7PUygb4DL5GygMzot+QxWPOoKsh45hx
X-Received: by 2002:a5b:78d:: with SMTP id b13mr5830526ybq.88.1610448021673;
        Tue, 12 Jan 2021 02:40:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610448021; cv=none;
        d=google.com; s=arc-20160816;
        b=t9agSRtbFgery7ZeJ2Y5OWRRLv9krykIVS3dHwpQFc5fID5G5U/NhhEKNeaAewuL4K
         O8RyVuzwLGJ1YqxwsHNfhR6uNbm42yNIGeAkKQUbCGqZ+izAh59C9AuqO8hr3f+Gigvb
         e1qUMbZtyRTTZ1Y9iY6H/va3qhVRUR/Jtk/YJ6dhtQMdn+EwL4tjdYQtniIYtCkkurgy
         y9XgYcHEpsoSReu0uTiflSIL5Xjnwq+B4GLNA2YawYRRVtWdt3UJM6j7aATdXrKvqt3y
         H4W000XNWVp5pl8nPIeM90gBe0Obn9KniKd1ZYvDzwSh2GeMYTjtczmYdWItMq/O1G6U
         +AKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=19cL4wojbQuqSJ16gyCwngGtDBfXVS72TXpqKpEjZRU=;
        b=Ofyft+oxEdn17LFa9nyWJL6uLEk5/1bQviHn5hsiitNUq0gauJ0hT0mqP4xrYKjbNz
         bigAoWeoW4sv5yuL6rYP10r/k7RiN7QDjJ5OiZz28CnqyUdmz8XdkYQfpLyO+BEffuZY
         rk6qpjzptTn6kZM+T2N3s7anuhY8/C43gUAEcmhvNroOHdSh7SVD0Ws74UL7DcfdNv29
         q2pfIHEb3PIzKFFIp6oVnuQH38wPw4JPneSYzqQSL+nLkIlz0mAnVJHJISDqn8zGDnuM
         +0+AoP+vFsPCm5pZwWaOHKu0/nNjlNRSP3si0RwmeXu+3JZYyezDxl6ht6YfjmAPnwrK
         f2EQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ATDN9zGm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o185si2214943yba.184.2021.01.12.02.40.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Jan 2021 02:40:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ATDN9zGm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kzH65-00059f-38
	for alex.bennee@linaro.org; Tue, 12 Jan 2021 05:40:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzGPJ-0002Al-5O
 for qemu-arm@nongnu.org; Tue, 12 Jan 2021 04:56:09 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:41670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzGPH-0003to-0Y
 for qemu-arm@nongnu.org; Tue, 12 Jan 2021 04:56:08 -0500
Received: by mail-ej1-x62f.google.com with SMTP id g12so448957ejf.8
 for <qemu-arm@nongnu.org>; Tue, 12 Jan 2021 01:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=19cL4wojbQuqSJ16gyCwngGtDBfXVS72TXpqKpEjZRU=;
 b=ATDN9zGmQvQlTZm/zMUTAsNYsYuBX7oeaMLyeiPPoVPoW2TgLIL2jdwc4yMt1PHbHF
 3tkcrdG2uJ6Uhsam31xwmHzfW6PZHfOF6m3EnJEBEBugQPfLRty8oLQTDsyYLepJx5Kp
 BwtgCBRdv+UvNk3fIEV16Js7U1xjHEmnvFo1C8Un5OTs3v/3ORXmvAcUc2o0MFXxlA/6
 czIr3a07cgyXs2AZGZxW7bHs0uaVfaFl9ca/xUWH7ZFgcltLmb5TN2UumV5qGefVloJr
 AtOQtkYAg+pSOi1benl+xjNQdczKBHgBFPqp5ZS9bZmvaD/4exjRg5/9CVq/SHrK+tGX
 CCFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=19cL4wojbQuqSJ16gyCwngGtDBfXVS72TXpqKpEjZRU=;
 b=mFgLCkkEHuJxwO+DJhwjoDlm2uPsXBxLhhV8zk6IM675r40UOGMtiOSEDJjQcEvedy
 79RePKxvKobnUdsmW5ceavjuxVBEnwswTuCCEEwut9Aqvc7aIhO9NOHtth3qFX1k7iG5
 1712NBqmhQ46hYr6wSB12vb2v9kxuYFRd3bNZeLu78f4M6UGbGeC2x/na3kDfsMBT2Nk
 jb4Zy865isWHwiphYEp3FNHdTJ3AQR8F0CAXI1LMXAnVKR8qvhFzFSnf5E5xApShkig3
 XLenQcxJGcnzp70AvQY5q4pkYnCTOP+ccF9AMdSuIM7SPSX4QMq3picA43HFMb5BVw8C
 +/9g==
X-Gm-Message-State: AOAM531Rj8+umtFk4yRzVNLq7LdMOTV6k+RAYMDrvl0fHiDcw7H/1sWL
 tV1KSiJRt1p7W6Ao8hNQCrm+tdXi/Dd26dQlo2GdQA==
X-Received: by 2002:a17:906:6b88:: with SMTP id
 l8mr2674759ejr.482.1610445365645; 
 Tue, 12 Jan 2021 01:56:05 -0800 (PST)
MIME-Version: 1.0
References: <3337797.iIbC2pHGDl@basile.remlab.net>
 <20201218103759.19929-7-remi.denis.courmont@huawei.com>
 <6e1eec7e-35de-4276-68ec-7e12cb73a699@linaro.org>
In-Reply-To: <6e1eec7e-35de-4276-68ec-7e12cb73a699@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Jan 2021 09:55:54 +0000
Message-ID: <CAFEAcA_gvYayKHb9zg8F3v3HfyXUptreJZq4ozOV3a-5+kPqyA@mail.gmail.com>
Subject: Re: [PATCH 07/18] target/arm: add 64-bit S-EL2 to EL exception table
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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
 =?UTF-8?Q?R=C3=A9mi_Denis=2DCourmont?= <remi.denis.courmont@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bdb8JL0doZFy

On Tue, 12 Jan 2021 at 00:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 12/18/20 12:37 AM, remi.denis.courmont@huawei.com wrote:
> > From: R=C3=A9mi Denis-Courmont <remi.denis.courmont@huawei.com>
> >
> > With the ARMv8.4-SEL2 extension, EL2 is a legal exception level in
> > secure mode, though it can only be AArch64.
> >
> > This patch adds the target EL for exceptions from 64-bit S-EL2.
> >
> > It also fixes the target EL to EL2 when HCR.{A,F,I}MO are set in secure
> > mode. Those values were never used in practice as the effective value o=
f
> > HCR was always 0 in secure mode.
> >
> > Signed-off-by: R=C3=A9mi Denis-Courmont <remi.denis.courmont@huawei.com=
>
> > ---
> >  target/arm/helper.c    | 10 +++++-----
> >  target/arm/op_helper.c |  4 ++--
> >  2 files changed, 7 insertions(+), 7 deletions(-)
>
> At some point I think it would be worthwhile to convert that target_el_ta=
ble
> back to code.  It is really hard to follow with 6 indicies.  Not your fau=
lt.

I think that there's value in having it be expressed as data
rather than code because then it can be compared with the equivalent
tables in the Arm ARM. I agree that a 6-index array is getting
a bit unreadable, but maybe there's a more readable data format
we could find ?

-- PMM
