Received: by 2002:a17:504:6454:b0:1be9:327d:8ee3 with SMTP id g20csp682847njh;
        Mon, 12 Aug 2024 00:33:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXQWwjjG+X6DzO8k0ztuGLQzE1saUh/yILHcYkh7kNVRfqQYx0S9baBgQvy7v4ag3lyGCWJIpT71HbA+CAhq7TsmcRqiuju
X-Google-Smtp-Source: AGHT+IEL7c/+mijAUF1nvl97bdjFv+YOIuuw7sZic+X57gKTunwd6NElOJXZZxtMuW2G5o82MJwg
X-Received: by 2002:ac8:60d5:0:b0:453:1563:bfb5 with SMTP id d75a77b69052e-4531563c387mr73864401cf.15.1723448004910;
        Mon, 12 Aug 2024 00:33:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723448004; cv=none;
        d=google.com; s=arc-20160816;
        b=UW7c7711r94xA32meUZA3Wr+Iar2F4HCBIkwl6MklFiV0+gPyIssoYnmwJJ8dKnzan
         M885rT4/sv+aoEpMGk0A5IV4E+tlpjWDcJqp7iMmaE5f/pMPlXCYfI6ZdkjFXIBssPoE
         rm8cqiftDqYerRgEk1dJTDdkK5KU9k6DWL1DlwrCx10jXMvKUMbEBp7gEXas1mGbmBjt
         fwWcSsrW4pFvquSzh2Cj1wZoiA9UwkeoddkQyAaSVCoRXrvGZbzlLs38dkBDaXdb3Vzm
         ZfbGdEHfYLnqXrPGuk3aBlyhQIuWehSOTdkz29zCYZIfbuRgNYPJaSn/mMcQJHayvYxY
         b7ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=zT6wuCKiRsYdiQxfFQSrTjOcl1iJ0UV60/tdF3C+AGg=;
        fh=X3pFpS/NXU6q6uNbI5kwiBIgxPxpmtNJwpy2rSaRtgc=;
        b=nDuxt3EXzdygt9Q+LiREdFUz3KQ6d2OnbarQ+8eYCSJmr5cQUakFnsAT2iK8WmJRi3
         7chSMQrJN+sV9OozgXNQys+gVhMxJ36N01RjIZEjzMAeuRqYCU2tu3y0aIbnl7EiOSMx
         cjHGyIc3UmtnjlX4NOh7x90w7NJT028jaaUW08pMiYuYVM2/9/Y/KNQUy4LHJmkafd7Q
         LjWv3Al7zpSfl1uV5Rth+dremA/YbSO+G1/lpy5r3vG1Bxsh9qxpGs4awP6MyofGH5GI
         gq36CmBs3uKYkpxLw5dS+WvZueao0+DfhPKZHRH+BOgGt7YQKo44kDUlcFeQbUHhr8OG
         5lwA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YWnH76Jh;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4531c1af4e5si53731561cf.129.2024.08.12.00.33.24
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 00:33:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YWnH76Jh;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723448004;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zT6wuCKiRsYdiQxfFQSrTjOcl1iJ0UV60/tdF3C+AGg=;
	b=YWnH76JhQylkRYhIpQ7YhvNc2dFYvmYplumlV5EaIRSF+aHG/sTezI+bmMF4gFbNqJ9bfW
	qHJQm9EMcrLK8umKf9vQ4j500OYPLDS5aRmwL8E+TknaYz2sC+s+5FYtyY+j738ZkI1jCe
	yfJRl7u9eoCFRyczh11UbzaEjUfJPDU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-111-JpEOokK9NqawmZVbIr1wKA-1; Mon, 12 Aug 2024 03:33:09 -0400
X-MC-Unique: JpEOokK9NqawmZVbIr1wKA-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4280645e3e0so29096865e9.1
        for <alex.bennee@linaro.org>; Mon, 12 Aug 2024 00:33:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723447988; x=1724052788;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zT6wuCKiRsYdiQxfFQSrTjOcl1iJ0UV60/tdF3C+AGg=;
        b=vPqsgwY4EvUs5IC7K2fRs9MysMUbZJl1JSZD8AbUxuR+PKHdSlwl8b8nrPGAKwWAp5
         nOTW8vTUk707nh6LmQfc3tV2TRlEwQd/ivnL5TgL1QWqJvwuNx5zGTFf04grc6o+wMDO
         VfKrRhKBdzDkALVySov8rCxjKulpDtzlMGzXVpQjSRVDlf4HaRN07A/SY3YwRYgtcwu8
         EBoXiszedTfqvrBCtr86B8MXPBd60GsLENXG0DO+0D6+MxbfkGe23nRq7i13tPVPG4Sw
         6eeyVaIc0VCA0Psa6iamShZmbtF0Vpyddl7erAk/IUwoNEsoQiDG3EqNP41kJEw4tzgR
         Emnw==
