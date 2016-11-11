Received: by 10.25.150.194 with SMTP id y185csp1239874lfd;
        Fri, 11 Nov 2016 01:20:46 -0800 (PST)
X-Received: by 10.194.104.65 with SMTP id gc1mr8073985wjb.164.1478856046422;
        Fri, 11 Nov 2016 01:20:46 -0800 (PST)
Return-Path: <andre.przywara@arm.com>
Received: from cam-admin0.cambridge.arm.com (cam-admin0.cambridge.arm.com. [217.140.96.50])
        by mx.google.com with ESMTP id d128si32030584wmf.49.2016.11.11.01.20.46;
        Fri, 11 Nov 2016 01:20:46 -0800 (PST)
Received-SPF: pass (google.com: domain of andre.przywara@arm.com designates 217.140.96.50 as permitted sender) client-ip=217.140.96.50;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of andre.przywara@arm.com designates 217.140.96.50 as permitted sender) smtp.mailfrom=andre.przywara@arm.com
Received: from [192.168.67.35] ([10.1.207.46])
	by cam-admin0.cambridge.arm.com (8.12.6/8.12.6) with ESMTP id uAB9KiWr019832;
	Fri, 11 Nov 2016 09:20:44 GMT
Subject: Re: [kvm-unit-tests PATCH v5 10/11] arm/arm64: gicv3: add an IPI test
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
   Andrew Jones <drjones@redhat.com>
References: <1478798481-25030-1-git-send-email-drjones@redhat.com>
 <1478798481-25030-11-git-send-email-drjones@redhat.com>
 <874m3f8621.fsf@linaro.org>
Cc: kvm@vger.kernel.org, kvmarm@lists.cs.columbia.edu, qemu-devel@nongnu.org,
   qemu-arm@nongnu.org, pbonzini@redhat.com, peter.maydell@linaro.org,
   marc.zyngier@arm.com, eric.auger@redhat.com, christoffer.dall@linaro.org
From: Andre Przywara <andre.przywara@arm.com>
Organization: ARM Ltd.
Message-ID: <4d1964d4-6540-3df6-8193-6dac3efa7d5c@arm.com>
Date: Fri, 11 Nov 2016 09:21:20 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <874m3f8621.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: kroFsX7DR5Tk

Hi,

On 10/11/16 19:53, Alex Bennée wrote:

....
> So I was re-basing my kvm-unit-tests against your GIC rework and found
> myself copy and pasting a bunch of this into my tests that fire IRQs.

So I take it you are working on (or already have) code to test SPIs,
probably via GICD_ISPENDR?
Just asking because I was thinking about going there and thus could save
my time if you are on it already...

> That makes me think the abstraction should be in the library code so
> other tests can fiddle with sending IRQs.

...because I was wondering the same.

Cheers,
Andre.
