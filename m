Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp1462949lfg;
        Fri, 20 Aug 2021 09:36:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw717Uy3Tp2TJi9g91opcXHkYNtD44svM4Kd5F7OMK9nzVaf6RXk05KaNtJP3J7arJISBkV
X-Received: by 2002:a05:6102:150:: with SMTP id a16mr18090479vsr.50.1629477406141;
        Fri, 20 Aug 2021 09:36:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629477406; cv=none;
        d=google.com; s=arc-20160816;
        b=rN9PHM+3X08vTxXBSobiuv9aEnUMUMeD5Ms0l9W2UBCYpvT9XZ0B8l7ih0cz+JFgt4
         wK7U+DdNckx4tN6PKrRx/2rgtn+crj3cMAQIOihOxdsfyog4KBeL4RvGJ5vBumJUy8wW
         E0/KH69GMK/UU8V4YjNAAnQP+QFY5/J/nNicr7BvKFKM/PK7YYuBHCm0SxW9MH7BrsMm
         6armOMXMURkptDvqQHAA/PzsSdykIE367LwjvvFEsL/N4jSEkvC+W3bgmPjdc0KffTOo
         Mp+UtDJeqhuWlp4RMbqYmu6F1JWjYBYiwvw5WgeOzPvRX18hGvP8E1DNNmiOMWY0ZJq2
         owRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=J78D7pMyvIUO1fgbUerS7BMjB+amW0yHqlhEJDOb2SY=;
        b=v7gKwR5Mq5bcjLrEcRaIbR8G1L4vsH7coyLJBX6CDRrVES6Lh1au9dCq8wSSZwgZDi
         GSbEYFcldHZ5EPFBKg06DuluKJsf7a24WEvBPRgAXXN+ShOBr63HvhGRupcjnH16HeEB
         qRfwsFF4lCxQDrFz/nlufkbYffdEtFDw/kmgxHNSumNYXlR/tFnZ7r7dFnRFYRsyTb6X
         QsNtkHENo30qnIeuB2X0P4tAcLH78ONMrxN4/RxSOwHYxdz5bkWyBKAliCFh+r3ln8Oq
         pR6salZ8E7qkSxPp3Q6DcKv/SaOZIz08YH4wUXI5kK1KhTO3eYStjJYM4BLVzBk4nybW
         BdDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=I6qcZHtJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b21si3744080vsr.247.2021.08.20.09.36.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Aug 2021 09:36:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=I6qcZHtJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mH7Vd-0003eM-ET
	for alex.bennee@linaro.org; Fri, 20 Aug 2021 12:36:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mH7VR-0003e4-9L
 for qemu-arm@nongnu.org; Fri, 20 Aug 2021 12:36:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mH7VO-0000Sq-2h
 for qemu-arm@nongnu.org; Fri, 20 Aug 2021 12:36:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629477388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J78D7pMyvIUO1fgbUerS7BMjB+amW0yHqlhEJDOb2SY=;
 b=I6qcZHtJmc0gumk4U4E9qdp/pX/cZAVRWm3/wrG7O+YivejlRBQZaHWoqKX/vPTYoIr6zX
 c4hV8KVgJ5O3x4heuVl6aMS7GahtpiHkafChaI8pC8LQVt1dhz9aba73Yq/rV2XbzCVf+V
 +8tqBYfv6Jijtp5eRo1fOyxnR1bcJLo=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-R3zVXG4LMUSHKeLBvjGWEg-1; Fri, 20 Aug 2021 12:36:26 -0400
X-MC-Unique: R3zVXG4LMUSHKeLBvjGWEg-1
Received: by mail-ej1-f70.google.com with SMTP id
 h7-20020a17090619c700b005bc3c7dead9so3931084ejd.5
 for <qemu-arm@nongnu.org>; Fri, 20 Aug 2021 09:36:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J78D7pMyvIUO1fgbUerS7BMjB+amW0yHqlhEJDOb2SY=;
 b=Ka4cB50jMKJ+L93EE8Snz+I3RhKXsUMiZQgzLok7UqUTkMAfW2H2zddPLJ4orf/3Nt
 hx9G3Tj7M5IjxgDZm3LJjHMoqZds4t1X+e3YOy+Mzvq2BSFsX3udFnRvOPkafvTuCuqq
 6tJ1KNeLsNauAtnXNR72V8zmZftG4EyI8zrm2GtM/RrJ1GiYjqizn9wn0fW0Nnn/WiTg
 Ug9r0+jTihPC19tlOR47rDk4FaAFzX0Z8pG5SGCddzftQ4jLYlEEX2y6bh5JF6wKjKBq
 9KyHSReFLntfpVZ7daTiuCdjVBPms7DXM4JAzGHXF7/Db9a4p76uPRfzzLjuSLHuSJ9J
 XAdQ==
X-Gm-Message-State: AOAM530P8mVYlMvsKnjGWRBSemVwvD4BR2hkKW2uzpXDY7Csu4Hjd1jF
 +oF2H0Y3NwsPe2MdkrF9Q0gFVvyfXJ1wVtGGDER0b+L5TCggZGJbLmKxZ6Ybw+b/hd7LmhnLtRw
 ub7hbrA7Wywsb
X-Received: by 2002:a05:6402:1747:: with SMTP id
 v7mr24167750edx.19.1629477385595; 
 Fri, 20 Aug 2021 09:36:25 -0700 (PDT)
