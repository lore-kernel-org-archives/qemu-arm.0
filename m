Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp832270wrt;
        Thu, 3 Jan 2019 08:53:13 -0800 (PST)
X-Google-Smtp-Source: AFSGD/W1jf4e1X+qUWiO+fj7nqxj2VwjYHMmxkcujI/cYMo3WFc1Dw5J1jlNP8nDo5Utdc6T1QLu
X-Received: by 2002:aed:38c6:: with SMTP id k64mr44237099qte.97.1546534393229;
        Thu, 03 Jan 2019 08:53:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546534393; cv=none;
        d=google.com; s=arc-20160816;
        b=N5fAO6+gKHIimHmrvHMZY3uYMHiAZurlG8PLZBDUMgzgMaDGewgGTV0TR/U1Y/OFv1
         n8hTEdyA1dZ4c1qj3TKYOjKIRmUCoFY1lhmU21QIPzq3oySQ3y1+/xbNKI1kVP9dO7hx
         CL5TEDfVk+ZtDvzmPKSvPQjnJXpKZxMHuAWfLSq9fqZyqGdfB9vHwCKm2gBwH+abqhao
         TWkiqoul7yJEDHbXrRLEcBmZp9zncgxKLRfO5QVpTeou2mtR0oAvEAOS/IczUT4PdPph
         czg8nq5P8JLwNptQHxrzgtXeBGi4lj52GPMasEOQZEt5aTFQdDqbghLwAMIIhipc7QA9
         jw3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature;
        bh=7NpGySoEhGoeoRllbzqpiwewiGN8uE2pvsTCT9m1jhA=;
        b=UILEJIDz0XUsRyTqycXfGLyPvYdaBw87ZN1lyd1B9BDOzxR38G8BY+m57kQikIJDr1
         ssifGRI8YiJvTWFze+lT2VnXqrH9lx3QONaV3M6OSFj/HYWEG59FPpHAveMKx0ghZOAx
         ySsUDTA/PD4REPJ0s6uBRXLwrBUY/fmMq5h/FrP1ZVxmG1v5wIklpBtLqlmEwi/vydro
         8kfLbCRdkibFAUDxR3eJ9J6Z1Xl+requf6yA1jPPYZAC+7F7Nv0wg7wEb4S/5Mzx6kpE
         M58Ze4fnSqs58faIEQaTWHlLf/ZMo3pasBxxLigN2zMr1uVpCCOebe/zuUXOP6Bmmaus
         6FeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=af7+GgJw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id w23si3150928qth.63.2019.01.03.08.53.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Jan 2019 08:53:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=af7+GgJw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:56110 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gf6F6-0003pz-Qc
	for alex.bennee@linaro.org; Thu, 03 Jan 2019 11:53:12 -0500
Received: from eggs.gnu.org ([208.118.235.92]:60656)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <nicholas.a.hudson@gmail.com>) id 1gf6CH-0000x6-2M
	for qemu-arm@nongnu.org; Thu, 03 Jan 2019 11:50:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <nicholas.a.hudson@gmail.com>) id 1gf6CF-0004PQ-2H
	for qemu-arm@nongnu.org; Thu, 03 Jan 2019 11:50:16 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:35724)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <nicholas.a.hudson@gmail.com>)
	id 1gf6CE-0004Mf-OL; Thu, 03 Jan 2019 11:50:14 -0500
