Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp790608lfp;
        Wed, 29 Sep 2021 14:28:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJykrupxu/jOMDo9kYGoV+6F9NPPo4gBHF9RJhoCpTC8tkAbZLOxlz5GBch6YITMiZh5Ko4q
X-Received: by 2002:a5e:8346:: with SMTP id y6mr1403989iom.33.1632950912500;
        Wed, 29 Sep 2021 14:28:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632950912; cv=none;
        d=google.com; s=arc-20160816;
        b=hkzCLuOBXOqzbJK3WkKquUoxoA3i8SXr/wvMGcTOj/Q615ETMD318Gg1pOxeozZ0h+
         8k4fl1JijoH8pSk339DJpTr/EH/aE6E+BR6tqw4D44FJS0vMSbKBbeeAC/KO1dDvEzSK
         7fD/rhg7Yex9HtSmI7oiN7bbwdNcXZVPmLVU78CoEiyBFMueUCYtEqSKUH/LW41Kh0V4
         lfgn+cfdn8S3MPzwsdWrtX9sUYrJ4v9tWN3z8DLDT1urbGxxfMvf0YigxD2erYQ/bD8a
         SBoIgY3go1gqw3iISdyv2pXx0dudSNP+AQyP7Tda2SK/I0YIYVWf8eh9HM9wGX9hE6ta
         sLXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=tApL4dO7T3ta68pFUFhW57VhWPj0RpOozrohuooX/XA=;
        b=oD9TaMK3sK1gKWS+z0EoYBYpVq4vTtCZGwnRk6eV4b3d3fuGJLRcNJ9zLXSEXXjzfK
         E8bR3XIVyFNi6wgUaSwd5PxTcnkEzVOVdpoNzLQ5Iz9oncEM3sMzT2OhsOHMd0WRdj/f
         mPynTg2+shE1lPFLW5AhTamXIy+Db7AZ1DMh28N6LhtOPHIQYnDNdQgBPr51/ZqRm0oN
         PVfuEXU2Vadba3JoFwoWXD7diNPvHI0tUZOSyG1Frk3XO/zcMsQ+XFv9RpNkanmAhB1z
         gOxPXUkxKTOG34P07TrvEfcacE7eqE0Q14iFk56ErqGsXGEHfKTczFzZTKNzXPohF1z2
         7NHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=s6juyrRy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c3si1015117jaa.39.2021.09.29.14.28.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Sep 2021 14:28:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=s6juyrRy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:53498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mVh7v-0008O1-RE
	for alex.bennee@linaro.org; Wed, 29 Sep 2021 17:28:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1mVh7i-0008NU-R2
 for qemu-arm@nongnu.org; Wed, 29 Sep 2021 17:28:18 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:36765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1mVh7g-0008Pf-Kn
 for qemu-arm@nongnu.org; Wed, 29 Sep 2021 17:28:18 -0400
Received: by mail-ed1-x52c.google.com with SMTP id y35so13902288ede.3
 for <qemu-arm@nongnu.org>; Wed, 29 Sep 2021 14:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tApL4dO7T3ta68pFUFhW57VhWPj0RpOozrohuooX/XA=;
 b=s6juyrRyTJJJex0KyKwD7wYBeowtuXlC0KxmrVp1DzzMCLr4AgHay6icKE0CLIUEGZ
 RYkm5JVDf9iGUn9JqcyXBy1h2IeTPprM/+e28tLUMJYkDf/ExfV4sQWfRHh89rgX2jLP
 gATMJzx1t310phTa1W1kJsyBTD1SRAd158Wbt78GUmAcu9C7B8EvHwVaTXD2CQ4txehJ
 weRq3hgPZDeoIUyj8cIIUzlLaSzIeVQD++S9GJnY4MUgGZQI2C2Cwn2XZ9rlBlM8s4hd
 cOo+wHJBWshs4ccyyj+BtHh7Mw7QQ+EgrmkbgB0uw43HXOiXyQ+er8LMgj62ST2MyT0R
 ZNUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tApL4dO7T3ta68pFUFhW57VhWPj0RpOozrohuooX/XA=;
 b=zXxbxRDXv68I47GvDCD5OJqEVnKvkHGoliuQUIQXegLcWD65Or6wYRRSiQcgWrId5U
 dE2cE9Iuc3DZOizEiOJ1uJyUpfkhH7WevxFuQiRs5UnqYo/zblkAh6lFjdYXWiDTctuZ
 1I1XAGoqoMU3zsFGwtmirfXk2V9XDjZH/Y6g/QT4EyS5yVSFkbTyACOu08IQT2VEohtU
 ROmAaNUIoY0VP0A4pVzRDNo1nZDkZ9AUMR7dOTV4ugdpD7F5kEPOphtUzn29Pol2QsYF
 N+u113pqGCGeMzQ+1Tcw7ps1c4qVDRVCLdIahMS4R4efEIAp2kzZPdwSktwnLIP3Mwd7
 xY4Q==
X-Gm-Message-State: AOAM5327oa4/PZf2hxNtu2FgsPVJgLlP3EysrJE1gSUFk9Fg4R4/Z9a1
 N5wzYg5DsOFEpaL0DIg94zaS+CEzX+aPrQGPKupLSQ==
X-Received: by 2002:a17:907:3e05:: with SMTP id
 hp5mr2287172ejc.527.1632950893752; 
 Wed, 29 Sep 2021 14:28:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210928223942.244860-1-titusr@google.com>
 <85fb7136-c7b3-8144-d79f-19b5e95e83cb@kaod.org>