X-Received: by 2002:a05:6402:1747:: with SMTP id
 v7mr24167725edx.19.1629477385361; 
 Fri, 20 Aug 2021 09:36:25 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id h5sm3873530edz.0.2021.08.20.09.36.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 09:36:24 -0700 (PDT)
Date: Fri, 20 Aug 2021 18:36:23 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: Re: xilinx-zynq-a9: cannot set up guest memory 'zynq.ext_ram'
Message-ID: <20210820183623.32e02362@redhat.com>
In-Reply-To: <3bbd662f-cc25-0a16-6ba0-444635755234@redhat.com>
References: <CAEUhbmUhKFFxSspve+t2BeppCGPegpb_Z5g-w8M5t-JMLy3Zsg@mail.gmail.com>
 <869f8be9-b76f-e315-9591-9c452bedf922@redhat.com>
 <CAEUhbmUE4fb2NewE+Cze3Le5xOeH53NDbwdnKH==dnZeKGPQeQ@mail.gmail.com>
 <e833a774-d3bf-62d5-91d8-b24cbee0bfc4@redhat.com>
 <CAFEAcA8MqYQiTJkKyWGkcKR=J2FD9SDWvHm9vxZq3g2HJ8ch3w@mail.gmail.com>
 <20210820174402.47a14625@redhat.com>
 <199dc732-1876-d6f9-4569-1802ba7ebf93@redhat.com>
 <20210820180323.7df8751d@redhat.com>
 <3bbd662f-cc25-0a16-6ba0-444635755234@redhat.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, "Richard W.M.
 Jones" <rjones@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NTO7j0Yh2N3t

On Fri, 20 Aug 2021 18:06:30 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> On 8/20/21 6:03 PM, Igor Mammedov wrote:
> > On Fri, 20 Aug 2021 17:47:01 +0200
> > David Hildenbrand <david@redhat.com> wrote:
> >  =20
> >> On 20.08.21 17:44, Igor Mammedov wrote: =20
> >>> On Fri, 20 Aug 2021 15:39:27 +0100
> >>> Peter Maydell <peter.maydell@linaro.org> wrote:
> >>>    =20
> >>>> On Fri, 20 Aug 2021 at 15:34, David Hildenbrand <david@redhat.com> w=
rote:   =20
> >>>>>
> >>>>> On 20.08.21 16:22, Bin Meng wrote:   =20
> >>>>>> Hi Philippe,
> >>>>>>
> >>>>>> On Fri, Aug 20, 2021 at 10:10 PM Philippe Mathieu-Daud=C3=A9
> >>>>>> <philmd@redhat.com> wrote:   =20
> >>>>>>>
> >>>>>>> Hi Bin,
> >>>>>>>
> >>>>>>> On 8/20/21 4:04 PM, Bin Meng wrote:   =20
> >>>>>>>> Hi,
> >>>>>>>>
> >>>>>>>> The following command used to work on QEMU 4.2.0, but is now bro=
ken
> >>>>>>>> with QEMU head.
> >>>>>>>>
> >>>>>>>> $ qemu-system-arm -M xilinx-zynq-a9 -display none -m 40000000
> >>>>>>>> -nographic -serial /dev/null -serial mon:stdio -monitor null -de=
vice
> >>>>>>>> loader,file=3Du-boot-dtb.bin,addr=3D0x4000000,cpu-num=3D0
> >>>>>>>> qemu-system-arm: cannot set up guest memory 'zynq.ext_ram': Cann=
ot
> >>>>>>>> allocate memory   =20
> >>>>   =20
> >>>>> -m 40000000
> >>>>>
> >>>>> corresponds to 38 TB if I am not wrong. Is that really what you wan=
t?   =20
> >>>>
> >>>> Probably not, because the zynq board's init function does:
> >>>>
> >>>>      if (machine->ram_size > 2 * GiB) {
> >>>>          error_report("RAM size more than 2 GiB is not supported");
> >>>>          exit(EXIT_FAILURE);
> >>>>      }
> >>>>
> >>>> It seems a bit daft that we allocate the memory before we do
> >>>> the size check. This didn't use to be this way around...
> >>>>
> >>>> Anyway, I think the cause of this change is commit c9800965c1be6c39
> >>>> from Igor. We used to silently cap the RAM size to 2GB; now we
> >>>> complain. Or at least we would complain if we hadn't already
> >>>> tried to allocate the memory and fallen over...   =20
> >>>
> >>> That's because RAM (as host resource) is now separated
> >>> from device model (machine limits) and is allocated as
> >>> part of memory backend initialization (in this case
> >>> 'create_default_memdev') before machine_run_board_init()
> >>> is run.
> >>>
> >>> Maybe we can consolidate max limit checks in
> >>> create_default_memdev() by adding MachineClass::max_ram_size
> >>> but that can work only in default usecase (only '-m' is used).   =20
> >>
> >> We do have a workaround for s390x already: mc->fixup_ram_size
> >>
> >> That should be called before the memory backend is created and seems t=
o=20
> >> do just what we want, no? =20
> >=20
> > it's there for compat sake only if I recall correctly,
> > there should be no fixups ever.
> > If user asks for nonsence, QEMU should error out and force
> > user to correct CLI =20
>=20
> Agreed, but this would be cheaper to run the checks *before*
> allocating the resources ;)
Agreed,
Only it will work for default usecase only as I described above.

>=20
> > (fixups were one of items that were in
> > the way of splitting guest RAM into backend/frontend model)
> >  =20
>=20

