Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp4941491wrx;
        Tue, 26 Mar 2019 04:04:11 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzRPGuhAy2kXfIz6XFkcrINyrhSrUBCV2gphzOggyTrA3t11l4I9ZgFjqc2XfWGfqbutquw
X-Received: by 2002:a25:2d62:: with SMTP id s34mr25239125ybe.390.1553598251817;
        Tue, 26 Mar 2019 04:04:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553598251; cv=none;
        d=google.com; s=arc-20160816;
        b=XxlkJ0Dy/9fsILfv8Y602AqiPH8Fpi/OOWG0yheqayAG5bkWTMFR5v/nOHd1JR7vzj
         GfClYOXY1Vj08nSjuY/cltzbdOX4di0rAebBlthN9TjaelIEyUyXHhiniYAAeO29h9vQ
         RgSYwgTnWoTFtiqL3BBBmnzH4EGyJIAokAlHqklm89s/kZvjMDejiR07wSusQ/QEcKit
         8UVExIS1jqKHTUq7E2hAcqTaiLKjmgz89M+OH2W1pqOhty9rGRAytI1qLvbtfHwUOy3B
         qTwon57X1R11A869CDfUZvH2NPO/ozzHeRElSa59e4d6lSrWaHHIquhtUv4o3CrXIV+l
         LnGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=6LwfKiFW4pDEgu48C4OVfQG2gZnpDWw3n5ZA3KGGa68=;
        b=Ll3jzjtywSpykmwr65C/sKKnMTxBufFVmHJ5DLO5gA3F1nSueZ38OkB3PLZ4CHTsle
         a1tphW4lcSnlJhfALggFOGnz8YhRYNsUXNZGw3NiPXtL9obXUoDstU1+/k8BwrxE7Rc2
         kR+9d3rN/wcjfb6CM+69MER8Y0P/eFPy4KuBFPix8wC/IHe2wiS8OswsXBfR9azia/w/
         6EvlBmqV21+AjA+rUmvpPtzcZpWcEv4OJfR9mvBTFivkG6C/GbQMoab616qazGlZIBtA
         Zdm4jRYufMAwtWyEW8qBUm8gn4b/l74TIYVP2juXfL8YNOzr9p1YU7EevbKkAPC8uY7w
         mE9w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n11si10742069ybb.79.2019.03.26.04.04.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Mar 2019 04:04:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:57119 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h8jsJ-00026c-7t
	for alex.bennee@linaro.org; Tue, 26 Mar 2019 07:04:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41782)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1h8jrk-0001wU-E5
	for qemu-arm@nongnu.org; Tue, 26 Mar 2019 07:03:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1h8jre-00053n-1q
	for qemu-arm@nongnu.org; Tue, 26 Mar 2019 07:03:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42682)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>)
	id 1h8jrd-00050s-IX; Tue, 26 Mar 2019 07:03:29 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 60D6CC01DE89;
	Tue, 26 Mar 2019 11:03:22 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-120-132.rdu2.redhat.com
	[10.10.120.132])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 319881A8EC;
	Tue, 26 Mar 2019 11:03:19 +0000 (UTC)
To: Markus Armbruster <armbru@redhat.com>, Zheng Xiang <zhengxiang9@huawei.com>
References: <20190325125142.11628-1-zhengxiang9@huawei.com>
	<CAFEAcA-O5+A0Q=14k2vrBg3KNM7MmqbcyhBoZZOe=AsyE-UDbw@mail.gmail.com>
	<19929558-9f2d-148a-4357-d48b46f8b62b@huawei.com>
	<87va06kvm6.fsf@dusky.pond.sub.org>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <59f100b4-f6e9-973d-532b-58fb172a7009@redhat.com>
Date: Tue, 26 Mar 2019 12:03:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <87va06kvm6.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Tue, 26 Mar 2019 11:03:22 +0000 (UTC)
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
X-TUID: XbwynWU4nyBg

On 03/26/19 07:17, Markus Armbruster wrote:
> Zheng Xiang <zhengxiang9@huawei.com> writes:
> 
>> Hi Peter,
>>
>> Thanks for your reply!
>>
>> On 2019/3/25 21:11, Peter Maydell wrote:
>>> On Mon, 25 Mar 2019 at 12:53, Xiang Zheng <zhengxiang9@huawei.com> wrote:
>>>>
>>>> Currently we fill the VIRT_FLASH space with two 64MB NOR images when
>>>> using persistent UEFI variables on QEMU. Actually we only use a very
>>>> small part of the memory while the rest significant large part of
>>>> memory is wasted.
>>>>
>>>> This patch creates and maps a variable size of flash device instead of
>>>> a mandatory 64MB one to save memory.
>>>>
>>>> Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>
>>>> ---
>>>>
>>>> This patch might be insufficient since it also needs to modify the flash size
>>>> in ACPI and DTB.
>>>>
>>>> BTW, I don't understand why it requires the two NOR images to be exactly 64MB
>>>> in size when using -pflash.
>>>
>>> I don't think we should do this. The board should in general
>>> create the same hardware visible to the guest, not change
>>> it based on subtle things like the size of the image files.
> 
> Concur.
> 
>>> The reason why the flash images must be 64MB in size
>>> when using -pflash is that they are the backing store
>>> for a writable device. Suppose you have 1MB of data in your
>>> backing image that you pass to QEMU and then the guest writes
>>> to the last block of the flash device. The new data
>>> written by the guest to the end of the device has to be
>>> stored somewhere, so the file has to be large enough
>>> to cover the whole of the flash area.
>>>
>>
>> Is there any way to support config or limit the size that both
>> guest and QEMU are visible?
>>
>> The original QEMU_EFI.fd has only 2M, but we need to stuff it
>> to 64M with 62M unused data. It will consume a large amount of
>> memory when running multiple VM simultaneously.
> 
> Here's a number of ideas.
> 
> The first one is of course making the flash memory size configurable, to
> eliminate the "unused" part.  Our PC machines use the backing image
> sizes as configuration.  I consider that a bad idea that should not be
> allowed to spread to other machines.  Peter seems to agree.

