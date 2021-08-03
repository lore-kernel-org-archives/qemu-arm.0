Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp2649769lff;
        Tue, 3 Aug 2021 08:34:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyoyK1kSZF4u7vAgIQvIpoINvbg4FfVTNMkLP5gybaoFRcsk4xbwTY55yIjWLeTQW/Cvdbp
X-Received: by 2002:a17:906:76d8:: with SMTP id q24mr20980581ejn.22.1628004879416;
        Tue, 03 Aug 2021 08:34:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628004879; cv=none;
        d=google.com; s=arc-20160816;
        b=FylI1FQNonUQ8rEvBB2Avc9h0q1HEDzUECTtjFQdnVNmq4FTeLRNgcl+6udYU4oThk
         90Z9taVYjuEHES9LooSC1zUpmLipDFoRZHfUKTqEeH5RYMfa9FBMYIB5eaWmcLJ9e37a
         JzQzOqc0uoz1FvhlYJVHzBzSPiHHDipAWvdY2ilPzxjl4E3tv9SsJHscP9MfhFER83FO
         ItFGz0unyR8AE5whtX2+MzB1vXGkgwi1C/iMfcd59hvz0issUOS6cwICmnnyxKDnNLaB
         nIi1xlvWOf9yL5z1IeudMeHLu11C8c6Qj7Hlj42VznIrTzlYyy2F+5DZh2GDrlhMWeg3
         ykPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Lk01qkJWsoAOcI68Wyk5wrcqsTLwGjKQSvWH5LgTiGY=;
        b=b0q3w49P+hXxz2jmmR2njuk4F1AvoqwQdi6DVj54tnZA8NzLByKiKta2baDuE64pQj
         Lx6XM2UJ1Gpj9NjEaGBEOSDTYjOiQQb+SpEuheePnTM9i0Gg1iAKEeJsHNlyNv8WWvpg
         THcn2waWYg8cfwoI3zeNIbQsLVhc2zDQ/QTWHky5JEsI8hl+ONQ4qP843wK7wF15MBiH
         JC4Dkh1ODWMVtpiTiD1gPP2kSrctlFxNnWnpmJyv/acc13XZ3IhWAjPgykElQMsPpP7K
         YZhKsltmnp53zYfkQ7pmX8fCXXskV5lZFWDaA6bY2pNnWT01h+YJNkb6RSmPTYVL9Q/H
         psBw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=R96WzYhf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id qq24si13184021ejb.538.2021.08.03.08.34.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Aug 2021 08:34:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=R96WzYhf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mAwRB-00064X-Tz
	for alex.bennee@linaro.org; Tue, 03 Aug 2021 11:34:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAwQq-00064D-J3
 for qemu-arm@nongnu.org; Tue, 03 Aug 2021 11:34:16 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:46063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAwQo-0007ic-Vg
 for qemu-arm@nongnu.org; Tue, 03 Aug 2021 11:34:16 -0400
