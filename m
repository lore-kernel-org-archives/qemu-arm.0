Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp612099wrw;
        Fri, 16 Nov 2018 08:52:56 -0800 (PST)
X-Google-Smtp-Source: AJdET5faQ59jyLbqgZ4Pt1J685ypiygwLUQOG2V5p7YaOU4eM5temYXP+x2jMePaXg3RCZ59HK0R
X-Received: by 2002:a37:8882:: with SMTP id k124mr10708169qkd.1.1542387176404;
        Fri, 16 Nov 2018 08:52:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542387176; cv=none;
        d=google.com; s=arc-20160816;
        b=CrOVTOHF8LD195qRc3r5oCOqchX6oG6WnBcxbj2duvy9SHBJmA9dNoh6686ZGmBBdK
         MtNO4jNIVuP9+8nus4bh9oTHn04SbLE99s/i4BgXbSpnTQU5cHFDP0xXr8QxDKtc9DNf
         BfsWdKC7PfA+aksAQ8Y6lbGEFnnzOpvIGhp1ffQm6oihdzwnit9vAO20xhVHYRDQLBzK
         J6NYV4dARLda2jOKSebVF2RWbfXyUuB3uDeVvtuDTTooNBhFGKvusLMzk7sqFQf1Gty9
         IjS/hRztjeSeHc3rzlJoS/ltQMYafJ6baXWOPFz1Ko8qqCxnOORghRsU4wSVO8/fcb+L
         85Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dkim-signature;
        bh=Wsxq82NdN8yytv5XHB3DYGJWMp6u2PWsts/5p0d2raI=;
        b=d1nZ7/1fT0Pp5PbIVC57YnG5x7qRK4Vuz4WWW3EGJBvOo69E8yt8kn6z2slALw0pc+
         HW42ldUxVXd000TSAdQuij7acQhX9+x/nanDyM/IdX0VOdlc1lx0kEmMNI14ff5g2uou
         8pJChjMhwxyJxrxsA8NGm2ekwUgQj4sghEIyKU/Rftou6bFz/riK0ao9iNXC0t/nNrF2
         NtkD6LW3+D1pTsT5PgWWuAB2nuGyp0YTMU5kvvWrJ2yZuoaCZxNAA/P2XpzP7aMIqX4Z
         TXWf1ciRFSryI1lgEdE4pSjUttlNc73+VGR/gD2m1UtkLCQJ2+ua7/bS+UBZAb1FhppN
         TBEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=mypgW1CZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q12si1241578qtl.33.2018.11.16.08.52.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Nov 2018 08:52:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=mypgW1CZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:45779 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNhMV-0000gg-QP
	for alex.bennee@linaro.org; Fri, 16 Nov 2018 11:52:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45483)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <nicholas.a.hudson@gmail.com>) id 1gNhLS-0000dv-Gt
	for qemu-devel@nongnu.org; Fri, 16 Nov 2018 11:51:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <nicholas.a.hudson@gmail.com>) id 1gNhLQ-0000oL-Bb
	for qemu-devel@nongnu.org; Fri, 16 Nov 2018 11:51:50 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:44123)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <nicholas.a.hudson@gmail.com>)
	id 1gNhLB-0000iO-9x; Fri, 16 Nov 2018 11:51:33 -0500
Received: by mail-wr1-x442.google.com with SMTP id j17-v6so25544387wrq.11;
	Fri, 16 Nov 2018 08:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=Wsxq82NdN8yytv5XHB3DYGJWMp6u2PWsts/5p0d2raI=;
	b=mypgW1CZEC19ms/fFJJ0YH26AsUHCx2b4rhVJMxLiCKNBJITMz5BXSfLancwT1gYlS
	SK43vsdNcfy9Bi2vzi0RhWlk8y0rftNn7EySKAI2WgOPxh4xghxidMnXtJ1Hkir97aJ/
	Jvq269fBef5+VWtDRLkDCTMJLzdVfsIxiBjVEZ+Ki++J7Fo9ItyKFGFvr1/krHbAYELA
	vy5kzavdEzwTNu2yxjsTahAdMXPcfpl+eFbfEM4XQ/1pskSjx53kZZ7kIwnTX937x/Df
	BV1XP0DwqWAuehKRFpiLP0o+uxdVeIXIUxpeIm5+thLQcb3ilksPcqprPZVUxOQB0kvA
	Y5Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=Wsxq82NdN8yytv5XHB3DYGJWMp6u2PWsts/5p0d2raI=;
	b=XE/MmxxJlV5BLQrbtpNXdp7Vr6svGrk+t2Vko9rI4BZOQ1iJkEDtUXCvLbK36klHNV
	6XxiPOfXMLC4vwnoXN/3YffI1S6X0tk3P1V9SXNWVcSO/lieb+dpyqKmMla7do62ZpqZ
	EVWjGazo2DP5O8NEnjYOL3lwZo2KtLATulIwH3emjV1owkwX202H1OjaTvTvIr38Uflx
	JSxpQM+x3wtqa1RWknXSiB/fvVMjsaqkYxVpTrwgxGnyKlccoetprUbnY1iQiC+2JXc2
	YZiJ6bgFda1TG8ty6N4eVxf7AV/POCIXTG6b82QKZG+7W8xtuz4T+GVLa6YS54LBNRRw
	Occw==
X-Gm-Message-State: AGRZ1gJRLF1th3mr3xmCO++xDpMQg+nJphgPtYa0B8Mt6TxuhTRt9rND
	vXqlFytSYvz6KTnwLJ+WSbEhT8lT2PA=
X-Received: by 2002:a5d:56d2:: with SMTP id m18mr9036124wrw.113.1542387090879; 
	Fri, 16 Nov 2018 08:51:30 -0800 (PST)
