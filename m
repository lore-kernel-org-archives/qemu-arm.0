Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp721111lfb;
        Wed, 28 Apr 2021 08:26:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwUdmn+Kn56plWpVWMajGbV1n3+6AQwXVHXvJaLHjR/ZpADgeer/xOR9pM63RLHHMFeDyFi
X-Received: by 2002:a17:906:b2cd:: with SMTP id cf13mr30386321ejb.419.1619623596995;
        Wed, 28 Apr 2021 08:26:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619623596; cv=none;
        d=google.com; s=arc-20160816;
        b=j7+WsMEMBAsV41lxVv9qLpZ8Um0OXKCmQsRDEMgLI9QdwEirh7/B+Wuk5yNL/dAZCN
         tfparNq11JbhSAaCyCCkDKXZwabS0zO+IaenCYHsZhHv3NMrFJNFvt7ELM+WT0RVxJGv
         umuESo2vvBYYHr6BFrbSNj7MMvpW7AGYOGoWRkZgLEfDEAvCrZFw0EMLJ5hHUyuw/thP
         scBfQE8tKnY2+Qpt28z/4c0z37gpiRgiflYnYIEuedaZM0PrZy4UENrK4+yWqcIs9RRJ
         NVJ1xhNGepk2yDUWflQFDccMfqd/qqa7u/201yFiGGnTCrlon+CyhbHdXVYIALGrzJ5I
         6jBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=N9sLSkMd2PrkFOc/KnB2Eh0J9f5STmd+QbevjYr4WCA=;
        b=qF2cWruHWqDjwxSrvljpiiqlsLgdLzuKFxDlPI6PGsfsDq7U0SbFpNmmQWNOgTCQ5f
         P9tn9XuDqCP4KE8nsHSg42MFTYmz1W2WlLbFcwwUdDOuG4LXlbND7c5EMJ8N3UfwSDJK
         9OaPYC98LciYX51B0y6tshNOht9rG8WGUctLwOQ1cbgbAzJ8TfsH+0xT3oT6OTnFVKUF
         kq1ButtBD+q/lTKHl/38G2XsGWduLymgkjWc8xDQk1ZhAIRsxteECtc2W8Sy/NfyYo/B
         oxZilf6LHCcWiuAwU6VjF7eSKDmEdUWxAwStH7hPC3mBF1uUjv2V63ZD/C14dHCJ7KF5
         votQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Z9G+yKhf;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id h4si6164197ede.481.2021.04.28.08.26.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Apr 2021 08:26:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Z9G+yKhf;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1619623595;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N9sLSkMd2PrkFOc/KnB2Eh0J9f5STmd+QbevjYr4WCA=;
	b=Z9G+yKhfcyVDkXwv4YixYi9VUsftfCwgceJ3UON4aF5KEOEyJz672e+LFozV/bPAeP3UWJ
	X4MxtwMOpWyYq6ku72Xim3lZh+sLpn6dq54Ly2eNvWOVRrIyN80DOml8BBd+6wHJyMp9es
	5Fd8NikYv3NGlFZLA502oLMEgdNVatY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-3DP7XKC2MKKxA7cDD_b_jQ-1; Wed, 28 Apr 2021 11:26:32 -0400
X-MC-Unique: 3DP7XKC2MKKxA7cDD_b_jQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD33880ED8D;
	Wed, 28 Apr 2021 15:26:30 +0000 (UTC)
Received: from [10.36.113.191] (ovpn-113-191.ams2.redhat.com [10.36.113.191])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BC4E91007610;
	Wed, 28 Apr 2021 15:26:28 +0000 (UTC)
Subject: Re: [kvm-unit-tests PATCH v1 1/4] arm64: split its-trigger test into
 KVM and TCG variants
To: Marc Zyngier <maz@kernel.org>, Alexandru Elisei <alexandru.elisei@arm.com>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 kvm@vger.kernel.org, shashi.mallela@linaro.org, qemu-arm@nongnu.org,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
 christoffer.dall@arm.com
References: <20210428101844.22656-1-alex.bennee@linaro.org>
 <20210428101844.22656-2-alex.bennee@linaro.org>
 <eaed3c63988513fe2849c2d6f22937af@kernel.org> <87fszasjdg.fsf@linaro.org>
 <996210ae-9c63-54ff-1a65-6dbd63da74d2@arm.com> <87k0omo4rr.wl-maz@kernel.org>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <5c446e6e-fb21-3a47-587b-6ad5e6baf096@redhat.com>
Date: Wed, 28 Apr 2021 17:26:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <87k0omo4rr.wl-maz@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-TUID: Ev6JZOcF+Shc

Hi,

On 4/28/21 4:36 PM, Marc Zyngier wrote:
> On Wed, 28 Apr 2021 15:00:15 +0100,
> Alexandru Elisei <alexandru.elisei@arm.com> wrote:
>>
>> I interpret that as that an INVALL guarantees that a change is
>> visible, but it the change can become visible even without the
>> INVALL.
> 
> Yes. Expecting the LPI to be delivered or not in the absence of an
> invalidate when its configuration has been altered is wrong. The
> architecture doesn't guarantee anything of the sort.
> 
>> The test relies on the fact that changes to the LPI tables are not
>> visible *under KVM* until the INVALL command, but that's not
>> necessarily the case on real hardware. To match the spec, I think
>> the test "dev2/eventid=20 still does not trigger any LPI" should be
>> removed and the stats reset should take place before the
>> configuration for LPI 8195 is set to the default.

Yes I do agree with Alexandru and Marc after another reading of the
spec. I initially thought the INVALL was the gate keeper for the new
config but that sounds wrong. This test shall be removed then.

Eric
> 
> If that's what the test expects (I haven't tried to investigate), it
> should be dropped completely, rather than trying to sidestep it for
> TCG.
> 
> Thanks,
> 
> 	M.
> 
