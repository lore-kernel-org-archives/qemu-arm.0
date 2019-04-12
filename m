Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp408831wrx;
        Fri, 12 Apr 2019 03:58:28 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzEr8124Tru2LL26EamHujwykcg9H26JiNb7muHXlq0ch8MqxRMJ/mLVad2a3iTyHTtaw49
X-Received: by 2002:a5d:4a4d:: with SMTP id v13mr36305826wrs.169.1555066708240;
        Fri, 12 Apr 2019 03:58:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555066708; cv=none;
        d=google.com; s=arc-20160816;
        b=GpvOD30gB42NGDiSpX/qvU6eBTvNEfNVQ3I7uPHODzoN69zH+G/UcVueRiJzELSSPk
         RKy/oC3VoKH4P4h5W2W+1elUe4CgHDj+b7N8DJV1uhxNy317avXj1obFCO+UE6HDICn1
         UJ1gUkksCPy85VqHsj+hNG+Zkr46RYbkltenY7l3NW2etbp5Aj7Jje3aDEBucpm8CxVk
         jaAim8AuiZDe9ez3DKX4kcqIP8CU1ds6xErUnqxbUYYIq3LlBL8DgnlW8dspM5NV7tre
         aRk6LzqSeqKN2h/MGGoneST+VJ/kEIZJESZbBdXVCXqUkf8RYhu0J9ij+F3LgeodNmyN
         8HSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=p9Ucbnmcu4B6Bg+HCkwnxdeCjK1GNLt633vmHB2z0T0=;
        b=oC8ZOSG8+rj+VVIME58YMznypstLM4Cna6g9bGYgdToikjAWktnkeGYRuSGGreKEOI
         WB9m5XHEO0FxaIDVKu04kFi5i7ab9zyWOk+dJQVkNOgAYkXIoKU8M1Z+0GFNspsl4ocB
         efu3veEq07DkryF/AfgvTf9OKsj2Evuz1gVMceFQEKDjjFW4eVlSRVIqd35Rtl6JoqMG
         CJPEm+JPGfwFtgMhGZouYwW3dukc24FyUoFMG5ra7Fv1wp5v4eE16Tgtlok35V0Uc90E
         Fl+53ryIUKGkXgdc0IX7/d5If7e1r0iKdlogIIn3z0Sx5MZn5QepBqUEUtEYUxIVH5+8
         +wFg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y12si26918931wrr.282.2019.04.12.03.58.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Apr 2019 03:58:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:34270 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hEtt5-0007cS-D8
	for alex.bennee@linaro.org; Fri, 12 Apr 2019 06:58:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50890)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hEtsx-0007aK-IR
	for qemu-arm@nongnu.org; Fri, 12 Apr 2019 06:58:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hEtst-0001zB-ES
	for qemu-arm@nongnu.org; Fri, 12 Apr 2019 06:58:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41384)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kwolf@redhat.com>)
	id 1hEtsq-0001fZ-Nt; Fri, 12 Apr 2019 06:58:13 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 755373007C2A;
	Fri, 12 Apr 2019 10:57:43 +0000 (UTC)
