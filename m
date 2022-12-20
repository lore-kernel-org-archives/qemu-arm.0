Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4419698ejb;
        Tue, 20 Dec 2022 07:33:12 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7DIIXUVcZjfU4V7DWIpdEhXnP4zAUsTOTO22+9YcBdsAIvpFlueOaiP9vqnRLVD3154Pnd
X-Received: by 2002:a05:7508:658d:b0:47:1fe8:d743 with SMTP id dn13-20020a057508658d00b000471fe8d743mr4084844gbb.3.1671550391984;
        Tue, 20 Dec 2022 07:33:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671550391; cv=none;
        d=google.com; s=arc-20160816;
        b=WqqhkptERhkC5a4uRz6EiIlxNFUPEprxyc3GueRAnORJ4VXA4Jfy3P+0ysNUYAmEas
         nrRas4DFeIfi47hXh3JwHo/sojIfbvsQ32cOqbxnUfxeyx9kVXBGwDDIoZBjxgmycLvO
         vSNmmC6TCVLdcD+e/lXJ3iqBIkNR35XFRm3tKyEVz/myf3ybi9M6f+pmFpRrGSI3qWJ5
         C6y4edyTaN7tyO4D7/mBhl+dPLxHlSnoxCGa5fYpvGuPgfrhrvG6sVKlx4WAF1hTPMJs
         IV0h/3AoyyLvc27AQYQ7Ror+JWuKt52y/EUFqIUBloO8tzavkfutztKva6zrXHiIzdVX
         MK9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=ffmddQe9ricgigDQOWAY39BHz2JFTyJ3/5Imi4NJ2u0=;
        b=QFt96tY3ML/HjbDJYhUKbf3du3HXV+E1pFsMNFOseSbaBweVBOAZ1ZKiO/DR+hRje/
         kHW528LMZ9FFjG6WC3wEuWrvlabG+8W4R6nKafbhAzGAiWebAQOyGlM6PUsR23I0yrQy
         2EejY4U5/rn5wIh8rv+K2K8fTCYHd6qm8YULGLvCfjM5gZg3J4jkFEY9oUmq2UCZoCJU
         Ej8QB0Adv3wujv0FwbjS7TN84yU4PQLvc9iN5Cxi5nLSt+zaEQwSkpBIQXst6xsDCLTi
         JQnAtYTkJIjalpw0K98BhMkD0s3FrEIHHE7fV57dMaFEUtmryFHvmin2MVjYCjU4KyLV
         itaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QdjgZD5L;
       spf=pass (google.com: domain of kraxel@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=kraxel@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kraxel@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id j15-20020ac806cf000000b003a4f4c192e4si5022220qth.648.2022.12.20.07.33.11
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Dec 2022 07:33:11 -0800 (PST)
Received-SPF: pass (google.com: domain of kraxel@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QdjgZD5L;
       spf=pass (google.com: domain of kraxel@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=kraxel@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671550391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ffmddQe9ricgigDQOWAY39BHz2JFTyJ3/5Imi4NJ2u0=;
	b=QdjgZD5LjQ/1khaKGCiAJho+NwAYFm9sSAcq83wQZdAb4fhqRnIiEOKzENiEipVROcMjOc
	B1D91txP7sotdrS7lOnT161rHjVvxhaXycPzxdcTxEskxgfeRvWJ/4XkI3i3einUFESLos
	tYFFvW2Z49eNRiF3Iwf2VW3yU8NQI5s=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-486-9otbTpZuMS2yZQmV1FEnVQ-1; Tue, 20 Dec 2022 10:33:05 -0500
X-MC-Unique: 9otbTpZuMS2yZQmV1FEnVQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 43DFE1C09B69;
	Tue, 20 Dec 2022 15:33:04 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.110])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DD6112026D4B;
	Tue, 20 Dec 2022 15:33:02 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 54DFF18000B3; Tue, 20 Dec 2022 16:33:01 +0100 (CET)
Date: Tue, 20 Dec 2022 16:33:01 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
	Kevin Wolf <kwolf@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	Hanna Reitz <hreitz@redhat.com>,
	Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Kashyap Chamarthy <kchamart@redhat.com>,
	Xiang Zheng <zhengxiang9@huawei.com>,
	David Edmondson <david.edmondson@oracle.com>,
	Markus Armbruster <armbru@redhat.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>,
	Song Gao <gaosong@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Leif Lindholm <quic_llindhol@quicinc.com>
Subject: Re: [PATCH v2] pflash: Only read non-zero parts of backend image
Message-ID: <20221220153301.ku3zxwglhxepet6i@sirius.home.kraxel.org>
References: <20221220084246.1984871-1-kraxel@redhat.com>
 <a31967f6-6de5-bed2-8a1a-68a909850dd5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a31967f6-6de5-bed2-8a1a-68a909850dd5@linaro.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-TUID: Tio+rmSWyG1f

On Tue, Dec 20, 2022 at 10:30:43AM +0100, Philippe Mathieu-Daudé wrote:
> [Extending to people using UEFI VARStore on Virt machines]
> 
> On 20/12/22 09:42, Gerd Hoffmann wrote:
> > From: Xiang Zheng <zhengxiang9@huawei.com>
> > 
> > Currently we fill the VIRT_FLASH memory space with two 64MB NOR images
> > when using persistent UEFI variables on virt board. Actually we only use
> > a very small(non-zero) part of the memory while the rest significant
> > large(zero) part of memory is wasted.
> > 
> > So this patch checks the block status and only writes the non-zero part
> > into memory. This requires pflash devices to use sparse files for
> > backends.
> 
> I like the idea, but I'm not sure how to relate with NOR flash devices.
> 
> From the block layer, we get BDRV_BLOCK_ZERO when a block is fully
> filled by zeroes ('\0').
> 
> We don't want to waste host memory, I get it.
> 
> Now what "sees" the guest? Is the UEFI VARStore filled with zeroes?

The varstore is filled with 0xff.  It's 768k in size.  The padding
following (63M plus a bit) is 0x00.  To be exact:

kraxel@sirius ~# hex /usr/share/edk2/aarch64/vars-template-pflash.raw 
00000000  00 00 00 00  00 00 00 00  00 00 00 00  00 00 00 00  ................
00000010  8d 2b f1 ff  96 76 8b 4c  a9 85 27 47  07 5b 4f 50  .+...v.L..'G.[OP
00000020  00 00 0c 00  00 00 00 00  5f 46 56 48  ff fe 04 00  ........_FVH....
00000030  48 00 28 09  00 00 00 02  03 00 00 00  00 00 04 00  H.(.............
00000040  00 00 00 00  00 00 00 00  78 2c f3 aa  7b 94 9a 43  ........x,..{..C
00000050  a1 80 2e 14  4e c3 77 92  b8 ff 03 00  5a fe 00 00  ....N.w.....Z...
00000060  00 00 00 00  ff ff ff ff  ff ff ff ff  ff ff ff ff  ................
00000070  ff ff ff ff  ff ff ff ff  ff ff ff ff  ff ff ff ff  ................
*
00040000  2b 29 58 9e  68 7c 7d 49  a0 ce 65 00  fd 9f 1b 95  +)X.h|}I..e.....
00040010  5b e7 c6 86  fe ff ff ff  e0 ff 03 00  00 00 00 00  [...............
00040020  ff ff ff ff  ff ff ff ff  ff ff ff ff  ff ff ff ff  ................
*
000c0000  00 00 00 00  00 00 00 00  00 00 00 00  00 00 00 00  ................
*

> If so, is it a EDK2 specific case for all virt machines?  This would
> be a virtualization optimization and in that case, this patch would
> work.

vars-template-pflash.raw (padded image) is simply QEMU_VARS.fd (unpadded
image) with 'truncate --size 64M' applied.

Yes, that's a pure virtual machine thing.  On physical hardware you
would probably just flash the first 768k and leave the remaining flash
capacity untouched.

> * or you are trying to optimize paravirtualized guests.

This.  Ideally without putting everything upside-down.

>   In that case why insist with emulated NOR devices? Why not have EDK2
>   directly use a paravirtualized block driver which we can optimize /
>   tune without interfering with emulated models?

While that probably would work for the variable store (I think we could
very well do with variable store not being mapped and requiring explicit
read/write requests) that idea is not going to work very well for the
firmware code which must be mapped into the address space.  pflash is
almost the only device we have which serves that need.  The only other
option I can see would be a rom (the code is usually mapped r/o anyway),
but that has pretty much the same problem space.  We would likewise want
a big enough fixed size ROM, to avoid life migration problems and all
that, and we want the unused space not waste memory.

> Keeping insisting on optimizing guests using the QEMU pflash device
> seems wrong to me. I'm pretty sure we can do better optimizing clouds
> payloads.

Moving away from pflash for efi variable storage would cause alot of
churn through the whole stack.  firmware, qemu, libvirt, upper
management, all affected.  Is that worth the trouble?  Using pflash
isn't that much of a problem IMHO.
