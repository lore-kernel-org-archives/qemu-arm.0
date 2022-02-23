X-Google-Smtp-Source: ABdhPJzbXM8TFVeo+ieDX9nVpG4Pvpe0I3mtlMiHe7JtbWgcFHFnH4LsF3oHXCdQElz1foP3K9+M
X-Received: by 2002:a17:907:3c7:b0:6cf:8e46:617c with SMTP id su7-20020a17090703c700b006cf8e46617cmr413272ejb.557.1645634330944;
        Wed, 23 Feb 2022 08:38:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645634330; cv=none;
        d=google.com; s=arc-20160816;
        b=g3URmkKjfHZT2Y5cj9dmIS0CPJShybdhIXY9N82UsaKal9/jogB+XTACiw7Rhq/wp8
         a045iJ6KiSYwD5qpE1uI8cuHNEoQYzw6aa+eXki1qZGucedXI8TOCZiO/MvPVkAALN8l
         MWOz5HUnKZB4VDkJLZijDPlKlAekSUAaNePYPXpd2O6kcJTX8obIdp5sVVZzzh36DbgZ
         ui+5Tsb2Y9QvtTsjVZz0+4cDDsE9YbiwDEmrWsocwvk5o1gzkBSkMQe1gjYQrHMGnmuy
         E+pXGRpS2hYYqNrOnmyREEP0h1FjNyno5TMoLkyKwD3Q4fICNUmAq/glZVliu5qojdxV
         xZ2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :date:message-id:from:references:cc:to:subject:dkim-signature;
        bh=YvUJUt01AqA1jLEI40f3SpVWokqXl94u2zNkCSkX3h0=;
        b=pH2YoUwnjypZfd3ELGnkCsDzAjomE/b3iaSyozTlRWDh9B7uTf+ZYRA7M47QM13Zld
         LZaazNw6nyr95VBMC8VN1SZ5fjrMcapNbjumpA0TOHooRNoDw1ZdeSupzF+PJyjZHi71
         O4guLb+CmY9q7LIavHel1IjjQ8ExAK2H/zDc72o8uA0JKQtjXbVAppOigHvMArnNcdhX
         m5B5IKNUOAR6kz0aB0nh0mT8O4YnaBgCJ3UwxRrZ8lD3N5hO8W1PyegxscBfxQh0MWqH
         WBgjFyX5sMUE65X8fXj5uqd1gEERNKEDSRFXFAw5MJZdK7g16DYudceqNslxyqPsaVUf
         iD9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BKthRwiq;
       spf=pass (google.com: domain of lersek@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=lersek@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <lersek@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id m10si18090ejg.917.2022.02.23.08.38.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 23 Feb 2022 08:38:50 -0800 (PST)
Received-SPF: pass (google.com: domain of lersek@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BKthRwiq;
       spf=pass (google.com: domain of lersek@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=lersek@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1645634329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YvUJUt01AqA1jLEI40f3SpVWokqXl94u2zNkCSkX3h0=;
	b=BKthRwiqc48c3kyF5PyBp1Ubnpfkv9QmbbI2pdepqVnozkDmScbH8ONoSm9kuZupRGkqWJ
	e5w3oWAfsktAVEVQ6ZfWN1j5ldHKsxJwncexgHKc+IEpyzX2gRqyO3KREw9KzUbh4M6XIl
	NvgXCea3/Dm0q5yXnoHe2Dp9vPxuE08=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-82-oj9eYkpMP1COUYSINKzwEw-1; Wed, 23 Feb 2022 11:38:46 -0500
X-MC-Unique: oj9eYkpMP1COUYSINKzwEw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ABE551006AA5;
	Wed, 23 Feb 2022 16:38:44 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (unknown [10.39.192.72])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 42E2586596;
	Wed, 23 Feb 2022 16:37:43 +0000 (UTC)
Subject: Re: Analysis of slow distro boots in check-avocado
 (BootLinuxAarch64.test_virt_tcg*)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, =?UTF-8?Q?Daniel_P._Berrang=c3=a9?=
 <berrange@redhat.com>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <cleber@redhat.com>,
 Oleg Vasilev <me@svin.in>, Richard Henderson <richard.henderson@linaro.org>,
 Emilio Cota <cota@braap.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Idan Horowitz
 <idan.horowitz@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Andrew Jones <drjones@redhat.com>
References: <874k4xbqvp.fsf@linaro.org> <878ru2nacq.fsf@linaro.org>
 <YhURfqMvRT4xbiz6@redhat.com>
 <96bafa75-a0c6-f431-a6d8-fe98d438d0f9@gmail.com>
 <YhYVVnVSL8K1S4MC@redhat.com>
 <e9f70381-03f2-9582-8ad6-e9252d3195ab@gmail.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <fb9999be-e1e2-8e8c-3c74-347c948635d6@redhat.com>
Date: Wed, 23 Feb 2022 17:37:41 +0100
MIME-Version: 1.0
In-Reply-To: <e9f70381-03f2-9582-8ad6-e9252d3195ab@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: OXxe0cWwx24c

On 02/23/22 14:34, Philippe Mathieu-Daudé wrote:
> On 23/2/22 12:07, Daniel P. Berrangé wrote:
>> On Tue, Feb 22, 2022 at 06:33:41PM +0100, Philippe Mathieu-Daudé wrote:
>>> +Igor/MST for UEFI tests.
>>>
>>> On 22/2/22 17:38, Daniel P. Berrangé wrote:
>>>> On Tue, Feb 22, 2022 at 04:17:23PM +0000, Alex Bennée wrote:
>>>>>
>>>>> Alex Bennée <alex.bennee@linaro.org> writes:
>>>>>
>>>>>> Hi,
>>>>>>
>>>>>> TL;DR:
>>>>>>
>>>>>>     - pc-bios/edk2-aarch64-code.fd should be rebuilt without debug
>>>>>
>>>>> Laszlo,
>>>>>
>>>>> Would it be possible to do a less debug enabled version of EDK2 on the
>>>>> next update to pc-bios/edk2-*?
>>>>
>>>> NB, Laszlo is no longer  maintaining EDK2 in QEMU, it was handed
>>>> over to Philippe.  I'm CC'ing Gerd too since he's a reviewer and
>>>> an EDK2 contributor taking over from Lazslo in EDK2 community
>>>
>>> We need the DEBUG profile to ensure the bios-tables-tests work.
>>
>> Can you elaborate on what bios-tables-tests needs this for, and
>> what coverage we would loose by disabling DEBUG.
> 
> Maybe it was only required when the tests were developed...
> I'll defer that question to Igor.

I've briefly rechecked commits 77db55fc8155 ("tests/uefi-test-tools: add
build scripts", 2019-02-21) and 536d2173b2b3 ("roms: build edk2 firmware
binaries and variable store templates", 2019-04-17). I think my only
reason for picking the DEBUG build target was that other build targets
are generally useless for debugging -- they produce no logs (or fewer logs).

> 
>> It may well be a better tradeoff to sacrifice part of bios-tables-tests
>> in favour of shipping more broadly usable images without DEBUG.
> 
> Why not, if users are aware/happy to use a unsafe image with various
> unfixed CVEs.
> 
> Removing the debug profile is as simple as this one-line patch:
> 
> -- >8 --
> diff --git a/roms/edk2-build.sh b/roms/edk2-build.sh
> index d5391c7637..ea79dc27a2 100755
> --- a/roms/edk2-build.sh
> +++ b/roms/edk2-build.sh
> @@ -50,6 +50,6 @@ qemu_edk2_set_cross_env "$emulation_target"
>  build \
>    --cmd-len=65536 \
>    -n "$edk2_thread_count" \
> -  --buildtarget=DEBUG \
> +  --buildtarget=RELEASE \
>    --tagname="$edk2_toolchain" \
>    "${args[@]}"
> ---
> 

The patch would be larger; the DEBUG build target is included in a bunch
of pathnames (see those original two commits).

BTW I still don't understand the problem with the DEBUG firmware builds;
in the test suite, as many debug messages should be printed as possible,
for helping with the analysis of any new issue that pops up. I've
re-read Alex's message that I got first CC'd on, and I can't connect the
dots, sorry.

Thanks
Laszlo