Received: by mail-ej1-x635.google.com with SMTP id qk33so36961288ejc.12
 for <qemu-arm@nongnu.org>; Tue, 03 Aug 2021 08:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Lk01qkJWsoAOcI68Wyk5wrcqsTLwGjKQSvWH5LgTiGY=;
 b=R96WzYhf73Zl8huHbCd0eNua5klVn9Ami0y4p3Up2PCV+Ze6Bz6OxIcyLX5rJbDZqm
 k3mVGuzEuwlNz4KyxvpHlUEF7RdN1MqYc4TKa8rxX5PNoOPEvvofMTotZKPCcqjtTw3Z
 +WQSIiHIFWc4+H3SSkz9xNmZ8GsNrm1SVOAiHKcC13Ayzr/Mfysg8vhrS/6p7P6XlRbd
 +YJte06uMvQI+UWLiIat2FDPdraNt51SSHyOwOoMEvWs7484so7D+756z1U9N20ck2ul
 XiU/pKpxlIc/bQ5G7bNDoBVNxBI8h97b8WdkcucaPdejS/DrbtZcfWcehG8INxyUFNvu
 cd/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Lk01qkJWsoAOcI68Wyk5wrcqsTLwGjKQSvWH5LgTiGY=;
 b=mDQlAXHyiiUVJFPjEQUDLkLrs3DASY5hUqwQbrx73Zk+Mewuqs83vxxOLRdybjNVu0
 5xrWAod3xp6ThPu962VFqQSgs4pb7htqxoaZDtbMAaKoBpvxF7WfI6oO5xiHftjZKF4y
 DG/CJaYaTEjdUoeafOTOZ7u7VONxsxIHXFMaITWyDpIVqk6uZYtkzxFFgHjevEbHljpw
 iobofrK8ZN0NppXZUkuiQ+/8AYG3HFtNGHD/nUDZAYb5vLjoCqGvJkrQaHAS0lSKt9NT
 GdyBFePVbRgJln33rAM2W0nv6DgousjMNEsHNTv9fu3+L0UXkoq+D6JjkRZMK4pB+qij
 35sg==
X-Gm-Message-State: AOAM53047i8WsN2qQJmlB0zuYr4IjJPR226SNk3yXgXNGwUovR4WAaed
 OuSYRPpY9FaWamlaD1CbB2yWzTwOlNnGhj0+fO2oyw==
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr20905112ejy.407.1628004853277; 
 Tue, 03 Aug 2021 08:34:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210726163351.32086-1-peter.maydell@linaro.org>
 <20210803142947.etblpkgynnna3mvf@leviathan>
In-Reply-To: <20210803142947.etblpkgynnna3mvf@leviathan>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Aug 2021 16:33:29 +0100
Message-ID: <CAFEAcA-aP=24wEsRN9QJCxELv5qgULjfWVupcfCXaEsHiMUMvw@mail.gmail.com>
Subject: Re: [PATCH for-6.1] hw/arm/boot: Report error if there is no fw_cfg
 device in the machine
To: Leif Lindholm <leif@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Radoslaw Biernacki <rad@semihalf.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5FMl4yTwJXDO

On Tue, 3 Aug 2021 at 15:29, Leif Lindholm <leif@nuviainc.com> wrote:
>
> On Mon, Jul 26, 2021 at 17:33:51 +0100, Peter Maydell wrote:
> > If the user provides both a BIOS/firmware image and also a guest
> > kernel filename, arm_setup_firmware_boot() will pass the
> > kernel image to the firmware via the fw_cfg device. However we
> > weren't checking whether there really was a fw_cfg device present,
> > and if there wasn't we would crash.
> >
> > This crash can be provoked with a command line such as
> >  qemu-system-aarch64 -M raspi3 -kernel /dev/null -bios /dev/null -display none
> >
> > It is currently only possible on the raspi3 machine, because unless
> > the machine sets info->firmware_loaded we won't call
> > arm_setup_firmware_boot(), and the only machines which set that are:
> >  * virt (has a fw-cfg device)
> >  * sbsa-ref (checks itself for kernel_filename && firmware_loaded)
> >  * raspi3 (crashes)
> >
> > But this is an unfortunate beartrap to leave for future machine
> > model implementors, so we should handle this situation in boot.c.
> >
> > Check in arm_setup_firmware_boot() whether the fw-cfg device exists
> > before trying to load files into it, and if it doesn't exist then
> > exit with a hopefully helpful error message.
> >
> > Because we now handle this check in a machine-agnostic way, we
> > can remove the check from sbsa-ref.
> >
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/503
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
> Reviewed-by: Leif Lindholm <leif@nuviainc.com>
>
> However, the subject line threw me slightly. How about:?
> "Report error if trying to load kernel with no fw_cfg"

Yeah, in retrospect that would have been a better subject.
However, the commit is in master already (dae257394ae5) so
it is what it is :-/

thanks
-- PMM
