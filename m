Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3692928wrx;
        Mon, 8 Apr 2019 09:14:32 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzXIR9DkdxgedSNek5/wmbLpJ0xDDZ1Nlg/Ct1MTQOqyAc+F5UHwYBwnf39DdNQPbGRwV4H
X-Received: by 2002:adf:afe1:: with SMTP id y33mr20156729wrd.288.1554740072949;
        Mon, 08 Apr 2019 09:14:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554740072; cv=none;
        d=google.com; s=arc-20160816;
        b=pu6I3bjTjKE7K51oLBLi6F1KYClSs8dwof/Folyj2DXsO0SVkTHDV9sBXFv2Gqs1hL
         W54sVGixe7XnMuxqmTbqKZee0rMQIIJ921qWHAvTC88UsQItTOW3rPpdOvx7CvHIbO06
         kOon5n/cmJKk2kIlOrVDmXdZH4o9hHmK9Tv8DL2jSAHGXL7w34K827lbW27DP9c/8qFC
         f/EzOGL8ujag1QmJ8uO2M8RUfgPiCK/vRRaiPn4AwkukIxg74p1Agwrl26O7rs7dH+Mf
         El9KmwdouXn++pS0sGp9u4tbQ8owngJBWYEd9GvHdUw8kYOfiSNTOrncuACuiHA/Mi04
         7F8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=3dzxZDERj1Wor5XI1zJ4+5lkFfIss+obANbLEXYSbg8=;
        b=AMGhmk+TRh/GkfQasEnryqorOIwTyemJ6WykEyzs35rWDE4MSCo4wiDtTeGYsm55Y+
         xDyO7WzYP4BofvJJr+YjoBBWF9gzcNt0WPbm9YW/o3/6Ohz5Q+EQRWXY4ki7E0VOa3ih
         zlADQWbGO1MRIMuntMd2t1oJ3nCKqhVvV9UzkuTvg2U9ZFLGRt6JzRuPMLnxz6QZQAVo
         pw+E4euEQEmZsARCaLK2FFD/5onyAUdSvO8tiYYQbmWc01XdUKfl2AVYqeLXx7KNMnwq
         5XafNEeohqj1gEuftq0zHDxSDcRSiLc9Hhv+XGcCIozIA6mht61vKhcf6+GZIdZqNy/s
         yB1g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n81si199464wma.1.2019.04.08.09.14.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Apr 2019 09:14:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:55748 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hDWul-0006St-UY
	for alex.bennee@linaro.org; Mon, 08 Apr 2019 12:14:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56839)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1hDWub-0006Sj-74
	for qemu-arm@nongnu.org; Mon, 08 Apr 2019 12:14:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1hDWua-0005um-26
	for qemu-arm@nongnu.org; Mon, 08 Apr 2019 12:14:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:10066)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>)
	id 1hDWuZ-0005uF-Kj; Mon, 08 Apr 2019 12:14:19 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9D551316891D;
	Mon,  8 Apr 2019 16:14:18 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-121-29.rdu2.redhat.com
	[10.10.121.29])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 95B991001DDA;
	Mon,  8 Apr 2019 16:14:16 +0000 (UTC)
To: Xiang Zheng <zhengxiang9@huawei.com>, Markus Armbruster <armbru@redhat.com>
References: <20190325125142.11628-1-zhengxiang9@huawei.com>
	<CAFEAcA-O5+A0Q=14k2vrBg3KNM7MmqbcyhBoZZOe=AsyE-UDbw@mail.gmail.com>
	<19929558-9f2d-148a-4357-d48b46f8b62b@huawei.com>
	<87va06kvm6.fsf@dusky.pond.sub.org>
	<59f100b4-f6e9-973d-532b-58fb172a7009@redhat.com>
	<87imw5fv45.fsf@dusky.pond.sub.org>
	<abe1d9cd-85bb-2ef8-630f-af28cae6378c@redhat.com>
	<8736n9eb4s.fsf@dusky.pond.sub.org>
	<bf2decd3-b3cb-08eb-3449-b66f023b084a@huawei.com>
	<c57135ae-41a9-ed7b-976b-bf8fe43596a2@redhat.com>
	<b107e0c0-1c4c-3f0f-eb78-8929c315ce28@huawei.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <a8144a1f-364e-cea5-b0a7-05342bdab936@redhat.com>
Date: Mon, 8 Apr 2019 18:14:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <b107e0c0-1c4c-3f0f-eb78-8929c315ce28@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Mon, 08 Apr 2019 16:14:18 +0000 (UTC)
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Heyi Guo <guoheyi@huawei.com>,
	wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 30b69EUWp3j1

