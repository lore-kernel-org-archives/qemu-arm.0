Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1249776lfm;
        Thu, 16 Jul 2020 00:54:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxtzcDvxaVORmqhnmAw6TQec+AGlnhORPVZs7n7tpOTYg9HraRzG1+jAmrtO2wtYZyroBAm
X-Received: by 2002:a5b:f03:: with SMTP id x3mr4558220ybr.32.1594886082892;
        Thu, 16 Jul 2020 00:54:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594886082; cv=none;
        d=google.com; s=arc-20160816;
        b=gp6MQEw/UUfUHB5ttaD8GixgDkPt0E+fN948LnuXZiu+k9rmwEeSvYpfMxE1hQBKT6
         rN0Mnj1fdTC0inMEH+E4KfURFUa5Tf66hVpcWXwTkIqAut6k5nb2k4juXuufGPoMIzsY
         +5Oc3Z4fp+aXe1q9BPVp7fkl5ISPDWD083ihqSKS9n86B9NaTSh2t3Ma/aBG4LxyLp57
         wr0/JmG1XDRT6MbL0D/S2dqZj57GOORSRoFmY1G8J5XD86HKkOAUXFZhhH8zxdJ482TU
         jPsQKjc7DCuARnv8SEvnZ4wchHQDlkbCUEcIEPzIRbfYXkyOeVajmPtO8KznpCxOV88P
         hS7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=xUcuCANla6QWG55l5nrD61xLU5a8E+PWSqV3G7mO+Gc=;
        b=d9b+AZ6PP6adYaJYst6OWZKifbRJsQYBncJtXFBxgY/04UKQm+yGJvufbeA6nnIGiN
         VVImeAU6i4tkpxklx5EPFzr0+cGZbJn/BqC5802UfSvr6XJ8SSj67v5YevteixsaRHAx
         5aK/YFNaThhcm6e0UIHgG021RjQcuVEqcW1cjea4gLQFcuc+ZB++5oloTjqjSo2Heiaz
         kd16Pcj7MASFi4PPZEbPw6aUx8r1UtOaJcaCUpNTMAaGj6jdk52stYFiAi9qpKjNwJCK
         6hcWQvGgBNZGzuybDFBdbqNUbnHw5XUGLjtAEniuYplS9j1lIvLt+zjHOmId4taiAthe
         7TUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pcIuGLDR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k3si5402963ybj.189.2020.07.16.00.54.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Jul 2020 00:54:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pcIuGLDR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jvyj4-0001Lc-0m
	for alex.bennee@linaro.org; Thu, 16 Jul 2020 03:54:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sundeep.lkml@gmail.com>)
 id 1jvyit-0001LE-Ri; Thu, 16 Jul 2020 03:54:31 -0400
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143]:34263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sundeep.lkml@gmail.com>)
 id 1jvyis-0003Xh-5b; Thu, 16 Jul 2020 03:54:31 -0400
Received: by mail-il1-x143.google.com with SMTP id t4so4286119iln.1;
 Thu, 16 Jul 2020 00:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xUcuCANla6QWG55l5nrD61xLU5a8E+PWSqV3G7mO+Gc=;
 b=pcIuGLDRN0pEGipMQJtI2jVkys5Tut7LTuTxSiSl6kxuZUyS606+WIzHNVLCaLUcJs
 ZATqztRQH+YfRqEQIH/zkMVw/w5SFK/clCY25FbbciDhDbi6cwrDCBjzipb347HXiYvZ
 g8vp4hyFfbg+ItPmDpgPUHQ1FntCGS9kxKi2nRMVHosnHAe0HePFb1PphGSZ54jt3cpy
 pJ2eTx4zuQpnJLdun1JoZEXwm8Vczmg1A09TK8BHsOb9JDf7ysZPWqdJmC+6nTadMT0J
 l7stYaSKWKS39EMV8icx1A/WHjjlZ0w4/NdtkROM3fzXOsVQ//QbSsvzOghezKx3JsA8
 OiHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xUcuCANla6QWG55l5nrD61xLU5a8E+PWSqV3G7mO+Gc=;
 b=njWXXjZEyGiafzxAawgV9p8XA93Mh0TL3kCnXSVjC0mXHzjcGK56IMSubpkqxumuxK
 JadtgSQtrrhwC3HvVdvFiyfeRV8RsjTlvJmQJrXP12iANgrevctarjNoSRm+AjO2guj/
 kM7gURo69KprdQwXnsKE5lqmPnSjZHSw6ImoilS4VsOAp3V1jrWOhtTzes8Jm01bZeJG
 lZEzIktlE7jlHVpziaTwZjpcwu7ekoV7mtktOsnzRXy1UGXZH0eqwYZxtlCR58cZVG4l
 MZJqESEVqHVaiOB2G5CN4aX7+O/3Ou4gspn02IZAP4EmzqrJxgClZ2CGOU3RT3PD7gug
 voCw==