Received: by mail-wm1-x343.google.com with SMTP id t200so18951299wmt.0;
	Thu, 03 Jan 2019 08:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=7NpGySoEhGoeoRllbzqpiwewiGN8uE2pvsTCT9m1jhA=;
	b=af7+GgJw0+cAxlUbjWr0QRqmpIWYiJcRepNPXRgctPW9Rsfskxs/hfnjcVyK9XUC/b
	2LgdcUu2dzq+aPCHcxMZwNe00J2JXgm85Wl85stTHob7Hi8fUGYF0A+PfhGylcjJPcMe
	mwgj105QnRJxtnH5BUw6gyo5Wzbil7fLGbt/I1MokPPNFQl6jcEXaftMoI2tEw2PBZFm
	nFWBhRHrZWdW8UcXmpIiVK1Uz/Lq1zEVa4YDObrY2xmJxUIHw8qeKny1JCm+EpIRGHVU
	o+vs0FmW58wF1M06TY0vxIV3DrSKs5nIGclXwUTJtS9N+tsnCL4W2bQvTnOMiAn1mP3I
	C5LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=7NpGySoEhGoeoRllbzqpiwewiGN8uE2pvsTCT9m1jhA=;
	b=g+tu4Acu9qrdlsCm9y5rMmoHgyskTg58y7uAgNGE0VwGwlwlgdEN9R5D9LcvafgjY/
	ID2vJLxSiOetiyrhvPb4rDLjljPMqSVnBb1jIYrHP0xwlYH6P+wU6UjSuawayXWoZvpN
	iDaAnIF72oKshzn7hTnS/J9vNWRDDB8a+Mk6ixex60wSmk8/JLondseJUHyWQKbWU03c
	N6fhPUbBXUsFVDip4lv80UuLmeyuUfxZktOnbn8MQQMRsLyyNu39Xj+fn109ggmvTd+b
	1nwrlaeSfVv0IpMDiolX1/9lZxSedNNAu8k3aURxQxdFZ1Gb1tP+pvDKR5aW7BF2FJhh
	L3Mw==
X-Gm-Message-State: AA+aEWbMsk0ZmtFuWn+xGj8v0BU3DksAvaRKOCiWaNJqUSL5ZVjMmwQ+
	pcfTtBIdlQH7/DkWpShruMmt4y9u
X-Received: by 2002:a1c:9a0d:: with SMTP id c13mr39870850wme.41.1546534210899; 
	Thu, 03 Jan 2019 08:50:10 -0800 (PST)
Received: from ?IPv6:2a02:c7d:8625:5a01:7503:9d7c:2958:5e7d?
	([2a02:c7d:8625:5a01:7503:9d7c:2958:5e7d])
	by smtp.gmail.com with ESMTPSA id
	k23sm31945972wmj.32.2019.01.03.08.50.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Jan 2019 08:50:10 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <975b9131-9937-cfea-3b5d-ef36d0c2b761@gmail.com>
	<CAFEAcA-2tWtEqd-Z0xqNMeocf4rns+FihrAPudiQGz+85HFjJg@mail.gmail.com>
From: Nick Hudson <nicholas.a.hudson@gmail.com>
Message-ID: <7b61db39-7059-6286-2282-b90f45a85faf@gmail.com>
Date: Thu, 3 Jan 2019 16:50:05 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.3
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-2tWtEqd-Z0xqNMeocf4rns+FihrAPudiQGz+85HFjJg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::343
Subject: Re: [Qemu-arm] [PATCH v3] Support u-boot noload images for arm as
 used by, NetBSD/evbarm GENERIC kernel.
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GXKFV5AjUzyI



On 03/01/2019 16:20, Peter Maydell wrote:
> On Tue, 11 Dec 2018 at 12:27, Nick Hudson <nicholas.a.hudson@gmail.com> wrote:
>>
>>
>> noload kernels are loaded with the u-boot image header and as a result
>> the header size needs adding to the entry point.  Fake up a hdr so the
>> kernel image is loaded at the right address and the entry point is
>> adjusted appropriately.
>>
>> The bootloader fits in the space that the uboot header would have occupied.
>>
>> Clarify the load_uimage API to state the passing of a load address when an
>> image doesn't specify one, or when loading a ramdisk is expected.
>>
>> Adjust callers of load_uimage, etc.
>>
>> Signed-off-by: Nick Hudson<skrll@netbsd.org>
>>
>> ---
>>    hw/arm/boot.c          |  8 +++++---
>>    hw/core/loader.c       | 19 ++++++++++++++++---
>>    hw/core/uboot_image.h  |  1 +
>>    hw/microblaze/boot.c   |  2 +-
>>    hw/nios2/boot.c        |  2 +-
>>    hw/ppc/e500.c          |  1 +
>>    hw/ppc/ppc440_bamboo.c |  2 +-
>>    hw/ppc/sam460ex.c      |  2 +-
>>    include/hw/loader.h    |  7 ++++++-
>>    9 files changed, 33 insertions(+), 11 deletions(-)
> 
> Hi; I tried applying your patch, but unfortunately it looks like
> your email client has mangled it to the point that it can't
> be applied:
>   * it is format=flowed, so long lines have been wrapped
>   * some whitespace has been turned into UTF-8 non-breaking space characters
> I tried to manually fix these up, but didn't succeed.
> 
> It looks like you're using Thunderbird -- the kernel docs
> have some config setting suggestions that might help:
> https://www.kernel.org/doc/html/v4.11/process/email-clients.html#thunderbird-gui
> or you could try switching to 'git send-email'.
> 
> I've reviewed the patch for content and it's mostly good:
> I just have a couple more questions below.
> 
>> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
>> index 586baa9b64..450267566a 100644
>> --- a/hw/arm/boot.c
>> +++ b/hw/arm/boot.c
>> @@ -30,8 +30,9 @@
>>     * Documentation/arm/Booting and Documentation/arm64/booting.txt
>>     * They have different preferred image load offsets from system RAM base.
>>     */
>> -#define KERNEL_ARGS_ADDR 0x100
>> -#define KERNEL_LOAD_ADDR 0x00010000
>> +#define KERNEL_ARGS_ADDR   0x100
>> +#define KERNEL_NOLOAD_ADDR 0x00000000
> 
> If I'm reading the code right, this requests that noload images
> are loaded at offset zero into RAM, yes ?

