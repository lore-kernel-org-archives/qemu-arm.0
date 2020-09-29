Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp4823799lfq;
        Tue, 29 Sep 2020 11:27:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOKwVQ3Yx8bi0CUBBu4m8lklEfJC8IRlAVmj5bt/EAZ5IS7PNyaksD/XUjwrLFeeedcp9I
X-Received: by 2002:a50:f1d1:: with SMTP id y17mr4563792edl.231.1601404023977;
        Tue, 29 Sep 2020 11:27:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601404023; cv=none;
        d=google.com; s=arc-20160816;
        b=hpmFD8F5JT8Zr6TkAq7ZHuQV0jFH2YOtPw7mBU2dFEzq7oUdq4MQrYKs8Z/4qWJXw6
         G+eCcAV6cpMlodngd1zYK2eMiVhwJ0vxWdcB3Mb9Tlq49RhYiNz+HCkBC217ZypXwLKf
         ZimOUOMByKLcuJGSw9B0kduCU4ysLQwhkMua33H9fx/yFjq7ZFn8WDoov9oj9+Hn5XP3
         HBlmRgQCjVVsBsXr23ys127Fsopt59rNnYkPviqw4y4cyNDuq+tQ1p3QAmKisnwUDjRq
         Y2ACNFopp6FRAyrlxoknz8Yyxu1EHWfWoFP29fqYPonJNW6Z16Llsyh7tG/B8SMm4NJJ
         NyrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:cc:to:subject
         :dkim-signature;
        bh=Jybl1D4ZSZouXyfbqfXTgUYFscYvt7JB+EcoN7nDhLI=;
        b=w2GjKx+6F/iQqods+TVze9JI/v1QncIlS9152ECLrzPVlxXQh222NAKIHRivgJksV1
         1p596IJz4nVuGzkc1UJsNJwwG9+8j7bX7FOAh9HNlx1v+Jz0DIaM/DfqQy12RNa/nHmu
         OUHuNoeN2/Jyf4lxCNjwsjAAg4XDxDNSXH/rn61MAnib091O339J8OlEW6sMSCjFVV00
         RD13ReSxCxzXeLOH2SX9J/oSNJjzZuc8VH4CyvwiuQdtPUpAeXifYm0T/uq8vkxDlzEd
         6dhuWvwrvrLhBPlx821mKu8HxR7AcAlhjS3Af7pX7wSwD5FFNUS6YrXEKkxbN4Pb221L
         95+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YFzBNynw;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id s18si289940ejr.128.2020.09.29.11.27.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Sep 2020 11:27:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YFzBNynw;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601404022;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Jybl1D4ZSZouXyfbqfXTgUYFscYvt7JB+EcoN7nDhLI=;
	b=YFzBNynwrptnLU0NGJECKNkyv8DZs8y3ghDVndK2qQUSKRZOrBOXbqEefQJ9MqEgI87Xx5
	PrgDDHaWeTJvqsWxSqTZlKbwDhei3D9tYDruDDiEV7x/tgb4zXsfk1Q6ybciZALv5GXFKG
	ZVCzieFhMmLLuVFXHs0c2zYrLgxzSEY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-BfyeyWv4O0aK7-3eE3M8_Q-1; Tue, 29 Sep 2020 14:27:00 -0400
X-MC-Unique: BfyeyWv4O0aK7-3eE3M8_Q-1
Received: by mail-wm1-f70.google.com with SMTP id c204so2029741wmd.5
        for <alex.bennee@linaro.org>; Tue, 29 Sep 2020 11:27:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Jybl1D4ZSZouXyfbqfXTgUYFscYvt7JB+EcoN7nDhLI=;
        b=R7agYsWjUUKWsGxCcqtTjQXuR0DzfqDl+CqcLkG1M01nafokb/SmblbKpJs7UHyvpj
         FtGcHtUuISi3siT4pwa+abh61cjISEOp6BopdKrMWfCc1cfwLO6a7aM/J3olFOLfAnfe
         3D0/gu4KXnkm+UHx0eiO2SILO2XnMwZ0Lhd9tlJ7nMlPTyv1Zh1Gsu9Jk35MN+eqN1jy
         gK7jywDnR27EsOvg7By9ndzb3LOcse1c5qnp2G1Iqv0oRTdqwtNFWAKS9dnmARaa5iiF
         WqPsfPcyzUMIj03eXPrEVJ2atmAY72EZOkF4Y2NfhwbV4DeSNPsEE85PTD8iOfk0gTLn
         wrow==
X-Gm-Message-State: AOAM533vfXMTWUksloebid4VX4fpjaWAlBGKUgIcjpHlGkVdMzSm7LMy
	sYqG1gGrk7M7R6Tfb5og/OgFiMVW6kpWdGKUzJV8CrZb1LSZSsOJFRiAK7r5pRCjaiBuueWZcOe
	1zZoT/kkimwIKmPH7
X-Received: by 2002:a5d:60d0:: with SMTP id x16mr5759665wrt.196.1601404019393;
        Tue, 29 Sep 2020 11:26:59 -0700 (PDT)
X-Received: by 2002:a5d:60d0:: with SMTP id x16mr5759650wrt.196.1601404019236;
        Tue, 29 Sep 2020 11:26:59 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (74.red-83-53-161.dynamicip.rima-tde.net. [83.53.161.74])
        by smtp.gmail.com with ESMTPSA id n14sm6199885wmi.33.2020.09.29.11.26.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2020 11:26:58 -0700 (PDT)
Subject: Re: [PATCH v3 17/19] hw/arm: Automatically select the 'virt' machine
 on KVM
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 kvm@vger.kernel.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20200316160634.3386-1-philmd@redhat.com>
 <20200316160634.3386-18-philmd@redhat.com>
 <d0842e82-8640-5903-e59b-99963584b89a@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <34599763-9e6f-cade-fd23-c6efbac60a94@redhat.com>
Date: Tue, 29 Sep 2020 20:26:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <d0842e82-8640-5903-e59b-99963584b89a@linaro.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: lbHVIM8ccbnv

On 3/16/20 9:06 PM, Richard Henderson wrote:
> On 3/16/20 9:06 AM, Philippe Mathieu-Daudé wrote:
>> When building a KVM-only QEMU, the 'virt' machine is a good
>> default :)
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  hw/arm/Kconfig | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
>> index d0903d8544..8e801cd15f 100644
>> --- a/hw/arm/Kconfig
>> +++ b/hw/arm/Kconfig
>> @@ -1,5 +1,6 @@
>>  config ARM_VIRT
>>      bool
>> +    default y if KVM
>>      imply PCI_DEVICES
>>      imply TEST_DEVICES
>>      imply VFIO_AMD_XGBE
>>
> 
> Likewise SBSA_REF?

OK.

> Otherwise, what is this for?
> Did you remove ARM_VIRT from default-config/*?

This is to use custom config (and easily test by
blowing default-config/).

> 
> 
> r~
> 