Received: from linux.fritz.box (unknown [10.36.118.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A915860C97;
	Fri, 12 Apr 2019 10:57:38 +0000 (UTC)
Date: Fri, 12 Apr 2019 12:57:37 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Xiang Zheng <zhengxiang9@huawei.com>
Message-ID: <20190412105737.GC4522@linux.fritz.box>
References: <bf2decd3-b3cb-08eb-3449-b66f023b084a@huawei.com>
	<c57135ae-41a9-ed7b-976b-bf8fe43596a2@redhat.com>
	<b107e0c0-1c4c-3f0f-eb78-8929c315ce28@huawei.com>
	<a8144a1f-364e-cea5-b0a7-05342bdab936@redhat.com>
	<87bm1fiuo8.fsf@dusky.pond.sub.org>
	<20190409082852.GB6610@localhost.localdomain>
	<c03c51a7-1bb0-b05b-9027-2364ab00517c@huawei.com>
	<20190411122246.GB5694@linux.fritz.box>
	<0c6c32b7-46f8-cf80-b7a6-1b48995b84e4@huawei.com>
	<355cd139-2084-e282-9a60-3574fe0746bd@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <355cd139-2084-e282-9a60-3574fe0746bd@huawei.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Fri, 12 Apr 2019 10:57:43 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC PATCH] hw/arm/virt: use variable
 size of flash device to save memory
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Heyi Guo <guoheyi@huawei.com>, wanghaibin.wang@huawei.com,
	Max Reitz <mreitz@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: T6expybIk0Ih

Am 12.04.2019 um 11:50 hat Xiang Zheng geschrieben:
> 
> On 2019/4/12 9:52, Xiang Zheng wrote:
> > On 2019/4/11 20:22, Kevin Wolf wrote:
> >> Okay, so your problem is that blk_pread() writes to the whole buffer,
> >> writing explicit zeroes for unallocated parts of the image, while you
> >> would like to leave those parts of the buffer untouched so that we don't
> >> actually allocate the memory, but can just use the shared zero page.
> >>
> >> If you just want to read the non-zero parts of the image, that can be
> >> done by using a loop that calls bdrv_block_status() and only reads from
> >> the image if the BDRV_BLOCK_ZERO bit is clear.
> >>
> >> Would this solve your problem?
> > 
> > Sounds good! What if guest tried to read/write the zero parts?
> > 
> 
> I wrote the below patch (refer to bdrv_make_zero()) for test, it seems
> that everything is OK and the memory is also exactly allocated on demand.
> 
> This requires pflash devices to use sparse files backend. Thus I have to
> create images like:
> 
>    dd of="QEMU_EFI-pflash.raw" if="/dev/zero" bs=1M seek=64 count=0
>    dd of="QEMU_EFI-pflash.raw" if="QEMU_EFI.fd" conv=notrunc
> 
>    dd of="empty_VARS.fd" if="/dev/zero" bs=1M seek=64 count=0
> 
> 
> ---8>---
> 
> diff --git a/block/block-backend.c b/block/block-backend.c
> index f78e82a..ed8ca87 100644
> --- a/block/block-backend.c
> +++ b/block/block-backend.c
> @@ -1379,6 +1379,12 @@ BlockAIOCB *blk_aio_pwrite_zeroes(BlockBackend *blk, int64_t offset,
>                          flags | BDRV_REQ_ZERO_WRITE, cb, opaque);
>  }
> 
> +int blk_pread_nonzeroes(BlockBackend *blk, void *buf)
> +{
> +    int ret = bdrv_pread_nonzeroes(blk->root, buf);
> +    return ret;
> +}

I don't think this deserves a place in the public block layer interface,
as it's only a single device that makes use of it.

Maybe you wrote things this way because there is no blk_block_status(),
but you can get the BlockDriverState with blk_bs(blk) and then implement
everything inside hw/block/block.c.

>  int blk_pread(BlockBackend *blk, int64_t offset, void *buf, int count)
>  {
>      int ret = blk_prw(blk, offset, buf, count, blk_read_entry, 0);
> diff --git a/block/io.c b/block/io.c
> index dfc153b..83e5ea7 100644
> --- a/block/io.c
> +++ b/block/io.c
> @@ -882,6 +882,38 @@ int bdrv_pwrite_zeroes(BdrvChild *child, int64_t offset,
>                          BDRV_REQ_ZERO_WRITE | flags);
>  }
> 
> +int bdrv_pread_nonzeroes(BdrvChild *child, void *buf)
> +{
> +    int ret;
> +    int64_t target_size, bytes, offset = 0;
> +    BlockDriverState *bs = child->bs;
> +
> +    target_size = bdrv_getlength(bs);
> +    if (target_size < 0) {
> +        return target_size;
> +    }
> +
> +    for (;;) {
> +        bytes = MIN(target_size - offset, BDRV_REQUEST_MAX_BYTES);
> +        if (bytes <= 0) {
> +            return 0;
> +        }
> +        ret = bdrv_block_status(bs, offset, bytes, &bytes, NULL, NULL);
> +        if (ret < 0) {
> +            return ret;
> +        }
> +        if (ret & BDRV_BLOCK_ZERO) {
> +            offset += bytes;
> +            continue;
> +        }
> +        ret = bdrv_pread(child, offset, buf, bytes);
> +        if (ret < 0) {
> +            return ret;
> +        }
> +        offset += bytes;

I think the code becomes simpler the other way round:

    if (!(ret & BDRV_BLOCK_ZERO)) {
        ret = bdrv_pread(child, offset, buf, bytes);
        if (ret < 0) {
            return ret;
        }
    }
    offset += bytes;

You don't increment buf, so if you have a hole in the file, this will
corrupt the buffer. You need to either increment buf, too, or use
(uint8_t*) buf + offset for the bdrv_pread() call.

> +    }
> +}
> +
>  /*
>   * Completely zero out a block device with the help of bdrv_pwrite_zeroes.
>   * The operation is sped up by checking the block status and only writing

Kevin
