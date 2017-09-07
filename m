Received: by 10.223.172.38 with SMTP id v35csp442812wrc;
        Thu, 7 Sep 2017 09:30:19 -0700 (PDT)
X-Received: by 10.200.51.137 with SMTP id c9mr4423536qtb.263.1504801819033;
        Thu, 07 Sep 2017 09:30:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504801819; cv=none;
        d=google.com; s=arc-20160816;
        b=xJFl+rbJhNXeuX9rIn7SA0OzpblyiILoEct5M6RshhazWrtWSRPelUfVCQeTxzl+nY
         /lC7WsvIjg34dnOhDgeAiYkTcLXjFEg4KLUjS3srBwZXYew8TnbxfrxJsa7X/I5NgeQJ
         OYvQpa0t2jBpQqv2FsfcOQ2EXPItw01fF/PQkaTeJp688qspYKDeYoPArtWRqmBcV9vq
         PB3CQbHzbrDJPNAUwmqnnVV2otgGAVyvxfbvYrgNvZI+9BVzuFKPgox6SRkTerZ+HKvQ
         QAEY74VfIF2/Jgj4y20yqITNsOgJTnVKJcSd/1WnpvARV+HCLU5alOAZZHpvVs6+kOOr
         TAww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=1aQT/9R7xMbAkhP2IQx2ZtVSqFkit4+d1xVjVfRTBl4=;
        b=OgWpdwvfTx4OWKHtwuixi5GLS2FkrTbhAPn29nQmh1Bb5JWGlUP8+SgXT7oPMPUIcP
         8YM7YzwW1HaY2YP899TZq2+Jt0XxnqCv27+lWEl61rgRVTvoX3V3DaNluOhbxqhQwr/8
         fHVC+zWkaR3rdRdUklgIlSEecheHsLtiNSzXJ2dgyg7RltBhXlTAXSXiskU//XLVpbpR
         ijwfvIUes6iP4TgbDGhWdJGTghk4a4cnH+0Kng+bnQrC0HAsYFnLLaFAYbuEOUBnDAEB
         OqlfNl7+JkmYxPPrtcodhzwwTFvrO/Uatr3AceKyaUO3nX53/B6Hnnc7DrVXHUKGR1Vr
         GvjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=uqGcnN+G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e37si57152qtb.465.2017.09.07.09.30.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Sep 2017 09:30:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=uqGcnN+G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41299 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dpzh2-000061-Oe
	for alex.bennee@linaro.org; Thu, 07 Sep 2017 12:30:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50329)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dpzgt-0008Oi-DK
	for qemu-arm@nongnu.org; Thu, 07 Sep 2017 12:30:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dpzgo-0003PO-PE
	for qemu-arm@nongnu.org; Thu, 07 Sep 2017 12:30:07 -0400
Received: from mail-wr0-x235.google.com ([2a00:1450:400c:c0c::235]:34792)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1dpzge-0003Ff-SS; Thu, 07 Sep 2017 12:29:53 -0400
Received: by mail-wr0-x235.google.com with SMTP id v109so455697wrc.1;
	Thu, 07 Sep 2017 09:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=1aQT/9R7xMbAkhP2IQx2ZtVSqFkit4+d1xVjVfRTBl4=;
	b=uqGcnN+GZBEaG0+tA1ec7PxBH8wKg9xPb+U+n1rcR6mDLoEEfIG09bWeuk4OtmSoEN
	jAMxvRWO1ti/naJEDcg5/aR1Z+XeCyeEertmfrKRTXXdk2eu0FaBBNh81mBu98nAyRmh
	Av4WMDasjkqpbmQGJ6rBdZEYIJQTB+yLpqESbBE71zzj3cs/wDzIE7PScAVgWKKMZVqZ
	i0DWkZXyqNejgBEjFKxTY90kRQzNgjBmMJzl/3VSaRn2P2j39d6XRQf5jKcz4SvU8G0H
	4GucGUyujnIwkhXsa0pN4dq013T+61mkblx2akFgeBngnqdcyhCjLAligqTm3EpSBKm4
	kT4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=1aQT/9R7xMbAkhP2IQx2ZtVSqFkit4+d1xVjVfRTBl4=;
	b=swP5FkmLFS6O5sqP68tV0uVYCbJB1sjkYznmzgSY3IwsUy9O+yHOX+Cyz2OiwJ/rBE
	ukLdqQyKetFDUIBs45iBvKGKVb6EmlPH8jKPXuS8HUGVMGnWU3YBFzrpsTcdE2wk6uv7
	Xz6d/43HQ8C4JxXC1kEmll1sGTxOoyrsxLYGnAtpp6eu2FTE0xQ/EC/r159pFK6Xq6P7
	YamCho001pYqPKyiYu7lSlTq5FKBeL3zp4V0kkqBVNVsN0SnhwvyzM4hc4H4d3rd6FYx
	Tc5uthNsPKLe/IHOxV4ZrkWTTMTsYrpYvm7PqOgvjFr8QSKI6Qf83kCym3WtSkvEZSlV
	Q6AA==
