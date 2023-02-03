Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1270629ejb;
        Fri, 3 Feb 2023 02:58:57 -0800 (PST)
X-Google-Smtp-Source: AK7set+PL7aPbf4jlqdT2heRokzIOb9+9eTu3LNp1TA+fPlG+7IsFt9N5ZmYCAXukptchovVG+fa
X-Received: by 2002:a05:6214:5a05:b0:537:649f:747c with SMTP id lu5-20020a0562145a0500b00537649f747cmr15835794qvb.11.1675421937131;
        Fri, 03 Feb 2023 02:58:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675421937; cv=none;
        d=google.com; s=arc-20160816;
        b=VZyPNdgR70aCXTk5tjKJtJogM9nV0RDCC5hU/8WgL3dynOHvIRaZ7QhdhysOSkVWv+
         gFIkMoczqAmwd9QQ7hbiu0X5h9/vHqIFh+kKuCyuZB/b4ykOpF//qIWAoZKagyCuTuBI
         fHW/omh7ZtM5GHbjcDqK+OHXv6URupILgUnyf4L0rbz1RoGpupVLnK7EWHkuDhAzypi9
         FM3LAr6Y/sVlreN7VzsB/wjSnRa0psiRsr52Diwjxse2a8D6HpiCQda8bOJh5/T/4zcI
         2krkAfYc4/Pb2gylV+9F8QQav6U4FIp4QfFF7gtq7ybIVj1WPk1DWUxiGRbKbu8O47Ep
         G8sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=8d6mjyLHkJPyIiWXEMIz2NyVjGrTa16pNi+vqTctrCA=;
        b=KW+IwkVowWGxHIKFIF5C9svlzNBRIVK+8e9MzrmzGYE8Of79x5Isg2Oefgi3XKEdW9
         llgNXak6OaeF2QB57jjvPqNHm/ZR+qmg9D7xZDDFg+We8JC336pEigLqMLLKFeWKtxo4
         OvjOYbfMjQek58AfHXnmWt8oQvatNYvFFyey7a8fk5n5c7swjSb0v+aq7G8BndPTD1Dm
         xWuJ4o78db8KlHVqtKakMZySzgID/19XM7tDkLRkUhhsE5Lh5Dc/hOsdqT4sy/N8TRXj
         30UzwLfWlfSNTtl6n3PFihSdmBWNGS1lb7x05hPOTqCHFt7odjsrDMxgXTJt2O29s6Br
         ixkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BeNguZON;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m4-20020a0ce6e4000000b00534cfa29801si1271048qvn.452.2023.02.03.02.58.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Feb 2023 02:58:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BeNguZON;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pNtm6-0002y0-Te; Fri, 03 Feb 2023 05:58:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNtm1-0002xM-Tw
 for qemu-arm@nongnu.org; Fri, 03 Feb 2023 05:58:29 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNtlx-0005lm-Fo
 for qemu-arm@nongnu.org; Fri, 03 Feb 2023 05:58:29 -0500
Received: by mail-pf1-x42f.google.com with SMTP id g9so3257692pfk.13
 for <qemu-arm@nongnu.org>; Fri, 03 Feb 2023 02:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8d6mjyLHkJPyIiWXEMIz2NyVjGrTa16pNi+vqTctrCA=;
 b=BeNguZONfJtjDUnPRw/lLrRlkIfZ67iXqhlApl39t7uaSylfz7kYk1Bkl6fNZFp8id
 VRkhfi6Qb0RJ+m/3zIGBJKAAmsi9eeQ8p1L3mXwbN/RMH5qYEs1u6sI+9gomx10uNG85
 9jy5xrOtIilwy0MLNrJ8/koWTmWoNOVigxsI3Y2cdKrupp/UCXCNJ3zzOq4nu4Bmx2ur
 BFMRGwboSSYGBAHSdkci/L5a4rnQykQMnSfb4XVRkHJlMmV5nFY6KLrgUJkrgipDuU6i
 ZEJucumglBqWi3iUmaFmp1Zn7YsjHmcwnZd1j1mrwvgHgOBxkdUYMmM8yrXEHH47bMiC
 wPDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8d6mjyLHkJPyIiWXEMIz2NyVjGrTa16pNi+vqTctrCA=;
 b=ipLBIqbxflyYmMfHUNdLNswnyqinMkYUk0FesvYhuSCmpdcU0jB8woRUo/b+M0ziqD
 3phBROwLuyevsTQJU7alPh/HRpH29nLIQWamLE7P2S+4y7nM8tfswPndwOr3QSCBRpdj
 gJk5l6gGla6Xwlrjj0TI1N45pUdv784PbsbWs/hyYxbYIoPm4QuW5svHIqRDqRVEK10/
 ++UW8+dNiV6geCOWe+F5bMORii3EieZx4/7jOMI2jWq5a9TEy4y9lMHD7f1HGKbOeuQ2
 VzmMUkcmozZTzROkpO9UA+Jb7CZNmQV8Eypaoz3EimnyvaaBbCxddUi22idxlmkSkuhu
 yrNQ==
X-Gm-Message-State: AO0yUKV0sn1dM2wsbvfOar7d8Xt9dYzg+BuVTeMs/KcqGw8C9tiQHb4+
 dOgXHjMHDwUTKBwUA2QJzfRoEnf4DjA3bC7PqcvuEQ==
X-Received: by 2002:a63:1a51:0:b0:4da:e1c7:99be with SMTP id
 a17-20020a631a51000000b004dae1c799bemr1591532pgm.37.1675421891381; Fri, 03
 Feb 2023 02:58:11 -0800 (PST)
MIME-Version: 1.0
References: <20230128224459.70676-1-agraf@csgraf.de>
 <CAFEAcA_u2=QJiuCWfZ5ZQZ_mevqCR0iZO51ktnqzTaY7xWfUQw@mail.gmail.com>
In-Reply-To: <CAFEAcA_u2=QJiuCWfZ5ZQZ_mevqCR0iZO51ktnqzTaY7xWfUQw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Feb 2023 10:57:59 +0000
Message-ID: <CAFEAcA-TdE1YHo6hJ0xvN2qZ8NSafqqUSFQwovJcTmWm=k2NvA@mail.gmail.com>
Subject: Re: [PATCH v2] hvf: arm: Add support for GICv3
To: Alexander Graf <agraf@csgraf.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, osy <osy@turing.llc>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42f.google.com
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
X-TUID: /ShKV3QjXz3T

On Thu, 2 Feb 2023 at 17:56, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Sat, 28 Jan 2023 at 22:45, Alexander Graf <agraf@csgraf.de> wrote:
> >
> > We currently only support GICv2 emulation. To also support GICv3, we will
> > need to pass a few system registers into their respective handler functions.
> >
> > This patch adds support for HVF to call into the TCG callbacks for GICv3
> > system register handlers. This is safe because the GICv3 TCG code is generic
> > as long as we limit ourselves to EL0 and EL1 - which are the only modes
> > supported by HVF.
> >
> > To make sure nobody trips over that, we also annotate callbacks that don't
> > work in HVF mode, such as EL state change hooks.
> >
> > With GICv3 support in place, we can run with more than 8 vCPUs.
> >
> > Signed-off-by: Alexander Graf <agraf@csgraf.de>
> >
> > ---
>
>
>
> Applied to target-arm.next, thanks.

This one *also* fails 'make check'. Please can you test your
patches before sending them?

The fix is not difficult (another missing qtest_enabled() check),
so I've squashed it in.

thanks
-- PMM
