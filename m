Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp4339846wrx;
        Mon, 8 Apr 2019 23:01:55 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzJDK1efCv2GMerDZ7d+7bT3Mjum9Sm71Z8Qc+RUVZgsF1VFW72dfAxIdyFYfF8b8MF5uHD
X-Received: by 2002:a1c:a103:: with SMTP id k3mr20344558wme.8.1554789715074;
        Mon, 08 Apr 2019 23:01:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554789715; cv=none;
        d=google.com; s=arc-20160816;
        b=s2ZJ04Z28/fBf63EKsKdYrKcixSpBkk14AAh+gGYnqlqijy91G8OcFCiETwdHPaefF
         G9yvIj/obe0vOb86fzW1mh6/G0Z+37aJGL7cgK2SKy7LLbRXbYOsWdk4soJU2lzixFXi
         bE5s3q0EHR/DMTGkWGXZyVO0lnRd3dPH9qdmfYPrX+6XBFe3do6Kxbwe7l0LUj+ozOZN
         YcTTJkyGGNPIpE6PC3yFxM8SHh0vl3Fg9roY1gtNk36eq9XIE9Cioet9ATPZHXv9XRai
         Rm+TOeWO1MgKHkUqA6ME3xgj5EQ36t2boFTgnBfLGMarz5+LVwGZZhbUouwL6dpYmko2
         9Liw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:date:references:to:from;
        bh=S3STw3cE1oXyLQslLJ12oVCa4dYWP3IVQeb9jmm9b84=;
        b=milHOdZag2pWr42uRZvtQqnFuk37SCTXBJVs/iJxKpFP7m4+3Xa/Tq7CMVz4iBzgeN
         VwVxkWSr4vQ++vC481jOaHF0wQcXUhV+gVhUiNsxcgicLgKaZF6Q2VQpxQ9x9xX9w2CE
         xbUXJR1b48PIXmmF70U3zb+TlxThKmDDRfnvnVGQHKszWYfBuxXU1YCq6YE6Ft4UovLO
         Pcd52s2IqmV5CUwYvRKZRV9nOvt4fXYpogUUbpAClb2hT1Ns/fuHMLPMFnhuQwDBVYWm
         Dofa9ca4GLqtpw3gPP2BSDJ+pkyF9LOofCW/6vVacTVNar59XNqapo6tPbGiEEcTUGA8
         x9pw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k13si20831499wrv.293.2019.04.08.23.01.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Apr 2019 23:01:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:35850 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hDjpS-00059q-47
	for alex.bennee@linaro.org; Tue, 09 Apr 2019 02:01:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40502)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hDjpC-00058U-0I
	for qemu-arm@nongnu.org; Tue, 09 Apr 2019 02:01:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hDjpA-0006OS-JT
	for qemu-arm@nongnu.org; Tue, 09 Apr 2019 02:01:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47788)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1hDjpA-0006Le-9e; Tue, 09 Apr 2019 02:01:36 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0988320276;
	Tue,  9 Apr 2019 06:01:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-116.ams2.redhat.com
	[10.36.116.116])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A5CA61090;
	Tue,  9 Apr 2019 06:01:28 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 127741138648; Tue,  9 Apr 2019 08:01:27 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
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
	<a8144a1f-364e-cea5-b0a7-05342bdab936@redhat.com>
Date: Tue, 09 Apr 2019 08:01:27 +0200
In-Reply-To: <a8144a1f-364e-cea5-b0a7-05342bdab936@redhat.com> (Laszlo Ersek's
	message of "Mon, 8 Apr 2019 18:14:15 +0200")
Message-ID: <87bm1fiuo8.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 09 Apr 2019 06:01:31 +0000 (UTC)
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
	qemu-block@nongnu.org, Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
	Xiang Zheng <zhengxiang9@huawei.com>, qemu-arm <qemu-arm@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Heyi Guo <guoheyi@huawei.com>, wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BA2NlM45e7U5

L=C3=A1szl=C3=B3's last sentence below is "This really needs the attention =
of the
block people."  Cc'ing some.

Laszlo Ersek <lersek@redhat.com> writes:

> On 04/08/19 15:43, Xiang Zheng wrote:
>>=20
>> On 2019/4/3 23:35, Laszlo Ersek wrote:
>>>> I thought about your comments and wrote the following patch (just for =
test)
>>>> which uses a file mapping to replace the anonymous mapping. UEFI seems=
 to work
