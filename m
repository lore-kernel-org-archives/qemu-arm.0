Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87E36F34C49
	for <qemu-arm@archiver.kernel.org>; Mon, 13 Apr 2026 14:05:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wCHuU-0000xd-3x; Mon, 13 Apr 2026 10:05:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1wCHuR-0000wv-1a
 for qemu-arm@nongnu.org; Mon, 13 Apr 2026 10:05:03 -0400
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1wCHuP-0005rs-7B
 for qemu-arm@nongnu.org; Mon, 13 Apr 2026 10:05:02 -0400
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-7dbd2a0211bso3248724a34.0
 for <qemu-arm@nongnu.org>; Mon, 13 Apr 2026 07:05:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776089099; cv=none;
 d=google.com; s=arc-20240605;
 b=ibEZKIA0KTVy3QugWCT3nQhrPgoNVnIf+NcwbsigjXXB6iiYj/jvLIzToXj0anw1FQ
 LgYUZH81RicwMoEkcbrB4XZTulprt/+uyubh+XQ5IOM4/NYPcq6AJn57i2zkjYwTXyvq
 zLW6sLC0Dg+aGscZ4LG46Gd5SDqq/vSiK9xBalpyi3tg9oEgyE+CT7zzpyE5HQD0ffjI
 IGIRr8tyjC3M/XlMQfC3BVvlVKpmRgIhNo2APB6f4qapftYa+TDcjpdhE/2x6wFUHdPb
 ak/47j3ssSUTvYnF1mJfqgfIkxKWstLq5R2r/dqXgkqS/FtgWuXCNqm3ZECwkZCuSFsZ
 fYRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=ORftdB5gkOWjlzXsD9l9ePX5TMD5588+G1Spu+rxPvM=;
 fh=gWHeiHn9KtY2lsgx8WeLscfXGs5sQJM4Jh6ovpfSSqA=;
 b=Q/lKJHACstpOaFVS4bw11RkQ0XRTzkJYY/NzZcr41ALnqpTGUQXTsgGUQP9HajWQFu
 tdLmKWMJKG/bKnK+2HFAtPXK35Axb/crF445VZV+IkecBMPB4IPhKGELmXNKvtp7O4xM
 ONqH02abZbdJC8Z6RD56oBo3y4auFd8tXk9igNU5AQ1tk4wIUgc5lidXcNlnMn0tYKt5
 zwO7IIVlyjAEYsH19jToPKmO9ZSCPNQKfLiQWmkUsi+wfc3IRezWPZC1hUMscuJeB1hV
 Noaw3G6/GotXDSXPfwycrWOpMVCqvWcjU2R2Ow0nuoqZxqsRswzdx0r7qs0M8h4AyUJi
 QUQw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776089099; x=1776693899; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ORftdB5gkOWjlzXsD9l9ePX5TMD5588+G1Spu+rxPvM=;
 b=IazjfkCmqpM4qr84iJCdYP4hIuFBKP+alqNcg02N3c25rVfvz7dOb8bUs2o4kCRj6e
 UGcxA80rg6fK6c+pMSqwsmem0FFPxqM0blgGJpOZp2ANQj6g/vjE8/F9mi16TCQt9cwj
 SgQiu8dHQ3XaDkloWYQHsKv0we/MtBH9GCj4xs860s3TChsaFCNf9WY3/ut5Q3wIJd10
 Orvn3hICa8ratxz/ciFuT/8h1i9OwY7lZskxEahCn9+BsiVMB5JoteMTaHq3EAK3alxN
 uKXzIodBVFkvVkJaaUg8qCTmol8c3JezaPDff3ATG5Si6NBMsON4Mob/xM5MhXp2lPSK
 Doxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776089099; x=1776693899;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ORftdB5gkOWjlzXsD9l9ePX5TMD5588+G1Spu+rxPvM=;
 b=Uo7iYd956RTgs1fIpIe/Gic7hvjrR37Fk+FQE84akPItKYdsVz2VuPXnCvl6Cge64A
 KF6BS8knm4Ck5E/o5O3cFlXL4gVAeG4BF/QQ9pNcEu4ifc6NcLtAvXVCWSGKGIJyN+WE
 5yhLbAJr4Teazfu49xEfnh1R88SChSChS8E8i2y1Y/r0uHYd4BN+GCGfzoTYVGQEzROQ
 nvbfOeKBtaWs2jYqOvHzDrJDoUcP28WTv2DS1bIIyv4GlMbrv8O1HONlnzIinLb0Rkjs
 QmhPNYODYfP+R9dWLAqIkM3Lyh6ZRVdorm3dtXsV9aiTTiAMT2YsvHIEpNq7H1ccU6J0
 ADEw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9CO30sN0QBGRH1P56ho7hXdEVoSBd08hEtqIOHU0m6dPLgwKrx3+yQcvpXsuLR/0RUkMfpoTcvNA==@nongnu.org
