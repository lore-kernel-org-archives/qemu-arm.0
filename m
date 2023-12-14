Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp2144437ejo;
        Wed, 13 Dec 2023 23:24:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHsaNsx+qaG1bz35+ADj6/b10aOcWfPle38TGx94O7V5klPj+rsufeHyhD4FkizeNhVePQ1
X-Received: by 2002:a05:6214:21ed:b0:67a:a72d:fbb0 with SMTP id p13-20020a05621421ed00b0067aa72dfbb0mr13389585qvj.46.1702538654387;
        Wed, 13 Dec 2023 23:24:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702538654; cv=none;
        d=google.com; s=arc-20160816;
        b=t3t/1jzo7a7sCbUTJGaULwcuj9pvgk+HP0bgPoN8AUcPZbHzzk92Xl/b1ItagLJrXn
         iNWisu6cnaR1WB80qOqfnl9lTrhu/scwODjJgoN6v97LaxBIHSjGweW9I/eg+O8IOXqi
         nWGcG8Y2YGXb9Et9jkCh+p2OKab/tOf+ZvFh76QZMd57bC17StY5edLEVeETngI+CCRw
         AAMNOxyJXCXOAwEoYp1Fjp5gJh9N8hfcrqNvryv15TGoc0NCRYAP1WZQdJylrH10T5lm
         Ux8YERmxK73ib8twmRZT3IaJ/orQ0DR2h6qgrkMuhkX50R9+LvkMV++Io/TGRIirSz5C
         hUhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=nTrq+3Cdbpt4RVJomfi0QnbN0tB/JIdZpvtKrvEXuC8=;
        fh=CTXeaokOBb7sB4FDKW74TBI5wsV0EmB/VyVyQAlk1aU=;
        b=lC5yeNedhJyM7xpZ84T1E5v5twa2I7iWDnzhdMi1yYQUbO6Xmf/nqjwpG10APiXEvU
         6iUPOFHStiHynRUSS7fqIqkh8gRGA1qI7AUejSRWkr24NZ9lqDuKyVk/HvqIc04FWtK/
         HTMqxEguyvvsJCOCR9fXAf8KRlQ4mRBsLcTCaNf43mou1UN+4B5yZDVgtPNhrb0XglBa
         vWcrEjd/aytDGt18D7jLBe38ATb4ZpGUMdwq/5fF/Nw1kTpntEvV8RQABe3KDxR/zcTM
         HsLAQvKYSNvReDZDE/NEbsompP9JYNC62Lfaxdg2GqGkrUIAL9Q5P5BBsKggVUjb2lIz
         dTqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LYyqQWQN;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id db11-20020a056214170b00b0067a778b31d5si15018930qvb.92.2023.12.13.23.24.14
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 23:24:14 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LYyqQWQN;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702538654;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nTrq+3Cdbpt4RVJomfi0QnbN0tB/JIdZpvtKrvEXuC8=;
	b=LYyqQWQNZvNyRBA1e7tGjWG27UMvaH0OsbF4PS+tX0If9x80rPooFFgkzo9nubV8iWDtV/
	Qhqjdv069yZb7ky4C9Gj/Jx58ScdiIJ+MFvsmHdkwbgAvCMaMaVa+cGZL9Uaodd1u3UJGG
	HKnjn5x3c4bsgjhdA00Jel+Q2V+saP8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-695-OCfb266fP_WPZOmosZy5zA-1; Thu, 14 Dec 2023 02:24:10 -0500
X-MC-Unique: OCfb266fP_WPZOmosZy5zA-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-40c514f9243so16615055e9.3
        for <alex.bennee@linaro.org>; Wed, 13 Dec 2023 23:24:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702538649; x=1703143449;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nTrq+3Cdbpt4RVJomfi0QnbN0tB/JIdZpvtKrvEXuC8=;
        b=AOKr1/ikigqlCgVn6yIBr+OczKKqCXiv2Z9bSDzgfyIo3iYzsMsCoYsDWIbSa7eJpj
         9w6qj5rsK+sJSuVAYfwevKtB70XoQv5N9haIM48CQiUys+QmXszWkbLssG64nOhd+FOJ
         KAnSP8sAt+ATc+joz1hvQYGZVbzODG4NukqH3+Ebt8xcIpF9Rrw8ZsTY1T0mNtAcnneY
         g4+G10iFAHbS4NsOJHMoLW1HDhU8V2qeVR+dhQRXN4EyYii88SF5GBvIKgxiXDFJyInf
         ywhmtibdoStLjF0PM3aCyrcQdLZCyQEK2R9zdn+IGGxy5hH6xFoYsO/7TKAYrhOO98M6
         3/Pg==