>>>> fine. So why not use a file mapping to read or write a pflash device?
>>> Honestly I can't answer "why not do this". Maybe we should.
>>>
>>> Regarding "why not do this *exactly as shown below*" -- probably because
>>> then we'd have updates to the same underlying regular file via both
>>> mmap() and write(), and the interactions between those are really tricky
>>> (=3D best avoided).
>>>
>>> One of my favorite questions over the years used to be posting a matrix
>>> of possible mmap() and file descriptor r/w/sync interactions, with the
>>> outcomes as they were "implied" by POSIX, and then asking at the bottom,
>>> "is my understanding correct?" I've never ever received an answer to
>>> that. :)
>>=20
>> In my opinion, it's feasible to r/w/sync the memory devices which use a =
block
>> backend via mmap() and write().
>
> Maybe. I think that would be a first in QEMU, and you'd likely have to
> describe and follow a semi-formal model between fd actions and mmap()
> actions.
>
> Here's the (unconfirmed) table I referred to earlier.
>
> +-------------+-----------------------------------------------------+
> | change made | change visible via                                  |
> | through     +-----------------+-------------+---------------------+
> |             | MAP_SHARED      | MAP_PRIVATE | read()              |
> +-------------+-----------------+-------------+---------------------+
> | MAP_SHARED  | yes             | unspecified | depends on MS_SYNC, |
> |             |                 |             | MS_ASYNC, or normal |
> |             |                 |             | system activity     |
> +-------------+-----------------+-------------+---------------------+
> | MAP_PRIVATE | no              | no          | no                  |
> +-------------+-----------------+-------------+---------------------+
> | write()     | depends on      | unspecified | yes                 |
> |             | MS_INVALIDATE,  |             |                     |
> |             | or the system's |             |                     |
> |             | read/write      |             |                     |
> |             | consistency     |             |                     |
> +-------------+-----------------+-------------+---------------------+
>
> Presumably:
>
> - a write() to some offset range of a regular file should be visible in
> a MAP_SHARED mapping of that range after a matching msync(...,
> MS_INVALIDATE) call;
>
> - changes through a MAP_SHARED mapping to a regular file should be
> visible via read() after a matching msync(..., MS_SYNC) call returns.
>
> I sent this table first in 2010 to the Austin Group mailing list, and
> received no comments. Then another person (on the same list) asked
> basically the same questions in 2013, to which I responded with the
> above assumptions / interpretations -- and received no comments from
> third parties again.
>
> But, I'm really out of my depth here -- we're not even discussing
> generic read()/write()/mmap()/munmap()/msync() interactions, but how
> they would fit into the qemu block layer. And I have no idea.
>
>>=20
>>>
>>> Also... although we don't really use them in practice, some QCOW2
>>> features for pflash block backends are -- or would be -- nice. (Not the
>>> internal snapshots or the live RAM dumps, of course.)
>>=20
>> Regarding sparse files, can we read actual backend size data for the rea=
d-only
>> pflash memory as the following steps shown?
>>=20
>> 1) Create a sparse file -- QEMU_EFI-test.raw:
>>    dd if=3D/dev/zero of=3DQEMU_EFI-test.raw bs=3D1M seek=3D64 count=3D0
>>=20
>> 2) Read from QEMU_EFI.fd and write to QEMU_EFI-test.raw:
>>    dd of=3D"QEMU_EFI-test.raw" if=3D"QEMU_EFI.fd" conv=3Dnotrunc
>>=20
>> 3) Use QEMU_EFI-test.raw as the read-only pflash and start qemu with the=
 below
>> patch applied:
>>=20
>> ---8>---
>>=20
>> diff --git a/hw/block/block.c b/hw/block/block.c
>> index bf56c76..ad18d5e 100644
>> --- a/hw/block/block.c
>> +++ b/hw/block/block.c
>> @@ -30,7 +30,7 @@
>>  bool blk_check_size_and_read_all(BlockBackend *blk, void *buf, hwaddr s=
ize,
>>                                   Error **errp)
>>  {
>> -    int64_t blk_len;
>> +    int64_t blk_len, actual_len;
>>      int ret;
>>=20
>>      blk_len =3D blk_getlength(blk);
>> @@ -53,7 +53,9 @@ bool blk_check_size_and_read_all(BlockBackend *blk, vo=
id *buf, hwaddr size,
>>       * block device and read only on demand.
>>       */
>>      assert(size <=3D BDRV_REQUEST_MAX_BYTES);
>> -    ret =3D blk_pread(blk, 0, buf, size);
>> +    actual_len =3D bdrv_get_allocated_file_size(blk_bs(blk));
>> +    ret =3D blk_pread(blk, 0, buf,
>> +            (!blk_is_read_only(blk) || actual_len < 0) ? size : actual_=
len);
>>      if (ret < 0) {
>>          error_setg_errno(errp, -ret, "can't read block backend");
>>          return false;
>>=20
>
> This hunk looks dubious for a general helper function. It seems to
> assume that the holes are punched at the end of the file.
>
> Sorry, this discussion is making me uncomfortable. I don't want to
> ignore your questions, but I have no idea about the right answers. This
> really needs the attention of the block people.
