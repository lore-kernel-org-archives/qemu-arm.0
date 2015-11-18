Received: by 10.182.158.201 with SMTP id ww9csp1560315obb;
        Wed, 18 Nov 2015 12:30:47 -0800 (PST)
X-Received: by 10.31.13.70 with SMTP id 67mr757108vkn.7.1447878647313;
        Wed, 18 Nov 2015 12:30:47 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d185si803799vke.141.2015.11.18.12.30.47
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Wed, 18 Nov 2015 12:30:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=pass header.i=@pebble-com.20150623.gappssmtp.com
Received: from localhost ([::1]:38201 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1Zz9NO-0004ho-Os
	for alex.bennee@linaro.org; Wed, 18 Nov 2015 15:30:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34230)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <francois@pebble.com>) id 1Zz9NM-0004hb-DQ
	for qemu-arm@nongnu.org; Wed, 18 Nov 2015 15:30:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <francois@pebble.com>) id 1Zz9NL-0002th-9J
	for qemu-arm@nongnu.org; Wed, 18 Nov 2015 15:30:44 -0500
Received: from mail-wm0-x22a.google.com ([2a00:1450:400c:c09::22a]:35758)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <francois@pebble.com>) id 1Zz9NK-0002ta-Vv
	for qemu-arm@nongnu.org; Wed, 18 Nov 2015 15:30:43 -0500
Received: by wmdw130 with SMTP id w130so214538723wmd.0
	for <qemu-arm@nongnu.org>; Wed, 18 Nov 2015 12:30:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pebble-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=Pj0LljX0Z45qFUiYwlMqfghWf5dHuPxX0TCpjdAmEqA=;
	b=rM1FEym9FwOski4Pod7UyW5i8t0v3XxALVtZIbgIq4iDC8bea1Hn7r4yqqxzxGwaSB
	jCKZSDuXEAxXB+Qgyqgkaj9Ni2nowZJhuTkc9xea7L82w0+1hRVlnJ10azygSNRKNv3h
	s8PdzHskOSflYoOehKPP+J0gLgyx0oP+7tVF8VjkAqG9/09JGY7rA4O42kOhk4ad4XOy
	xjHoPE9bUXF+5p6UGcdJ6p4+wdkeJLXuvHWP49mqwJ1KuYVpTlV0EEPR4hBS4AlxSkut
	hodXTT3YtdjiR1Ryi7jjbIjsfrh91MIuNzRTTb2WKapmJfE6Am9ALAEVJfg60Q2mNWlx
	Y8Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=Pj0LljX0Z45qFUiYwlMqfghWf5dHuPxX0TCpjdAmEqA=;
	b=TZRWSqEu10F2QAt+pS1+SLIiVnawyC1Y858HNvv7ftzdfjzBREwwvtNNN5K0/mvdl3
	vLIrPKaZ1/CdkYvVLPEBWkSK6fZ8YXJNTw11y4zjlVBThfNZ3niEG/nk07e42lvwku/F
	9QB5B4D6BiNaFn8+GaWcytrPJOoD/77n0RgppDmxKhKSgt6YdzVMGNt9mZ6XBaIg7FE6
	+IU8ob5qBPO7dLBYYRkjNrhVNHt6kSyZTC0Qz0uOJEg6Sx4TWO9loY9BW96elTrYvSx6
	PmzDq52ZcEiz/32VDFpeHNbowKieNLzG1fNmZBUuiZH8U36cUxQQA6FFegbMlfDm+v9y
	kxRA==
X-Gm-Message-State: ALoCoQkjsDgrfiVStKXTGJy9zMtXbeoRu4SRAGyq9ka39A+f7m6VlnEs9N3mgv2EpD6F5GYwS9pX
X-Received: by 10.194.83.228 with SMTP id t4mr4019362wjy.51.1447878641808;
	Wed, 18 Nov 2015 12:30:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.169.139 with HTTP; Wed, 18 Nov 2015 12:30:22 -0800 (PST)
In-Reply-To: <CAPokK=pn93wX9ePin_BQAtzYc43jJ0dYnNVVCRAYaifXst0cPw@mail.gmail.com>
References: <1447796430-90226-1-git-send-email-francois@getpebble.com>
	<CAFEAcA-oUjbRbOPdReNTEmW5bSXX6j9X+tdNyqr-fpKk8TqK2w@mail.gmail.com>
	<CAHpaMEZVHNbjGx9sRqevBn8XGoyB=3tqWfMAqM-LXFMSBXwdvw@mail.gmail.com>
	<CAPokK=pn93wX9ePin_BQAtzYc43jJ0dYnNVVCRAYaifXst0cPw@mail.gmail.com>
From: Francois Baldassari <francois@pebble.com>
Date: Wed, 18 Nov 2015 12:30:22 -0800
Message-ID: <CAHpaMEZPBp1xniXKQcJxqxA9STL0-5GQ+Y+ok1+=AUxEmJXu+Q@mail.gmail.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c09::22a
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH] target-arm: Priority masking with basepri on
	v7m
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: II2x3XHgcbBK

Hi Peter,

I must be missing something obvious, but I do not have the original
email thread (I was not subscribed at the time) and thus am finding it
exceedingly difficult to apply the patches using git-am.

I would happily test the patches otherwise.

Any guidance here?

Fran=C3=A7ois

On Wed, Nov 18, 2015 at 9:56 AM, Peter Crosthwaite
<crosthwaitepeter@gmail.com> wrote:
> On Tue, Nov 17, 2015 at 1:52 PM, Francois Baldassari
> <francois@pebble.com> wrote:
>> Thanks for the swift reply.
>>
>> Michael's changes look very good indeed. Thank you for pointing them out=
.
>>
>
> If you have tested them as working and fixing a problem for you, you
> should contribute a tested-by tag to the series.
>
> Regards,
> Peter
>
>> No need to consider this any further then.
>>
>> Cheers,
>>
>> Fran=C3=A7ois.
>>
>> On Tue, Nov 17, 2015 at 1:49 PM, Peter Maydell <peter.maydell@linaro.org=
>
>> wrote:
>>>
>>> On 17 November 2015 at 21:40, Fran=C3=A7ois Baldassari
>>> <francois@getpebble.com> wrote:
>>> > On armv7m mcus, the BASEPRI register can be set to mask interrupts
>>> > above a certain priority.
>>> >
>>> > This changeset implements that functionality by way of the NVIC which
>>> > ultimately sets the interrupt mask in the GIC.
>>> >
>>> > Signed-off-by: Fran=C3=A7ois Baldassari <francois@pebble.com>
>>>
>>> There are a lot of problems with our NVIC priority handling
>>> right now. You might like to take a look at the patch set that
>>> Michael Davidsaver sent out earlier this month:
>>> https://lists.nongnu.org/archive/html/qemu-devel/2015-11/msg01542.html
>>>
>>> That has some problems but I think it's probably the way we're
>>> going to go to fix up the NVIC.
>>>
>>> thanks
>>> -- PMM
>>
>>
