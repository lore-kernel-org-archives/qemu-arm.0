Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp4088005ejx;
        Wed, 23 Nov 2022 03:26:51 -0800 (PST)
X-Google-Smtp-Source: AA0mqf60DHhlUOjQAxKjJPR2Mgtrx+yenTEN2pyl7PrZz/7ieaeqhrm47U539qzj7gkk1VameJAG
X-Received: by 2002:a50:fc10:0:b0:464:2afe:ae18 with SMTP id i16-20020a50fc10000000b004642afeae18mr25944863edr.183.1669202811128;
        Wed, 23 Nov 2022 03:26:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669202811; cv=none;
        d=google.com; s=arc-20160816;
        b=ziAmejrGkPt+7Q+oE2+mIs7gmQ+33/anB7u0t3Wl1ESp+CEZDNLIbUNdKyDGkDJaoz
         i4fv9FML2KydOQ949VULc7N+YT504uYq9Rfa1ybseqRoWGp7lz9Gwbp6ThhG/V7ZmWLM
         KoZSHtez7UBrWIwt3k3BwgdNv/KHWI3YI/LWWzmHtU/U8bO4njvD7VmNCYHK6Pu3Qzim
         O0c+gHq0EOVkf3eApSsMNxb5baoKAUsHXgXbd0qRYkPzEVwn1frvITY4okRnM1AeTgrX
         YkiVsVeiiLP5+nGYzj1dAMcKWzLr/+hQFmh/GbqYPQc5OaihWaJ1xBNxFHF89DwNLAHh
         g/vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:subject:from
         :references:cc:to:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=/uVeYx6CjoYEK3tX9urIsDYRKGgSlWj2VcVgfP/GhA0=;
        b=0cBhip5W2ttjQxXR+SIcolEfuCv+yvEJsOved/M2HjJsVa+6PJ2OX9JmVIa3CGPVaf
         nKrpOrFdgspazBxAA5atwhWi/KnHDoywoqNt/iquCOj2aH1+RrLMdjWNi6AXOQZaLy+i
         z1fw1My02v4nNO0Dw3ERnZ4XyGqclybMw9N3YhDKyI+2HlrYSQ6+xZPXnp515aN0sOFK
         LQa31IpIcOCUdyAmCJsjUkIxtVuRGH9mmuUvzTScPnwauadS1gRtwwrc1Qgn/wRGQB9W
         L8yLwf18vqlcVPdVoApHRwmgMtXu1DZ0f+5jSBe64Hz+3eYBmLM9A2GLwrnU5e1R1I7o
         3cHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JzfarWVr;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id lc24-20020a170906f91800b0078d027ceb41si12154022ejb.857.2022.11.23.03.26.50
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 03:26:51 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JzfarWVr;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669202810;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/uVeYx6CjoYEK3tX9urIsDYRKGgSlWj2VcVgfP/GhA0=;
	b=JzfarWVrpQNcU6mppvTfZlp8nIXgSRowqES19EA5iLHQ3euTIK3xObB8fr5OLGKzElnqA+
	0b1ECiDD/NdBZV5XsCe5m3CB3LRRTRpWMxXveYRaVa9wOJe+ToM7CDRgs6s/+xihQlQhHI
	4VbMP9FmuNSv5Xx7oF7UEXP7f76EgAk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-364-vgQmqT8IO9GOdc-YrNDNvw-1; Wed, 23 Nov 2022 06:26:49 -0500
X-MC-Unique: vgQmqT8IO9GOdc-YrNDNvw-1
Received: by mail-wm1-f70.google.com with SMTP id c10-20020a7bc84a000000b003cf81c2d3efso697165wml.7
        for <alex.bennee@linaro.org>; Wed, 23 Nov 2022 03:26:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/uVeYx6CjoYEK3tX9urIsDYRKGgSlWj2VcVgfP/GhA0=;
        b=3wg+aiCQkND9LSyOmM6z+EensdaYrUpHFZgIPDpUjvlx0JI4i+0rAvjQd8JlfPQcvo
         6Sgq2vcIU1MbYERjnctKzgPlTd0YLpdfAX5K6THU9Z63ZySw5vKK9KuXtLmhjQJLGwP0
         MdxW36b4Kr9rKZL7Ele+FH6ejBK4T281eGrdU5eEv2I8UFBmbigFCdxWbnw/nL6pWDUA
         sEYrVftsGQFyeeiaB9EbtPnPzWtHN55BCI8LUgRKV/is/uhK8MGDuZbx/sqlwXR+ADZ8
         1RVCy0wQLm0OOoNZFUCpq3W0QtEbnmPN0fJIVnBnByYScTX3tykdMqA8252BpjY8KAlB
         a5uQ==
