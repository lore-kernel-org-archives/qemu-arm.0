Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp651386lfc;
        Fri, 29 May 2020 09:36:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwoPZVntOmu1Uc6gfVqQw5yYvdbcPRqfR08up76zLEpEDJuY6HWIHcIT7VLeLEZMmUb+WR/
X-Received: by 2002:a25:ba4c:: with SMTP id z12mr15229913ybj.164.1590770204681;
        Fri, 29 May 2020 09:36:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590770204; cv=none;
        d=google.com; s=arc-20160816;
        b=x5ha85+F++Bl9v71eY6TNqNnBJ0BvI08DiJ9eY2xIy+UvgcBGWHZ77SbDdivxbr4Zd
         xppJ2OklB8nxPGPgKKl9LqXI5eVPb6sk65LG9r+eijDMnDzIDGSOEubTM9AwqrYHXE0c
         CfI0hfu5YrZL2hh4QOaczvX7BjzJcdcLX/0wgW+uVFUyYyrhzbbPhZ7D4b+PSilafymV
         raD27tG3riQrF5Iu+7fcLQIdlc4Q6VffzopsTMH+IUPM35HIlVFhmBp8Gvl7K5y2ZJSY
         L0BMvOiBPEefkGMt98yzrYOrDbHD3ZMknI8HRGjryYQH4F6DH6EM20Rdtqd9FMSicDX8
         qCwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=zXn7AXifg48JVqsK9vmLot62NN8E79cUAHW8G7tpJww=;
        b=pziSsE8yL2EtkHA7g1HaPcwpiQqIbNutiH0xBtCPCbIVvWJ0cwfEcYyTlBLHOkCJw2
         7EOqsOz8R9n5ONypKls6ZFlEOU5hxal4rlk1DHmTC5Gp+qp6snaiv8Iv4UTdKBaNTZfM
         sIhhprwCH82pA0qjy1gHJRFmFs1qANi9NsC3lv3Uk8NxajmkFTHHcr89II6tvSu7tMQC
         26/tFHnYJ4SKCRbUzbR+4sWEPeX08jIXQ/gOoLCXwsFkaeIeJuIeucvWnwqsjd/G689B
         UnqsX4fl1Qcqk3yyJyNdZye3X4+mCBwyoWhGP3W+w5kgkOldxt1ylQlUuhhqxwFkefV/
         BQRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HyrC0IA6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l204si8102413ybb.461.2020.05.29.09.36.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 May 2020 09:36:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HyrC0IA6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jehzw-0006WQ-1q
	for alex.bennee@linaro.org; Fri, 29 May 2020 12:36:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jehzp-0006W8-Fj
 for qemu-arm@nongnu.org; Fri, 29 May 2020 12:36:37 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332]:45342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jehzo-0004iB-CO
 for qemu-arm@nongnu.org; Fri, 29 May 2020 12:36:36 -0400
Received: by mail-ot1-x332.google.com with SMTP id m2so429752otr.12
 for <qemu-arm@nongnu.org>; Fri, 29 May 2020 09:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zXn7AXifg48JVqsK9vmLot62NN8E79cUAHW8G7tpJww=;
 b=HyrC0IA6nn1hI4HTbT7QugqwR/28LKc2Oy3eU1lM2KTLvq09G+60fVX49jH6D0V5PE
 +xqc1GD07svWmUwRVK5FmGR7EeYw5lvs5WchmhZLRJ8RbLgyZ5O/CA/qyLSmSRyMoYtV
 mxige4UJMHFX3ascDV5fVPwszVpViGOzd+KR6vrBoBzc1hi1GG9ALA+VPdsh7jLbqkGJ
 Xrz6xsKyHsj8E+kABOxK4RIA4nMiUpDW5x/Gc9huMDMhC4ko2IQSgNNynHAywiXPTcqH
 hRmGsVtBncbXv5RaMvpuCVfuuLzYR0snrW3TjYQz9Iob0kJh8Ex0GKOvOvdHwx+iu3wa
 dtJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zXn7AXifg48JVqsK9vmLot62NN8E79cUAHW8G7tpJww=;
 b=BlHMhWMcyVaABIV3ZoYazqND+e75Rmr/yuLvdZ1G3rkufmenVVSYEJTr/KuctQrDeF
 3T2/Rf+Zw7eW+rciJpDQkppw2qbR0Pl65PUiXnYfnIK3NBV0WblkdvOx9FYI7LKbMekm
 SwS/O4soaMUqnrKhYYiMLeDeMElrGE6lxuHR6HaLMiibrFr/lkkyn6mD7LKOv+Z5mK95
 t66e1Ix13NbYSY4eRZZ+EK2slu65D9+DtP6JrMaM5PRk+sUgLQ7tdT1ZqiGwBjLLmgL5
 ssCnFlkSm4I3EDw5vQIL2CwdwqA4TzWcKVA5EJEFbKLd9C9EcxSIY2QoGjUGu3jO/Z6k
 2rmQ==
