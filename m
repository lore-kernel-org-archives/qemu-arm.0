Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp958806njc;
        Sun, 9 Mar 2025 23:51:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUYTIGMfjUbXRJ1Q+ObvtuDt6nEw5IQH1gHdIH7a1Kpti9x7U7YJYKgYoxFrbGMKLujEnhP+I3wRDdwGA==@linaro.org
X-Google-Smtp-Source: AGHT+IH3aO+A2Bvao37ClKxJSu3cK+vG7TEaIr9ZncX6Dpd4uMF7lTYoV90xWMKa0Iz6AM8BBgID
X-Received: by 2002:a05:6214:500f:b0:6e8:fd03:abdc with SMTP id 6a1803df08f44-6e9005fc9f0mr183941676d6.18.1741589464796;
        Sun, 09 Mar 2025 23:51:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741589464; cv=none;
        d=google.com; s=arc-20240605;
        b=ZiH3g/3vyGDOw4/Ck3BQTGU8wslHUDpRrAxLCGG4eWTsTxfYSJXfJlSe1eabK6/foe
         xx4lnlBTX5dTw1vaU0zec4EUQ4lXWfW1OuCZnND1zUyy5Mns9lOVMvyW4SOHKAPBRImb
         /5QBEem7rW5xCcDPBHTs6IU0T4alEcSj1eSjVNe2i8EPkIW3iv1szr8YYVXi2sivIWyg
         gyNG6itoq14O5W3FATMtHleidvgKQbTsk0+oySkBfHDGwsi2MPwRS05pyctH/vXNwts+
         xR8jAG1w9xtfJ9sEOEquG7uEqIPH5RuvHyVce34tqTBiauNgWeQp+wp+A3GavACE7hVo
         h2ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=8GBRA05wdnzbQG3xk8B3B0joQGCEbAwT9Wh72qsSn38=;
        fh=epGtd3aQgjR6ZXXSNHGoA3abtO+nqZStvy+3NZR6mX8=;
        b=MKmprgjpW0H9VqJ8iylv3t4IxhV50vqsZqi1aaHugi3Mwr4zQPGXPmpDEs/AU/GVKQ
         hkWf0zsq4ghKb3n7WKxc2EcJaa8wk9dsd5E5PvmaO3NpWAmpyvhXb5pl3DnAJYRlhukU
         HoAjkR2sIdqhnqz7KBY6u97mCfW3cMl68NVi1M9weZwfuKoRJeFpR02quauOCQJtoRaz
         +aFvZnblp+3EJBWH9DlQ9XC6kQuU0mxcDLA07+9fZbUTqmmzyNZcP+GbURD+YAz4v9Az
         0rhbuFrHNmCtBv1oUHa4dcHkeHC0KCmoaSmYoCHFo0Ii9YdBaK6PXYt2FlJQNmrlosXr
         6h8w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PdWtHqxN;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e8f707cc5csi87052226d6.49.2025.03.09.23.51.04
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 23:51:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PdWtHqxN;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741589464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=8GBRA05wdnzbQG3xk8B3B0joQGCEbAwT9Wh72qsSn38=;
	b=PdWtHqxNm+gjE5yQwKexBOVTg+kMTfpCHBW+5c0zK9sW6hnEmy9ClhuO+9rnfa0lHiTLjm
	yg+MLBWejHBMtP0lwznjGUbmIXlrKLSKAwXj7QrsbelaBtlFLueYf8cqFLfSsAOeFSCo/C
	KBiy70JrwVxgrFMTRp8i2rqRxgzHDBI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-8DdtCuUvN4ur9dla6GqWhA-1; Mon, 10 Mar 2025 02:51:02 -0400
X-MC-Unique: 8DdtCuUvN4ur9dla6GqWhA-1
X-Mimecast-MFC-AGG-ID: 8DdtCuUvN4ur9dla6GqWhA_1741589462
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5e5edf8a509so2121251a12.1
        for <alex.bennee@linaro.org>; Sun, 09 Mar 2025 23:51:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741589462; x=1742194262;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8GBRA05wdnzbQG3xk8B3B0joQGCEbAwT9Wh72qsSn38=;
        b=a27QC7VfHSDGcAEjt53n6oHJhyXdndSZcsbh5rR853M859zMb8t1Upp6FG1sRO8bEu
         f4bJdTP1x7gg7hyTNFf8inICeH/YX9WdqPtXJtK9SPA6prd3oWvqlMSZash68bg63W8X
         vvd0xBqkmKiNY9XMHDcWjeBfHoz4gMGVpZTZDVPXLXD0+Z58r/oVYZCDPPWcI/ZAmRTQ
         qGbR6ZPCf21KTVAQzOBDxgrUZfv1ghvymO+fjFLAXOpOwsTtsnr2K66ZLy3hQbqm46G3
         PTWgqdg3tp/dEbira9Bnfp/kWWQ7qOX0XsekkmCiZEb9ugXQwgpLrjaL+6Jw865YnOFn
         locA==
X-Forwarded-Encrypted: i=1; AJvYcCWCsafZnfJheDdgxffmw4hTkcIMJrxfLZB9O7PdU0x8zmTnHskEXTU5C5wT5qx6GZMLhtzT2xcvMwP9Dg==@linaro.org
X-Gm-Message-State: AOJu0YzQNPoBsaWo2+4G3gEWLAqIAhzPbDFg9GCwwoWa9X9TQAy0TsHh
	0lRGmvO11IpXxsgkqXIqhejNFZ1hP09zGZsUiWdCTXees+9MleaLoveZ47j3E0PZNrArSDHRMdt
	1We0SUo4grKKi9db5j4S4c+7uklKrR7zURqeQl0cjkLupKpmH2GgfyA==
