Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp480946lff;
        Wed, 4 Dec 2019 03:04:40 -0800 (PST)
X-Google-Smtp-Source: APXvYqwd6KQvXWm24xokv+yTP29PIi8QQCCr3QNAOa280EXQjBFU30KEmHaiTC9si5yw4vrr2Eh7
X-Received: by 2002:a37:6313:: with SMTP id x19mr2201468qkb.231.1575457480711;
        Wed, 04 Dec 2019 03:04:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575457480; cv=none;
        d=google.com; s=arc-20160816;
        b=MWFtL+gmpuVGDCKW1bU2GBDi88FUXvca5gxz89clKTfMEwnrsuE/wdP9W5deYWobd0
         VQ0mA9nRLT0B320Ho3mxEefG3y8XYNnGScItHnt6po8Fdgvk4Oj3xBBJUTWkuYnS6a1a
         AQ8mBg/BFnwDs1AxrT1LfDoFjfWj5EyPzN+yfCI/MHzdAB0gKSFB+k0052d76zq2LzX4
         mmxlMp7ads50y+vr6erRIZeHYeE3SYZOd47h3vqru9PEn8j23KA7FSyEIy7bScJliZSC
         lAPu+7RYwDa8w3eqVT4RjmVIoA8s8pIvxSNtO6L6HYVHYwpNiSlINl8rr/rAbeVXlVo0
         o5cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=0dwGLHg0baVBbBxWdrAAkf8RroB3yMWuAT5RxiT1E98=;
        b=fcUSslp+lWy7KogNGnwFe8Y/rZVNbebP0b7tJwMNVa67DgWnmGPVquBf86sMMUK+KQ
         eU/qDObFWCfdu/mG3Em0f2Nner2yIQC0hMM9WCqYjaLHBYWQglD1wMJOgAjoYHUr7e4e
         vZ8JQU+qZxtV+DVR566O7l6J5gpghqlnNF/P4WyWY5azi8Am/znyKgsDzClmQBEuL0b9
         udr8eY7IRfujhHQcy4/YLdxWJdaWibq1xnQo0ja/cdJKht5CBGgP8sKirjArBLYvrEPT
         KQchG5qZKdyNRewq2c4dgeon12blm12+TjGdRGeC+xqr+aYAIuU2QktkaPU9g3GG5luk
         em6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dDkqwAiE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u67si4023706qkf.368.2019.12.04.03.04.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Dec 2019 03:04:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dDkqwAiE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1icSST-0001hy-3f
	for alex.bennee@linaro.org; Wed, 04 Dec 2019 06:04:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46065)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1icRM8-0005FA-NW
 for qemu-arm@nongnu.org; Wed, 04 Dec 2019 04:54:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1icRLz-0003qA-G6
 for qemu-arm@nongnu.org; Wed, 04 Dec 2019 04:53:53 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:33504
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1icRLy-0003Zq-Ay
 for qemu-arm@nongnu.org; Wed, 04 Dec 2019 04:53:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575453226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0dwGLHg0baVBbBxWdrAAkf8RroB3yMWuAT5RxiT1E98=;
 b=dDkqwAiEZoEOmSghJwrZnW4Bk/GBYHG2FVLl8UMs2Dyco1lo5LwJRSWqLePObTEmrKxdGd
 1j0kOYUKMrlNpYkySPbO5gQiI8zZ39GnmSip2ySepwsW5HzBElLbNVTqQfj+pR/P655qRv
 cH/SChfUXH0yc0pwCx6vYdm0qvFggoc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-Uf6a6dCNO2SLpTP5hn71Pw-1; Wed, 04 Dec 2019 04:53:45 -0500
Received: by mail-wr1-f69.google.com with SMTP id u12so3375107wrt.15
 for <qemu-arm@nongnu.org>; Wed, 04 Dec 2019 01:53:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0dwGLHg0baVBbBxWdrAAkf8RroB3yMWuAT5RxiT1E98=;
 b=QiU5ndYCbeJShSBZ8nyhioQcd+NFFjhPFa7GXsEff858m0SLFr0TiD3QvXgQxfPzKn
 zYJiAQCI34p0hXMcpd+t9AYRvAgVvbTDJ8BpsQ3ICdiyxgvvKp8fMMdpIPEWYERYPyuO
 Rl0BAAzQIeVsPl10KZgqFy3pPl6hE62SiKHF2EQQkPybq54J15lNtXpYioNHhMPu4q5p
 DwdGKEsyqRnrLfDDQU8SLH0twKF+xt1psfDX36YVfYHOw/S7YeViEgKMc2ZCXgTiFFlk
 GmWRtY6NPTo8dhyOMZSWSU7Z045aIvNkQbmNHdlajj4M34WbIIUyheMxqacMz5BnXgu5
 ydQw==
