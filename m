Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp347914lfo;
        Wed, 3 Feb 2021 08:05:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy7PJDTZeFwIv9S0kyTgw4HEqRxF9Jy7GI87yhmMhYKldLgAVxnFsT0F19XJwkfNxSSbKzM
X-Received: by 2002:a05:6102:3205:: with SMTP id r5mr2222961vsf.12.1612368339378;
        Wed, 03 Feb 2021 08:05:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612368339; cv=none;
        d=google.com; s=arc-20160816;
        b=qAgtzl2ZrccK5ppL3yvtjNUciWT+rrvv/f1J36T1H7cZLsl+9Oom8ijE8NEjZVo/ci
         zhBjB9AXwAz2l0loGrCihO+nlBi+vwVAyEnfVaWFMFC6/YV4iUe8qmLr8YMe+RUGLCNk
         k9DWaa++WH1zKVuTw6Zu74AWVWSiCbm5QvBuZ8jdv4ugbauSgILEJgRFtTqpeId1w0D/
         LOh/cLEWSayJ2amq+Zqq8lWmIJwmAB7ZySuW3SEVlFG4+V/ZwERH1RGA0xc5mK0rYCk4
         yA9Fpdv8dD3y6q+l1kYMYv2bHm6Bao9PH+szuMa28NfGJfZ9sHFc09i4RowuYZFLfYoi
         eLjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=gmvZNim+xmUC/DnVZ6bCrKui5923MlZbBn0a+dFPYAA=;
        b=pDYa3mY+t2I1lpO7hDHwFN9pmMMncJuM2gPMfrvGG05Gb9E6tHPE8HOnF4A5xl8VV3
         PTS7XTAlrgT1dFdr4LruQ8DhIu17ZaB5Juf4n/d4M9K9Nbntu/3TBTlq+zo4HuKt3w8z
         pvluuHzrjHNcKLz531PHR/Hp9wm0q0M2m5/lyS/LbiC3Zk4mDDhAz/auAzC0HGyTxxI1
         8wIyeb0LC99o5+sOiPGTVivVNrMj1C3yBw2Ss9BkZFwcaSjd3eoNW+/kKO5DMxxe633t
         Ah7p0q3DCsV+zAjC/wkqDTnGZ6RJnVaWxdauqkQmts8qC1jG2oH9Ck2B2779UN8ETO6U
         qliw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Ft/qXPDq";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o27si326286uaj.158.2021.02.03.08.05.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Feb 2021 08:05:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Ft/qXPDq";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l7Kew-0004cL-KO
	for alex.bennee@linaro.org; Wed, 03 Feb 2021 11:05:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7KeI-0004Ye-J7
 for qemu-arm@nongnu.org; Wed, 03 Feb 2021 11:04:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7KeF-0005Tu-Ki
 for qemu-arm@nongnu.org; Wed, 03 Feb 2021 11:04:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612368294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gmvZNim+xmUC/DnVZ6bCrKui5923MlZbBn0a+dFPYAA=;
 b=Ft/qXPDqbM9O23gssdSE30mBq4v6pTc8S6vA5/J1dxJxRpKCDHX9S9cmLH34/dXA+PzM+e
 O0lr4ToE7Ej+BFK1u7WmJM4UqsD078jpv75u5omUyUSnrsj51Cz8znyq7AQO5hIgo/9/so
 Q28u26EFrYjkQB2Pq4tAyJbIWWITAjg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-T4pgO0pFMUyao-YOqZbuyA-1; Wed, 03 Feb 2021 11:04:47 -0500
X-MC-Unique: T4pgO0pFMUyao-YOqZbuyA-1
Received: by mail-ed1-f70.google.com with SMTP id u19so74942edr.1
 for <qemu-arm@nongnu.org>; Wed, 03 Feb 2021 08:04:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gmvZNim+xmUC/DnVZ6bCrKui5923MlZbBn0a+dFPYAA=;
 b=iaeOOLwJgXBBpBvB829C3prIOyjSYMH8pYzMwumvi6xPNHbQeuKKofG5I9pHgv2eWy
 EVk0cFqBeAQMlI1+P5K0GYAPW5/bKmNPlkDQsvebuK3DFPlh8FUKLnWbJUlAe5dcYlIE
 Q76aCOXKC9K9AFMLJeyKroBTaT2b2u+N66f94760w+YP4B6aTpj9OuoVQ3Sjp8s063iH
 mxdoiDREpkqDGZ1E0stqX1dSnzpvJlbUjbQWpdjPomCweBmTwKmaSGfiRLUd5fIEVY87
 SsZhWX9uPZ9Zq5gmiwXbzyt5NipemWDkIzJEKmCQQRtapb4eS6HcdcrNapn/5ov++jGw
 sNvg==
