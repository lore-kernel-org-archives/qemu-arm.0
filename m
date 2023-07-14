Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp4218409eje;
        Fri, 14 Jul 2023 11:15:41 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFV+tCsVIu+RQCYoiNrOs7W+VApyRXF9tR+xwiPeB9B/X0gQX5wwtpsPjF6vSj18Tx6UVuj
X-Received: by 2002:a05:620a:2587:b0:765:83e8:d990 with SMTP id x7-20020a05620a258700b0076583e8d990mr5508478qko.75.1689358541036;
        Fri, 14 Jul 2023 11:15:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689358541; cv=none;
        d=google.com; s=arc-20160816;
        b=xpyYU3eKFQfow/O8VHjOo0cvFgRCi/m35OfCR5RA0WRnbbbxWW1ZSpKzuLyhEO3wcn
         wKLhcKq0i57ADq143W9LACD89Kwa92UARGNdIncYVwdI/AXA8LscRDX9Jy2tv1h12ms8
         v9OOQP5qSw9AGxgBBZKY5zx8pKFZft73C2DuahJPkRmTiVgTMDiZSKhd4z125M7AIU8V
         7nPUF1qX/kmr9bPnhTN+oypsHp2ezXKd4eFgLA+XTmOxYdQ2ItZ28pqYObb13Z7dM6GA
         UZX8G+pPLVSwCAMdRKmlrztPZEH1xHkk0GhsCfzSZ9XbnsfHs60N8uVRQsBs8XNw/FVd
         FQHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version;
        bh=nS7bQpsH2ArTasOyoexHQAEm4dnTyLFFwegAZmtFymg=;
        fh=TK33j72NKU5t+rKUT/boAfxsioDAis0VQGPbWkJmWCQ=;
        b=OBZymhik4dOPyDyxllsQu99V/BygIIvlH6v+XcTlLq1kzNBlSP4Hgpln1HU6U7YXmI
         X8shs8r8Hocn5Wd3PLTn92eB2ceNEueq+nuHSfDKDmS3FE7vEvKw5Rnum0aSzrz5J2pU
         Ucab2Fr1xqUB4XpsuU6Rg24mdm++ro+XPEeBqArk+R7VwTuQzn7SucXhoSMyw28GrRAe
         4lP94NReiStZsc6S+r3rm02X6JZ8xinHLzCoCnOuzXph0EVgqrIPU/h/amHxErc6Rj3Y
         z5DxLUOmx7GDo+zZ0g8/c4dzuRMEhYBOsmo4ABxtJDS/mDnH6A/xa/SjYBx3D5V4vXvV
         9nqg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w12-20020a05620a444c00b007672c6fdc47si5030572qkp.355.2023.07.14.11.15.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Jul 2023 11:15:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qKNKB-00043e-1S; Fri, 14 Jul 2023 14:15:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1qKNK8-00042v-KX; Fri, 14 Jul 2023 14:15:24 -0400
Received: from mail-pl1-f180.google.com ([209.85.214.180])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1qKNK6-0008WL-ST; Fri, 14 Jul 2023 14:15:24 -0400
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-1b9cd6a0051so14228875ad.1; 
 Fri, 14 Jul 2023 11:15:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689358521; x=1691950521;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nS7bQpsH2ArTasOyoexHQAEm4dnTyLFFwegAZmtFymg=;
 b=kbIWxH4KUYc1/8FVqZv8HWmfau81QWXnw4VQsx+DHtDgHIEtsbrJtReGq2DpeYk9ib
 2x4fld4CqGi2wM32NAdCzVFhU/gyHTApWUobGjCPyYAOzt2qIK0mDeY3bEEW6MtGuijH
 bkh8rBjlEeDZKP7kZfBtqRZwxYeBtyFEm3Ducg+WXz2+w7rDGoLT4UC8CttPFcyGnCEY
 ITa1p+Yc0r9Esu9oTKRovvIdXhMQz2sn7EBRiJLx6FhfF7A8yUeIe9sVJyRKMQLhVmsH
 JjkIg5ZE+o+6mpXMO0BKjSkZJIz2inwOw1XS/Y8NncTFXVP5hYfO3DnOPaXfx1iw3aQO
 NrUA==