X-Gm-Message-State: APjAAAWSTeFdQNw0WTLQq3EORbJaQxF0FjsgFMoeO4AUa0D9RVVnEz9P
 wFU/pVuczqcgw/1MOqOsgGUpMHae1s8GBrJTSxmt1b1Qa7xkF/2pL9xMZrrFUjdQrHb2OC/bSej
 7HizVyIm0AD7Q
X-Received: by 2002:adf:ea8a:: with SMTP id s10mr2942141wrm.278.1575453223867; 
 Wed, 04 Dec 2019 01:53:43 -0800 (PST)
X-Received: by 2002:adf:ea8a:: with SMTP id s10mr2942113wrm.278.1575453223568; 
 Wed, 04 Dec 2019 01:53:43 -0800 (PST)
Received: from [10.201.33.36] ([195.166.127.210])
 by smtp.gmail.com with ESMTPSA id k19sm6024344wmi.42.2019.12.04.01.53.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Dec 2019 01:53:43 -0800 (PST)
Subject: Re: [PATCH v6 3/9] qdev: add clock input&output support to devices.
To: Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20190904125531.27545-1-damien.hedde@greensocs.com>
 <20190904125531.27545-4-damien.hedde@greensocs.com>
 <CAFEAcA9M4qR89wykURrUxqxeWoNqYHxuJSwC5Mum6GfmWSG=nA@mail.gmail.com>
 <8ac54ca8-4acf-5145-9ead-6791a5181617@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d6937a23-d6d5-fe22-bc42-0bec543decf6@redhat.com>
Date: Wed, 4 Dec 2019 10:53:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <8ac54ca8-4acf-5145-9ead-6791a5181617@greensocs.com>
Content-Language: en-US
X-MC-Unique: Uf6a6dCNO2SLpTP5hn71Pw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Mark Burton <mark.burton@greensocs.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rLAA36xnZjM8

On 12/4/19 10:05 AM, Damien Hedde wrote:
> On 12/2/19 3:34 PM, Peter Maydell wrote:
>> On Wed, 4 Sep 2019 at 13:56, Damien Hedde <damien.hedde@greensocs.com> wrote:
>>>
[...]
>>> +/**
>>> + * qdev_pass_clock:
>>> + * @dev: the device to forward the clock to
>>> + * @name: the name of the clock to be added (can't be NULL)
>>> + * @container: the device which already has the clock
>>> + * @cont_name: the name of the clock in the container device
>>> + *
>>> + * Add a clock @name to @dev which forward to the clock @cont_name in @container
>>> + */
>>
>> 'container' seems odd terminology here, because I would expect
>> the usual use of this function to be when a 'container' object
>> like an SoC wants to forward a clock to one of its components;
>> in that case the 'container' SoC would be @dev, wouldn't it?
> 
> Yes. I agree it is confusing.
> This function just allow a a device 'A' to exhibit a clock from another
> device 'B' (typically a composing sub-device, inside a soc like you
> said). The device A is not supposed to interact with the clock itself.
> The original sub-device is the true
> owner/controller of the clock and is the only one which should use the
> clock API: setting a callback on it (input clock); or updating the clock
> frequency (output clock).
> Basically, it just add the clock into the device clock namespace without
> interfering with it.
> 
>> We should get this to be the same way round as qdev_pass_gpios(),
>> which takes "DeviceState *dev, DeviceState *container", and
>> passes the gpios that exist on 'dev' over to 'container' so that
>> 'container' now has gpios which it did not before.
> 
> Ok, I'll invert the arguments.
> 
>>
>> Also, your use of 'forward to' is inconsistent: in the 'dev'
>> documentation you say we're forwarding the clock to 'dev',
>> but in the body of the documentation you say we're forwarding
>> the clock to the clock in 'container'.
> 
> I'll try to clarify this and make the documentation more consistent with
> the comments here.
> 
>>
>> I think the way to resolve this is to stick to the terminology
>> in the function name itself:
>>   @dev: the device which has the clock
>>   @name: the name of the clock on @dev
>>   @container: the name of the device which the clock should
>>    be passed to
>>   @cont_name: the name to use for the clock on @container
> 
> I think container is confusing because depending on how we reason (clock
> in a device; device in another device), we end up thinking the opposite.
> 
> Maybe we can use "exhibit" instead of "container" in the 2nd pair of
> parameters, or prefix use "origin" or "owner" as a prefix for the first
> pair of parameters.

@sink vs @source?

>> Q: if you pass a clock to another device with this function,
>> does it still exist to be used directly on the original
>> device? For qdev_pass_gpios it does not (I think), but
>> this is more accident of implementation than anything else.
> 
> It depends what we mean by "used by".
> Original device can:
> + set the callback in case it is an input
> + update the frequency in case it is an output

Hmm here you use @input vs @output...

> But since an input clock can only be connected once,
> I think the logic here is that any connection should now go through the
> new device. But this is not checked and using one or the other is
> exactly the same.
> 
> Maybe I misunderstood the meaning of qdev_pass_gpios().
[...]

