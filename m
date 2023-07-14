Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp4182570eje;
        Fri, 14 Jul 2023 10:10:13 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHhrpmpHnEkpSJvn8CaYh5Ljg+4XwX8gKbRQ1G/EgoOsWiU75PmJv4QHCQjzd2Xd4dyUZVJ
X-Received: by 2002:a0c:ea50:0:b0:62f:fe67:7372 with SMTP id u16-20020a0cea50000000b0062ffe677372mr4975353qvp.14.1689354612841;
        Fri, 14 Jul 2023 10:10:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689354612; cv=none;
        d=google.com; s=arc-20160816;
        b=akN3+1fpjU1dnkih0Bk6c7FLZmIVBPwedG/XEfeJoevKfVSsuz1y3l9tPTZ0DNdq0H
         Ew+pS0HAxjhoOF1B/wzFnOggwDZT6DGWJ6GYIBd+QxIXMVnjEw5LhXqjCClpFpM8FiqK
         dJMVWYe5VnHahDmzjMGjictQiKYLxgl3hbssDLQ0f3eW8qZY50wteK9IvOJlyRMKpT5L
         S8QXThAScdy0uuocW0UoQ14mSivSTiNkWQw8dj7zrl/SMMNu9DOzuQtFRsPCG9EU5vE+
         G2XhRVExgxmbFy1p7zf44kgmSS0GG+zb9uVGbsqFDa0vb1aNK44aESTbtZvY6SLnbEA9
         qYiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version;
        bh=3PVIwO5nP1RwuO8A4sWqGY54e/fRKGoKFX0hkb/Xh5g=;
        fh=mCApeWQu3Q+hp15+9ihXbesIAbGP6GkyEBuBKT1PQow=;
        b=P5+SwVdS2BEAZptY8s6r0D8a1YkfcDkehTyeejabFjjJYpEyNBvhATFBLUOiJa6vIS
         BMf7Cca5LrvUn+uf1wvP3Zuojqlug9KrRV/HYalKSjxI8LyDsxgbSPub14zxMUrsgbUw
         XZko/8IExp/qhaAUPq85LDRZQXRisiJas3dAMhE7HYjNk+pmBEge1jIFNGqn8cRc7xyo
         sBckRev2mbHQT647swyR2Bek/VPxRiNeMPe+FFPpnRzkyIq+H+qVeVTsJrquA6LelVNZ
         lGZooFEOkJLFAaV0TGqpE2ZQqY1j0tpy1ooymFMpWbdsbRXnA9R+GD9bXEI5vxg7oF31
         RHZg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bk31-20020a05620a1a1f00b00767d49e9a97si4862224qkb.92.2023.07.14.10.10.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Jul 2023 10:10:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qKMIr-0003qR-OF; Fri, 14 Jul 2023 13:10:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1qKMIq-0003pj-Rz; Fri, 14 Jul 2023 13:10:00 -0400
Received: from mail-io1-f52.google.com ([209.85.166.52])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1qKMIp-0001SD-8g; Fri, 14 Jul 2023 13:10:00 -0400
Received: by mail-io1-f52.google.com with SMTP id
 ca18e2360f4ac-78362f574c9so83374539f.3; 
 Fri, 14 Jul 2023 10:09:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689354597; x=1691946597;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3PVIwO5nP1RwuO8A4sWqGY54e/fRKGoKFX0hkb/Xh5g=;
 b=FZVHhvtjz8Z6qyy5YUk0YpUA60mfQwdL19vr4tTP4YwT2Iepacj6+gZRk+kUe8GEkg
 gZlBgiUfGpWx0JIE75xSemDLBLf+q+2dObKciE3uSyDPil1E4BlMEYxT06E3N+jf00HT
 jNqEkMDRXvULLZFwmaKhx+vELAsnGuRMD5BZng3KCAjuxv9+O1wFh6mTrIDxwQYgp92n
 zACQTDNOF+guh7xwh/5uL726thMNvYCCt6KCq172TY3BArSA0hZQ+na0s4ynuwTCHRRg
 YnaOteLjs29+/uCavgc6Tov4gQ7OHtxH7YhAmP0nhT3F4MFA3K8CdL8B2MJ0vZ39BxJ5
 WiQw==
X-Gm-Message-State: ABy/qLbDJ9+rWJcfEDxyGfg/vqAwjL2YCni+Q73zZTJumeZCPvitIhSk
 FyglZxZCz3pYkGOxZCanNduXtM37nIU=
