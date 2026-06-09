Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 362EACD98C5
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 15:51:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWyk7-0003wL-Nt; Tue, 09 Jun 2026 11:51:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1wWyk6-0003um-Lq
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 11:51:54 -0400
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1wWyk4-00070y-Og
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 11:51:54 -0400
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-5aa64afcfdfso28067e87.1
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 08:51:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781020311; cv=none;
 d=google.com; s=arc-20240605;
 b=DUGa3dlGTKg7y2RRnhVA1I6BDUTr67p5ePyEM55SYncHqweSbMWoWEvqzpphBOQ80x
 B2/XYMNzCMd3BhMK7mdPt2ReI1WZ+B9DucNbnBCGqlvwBR0FATHnCLXPgEVl4W9MY9OH
 oQdzIo/0sjcH+30RBn/4EfSB9Dtdt93/pMEim+vdgdbrvveZy2+1TbhIPJ6BGvhGrWVu
 gyc7+0u7AFOrhApF2IxoK4GIJ+Xh+yro9gy6IkWOU/C9WQ3wbDGvuLTWtdcQ0zjyQpPg
 d9cBU19c7WPG6t4dZ9V6pRmxwwZi1OhQRygRClv+rVPoBP5l71jMx4ixoXh9/azCEmR0
 8THg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=wNVM8/XIQ+GMp2Km6P124CqDPpvEiW+D0aQeKgN3Az8=;
 fh=OC8riOEgrqxo2OiJYAmYUTr4K351QdWk7r05KAebCNw=;
 b=UJ+sWcjw7l380Dtj9134noxE15yOiZUReOUR9aP1eytoJutxR6vLoyUZF9EIavx3f/
 U09nv02uUjA4pa/BPJzsCABZ0nEXwzuM9fjcKMK44MiT+bLhT5i+RewDbeeCZAqTkIlR
 a5oTCNWNGYP44m8T4R0K89CbJLSTS5fGsZiNotwCl1Fioi9D9lJaCB479fnBvw+ZvT25
 YI/zY9PRZPIiKRYkuE9t2m//PlekfWn3WYcyUm6iC/N0Mw9hLyfkjGyQrby4VsziVGlY
 TSGWHiI0VmDtjCc6Kai0jKr6EJzlM4kT9cdHpUXP/qTlbpsyriYx7JD5V4vFhpl+o4gr
 Zfxw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1781020311; x=1781625111; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wNVM8/XIQ+GMp2Km6P124CqDPpvEiW+D0aQeKgN3Az8=;
 b=OteLEIbV8juVlw/RPBoJOAsAF+aLOIsDIlV9cDniJbmZFze1L+6Xsk1tdib0Sp2yHq
 mwQPFQgPTPAHT87Uc09sTy5Jblmm0B9wy9qTzAbwCxqG06B+RPfsiEgvHsvKbMFv6IRb
 VdTehG7ed44u163Tu75pm7sK+7QJ3EhBiZ+bqQlaOs814XJVmQ5zlRFRk2ivRx8gB9W5
 0OAqN96UdzGWDV50I6HmKgF/3HE7YqH0RrwcIW2/YNMdGqRozZilBj0dTQYAtWJsE2uB
 S8pjMas5enBEnZi0N5JMG0JAuB6Rb9lhMtFn52t1CRcfDttNfe+SyMswAMMtXCGEOeEM
 JXHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781020311; x=1781625111;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wNVM8/XIQ+GMp2Km6P124CqDPpvEiW+D0aQeKgN3Az8=;
 b=EblWFExNnmjVTuHCELVbiaBaIncoqI+cPQbgyn8Xuaedxz7alFVpRbkYqhbujk6OGE
 NngH8Xs/c8iNweIrPQV0skrBwnGewB6dHD+MDiXbpcga5nf/5DirLC6y7qWQqYTxgIFG
 ErCl3BtBX0AZnqrMbESPIl3/d5ICM5NtmLaNfUK4WmXUqlwAZRcJQgzoiMi2JOkWfRaJ
 vzREqmrYTroiI+Jk8huLXjHwS6n5Srsp6C+UPTBboNmV/R8h6hpkCJpWcQ9qUvTJXoC1
 tOjG167DTsFN0CpkabHlRuWBwzB0Vzr5ciavFDX2z3WOYD8q1NZhSatE4hoFvp+C2BYX
 XztA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9FE4d0lx1VIVkoDvtTy0AndDG9BBQuIg968rgRFquPYS07iC3fn2Nez/Nzgj5fhORfM/pIp2eGRg==@nongnu.org
X-Gm-Message-State: AOJu0YwS5VvGLq5vYUz+01px/oM6m9jMKfBSdVuNJWH2iisYAeoFd01i
 Gn/I0C+UaF1BdPQOKN2ZXl64LuXwwSnaDWn/0YK7WH2E62RNEUGV7MoucLixlc/py7x1CDgnP7y
 DhEQgR/vw14Q0/HfO0kV+2P43hkY0bagtjPfdMywf
