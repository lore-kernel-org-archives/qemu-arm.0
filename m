Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp462869ejb;
        Fri, 23 Dec 2022 06:33:53 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuIAJTnIQ1IevditUQrykbjDeYOo69v8nEwuDUWqnZTB8OC8Cgzqiu2Ro4xTDKQy58TDXER
X-Received: by 2002:a05:6402:174c:b0:467:8dd2:b42 with SMTP id v12-20020a056402174c00b004678dd20b42mr7496391edx.10.1671806033484;
        Fri, 23 Dec 2022 06:33:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671806033; cv=none;
        d=google.com; s=arc-20160816;
        b=QG36nE3oxKcAAkI2cAnnY6H7MD9Po39EaWomydEFREh1svQdu9yjgTZqBlfhwPKf+r
         /gwprhyOYgc25qtTEeJWObNBxqS1/Mbnb6JQgxFTZpUFY6njtHZaub5RwI6JclZ5C0J8
         yqlDZPLB8aGebE8KiVqyAhKKUHGfhR9vHodkxuTRSTTryE3epbmV5WnwzkguI7WbC0yf
         b8rgKDgRMjbWKxc2YTL4ZD4owFYShSnFAhKY9YbHO6Xu2MeFOlKncbNvVfVMl2Out34V
         gFR0GcB9KvAPxQWwJkyjkJWjr8AiD9ZeP659eBOptT0+4M3Mhv2UgxeMXFwB7k0evlXo
         OTdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+qhzig9Rf8n2wQ3+/kfSA5MvTzzqQTGQpJ7teNRINNo=;
        b=z7nxRrDMaf6LqG7P7D1CvMS2sc7ygkXXTO+wZMhqRzPKQSo1IDSLos/ManZcJdm6Vm
         wZUldcJkwHiFlyxruDVAvEkP95fPHVo/6fsBzz8prAumbzgNDzm0naf7sLjJO2SgNNLQ
         9f9AVHXJbTRy4aayLubTUyccao7o7wViR+MpBSocOdvEJVeWjEdrE1VBIxKLE8JoQLI/
         juygJv39QlLyjX/cM+ipYlZiV3fJeMlhFMMCTv6F2vvzAhgbtALe2zwz/IqVmRszYLyq
         PaGL1+04N/zp0I22Sp/aeOBIzP1vqQ4+riR2m3O5R4L6iEcoGQnLdnQPPe4WOviAGwXJ
         WBbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=WrqcTD8h;
       spf=pass (google.com: domain of ardb@kernel.org designates 2604:1380:4601:e00::1 as permitted sender) smtp.mailfrom=ardb@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <ardb@kernel.org>
Received: from ams.source.kernel.org (ams.source.kernel.org. [2604:1380:4601:e00::1])
        by mx.google.com with ESMTPS id q17-20020a056402519100b00462848f0cdbsi3217315edd.299.2022.12.23.06.33.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Dec 2022 06:33:53 -0800 (PST)
Received-SPF: pass (google.com: domain of ardb@kernel.org designates 2604:1380:4601:e00::1 as permitted sender) client-ip=2604:1380:4601:e00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=WrqcTD8h;
       spf=pass (google.com: domain of ardb@kernel.org designates 2604:1380:4601:e00::1 as permitted sender) smtp.mailfrom=ardb@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 09E2BB8207B;
	Fri, 23 Dec 2022 14:33:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE0CFC43392;
	Fri, 23 Dec 2022 14:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671806031;
	bh=i78MCQ30G80ajVIBVA2UX7jOa9KC4fgE6A8ei9cQdCw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WrqcTD8hzfKcLUHfQhaOjQi+ynOM+ERhDLMyZh6rwxH2IPkLw62LlWXfdh26t6VPk
	 FNwQCdd5HaPmKMeDq9BydbgOo4Vt2CUav+0xCa6C66U5vwxTaXgFbT7K/kgZHkfmlP
	 LLlxR7tB/hhSqFeoCt6dQTY74hOqnGbL1d0aBgEoCHOAInuIZjAPgJ7ykKXZpzwdLm
	 dY7Hqspe5IjqW5Vu9WCanLgQbeLJnasqG2Zvn0j+QO0tQaqqOORGngyjtzE9xx/6MK
	 U9Y9p1Jmhejy0x7rqeEH1tZ6bKWOQYCCd8gy32ex7anBvqaTe4BQj2UvKPdeRnQWEc
	 fz45JSIlQp4kA==
