Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3043763lfb;
        Mon, 7 Dec 2020 04:07:43 -0800 (PST)
X-Received: by 2002:adf:ef4c:: with SMTP id c12mr19823067wrp.242.1607342863619;
        Mon, 07 Dec 2020 04:07:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607342863; cv=none;
        d=google.com; s=arc-20160816;
        b=Cg9a9aXcwQFUhyjLtJVwdhjnYezArN1f8tk+y68QSJJzKm2OoFsCWzqLRmHk/XEJU/
         nFGcre3so8fO4OsPLD96Vb3o/r3O3b4qo6CLvfI/32qB3i8qAs2ucld7kX/5TS0EkmNY
         PY6R0pZ4vUYVsePJ6XJmRat3tKmBRiw8ouzPWNBQ0LzK7e869RrBwcYWiYVqqbrveFe2
         tat9DkPbmuOLuOz01mNDPxHfLzOMoWZJgCbi8Q4wobtvYVxVrUWs9aS4QdVR5Wpy1U/C
         Md/wNm+z/sKw1nXcxALafepCaLecNeQsJl1vLi8OlVgZDcuO9jtEQlfViW6xPXmnMdKx
         Ml1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:from
         :references:in-reply-to:subject:cc:to:dkim-signature;
        bh=1YtGVMQr0FVZeOcoG12r04oSiXeoZfgTnI9hlfdcSzo=;
        b=MNgvhkc0s4T5ZSixnDV7J2OmYALvp/STWJQgHs1+zwOOsVy/vGPzjUdZ3yiQef1LZF
         jk7L9nuPbZlBpIH2IFThFytJgAda32iH5eXB5wXR8CS+usKS3ru8eG4kh+EwFhZdmBEn
         42Dgn5WY8umFkW9QDjTM1tgRy89Nv13mziSWuqjcvkQrqXDBWD09GYQv7WL/Da/fmP7L
         rskya0HduBCGnEiocCJdjqEMOk2oAC47VUdhNfqEr01WcqzxuVYSFHVQb5e5u0DNANE0
         8yIg3L1VdZ4keviVr2TzVkuj0UFUR1A3MrM/eJUch49492bjZcUnU6p1FCvT+Gfvq99m
         15KQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@dme-org.20150623.gappssmtp.com header.s=20150623 header.b=yEbG9z31;
       spf=neutral (google.com: 209.85.220.65 is neither permitted nor denied by domain of dme@dme.org) smtp.mailfrom=dme@dme.org
Return-Path: <dme@dme.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id g2sor5344996wma.18.2020.12.07.04.07.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 07 Dec 2020 04:07:43 -0800 (PST)
Received-SPF: neutral (google.com: 209.85.220.65 is neither permitted nor denied by domain of dme@dme.org) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@dme-org.20150623.gappssmtp.com header.s=20150623 header.b=yEbG9z31;
       spf=neutral (google.com: 209.85.220.65 is neither permitted nor denied by domain of dme@dme.org) smtp.mailfrom=dme@dme.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dme-org.20150623.gappssmtp.com; s=20150623;
        h=to:cc:subject:in-reply-to:references:from:date:message-id
         :mime-version:content-transfer-encoding;
        bh=1YtGVMQr0FVZeOcoG12r04oSiXeoZfgTnI9hlfdcSzo=;
        b=yEbG9z312qL8WgG25/vC5rQMHTxs3uwpVgBg8mZRrDzazg51fmCBQ50jqAlEUFwjOM
         TqNAHGPqMa/maYBO8fJ1XvRwaD0h/VZctiGhf3OYa3BlIMGGt9OoFOAdsvLvwh7hwnBp
         hgoBOap9nyf/bFpXeMG1H83kWxOfWLIVXfxdlY0+VU9g+jZqAt6A48T8qhN3P+kwNagc
         jRJ7uboUgIJyjxtLvljGsqQ45dObLP7cW6sUUqeG6J/QjfxqpxpqkQQPk+Kvf97qAx6G
         1ia+4ZBv7jAtTptcIF6Ka89R56u3vshNAMARRvnReXlb19vnLE32FVlKpTWY2iXZWXsi
         geMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:subject:in-reply-to:references:from:date
         :message-id:mime-version:content-transfer-encoding;
        bh=1YtGVMQr0FVZeOcoG12r04oSiXeoZfgTnI9hlfdcSzo=;
        b=Kr+x6RPwnK+LpUSCc8mNfBrzMLquv+w7+sj9JktLEnCh0VkzinZdTj2qCBZn6ccATT
         tY9zUqcvEiC+xouN7oINCkWJX6ZjBeDFT8wQMieArPoJSJtXEhK8VLYIQhZvtFPeqHLx
         Ivmf6yj+RgwjQ6ncVDRl0twgPdeDM5Q8DETDyO1Px9xCbo0XYjPtOYqSxgn0MlocxT9t
         5bvCcKE4QIdnbwYOfOdi/ojhNHL/H911kTTIEqax7KrsOud3Rr66J6e6sNWnlDbZzX2P
         RfCqVcy2Gcqb9w6JMmT7rNiOUDjoahNxjJ3qBkV+NsUOT6mOOGXkBp05hN9Mj9P+W9ZV
         FaXw==
