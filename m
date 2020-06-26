Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp674424lfm;
        Fri, 26 Jun 2020 11:02:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxMzwFQ7pj79xbdFvXfuI0StTAKtrhbiIPL9yOv+OOL+IzI4Y/V8uDfdArKZBeMF53BLXEP
X-Received: by 2002:a9f:21ca:: with SMTP id 68mr3314954uac.38.1593194570768;
        Fri, 26 Jun 2020 11:02:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593194570; cv=none;
        d=google.com; s=arc-20160816;
        b=K2OzwENCxd866U3kK58bW+MkwluFYXTl40vxxywSTnNmHGLHpCnIWtf1a0czHcypaC
         vhEirv9ZOKFTOqGKM45HK3Os7+5xL76gVzDHs6jLRj/Wl3KuyiRuZCKdFbEUhJ93K2Cj
         B+T7KPBW6eP6/5r4MUgbuV43r2ZyrtoYIq8cDv6zxXpY/ohogfFN83Of1501zwmCuPAv
         Z2FR3jcDJKIKrJLCgec4lM6BPX+zgJLeVBccuTr+BX/MjtPdyJx75hW+DremR4Fa4VGy
         /KaVCvt8YsA1umySoLFR7COZx+BV8E00ucUe75hsEW62PTzKx+lmPAp/C39pxoozTxq0
         0wEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DWf1F1yoSUirKfAbWVvx4my8NgD6TYH+Hfcy6D67Z4k=;
        b=nVrjdmmNiZPKHKmjVTkJgJdxObPXtY883iU52RgYEXNga8eFnh5QJXEaNb0yenIaRi
         kYiv2hGvcAvgL420qbnKLNguA2mZ9TYmQWc5TdGnV/xzG1m7T2P8jCsLJfnMJ3140fGQ
         nNEwz930OgOzZmC7WmXRxxtt0/YGLaDJtrf90g1KaVib6nT/exKj58tbyVHrNcTP6IEn
         L2yPKCKSdHXxmjj277A0GfTWhjXOzYw4MaZcmcjqwh3K/6aob2ul7WFRlbmsaUjkUvoq
         qCs33gf7uH80+8wsuEt4uYzm+VkoQ9MRv1hBtkItRl2BAdPg+x+QzGo8E6QlEP6Rb55b
         loyg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=E9ivmQdJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v14si3663188vkn.49.2020.06.26.11.02.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jun 2020 11:02:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=E9ivmQdJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:33844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1josgc-0003zL-4D
	for alex.bennee@linaro.org; Fri, 26 Jun 2020 14:02:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1josgT-0003u9-L9; Fri, 26 Jun 2020 14:02:41 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:40106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1josgS-0006Pi-3N; Fri, 26 Jun 2020 14:02:41 -0400
Received: by mail-pl1-x643.google.com with SMTP id x11so4538659plo.7;
 Fri, 26 Jun 2020 11:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DWf1F1yoSUirKfAbWVvx4my8NgD6TYH+Hfcy6D67Z4k=;
 b=E9ivmQdJG3OmE6DnLA5f3eKN6WRrDC276YSRHDv7hhlwoODGyrv+B+OKEdSgBMMrVJ
 L1PhFbE+a6/tlJoRlHhpeYELun8Y6Wf4R+NzxHCTuNAa1FZX2OgqGm8ry4oOpJfGSyK5
 rhdIBX6nc4XIkTN0NAPWphk0whGdbWTpWSWcbM8X5bK7RGtpeS5OZxKdJk+9clVramil
 VKaAjKW487xwe+8jyDbF0hJTisyBA8K82OEFcSuEwdIRPbiABVXmpcCt0TLXeWdA+KmB
 xsQ18cvc6WEqZJuYNOuQfxyAruF02oSulczfhMh7MHcXa6ZMfjcyHRwFeBdosafTnX4v
 R+JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DWf1F1yoSUirKfAbWVvx4my8NgD6TYH+Hfcy6D67Z4k=;
 b=C1Hb/6QHW5GYfpmYrQjbOUaxyhZt/FoLcaGXtqmCuVx8jCK6+6nrTs4/3LGp1xT9O6
 APGuGeGNopD2QJgoLxwKc6XxcePI0MikuhMqvOieTxSZhzWHAo0WTkb07VvRLyEbTnUM
 qE+KQC9paFy879/aJz+aEOSghufxSnIBLuz3L8O1RPsRqqVAeFLiRwYSXXkx/2DPEsrQ
 ikowekYw0sX8gF6NdE8X6G/WRPLjsiyBtvuzbnqRyLAJifTbFscT64JrrwafOgwtwf0C
 TOqDEh/lPntL7wP6yGHpiE/F2KGA0AKDaSlhxTDgMN/jYktWfuzouBkFh3c+RI5lmyf5
 wmJQ==
X-Gm-Message-State: AOAM531a+BAp1RtrBdziUUeOGrSLN4VGctYZSJSHfC3NbBSjOJtrhTNj
 ACLCWwbSXEzFZQR4ESuM4sHU1+D1cE3G4V6JR6g=
X-Received: by 2002:a17:902:6194:: with SMTP id
 u20mr3485128plj.333.1593194557481; 
 Fri, 26 Jun 2020 11:02:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200625230740.549114-1-keithp@keithp.com>
 <CAFEAcA9ut5CVAgRTP-_BK3WpiDSmitFowZMe549TvgSAjj+Kfg@mail.gmail.com>
 <87imfdixv9.fsf@keithp.com>
 <CAFEAcA_ZRMpqAhR7BL05a+O_C54fhXZn8-+kC_KUU5n3BpzoCw@mail.gmail.com>
In-Reply-To: <CAFEAcA_ZRMpqAhR7BL05a+O_C54fhXZn8-+kC_KUU5n3BpzoCw@mail.gmail.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Fri, 26 Jun 2020 11:02:26 -0700
Message-ID: <CAMo8Bf+57b=u12nMp4EWaza3WdOQpx_L_O=HvdouM99wW-Xe=A@mail.gmail.com>
Subject: Re: [PATCH] hw/arm: Add 'virtm' hardware
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-pl1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Keith Packard <keithp@keithp.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +xesZEDOdp0a

On Fri, Jun 26, 2020 at 10:32 AM Peter Maydell <peter.maydell@linaro.org> wrote:
> You might find the user-mode qemu-arm sufficient for that
> kind of thing. I know some gcc tests run that way. You
> get a processor, semihosting, and whatever memory your
> ELF file's data segment says you have (plus anything
> you care to mmap()).

I routinely run xtensa gcc testsuite in user-mode qemu, the results
are the same as when I run it on a remote board emulated by
system-mode QEMU. OTOH for the glibc testsuite the results in
user-mode and system-mode emulation used to differ significantly.
Here's my account of differences:
http://wiki.osll.ru/doku.php/etc:users:jcmvbkbc:glibc-xtensa
Most of them are due to unsupported/differently implemented
syscalls.

-- 
Thanks.
-- Max