Not quite.

They're loaded as if the full noload image (including uboot header)
was loaded at offset zero, but as load_uboot_image doesn't load the 
header then the image body (minus the header) is loaded at offset
zero + the size of the u-boot header, i.e. 0x40. 

> That's not a great
> choice, because we put our little mini bootloader at offset 0,
> and so the two will clash.

Fortuntately, the bootloader fits in the space that the uboot header would
have occupied.

My commit message has 

"The bootloader fits in the space that the uboot header would have occupied."

to try and described this. I could add more of a description if required?

> Can we put them somewhere else
> (above BOOTLOADER_MAX_SIZE, probably at a 64K page boundary) ?

I don't think this is necessary.

> If they must go at offset 0 then we'd need to refuse to load
> noload images if they set is_linux to true. (We only load the
> mini bootloader if is_linux is true, so that's the only case where
> there's a clash.)

Nor this.


> 
>> +#define KERNEL_LOAD_ADDR   0x00010000
>>    #define KERNEL64_LOAD_ADDR 0x00080000
>>
>>    #define ARM64_TEXT_OFFSET_OFFSET    8
>> @@ -1078,7 +1079,8 @@ void arm_load_kernel(ARMCPU *cpu, struct
>> arm_boot_info *info)
>>        }
>>        entry = elf_entry;
>>        if (kernel_size < 0) {
>> -        kernel_size = load_uimage_as(info->kernel_filename, &entry, NULL,
>> +        uint64_t loadaddr = info->loader_start + KERNEL_NOLOAD_ADDR;
>> +        kernel_size = load_uimage_as(info->kernel_filename, &entry,
>> &loadaddr,
>>                                         &is_linux, NULL, NULL, as);
>>        }
>>        if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64) && kernel_size < 0) {
>> diff --git a/hw/core/loader.c b/hw/core/loader.c
>> index aa0b3fc867..7362197162 100644
>> --- a/hw/core/loader.c
>> +++ b/hw/core/loader.c
>> @@ -638,13 +638,26 @@ static int load_uboot_image(const char *filename,
>> hwaddr *ep, hwaddr *loadaddr,
>>            goto out;
>>
>>        if (hdr->ih_type != image_type) {
>> -        fprintf(stderr, "Wrong image type %d, expected %d\n", hdr->ih_type,
>> -                image_type);
>> -        goto out;
>> +        if (image_type != IH_TYPE_KERNEL &&
>> +            hdr->ih_type != IH_TYPE_KERNEL_NOLOAD) {
> 
> I think you have this condition wrong. Suppose we are
> trying to load image_type == IH_TYPE_KERNEL and we are
> passed a hdr->ih_type == IH_TYPE_RAMDISK. With this change
> we'll stop rejecting that as an error.
> I think you want:
>      if (!(image_type == IH_TYPE_KERNEL &&
>            hdr->ih_type == IH_TYPE_KERNEL_NOLOAD)) {
> 
> because the only kind of mismatch we want to accept is
> "we're looking for KERNEL and we got KERNEL_NOLOAD".

yeah, thanks.

[snip]


> 
> thanks
> -- PMM
> 

thanks for the review.

I'll send v4 with only the condition fixed and more descritive commit 
message (and correct formatting). ok?

Nick
