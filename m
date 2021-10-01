Received: by 2002:a0c:90cc:0:0:0:0:0 with SMTP id p70csp2789379qvp;
        Fri, 1 Oct 2021 04:42:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwhoYAy/KCtHe5K/l1XdLb9iJu/EIg5a+UEQaqOffVcZsVsE9eDd8GA4tZboAJ1WZ456OSo
X-Received: by 2002:a4a:c3c2:: with SMTP id e2mr9103342ooq.8.1633088552504;
        Fri, 01 Oct 2021 04:42:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633088552; cv=none;
        d=google.com; s=arc-20160816;
        b=V+nScWBu/SHIZvcNRchvJRxBEF2zMiCI7neTNQaDX4I7xUwzbxBF8HiNhRX0o47kD6
         NkxFzQfO/j/B7EhuNM9GT2rm5z5/D2bJBopLSMKZ//cY0EoqT4lHbnf9O9Bt9yOltJd/
         o2fE/Z++gADy9j1x8oAN4+PaDSPdiL1MX0FJ7KamtzuDH9xIpzMbml2COHZO5r5M/AuN
         aGlY4CNf/QW401B0rvlADeyNAkAFzI79KiPPjf/dQyKPB16XgvMCWbLsbtBQSibQzebq
         YQvtEpQT0dLWYjzFTDUyA8FwZT70JSPxtl9hd9z4sh3fY1mYnWbGYSg3INgJAhEC6yW6
         psNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:subject:from:references:to:dkim-signature;
        bh=Xfrex0QI7hpVzPgFFWdo8jVGIG7esty/IttIpU+pckc=;
        b=ARH/sbBBuo6UeD7v0NqmHo4Ozh9OZ9ZkVjx7YM7d75gns3u4MwSkHWLE84NCe6WGaO
         AyY0bVkH/isAGMdk+qihW4zAz4AzzmGisqIdnOUhMeBN+zbCF+MRCf2On6zelaZsAn0l
         wieWhjJjDYq0y6yg6Tmxaqj0/moqg4idbW5vovLzRs1jrfeO94308cL+7GfCcVvzHHHP
         hgGQU/+GFP3CTt6NYa+JSz6qvJbJ+VhNl5h1v2VPoPLys700RnQgQq0IfGdadRchup9Q
         fuFbzaPvKzWlxBvSPuV9NVYVSC48ozTtuq7EKY8rRZ8cyeRxy8laaJTWpKHTRFOLb9z0
         G8ow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JpZHP7Wv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i125si6202249oia.304.2021.10.01.04.42.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Oct 2021 04:42:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JpZHP7Wv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mWGvv-0002HP-Rk
	for alex.bennee@linaro.org; Fri, 01 Oct 2021 07:42:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mWGui-0001nI-NV
 for qemu-arm@nongnu.org; Fri, 01 Oct 2021 07:41:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mWGuf-0004h8-6P
 for qemu-arm@nongnu.org; Fri, 01 Oct 2021 07:41:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633088471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xfrex0QI7hpVzPgFFWdo8jVGIG7esty/IttIpU+pckc=;
 b=JpZHP7WvLgk+5CYYUXn9jys2s8MaJrOVq6rIVXNieTj2wZczGS0tSEEVCafvsuGJgkjoVI
 u+MaVEdcJYtHQyB9HM3ZzQVEi5e9SH62KYx16UCSOXuNhoJewox8tjhZksWmYWQ8wduT2M
 VrE4mzjMM2MfPG3EaPQmRJroJHdpdwc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-J9SI4ue5NtW4qyVqBuKUEw-1; Fri, 01 Oct 2021 07:41:08 -0400
X-MC-Unique: J9SI4ue5NtW4qyVqBuKUEw-1
Received: by mail-wr1-f70.google.com with SMTP id
 t2-20020adf97c2000000b001608326aa2fso1990752wrb.8
 for <qemu-arm@nongnu.org>; Fri, 01 Oct 2021 04:41:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Xfrex0QI7hpVzPgFFWdo8jVGIG7esty/IttIpU+pckc=;
 b=MygAnTFXLIzse57ptZBInezyRBCtF5RbNrL5GftK+Sj5Ge4fD0xefCnOwjtIU2LMEc
 R0iimZGUVCtIYcDHMxQKjxJ7vjUdD9wdhiGXGSu1hb0poCFJc40gcpU+SnsyF27O+2Z/
 S2yZ15lM2NR9eboKnsbjVk7ZfE2k9NIL/qdBmsiBIhks95Jh6ZDq+qzCFbFfnMIqxQC3
 M/TKDdoccb5pQfC5+MIxjwEV7H07Gb+o1HXpReDmDo4KlPcIH/sHCuZRcJpB/Fz1XTDx
 TmJY6bIVPd7fYBIjYPIy66GCqMFcxNV5IfmZml4CvUfptaMsxzA8s4CV2us4+jHZHI2l
 UsHg==