X-Gm-Message-State: ANoB5plVKtu9tV4I8XSJXMs+EbgGf/6tz7X5Dw8uPauKfE8RF5kPL8q4
	YHRZN25Ulml6TGUvauLm+s2wTmcuqCa+pzpRw9/FolXT3Z2n4bB/Q6KzpJ/SoTzr3R8g1T9v5mm
	Eyoq+cBuQwbyxVVWO
X-Received: by 2002:adf:d4cb:0:b0:241:e680:b5be with SMTP id w11-20020adfd4cb000000b00241e680b5bemr3909647wrk.717.1669202807866;
        Wed, 23 Nov 2022 03:26:47 -0800 (PST)
X-Received: by 2002:adf:d4cb:0:b0:241:e680:b5be with SMTP id w11-20020adfd4cb000000b00241e680b5bemr3909636wrk.717.1669202807665;
        Wed, 23 Nov 2022 03:26:47 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.5] (ip-109-43-178-58.web.vodafone.de. [109.43.178.58])
        by smtp.gmail.com with ESMTPSA id t10-20020a5d6a4a000000b00241f467f888sm781662wrw.74.2022.11.23.03.26.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 03:26:47 -0800 (PST)
Message-ID: <8f6f531f-3ed9-6a14-9ad6-8c0ff6b32c22@redhat.com>
Date: Wed, 23 Nov 2022 12:26:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20221118113309.1057790-1-alex.bennee@linaro.org>
 <8c4b6387-450d-88af-c1d4-3171a9c3067b@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [RFC PATCH] tests/avocado: use new rootfs for orangepi test
In-Reply-To: <8c4b6387-450d-88af-c1d4-3171a9c3067b@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: /RFlkR7Ek2xv

On 23/11/2022 12.15, Philippe Mathieu-Daudé wrote:
> On 18/11/22 12:33, Alex Bennée wrote:
>> The old URL wasn't stable. I suspect the current URL will only be
>> stable for a few months so maybe we need another strategy for hosting
>> rootfs snapshots?
>>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> ---
>>   tests/avocado/boot_linux_console.py | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/tests/avocado/boot_linux_console.py 
>> b/tests/avocado/boot_linux_console.py
>> index 4c9d551f47..5a2923c423 100644
>> --- a/tests/avocado/boot_linux_console.py
>> +++ b/tests/avocado/boot_linux_console.py
>> @@ -793,8 +793,8 @@ def test_arm_orangepi_sd(self):
>>           dtb_path = 
>> '/usr/lib/linux-image-current-sunxi/sun8i-h3-orangepi-pc.dtb'
>>           dtb_path = self.extract_from_deb(deb_path, dtb_path)
>>           rootfs_url = 
>> ('http://storage.kernelci.org/images/rootfs/buildroot/'
>> -                      'kci-2019.02/armel/base/rootfs.ext2.xz')
>> -        rootfs_hash = '692510cb625efda31640d1de0a8d60e26040f061'
>> +                      'buildroot-baseline/20221116.0/armel/rootfs.ext2.xz')
>> +        rootfs_hash = 'fae32f337c7b87547b10f42599acf109da8b6d9a'
> If Avocado doesn't find an artifact in its local cache, it will fetch it
> from the URL.
> The cache might be populated with artifacts previously downloaded, but
> their URL is not valid anymore (my case for many tests).
> We can also add artifacts manually, see [1].
> 
> I'd rather keep pre-existing tests if possible, to test older (kernel / 
> user-space) images. We don't need to run all the tests all the time:
> tests can be filtered by tags (see [2]).
> 
> My preference here is to refactor this test, adding the "kci-2019.02"
> and "baseline-20221116.0" releases. I can prepare the patch if you /
> Thomas don't object.

IMHO we shouldn't keep tests in the upstream git repository where the 
binaries are not available in public anymore. They won't get run by new 
contributors anymore, and also could vanish from the disks of the people who 
previously downloaded it, once they wipe their cache or upgrade to a new 
installation, so the test code will sooner or later be bitrotting. But if 
you want to keep the tests around on your hard disk, you could also stick 
the test in a local branch on your hard disk instead.

The other possibility is to upload the binaries to a new public location in 
the web ... but for software that contains GPLed software, you should then 
also make sure to provide the source code to comply with the license.

  Thomas
