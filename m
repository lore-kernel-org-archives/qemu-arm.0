Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp955323ejc;
        Fri, 3 Mar 2023 03:31:49 -0800 (PST)
X-Google-Smtp-Source: AK7set8FlErtuFoD/KO1Ebp6K+DptWbOzH97lEKgHxGPAl/+V4iKxOb4Xjn3iaa0lMOTEM+H/ghG
X-Received: by 2002:ad4:5bcd:0:b0:537:9e59:3997 with SMTP id t13-20020ad45bcd000000b005379e593997mr1873899qvt.51.1677843109195;
        Fri, 03 Mar 2023 03:31:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677843109; cv=none;
        d=google.com; s=arc-20160816;
        b=XE7PyABnp4BZ+aa3q9JFDkgZzdogKzdLHwaA4GlxMt8cVjoSv6SEVKxbykBR48lwqK
         6cMMAkv0VpXd9vZxHMHws4FjuL7RRWn9hCstk5s3KPprrZ9D8+Xh+zGU7AG0kduVT7ow
         O0Q47D+QvKMARosbt0qHQxbTqqc5H44r+xCGJl6WUKDhknJUA0VuoRMN6hw4bcnaixYn
         wpLwVwEtbz+tGf2jCdbJXf21AH/v26IzUwOx2hvxDa63EWHITUcmbEMP3yj7RFd92mn+
         5Mb8h3eNVD7r+tHpzW3gTH8P50APvRCaJzsjD4JlOoIv4b+HrvvAAPLohwXKq9DXycW9
         2l8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=2X96UUD+92YZeXNe71Re1yjjJOYn1e6yabwc3I03zXw=;
        b=dEAElJaTElXTfgdsIuUS0aGH/TQqV/rcnkaJb3IYhqm/smfFDbS9YxP2XbxasZxMbp
         gZ5p/AbntuMRmu1YbCvJXk0uxDSWe//eEkfL0I6Q204Z2S+JHuxFxkAwwInnS8WOB8DX
         pe8GJQaq/uz9pLS7BWZmA9ASymgpcm4twyzfLn+VcrN7ZHLDCFhyy6oGFnUz5pzTBTLD
         nAK57Lys/ACqRBNKR8gfNaZMJ8IxN7egdbMpf7/AxtNt0wmk2HI0wMdzX2EnIFBoIczH
         zrTRE9B5CK8XEbLXJit5ajCGADVxB/YolffC57AhS0GlrIHqkGQF5pp4PMdECx/CwaZ1
         s//g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=C3L4kly9;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id x3-20020a0ce243000000b0056ee98ad954si1371593qvl.315.2023.03.03.03.31.48
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 03:31:49 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=C3L4kly9;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677843108;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2X96UUD+92YZeXNe71Re1yjjJOYn1e6yabwc3I03zXw=;
	b=C3L4kly98cHUGnd+RQYW+SxzKenmzxiCbEGJsKYgXTat/K0mcEz3f1e0Xs9z8nbeuRk2GD
	AyE9pcmNIdOkuZbouCvKGtjiqH6EMm+gizMflZ59VjStote+iEexL9TYsCtwRzP8X9o8g3
	DSrXzqx4fx/ZaC80nDg68y7ilhHyssY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-107-9ROZfsQON9WR3yPGVvW6Eg-1; Fri, 03 Mar 2023 06:31:45 -0500
X-MC-Unique: 9ROZfsQON9WR3yPGVvW6Eg-1
Received: by mail-wm1-f72.google.com with SMTP id j6-20020a05600c1c0600b003eaf882cb85so862471wms.9
        for <alex.bennee@linaro.org>; Fri, 03 Mar 2023 03:31:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2X96UUD+92YZeXNe71Re1yjjJOYn1e6yabwc3I03zXw=;
        b=Bnj8goyDpkFEJpLl5SatGyQclGd9QDIq/LJUCxZ78WQY0AadqPKFQ/tvjeuuKKiqvq
         k7ULvijtxMzbeF5VyVXqvDigKEoHaf8//2GsHQ43R1PKGVda0bvzO2/8A2w4N8LCSZ/1
         k+0Mrx5rk8ULDTJRrMEyBgWfhq/CSKvgSCV0V89P36mnWHFZFXTpzHLpbXxC6DyYWH6A
         C/qtTudCFMrz54p0C0YnKUGrfDiSUR3g8YamAJHzDcdN7QeXvqoRCaVEfxlo6TgQadwk
         kTEFn/3lvLYMBnt7ttnqT7DS1UpFI1ZZWg4mCYAr2wDcd8reLLuTBeNDp+s32cU9Lw1a
         3Z+Q==