X-Gm-Message-State: AOAM532KGga3+M2FytPsvrYePJxBn3eIxLzkDRdsQ0abPq/B6fJmrHwl
 0lTwtfOhBCHWVKde70YM12WcRkjgaWeocByJyFlN8ZhvzALeLJ7jk4bXJFX7NvCxjiqCQYMW47k
 Jnq4S9Bt8crVP
X-Received: by 2002:adf:dd42:: with SMTP id u2mr11729468wrm.39.1633088467178; 
 Fri, 01 Oct 2021 04:41:07 -0700 (PDT)
X-Received: by 2002:adf:dd42:: with SMTP id u2mr11729446wrm.39.1633088466953; 
 Fri, 01 Oct 2021 04:41:06 -0700 (PDT)
Received: from thuth.remote.csb (tmo-097-75.customers.d1-online.com.
 [80.187.97.75])
 by smtp.gmail.com with ESMTPSA id v10sm5795718wrm.71.2021.10.01.04.41.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Oct 2021 04:41:06 -0700 (PDT)
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210827120901.150276-1-thuth@redhat.com>
 <20210827120901.150276-4-thuth@redhat.com>
 <7004c933-5262-3119-80f5-722a8e858046@redhat.com>
 <YVbQERWD9fY0kxxW@redhat.com>
 <CAFEAcA8PdNEHU2YMGT56bCwezf9i+BGxijwevLJakrR_N1Yjhw@mail.gmail.com>
 <YVbYavVeV/OmYON6@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 3/3] dtc: Update to version 1.6.1
Message-ID: <9e3620ce-4a79-da2c-aaf1-20832622c576@redhat.com>
Date: Fri, 1 Oct 2021 13:41:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YVbYavVeV/OmYON6@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.127, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
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
Cc: Greg Kurz <groug@kaod.org>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Jjq1resqdOq9

On 01/10/2021 11.44, Daniel P. Berrangé wrote:
> On Fri, Oct 01, 2021 at 10:37:51AM +0100, Peter Maydell wrote:
>> On Fri, 1 Oct 2021 at 10:10, Daniel P. Berrangé <berrange@redhat.com> wrote:
>>>
>>> On Thu, Sep 30, 2021 at 09:10:12AM +0200, Thomas Huth wrote:
>>>> On 27/08/2021 14.09, Thomas Huth wrote:
>>>>> The dtc submodule is currently pointing to non-release commit. It's nicer
>>>>> if submodules point to release versions instead and since dtc 1.6.1 is
>>>>> available now, let's update to that version.
>>
>>> Most of our supported platforms don't have version 1.6.1 available.
>>>
>>> As a general goal IMHO we should be seeking to eliminate bundling of
>>> 3rd party modules that are commonly available in distros. We've
>>> carried dtc for a hell of a long time, and if we keep updating our
>>> submodule we'll keep relyin on new features, and never be able to
>>> drop it because it will always be newer than what's in the distros.
>>>
>>> So personally I think we should never again update dtc and capstone
>>> modules. If we want to take adbantage of new features, then do that
>>> through conditional compilation, as we do for any of the other 3rd
>>> party libraries consumed.

I basically agree, especially for capstone. But for dtc, that also means 
that we cannot compile certain target boards if its not available ... that's 
somewhat more ugly than if there is just a missing backend feature ... but I 
guess it's still ok. Users could always install a recent libfdt first.

>> I agree in general, but (per the commit message here) our dtc
>> submodule is currently pointing at some random not-a-release
>> commit in upstream dtc. We should at least move forward to
>> whatever the next released dtc after that is, before we say
>> "no more dtc updates".
> 
> Yep, if we want to fix it onto an official version tag, that's
> OK, just not jumping right to very latest version.

That was the intention here. Accidentally, the first release tag after the 
commit that we are currently using, is version 1.6.1, which also happens to 
be the latest version, too.

> We might want
> to move it backwards to better align with what we're targetting
> in the support

We shouldn't use an older versions as submodule since there was a problem in 
libfdt on Sparc hosts on older versions. All other hosts should be fine with 
version 1.5.1 though (which is what we're indirectly checking in meson.build)

> Best I can tell the distros currently have these versions:
> 
>       - Alpine 3.14 - 1.6.1
>       - CentOS 8 - 1.6.0
>       - Debian 10 - 1.4.7
>       - Fedora 33 - 1.6.0
>       - OpenSUSE Leap 15.3 - 1.5.1
>       - Ubuntu 18.04 - 1.4.5
>       - FreeBSD Ports - 1.6.0
>       - OpenBSD Ports - 1.6.0
>       - macOS HomeBrew - 1.6.1
>       - Windows MSys2 - 1.6.0

Thanks! I was just about to collect the same information, too.

So I'd suggest: Update the submodule to v1.6.1 now, so that it points to a 
proper release tag.

Then wait until Debian 10 and Ubuntu 18.04 are EOL (sometime in 2022), then 
we can finally get rid of the dtc submodule an rely on the system fdt 
instead (assuming that versions that are older than 1.6.1 will be fixed by 
the distros on Sparc hosts).

  Thomas

