Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp2318875ejo;
        Thu, 14 Dec 2023 05:27:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHidrnJTPt2m+dpBZLDWqKIPRBtYNdUp9yxcM+PQlwaTo8ny2cF2IIqJdioSfqFW4jMgoF/
X-Received: by 2002:a05:6808:13c3:b0:3b9:fc7c:b57d with SMTP id d3-20020a05680813c300b003b9fc7cb57dmr11212495oiw.35.1702560419960;
        Thu, 14 Dec 2023 05:26:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702560419; cv=none;
        d=google.com; s=arc-20160816;
        b=YJCq0ByxHBC5PFIEY3gJWtXnw/fXC/e7a6wIVhGGmHtwE3GunSohqeN4Ah4WceFt9L
         BS66HIjk/2UzQYCGARTWq4Vz4shaNIp2kzNbHdd4KtvHFZmHvxRmPyryefhhQdbi9y5b
         xxKxTAQeIz15XlB/jwOdKenoUsBpUW+/7aQZu1D6rtrmvOF5abjdzijj77u/JjDGpQNF
         ug6R59R6hkBl88MdIxsiAfy4L3jc9E1IOBBELSAqK/V8gExs5jKfVUdOjFV4ZIiCYSV1
         Pwonl6ChO+mUTU87HF30O5NWY8la9D+lMYAoBq5EvaA+0LYKrMuIC2FcXb9FfMXOaSsO
         c97Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=IFAffqF6CJ5tF413gWMsZUdS3F+1RarOrkMLNThRh2g=;
        fh=P25exRXI400PmIwK036QCSpCsQ3L5std3hzE4Gh0tXU=;
        b=Eudncv5p8QMhievJ/QayhmcsYVKf/pO/0sLS/tHJImJNE9B2kgwtlejQcOt6ng9Sf2
         k9PoNqTD4fy/Qc0byuznrlMXEEdd+rQM5sUD5S0A83eDon6+85NGbkKwy+dfBhXZdUEN
         KR8SYdtHul6v7FboO/cBy6p6IxAQozl7jO/DXDK7eZYujA+kby2GAqsbKzG/YcjpPOnc
         NEbp7dClRDpH1YlW3iuDGmvsqVKAljaiDOkstYytlm6Oxaeu+D7Xc51+vjIVLfKtqmQC
         SLu58w9HlwjFzmnuO21/evIn1Xt/G0OfldmGOTpUqDKuKwwoBecwcATZlZWHzOUM6A5R
         1l5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="PCq/a0bn";
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id r14-20020a0cf60e000000b0067aa96fb7e4si15898995qvm.55.2023.12.14.05.26.59
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 05:26:59 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="PCq/a0bn";
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702560419;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IFAffqF6CJ5tF413gWMsZUdS3F+1RarOrkMLNThRh2g=;
	b=PCq/a0bnNMkjd0GzWJIjTx0VqeQSq13Gc5nJrQmZPgA0YpmEzQK7pZlr976ChmeCo2VT3f
	QR/94QTlvHZejgpcsf7pGRKeXAF2/0l9HfxOTTPLA3AXwB+UGhcuptqaxJg+JWsPaYCOoQ
	lJYHh6fK9J4AecqYpgHbGTkspnMmH0k=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-147-uwDZ_r5TM2uc9EaQ8JU38g-1; Thu, 14 Dec 2023 08:26:58 -0500
X-MC-Unique: uwDZ_r5TM2uc9EaQ8JU38g-1
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-3b9d5d9e7fcso12505245b6e.0
        for <alex.bennee@linaro.org>; Thu, 14 Dec 2023 05:26:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702560416; x=1703165216;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IFAffqF6CJ5tF413gWMsZUdS3F+1RarOrkMLNThRh2g=;
        b=Dhe7gVJPzbkl7E6bcKQtCGNdlF0w+7Fbf93NsSMzwIZQzfzn97gMRZWEL9PzazuuIE
         olwAkBKMA3bk6tCJEs4tYtwiLM9221VA2QU9jE7JvcgYdG6P2rJieCZO2+anE1h4jijP
         Qcce/hFiStpWItCcdWWqJQrIqDMUoqeVo+pg8reQ/Fb6lZ85vVKPLGstP/T3j8XMepN9
         nOh1DvKkFLcGkFK6MIgOlRnzIRFw2EI9szusiXyDDZx77fEtglJwgUOlozspdfmXHs1J
         rxcyGPhGIFsZGydq4m5y8LLAh4qocpoG0UGVEeoPmlkbOaRa3P44IuheYmGsc/M0zst0
         z5Qw==
X-Gm-Message-State: AOJu0YxK5H1BCcrYcrMm/NJYdoOA+EV7iu9ZcnybiV3uL/DbC1YQfVvY
	bGB+nfHsFe+p1MESndRtpx9D3M4IG+Hve4SgbF6uf4F4BH9Y+8P3LXic23wUnYJMW3RTUgChh2w
	a7r0tnIekE+vPsaBylKWFHpaCNcb1SYre4QSnWJVGrhV+cEeC1ppiBZB/qJJQmOP6MBnbYeN1ZM
	dtPxU=