X-Gm-Message-State: AOAM530eXqCl63mRhO9B0fCLxUOxSVuF8K8K3AFCGJ+YacA3B1jgzLoc
	j0P3c/QIDQNVDDwA5kux/+9nAZo1TwFwWg2+r8w=
X-Google-Smtp-Source: ABdhPJzBq0JkYF3zZLNV83dRq2OhRaOZ8Kd3btLsPel723XZipm0sIUjqhNPOW2cGU2ZMTt/8VagdQ==
X-Received: by 2002:a1c:3902:: with SMTP id g2mr17883020wma.117.1607342862798;
        Mon, 07 Dec 2020 04:07:42 -0800 (PST)
Return-Path: <dme@dme.org>
Received: from disaster-area.hh.sledj.net (disaster-area.hh.sledj.net. [2001:8b0:bb71:7140:64::1])
        by smtp.gmail.com with ESMTPSA id h20sm13609575wmb.29.2020.12.07.04.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 04:07:41 -0800 (PST)
Received: from localhost (disaster-area.hh.sledj.net [local])
	by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id d43b7dac;
	Mon, 7 Dec 2020 12:07:40 +0000 (UTC)
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, "Michael S. Tsirkin"
 <mst@redhat.com>, Xu Yandong <xuyandong2@huawei.com>, Markus Armbruster
 <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>, Shannon Zhao
 <shannon.zhaosl@gmail.com>, Zheng Xiang <zhengxiang9@huawei.com>,
 qemu-arm@nongnu.org, =?utf-8?B?aGFpYmluemhhbmco5byg5rW35paMKQ==?=
 <haibinzhang@tencent.com>, Igor
 Mammedov <imammedo@redhat.com>, John Snow <jsnow@redhat.com>, Mihai
 Carabas <mihai.carabas@oracle.com>
Subject: Re: [RFC PATCH 0/5] ARM: reduce the memory consumed when mapping
 UEFI flash images
In-Reply-To: <87ft55vad4.fsf@linaro.org>
References: <20201116104216.439650-1-david.edmondson@oracle.com>
 <3da830b6-8200-6df9-9ba3-1f51bf887c4e@redhat.com>
 <87a6vhxvit.fsf@dusky.pond.sub.org>
 <e54fc218-1eae-be1c-b064-049bc1d46793@redhat.com>
 <87ft55vad4.fsf@linaro.org>
X-HGTTG: zarquon
From: David Edmondson <dme@dme.org>
Date: Mon, 07 Dec 2020 12:07:40 +0000
Message-ID: <cun5z5du8dv.fsf@zarquon.hh.sledj.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: ImA4Aw7kEVPL

Sorry for the delay in replying - holiday then distractions.

On Thursday, 2020-11-19 at 11:45:11 GMT, Alex Benn=C3=A9e wrote:

> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:
>
>> On 11/16/20 2:48 PM, Markus Armbruster wrote:
>>> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:
>>>=20
>>>> Hi David,
>>>>
>>>> On 11/16/20 11:42 AM, David Edmondson wrote:
>>>>> Currently ARM UEFI images are typically built as 2MB/768kB flash
>>>>> images for code and variables respectively. These images are both then
>>>>> padded out to 64MB before being loaded by QEMU.
>>>>>
>>>>> Because the images are 64MB each, QEMU allocates 128MB of memory to
>>>>> read them, and then proceeds to read all 128MB from disk (dirtying the
>>>>> memory). Of this 128MB less than 3MB is useful - the rest is zero
>>>>> padding.
>>>>
>>>> 2 years ago I commented the same problem, and suggested to access the
>>>> underlying storage by "block", as this is a "block storage".
>>>>
>>>> Back then the response was "do not try to fix something that works".
>>>> This is why we choose the big hammer "do not accept image size not
>>>> matching device size" way.
>>>>
>>>> While your series seems to help, it only postpone the same
>>>> implementation problem. If what you want is use the least memory
>>>> required, I still believe accessing the device by block is the
>>>> best approach.
>>>=20
>>> "Do not try to fix something that works" is hard to disagree with.
>>> However, at least some users seem to disagree with "this works".  Enough
>>> to overcome the resistance to change?
>>
>> Yeah, at least 3 big users so far:
>>
>> - Huawei
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg607292.html
>> - Tencent
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg742066.html
>> - Oracle
>> (this series).
>>
>> Then Huawei tried the MicroVM approach:
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg680103.html
>>
>> I simply wanted to save David time by remembering this other approach,
>> since Peter already commented on David's one (see Huawei link).
>
> IIRC the two questions that came up were:
>
>   - what would reading memory not covered by a file look like (0's or
>     something more like real HW, 7f?).
>
>   - what happens when the guest writes beyond the bounds of a backing
>     file?

In the non-backward-compatible-case (pre virt-5.2 in the patches, but
obviously not actually in 5.2, where the memory range is declared to the
guest as the extent of the file) neither of these issues should arise.

Reading/writing outside of the declared range should generate a fault,
much like any other non-existent region.

In the backward-compatible case the patches are obviously flawed - a
write outside of the extent of the backing file would have nowhere to
go.

In order to figure out how to move forward, I think that the summary of
the previous conversations is that either:
- it's not possible to reduce the size of the memory region declared to
  the guest from 64M+64M because of $reasons, or
- we don't want to reduce the size of the memory region declared to the
  guest from 64M+64M because of $reasons.

If that's right, I'd be curious to better understand $reasons, but have
no basis on which to argue.

Presuming that it's not acceptable to reduce the declared extent of the
flash regions, I will probably look to implement Philippe's suggestion:

> If what you want is use the least memory required, I still believe
> accessing the device by block is the best approach.

...which I interpret to mean that the pflash drivers should not allocate
memory and read the images (later writing back modified blocks), but
handle each IO request from the caller by reading and writing blocks
from the underlying device as necessary.

If this interpretation is wrong, please let me know :-)

Looking at doing that, it seems that a new variant of
memory_region_init_rom_device() that does not allocate memory will be
required, unless there anything already available that performs a
similar function?

Booting a VM with AAVMF and writing some variables to the flash doesn't
exercise much of the pflash functionality. In particular it would seem
like the right time to fix the batch write omission in the current
code. Is there another consumer of the pflash drivers that is likely to
exercise more? (I can write tests that run in the guest, of course,
presuming that the Linux driver can be pushed into using those paths.)

> I'm guessing for these cloudy type applications no one cares about
> persistence of EFI variables? Maybe we just need a formulation for the
> second pflash which is explicit about writes being ephemeral while also
> being accepted?

Our current deployments on x86 do not have writable flash for VARS,
though I believe that was problematic on arm64 until a recent
change. It's my suspicion that assuming we can continue to present
read-only VARS generally is going to be proven wrong before too long.

dme.
--=20
I'm not living in the real world, no more, no more.
