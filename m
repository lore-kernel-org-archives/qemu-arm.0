Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp6634151lfa;
        Thu, 22 Oct 2020 07:48:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxyOJLjORO+EbgONqGlkiscNbf14WusGKLiwwhlg6LtchKPi4BYcroGR6vMTHL59AX8uPUN
X-Received: by 2002:a25:2006:: with SMTP id g6mr2454108ybg.199.1603378088238;
        Thu, 22 Oct 2020 07:48:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603378088; cv=none;
        d=google.com; s=arc-20160816;
        b=TAcodnCmxBoif74Wmc0ypeEK/xd5Syop4bRF9lAxvCAZwDyY6UCfBJLrPVuFVtXFhL
         hH732Ge4YLUN8X5eA8ksnSUV5uw5M+Hd5gcxJma44D5pzStPXpAsZc7NqvECZhOFwfj1
         yJDiE8v/JbOD4eRsMuvsXVPFSmfbKmHgf663jSTr+Hh2A5PVmpdfXCKgV0iR+9PlHJSe
         kxJyzFUhHz1cM0oHWSmAjdUwM54k5ZDTjacK21oHo7ygmEpQRuyyJgXkUxNuZ7hEmmv5
         eVAkpGfD4tYa786bKj7/MZ1EFHAJPTAQwp9ow45bCpMN1YESWrkzQtLOl8Xs5RWy6gDa
         77Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=b77JewTCsY5w3VE9r+PUJLALWnsFtRg3SpYh+MB1KOs=;
        b=nGowcRJ1MHrMtbvyHqvq6hcnezRqmtd1tmuEr32RANJK/0MUr/Z1opGf1eMaAlJOrx
         xAgPSciRo3jmtMNuJILP+xSaLkkDFZYJy9HoDmCzDIbsUnPJPenfoiICUG+ktyfDEwXD
         O2pq9UaPTmVI9YZjNM83TyrD+CYL5kYcHncA6iGenX0rrSBK/hRySaehCTwimIDIpVnF
         Bi24EL1DkNbn+tIcItMjF+wPU0uWtbVu2vZJicByfjdCxWMG/siHx4wkbibrHBpnLG3/
         mv6eFd6NrowVpLYkvVnfxQYXItRG8WW3qEkgeGj8pmMozgHveBaEujUf7C2JZMI3iEoq
         Yp+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=rf9VtslC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c9si1614427ybm.451.2020.10.22.07.48.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Oct 2020 07:48:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=rf9VtslC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kVbst-0001Hg-L4
	for alex.bennee@linaro.org; Thu, 22 Oct 2020 10:48:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kVbsk-0001Gr-Le; Thu, 22 Oct 2020 10:47:58 -0400