X-Forwarded-Encrypted: i=1; AJvYcCVn8DKz8hmdBCDu+WD+R2d9E7H3QuJyHXQqKzZkq+yJOiQwj6hP4gQ2UorroKI5ExMAG2yPx6Fy1V4NbMlF1hXxRhuvrVg+
X-Gm-Message-State: AOJu0YwB4y59PzuYK7k+dohgXh4243Q20Y/+t5w7m8DR0hwlC8whnwyE
	1JcbEgSl1ev0vsM0MVNR6G5TgUQeRUPlofHXREqRm37tBQ+ZgEvuzOXA3k7YRcXGSPpt1vIWfnt
	c76rj9dRCyTf8fH0E8r6rfd2dfueQOIbVfCajfUqhtT21Dyf+BbWb5g==
X-Received: by 2002:a05:600c:45d0:b0:426:5cee:4abc with SMTP id 5b1f17b1804b1-429c3a29abcmr65727285e9.20.1723447988242;
        Mon, 12 Aug 2024 00:33:08 -0700 (PDT)
X-Received: by 2002:a05:600c:45d0:b0:426:5cee:4abc with SMTP id 5b1f17b1804b1-429c3a29abcmr65727045e9.20.1723447987778;
        Mon, 12 Aug 2024 00:33:07 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36e4c36bd6csm6701474f8f.6.2024.08.12.00.33.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Aug 2024 00:33:07 -0700 (PDT)
Message-ID: <8b73937b-9361-4ff5-a4b2-344cc64ed6aa@redhat.com>
Date: Mon, 12 Aug 2024 09:33:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH 03/13] tests/avocado/intel_iommu.py: increase timeout
To: Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 David Woodhouse <dwmw2@infradead.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, kvm@vger.kernel.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Radoslaw Biernacki <rad@semihalf.com>, Paul Durrant <paul@xen.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Akihiko Odaki <akihiko.odaki@daynix.com>
References: <20240726134438.14720-1-crosa@redhat.com>
 <20240726134438.14720-4-crosa@redhat.com> <ZqdvR3UFBCAu8wiI@redhat.com>
 <CA+bd_6Lepg=uXs1NViYV5eZBGot2ZRAYUi-NDXwSBsdBk17LPA@mail.gmail.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CA+bd_6Lepg=uXs1NViYV5eZBGot2ZRAYUi-NDXwSBsdBk17LPA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: MpCVd4jZ0Vpq

Hi Cleber,

On 8/1/24 03:02, Cleber Rosa wrote:
> On Mon, Jul 29, 2024 at 6:30 AM Daniel P. Berrangé <berrange@redhat.com> wrote:
>> On Fri, Jul 26, 2024 at 09:44:28AM -0400, Cleber Rosa wrote:
>>> Based on many runs, the average run time for these 4 tests is around
>>> 250 seconds, with 320 seconds being the ceiling.  In any way, the
>>> default 120 seconds timeout is inappropriate in my experience.
>>> Let's increase the timeout so these tests get a chance to completion.
>> A high watermark of over 5 minutes is pretty long for a test.
>>
> I agree.
>
>> Looking at the test I see it runs
>>
>>    self.ssh_command('dnf -y install numactl-devel')
>>
>> but then never actually uses the installed package.
>>
>> I expect that most of the wallclock time here is coming from having
>> dnf download all the repodata, 4 times over.
>>
> Exactly.
>
>> If the intention was to test networking, then replace this with
>> something that doesn't have to download 100's of MB of data, then
>> see what kind of running time we get before increasing any timeout.
>>
>>
> I was trying not to get in the way of the original test writer.
>
> Eric,
>
> Are you OK with replacing this command for a simpler file transfer?
> Any suggestions?
Sorry I am just returning from PTO. Yes I am OK to replace it with a
file transfer if it takes too much time. When the test was written we
just found out a bug with that exact dnf install command so at that time
this was a reproducer. Either replace it with a dummy file transfer or
withdraw it from the automated tests.

Thanks

Eric
>
> Regards,
> - Cleber.
>
