Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp4717403wrx;
        Mon, 25 Mar 2019 23:23:49 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy13n0gxYAGWkwJ1rkJX6LmnwHjRXj5+MTVrFG4FGDnAiXj2+vN9+mAbI/xMq7Q/orn/DQX
X-Received: by 2002:a25:24cc:: with SMTP id k195mr24758523ybk.285.1553581429580;
        Mon, 25 Mar 2019 23:23:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553581429; cv=none;
        d=google.com; s=arc-20160816;
        b=hk+6E5dKgEyce4LmQf/ye9U1ZOjwUZQXRGUIVs91aUPor6Y9qWAmtaDO7tM4ho1D3F
         2ZQyPMY8vgYmSDeDgaO5a+mc+W6SqAfSzRKmyWGJSD7PRKBhwXBIsDa8wJeViRt4wURP
         dDAuyyoqu9tbDDTNw09MAzjIDSN1d5hgg7jR4QXyLBUxWVT4dPkXlVoNv0mYS9kUevxk
         MkpdVk31OR63/IhtPs9hu1V053CyHG7oP8z9tszsr/t8B5hETNw994C8EGjvwy1u27ds
         /mGSkPAauM49zstxEdWCBP4vOIUaBTMlcb0NWpB33RihAD66ew+5P8hGEgvosOkef+uQ
         l3tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :message-id:in-reply-to:date:references:to:from;
        bh=KfDhLSsJvKEbcmpkKsq2h4xwloOdwwdV/V0GxMxmCEQ=;
        b=dZ/OE5EhFvjgx8nQ7cEcSCSRiOjUdGzDxxgmwMh2JHH317K93Mocd5h79VkVbP2EpN
         0en3z+9rfNrxSI+5Sc7jbfXFQWylaUDA+/Rm54HRL3OrusAjALegce2p2IJmSLByvENL
         /pWPLW+0RFtuihJli7qKOU3GDwAAxMnaAwZfpuiqPBoetEJYmxCsaFfu9thRAumICoDp
         249uIWWOjHLT6tHCfBpqRDupx6u3v3oomfgwHSAi7+edt/CgZG5L4WGw6rQr3cQww/Va
         MbflRjLlUE6tk+OJuOXNZb8+b7DRTjMaqXtO2WAJ0Gu23ikZFnYyXat44pvdm2pNcvMp
         INuA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 9si10433176ybb.164.2019.03.25.23.23.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Mar 2019 23:23:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:53485 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h8fUz-0007ds-1E
	for alex.bennee@linaro.org; Tue, 26 Mar 2019 02:23:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34606)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1h8fUX-0007Hp-T6
	for qemu-arm@nongnu.org; Tue, 26 Mar 2019 02:23:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1h8fOo-0004DQ-Cu
	for qemu-arm@nongnu.org; Tue, 26 Mar 2019 02:17:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47000)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1h8fOo-0004B2-2O; Tue, 26 Mar 2019 02:17:26 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 40C21307B964;
	Tue, 26 Mar 2019 06:17:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-116.ams2.redhat.com
	[10.36.116.116])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B7EFB5C232;
	Tue, 26 Mar 2019 06:17:22 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 3DB591138648; Tue, 26 Mar 2019 07:17:21 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Zheng Xiang <zhengxiang9@huawei.com>
References: <20190325125142.11628-1-zhengxiang9@huawei.com>
	<CAFEAcA-O5+A0Q=14k2vrBg3KNM7MmqbcyhBoZZOe=AsyE-UDbw@mail.gmail.com>
	<19929558-9f2d-148a-4357-d48b46f8b62b@huawei.com>
Date: Tue, 26 Mar 2019 07:17:21 +0100
In-Reply-To: <19929558-9f2d-148a-4357-d48b46f8b62b@huawei.com> (Zheng Xiang's
	message of "Mon, 25 Mar 2019 22:03:03 +0800")
Message-ID: <87va06kvm6.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Tue, 26 Mar 2019 06:17:23 +0000 (UTC)
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
	wanghaibin.wang@huawei.com, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qqcnKfGalwXc

Zheng Xiang <zhengxiang9@huawei.com> writes:

> Hi Peter,
>
> Thanks for your reply!
>
> On 2019/3/25 21:11, Peter Maydell wrote:
>> On Mon, 25 Mar 2019 at 12:53, Xiang Zheng <zhengxiang9@huawei.com> wrote:
>>>
>>> Currently we fill the VIRT_FLASH space with two 64MB NOR images when
>>> using persistent UEFI variables on QEMU. Actually we only use a very
>>> small part of the memory while the rest significant large part of
>>> memory is wasted.
>>>
>>> This patch creates and maps a variable size of flash device instead of
>>> a mandatory 64MB one to save memory.
>>>
>>> Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>
>>> ---
>>>
>>> This patch might be insufficient since it also needs to modify the flash size
>>> in ACPI and DTB.
>>>
>>> BTW, I don't understand why it requires the two NOR images to be exactly 64MB
>>> in size when using -pflash.
>> 
>> I don't think we should do this. The board should in general
>> create the same hardware visible to the guest, not change
>> it based on subtle things like the size of the image files.

Concur.

>> The reason why the flash images must be 64MB in size
>> when using -pflash is that they are the backing store
>> for a writable device. Suppose you have 1MB of data in your
>> backing image that you pass to QEMU and then the guest writes
>> to the last block of the flash device. The new data
>> written by the guest to the end of the device has to be
>> stored somewhere, so the file has to be large enough
>> to cover the whole of the flash area.
>> 
>
> Is there any way to support config or limit the size that both
> guest and QEMU are visible?
>
> The original QEMU_EFI.fd has only 2M, but we need to stuff it
> to 64M with 62M unused data. It will consume a large amount of
> memory when running multiple VM simultaneously.

Here's a number of ideas.

The first one is of course making the flash memory size configurable, to
eliminate the "unused" part.  Our PC machines use the backing image
sizes as configuration.  I consider that a bad idea that should not be
allowed to spread to other machines.  Peter seems to agree.

The accepted way to create minor variations of a machine type is machine
properties.  Whether using them to vary flash chip size would be
acceptable is for the board maintainer to decide.

Now let's think about mapping these flash images more efficiently.

We could avoid backing their "unused" part with pages.  Unless the
"unused" part is read-only, this leaves you at your guests' mercy: they
can make the host allocate pages by writing to them.

We could share the pflash memory among VMs running the same firmware.
If writes are permitted, we'd have to unshare on write (COW).  Again,
you're at your guests' mercy unless read-only: they can make the host
unshare pages by writing to them.

I figure the "share" idea would be easier to implement[*].

Both ideas require either trusted guests or read-only flash.  EFI
generally wants some read/write flash for its var store.  Can we make
everything else read-only?

We can improve the device models to let us set up a suitable part of the
pflash memory read-only.  This is how real hardware works.  Our PC
machines currently approximate this with *two* flash chips, one
read-only, one read/write, which I consider a mistake that should not be
allowed to spread to other machines.

Prior discussions

    Message-ID: <87imxfssq1.fsf@dusky.pond.sub.org>
    https://lists.nongnu.org/archive/html/qemu-devel/2019-02/msg05056.html

and

    Message-ID: <87y378n5iy.fsf@dusky.pond.sub.org>
    https://lists.nongnu.org/archive/html/qemu-devel/2019-01/msg06606.html



[*] If you run KSM (kernel same-page merging), the kernel should set up
the sharing for you automatically.  But not everybody wants to run KSM.