X-Gm-Gg: Acq92OEtmST2gkMW1y6K27oRKiVjPhtqh7UbNR+bAjOvlp0rR/POKoTFX2g7p2R93nv
 xOamKauEwcjfthjv5+DB5IOqmntizUSygOLHpCwvHmKF49yuMp6uiTDYLsN0mb1R5XLrufeAi7H
 XyaHzbZ6sqzwWo2r9NHPknKtt84GkJKqEaqQCHiXn6u7Q94wz2DrCVQPT65PWPt0NJgiMnefcsc
 DWeYRBsem5eM2QKBzY71N+V9QYlETjhuZvfnNbp0mRHfCgFnN0CTC8BOBuHX55rRFiye6eiSdPK
 aRDfR/97qcCMURgOl80mK2V8p1UMxtz8ub3WzPNbBJNekh4Y2A==
X-Received: by 2002:a05:6512:23a8:b0:5a8:73f1:4099 with SMTP id
 2adb3069b0e04-5aa8856cd45mr731268e87.0.1781020310309; Tue, 09 Jun 2026
 08:51:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260609105626.1038690-1-thuth@redhat.com>
 <CAFEAcA9O6b02VMuto8VzaEsVi3zTqNtQKG_RcMaPnNdPXGUBhw@mail.gmail.com>
 <CAMvPwGpvpHD+Sx-HZR4FFMJB+W8Rk8LoU0256Q=vwKAdC96HSQ@mail.gmail.com>
 <CAFEAcA9N_O7RZRU+SPTfB_ePasjVZvUsFPhndfQDuHgQ+4Q-5A@mail.gmail.com>
In-Reply-To: <CAFEAcA9N_O7RZRU+SPTfB_ePasjVZvUsFPhndfQDuHgQ+4Q-5A@mail.gmail.com>
From: Titus Rwantare <titusr@google.com>
Date: Tue, 9 Jun 2026 08:51:13 -0700
X-Gm-Features: AVVi8Cdai3kcd1rD-r_4IKxs0gsOerSlPqiCRzTaBqR3URolkh9sVOzU02dxeO4
Message-ID: <CAMvPwGpzAcDxeqSvQmOjzkQn6T91CAmTO31bNs0wmSMqQKG=Qg@mail.gmail.com>
Subject: Re: [PATCH] hw/i2c/pmbus_device: Fix a possible crash when requesting
 too many bytes
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=titusr@google.com; helo=mail-lf1-x12f.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

   On Tue, 9 Jun 2026 at 08:25, Peter Maydell <peter.maydell@linaro.org> wr=
ote:
>
> On Tue, 9 Jun 2026 at 15:52, Titus Rwantare <titusr@google.com> wrote:
> >
> > On Tue, 9 Jun 2026 at 04:01, Peter Maydell <peter.maydell@linaro.org> w=
rote:
> > > I had a look at this bug earlier, but was not sure that this is the
> > > right thing. What happens is that the guest does something that
> > > causes the device to queue up data X ready for the guest to
> > > read, but then instead of reading it, the guest does another
> > > "I would like data X please" action. My guess is that the way
> > > the hardware handles this is probably not "add the second
> > > copy of data X after the first one". Perhaps it is "drop the
> > > data the guest didn't read, so the next guest read gets the
> > > second lot of data, not the first". But maybe the spec really
> > > does say "you can do things in the order 'ask for A, ask for
> > > B, read data for A, read data for B".
> > >
> > > I couldn't conveniently find the pmbus spec to find out what
> > > the hardware is supposed to do here. We need some input from
> > > somebody who knows about pmbus.
>
> > Queueing reads are an implementation detail I decided on, not part of
> > the spec. How the data gets discarded is up to the device
> > manufacturer.
>
> So what *does* the spec say? Does it just say that if you don't
> read all the data before doing something else then it's all
> unpredictable? Is there a way for the guest to get the device
> back into a sane state after it's broken it like that?
>
> -- PMM

I'm not sure this can happen on hardware. The device puts all the
bytes on the bus, and the controller can interrupt it with a Repeated
START

SMBus v3.3 6.5:
```
The data formats implemented by SMBus are:
=E2=80=A2 Controller-transmitter transmits to target-receiver: The transfer
direction in this case is not changed.
=E2=80=A2 Controller reads target immediately after the first byte: At the
moment of the first acknowledgment (provided by the target-receiver)
the controller-transmitter becomes a controller-receiver and the
target-receiver becomes a target-transmitter.
=E2=80=A2 Combined format: During a change of direction within a transfer, =
the
controller generates a REPEATED START condition and the target address
but with the R/W#
set to 1. In this case the controller receiver terminates the transfer
by generating a NACK on the last byte of the transfer and a STOP
condition.
```
Hmm, seems to me the data gets cleared with a change in direction.
-Titus