X-Gm-Message-State: AOAM5317dZ8RyfMG4ihMWxCuUC5MhtvAeYTLNQxFmwVQSKKz+L6nDMIi
 CEvquHLT5RVNyafmwPDQaT8ywGRVdlk48q1WR0U=
X-Received: by 2002:a05:6e02:128d:: with SMTP id
 y13mr3315673ilq.305.1594886068312; 
 Thu, 16 Jul 2020 00:54:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200715140440.3540942-1-armbru@redhat.com>
 <20200715140440.3540942-2-armbru@redhat.com>
 <ef1d7fe4-0558-cc7b-16d7-906c4aa9915b@amsat.org>
 <87wo34u9fv.fsf@dusky.pond.sub.org>
 <CALHRZurw_HsyFmNWYuG_Cagx8cTTBCGzafWmx6JHJ+NS7aVKOw@mail.gmail.com>
 <9b3f870c-481f-79f1-e55e-074ee0d95633@redhat.com>
 <4e08aa92-0db0-1a09-0716-5f5ff896910d@amsat.org>
In-Reply-To: <4e08aa92-0db0-1a09-0716-5f5ff896910d@amsat.org>
From: sundeep subbaraya <sundeep.lkml@gmail.com>
Date: Thu, 16 Jul 2020 13:24:16 +0530
Message-ID: <CALHRZuo_T5ZVS32M8jukdu6iqxsSf=apXi=dS8y-vY1u=kuWOg@mail.gmail.com>
Subject: Re: [PATCH for-5.1 1/2] msf2: Unbreak device-list-properties for
 "msf-soc"
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::143;
 envelope-from=sundeep.lkml@gmail.com; helo=mail-il1-x143.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-riscv@nongnu.org, Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Alistair Francis <alistair@alistair23.me>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Beniamino Galvani <b.galvani@gmail.com>, nieklinnenbank@gmail.com,
 qemu-arm <qemu-arm@nongnu.org>, Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DkYKj8UtfP9I

Yep I will rework on this soon.

Thanks guys,
Sundeep

On Thu, Jul 16, 2020 at 1:06 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> On 7/16/20 8:07 AM, Thomas Huth wrote:
> > On 16/07/2020 04.59, sundeep subbaraya wrote:
> >> On Wed, Jul 15, 2020 at 8:12 PM Markus Armbruster <armbru@redhat.com> =
wrote:
> >>>
> >>> Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:
> >>>
> >>>> On 7/15/20 4:04 PM, Markus Armbruster wrote:
> >>>>> Watch this:
> >>>>>
> >>>>>     $ qemu-system-aarch64 -M ast2600-evb -S -display none -qmp stdi=
o
> >>>>>     {"QMP": {"version": {"qemu": {"micro": 50, "minor": 0, "major":=
 5}, "package": "v5.0.0-2464-g3a9163af4e"}, "capabilities": ["oob"]}}
> >>>>>     {"execute": "qmp_capabilities"}
> >>>>>     {"return": {}}
> >>>>>     {"execute": "device-list-properties", "arguments": {"typename":=
 "msf2-soc"}}
> >>>>>     Unsupported NIC model: ftgmac100
> >>>>>     armbru@dusky:~/work/images$ echo $?
> >>>>>     1
> >>>>>
> >>>>> This is what breaks "make check SPEED=3Dslow".
> >>>>>
> >>>>> Root cause is m2sxxx_soc_initfn()'s messing with nd_table[] via
> >>>>> qemu_check_nic_model().  That's wrong.
> >>>>>
> >>>>> We fixed the exact same bug for device "allwinner-a10" in commit
> >>>>> 8aabc5437b "hw/arm/allwinner-a10: Do not use nd_table in instance_i=
nit
> >>>>> function".  Fix this instance the same way: move the offending code=
 to
> >>>>> m2sxxx_soc_realize(), where it's less wrong, and add a FIXME commen=
t.
> >>>>
> >>>> That addresses this other thread, right?
> >>>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg720658.html
> >>>
> >>> Correct!  I wasn't aware of it, thanks for making the connection.
> >>>
> >>
> >> Thanks Markus for the fix.
> >
> > It's rather just a work-around that avoids the crash than a real fix. I
> > think we can use it for the upcoming 5.1 release, but it would be great
> > if you could rework this code for 5.2, so that the nd_table handling is
> > moved to msf2-som.c instead.
>
> Yes this is not a 'fix' but rather a kludge.
> Thomas gave some tips to work on a fix here:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg720658.html
>
> Thanks,
>
> Phil.
