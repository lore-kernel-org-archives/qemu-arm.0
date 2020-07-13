Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3151327lfm;
        Mon, 13 Jul 2020 03:32:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJweui7QB6sbHAW5fPStBknjcM+dyN9NlgjiBuLThaX7ZiCi7nCJHPIMGIrhRIeV7jIiuNTv
X-Received: by 2002:a25:bfc5:: with SMTP id q5mr127721950ybm.475.1594636352182;
        Mon, 13 Jul 2020 03:32:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594636352; cv=none;
        d=google.com; s=arc-20160816;
        b=j+bls90ZEYkq2CEk6igU1PS5SaX+HbHxNjOxEe3oZTlkhrFOTeEMGN+5LvNGwzkEKE
         epUSSykDethgnxomqAvkuvuWhb+g7diAmKAlKIEVLiRYwVc3Pu8oxirxkYA/QyKeUqYP
         X+1CQdNL02xF1yeehw4B/PZE/CWsapMIKxQJCeKjJQuQK6PVtzbBdskaF96e/5NJpoax
         OP44bVvJBORHrkQivbvCGHezypft7+aW1Fcu2FQfa5w7t2Tc+hi5gKEPuveU4cl3qWja
         9f7Lh2Zv5fmWeHDCSVRoT2iKGNj4ERJlxGf+pLAqwBsdHWY2219UfCQXvYz+ps5lAhPD
         wCfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=fMAdc2gUHmQkn9DBQDfJ4Lyn1tF148KAvZKsixkzRhw=;
        b=F+AtOq2SgNLij/wdYd3g5DT3NKwhfux07+z8OU7qOQVt5NY/pxc8l5N5YjCx05ZcgW
         HEY0BkO8PobWCAHOPQrDMGgr2au6AdmigCHubUAeOsb/jLYRgTgVW6kYTjTEY7tAIPNk
         kc8sgNRq6/WaFacAP/z74JOaU9BzWtCR8OAb9Oj5CyPjpqvysayQt0tTeobxU8mX0QKJ
         zpdYOo8y9w6yK+NE7KYu1zNLn4jP2D2vvM5TLFxorOb3cy3WZEln8HYf/70TKtGIBB5m
         d1qNDYYm+/X+F8vXUlG1lShieJPLY5UbZ1OuzjZAO/DTZHWDCC+fzn4rBEPYSOnD8VTJ
         R/Vw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lZ6BCLax;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5si14943662ybp.293.2020.07.13.03.32.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Jul 2020 03:32:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lZ6BCLax;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1juvl9-000286-2b
	for alex.bennee@linaro.org; Mon, 13 Jul 2020 06:32:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1juvk3-0001DK-Cc
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 06:31:23 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:40935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1juvjz-00087J-At
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 06:31:23 -0400
Received: by mail-oi1-x243.google.com with SMTP id t198so10543305oie.7
 for <qemu-devel@nongnu.org>; Mon, 13 Jul 2020 03:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fMAdc2gUHmQkn9DBQDfJ4Lyn1tF148KAvZKsixkzRhw=;
 b=lZ6BCLaxGqJyAj/YynX+LL0omIvuMkGfbHfKluuybRkhwe2kXXqDGDKCYaCq9hbI+U
 N3lDdORzFjISYZaOzMfktD0U8/o6gD+8mNBAy+SrQbJzZ7tX0zXHvyyYEjXg3W2AgMTN
 cgCVrfVP9Hfc5apDsRmWSupzMY9t+th/nmmOyoi+tgmq6jUPogj0v9C/5a7Fd8b93k+J
 ytuIJD0LblDChLShj5cIXymkjM6VyB+1jLq8zVl672SPeTN6tdS6RPZQuSUXX4TYKX1g
 +sFYHmIrJUWXPZCJXZVMkypYgpgaaNK7rdKrsz4RhHsidQfK/QvCgC+Oem1JGI19Czat
 ADRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fMAdc2gUHmQkn9DBQDfJ4Lyn1tF148KAvZKsixkzRhw=;
 b=Cz2PGUCB2fWwTuq9nIF+Y3wJ8b4QAyzxfOIip0XLEUfYF/XoFsPsr/Q0XTPCK0pcXW
 JWfXpsEkLi6B0CIWH5zCfRFRE8xW32xtH78ck6Vg7emRqZ3Eby3Ux1xZaNtUxGmSBwUD
 g6LMJwx5bHHwm3IyuGsFvcMa73o8JkvTqiwAA0N5z9p0RZlNF2XieLnDVxcTvGyt93NR
 tg/ry7GAtD1FKhk3P/pM2kpMhJKQSJQj4U69YTrkxgiiy6+8KFTdpEkj2RUe+HOnoidB
 Lgm7gs/1D8q8sosGT1HtELA2KfDtkMOM48sxFj+BLYby+vfDLsF+kuD7wND/zvQfaxLK
 Mv+g==
X-Gm-Message-State: AOAM533V3tsLlvfiEVY5Q5ckJJ811GBAJ2OoD8BmIJ52K+wXOun3RYd/
 KfsmGvvLCcuPY0K3ibDV0+9VcUJDaiMwdKejnyiPIA==
X-Received: by 2002:aca:54c9:: with SMTP id
 i192mr13433316oib.163.1594636277986; 
 Mon, 13 Jul 2020 03:31:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200628214230.2592-1-peter.maydell@linaro.org>
 <20200628214230.2592-3-peter.maydell@linaro.org>
 <4c049b0c-f305-729a-748d-0a7742b496ed@amsat.org>
 <CAFEAcA_JCSs6BCCw-MYOO8RcyXQ_iNZ63KjuwqEPM7yuvWsdTA@mail.gmail.com>
 <c9fe0637-9870-b155-3b50-0da3f03d279f@amsat.org>
In-Reply-To: <c9fe0637-9870-b155-3b50-0da3f03d279f@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Jul 2020 11:31:06 +0100
Message-ID: <CAFEAcA_wrzBj_YNSehG8fDy-0et9gaE98eMuw6agsmkDJ0MoEA@mail.gmail.com>
Subject: Re: [PATCH 2/2] hw/arm/palm.c: Encapsulate misc GPIO handling in a
 device
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x243.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3kjughLdsY5o

On Mon, 13 Jul 2020 at 11:21, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> On 7/13/20 12:05 PM, Peter Maydell wrote:
> > On Mon, 13 Jul 2020 at 09:57, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.=
org> wrote:
> >> Why not make it a generic container in the MachineState and create
> >> the container in hw/core/machine.c::machine_initfn()?
> >
> > I don't think we create containers like that for any other
> > machine, do we?
>
> No but maybe we could. Most boards have some GPIO/LED/reset switch
> button. Do all machines have a NUMA memory device? Do all machines
> have a dtb? Do all machines use NVDIMM devices? I think we have
> more machines using GPIOs than machine using NVDIMM. Anyway I don't
> mind, I was just trying to figure where this container belong on QOM.

I think that if machines were qdev objects with the usual
reset/gpio/etc capabilities, I might have just implemented
this as part of the machine object; but they aren't, and
it didn't really seem like the right approach to create an
ad-hoc "container that sort of corresponds to the whole
machine". Also, since these machines are largely orphan
I tend to favour smaller-scale interventions that push them
in a better direction rather than more sweeping changes.

thanks
-- PMM