X-Gm-Message-State: ABy/qLZtURH4zQvOkKWsx3sIBgLLvfi9wD4yuDCo+IsmmxHTWsG+ZKVV
 /mRRUOW0n2gjz9b8QQHIgejUNzJBWcf1Dw==
X-Received: by 2002:a17:902:8689:b0:1bb:1a64:5a74 with SMTP id
 g9-20020a170902868900b001bb1a645a74mr1331166plo.33.1689358520161; 
 Fri, 14 Jul 2023 11:15:20 -0700 (PDT)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com.
 [209.85.216.48]) by smtp.gmail.com with ESMTPSA id
 c2-20020a170902d90200b001b88af04175sm8062444plz.41.2023.07.14.11.15.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jul 2023 11:15:19 -0700 (PDT)
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-2633b669f5fso1280356a91.2; 
 Fri, 14 Jul 2023 11:15:19 -0700 (PDT)
X-Received: by 2002:a17:90a:f0c9:b0:263:ff97:5bbb with SMTP id
 fa9-20020a17090af0c900b00263ff975bbbmr3806498pjb.46.1689358519252; Fri, 14
 Jul 2023 11:15:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230714070931.23476-1-j@getutm.app>
 <20230714070931.23476-10-j@getutm.app>
 <d3d3d9d0-fb88-9500-34d9-9780f9c2644f@linux.ibm.com>
 <CA+E+eSDinJuo8xyZTzfqKXr=rf+fyjkvOLVEqam0eapehQ1OYA@mail.gmail.com>
 <1a394fc6-4a64-5e00-5631-eb5a6aa4ce59@linux.ibm.com>
 <CA+E+eSCbPXZWk2zst+AunRpL74DOEB437mZqMhpWQ0K+=dvf8A@mail.gmail.com>
 <bd034676-1a9b-59a7-0445-129c32daa7b1@linux.ibm.com>
 <CA+E+eSC7MOOWhZ1WzAAjczX+P8WvjGdLY8wkX=sq98M3YCRVJQ@mail.gmail.com>
 <da3ed561-ba4d-5782-35b7-edcfae28538f@linux.ibm.com>
In-Reply-To: <da3ed561-ba4d-5782-35b7-edcfae28538f@linux.ibm.com>
From: Joelle van Dyne <j@getutm.app>
Date: Fri, 14 Jul 2023 11:15:08 -0700
X-Gmail-Original-Message-ID: <CA+E+eSDPzefb+1-QAY11GN21h2zr8w=VjDmZjba8wC+M9htm9A@mail.gmail.com>
Message-ID: <CA+E+eSDPzefb+1-QAY11GN21h2zr8w=VjDmZjba8wC+M9htm9A@mail.gmail.com>
Subject: Re: [PATCH v2 09/11] tpm_tis_sysbus: move DSDT AML generation to
 device
To: Stefan Berger <stefanb@linux.ibm.com>
Cc: Joelle van Dyne <j@getutm.app>, Eric Auger <eric.auger@redhat.com>,
 qemu-devel@nongnu.org, 
 Shannon Zhao <shannon.zhaosl@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, 
 Song Gao <gaosong@loongson.cn>, Stefan Berger <stefanb@linux.vnet.ibm.com>, 
 "open list:ARM ACPI Subsystem" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.214.180; envelope-from=osy86dev@gmail.com;
 helo=mail-pl1-f180.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: c5cCfiUCojgL

