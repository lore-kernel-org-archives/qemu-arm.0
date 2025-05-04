Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp1785591njj;
        Sun, 4 May 2025 00:20:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXoRr4LVFlunS5z6OMmS5dlvj60VR16iUw71awGp81jug63OhYHc6/bD3L1xbHmz4ble8t9qkqESqwyfA==@linaro.org
X-Received: by 2002:a05:6a00:1c93:b0:736:5725:59b9 with SMTP id d2e1a72fcca58-7405890a9b3mr10615011b3a.2.1746343232188;
        Sun, 04 May 2025 00:20:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746343232; cv=none;
        d=google.com; s=arc-20240605;
        b=kq8jGEuwA+UJgluNIWJFRf0iQHlHIrL49TtYIU7O5jWaihd8dJlG2f0VinjJ3ZGqcZ
         oUsAgbapQX0fj0nNh8LTHjv2dqiSfMu5zEXHuyKC3SIOQ8voSCd4xQy0es1IsKdL7BOH
         X8rbW9a4az73wncGBYVknbDbgqVDahCXmKYXOOg1PuT0/veovlk6B6W3treJbKYB85Nd
         y7YzOeBH1+Rn/5BIJRVDe2XgEQ44wx0oUHPBzvgaedBNOS3D0B4rt2Jn+k1IPMZU9SYJ
         TVe05GojUNTlqDme65+wHppxeKKnLo4YjnWoLDXEoJGN/UE8xprjYEOwCbHL7CLFKzet
         j3WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=klhim48JAtRn+YzgbF8ISmg1WnEvPFtNfMRMCjm6AqI=;
        fh=jfnx88ytUFg9bWBgpnDb4MIECX4TC6xFP13DrLxH/Ko=;
        b=WtUl9+hG8PvAFCoUHIog4HXSFO/CdRWvfRrnpz6bNFIvnp5cv7fQfbxdV0hlfVeKO+
         cD34BkaPf/gT2dP1YF7xE9AS8Vg1Ox0BTA7WnI2q+oXyAsT3WqI9t8yrHIsLHl8i7ft2
         DAjrk8eus9TZhLnx7X/UxCL0BOtQ0qPU23Nex2QPukxIWhYTHrcx3TagI63m1nwxuNTI
         aKYHQXTIqiN2j0wxusTFr1h+Fu8N7jcK57+lOptyCLplre2w3WsfgRAiOWdTPE3giCwY
         gOVuZSiuT3id1GLhQVIkmck831y+7VxqlkNFYkD8FiL0fqmLI3M0wh2sf7k686/EzS1y
         /ZPQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=ljvT0ptr;
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404eeb1379sor3055886b3a.1.2025.05.04.00.20.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 04 May 2025 00:20:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=ljvT0ptr;
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1746343231; x=1746948031; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=klhim48JAtRn+YzgbF8ISmg1WnEvPFtNfMRMCjm6AqI=;
        b=ljvT0ptrquYnTOGkRYhHWHYMca1PaFHF4ma9ot4zVjJFYnmd8FTfpPnR9xiNXmiG9E
         HLxgNdtFvUoM3zf0Ofvl/c5Qf40V+62+79W09CJiG4TyUSrg13SQeAeVDohAxu1uTg+T
         wfQozne2X7V/ziRC5S3BUqkRWOAGF1XxmW6vtjobdArBfYlIB3cJuEOU1OuuJD36bcYQ
         xtOqfUYlsDypRAqUzeYKErmsx4gm/pwFi6njpPnjNK0btyRlbS070nWtmWrsQ00VjBqL
         bCVpfU0nZYIfe6z7OhCcZwpFRyJkg29AAX56WZgCiL5z/M8kZsiqjUPacBfLNxMKe5jN
         bBYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746343231; x=1746948031;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=klhim48JAtRn+YzgbF8ISmg1WnEvPFtNfMRMCjm6AqI=;
        b=HxT3eBW+UVet/2IGODvIjPYDLEw4EhJWOT3XfZ5+dy3jkRYjMt9B3Dc2+YxistlHF1
         aOm7/JP9TGd6PFOb6+ymSAtZYoBnq0QLntFcezRYqEwUKpG41KfSYzD2iQZF0AncTFpm
         eCE5mKLXcwidfZd+IJ7SgC1XpxvaHjpsmxWEV0zn7SPc61ajm7gvS7iPUy2ygsSwmMeH
         +aoPHylMDlcLrAasUqScH3FkcPks2w/33YY4LDdwrnD7vaBwHeDRYn7X0D5qBH+tOvZA
         DfPyLk33SdHI14rgyvdSenjbhdRZEj6FbDpVD5JN2lrjzrqlndlZfvglACfPaplYMAnM
         a1ig==
