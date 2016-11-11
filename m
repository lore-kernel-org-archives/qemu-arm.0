Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id c188sm10116440wmd.22.2016.11.11.02.00.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Nov 2016 02:00:08 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id D43DC3E04F2;
	Fri, 11 Nov 2016 10:00:07 +0000 (GMT)
References: <1478798481-25030-1-git-send-email-drjones@redhat.com> <1478798481-25030-11-git-send-email-drjones@redhat.com> <874m3f8621.fsf@linaro.org> <4d1964d4-6540-3df6-8193-6dac3efa7d5c@arm.com>
User-agent: mu4e 0.9.17; emacs 25.1.50.16
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Andrew Jones <drjones@redhat.com>, kvm@vger.kernel.org, kvmarm@lists.cs.columbia.edu, qemu-devel@nongnu.org, qemu-arm@nongnu.org, pbonzini@redhat.com, peter.maydell@linaro.org, marc.zyngier@arm.com, eric.auger@redhat.com, christoffer.dall@linaro.org
Subject: Re: [kvm-unit-tests PATCH v5 10/11] arm/arm64: gicv3: add an IPI test
In-reply-to: <4d1964d4-6540-3df6-8193-6dac3efa7d5c@arm.com>
Date: Fri, 11 Nov 2016 10:00:07 +0000
Message-ID: <8737iy8hg8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: Db1B85+YZlS6


Andre Przywara <andre.przywara@arm.com> writes:

> Hi,
>
> On 10/11/16 19:53, Alex Bennée wrote:
>
> ....
>> So I was re-basing my kvm-unit-tests against your GIC rework and found
>> myself copy and pasting a bunch of this into my tests that fire IRQs.
>
> So I take it you are working on (or already have) code to test SPIs,
> probably via GICD_ISPENDR?
> Just asking because I was thinking about going there and thus could save
> my time if you are on it already...

In my case I wanted to trigger SPIs to exercise my TCG tests for MTTCG:

  https://github.com/stsquad/kvm-unit-tests/blob/mttcg/current-tests-v6/arm/tcg-test.c#L113

>> That makes me think the abstraction should be in the library code so
>> other tests can fiddle with sending IRQs.
>
> ...because I was wondering the same.

To answer Andrew's question from the other post I would be happy with a
common:

  gic_enable
  gic_send_spi(cpu, irq)
  gic_irq_ack() which returns the iar.


>
> Cheers,
> Andre.


--
Alex Bennée