X-Gm-Message-State: AOAM5302ucwUaoy1APhe1LZjOMPAA+jy7C0WFYwlcirud0Vu+jOkijUS
 KuXs3c31uaAEjh0C6C5U2Tk78hQ+A46GuU9TpqGLTLiHqcWe3y5pTIa06sYv0w/8S5Y+6d/P1c7
 +aViVVxodppFf
X-Received: by 2002:a17:906:f2ca:: with SMTP id
 gz10mr3793935ejb.285.1612368285819; 
 Wed, 03 Feb 2021 08:04:45 -0800 (PST)
X-Received: by 2002:a17:906:f2ca:: with SMTP id
 gz10mr3793893ejb.285.1612368285502; 
 Wed, 03 Feb 2021 08:04:45 -0800 (PST)
Received: from [192.168.1.36] (107.red-83-59-163.dynamicip.rima-tde.net.
 [83.59.163.107])
 by smtp.gmail.com with ESMTPSA id df15sm993335edb.24.2021.02.03.08.04.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Feb 2021 08:04:44 -0800 (PST)
Subject: Re: ARM Snapshots Not Backwards-Compatible
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 avocado-devel <avocado-devel@redhat.com>
References: <YBogDGJRU5pcDKmi@strawberry.localdomain>
 <153e5c54-f8bf-d088-502d-502309f5d2a6@redhat.com>
 <20210203102758.GC2950@work-vm>
 <CAFEAcA9_mcXHd5m+Z2M1jvk58kGVEcYKF+0kVsLJTjwB9MZcfw@mail.gmail.com>
 <20210203104920.GE2950@work-vm>
 <CAFEAcA9DdiBA+-5cQ87NR6fHFFFJAtDVbAEc+AJQNMNo4bVB+A@mail.gmail.com>
 <20210203105933.GF2950@work-vm>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d31bcfff-04e3-95e3-a98a-ebe9394366d9@redhat.com>
Date: Wed, 3 Feb 2021 17:04:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210203105933.GF2950@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.178, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Juan Quintela <quintela@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Aaron Lindsay <aaron@os.amperecomputing.com>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rDDIf+98ygRh

On 2/3/21 11:59 AM, Dr. David Alan Gilbert wrote:
> * Peter Maydell (peter.maydell@linaro.org) wrote:
>> On Wed, 3 Feb 2021 at 10:49, Dr. David Alan Gilbert <dgilbert@redhat.com> wrote:
>>>
>>> * Peter Maydell (peter.maydell@linaro.org) wrote:
>>>> On Wed, 3 Feb 2021 at 10:28, Dr. David Alan Gilbert <dgilbert@redhat.com> wrote:
>>>>>
>>>>> * Philippe Mathieu-Daudé (philmd@redhat.com) wrote:
>>>>>> Cc'ing migration team and qemu-arm@ list.
>>>>>
>>>>> I'll have to leave the detail of that to the ARM peole; but from a
>>>>> migration point of view I think we do want the 64 bit ARM migrations to
>>>>> be stable now.  Please tie incompatible changes to machine types.
>>>>
>>>> That is the intention, but because there's no upstream testing
>>>> of migration compat, we never notice if we get it wrong.
>>>> What is x86 doing to keep cross-version migration working ?
>>>
>>> I know there used to be some of our team running Avocado tests for
>>> compatibility regularly, I'm not sure of the current status.
>>> It's something we also do regularly around when we do downstream
>>> releases, so we tend to catch them then, although even on x86 that
>>> often turns out to be a bit late.
>>
>> So downstream testing only?
> 
> I thought there used to be some regular avocado testing of upstream but
> I'm not sure if it's all architectures and I'm not sure if it's still
> happening; I haven't seen any migration issues from it for a while,
> which makes me think it isn't.
> 
>> I think that unless we either (a) start
>> doing migration-compat testing consistently upstream or (b) RedHat or
>> some other downstream start testing and reporting compat issues
>> to us for aarch64 as they do for x86-64, in practice we're just
>> not going to have working migration compat despite our best
>> intentions. (None of the issues Aaron raises were deliberate
>> compat breaks -- they're all "we made a change we didn't think
>> affected migration but it turns out that it does".)
> 
> I'd agree; we still hit this too often on x86 as well.

Cc'ing avocado-devel, since previously discussed:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg654139.html