Received: from mail-yb1-xb42.google.com ([2607:f8b0:4864:20::b42]:35793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kVbsi-0006KS-Re; Thu, 22 Oct 2020 10:47:58 -0400
Received: by mail-yb1-xb42.google.com with SMTP id l15so1854219ybp.2;
 Thu, 22 Oct 2020 07:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=b77JewTCsY5w3VE9r+PUJLALWnsFtRg3SpYh+MB1KOs=;
 b=rf9VtslCxgsboWqOGqxztyXwy5pdSWSeiktu8JmuDdMtEb5xYj0w7rD//JbN2Z7OFy
 IDYGl/Nzzmg8wKUl+HHQyCInOd3+++uuiigxFqnLMyLQXdd1W2Rrka/1vg6HsVxxjAEP
 4VVLSTObbIj3jLz6lDc6lvnFd3XtyesUvF+Bp6EWa2qWWeFTpl4Sggfl5uqAqthPrs+W
 /oIeH/mBrCntU3rTduAFwr45RJXghdGBDNnsVTYqrUESZpDTxnrk8Eh7vfgywZw5Fjdg
 0pDDbw+vM4EpibYIWtig+ijR/UBWe8HQxMECSnDIHpzw/SSGgP08fN1sOVp3VbEO5vvY
 QUmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=b77JewTCsY5w3VE9r+PUJLALWnsFtRg3SpYh+MB1KOs=;
 b=ep4t/y5RxZ5YPFF2ok35/M58ln43HdtW1w3trVfveSqKxi0GKrezW/+e/GuKFW/v5d
 ziPfas8jrbBivL020ZRHObF4JApYRQPDy4YdWpQoYIfhKqcdJ4SSPn24vboV1ghwwinX
 XjFrBDcRahClqa8pfyAkL+dffpAIYfbalCmb9e4ob9ByDjIuqJQkdKjcyzdJRuHGtemr
 ptJ03E+JfJmxVkrF8chbucmh4ovw3/AAZmQRRA/9dlcJL0cPrGsk7CARPuxYH5q/McOt
 OahqHiRwLL5wzxd2W9JN+v5Y+HwbFxMFUzaMz20BFzLuZYW8LXzdRKjBkiwhMTsqhqB5
 Ny5A==
X-Gm-Message-State: AOAM530b+Wuef+Yachu/bG3Y4hQaqt6Z3B/9w87yHviUcrQ2yvV7QfOa
 9l1QMcNY6oh65+WkWdofSeL9Oo/BGLzJQX8VrPc=
X-Received: by 2002:a25:386:: with SMTP id 128mr3519037ybd.122.1603378075129; 
 Thu, 22 Oct 2020 07:47:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200821172916.1260954-1-f4bug@amsat.org>
 <20200821172916.1260954-23-f4bug@amsat.org>
 <e378932a-1de3-83c1-834f-ae6526604cb7@amsat.org>
 <CAEUhbmVFZ8aWdv48D8acdfFRp6WMYL6n=ENeo4hBZfmqE9TrDA@mail.gmail.com>
 <a0ac3805-ec48-2a0e-6511-b142bfc6f214@amsat.org>
In-Reply-To: <a0ac3805-ec48-2a0e-6511-b142bfc6f214@amsat.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 22 Oct 2020 22:47:43 +0800
Message-ID: <CAEUhbmVLFJWND=KHexD12mrCMJSO3mcE6k7_tRE+v8pNZjhN_A@mail.gmail.com>
Subject: Re: [PULL 22/23] hw/sd: Fix incorrect populated function switch
 status data structure
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b42;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb42.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Michael Walle <michael@walle.cc>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bWwcO8qdeOd7

Hi Philippe,

On Wed, Oct 21, 2020 at 6:07 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> On 10/21/20 11:57 AM, Bin Meng wrote:
> > Hi Philippe,
> >
> > On Tue, Oct 20, 2020 at 11:18 PM Philippe Mathieu-Daud=C3=A9 <f4bug@ams=
at.org> wrote:
> >>
> >> Hi Bin,
> >>
> >> On 8/21/20 7:29 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> >>> From: Bin Meng <bin.meng@windriver.com>
> >>>
> >>> At present the function switch status data structure bit [399:376]
> >>> are wrongly pupulated. These 3 bytes encode function switch status
> >>> for the 6 function groups, with 4 bits per group, starting from
> >>> function group 6 at bit 399, then followed by function group 5 at
> >>> bit 395, and so on.
> >>>
> >>> However the codes mistakenly fills in the function group 1 status
> >>> at bit 399. This fixes the code logic.
> >>>
> >>> Fixes: a1bb27b1e9 ("SD card emulation (initial implementation)")
> >>> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> >>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> >>> Tested-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
> >>> Message-Id: <1598021136-49525-1-git-send-email-bmeng.cn@gmail.com>
> >>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> >>> ---
> >>>    hw/sd/sd.c | 3 ++-
> >>>    1 file changed, 2 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> >>> index 7c9d956f113..805e21fc883 100644
> >>> --- a/hw/sd/sd.c
> >>> +++ b/hw/sd/sd.c
> >>> @@ -807,11 +807,12 @@ static void sd_function_switch(SDState *sd, uin=
t32_t arg)
> >>>        sd->data[11] =3D 0x43;
> >>>        sd->data[12] =3D 0x80;    /* Supported group 1 functions */
> >>>        sd->data[13] =3D 0x03;
> >>> +
> >>>        for (i =3D 0; i < 6; i ++) {
> >>>            new_func =3D (arg >> (i * 4)) & 0x0f;
> >>>            if (mode && new_func !=3D 0x0f)
> >>>                sd->function_group[i] =3D new_func;
> >>> -        sd->data[14 + (i >> 1)] =3D new_func << ((i * 4) & 4);
> >>> +        sd->data[16 - (i >> 1)] |=3D new_func << ((i % 2) * 4);
> >>
> >> This patch broke the orangepi machine, reproducible running
> >> test_arm_orangepi_bionic:
> >> https://www.mail-archive.com/qemu-devel@nongnu.org/msg739449.html
> >>
> >> Can you have a look?
> >
> > Yes, I can take a look. Could you please send more details on how to
> > run "test_arm_orangepi_bionic"?
>
> Looking at the previous link, I think this should work:
>
> $ make check-venv qemu-system-arm
> $ AVOCADO_ALLOW_LARGE_STORAGE=3D1 \
>    tests/venv/bin/python -m \
>      avocado --show=3Dapp,console run \
>        run -t machine:orangepi-pc tests/acceptance
>

I tried the above command in my build tree, and got:

avocado run: error: unrecognized arguments: tests/acceptance
Perhaps a plugin is missing; run 'avocado plugins' to list the installed on=
es

I switched to `make check-acceptance` which seems to work, however not
for orangepi-pc related tests?

 (09/32) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_o=
rangepi:
SKIP: Test artifacts fetched from unreliable apt.armbian.com
 (10/32) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_o=
rangepi_initrd:
SKIP: Test artifacts fetched from unreliable apt.armbian.com
 (11/32) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_o=
rangepi_sd:
SKIP: Test artifacts fetched from unreliable apt.armbian.com
 (12/32) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_o=
rangepi_bionic:
SKIP: storage limited
 (13/32) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_o=
rangepi_uboot_netbsd9:
SKIP: storage limited

Any ideas?

Regards,
Bin
