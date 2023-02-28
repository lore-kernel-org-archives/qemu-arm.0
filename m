Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5964502ejc;
        Tue, 28 Feb 2023 08:58:02 -0800 (PST)
X-Received: by 2002:a17:902:db08:b0:19c:da7f:a237 with SMTP id m8-20020a170902db0800b0019cda7fa237mr3790530plx.5.1677603482577;
        Tue, 28 Feb 2023 08:58:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677603482; cv=none;
        d=google.com; s=arc-20160816;
        b=VYoXrxB/QLrGrOD5OeUF8L/HuglNorqww0oooLaQGNP8bp0iN4ovMwgJsIIzWmMbAJ
         FoQfm83HYuahrWFgy/mdgLTWyREaKdgvoR6tirvGHeorePL4dgXMT1epHM1kgwF+6JJb
         C008/biuGmeFqxZYXxd2hrbs5KCKy2dOrHB/agKt97jlsMoZ3cL3hDVzbL3v9g0omaH+
         TY30JjJjRaFr4t60zZx/vdIqmdFsNKeh4k8Gkr68LtYM4MiCaPkhLgUiMknqvqZB0NIo
         C8WGiuXCoTuAz4Luc87WvA/VhAOjUIIEYMkg8JsoWzngJuC2RGpnBZeOP/G06FkQU13v
         9dOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ZtMSoJo2/ZyjwdRWCBbepotffSNm+nwxVFjLTh+Tx08=;
        b=yD0XTqxBRqNKMx9E1OR3ntBZq6oh+hsMuNINDtM0fvBSM9Ywa7dFJlI88yv5MtxUjW
         8KISVR+aA35Uj3oDk4jgGTbqP/sZws0kpJo4NwdpwRDW3bY7s3HEuaLrCUjqZHwWceMd
         kLl3NJ1QPjaf/gtrbKojo0gISPrd7vWOf0o/k+WmMdXkkUYNvbPaaS+TdZvANnogxMMU
         p2vJJKo2maMI8XFxa6J/TztXIG8vajnYcNilxRu6DVkpUEbRG8dzOMNt+0RCMyJHBvPU
         +Y6fSSPXRnEzLocryCLXFHuMaapXOhUxypA8591OAFTuVACfUljBoSVCD3RUTtsqhijZ
         fJwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RWN+ArmR;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id z10-20020a170903018a00b00195fe5a566csor4069242plg.97.2023.02.28.08.58.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 28 Feb 2023 08:58:02 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RWN+ArmR;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZtMSoJo2/ZyjwdRWCBbepotffSNm+nwxVFjLTh+Tx08=;
        b=RWN+ArmRSoF3RqaIc/bG5HKYN8GqQFbTlJqpD8J7s/9B6QN61aZgGGWKFMc6a2g79w
         KJqn9iLRtx+zn11WIASPZu5yBM5TdDjbaGjTnL1SFAIEOHskGnjEjZeXpqPpy9V6n5p2
         r7+V8NqjySksekWlWPSSL7e6ScTvYON2coS2z4TIxMT/XzGJFNARBJobI3wyA54tVTJy
         4+NykP3xVNVLQ+bDSVh3IUKsGnLoIgjlbOtIeADpDK6klqd94TPH5PVodAtoJKkYqURo
         xk1ltaWPWxaGr1uf1su5Zt5E/T+lOxcnPBFwf8rxZx0hHx+VXAOHZ8qcAB7CIbnNZX91
         1vSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZtMSoJo2/ZyjwdRWCBbepotffSNm+nwxVFjLTh+Tx08=;
        b=geCUnZwBv7eNxqWOZMr4LUxXC2auHWOHXKnu5YFQ36rh6XLxex6SRss8AklGDPnetf
         qI9FxWI0zw6n2un3Vdbl+tymWuN2VPDHyCwWRwtNHW5FTYAsLh4+SVZtC4UCkeQ3io9c
         bU1SATP31+lLMsM3yPE5YVuG5xrA6thNBF/Q9M0zv0a6gn9/QrkOqGRUCZLQ5lkosREj
         Txqc1w06Or7fTSUPlXAK/HDF9TEUYP2tDZysUghXw3cbxxNHiEtYfiEKOrIg0cXJdTtf
         z44Q6coq/RV52ykXHh55EZ7L4R+FIIeSAgUcvPZYnn9U/19g+kHRdbs3qNFOSVNXLJEY
         7XhQ==
X-Gm-Message-State: AO0yUKWPxqvElynYt2ssNqIFfaH5eApxi1XBVW6573WSKDEBxyChzdO7
	brZUBYo+el3O6n6g++UGoCtRz+Ej
X-Google-Smtp-Source: AK7set90WOEr4dwJPaDBIlNSyAUO8ngoVSxZiL6FRqc82zyAHJhoPcIuRFbTPM4j0T9hhlTBR6YUKg==
X-Received: by 2002:a17:902:b08a:b0:19d:c9f:44f0 with SMTP id p10-20020a170902b08a00b0019d0c9f44f0mr2708127plr.32.1677603482070;
        Tue, 28 Feb 2023 08:58:02 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
        by smtp.gmail.com with ESMTPSA id v24-20020a1709028d9800b0019a8597788csm6869085plo.0.2023.02.28.08.57.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 08:58:01 -0800 (PST)
Message-ID: <ca5f7fba-7d48-2a35-2378-188d86ef2002@linaro.org>
Date: Tue, 28 Feb 2023 06:57:56 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/2] docs/about: Deprecate 32-bit x86 hosts and
 qemu-system-i386
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230227111050.54083-1-thuth@redhat.com>
 <20230227111050.54083-2-thuth@redhat.com> <Y/yY72L9wyjuv3Yz@redhat.com>
 <20230227150858-mutt-send-email-mst@kernel.org>
 <d1151c34-c2e3-50aa-b12e-f6c5cafed5d3@linaro.org>
 <20230228035958-mutt-send-email-mst@kernel.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230228035958-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: C1NmuSEylz8N

On 2/27/23 23:00, Michael S. Tsirkin wrote:
> On Mon, Feb 27, 2023 at 10:21:14AM -1000, Richard Henderson wrote:
>>> Removing support for building on 32 bit systems seems like a pity - it's
>>> one of a small number of ways to run 64 bit binaries on 32 bit systems,
>>> and the maintainance overhead is quite small.
>>
>> It's not that small.
> 
> Meaning there are lots of ways to run 64 bit binaries on 32 bit systems?

No, meaning the maint overhead is large.


r~