Received: from ?IPv6:2a02:c7d:860f:7601:e52c:c0ca:e561:f552?
	([2a02:c7d:860f:7601:e52c:c0ca:e561:f552])
	by smtp.gmail.com with ESMTPSA id
	t137-v6sm2403203wmt.0.2018.11.16.08.51.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Nov 2018 08:51:30 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <d9876015-2126-79fe-415f-ca7427ab3059@gmail.com>
	<CAFEAcA84aoWNdu1T90iR0uw7emfF1SRF09FjL+gu12yrdAr2yA@mail.gmail.com>
From: Nick Hudson <nicholas.a.hudson@gmail.com>
Message-ID: <327575eb-cb88-8ba2-d61a-c133f1c0d30c@gmail.com>
Date: Fri, 16 Nov 2018 16:51:28 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA84aoWNdu1T90iR0uw7emfF1SRF09FjL+gu12yrdAr2yA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: Re: [Qemu-devel] [PATCH] Support u-boot noload images for arm as
 used by NetBSD/evbarm GENERIC kernel.
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 41B/enSorzSo


On 16/11/2018 14:34, Peter Maydell wrote:
> On 7 November 2018 at 13:19, Nick Hudson <nicholas.a.hudson@gmail.com> wrote:
>> noload kernels are loaded with the u-boot image header and as a result
>> the header size needs adding to the entry point.  Fake up a hdr so the
>> kernel image is loaded at the right address and the entry point is
>> adjusted appropriately
>>
>> Signed-off-by: Nick Hudson <skrll@netbsd.org>
> Hi; thanks for this patch.


Thanks for reviewing.

>
>> ---
>>   hw/arm/boot.c         |  8 +++++---
>>   hw/core/loader.c      | 12 +++++++++---
>>   hw/core/uboot_image.h |  1 +
>>   3 files changed, 15 insertions(+), 6 deletions(-)
>>
>> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
>> index 586baa9b64..450267566a 100644
>> --- a/hw/arm/boot.c
>> +++ b/hw/arm/boot.c
>> @@ -30,8 +30,9 @@
>>    * Documentation/arm/Booting and Documentation/arm64/booting.txt
>>    * They have different preferred image load offsets from system RAM base.
>>    */
>> -#define KERNEL_ARGS_ADDR 0x100
>> -#define KERNEL_LOAD_ADDR 0x00010000
>> +#define KERNEL_ARGS_ADDR   0x100
>> +#define KERNEL_NOLOAD_ADDR 0x00000000
>> +#define KERNEL_LOAD_ADDR   0x00010000
>>   #define KERNEL64_LOAD_ADDR 0x00080000
>>
>>   #define ARM64_TEXT_OFFSET_OFFSET    8
>> @@ -1078,7 +1079,8 @@ void arm_load_kernel(ARMCPU *cpu, struct arm_boot_info
>> *info)
>>       }
>>       entry = elf_entry;
>>       if (kernel_size < 0) {
>> -        kernel_size = load_uimage_as(info->kernel_filename, &entry, NULL,
>> +        uint64_t loadaddr = info->loader_start + KERNEL_NOLOAD_ADDR;
>> +        kernel_size = load_uimage_as(info->kernel_filename, &entry,
>> &loadaddr,
>>                                        &is_linux, NULL, NULL, as);
> I don't really understand this change. The API for load_uimage_as()
> says that the loadaddr argument is an output, not an input, and that
> it is ignored if it is NULL. If we're changing the API here then
> we need to (a) document that change and (b) check all the callers
> can handle it. It would be better if we can avoid having to do that.


I chose to pass where the noload kernel should be loaded via loadaddr as 
arm_load_kernel knows where RAM is. Perhaps there's a better way?

BTW, I should have mentioned that I pass the same address that is used 
for the bootloader. This address is adjusted in load_uboot_image by the 
size of the uboot header. As the bootloader is smaller than the uboot 
header it all works. uboot loads the whole image including header and 
adjusts the entry point by the header size.

>
>>       }
>>       if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64) && kernel_size < 0) {
>> diff --git a/hw/core/loader.c b/hw/core/loader.c
>> index aa0b3fc867..952562c2da 100644
>> --- a/hw/core/loader.c
>> +++ b/hw/core/loader.c
>> @@ -638,13 +638,19 @@ static int load_uboot_image(const char *filename,
>> hwaddr *ep, hwaddr *loadaddr,
>>           goto out;
>>
>>       if (hdr->ih_type != image_type) {
>> -        fprintf(stderr, "Wrong image type %d, expected %d\n", hdr->ih_type,
>> -                image_type);
>> -        goto out;
>> +        if (image_type != IH_TYPE_KERNEL && hdr->ih_type !=
>> IH_TYPE_KERNEL_NOLOAD) {
>> +            fprintf(stderr, "Wrong image type %d, expected %d\n",
>> hdr->ih_type,
>> +                    image_type);
>> +            goto out;
>> +        }
>>       }
>>
>>       /* TODO: Implement other image types.  */
>>       switch (hdr->ih_type) {
>> +    case IH_TYPE_KERNEL_NOLOAD:
>> +        hdr->ih_load = *loadaddr + sizeof(*hdr);
> This will segfault if the user passed in NULL for loadaddr,
> as they are allowed to do by the API.


I can update the header with this API change and update callers if 
that's ok?


>
>> +        hdr->ih_ep += hdr->ih_load;
>> +
> Cases which fall through need a specific
>       /* fall through */
>
> comment. This tells human readers and static analysis tools that
> it was intentional.


Sure, I did wonder if this was expected.


Thanks,

Nick


