Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp7266622wrq;
        Thu, 28 Jun 2018 03:49:32 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcHj9K3Yqdlv4ov0Btk6QWd6O4f72DxWHxuPCScdaYWMTg5IPRDnPUSYtf+lbMh/D2KMZn3
X-Received: by 2002:a0c:8905:: with SMTP id 5-v6mr8672386qvp.195.1530182972539;
        Thu, 28 Jun 2018 03:49:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530182972; cv=none;
        d=google.com; s=arc-20160816;
        b=do9CTRUDsDs7Ct+J9FdVvF80iB3rZjsBexDorD5pt7cNdS1moS5MjB4NkOh1wulLHc
         5GjpuppDcUzyqfh75BHk7kb3Whd4ii7L/GUthsqcNahy3ERfmINulm0+Q6cd45Ixy3Z4
         oFu2e9ZkUlZ/ugfRtsLuzvFXQePkp0TipXtIoNOefbl2NzbYas8XkamsQDRKw7bjWDAD
         urtTUgT4ZvgHrNfSLZWA3tBvlFtZie07QPyh6LCUuO35qorymJ5VI/XLhke+IRm0VKSv
         hHy+PtySBgdAt+z6EOglgU9xZ2NktkEY+8JR1JvGLk2wAuPeKNmW78+r2qh3wNnP9FCr
         FyYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=meaTl73gGFzITRyGC+RfjqxTJtEpGv9+b0agQJdfwDk=;
        b=kXWKP/fsux9z83kgt06EUYpfnHhhaU6DeaAtT2w7/bHJiqLMOKEJLL8W1uI17k5T9F
         yelz/NbNf2pODf2aaYd6DsKGnt8bCIjyeImogsAyCp1hAaa9dOE0Fsf3gVkTIqRhUmir
         fNRxokgGj8KqaGzlf4Km7XwsiX0TaFA+5qjspOTXOL4x2j/s6u6Zh1OcJmu0/xUDD589
         GvMS3jAGOL5oQ4ntDX5ZYRxxvY5foFiHHok3Jz86TZbGLPWHI8cnTBs0VVYUxk/lu13W
         4aO+XEPVyOZs4tBFcRo6NqrqEzgFdC+sPJePoOXMtb+Be1rdxbAvPm4gabtuJKCRRM2O
         2mKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="VMZYgH/4";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p15-v6si3453763qvb.95.2018.06.28.03.49.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Jun 2018 03:49:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="VMZYgH/4";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35696 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fYUUW-0005sx-3E
	for alex.bennee@linaro.org; Thu, 28 Jun 2018 06:49:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44683)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hongbo.zhang@linaro.org>) id 1fYUSf-0005Dl-GC
	for qemu-devel@nongnu.org; Thu, 28 Jun 2018 06:47:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hongbo.zhang@linaro.org>) id 1fYUSe-00088I-89
	for qemu-devel@nongnu.org; Thu, 28 Jun 2018 06:47:37 -0400
Received: from mail-it0-x244.google.com ([2607:f8b0:4001:c0b::244]:38952)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <hongbo.zhang@linaro.org>)
	id 1fYUSe-00086q-3M
	for qemu-devel@nongnu.org; Thu, 28 Jun 2018 06:47:36 -0400
Received: by mail-it0-x244.google.com with SMTP id p185-v6so11837561itp.4
	for <qemu-devel@nongnu.org>; Thu, 28 Jun 2018 03:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=meaTl73gGFzITRyGC+RfjqxTJtEpGv9+b0agQJdfwDk=;
	b=VMZYgH/4u+zGTmWedVo6tehTwi4lLhgftB9BeVKsRvOxfFfOn07Vp7MHNKF71CminG
	RX0vnwgr3IBuNela6++5Ypds68IdFmtqMu1Li7tMGsSe1Cmr+nQVACgRojQmmW2SaVI9
	RvV6SMobYm/zH6S4+4C+jBopHXpQAoL4T4xdo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=meaTl73gGFzITRyGC+RfjqxTJtEpGv9+b0agQJdfwDk=;
	b=LL8TrkAUyI3Q/9znjg27PiI9VZ0IOi5OKUrXlv6moB5CKvgWG71+rmvYaxbEmXdpQm
	2CGLGTZRYxXo72Hd571mOzhLU5TkheRMVKA4N/x7XPGZ78/3CpT0Ms5f3fgAym0TgSZ+
	5pyBpcqa7NeADe33V+c4Tx/n3roy2Cysu5Gev34bmyypSf29iZpJ51nL1kw+4at1MfaM
	uBOz4M5VEqZgI8DLd2hE3UzTES7r+DdCbgdu1NOCfLrrhNufLcjsULdyMa+qCxT6So9Z
	vB3BbvMsHLeGwaJRTLDsTwdYfujbdm9ywL5XaeD+E8gwvA1XqkhoFQtKEiAYoHzmTyMQ
	3r7A==