Received: by mail-lf1-f47.google.com with SMTP id x11so7362542lfn.0;
        Fri, 23 Dec 2022 06:33:51 -0800 (PST)
X-Gm-Message-State: AFqh2kqGP9sxXVK0gdJVpSWG06hsR6NcI1QP5rj8HvucnjN3+Fo5uXDj
	9cLJgFqeuuRaZQUI/fnX3h+cQefV4b6CJP4fcSc=
X-Received: by 2002:a05:6512:15a3:b0:4bc:bdf5:f163 with SMTP id
 bp35-20020a05651215a300b004bcbdf5f163mr520074lfb.583.1671806029642; Fri, 23
 Dec 2022 06:33:49 -0800 (PST)
MIME-Version: 1.0
References: <20221220084246.1984871-1-kraxel@redhat.com> <a31967f6-6de5-bed2-8a1a-68a909850dd5@linaro.org>
 <20221220153301.ku3zxwglhxepet6i@sirius.home.kraxel.org>
In-Reply-To: <20221220153301.ku3zxwglhxepet6i@sirius.home.kraxel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 23 Dec 2022 15:33:38 +0100
X-Gmail-Original-Message-ID: <CAMj1kXF=SNeK6fSgo0821XF+dgs-i__bEoUwvJsDRCtpixsTsg@mail.gmail.com>
Message-ID: <CAMj1kXF=SNeK6fSgo0821XF+dgs-i__bEoUwvJsDRCtpixsTsg@mail.gmail.com>
Subject: Re: [PATCH v2] pflash: Only read non-zero parts of backend image
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	qemu-devel@nongnu.org, qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>, 
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
	Hanna Reitz <hreitz@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	John Snow <jsnow@redhat.com>, Kashyap Chamarthy <kchamart@redhat.com>, 
	Xiang Zheng <zhengxiang9@huawei.com>, David Edmondson <david.edmondson@oracle.com>, 
	Markus Armbruster <armbru@redhat.com>, Sunil V L <sunilvl@ventanamicro.com>, 
	Andrew Jones <ajones@ventanamicro.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Xiaojuan Yang <yangxiaojuan@loongson.cn>, 
	Song Gao <gaosong@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Radoslaw Biernacki <rad@semihalf.com>, 
	Leif Lindholm <quic_llindhol@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: QmzJRGGzOrfE