In-Reply-To: <85fb7136-c7b3-8144-d79f-19b5e95e83cb@kaod.org>
From: Titus Rwantare <titusr@google.com>
Date: Wed, 29 Sep 2021 14:27:37 -0700
Message-ID: <CAMvPwGqspcxEjzZN8rC5noPpf0G4zK7G8FyLxCPC3j2-4qdnjw@mail.gmail.com>
Subject: Re: [RFC 0/1] hw/ipmi: add an aspeed IPMI iBT device model
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, f4bug@amsat.org, 
 andrew@aj.id.au, wuhaotsh@google.com, minyard@acm.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=titusr@google.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uPj+gNocH3U4

On Tue, 28 Sept 2021 at 23:24, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Hello Titus,
>
> On 9/29/21 00:39, Titus Rwantare wrote:
> > This patch follows the Handing IPMI for emulating BMC patch set by Hao =
Wu.
> > Building on top of the work in [PATCH] hw/misc: Add an iBT device model=
 posted
> > by C=C3=A9dric Le Goater, this iBT model works as a backend to ipmi-hos=
t-extern.
>
> Could you please resend with my patch which is still available here :
>
>   https://github.com/legoater/qemu/commit/c6b679690f32534e8992d96752d90d2=
c4aa48130
>
> or here :
>
>   http://patchwork.ozlabs.org/project/qemu-devel/patch/20210407171637.777=
743-20-clg@kaod.org/
>
> and in another patch, the modifications you made on top of mine. That
> will help understand where the problem could be.
>
> You can modify patches but you need to keep the original author name,
> commit log, signed-off-by to certify its origin. Then list the changes
> you have made and add your signed-off-by.
>
> The patch you sent seems to be mostly mine and I don't see any of the
> above.
>
> Here is some more info in the kernel documentation :
>
>    https://www.kernel.org/doc/html/v4.12/process/submitting-patches.html#=
sign-your-work-the-developer-s-certificate-of-origin
>
> I don't think we have the same kind of documentation in QEMU but it's
> the same process.

Thanks, I'm still learning.

>
> > Needed to run:
> > - [PATCH 4/8] hw/ipmi: Refactor IPMI interface, Hao Wu
> > - [PATCH 5/8] hw/ipmi: Take out common from ipmi_bmc_extern.c, Hao Wu
> > - [PATCH 6/8] hw/ipmi: Move handle_command to IPMICoreClass, Hao Wu
> > - [PATCH 7/8] hw/ipmi: Add an IPMI external host device, Hao Wu
>
> I have no idea what these patches do and where they are. They seem to
> modify the core IPMI framework and it is important to understand the
> overall changes. Please include them in the patchset first since they
> are initial requirements.
>

I've pushed everything here: https://github.com/Rwantare/qemu/tree/aspeed-i=
bt
The other patches are out for review and will likely change before merging

> > Host commandline
> >      -chardev socket,id=3Dipmichr1,host=3Dlocalhost,port=3D9999,reconne=
ct=3D10 \
> >      -device ipmi-bmc-extern,chardev=3Dipmichr1,id=3Dbmc0 \
> >      -device isa-ipmi-bt,bmc=3Dbmc0,irq=3D10 -nodefaults
> >
> > BMC commandline
> >      -chardev socket,id=3Dipmichr1,host=3Dlocalhost,port=3D9999,server=
=3Don,wait=3Doff \
> >      -device "ipmi-host-extern,chardev=3Dipmichr1,responder=3D/machine/=
soc/ibt"
>
> Could we have the full command lines also ?
>

Sure, there's not much else there, one of the bmc firmwares I'm testing wit=
h
is a quanta-q71l-bmc which should build from OpenBMC.

Host:
qemu-system-x86_64 \
-nographic -m 4G \
-kernel arch/x86/boot/bzImage -append "console=3DttyS0 earlyprintk=3DttyS0"=
 \
-serial /dev/tty -monitor /dev/pts/9 -initrd u-root.cpio \
-chardev socket,id=3Dipmichr0,host=3Dlocalhost,port=3D9999,reconnect=3D10 \
-device ipmi-bmc-extern,chardev=3Dipmichr0,id=3Dbmc0 \
-device isa-ipmi-bt,bmc=3Dbmc0,irq=3D10 -nodefaults

BMC:
qemu-system-arm \
-machine quanta-q71l-bmc \
-nographic \
-drive file=3Dpath/to/openbmc/image,if=3Dmtd,bus=3D0,unit=3D0,snapshot=3Don=
 \
-chardev socket,id=3Dipmichr1,host=3Dlocalhost,port=3D9999,server=3Don,wait=
=3Doff \
-device "ipmi-host-extern,chardev=3Dipmichr1,responder=3D/machine/soc/ibt"

>
> > Currently, IRQs are not functional, but it is able to connect.
> > The following printout is from the host:
> >
> > [    6.869742] ipmi_si IPI0001:00: IPMI message handler: Found new BMC =
(man_id:
> >   0x002b79, prod_id: 0x0000, dev_id: 0x00)
> > [   12.393281] ipmi_si IPI0001:00: IPMI bt interface initialized
> >
> > This patch is an RFC because of the missing IRQs and the need for other=
 patches
> > to get merged.
>
> We will need the whole project to start reviewing.
>
> Thanks,
>
> C.

Noted, I think I should be able to send the BT commits from
https://github.com/Rwantare/qemu/tree/aspeed-ibt
after the others are reviewed and merged.
For now, the irq setup is my point of confusion.

Thanks,
-Titus