X-Gm-Message-State: AOJu0YyAtw3tRdZIgSuP/uhuOkcqoPPW+qWWS1XGkbvIMkKwxnZS0IPb
 F7RwHrdIAuzEwRh4bc/5wzhFdhir2C3EnBpFbqm8euwBwo6axLqLEX2kPqG15sWazYYGEh1XvgO
 pZiC4UHvaidNfKsDhLBVX7RFLBrCwmW4=
X-Gm-Gg: AeBDiesmUhRuYAvVkZeMJYNF8XLMuoObyRzJ8qw6gb661a+RVd2s5hnQ8DiYStEO6AA
 R2eMQP9vEQdpQJmdVmIiEBtZtNvfqmb+ZB5aajYdB6eyyxc7ALXjkQXWi5sm/lxI1+LsKtLDh1E
 RfshHL+0MJ1SXIK/9CGhzizvCyoxrouxMXf93la5YjgZ075G5n5nnFijWdhNC29PyRWclZO9zYq
 8gTRSXt0tWcqehGE6PwiSSc8uWcThRYIrOBXwzrszYhgFVyl8vmlbft9Nquy5PDBxMQTmDHwXbS
 w3jRkwI=
X-Received: by 2002:a05:6871:5d17:b0:423:b2de:3b45 with SMTP id
 586e51a60fabf-423e10dc0b3mr7134330fac.28.1776089098875; Mon, 13 Apr 2026
 07:04:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAN-aV1EiKRh-Zpb9=77rXYPD2uT7HZmeNfvVW-wAToT+gaVC=A@mail.gmail.com>
 <87v7dvgw58.fsf@pond.sub.org>
In-Reply-To: <87v7dvgw58.fsf@pond.sub.org>
From: Ruslan Ruslichenko <ruslichenko.r@gmail.com>
Date: Mon, 13 Apr 2026 16:04:47 +0200
X-Gm-Features: AQROBzD4gCPWf0gMjGQUHjOzq-XK8MeupF9pWb37Xd9D5xsY91v0dwdR-FLqLug
Message-ID: <CAN-aV1ERB-vdvMyRuNo2tog9-EPPyCunXJkk-kC=DkX-kU6VCQ@mail.gmail.com>
Subject: Re: Question on preferred location for QEMU sample projects
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, artem_mygaiev@epam.com, 
 takahiro.nakata.wr@renesas.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=ruslichenko.r@gmail.com; helo=mail-ot1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, Apr 13, 2026 at 9:25=E2=80=AFAM Markus Armbruster <armbru@redhat.co=
m> wrote:
>
> Ruslan Ruslichenko <ruslichenko.r@gmail.com> writes:
>
> > Hi everyone,
> >
> > We are currently preparing the v2 patch series for the Remote-Port
> > Co-simulation protocol for interfacing with SystemC modules. The first
> > revision was here:
> > https://lists.nongnu.org/archive/html/qemu-devel/2026-02/msg01760.html.
> >
> > As part of this submission, we would like to publish a sample project
> > serving as a demonstration of how to connect a QEMU Remote-Port
> > frontend to a SystemC backend.
> >
> > The sample project implements a standard SystemC IP core and uses
> > several external components such as:
> > - libsystemctlm-soc: https://github.com/Xilinx/libsystemctlm-soc
> > - VCML Library: https://github.com/machineware-gmbh/vcml
> > - SystemC Library: https://github.com/accellera-official/systemc
> >
> > We have a question regarding the location for this kind of project.
> > Could you please suggest if there is a preferred location or some
> > standard practice for hosting such a sample project?
>
> Location within the QEMU source tree?
>

Hello Markus,

Yes, it would be good to include this project within the QEMU source tree.
To build the project, the mentioned SystemC, libsystemctlm-soc and
VCML libraries and their specific dependencies need to be built and
installed separately.
Would this approach be acceptable?

Alternatively, is there an auxiliary repository within the QEMU
infrastructure that is better suited for these types of sample
projects,
perhaps somewhere under https://gitlab.com/qemu-project?

--
BR,
Ruslan

