Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4807928wrt;
        Sat, 1 Dec 2018 06:10:09 -0800 (PST)
X-Google-Smtp-Source: AFSGD/W4dGYIY5X/up+MEnU8xOoDxT6tbrnWRfCZC0cdHx+kV2qvytHe210A0oglm921bdqBWmsX
X-Received: by 2002:a81:ae1b:: with SMTP id m27mr9636489ywh.159.1543673408990;
        Sat, 01 Dec 2018 06:10:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543673408; cv=none;
        d=google.com; s=arc-20160816;
        b=iYnY+0xiJ350JNs6q/gc+DWrAEQZIh5YbH4G+swVB8I6yWkzUk7amKd/tTnQ1VIGW2
         Jmbk8IjEespRfj4EWJdZW0tBAyC1t/s50lRf0NHcmU4aPQq6Y+cnPDgEQHRhNrX01kf0
         NVpmr7O0U4u5tZqlTLYfx3WGBYe4nnZtEHP+zA5X5gJEuKZ+rugbOJ+4aG9fiS1aXPIP
         mJY561q97Q4Fzw2nRPdV+mTtKAUEEYTX6ga9gTN6C/U8B0WcqWNqfJPvL3YcI/HEEHPQ
         hK4VXAWEQJa2Clpr44MrOhJL+CN6K4oBnt6oxKs2N057CEK1IbA6W2ZCkllcaUZ0G/Rn
         40kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dkim-signature;
        bh=0rXyNv4jRGxCzRY+9DnztpGyqokX9H0w62jZrVVoTBU=;
        b=CIw93YUCOIk1u9DL6uxoqsK8iSlY1ErumBFRdfXkzjPhIMLLatHwt0uhc2pbymSNoh
         OJyQRYinli/0VCuwF5yv4eF9vHjkU0XGXaRmDmrt8a6xX7ZuCXr9xfNOpr8Mq1MxJsgZ
         6AgsIA+ikFZBcvd3yjnIv5N8MkoF3AurmoEujAcyIeH/jFqN+rErDB+ziijC7RrxhDSd
         QcT+RqldrCokhetUaOe1+3a3vyPQeK7++LDsxbU1fuj5953lCQdi1EArgKrSMmhWsNAs
         1lTIR15CIhcRnqA3MvGCSg65nWCPMYSUE2NXklAUZS7O3Rk/mmUXou8vdZVi1gtn3RKG
         p1nQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ddda+yST;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h184-v6si4769277ybc.239.2018.12.01.06.10.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 01 Dec 2018 06:10:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ddda+yST;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41434 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gT5yC-0008QT-Dd
	for alex.bennee@linaro.org; Sat, 01 Dec 2018 09:10:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41088)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <nicholas.a.hudson@gmail.com>) id 1gT5y1-0008La-1y
	for qemu-arm@nongnu.org; Sat, 01 Dec 2018 09:09:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <nicholas.a.hudson@gmail.com>) id 1gT5y0-000568-7E
	for qemu-arm@nongnu.org; Sat, 01 Dec 2018 09:09:57 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:53254)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <nicholas.a.hudson@gmail.com>)
	id 1gT5y0-00055S-0p; Sat, 01 Dec 2018 09:09:56 -0500
Received: by mail-wm1-x343.google.com with SMTP id y1so1594777wmi.3;
	Sat, 01 Dec 2018 06:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=0rXyNv4jRGxCzRY+9DnztpGyqokX9H0w62jZrVVoTBU=;
	b=ddda+ySTHM7UPlu43YaVRGgCvyL/09b4D5C7LF2h+ToQsCVMJTqVY1NwwVPCILbTw7
	8FxZbVKBXAeQ0TQT6gApaSIg8cB+Ni3Oza59+RB9YhGik7lP0KlLB7dH/iISi5bfy+Df
	v20QfJFKUUkt0nr732f4+DAUlRUpf2gH2qiF8ykc2qGh+gKSUGdkVQORyJ6mRGP+Skua
	bgjmdoO2bAB80GJ6Ay5soIOVMdVjKyMJ770TqpEt2re1oT4UpnKPAUQ8KToWuFeKB1m8
	35IZ+216lOpCG+0B4mWPePRrc17ywXVtbqvW36trqMNGqh7OmI00ZVJneDj/oMH8zmSz
	Yyfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=0rXyNv4jRGxCzRY+9DnztpGyqokX9H0w62jZrVVoTBU=;
	b=tz3t7cwfjGWIvAT8BmKBMpb/P32F0zA4+l1BoSCRzyKXDOmwe8/SzUznCCDFzEiHij
	qJBeqb4dGAfYDQg9UMUipxj74WjbOZ9wOOzATvwOhH9RWrrHjpaGxZCo1SI7f3DPjZnk
	JJn50xo99lqBnvP3B2jjDORpv+Aumfx4t0LFXmRaiPBtQy/J1/x6HdIulEdAkSWURooP
	1B2+px4OeZfXPJMrYf+/eUrVCxVQ/EMyi2j831ROuwqRQjvghSfpFlH80O3NCQ97fkUU
	md3WUkoahsQ4qE9zVIYIW/7rAKHl0WgeDDvDV1tIszlctIQ/GDwbUjDvMBuIHs0KPuW5
	BmpQ==
