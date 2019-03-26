Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp5306204wrx;
        Tue, 26 Mar 2019 09:39:47 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwDMQhT7ZLZpEl8CWzFfsHQ54eB2OU8ZiGnsCZZs1b+W3NfFIx5Nj0PQ5cW/l3gPXdVmv3i
X-Received: by 2002:a24:2509:: with SMTP id g9mr923752itg.149.1553618387256;
        Tue, 26 Mar 2019 09:39:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553618387; cv=none;
        d=google.com; s=arc-20160816;
        b=EExP4L1RQsIeQxcv6xQGVfTs9nHc0TbLUtunohlDqU4OLcV0M06oqCBjM1loMjNQOt
         1fOSPYbjFuc4Y8gUnqbMorwP8n0kQ1kZ3zxgAcqnxUs7Syz0x5Jqh47qUHDdrCrPYFgA
         4W9url0l93WGHDGsfaa792tLENyQu+dnvzpNP4QdsSB9AoO3imuYN1bmYHKn4BZhdgoO
         u7cJj50HT3yKaYIYfl0FXUe+R+VxB5nXFbt1l99R39LzeIzN4sIudMr1EGqgNTRr/9qr
         qljEdhnbQSraJqvQ2mwYLblkH0iDsLW51FRyxLMXcH42HIAUQKUTgZuXQlfCXZahKrT5
         tQ1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :message-id:in-reply-to:date:references:to:from;
        bh=5eAo/1iEtTlDUheTM8IHGcXFGJjJj5rf9ZLwiPJa3QU=;
        b=SNaMLbO4fyO8+k1ia1NnCcbavxA9mVeXQuqKC/WSr7wFpI+fnc1jgOVEU40iqlZJAS
         9YVXF53pYs1g03/tsvz0W+qecot4OVDni1Pb+tdV/1GdG4D2UWCtG1c51P4RTQOTDozE
         TscbaDBF5c1fjQh6Ij/Zr4XDLCS+jPH3xiI8JR8DaiPyY5ftNv1ULhKg/2C8D9OqktrU
         TWqaGVLbgKVJMsJ7QVqtmV6qzGEjDUPZO7vHk64z2O2IK2e5HYhS1Lfm+HS8o3Wud7b8
         SKW9cg9Bt6hhu1XQtAWCCEumPFGDM30BNA99Tr7V0HVHNJK32Isdl7NRzmigw7kpFGZ8
         ey3A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h7si8930304ioq.52.2019.03.26.09.39.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Mar 2019 09:39:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:34907 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h8p74-00032G-Hi
	for alex.bennee@linaro.org; Tue, 26 Mar 2019 12:39:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34573)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1h8p6s-00031p-9K
	for qemu-arm@nongnu.org; Tue, 26 Mar 2019 12:39:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1h8p6p-0004jY-Lf
	for qemu-arm@nongnu.org; Tue, 26 Mar 2019 12:39:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60668)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1h8p6p-0004gF-C5; Tue, 26 Mar 2019 12:39:31 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 62C5658E22;
	Tue, 26 Mar 2019 16:39:24 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-116.ams2.redhat.com
	[10.36.116.116])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B562360141;
	Tue, 26 Mar 2019 16:39:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 3AA6E1138648; Tue, 26 Mar 2019 17:39:22 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
References: <20190325125142.11628-1-zhengxiang9@huawei.com>
	<CAFEAcA-O5+A0Q=14k2vrBg3KNM7MmqbcyhBoZZOe=AsyE-UDbw@mail.gmail.com>
	<19929558-9f2d-148a-4357-d48b46f8b62b@huawei.com>
	<87va06kvm6.fsf@dusky.pond.sub.org>
	<59f100b4-f6e9-973d-532b-58fb172a7009@redhat.com>
Date: Tue, 26 Mar 2019 17:39:22 +0100
In-Reply-To: <59f100b4-f6e9-973d-532b-58fb172a7009@redhat.com> (Laszlo Ersek's
	message of "Tue, 26 Mar 2019 12:03:19 +0100")
Message-ID: <87imw5fv45.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 26 Mar 2019 16:39:24 +0000 (UTC)
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
	Markus Armbruster <armbru@redhat.com>,
	Zheng Xiang <zhengxiang9@huawei.com>,
	qemu-arm <qemu-arm@nongnu.org>, Heyi Guo <guoheyi@huawei.com>,
	wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xG4VN+Qw4W9l

Laszlo Ersek <lersek@redhat.com> writes:

> On 03/26/19 07:17, Markus Armbruster wrote:
>> Zheng Xiang <zhengxiang9@huawei.com> writes:
>> 
>>> Hi Peter,
>>>
>>> Thanks for your reply!
>>>
>>> On 2019/3/25 21:11, Peter Maydell wrote:
>>>> On Mon, 25 Mar 2019 at 12:53, Xiang Zheng <zhengxiang9@huawei.com> wrote:
>>>>>
>>>>> Currently we fill the VIRT_FLASH space with two 64MB NOR images when
>>>>> using persistent UEFI variables on QEMU. Actually we only use a very
>>>>> small part of the memory while the rest significant large part of
>>>>> memory is wasted.
>>>>>
>>>>> This patch creates and maps a variable size of flash device instead of
>>>>> a mandatory 64MB one to save memory.
>>>>>
>>>>> Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>
>>>>> ---
>>>>>
>>>>> This patch might be insufficient since it also needs to modify the flash size
>>>>> in ACPI and DTB.
>>>>>
>>>>> BTW, I don't understand why it requires the two NOR images to be exactly 64MB
>>>>> in size when using -pflash.
>>>>
>>>> I don't think we should do this. The board should in general
>>>> create the same hardware visible to the guest, not change
>>>> it based on subtle things like the size of the image files.
>> 
>> Concur.
>> 
>>>> The reason why the flash images must be 64MB in size
>>>> when using -pflash is that they are the backing store
>>>> for a writable device. Suppose you have 1MB of data in your
>>>> backing image that you pass to QEMU and then the guest writes
>>>> to the last block of the flash device. The new data
>>>> written by the guest to the end of the device has to be
>>>> stored somewhere, so the file has to be large enough
>>>> to cover the whole of the flash area.
>>>>
>>>
>>> Is there any way to support config or limit the size that both
>>> guest and QEMU are visible?
>>>
>>> The original QEMU_EFI.fd has only 2M, but we need to stuff it
>>> to 64M with 62M unused data. It will consume a large amount of
>>> memory when running multiple VM simultaneously.
>> 
>> Here's a number of ideas.
>> 
>> The first one is of course making the flash memory size configurable, to
>> eliminate the "unused" part.  Our PC machines use the backing image
>> sizes as configuration.  I consider that a bad idea that should not be
>> allowed to spread to other machines.  Peter seems to agree.
>
> For the full picture, we have to realize that flash size is a trade-off
> for virtual machines too, not just for physical machines. UEFI firmware
> tends to grow like an OS -- whether that's good or bad belongs on
> another page :) --, and so you tend to need more and more space for it,
> even after Link Time Optimization, and image compression, over time.

Same for physical and virtual machines.

> So you are left with a choice.
>
> * You can let board logic size the flash dynamically at startup (and
> then call it a "bad idea" :) ).
>
> * Alternatively, you can hardcode the pflash size in the board setup,
> perhaps depdent on machine type version, and/or dependent on some
> properties.

The difference between getting flash memory size from the backend
vs. getting it from a machine type or property is implicit vs. explicit
configuration.

Implicit vs. explicit can have ramifications beyond the user interface.
For instance, if we ever get around to transferring device configuration
in the migration stream, the machine property would surely be part of
that, but the size of the backend won't.

>             Even assuming that this diversity doesn't break migration at
> once,

I doubt explicit could break anything that implicit couldn't :)

>       you'll create a dependency between firmware releases (sizes) and
> machine types. 'For the next release of ArmVirtQemu/edk2, you'll need
> "virt-4.1" or later'.

Yes if you tie the size to the machine type.  No if you get it from a
machine property.

> In addition, in most cases, the firmware, when it runs from flash,
> cannot dynamically adapt itself to random flash sizes and/or base
> addresses, so not only will new (larger) firmware not fit on old machine
> types, but old (small) firmware may also not feel "at home" on new
> machine types. (Note: this is not a theoretical limitation, but it is a
> *very* practical one.)

The exact same problem exists for physical machines.  You can revise
your firmware only within limits set by the board.

I don't mean to say this problem isn't worth avoiding for virtual
machines.  Only that it is neither new nor intractable.

> That's a kind of mapping that is taken for "obvious" in the physical
> world (you get the board, your firmware comes with it, that's why it's
> called *firm*), but it used to be frowned upon in the virtual world.

I'm willing to give developers of virtual firmware more flexibility than
they get in the physical world.  I just happen to dislike "implicit" and
"any multiple of 4KiB up to a limit" (because physical flash chips with
sizes like 64140KiB do not exist, and virtual ones should not).