X-Gm-Message-State: AO0yUKVvSqzpa4LgDSmEAK6js+qfua/nObKsMP9Q2IVia9Qxpv/rHMIV
	IC/M1w7KGEHkuQaFFTEBd9XHANK1D9I/gwmk8910sr0F7XvyKM5+ZCJDQvHzw2o+IsJredAb2La
	FMsD9hkTkgNvkbXi+
X-Received: by 2002:a05:600c:5251:b0:3da:2ba4:b97 with SMTP id fc17-20020a05600c525100b003da2ba40b97mr964766wmb.19.1677843104685;
        Fri, 03 Mar 2023 03:31:44 -0800 (PST)
X-Received: by 2002:a05:600c:5251:b0:3da:2ba4:b97 with SMTP id fc17-20020a05600c525100b003da2ba40b97mr964749wmb.19.1677843104376;
        Fri, 03 Mar 2023 03:31:44 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.2] (ip-109-43-176-203.web.vodafone.de. [109.43.176.203])
        by smtp.gmail.com with ESMTPSA id d18-20020a5d6452000000b002c71dd1109fsm1926497wrw.47.2023.03.03.03.31.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Mar 2023 03:31:43 -0800 (PST)
Message-ID: <4e6512e4-b159-cbe2-5f74-89fab25208e6@redhat.com>
Date: Fri, 3 Mar 2023 12:31:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 4/6] docs/about/deprecated: Deprecate the
 qemu-system-arm binary
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Daniel Berrange <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>
References: <20230302163106.465559-1-thuth@redhat.com>
 <20230302163106.465559-5-thuth@redhat.com>
 <CAFEAcA8JZqKnSN98PoO684zS1ZADj_KkaWO2QMk3w9uXk2cdMg@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAFEAcA8JZqKnSN98PoO684zS1ZADj_KkaWO2QMk3w9uXk2cdMg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 1zFsA0HkSsaa

On 03/03/2023 12.16, Peter Maydell wrote:
> On Thu, 2 Mar 2023 at 16:31, Thomas Huth <thuth@redhat.com> wrote:
>>
>> qemu-system-aarch64 is a proper superset of qemu-system-arm,
>> and the latter was mainly still required for 32-bit KVM support.
>> But this 32-bit KVM arm support has been dropped in the Linux
>> kernel a couple of years ago already, so we don't really need
>> qemu-system-arm anymore, thus deprecated it now.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   docs/about/deprecated.rst | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
>> index a30aa8dfdf..21ce70b5c9 100644
>> --- a/docs/about/deprecated.rst
>> +++ b/docs/about/deprecated.rst
>> @@ -45,6 +45,16 @@ run 32-bit guests by selecting a 32-bit CPU model, including KVM support
>>   on x86_64 hosts. Thus users are recommended to reconfigure their systems
>>   to use the ``qemu-system-x86_64`` binary instead.
>>
>> +``qemu-system-arm`` binary (since 8.0)
>> +''''''''''''''''''''''''''''''''''''''
>> +
>> +``qemu-system-aarch64`` is a proper superset of ``qemu-system-arm``.
> 
> I think this is not quite true -- at the moment if you want
> "every feature we implement, 32-bit" the only way to get
> that is 'qemu-system-arm -cpu max'. The '-cpu max' on
> qemu-system-aarch64 is 64-bit, and we don't implement for TCG
> the "-cpu max,aarch64=off" syntax that we do for KVM that would
> let the user say "no 64-bit support".

Ok ... so what does that mean now? ... can we continue with this patch, e.g. 
after rephrasing the text a little bit, or do we need to implement "-cpu 
max,aarch64=off" for TCG first?

  Thomas
