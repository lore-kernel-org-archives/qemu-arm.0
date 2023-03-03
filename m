Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp861361ejc;
        Fri, 3 Mar 2023 01:48:22 -0800 (PST)
X-Google-Smtp-Source: AK7set90N5TPlqArwE+RZonmuMswuDG87YtjNzvk+gkATV0KRpACpIBXupTyUzhWhPH/ixCWjoTO
X-Received: by 2002:ad4:5cc6:0:b0:56e:ae9f:a503 with SMTP id iu6-20020ad45cc6000000b0056eae9fa503mr1809712qvb.31.1677836901874;
        Fri, 03 Mar 2023 01:48:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677836901; cv=none;
        d=google.com; s=arc-20160816;
        b=jN3GmhhuRXs3aPH2jsiTmCLJrCC9JSdH20fdlEx2H9nxLG2yrneDtSAJkHgzK1iDTV
         cSyp7IcqA4bj6dTIBSf6uY+NjWnGePsATIzLeGhyEjPrbhurMk3HCkY8pM5UFX9LJJPa
         GOor/wtUwPMt7Q5P/qeL+Vo5DYrNQI6IVQikvVg1PyzkFoOV0cXn5Ej25B6OXp69wpDZ
         wtq1NLk11kjhvVH8LBveqhPnz/16fW1ZP7iu9RwMHuMZBOwL9MlTA3zmneH62WiRgKiV
         /QS457/+6ALg/O2+hEllhW3Y+a1y8qmTiNlYPuKBtrtVTQlq0c3FguFzD/grdhynKIby
         k+Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:subject:from
         :references:cc:to:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ItWIX9zRhNEcSply1kPR8eT5f45DN4cFJIRFCI59ebs=;
        b=QTCUFDYxASnNkcCBD4ROTTEWzFl05LBzAD8sodr1+jqSmXuQ/8yibjYnrfg3Baw2u9
         DS3r4DpL7TFDHZTVcPqNVd2XR88Pw0FfGgudaD0W/dKtwtRwYKHpsGtc57yk98sV5YPp
         eqI2IBWNygj/Fe19lFAjHma6uh3KovwpagdSEPvPHTjgNLcmVyE4NNO7w9VGXnvRmsfM
         ZoLZRe5oRADr1Wuk07GAl4hkkWMSn7BmarOKP6F8yyjxj5RT9W9gKfBNK6lA8ZJlRmC3
         p1tk2oZhUMTlnNO+S/pt14QRheMfyq1S8KtKiTXCg5W1H3xRwz9f+Zj/waI1Y6UB8Iyy
         Ll+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KXyC8oI9;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id bj29-20020a05620a191d00b0073ba68d0664si1512605qkb.567.2023.03.03.01.48.21
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Mar 2023 01:48:21 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KXyC8oI9;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677836901;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ItWIX9zRhNEcSply1kPR8eT5f45DN4cFJIRFCI59ebs=;
	b=KXyC8oI9HcEzE09nMKQmSKFUS6JQ07OjC0FosGuZNHnc7bOwYjVsOFOpSlJ5NBLcrlHGL1
	sEhwp8QRSyn1SgGGQl9M58QIv+D7dJWQEI8iD243ki4NNAq+eZHPFPY4dloAyltbmFvY+l
	xr1NoAPo2meVjkTgs850MYfM5dKOYuY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-606-9c5_wrw9OR21T08S0TJ7HQ-1; Fri, 03 Mar 2023 04:48:19 -0500
X-MC-Unique: 9c5_wrw9OR21T08S0TJ7HQ-1
Received: by mail-wr1-f71.google.com with SMTP id d14-20020adfa34e000000b002bfc062eaa8so296028wrb.20
        for <alex.bennee@linaro.org>; Fri, 03 Mar 2023 01:48:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ItWIX9zRhNEcSply1kPR8eT5f45DN4cFJIRFCI59ebs=;
        b=YRkxL3LUHoZPMT5r5IOwon5coYcJ/cXxAyAJ5wa+Kw4YV1359Dr4vKYDdWCwAbb49G
         AIj4CYHMJfOuCLCJW4l4AWvIVIHi+9diOeI+dTapLcSY696uN3AN29aozW4xOZQtjdT6
         S6dkxktvVWgihtYR8KZ5umqVxPCvN+CLNjOcjPZx90HKPsTRFFhwkzdry6z8WPDeNjjY
         31eviQ7j/lBxMe3YCn4ynNWtDlu8pYP+NSj18VM2F16xbfCVh5K52T+XMBxPPmTHFah0
         lU893qowFILVTy+ni2npx3aG7Rwew0IM36QeC8yclZfftpz9GA1gKi2Y/SkYGDfqPQtP
         Z43A==