X-Gm-Message-State: AHPjjUhc9NqYtOPOANtPOTP80SUHOtyV2t/lnSgsiQmu5/WPNIy8C/zW
	oRCPKxPvaTUo+BIgJvWLPB0a/xfcow==
X-Google-Smtp-Source: ADKCNb4jfXXj28Ez0BifLU023OfNiDAKCkmG85hpfSJptY7So4l0KfbzBb03yr/i1tvHK5b+Lyzh1s7qDfoWvig/ujI=
X-Received: by 10.223.196.228 with SMTP id o33mr2307772wrf.253.1504801791744; 
	Thu, 07 Sep 2017 09:29:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.191.130 with HTTP; Thu, 7 Sep 2017 09:29:20 -0700 (PDT)
In-Reply-To: <CAKmqyKMd0JcEtkqiajLd5sbWP9WpjS8XqwfGGWPuANchE5Ej3A@mail.gmail.com>
References: <cover.1504222314.git.alistair.francis@xilinx.com>
	<CAFEAcA8TSpNkz3ew+wk6K0vu18B5RCr=0vbkihcaDz8v2zUN8g@mail.gmail.com>
	<CAKmqyKMd0JcEtkqiajLd5sbWP9WpjS8XqwfGGWPuANchE5Ej3A@mail.gmail.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Thu, 7 Sep 2017 09:29:20 -0700
X-Google-Sender-Auth: Sx_AwgPUyQ5XTn-mg-QG-VvGqF0
Message-ID: <CAKmqyKPSm4UHL7K0ZBGF28Z+wZ0qtMLd7CSvF9W94LwsXfN9zQ@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::235
Subject: Re: [Qemu-arm] [PATCH v2 0/5] Expose the secure and virt properties
 to the
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /abDofCZ4xzK

On Thu, Sep 7, 2017 at 9:01 AM, Alistair Francis
<alistair.francis@xilinx.com> wrote:
> On Thu, Sep 7, 2017 at 5:51 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
>> On 1 September 2017 at 00:34, Alistair Francis
>> <alistair.francis@xilinx.com> wrote:
>>>
>>> The EL2 and EL3 work is working well now and interanlly we now have
>>> tests that expect to start in EL3 and transition through EL2 to EL1. To
>>> make this easy to run let's expose the secure property to the machine
>>> and also add a virt property that can enable EL2.
>>>
>>> This series also does some machine/name tidying up and makes the first
>>> move to deprecating the EP108 machine, which was just an early access
>>> development board.
>>>
>>> V2:
>>>  - Add a virt option for setting EL2
>>
>> It looks like only patches 4 5 and the cover letter got through the
>> mailing list server, so patches and patchwork don't have the whole
>> thing. Could I ask you to try a resend?
>
> Just re-sent now. Hopefully it works this time.

It looks like patch 1 and 3 still didn't make it through. I see them
leaving the corporate network and going through to my personal email.

Can anyone see anything on the QEMU mail server side? Any logs might
help me push IT to investigate.

Thanks,
Alistair

>
> Thanks,
> Alistair
>
>>
>> thanks
>> -- PMM