X-Forwarded-Encrypted: i=1; AJvYcCX8JTv0NLy6qA1Sp5pAhKQzidHTciuGvEKdm9dzTWH7yCbQCyiaExwa//gbHsz/Q2JY5gBCK5MKA9TggA==@linaro.org
X-Gm-Message-State: AOJu0YyqGHXHEtmdNKUPhkJAGiW8ey0aP+AdnKLIP6ctaN2Kqs9ltMUq
	HjhQyL7gf3huH0QU04O8j29cxhQcTxI5Fs51VA3qDKEmMfqgGe6j4rdOAJed504=
X-Gm-Gg: ASbGncuNrSWNXnA5ir1Ud731BEalNuxA4uIk/027JK992uyHpKc2lGOZNfVv/vJvPM9
	pAjap/Nn+c07oGygDiKhYJEYqOqDINBqE+4SDnustdLHGsb1yKrHA/blVwO6SAAQgvPakUnuRs+
	IN0GzzHPbrQw/wSRKH+3n7dHVjNQQHy+C/GNsmrIfHqoz+Tb+6YOvaVOzGvPIjBUnz7wxdJVUSk
	cYj1q3/CeFf83yqMjWLK7o6omDLJotn8oyAINKK2z5Vh9rbv9CIEfbcyiThA+1KXw+sNH0/B/OR
	D/O2Oy8kozq3dPU9Rn+RRfwbwLPxjqPCOLwTYPiK1aNCyBAq50OUkA==
X-Google-Smtp-Source: AGHT+IEvnN5gmBvK/h7zKWBCj1UzCVE+Vcgk2ChyTHmZn6CSFOJVGZtqauCU3yDlscfs2CG6QBwvPA==
X-Received: by 2002:a05:6a21:900e:b0:1f5:6a1a:329b with SMTP id adf61e73a8af0-20cdfee9a76mr15210766637.32.1746343231532;
        Sun, 04 May 2025 00:20:31 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from [157.82.203.223] ([157.82.203.223])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-740590a489asm4542774b3a.170.2025.05.04.00.20.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 May 2025 00:20:31 -0700 (PDT)
Message-ID: <cdc4d710-2b7a-44fc-b58c-78a81ca83b36@daynix.com>
Date: Sun, 4 May 2025 16:20:26 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] MAINTAINERS: add myself to virtio-gpu for Odd Fixes
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
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
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <9115fa7c-ed94-449d-816b-a13125275dac@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: joRowxBuCGvH

On 2025/04/30 3:56, Dmitry Osipenko wrote:
> On 4/28/25 15:59, Alex BennÃ©e wrote:
>> Seeing as I've taken a few patches to here now I might as well put
>> myself forward to maintain virtio-gpu. I've marked it as Odd Fixes as
>> it's not my core focus. If someone with more GPU experience comes
>> forward we can always update again.
>>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> ---
>>   MAINTAINERS | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 661a47db5a..f67c8edcf6 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -2636,7 +2636,8 @@ F: hw/display/ramfb*.c
>>   F: include/hw/display/ramfb.h
>>   
>>   virtio-gpu
>> -S: Orphan
>> +M: Alex Bennée <alex.bennee@linaro.org>
>> +M: Odd Fixes
>>   F: hw/display/virtio-gpu*
>>   F: hw/display/virtio-vga.*
>>   F: include/hw/virtio/virtio-gpu.h
> 
> Thanks a lot for stepping up!
> 
> This reminded me that I wanted to propose myself as reviewer for the
> virtio-gpu patches. Will do it soon.

Thank both of you for stepping up.

> 
> Akihiko Odaki is also good at reviewing virtio-gpu patches. Wondering if
> Akihiko would want to be added as reviewer or co-maintainer of virtio-gpu?
> 

Yes, please add me as a reviewer.

I guess it would be better if Alex add you and me with the next version 
of this patch or add follow-up patches to this to avoid change conflicts.