X-Gm-Gg: ASbGncscVylgYhrnwF9qWOcg6INDPFDgECWOaw8phPc6+7A6DBMoQfVJ5n6aXK3LOMJ
	/2OezRQ3Zody5LKYL0xO355qYtJ67k0PU/9GO+aCwAUY//bVXTwKsWZ9iyC0CXJE7NuBOfWYaDi
	ceqjrWhylHP1Yg3HGSrusNoqL3OXDsame4670z0Knrzvv18ElSmIhfdsKFD1jS3hyjo6kpeBKNm
	W2qYvQ4uaiWgooI9YwFSWzprLp7Z14NCzzEBIYD/tP6UnmLeOuUDV/7QLmdwwrhLbRQpwcIB8UX
	Aihf4hFtZwf+wsEvEv4j+l+50y7zBFprjoCdG+a45Kzs4Ys=
X-Received: by 2002:a05:6402:210c:b0:5e6:e842:f9fa with SMTP id 4fb4d7f45d1cf-5e6e843093emr3055294a12.19.1741589461714;
        Sun, 09 Mar 2025 23:51:01 -0700 (PDT)
X-Received: by 2002:a05:6402:210c:b0:5e6:e842:f9fa with SMTP id 4fb4d7f45d1cf-5e6e843093emr3055277a12.19.1741589461370;
        Sun, 09 Mar 2025 23:51:01 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.7] (ip-109-42-51-231.web.vodafone.de. [109.42.51.231])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5c768f9a4sm6371157a12.71.2025.03.09.23.50.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Mar 2025 23:51:00 -0700 (PDT)
Message-ID: <d74d3ff3-3830-4682-87e3-a42ed57068d9@redhat.com>
Date: Mon, 10 Mar 2025 07:50:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] hw/s390x: Alias @dump-skeys -> @dump-s390-skey and
 deprecate
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 David Hildenbrand <david@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 qemu-s390x@nongnu.org, devel@lists.libvirt.org,
 Eric Farman <farman@linux.ibm.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Anton Johansson <anjo@rev.ng>, qemu-arm <qemu-arm@nongnu.org>
References: <20240530074544.25444-1-philmd@linaro.org>
 <cb4028fc-9596-47f3-9468-f8912dd48aed@redhat.com>
 <Zl20rAjHLJlZkwxE@redhat.com>
 <fda186da-2e31-42d6-8dd6-0ea3141a73e6@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <fda186da-2e31-42d6-8dd6-0ea3141a73e6@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PevGk3g3OT1Jzz642VNPpIqcXut_1Exl5pshKxxX6Gc_1741589462
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: IkTtoeJgfvmJ

On 09/03/2025 19.55, Pierrick Bouvier wrote:
> On 6/3/24 05:18, Daniel P. Berrangé wrote:
>> On Fri, May 31, 2024 at 06:47:45AM +0200, Thomas Huth wrote:
>>> On 30/05/2024 09.45, Philippe Mathieu-Daudé wrote:
>>>> We are trying to unify all qemu-system-FOO to a single binary.
>>>> In order to do that we need to remove QAPI target specific code.
>>>>
>>>> @dump-skeys is only available on qemu-system-s390x. This series
>>>> rename it as @dump-s390-skey, making it available on other
>>>> binaries. We take care of backward compatibility via deprecation.
>>>>
>>>> Philippe Mathieu-Daudé (4):
>>>>     hw/s390x: Introduce the @dump-s390-skeys QMP command
>>>>     hw/s390x: Introduce the 'dump_s390_skeys' HMP command
>>>>     hw/s390x: Deprecate the HMP 'dump_skeys' command
>>>>     hw/s390x: Deprecate the QMP @dump-skeys command
>>>
>>> Why do we have to rename the command? Just for the sake of it? I think
>>> renaming HMP commands is maybe ok, but breaking the API in QMP is something
>>> you should consider twice.
>>
>> That was going to be my question too. Seems like its possible to simply
>> stub out the existing command for other targets.
>>
>> The renaming is just window dressing.
>>
> 
> Working on single-binary topic means specificities from every qemu binary/ 
> architecture has to be merged together. Despite appearing has a bad thing 
> now, it's definitely a step forward for QEMU, and will allow to enable new 
> usages.
> 
> The hard way is to trigger a deep refactoring, involving lengthy 
> conversations where compromises have to be found ("let's implement this for 
> all arch"). The pragmatic way is to eliminate obvious stuff.
> 
> This command is specific to an arch, so renaming is a good and obvious 
> strategy. For the backward compatible anxious developer, another strategy 
> would be to simply declare this command if the running target is s390x. But 
> then, you create a precedent to do something that should not have existed in 
> the first place. 
> 
> +1 for the renaming, and hope that users of this command are able to change 
> a line in their script to adapt to the new command.

Sorry, but no: We've got plenty of other target specific commands... 
rtc-reset-reinjection , query-sev, query-gic-capabilities, just to name some 
few. So unless you provide a patch series to rename *all* of them and 
deprecate the previous names, I don't see the point why changing just one 
single s390x command is necessary.

  Thomas