On 04/08/19 15:43, Xiang Zheng wrote:
> 
> On 2019/4/3 23:35, Laszlo Ersek wrote:
>>> I thought about your comments and wrote the following patch (just for test)
>>> which uses a file mapping to replace the anonymous mapping. UEFI seems to work
>>> fine. So why not use a file mapping to read or write a pflash device?
>> Honestly I can't answer "why not do this". Maybe we should.
>>
>> Regarding "why not do this *exactly as shown below*" -- probably because
>> then we'd have updates to the same underlying regular file via both
>> mmap() and write(), and the interactions between those are really tricky
>> (= best avoided).
>>
>> One of my favorite questions over the years used to be posting a matrix
>> of possible mmap() and file descriptor r/w/sync interactions, with the
>> outcomes as they were "implied" by POSIX, and then asking at the bottom,
>> "is my understanding correct?" I've never ever received an answer to
>> that. :)
> 
> In my opinion, it's feasible to r/w/sync the memory devices which use a block
> backend via mmap() and write().

Maybe. I think that would be a first in QEMU, and you'd likely have to
describe and follow a semi-formal model between fd actions and mmap()
actions.

Here's the (unconfirmed) table I referred to earlier.

+-------------+-----------------------------------------------------+
| change made | change visible via                                  |
| through     +-----------------+-------------+---------------------+
|             | MAP_SHARED      | MAP_PRIVATE | read()              |
+-------------+-----------------+-------------+---------------------+
| MAP_SHARED  | yes             | unspecified | depends on MS_SYNC, |
|             |                 |             | MS_ASYNC, or normal |
|             |                 |             | system activity     |
+-------------+-----------------+-------------+---------------------+
| MAP_PRIVATE | no              | no          | no                  |
+-------------+-----------------+-------------+---------------------+
| write()     | depends on      | unspecified | yes                 |
|             | MS_INVALIDATE,  |             |                     |
|             | or the system's |             |                     |
|             | read/write      |             |                     |
|             | consistency     |             |                     |
+-------------+-----------------+-------------+---------------------+

Presumably:

- a write() to some offset range of a regular file should be visible in
a MAP_SHARED mapping of that range after a matching msync(...,
MS_INVALIDATE) call;

- changes through a MAP_SHARED mapping to a regular file should be
visible via read() after a matching msync(..., MS_SYNC) call returns.

I sent this table first in 2010 to the Austin Group mailing list, and
received no comments. Then another person (on the same list) asked
basically the same questions in 2013, to which I responded with the
above assumptions / interpretations -- and received no comments from
third parties again.

But, I'm really out of my depth here -- we're not even discussing
generic read()/write()/mmap()/munmap()/msync() interactions, but how
they would fit into the qemu block layer. And I have no idea.

> 
>>
>> Also... although we don't really use them in practice, some QCOW2
>> features for pflash block backends are -- or would be -- nice. (Not the
>> internal snapshots or the live RAM dumps, of course.)
> 
> Regarding sparse files, can we read actual backend size data for the read-only
> pflash memory as the following steps shown?
> 
> 1) Create a sparse file -- QEMU_EFI-test.raw:
>    dd if=/dev/zero of=QEMU_EFI-test.raw bs=1M seek=64 count=0
> 
> 2) Read from QEMU_EFI.fd and write to QEMU_EFI-test.raw:
>    dd of="QEMU_EFI-test.raw" if="QEMU_EFI.fd" conv=notrunc
> 
> 3) Use QEMU_EFI-test.raw as the read-only pflash and start qemu with the below
> patch applied:
> 
> ---8>---
> 
> diff --git a/hw/block/block.c b/hw/block/block.c
> index bf56c76..ad18d5e 100644
> --- a/hw/block/block.c
> +++ b/hw/block/block.c
> @@ -30,7 +30,7 @@
>  bool blk_check_size_and_read_all(BlockBackend *blk, void *buf, hwaddr size,
>                                   Error **errp)
>  {
> -    int64_t blk_len;
> +    int64_t blk_len, actual_len;
>      int ret;
> 
>      blk_len = blk_getlength(blk);
> @@ -53,7 +53,9 @@ bool blk_check_size_and_read_all(BlockBackend *blk, void *buf, hwaddr size,
>       * block device and read only on demand.
>       */
>      assert(size <= BDRV_REQUEST_MAX_BYTES);
> -    ret = blk_pread(blk, 0, buf, size);
> +    actual_len = bdrv_get_allocated_file_size(blk_bs(blk));
> +    ret = blk_pread(blk, 0, buf,
> +            (!blk_is_read_only(blk) || actual_len < 0) ? size : actual_len);
>      if (ret < 0) {
>          error_setg_errno(errp, -ret, "can't read block backend");
>          return false;
> 

This hunk looks dubious for a general helper function. It seems to
assume that the holes are punched at the end of the file.

Sorry, this discussion is making me uncomfortable. I don't want to
ignore your questions, but I have no idea about the right answers. This
really needs the attention of the block people.

Laszlo