On Tue, 20 Dec 2022 at 16:33, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> On Tue, Dec 20, 2022 at 10:30:43AM +0100, Philippe Mathieu-Daud=C3=A9 wro=
te:
> > [Extending to people using UEFI VARStore on Virt machines]
> >
> > On 20/12/22 09:42, Gerd Hoffmann wrote:
> > > From: Xiang Zheng <zhengxiang9@huawei.com>
> > >
> > > Currently we fill the VIRT_FLASH memory space with two 64MB NOR image=
s
> > > when using persistent UEFI variables on virt board. Actually we only =
use
> > > a very small(non-zero) part of the memory while the rest significant
> > > large(zero) part of memory is wasted.
> > >
> > > So this patch checks the block status and only writes the non-zero pa=
rt
> > > into memory. This requires pflash devices to use sparse files for
> > > backends.
> >
> > I like the idea, but I'm not sure how to relate with NOR flash devices.
> >
> > From the block layer, we get BDRV_BLOCK_ZERO when a block is fully
> > filled by zeroes ('\0').
> >
> > We don't want to waste host memory, I get it.
> >
> > Now what "sees" the guest? Is the UEFI VARStore filled with zeroes?
>
> The varstore is filled with 0xff.  It's 768k in size.  The padding
> following (63M plus a bit) is 0x00.  To be exact:
>
> kraxel@sirius ~# hex /usr/share/edk2/aarch64/vars-template-pflash.raw
> 00000000  00 00 00 00  00 00 00 00  00 00 00 00  00 00 00 00  ...........=
.....
> 00000010  8d 2b f1 ff  96 76 8b 4c  a9 85 27 47  07 5b 4f 50  .+...v.L..'=
G.[OP
> 00000020  00 00 0c 00  00 00 00 00  5f 46 56 48  ff fe 04 00  ........_FV=
H....
> 00000030  48 00 28 09  00 00 00 02  03 00 00 00  00 00 04 00  H.(........=
.....
> 00000040  00 00 00 00  00 00 00 00  78 2c f3 aa  7b 94 9a 43  ........x,.=
.{..C
> 00000050  a1 80 2e 14  4e c3 77 92  b8 ff 03 00  5a fe 00 00  ....N.w....=
.Z...
> 00000060  00 00 00 00  ff ff ff ff  ff ff ff ff  ff ff ff ff  ...........=
.....
> 00000070  ff ff ff ff  ff ff ff ff  ff ff ff ff  ff ff ff ff  ...........=
.....
> *
> 00040000  2b 29 58 9e  68 7c 7d 49  a0 ce 65 00  fd 9f 1b 95  +)X.h|}I..e=
.....
> 00040010  5b e7 c6 86  fe ff ff ff  e0 ff 03 00  00 00 00 00  [..........=
.....
> 00040020  ff ff ff ff  ff ff ff ff  ff ff ff ff  ff ff ff ff  ...........=
.....
> *
> 000c0000  00 00 00 00  00 00 00 00  00 00 00 00  00 00 00 00  ...........=
.....
> *
>
> > If so, is it a EDK2 specific case for all virt machines?  This would
> > be a virtualization optimization and in that case, this patch would
> > work.
>
> vars-template-pflash.raw (padded image) is simply QEMU_VARS.fd (unpadded
> image) with 'truncate --size 64M' applied.
>
> Yes, that's a pure virtual machine thing.  On physical hardware you
> would probably just flash the first 768k and leave the remaining flash
> capacity untouched.
>
> > * or you are trying to optimize paravirtualized guests.
>
> This.  Ideally without putting everything upside-down.
>
> >   In that case why insist with emulated NOR devices? Why not have EDK2
> >   directly use a paravirtualized block driver which we can optimize /
> >   tune without interfering with emulated models?
>
> While that probably would work for the variable store (I think we could
> very well do with variable store not being mapped and requiring explicit
> read/write requests) that idea is not going to work very well for the
> firmware code which must be mapped into the address space.  pflash is
> almost the only device we have which serves that need.  The only other
> option I can see would be a rom (the code is usually mapped r/o anyway),
> but that has pretty much the same problem space.  We would likewise want
> a big enough fixed size ROM, to avoid life migration problems and all
> that, and we want the unused space not waste memory.
>
> > Keeping insisting on optimizing guests using the QEMU pflash device
> > seems wrong to me. I'm pretty sure we can do better optimizing clouds
> > payloads.
>
> Moving away from pflash for efi variable storage would cause alot of
> churn through the whole stack.  firmware, qemu, libvirt, upper
> management, all affected.  Is that worth the trouble?  Using pflash
> isn't that much of a problem IMHO.
>

Agreed. pflash is a bit clunky but not a huge problem atm (although
setting up and tearing down the r/o memslot for every read resp. write
results in some performance issues under kvm/arm64)

*If* we decide to replace it, I would suggest an emulated ROM for the
executable image (without any emulated programming facility
whatsoever) and a paravirtualized get/setvariable interface which can
be used in a sane way to virtualize secure boot without having to
emulate SMM or other secure world firmware interfaces.