X-Gm-Message-State: APt69E3vuzG13GHLyPGvTHDQmNBIrkzkLuwkC26Zor5y/VNqIo8qGgsV
	yli4iSCrz+YKh4E3/c7gW0P0B2ajAa9cDsKY4tjW7A==
X-Received: by 2002:a02:85a1:: with SMTP id
	d30-v6mr7938254jai.59.1530182855252; 
	Thu, 28 Jun 2018 03:47:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac0:a65a:0:0:0:0:0 with HTTP; Thu, 28 Jun 2018 03:47:34
	-0700 (PDT)
In-Reply-To: <20180628102216.GC3513@redhat.com>
References: <1530094388-607-1-git-send-email-hongbo.zhang@linaro.org>
	<20180627123116.GB2424@work-vm> <20180628102216.GC3513@redhat.com>
From: Hongbo Zhang <hongbo.zhang@linaro.org>
Date: Thu, 28 Jun 2018 18:47:34 +0800
Message-ID: <CAHmQWvA7_sv53xtgSQ6bb9G+bkYtakqvTHk38xaDhPyJuCe-vg@mail.gmail.com>
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c0b::244
Subject: Re: [Qemu-devel] [PATCH] hw/arm: Add SBSA machine type
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hgDLtsmTMy6F

On 28 June 2018 at 18:22, Daniel P. Berrang=C3=A9 <berrange@redhat.com> wro=
te:
> On Wed, Jun 27, 2018 at 01:31:17PM +0100, Dr. David Alan Gilbert wrote:
>> * Hongbo Zhang (hongbo.zhang@linaro.org) wrote:
>> > This patch introduces a new Arm machine type 'SBSA' with features:
>> >  - Based on legacy 'virt' machine type.
>
> The 'virt' machine type is absolutely *not* legacy. It is the preferred
> modern, legacy-free machine type when running virtual machines. Since
> aarch64 is greenfield, there is no compelling reason to emulate a
> specific physical machine for VMs, hence the 'virt' machine type.
>
>> >  - Newly designed memory map.
>> >  - EL2 and EL3 are enabled by default.
>> >  - AHCI controller attached to system bus, and then CDROM and hard dis=
c
>> >    can be added to it.
>> >  - EHCI controller attached to system bus, with USB mouse and key boar=
d
>> >    installed by default.
>> >  - E1000 ethernet card on PCIE bus.
>
>> >  - VGA display adaptor on PCIE bus.
>> >  - Default CPU type cortex-a57, 4 cores, and 1G bytes memory.
>> >  - No virtio functions enabled, since this is to emulate real hardware=
.
>>
>> I'm a bit confused; do you have real modern ARM hardware that has an
>> e1000 on it?  If I understand correctly, e1000 is the old PCI version
>> and the e1000e is at least the more modern PCIe version which makes
>> more sense if you're building on PCIe.
>
> Indeed, it makes little sense to default to e1000 if the goal is to make
> it legacy-free
>
>> However, if you:
>>   a) Don't have real hardware with the e1000 on
>>   b) Do have PCIe
>>
>> then to my mind it makes sense to use virtio-net-pci rather than
>> an e1000e.
>
> If it does down the virtio-* route though, I fail to see any point in
> adding the new machine type at all -  'virt' machine type is intended
> to be used for guests where everything is paravirtualized, ignoring
> physical hardware constraints.
>
Your comment comes earlier than I replied to Laszlo Ersek:

I said "yes yes yes" to him due to he describes the purpose so well,
even better than me.

And the I had some misunderstanding of term 'legacy' too, as I
explained in that reply.

> Regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
