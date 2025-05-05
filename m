Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2548709njj;
        Mon, 5 May 2025 09:08:12 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCX+/6iJgQu3Bl1PbqH11/vLrfY6badulyNfnCJG+Zd6DkJ1aGDGFKE5nkf72Zi1ChAmGdMh7hQEQczP7Q==@linaro.org
X-Google-Smtp-Source: AGHT+IEzIjGiwWsJxmbTEBd7AKYBrMXOT04KNQFOq8P5b83LjEFtJnYLR1hzgvSjQs6XDwngCnwi
X-Received: by 2002:a05:6830:8116:b0:72a:48b6:720 with SMTP id 46e09a7af769-73205f79cc1mr9769a34.14.1746461291863;
        Mon, 05 May 2025 09:08:11 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1746461291; cv=pass;
        d=google.com; s=arc-20240605;
        b=ZKtzwQZOxleh3MlA2pJU3u9CYm80lz0I98F3C7B0JV0i/2QTrBGV9MVkR8pl+Mne2I
         fGTbLIqhZVhiW2bQOzfJOCjSm/YLthyRSfizyjaVqG4c1806qUTxClRoAV3WnQxiy2a4
         lvXIxjyhK7nrGbU3TQtp9a2xi6rmUWC38R1w+nzMzVpBgECVG6dGhW2yv5VQ09SEK08Y
         lPBcDRoY3kIl7hWn1o03bih4e1y09amxThF1Q90Y/Hr6/0Rb+wg9h5faxCW2fz3PylIk
         3gIerrqZ4yND1kEmEUuz9WFG/fH6Xv4zzTaWIrTMNtLfLKiBnAbVnTKMZeMGPS6mIvd4
         inCw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=MRu4koP0AbX4A/Br7S0YZFP5LEHT/gY/8jVoiSA73y4=;
        fh=Y/EUEGFKKDkq1Nebli2hWBBdhRH7vNbZLK1lb4llGbg=;
        b=WjDnsaDGvSOyhOkIc20CBiVX9HEYvpnGIfHtzRJi3t1TtRMkwAJdtvWX5Z2nbhaxqm
         YZ8WIXwPSBkSwoeXUCZ+lo+tW+W36Whti8W/tHFF+nCQEgauTV/jhar/bkY3ibhCErNz
         u5K0e/GX2Kv1sN1g/4LkithmkY3yaopP2fprrR+BBaOg0sMg38UZ0/mFdHQ51aOtBBhP
         LhumIGmLZ8bOL9wBHfR1dVP4MwTE4Gd18Jewtyh20+hH2cSpsigo7SEgTqQXvrQS0EWs
         hKeXg3fat2yDKvT5jGnaIrpIU2lJDKsgCDv7ickL/rhVPvjI8/f/VTW15aPgreNT39x2
         ufAw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@collabora.com header.s=zohomail header.b="Nif/Sp1a";
       arc=pass (i=1 spf=pass spfdomain=collabora.com dkim=pass dkdomain=collabora.com dmarc=pass fromdomain=collabora.com>);
       spf=pass (google.com: domain of dmitry.osipenko@collabora.com designates 136.143.184.112 as permitted sender) smtp.mailfrom=dmitry.osipenko@collabora.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=collabora.com