X-Gm-Message-State: AO0yUKXcG4K5oUbp+nhkU8AG4IVw4HOhKv95paB04cgCwrlYnQgsjiiE
	T3W9xLWK36PPUQV/l36plA1ZkCUjZn+bf7v6ySHYdA9Uq+7RKguqy5hksolXji5IRcF57gL2GVZ
	OcGia7k+jmPaiONJu
X-Received: by 2002:a05:600c:4509:b0:3eb:29fe:7343 with SMTP id t9-20020a05600c450900b003eb29fe7343mr904163wmo.33.1677836898782;
        Fri, 03 Mar 2023 01:48:18 -0800 (PST)
X-Received: by 2002:a05:600c:4509:b0:3eb:29fe:7343 with SMTP id t9-20020a05600c450900b003eb29fe7343mr904148wmo.33.1677836898529;
        Fri, 03 Mar 2023 01:48:18 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.2] (ip-109-43-176-203.web.vodafone.de. [109.43.176.203])
        by smtp.gmail.com with ESMTPSA id l26-20020a05600c1d1a00b003e20970175dsm6271925wms.32.2023.03.03.01.48.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Mar 2023 01:48:18 -0800 (PST)
Message-ID: <6c1f0d05-924e-854e-0175-5e345945e086@redhat.com>
Date: Fri, 3 Mar 2023 10:48:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Daniel Berrange <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Helge Deller <deller@gmx.de>
References: <20230302163106.465559-1-thuth@redhat.com>
 <4bed38c3-ab4f-cd32-05a4-afa090ad8b9a@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 0/6] Deprecate support for 32-bit x86 and arm hosts
In-Reply-To: <4bed38c3-ab4f-cd32-05a4-afa090ad8b9a@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 5BLLruXV0u4L

On 02/03/2023 23.07, Philippe Mathieu-Daudé wrote:
> On 2/3/23 17:31, Thomas Huth wrote:
>> We're struggling quite badly with our CI minutes on the shared
>> gitlab runners, so we urgently need to think of ways to cut down
>> our supported build and target environments. qemu-system-i386 and
>> qemu-system-arm are not really required anymore, since nobody uses
>> KVM on the corresponding systems for production anymore, and the
>> -x86_64 and -arch64 variants are a proper superset of those binaries.
>> So it's time to deprecate them and the corresponding 32-bit host
>> environments now.
>>
>> This is a follow-up patch series from the previous discussion here:
>>
>>   
>> https://lore.kernel.org/qemu-devel/20230130114428.1297295-1-thuth@redhat.com/
>>
>> where people still mentioned that there is still interest in certain
>> support for 32-bit host hardware. But as far as I could see, there is
>> no real need for 32-bit x86 host support and for system emulation on
>> 32-bit arm hosts anymore, so it should be fine if we drop these host
>> environments soon (these are also the two architectures that contribute
>> the most to the long test times in our CI, so we would benefit a lot by
>> dropping those).
> 
> It is not clear from your cover that the deprecation only concern system
> emulation on these hosts, not user emulation.

x86 ==> deprecate both, user and system emulation support on
         32-bit hosts
arm ==> deprecate only system emulation on 32-bit hosts.

I tried to say it with the sentence "there is no real need for 32-bit x86 
host support and for system emulation on 32-bit arm hosts anymore, so it 
should be fine if we drop these host  environments soon" ... not sure why 
it's unclear, but if you have some better sentences, I'm open for suggestions.

> I wonder about tools. Apparently they depend on sysemu now. I was
> building a 'configure --enable-tools --disable-system' but now it
> is empty.

I just did a try in a fresh build directory, and for me it was working: it 
builds qemu-img, qemu-io, qemu-edid etc. just fine.

What was missing in your case?

  Thomas
