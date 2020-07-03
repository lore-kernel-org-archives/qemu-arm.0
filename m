Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2418421lfm;
        Fri, 3 Jul 2020 05:27:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwrvmT6JOkbOSfQysGlMJQNhDHma+8kXOhUStGbIfUTgWV6CFRb4GbzowOLv3bjfO2q/a6L
X-Received: by 2002:a25:774a:: with SMTP id s71mr56587513ybc.123.1593779263051;
        Fri, 03 Jul 2020 05:27:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593779263; cv=none;
        d=google.com; s=arc-20160816;
        b=wk7kmZswIO1oscIXDVhG0dE1Yr8FqeiF2j+c4MQE6Ok2z/KGoa5evqNV5dZkpYB6uj
         Z3dNHCbhjNeXttGkIx1hAPhOJRkqqu7nZVx2oOwmBpslx2PjK6sa/jlIE7/RJLwWXyA3
         k2hiqxaDfgWXtoOKZ9aHN4NAPb/OFlbu1nvPatb9d/6P5xdMesOSFrXsLbdSeS010e6v
         f1AN9QVQ1+w9cQTE4W+yMjU3ix8EQGkZk2RXBs/E5FGg83KOhebhqEsbqaUZuAa9gWTh
         6kiZWFEwkhWNuLrn9em4uTllpbgbKy/dxUUnIBWYVSECpzZdR7ewHV15BIQ4eZcSP0Dv
         lYHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fo9aOEQy9HS3e+hOF9SLpkb8z3Qv5g3aGyuhDZkmsgg=;
        b=QEpaWThlY921XNjeeC8UXM+c7fB+GO7IyAxrp3Whxdbufm5zhFAjrUZ0nmCP87ribl
         bcR+KUnJ0GU2hlDvDOmAC8W7iFqrNX/C7VwH3EYdg87KNSN84iZY4djz/ItI2p6L69n+
         ZNmLXPCFSZIuSzqY4oCsNRkhaG4pKwZgO39xp1jxlQj+V6m8ec+eS16uQ6l0dy1wy4hz
         tNbKzRyfOQW+zBVPQP+AaNULDP95XfvVxwUKgK8aa5ZMv0lEzDa1gG6caITAF8Coa8nF
         SxMPxSqsvFIoLFgh+kMxLXegmYDJAJFp5qAD3EMw4Qxvrih3gUKesT0hS4zo/pIcTipW
         qCpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hvDTwEXJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v82si11819388ybb.285.2020.07.03.05.27.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Jul 2020 05:27:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hvDTwEXJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jrKn8-0004eC-F4
	for alex.bennee@linaro.org; Fri, 03 Jul 2020 08:27:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jrKn1-0004dz-94
 for qemu-arm@nongnu.org; Fri, 03 Jul 2020 08:27:35 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:44033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jrKmz-0005eu-I1
 for qemu-arm@nongnu.org; Fri, 03 Jul 2020 08:27:34 -0400
Received: by mail-ot1-x342.google.com with SMTP id 5so24550752oty.11
 for <qemu-arm@nongnu.org>; Fri, 03 Jul 2020 05:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fo9aOEQy9HS3e+hOF9SLpkb8z3Qv5g3aGyuhDZkmsgg=;
 b=hvDTwEXJ6gzghd5wygsGUlwfGeokQaTvlGhEHJCHq8JSeWI6cRRTkrhIuA5cNSquHg
 NSosRkmvCPnlurfgWDCIbcI3l0SiOiTuAwx5Zi09GJJZGzMAQGHGsz3TejkdYJFnwqwI
 u7fitq/uGAEhWqgxE/XmUZRBmnLL2RntCz7Y+VJipgJ5V9yWQV7cjPIphb7iFbOzPpqK
 3q8O/SuNhEN2+bPR19bS1bodrFshAxOPIsTIEmYH1mFbBdm7HjJI19+uJzT6VgiZZuQH
 Wew5v4YuOfNmLIKs5EerBJpUQYTfuA6Q0jtBblWoldnvQDoeABkeXxzdgCo0le0/IFkB
 WZDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fo9aOEQy9HS3e+hOF9SLpkb8z3Qv5g3aGyuhDZkmsgg=;
 b=iSylK1FRfsVXLHlrtFxRQixyyCHVM3t3pccBSSScBPxUgm8vZ/14sVPaCI5aYj+svn
 tPqLjXkn5LfCfB9UTAaWOXeT7ga+Gd1aKJf3lRwSS42pFTSfWr0cCrxPha28Oz0xnn4Z
 uv0cIM52JweVDkpvd6/nnprgYMtSyaQeWXS9sBfXPSk2w1VMUrvOmJTdqXuU53dJQEJ8
 kXX7xrjIb3LrCrCTX/jmg2/AAkFTy4gxqzXpWIaIPAuoYgi9CRsGq8I68TG7QsoQFn6K
 x2YDMh6F9NTMInUj4lXEyBr3cob8A0bJQ5CKvbDRrRAG98G6hi/r611HzH08Oz5zBGjd
 +GnA==
X-Gm-Message-State: AOAM531sowjxUckyx1/iMJLKCO5dfy8C2AY/Oh2vhrXOvN0W24H4Lg91
 NnNocqWSDUSQZjFw5Ba82OCKmXIZu4IRrUovXiDhHQ==
X-Received: by 2002:a05:6830:10ce:: with SMTP id
 z14mr22973761oto.135.1593779252183; 
 Fri, 03 Jul 2020 05:27:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200626235519.591734-1-hskinnemoen@google.com>
In-Reply-To: <20200626235519.591734-1-hskinnemoen@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Jul 2020 13:27:21 +0100
Message-ID: <CAFEAcA_3y3XoF6BsYUt19f2CvyseahSEZWfY0iQxByJKaMA29w@mail.gmail.com>
Subject: Re: [PATCH v3 00/12] Add Nuvoton NPCM730/NPCM750 SoCs and two BMC
 machines
To: Havard Skinnemoen <hskinnemoen@google.com>
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 CS20 KFTing <kfting@nuvoton.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 IS20 Avi Fishman <Avi.Fishman@nuvoton.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AQ0Os9ABiIio

On Sat, 27 Jun 2020 at 00:55, Havard Skinnemoen <hskinnemoen@google.com> wrote:
>
> Time for another refresh of this patchset. Sorry it took so long -- I've been
> trying to figure out why the Winbond flash model isn't working with
> npcm750-evb, and I'm fairly convinced the number of dummy cycles in DIO mode
> should be 4, not 1. Unfortunately, I don't see any other machines using Winbond
> flash in DIO mode, so it's hard to prove that it's correct. I'm planning to
> post a libqos-based test suite separately.
>
> I'm also planning to add the vbootrom to qemu as a submodule, similar to the
> other roms, but not in this pathset (let me know if you do want me to include
> this in the series).

Hi; it looks like codewise this patchset is ready to go in
and it's all been reviewed. I see however that all the
new files are GPL-v2-only. We usually prefer GPL-v2-or-later
for new code: is it possible to use that license instead ?

thanks
-- PMM