X-Gm-Message-State: AOJu0Ywg4MLTKw6SGmGNEwOXb7k+KNov0hnLPKt4twidCvnRdC3oZZlP
	IC3cexxROK7mUlUiBXaXAtTeu8VN5474YE8GI09+1rg4Rixq4J3serSQONeaxKRMKAhVUMXo7I3
	ZWKo8Q0RfyW2/lst6
X-Received: by 2002:a1c:7916:0:b0:40c:55a7:7735 with SMTP id l22-20020a1c7916000000b0040c55a77735mr2016764wme.118.1702538649504;
        Wed, 13 Dec 2023 23:24:09 -0800 (PST)
X-Received: by 2002:a1c:7916:0:b0:40c:55a7:7735 with SMTP id l22-20020a1c7916000000b0040c55a77735mr2016754wme.118.1702538649091;
        Wed, 13 Dec 2023 23:24:09 -0800 (PST)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id gw18-20020a05600c851200b004053e9276easm25685177wmb.32.2023.12.13.23.24.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Dec 2023 23:24:08 -0800 (PST)
Message-ID: <6140fc8a-4044-4891-854d-9bf555c5dd78@redhat.com>
Date: Thu, 14 Dec 2023 08:24:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH 03/10] tests/avocado/intel_iommu.py: increase timeout
To: Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Radoslaw Biernacki <rad@semihalf.com>, Paul Durrant <paul@xen.org>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, kvm@vger.kernel.org, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 David Woodhouse <dwmw2@infradead.org>
References: <20231208190911.102879-1-crosa@redhat.com>
 <20231208190911.102879-4-crosa@redhat.com> <8734w8fzbc.fsf@draig.linaro.org>
 <87sf45vpad.fsf@p1.localdomain>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <87sf45vpad.fsf@p1.localdomain>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Ds6UvxqFERzL

Hi Cleber,

On 12/13/23 21:08, Cleber Rosa wrote:
> Alex Bennée <alex.bennee@linaro.org> writes:
>
>> Cleber Rosa <crosa@redhat.com> writes:
>>
>>> Based on many runs, the average run time for these 4 tests is around
>>> 250 seconds, with 320 seconds being the ceiling.  In any way, the
>>> default 120 seconds timeout is inappropriate in my experience.
>> I would rather see these tests updated to fix:
>>
>>  - Don't use such an old Fedora 31 image
> I remember proposing a bump in Fedora version used by default in
> avocado_qemu.LinuxTest (which would propagate to tests such as
> boot_linux.py and others), but that was not well accepted.  I can
> definitely work on such a version bump again.
>
>>  - Avoid updating image packages (when will RH stop serving them?)
> IIUC the only reason for updating the packages is to test the network
> from the guest, and could/should be done another way.
>
> Eric, could you confirm this?
Sorry for the delay. Yes effectively I used the dnf install to stress
the viommu. In the past I was able to trigger viommu bugs that way
whereas getting an IP @ for the guest was just successful.
>
>>  - The "test" is a fairly basic check of dmesg/sysfs output
> Maybe the network is also an implicit check here.  Let's see what Eric
> has to say.

To be honest I do not remember how avocado does the check in itself; my
guess if that if the dnf install does not complete you get a timeout and
the test fails. But you may be more knowledged on this than me ;-)

Thanks

Eric
>
>> I think building a buildroot image with the tools pre-installed (with
>> perhaps more testing) would be a better use of our limited test time.
>>
>> FWIW the runtime on my machine is:
>>
>> ➜  env QEMU_TEST_FLAKY_TESTS=1 ./pyvenv/bin/avocado run ./tests/avocado/intel_iommu.py
>> JOB ID     : 5c582ccf274f3aee279c2208f969a7af8ceb9943
>> JOB LOG    : /home/alex/avocado/job-results/job-2023-12-11T16.53-5c582cc/job.log
>>  (1/4) ./tests/avocado/intel_iommu.py:IntelIOMMU.test_intel_iommu: PASS (44.21 s)
>>  (2/4) ./tests/avocado/intel_iommu.py:IntelIOMMU.test_intel_iommu_strict: PASS (78.60 s)
>>  (3/4) ./tests/avocado/intel_iommu.py:IntelIOMMU.test_intel_iommu_strict_cm: PASS (65.57 s)
>>  (4/4) ./tests/avocado/intel_iommu.py:IntelIOMMU.test_intel_iommu_pt: PASS (66.63 s)
>> RESULTS    : PASS 4 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
>> JOB TIME   : 255.43 s
>>
> Yes, I've also seen similar runtimes in other environments... so it
> looks like it depends a lot on the "dnf -y install numactl-devel".  If
> that can be removed, the tests would have much more predictable runtimes.
>