X-Received: by 2002:a6b:5c14:0:b0:783:5f71:5410 with SMTP id
 z20-20020a6b5c14000000b007835f715410mr5233318ioh.15.1689354597358; 
 Fri, 14 Jul 2023 10:09:57 -0700 (PDT)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com.
 [209.85.166.169]) by smtp.gmail.com with ESMTPSA id
 g7-20020a0566380bc700b0042b2e309f97sm2635778jad.177.2023.07.14.10.09.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jul 2023 10:09:57 -0700 (PDT)
Received: by mail-il1-f169.google.com with SMTP id
 e9e14a558f8ab-345d3c10bdfso9412985ab.2; 
 Fri, 14 Jul 2023 10:09:57 -0700 (PDT)
X-Received: by 2002:a92:cf05:0:b0:346:5a8b:5415 with SMTP id
 c5-20020a92cf05000000b003465a8b5415mr4845077ilo.30.1689354596874; Fri, 14 Jul
 2023 10:09:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230714070931.23476-1-j@getutm.app>
 <20230714070931.23476-8-j@getutm.app>
 <14777385-4e13-de09-c58f-bf4a2b5f52fa@linux.ibm.com>
In-Reply-To: <14777385-4e13-de09-c58f-bf4a2b5f52fa@linux.ibm.com>
From: Joelle van Dyne <j@getutm.app>
Date: Fri, 14 Jul 2023 10:09:45 -0700
X-Gmail-Original-Message-ID: <CA+E+eSD-9pT5xMRHk=e=FmRe1_wcnDXyxS_jtB0kFV32tiPKbw@mail.gmail.com>
Message-ID: <CA+E+eSD-9pT5xMRHk=e=FmRe1_wcnDXyxS_jtB0kFV32tiPKbw@mail.gmail.com>
Subject: Re: [PATCH v2 07/11] hw/arm/virt: add plug handler for TPM on SysBus
To: Stefan Berger <stefanb@linux.ibm.com>
Cc: Joelle van Dyne <j@getutm.app>, qemu-devel@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:Virt" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.166.52; envelope-from=osy86dev@gmail.com;
 helo=mail-io1-f52.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: t+WYaj+6k/nd

On Fri, Jul 14, 2023 at 5:11=E2=80=AFAM Stefan Berger <stefanb@linux.ibm.co=
m> wrote:
>
>
>
> On 7/14/23 03:09, Joelle van Dyne wrote:
> > TPM needs to know its own base address in order to generate its DSDT
> > device entry.
> >
> > Signed-off-by: Joelle van Dyne <j@getutm.app>
> > ---
> >   hw/arm/virt.c | 37 +++++++++++++++++++++++++++++++++++++
> >   1 file changed, 37 insertions(+)
> >
> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > index 7d9dbc2663..432148ef47 100644
> > --- a/hw/arm/virt.c
> > +++ b/hw/arm/virt.c
> > @@ -2732,6 +2732,37 @@ static void virt_memory_plug(HotplugHandler *hot=
plug_dev,
> >                            dev, &error_abort);
> >   }
> >
> > +#ifdef CONFIG_TPM
> > +static void virt_tpm_plug(VirtMachineState *vms, TPMIf *tpmif)
> > +{
> > +    PlatformBusDevice *pbus =3D PLATFORM_BUS_DEVICE(vms->platform_bus_=
dev);
> > +    hwaddr pbus_base =3D vms->memmap[VIRT_PLATFORM_BUS].base;
>
> +static void virt_tpm_plug(LoongArchMachineState *lams, TPMIf *tpmif)
> +{
> +    PlatformBusDevice *pbus =3D PLATFORM_BUS_DEVICE(lams->platform_bus_d=
ev);
> +    hwaddr pbus_base =3D VIRT_PLATFORM_BUS_BASEADDRESS;
>
> These seem to be the differences between the loongarch and the arm virt i=
mplementations.
> Why not have a function with this signature that both archs can call?
>
> static void virt_tpm_plug(PlatformBusDevice *pbus, hwaddr pbus_base, TPMI=
f *tpmif)
>
> Regards,
>     Stefan

That was the first intended solution, but the code that this is
replacing was copy-pasted and as I don't know anything about this arch
or know how to test it, this caused the least amount of changes to
that target architecture (no additional includes, changes to the build
scripts, etc). I don't think there is currently a common "virt" module
that all the "virt" targets use so we would have to create that. It
seemed out of scope for this TPM patchset and could be something for a
different patch set. tl;dr: the code it replaces was copy-pasted so
it's not strictly making things worse.