X-Gm-Message-State: AA+aEWYndhWWYZaTGnxYiNY9tGGBxwBzfFJgDvHYZ2opXiSSrfOCQ4JC
	XRBB81NyzGet8lDxZ9yaezdjyUBwots=
X-Received: by 2002:a1c:9513:: with SMTP id x19mr2312755wmd.112.1543673394622; 
	Sat, 01 Dec 2018 06:09:54 -0800 (PST)
Received: from ?IPv6:2a02:c7d:860f:7601:9c88:3870:2a8a:d4f5?
	([2a02:c7d:860f:7601:9c88:3870:2a8a:d4f5])
	by smtp.gmail.com with ESMTPSA id
	w80sm1817776wme.38.2018.12.01.06.09.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 01 Dec 2018 06:09:54 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <fe1367d1-33f7-21fa-be84-20b9795a2157@gmail.com>
	<CAFEAcA_K6S2pB6cP+RHDZjeACU_ROJ6jkkG-2h7TCyiCkejRug@mail.gmail.com>
From: Nick Hudson <nicholas.a.hudson@gmail.com>
Message-ID: <da2ed5e8-d01b-2887-6015-d26e44eae095@gmail.com>
Date: Sat, 1 Dec 2018 14:09:52 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_K6S2pB6cP+RHDZjeACU_ROJ6jkkG-2h7TCyiCkejRug@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::343
Subject: Re: [Qemu-arm] [PATCH v2] Support u-boot noload images for arm as
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
X-TUID: CV8Ww4/GckEJ


On 30/11/2018 17:18, Peter Maydell wrote:
> On Thu, 29 Nov 2018 at 20:22, Nick Hudson <nicholas.a.hudson@gmail.com> wrote:
>> noload kernels are loaded with the u-boot image header and as a result
>> the header size needs adding to the entry point.  Fake up a hdr so the
>> kernel image is loaded at the right address and the entry point is
>> adjusted appropriately.
>>
>> The bootloader fits in the space that the uboot header would have occupied.
>>
>> Update the load_uimage API to allow passing of load address when an image
>> doesn't specify one.
>>
>> Signed-off-by: Nick Hudson <skrll@netbsd.org>
>> ---
>> diff --git a/include/hw/loader.h b/include/hw/loader.h
>> index 67a0af84ac..10ff0ff76d 100644
>> --- a/include/hw/loader.h
>> +++ b/include/hw/loader.h
>> @@ -163,7 +163,8 @@ int load_aout(const char *filename, hwaddr addr, int max_sz,
>>   /** load_uimage_as:
>>    * @filename: Path of uimage file
>>    * @ep: Populated with program entry point. Ignored if NULL.
>> - * @loadaddr: Populated with the load address. Ignored if NULL.
>> + * @loadaddr: load address if none specified in the image. Populated with the
>> + *            load address. Ignored if NULL.
> This API change will break some existing users. For instance
> hw/microblaze/boot.c does this:
>              hwaddr uentry, loadaddr;
>
>              kernel_size = load_uimage(kernel_filename, &uentry, &loadaddr, 0,
>                                        NULL, NULL);

I did a bit more digging and the same (ab)use of loadaddr to pass

a value is used by load_ramdisk{,_as}.  Hopefully, I can do the same

for kernel_noload?



> which is a legitimate use of the current API, but your changes will
> mean that load_uboot_image() will be using an uninitialized
> variable. Getting every call site that cares about the returned
> result from loadaddr to also provide a valid default load
> address as input is going to be really painful, so I think we
> need to figure out an API for this function that doesn't
> make the input (default load address) argument the same
> parameter as the output (where we actually loaded the image)
> argument.

I have version 3 ready with fixing these callers.


>
> We should also make the load_uboot_image() function print an
> error message if we don't load the file because it needs a
> default load address and the caller didn't pass one
> ("this image format cannot be loaded on this machine type",
> or similar).
Fixed in version 3.
>
> PS: our coding style wants {} on all if()s -- scripts/checkpatch.pl
> can help catch this kind of nit.

There are lots of errors from this without my changes :(


> thanks
> -- PMM


Thanks,

Nick