X-Gm-Message-State: AOAM532RB+q2/T3co8LxoHx8BZuv8yUoTb4tdMclHElpzIXIMsREdiI9
 4OdRWWLqq3p+ezVzvE4MuMYfylvBWERi4NoiAzNiWQ==
X-Received: by 2002:a9d:3623:: with SMTP id w32mr6676198otb.91.1590770194679; 
 Fri, 29 May 2020 09:36:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200528123609.27362-1-kraxel@redhat.com>
 <CAFEAcA98OyyyC6gs34e3U03=dXz8GkDn5qf38UaO_XBB679V+g@mail.gmail.com>
 <bf43132b-71c2-d411-7cf3-e9a00066ccdc@amsat.org>
In-Reply-To: <bf43132b-71c2-d411-7cf3-e9a00066ccdc@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 29 May 2020 17:36:23 +0100
Message-ID: <CAFEAcA_Su+2O6nm0hRfj1BqwQzSsLva+ft_f=1O47-o6U8NxBA@mail.gmail.com>
Subject: Re: [PULL 00/21] Vga 20200528 patches
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x332.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, BALATON Zoltan <balaton@eik.bme.hu>,
 qemu-arm <qemu-arm@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DbbtYwPoqU9d

On Fri, 29 May 2020 at 17:15, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
> On 5/29/20 12:29 PM, Peter Maydell wrote:
> > Could somebody send a followup patch to fix the indentation
> > error checkpatch notices, please?
>
> If this is part of your scripts, this is a nice feature :)

No, I just noticed the patchew email.

> >
> > 5/21 Checking commit 97f369f2479d (hw/display/cirrus_vga: Use
> > qemu_log_mask(ERROR) instead of debug printf)
> > ERROR: suspect code indent for conditional statements (16, 12)
> > #34: FILE: hw/display/cirrus_vga.c:1038:
> >                 if (s->cirrus_blt_pixelwidth > 2) {
> > +            qemu_log_mask(LOG_GUEST_ERROR,
>
> I explained on the patches:
>
>   False positive.

The code is
            if (s->cirrus_blt_mode & CIRRUS_BLTMODE_TRANSPARENTCOMP) {
                if (s->cirrus_blt_pixelwidth > 2) {
            qemu_log_mask(LOG_GUEST_ERROR,
                          "cirrus: src transparent without colorexpand "
                          "must be 8bpp or 16bpp\n");
                    goto bitblt_ignore;
                }

checkpatch seems correct; the qemu_log_mask line is misindented,
and looking at the commit this is a misindent introduced in
commit 2b55f4d3504a9f34 "hw/display/cirrus_vga: Use
qemu_log_mask(ERROR) instead of debug printf". The old
fprintf() line was using indent of tab+tab+4 spaces, but
the new qemu_log_mask line is indented by 12 spaces, not 20.
(Tabs are always 8 spaces equivalent.)

Some days I wonder whether we should just do a bulk detabify
of the QEMU sources.

thanks
-- PMM