> * Or else, you pad the pflash chips as broadly as you dare, in order to
> never run into the above mess -- and then someone complains "it consumes
> too many resources". :)

I think that complaint would be exactly as valid for unpadded firmware!
Once you get to the point where you care whether each guest's firmware
eats up 2MiB or 64MiB, what you *really* want is probably 128KiB per
guest plust $whatever shared among all guests.  You probably won't care
all that much whether $whatever is 2MiB - 128KiB or 64MiB - 128KiB.

> For some perspective, OVMF started out with a 1MB cumulative size
> (executable + varstore). We ran out of 1MB with executable code, so we
> introduced the 2MB build (with unchanged varstore size). Then, under
> Microsoft's SVVP checks, the varstore size proved insufficient, and we
> introduced the 4MB buid, with enough space in both the executable part
> and the varstore part for them to last for "the foreseeable future".
> And, the dynamic logic in the PC board code allows up to a 8MB
> cumulative size (and that's also not a machine type property, but a cold
> hard constant).
>
> With the dynamic sizing in QEMU (which, IIRC, I had originally
> introduced still in the 1MB times, due to the split between the
> executable and varstore parts), both the 1MB->2MB switch, and the
> 2MB->4MB switch in the firmware caused zero pain in QEMU. And right now,
> 4MB looks like a "sweet spot", with some elbow room left.

Explicit configuration would've been exactly as painless.  Even with
pflash sizes restricted to powers of two.

> The "virt" board took a different approach, with different benefits (no
> dynamic sizing at startup, hence identical guest view) and different
> problems (it's more hungry for resources). "Pick your poison."

Here's the one I'd like to be able to pick: have a single pflash chip
with a read-only part and a read/write part.  Map the read-only part so
it is shared among guests.  Map the read/write part normally.  Default
the sizes to something that makes sense now, with reasonable elbow room.
Make sure there's a way to grow.

> A hopefully more constructive comment below:
>
>> The accepted way to create minor variations of a machine type is machine
>> properties.  Whether using them to vary flash chip size would be
>> acceptable is for the board maintainer to decide.
>> 
>> Now let's think about mapping these flash images more efficiently.
>> 
>> We could avoid backing their "unused" part with pages.  Unless the
>> "unused" part is read-only, this leaves you at your guests' mercy: they
>> can make the host allocate pages by writing to them.
>
> First, the flash backends' on-disk demand shouldn't be catastrophic,
> even if we use "raw" -- the executable should be shared between all VMs
> running on the host, and the varstore files (which must be private to
> VMs) could be created as sparse files. For example, libvirt could be
> improved to create sparse copies of the varstore *template* files.

Same story as in memory, really: share the read-only part (i.e. the
executable) among the guests, keep the read/write part small.

> Second, regarding physical RAM consumption: disable memory overcommit,
> and set a large swap. The unused parts of the large pflash chips should
> be swapped out at some point (after their initial population from disk),
> and should never be swapped back in again.

Just providing swap should do the trick, shouldn't it?

> Thanks
> Laszlo
>
>> 
>> We could share the pflash memory among VMs running the same firmware.
>> If writes are permitted, we'd have to unshare on write (COW).  Again,
>> you're at your guests' mercy unless read-only: they can make the host
>> unshare pages by writing to them.
>> 
>> I figure the "share" idea would be easier to implement[*].
>> 
>> Both ideas require either trusted guests or read-only flash.  EFI
>> generally wants some read/write flash for its var store.  Can we make
>> everything else read-only?
>> 
>> We can improve the device models to let us set up a suitable part of the
>> pflash memory read-only.  This is how real hardware works.  Our PC
>> machines currently approximate this with *two* flash chips, one
>> read-only, one read/write, which I consider a mistake that should not be
>> allowed to spread to other machines.
>> 
>> Prior discussions
>> 
>>     Message-ID: <87imxfssq1.fsf@dusky.pond.sub.org>
>>     https://lists.nongnu.org/archive/html/qemu-devel/2019-02/msg05056.html
>> 
>> and
>> 
>>     Message-ID: <87y378n5iy.fsf@dusky.pond.sub.org>
>>     https://lists.nongnu.org/archive/html/qemu-devel/2019-01/msg06606.html
>> 
>> 
>> 
>> [*] If you run KSM (kernel same-page merging), the kernel should set up
>> the sharing for you automatically.  But not everybody wants to run KSM.
>> 