On Fri, Jul 14, 2023 at 11:01=E2=80=AFAM Stefan Berger <stefanb@linux.ibm.c=
om> wrote:
>
>
>
> On 7/14/23 13:46, Joelle van Dyne wrote:
> > On Fri, Jul 14, 2023 at 10:43=E2=80=AFAM Stefan Berger <stefanb@linux.i=
bm.com> wrote:
> >>
> >>
> >>
> >> On 7/14/23 13:39, Joelle van Dyne wrote:
> >>> On Fri, Jul 14, 2023 at 10:37=E2=80=AFAM Stefan Berger <stefanb@linux=
.ibm.com> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 7/14/23 13:29, Joelle van Dyne wrote:
> >>>>> On Fri, Jul 14, 2023 at 9:19=E2=80=AFAM Stefan Berger <stefanb@linu=
x.ibm.com> wrote:
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> I don't know whether we would want multiple devices. tpm_find() us=
age is certainly not prepared for multiple devices.
> >>>>> Sorry, "multiple TPM interfaces" here does not mean "at the same
> >>>>> time". Will clarify the description.
> >>>>>
> >>>>>>
> >>>>>>
> >>>>>> Good for the consolidation.
> >>>>>>
> >>>>>>
> >>>>>> Does moving the TIS to a different address help on aarch64?
> >>>>> That was the first thing we tried and no it doesn't help.
> >>>>
> >>>> I would remove it if we don't have a known alternative address that =
makes it work. If we do, I think we should document it in tpm.rst.
> >>> "It" is referring to tpm-tis-device? Note that it does work fine with=
 Linux VMs.
> >>
> >> yes, tpm_tis_sysbus and I know it works with Liunux but I see this dis=
cussion here around Win 11 on aarch64. Why do we need to user another addre=
ss than the standard address if for Win 11 on aarch64 it doesn't get it to =
work.
> > The standard address won't work for Linux either.
> >
> > TPM TIS on standard address on ARM64 Virt machines =3D collision with
> > DRAM, will not instantiate
>
> I thought that this was working with Linux on the aarch64 virt board as c=
ontributed by Eric Auger.
>
> https://github.com/qemu/qemu/commit/fcaa204194e15ba24cd53087dd616aabbc29e=
64f
>
> Also I had tested it to some extent: https://github.com/stefanberger/swtp=
m/issues/493#issuecomment-885221109
I think I know where the confusion is. Both your examples use
"tpm-tis-device" which indeed uses the SysBus and gets a dynamic
address. In this patch, the removed code that generates the AML gets
this address by poking into the SysBus device, getting its base, then
adding the offset from the TIS device to it. In the change, we move
that code to get the address to earlier in the Virt init sequence
(before the machine is realized) in order to tell the TIS device what
its own base address is. Then, during the AML generation phase, we can
just tell the TIS device to "generate your own AML" which is now
possible because it knows its own base address. This is also how the
TIS ISA bus device does it but that is simpler because it can just use
the default address.

Separately, there is a `build_tpm2` table function which also needs
the device base address but only for CRB devices (TIS has the field
set to 0) so it's irrelevant here.

>
>
>
> > TPM TIS on SysBus with dynamically allocated address =3D works on Linux=
,
> > cannot start on Windows
> >
> >>
> >>>
> >>>>
> >>>>
> >>>>>>
> >>>>>> Can the size really be an option? I don't see it useful and if one=
 gave the wrong size it may break things.
> >>>>> It was added for consistency (otherwise we have to determine the si=
ze
> >>>>> by looking at the interface everywhere). Also, it is possible for t=
he
> >>>>> size to be larger than the constant. For example, Apple Silicon use=
s
> >>>>> 16KiB page sizes and we may decide to force the device to be 16KiB
> >>>>> aligned (not sure if this is needed yet while we still track down w=
hy
> >>>>> the dual mapping was not working). In that case, we would need to
> >>>>> inform the OS of the true region size to prevent any overlap issues=
.
> >>>>> Both baseaddr and size should be provided only by the plug handler =
in
> >>>>> the virt machine, otherwise things may break even if we get rid of
> >>>>> size and have just an incorrect baseaddr.
> >>>>>
> >>>>>>
> >>>>>>
> >>>>>>