X-Received: by 2002:a05:6808:15a0:b0:3b8:8f56:1528 with SMTP id t32-20020a05680815a000b003b88f561528mr12655514oiw.59.1702560415858;
        Thu, 14 Dec 2023 05:26:55 -0800 (PST)
X-Received: by 2002:a05:6808:15a0:b0:3b8:8f56:1528 with SMTP id t32-20020a05680815a000b003b88f561528mr12655487oiw.59.1702560415543;
        Thu, 14 Dec 2023 05:26:55 -0800 (PST)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id m19-20020ae9e013000000b0076db5b792basm5271768qkk.75.2023.12.14.05.26.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Dec 2023 05:26:54 -0800 (PST)
Message-ID: <9e96236b-4346-434c-8e5e-3cc8fb60c32a@redhat.com>
Date: Thu, 14 Dec 2023 14:26:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH 03/10] tests/avocado/intel_iommu.py: increase timeout
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Radoslaw Biernacki
 <rad@semihalf.com>, Paul Durrant <paul@xen.org>,
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
 <6140fc8a-4044-4891-854d-9bf555c5dd78@redhat.com>
 <878r5x9l4b.fsf@draig.linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <878r5x9l4b.fsf@draig.linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: HxDcOeiBMo9I



On 12/14/23 10:41, Alex Bennée wrote:
> Eric Auger <eric.auger@redhat.com> writes:
>
>> Hi Cleber,
>>
>> On 12/13/23 21:08, Cleber Rosa wrote:
>>> Alex Bennée <alex.bennee@linaro.org> writes:
>>>
>>>> Cleber Rosa <crosa@redhat.com> writes:
>>>>
>>>>> Based on many runs, the average run time for these 4 tests is around
>>>>> 250 seconds, with 320 seconds being the ceiling.  In any way, the
>>>>> default 120 seconds timeout is inappropriate in my experience.
>>>> I would rather see these tests updated to fix:
>>>>
>>>>  - Don't use such an old Fedora 31 image
>>> I remember proposing a bump in Fedora version used by default in
>>> avocado_qemu.LinuxTest (which would propagate to tests such as
>>> boot_linux.py and others), but that was not well accepted.  I can
>>> definitely work on such a version bump again.
>>>
>>>>  - Avoid updating image packages (when will RH stop serving them?)
>>> IIUC the only reason for updating the packages is to test the network
>>> from the guest, and could/should be done another way.
>>>
>>> Eric, could you confirm this?
>> Sorry for the delay. Yes effectively I used the dnf install to stress
>> the viommu. In the past I was able to trigger viommu bugs that way
>> whereas getting an IP @ for the guest was just successful.
>>>>  - The "test" is a fairly basic check of dmesg/sysfs output
>>> Maybe the network is also an implicit check here.  Let's see what Eric
>>> has to say.
>> To be honest I do not remember how avocado does the check in itself; my
>> guess if that if the dnf install does not complete you get a timeout and
>> the test fails. But you may be more knowledged on this than me ;-)
> I guess the problem is relying on external infrastructure can lead to
> unpredictable results. However its a lot easier to configure user mode
> networking just to pull something off the internet than have a local
> netperf or some such setup to generate local traffic.
>
> I guess there is no loopback like setup which would sufficiently
> exercise the code?

I don't think so. This test is a reproducer for a bug I encountered and
fixed in the past.
Besudes, I am totally fine moving the test out of the gating CI and just
keep it as a tier2 test, as suggested by Phil.

Thanks

Eric
>
>> Thanks
>>
>> Eric
>>>> I think building a buildroot image with the tools pre-installed (with
>>>> perhaps more testing) would be a better use of our limited test time.
>>>>
>>>> FWIW the runtime on my machine is:
>>>>
>>>> ➜  env QEMU_TEST_FLAKY_TESTS=1 ./pyvenv/bin/avocado run ./tests/avocado/intel_iommu.py
>>>> JOB ID     : 5c582ccf274f3aee279c2208f969a7af8ceb9943
>>>> JOB LOG    : /home/alex/avocado/job-results/job-2023-12-11T16.53-5c582cc/job.log
>>>>  (1/4) ./tests/avocado/intel_iommu.py:IntelIOMMU.test_intel_iommu: PASS (44.21 s)
>>>>  (2/4) ./tests/avocado/intel_iommu.py:IntelIOMMU.test_intel_iommu_strict: PASS (78.60 s)
>>>>  (3/4) ./tests/avocado/intel_iommu.py:IntelIOMMU.test_intel_iommu_strict_cm: PASS (65.57 s)
>>>>  (4/4) ./tests/avocado/intel_iommu.py:IntelIOMMU.test_intel_iommu_pt: PASS (66.63 s)
>>>> RESULTS    : PASS 4 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
>>>> JOB TIME   : 255.43 s
>>>>
>>> Yes, I've also seen similar runtimes in other environments... so it
>>> looks like it depends a lot on the "dnf -y install numactl-devel".  If
>>> that can be removed, the tests would have much more predictable runtimes.
>>>