For the full picture, we have to realize that flash size is a trade-off
for virtual machines too, not just for physical machines. UEFI firmware
tends to grow like an OS -- whether that's good or bad belongs on
another page :) --, and so you tend to need more and more space for it,
even after Link Time Optimization, and image compression, over time.

So you are left with a choice.

* You can let board logic size the flash dynamically at startup (and
then call it a "bad idea" :) ).

* Alternatively, you can hardcode the pflash size in the board setup,
perhaps depdent on machine type version, and/or dependent on some
properties. Even assuming that this diversity doesn't break migration at
once, you'll create a dependency between firmware releases (sizes) and
machine types. 'For the next release of ArmVirtQemu/edk2, you'll need
"virt-4.1" or later'.

In addition, in most cases, the firmware, when it runs from flash,
cannot dynamically adapt itself to random flash sizes and/or base
addresses, so not only will new (larger) firmware not fit on old machine
types, but old (small) firmware may also not feel "at home" on new
machine types. (Note: this is not a theoretical limitation, but it is a
*very* practical one.)

That's a kind of mapping that is taken for "obvious" in the physical
world (you get the board, your firmware comes with it, that's why it's
called *firm*), but it used to be frowned upon in the virtual world.

* Or else, you pad the pflash chips as broadly as you dare, in order to
never run into the above mess -- and then someone complains "it consumes
too many resources". :)


For some perspective, OVMF started out with a 1MB cumulative size
(executable + varstore). We ran out of 1MB with executable code, so we
introduced the 2MB build (with unchanged varstore size). Then, under
Microsoft's SVVP checks, the varstore size proved insufficient, and we
introduced the 4MB buid, with enough space in both the executable part
and the varstore part for them to last for "the foreseeable future".
And, the dynamic logic in the PC board code allows up to a 8MB
cumulative size (and that's also not a machine type property, but a cold
hard constant).

With the dynamic sizing in QEMU (which, IIRC, I had originally
introduced still in the 1MB times, due to the split between the
executable and varstore parts), both the 1MB->2MB switch, and the
2MB->4MB switch in the firmware caused zero pain in QEMU. And right now,
4MB looks like a "sweet spot", with some elbow room left.

The "virt" board took a different approach, with different benefits (no
dynamic sizing at startup, hence identical guest view) and different
problems (it's more hungry for resources). "Pick your poison."


A hopefully more constructive comment below:

> The accepted way to create minor variations of a machine type is machine
> properties.  Whether using them to vary flash chip size would be
> acceptable is for the board maintainer to decide.
> 
> Now let's think about mapping these flash images more efficiently.
> 
> We could avoid backing their "unused" part with pages.  Unless the
> "unused" part is read-only, this leaves you at your guests' mercy: they
> can make the host allocate pages by writing to them.

First, the flash backends' on-disk demand shouldn't be catastrophic,
even if we use "raw" -- the executable should be shared between all VMs
running on the host, and the varstore files (which must be private to
VMs) could be created as sparse files. For example, libvirt could be
improved to create sparse copies of the varstore *template* files.

Second, regarding physical RAM consumption: disable memory overcommit,
and set a large swap. The unused parts of the large pflash chips should
be swapped out at some point (after their initial population from disk),
and should never be swapped back in again.

Thanks
Laszlo

> 
> We could share the pflash memory among VMs running the same firmware.
> If writes are permitted, we'd have to unshare on write (COW).  Again,
> you're at your guests' mercy unless read-only: they can make the host
> unshare pages by writing to them.
> 
> I figure the "share" idea would be easier to implement[*].
> 
> Both ideas require either trusted guests or read-only flash.  EFI
> generally wants some read/write flash for its var store.  Can we make
> everything else read-only?
> 
> We can improve the device models to let us set up a suitable part of the
> pflash memory read-only.  This is how real hardware works.  Our PC
> machines currently approximate this with *two* flash chips, one
> read-only, one read/write, which I consider a mistake that should not be
> allowed to spread to other machines.
> 
> Prior discussions
> 
>     Message-ID: <87imxfssq1.fsf@dusky.pond.sub.org>
>     https://lists.nongnu.org/archive/html/qemu-devel/2019-02/msg05056.html
> 
> and
> 
>     Message-ID: <87y378n5iy.fsf@dusky.pond.sub.org>
>     https://lists.nongnu.org/archive/html/qemu-devel/2019-01/msg06606.html
> 
> 
> 
> [*] If you run KSM (kernel same-page merging), the kernel should set up
> the sharing for you automatically.  But not everybody wants to run KSM.
> 