Return-Path: <dmitry.osipenko@collabora.com>
Received: from sender3-pp-f112.zoho.com (sender3-pp-f112.zoho.com. [136.143.184.112])
        by mx.google.com with ESMTPS id 46e09a7af769-731d34fbcb7si4869877a34.219.2025.05.05.09.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 09:08:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of dmitry.osipenko@collabora.com designates 136.143.184.112 as permitted sender) client-ip=136.143.184.112;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@collabora.com header.s=zohomail header.b="Nif/Sp1a";
       arc=pass (i=1 spf=pass spfdomain=collabora.com dkim=pass dkdomain=collabora.com dmarc=pass fromdomain=collabora.com>);
       spf=pass (google.com: domain of dmitry.osipenko@collabora.com designates 136.143.184.112 as permitted sender) smtp.mailfrom=dmitry.osipenko@collabora.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1746461282; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Sa1AHpNozxVqWgAjltW6qxp7lBlPeZRnKiuBAY8gAlS03u/etuH+Ri85yMxbJH6EsbfXHVrLHF3Fds6ACQC7dQc4b2BlhxZ6SxLN+I6+EoSWvAFwqeP5QXhkIiRtG31+GXyoDxnNgA+d4mUHdwcVYtQ38kHz7ECZIGadQeZLizc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1746461282; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=MRu4koP0AbX4A/Br7S0YZFP5LEHT/gY/8jVoiSA73y4=; 
	b=fRwVyQX95iUeJIin9vW3kiFFvL32CLJ40r05wgXV2NqBQQ1fN+85lHBTKggQPnuTa6OwthQHl7/LfYc+RzrdAgBufSTsowh2w0myoHbWgppPOV227xZL0jvjVHxX64LHYkpFndQ0qyEXXEhONeHkAdSN8Laf1dIlh3L8m/GURqg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746461282;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=MRu4koP0AbX4A/Br7S0YZFP5LEHT/gY/8jVoiSA73y4=;
	b=Nif/Sp1ambmfvvmKirH5g1CoshiHECwOFpDvsQ7XxHVc3OR/9rDrGuRp8CzU3aQA
	d83ssG8OFVwUWitPeAcd9QHGCDN3vDbJOmwwraPjnKectIkXFjOJf4PWyVdyUru0rol
	21om7TSPt8S1uL+sPtPBJKLNeVvcHG+1YM/u+iEU=
Received: by mx.zohomail.com with SMTPS id 1746461280721249.7034648286616;
	Mon, 5 May 2025 09:08:00 -0700 (PDT)
Message-ID: <2e72ddae-2198-41ca-a31f-aab583ea4be7@collabora.com>
Date: Mon, 5 May 2025 19:07:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] MAINTAINERS: add myself to virtio-gpu for Odd Fixes
To: Akihiko Odaki <akihiko.odaki@daynix.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Xu <peterx@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>
References: <20250428125918.449346-1-alex.bennee@linaro.org>
 <20250428125918.449346-7-alex.bennee@linaro.org>
 <9115fa7c-ed94-449d-816b-a13125275dac@collabora.com>
 <cdc4d710-2b7a-44fc-b58c-78a81ca83b36@daynix.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <cdc4d710-2b7a-44fc-b58c-78a81ca83b36@daynix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-TUID: KiUUfbu4WfA8

On 5/4/25 10:20, Akihiko Odaki wrote:
> On 2025/04/30 3:56, Dmitry Osipenko wrote:
>> On 4/28/25 15:59, Alex BennÃ©e wrote:
>>> Seeing as I've taken a few patches to here now I might as well put
>>> myself forward to maintain virtio-gpu. I've marked it as Odd Fixes as
>>> it's not my core focus. If someone with more GPU experience comes
>>> forward we can always update again.
>>>
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> ---
>>>   MAINTAINERS | 3 ++-
>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 661a47db5a..f67c8edcf6 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -2636,7 +2636,8 @@ F: hw/display/ramfb*.c
>>>   F: include/hw/display/ramfb.h
>>>     virtio-gpu
>>> -S: Orphan
>>> +M: Alex Bennée <alex.bennee@linaro.org>
>>> +M: Odd Fixes
>>>   F: hw/display/virtio-gpu*
>>>   F: hw/display/virtio-vga.*
>>>   F: include/hw/virtio/virtio-gpu.h
>>
>> Thanks a lot for stepping up!
>>
>> This reminded me that I wanted to propose myself as reviewer for the
>> virtio-gpu patches. Will do it soon.
> 
> Thank both of you for stepping up.
> 
>>
>> Akihiko Odaki is also good at reviewing virtio-gpu patches. Wondering if
>> Akihiko would want to be added as reviewer or co-maintainer of virtio-
>> gpu?
>>
> 
> Yes, please add me as a reviewer.
> 
> I guess it would be better if Alex add you and me with the next version
> of this patch or add follow-up patches to this to avoid change conflicts.

+1 Feel free to add us as reviewers in v2 of this patch. Otherwise I'll
send the separate maintainers-update patch along with nctx v12 patches.

-- 
Best regards,
Dmitry
