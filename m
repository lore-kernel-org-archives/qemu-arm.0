Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp189853ejn;
        Wed, 19 Oct 2022 02:50:53 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7GjO1YkWMb0WwoQKT/k4p5mJtsQkok5ljPEzu3zx+MDe8SalTVtMUAU2JGSqRF7u2++Rur
X-Received: by 2002:ac8:5848:0:b0:39c:e974:1c2c with SMTP id h8-20020ac85848000000b0039ce9741c2cmr5616650qth.674.1666173053158;
        Wed, 19 Oct 2022 02:50:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666173053; cv=none;
        d=google.com; s=arc-20160816;
        b=Ty7HXMjMOgWNzOn8XutfPdT4rIfNAdINgp/ji1D9g3akZLEGrM95fXEe3zCyZSAMBO
         8zeTi8gw0NiIq1Tsv/hIH0hE2Tq0CJgYoa6PkOBZXC1aBdHH/2LMFiULDrkJ4xEmg5Vv
         GlJQHWRjydYFsIcfykt8umJyTJiDXEMUdolj1KNZm0mjBmayPM4Pxaqgn3el1mNH1Auq
         ivjTNop4O+u4YHtk4Ag5O/hOZdOMvuafjHTZaZyIVGGgDoZOIgsgW08wOUutHLJu09Fs
         AhdVgPki+PMDbVvj2iFGtYbo72JNqhH6cSDtz7cZQXC+cOmWmqTwN+4IFuv1unYq8Kj9
         WOIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=bfLfUI5VV/aiOPg3GhIqLRIMALZTgk/QoebBxXK1huM=;
        b=SgqdwEG8F8EAxO7FxbppBuk883k0Lr7PcdgpzHb4/wcqxUjncX//Mf9uVAHDqZbGER
         2Rt1DxE2Jlvz3HNwLF1VqzaH3YT1ey7ZObj2zSeK6KlQcfX5lGWtUYUYV+XcZyhX2KXR
         H5qiKAkR9m4n7NfjNycOiWv3BkDAkZ1hRqdbSW923yay8f6zAw2JIDx7u48p5sDkYFlm
         YjYBhENU8+mGtRZy1QgdrFuHOO0HMUgoLdnQeAbHUnOTk1V+JPUq5J5dJi+/fhQ7pgFJ
         Fp3KonK+zZF4Pc8enTxeaNtUMWADvqZnxUDw4NCD3WXxtCV+QRnP5/9mKYBEcuHvJ/2a
         K8Ng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@xen.org header.s=20200302mail header.b="R/sNYXaK";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ff25-20020a05622a4d9900b0039429329111si8475614qtb.707.2022.10.19.02.50.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Oct 2022 02:50:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@xen.org header.s=20200302mail header.b="R/sNYXaK";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ol5iu-0000bK-K6
	for alex.bennee@linaro.org; Wed, 19 Oct 2022 05:50:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <julien@xen.org>)
 id 1ol5hW-0000Yt-IH; Wed, 19 Oct 2022 05:49:26 -0400
Received: from mail.xenproject.org ([104.130.215.37]:44490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <julien@xen.org>)
 id 1ol5hU-00053a-L2; Wed, 19 Oct 2022 05:49:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID;
 bh=bfLfUI5VV/aiOPg3GhIqLRIMALZTgk/QoebBxXK1huM=; b=R/sNYXaKXsGrijxYxCqDDX2I7t
 0Xkr0UBz4xOrhDWGa/Lo1xcTpqkpq9+Eihd3AfGQYNA5YxOBe1cWU75pgSkK5SQTR4JxPRlv4tTUw
 CDF0QM/ueCJ7slJzr2HuYsN3q5cadmWkcaD2IaT75vCOtXXQE0k0r0TWv9sQmhG87iGA=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ol5hM-0000EO-SK; Wed, 19 Oct 2022 09:49:16 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234] helo=[192.168.0.59])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ol5hM-0007JZ-KS; Wed, 19 Oct 2022 09:49:16 +0000
Message-ID: <2abb8f7d-fcf8-7ed6-b180-a715b5d6a5ba@xen.org>
Date: Wed, 19 Oct 2022 10:49:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
Subject: Re: [PATCH v1 10/12] hw/arm: introduce xenpv machine
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Vikram Garhwal <vikram.garhwal@amd.com>, qemu-devel@nongnu.org,
 stefano.stabellini@amd.com, Peter Maydell <peter.maydell@linaro.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
References: <20221015050750.4185-1-vikram.garhwal@amd.com>
 <20221015050750.4185-11-vikram.garhwal@amd.com>
 <3e504b1b-197d-b77b-16e1-86530eb3d64c@xen.org>
 <alpine.DEB.2.22.394.2210171345450.2351079@ubuntu-linux-20-04-desktop>
 <460a480e-4e91-8d78-60da-59b9cc98beee@xen.org>
 <alpine.DEB.2.22.394.2210181241320.4587@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2210181241320.4587@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=104.130.215.37; envelope-from=julien@xen.org;
 helo=mail.xenproject.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MTv2mYAB8Qh3

Hi Stefano,

On 19/10/2022 01:15, Stefano Stabellini wrote:
> On Tue, 18 Oct 2022, Julien Grall wrote:
>> On 18/10/2022 02:26, Stefano Stabellini wrote:
>>> On Sun, 16 Oct 2022, Julien Grall wrote:
>>>> Hi,
>>>>
>>>> There seem to be some missing patches on xen-devel (including the cover
>>>> letter). Is that expected?
>>>>
>>>> On 15/10/2022 06:07, Vikram Garhwal wrote:
>>>>> Add a new machine xenpv which creates a IOREQ server to register/connect
>>>>> with
>>>>> Xen Hypervisor.
>>>>
>>>> I don't like the name 'xenpv' because it doesn't convey the fact that some
>>>> of
>>>> the HW may be emulated rather than para-virtualized. In fact one may only
>>>> want
>>>> to use for emulating devices.
>>>>
>>>> Potential name would be 'xen-arm' or re-using 'virt' but with 'accel=xen'
>>>> to
>>>> select a Xen layout.
>>>
>>> The benefit of 'xenpv' is that it doesn't require any changes to libxl.
>>
>> I am quite surprised. Looking at the code, it seems to work more by chance
>> than it is intentional as the code is gated by libxl__need_xenpv_qemu(). So it
>> would not start if there were no emulated devices.
>>
>>> It is even backward compatible so it could be used with an older version
>>> of Xen/libxl.
>> We don't really gain much here. IOREQ is a tech preview and anyone that wants
>> to try it should really use the latest Xen.
> 
> I think that's fair.
> 
> 
>>> Backward compatibility aside, if we come up with a
>>> different name then we'll need changes to libxl and to manage those
>>> changes. For instance, if we use 'xen-arm' that would mean we would need
>>> to handle per-arch QEMU machine names.
>>
>> Right, so the main argument here is for simplicity in libxl
> 
> Yeah
> 
> 
>> Looking at how 'xenpv' is built, this is really expected to deal with PV
>> backend rather than emulated device. I do expect some changes as we go along
>> to be able to add emulated device.
>>
>> Furthermore, libxl is not the only toolstack out. So I am not convinced this
>> is a good argument to keep the name the same.
> 
> Let's think some more about the naming strategy. From a QEMU point of
> view we could choose any name we like (Vikram please confirm), the issue
> is really on the libxl side.
> 
> Today libxl understands two QEMU "machines": xenpv and xenfv
> (pc,accel=xen is the same as xenfv, I'll use xenfv in this email for
> simplicity).
> 
> xenpv is for PV guests and only provides PV backends, no emulation. It
> is used on both ARM and x86.
> 
> xenfv is only used on x86, and it is for HVM guests, with a full set of
> emulated hardware (PIIX3, etc.).
> 
> The purpose of this series is to introduce a QEMU machine that:
> - works on ARM (but could maybe work on other archs as a stretch goal)
> - provides PV backends
> - no emulated devices by default
> - also can emulate selected devices on request
> 
> Certainly it is not xenfv or pc,accel=xen because they would with more
> emulation by default. This is more like "xenpvh": an extension to PV
> with also the capability of emulating one device as requested. It is not
> intended to emulate a full PC and doesn't do that by default like xenfv.

The definition of "full PC" is not very clear for me. Unlike x86, Arm 
doesn't have legacy devices that needs to be emulated. So technically, 
if we emulated one network card and one block device, then we would be 
able potentially be able to boot an unaware OS on Xen on Arm. This would 
be the same as if you passthrough-ed the two devices.

In the past, I have seen interest to boot OS like Windows OS/iOS on Arm. 
I do expect that the addition of a Xen platform in QEMU will lead to 
another increase of the interest because we could expose anything to the 
VM. Although, it might need some tweak in Xen to allow more dynamic 
layout just in case an OS doesn't discover dynamically devices.

> 
> If/When x86 PVH gains the ability to use QEMU as IOREQ server, I would
> imagine it would run a QEMU machine similar to this one.
To me it would sounds odd to add emulated devices in the 'xenpv' because 
they would only work for PVH domain. AFAIK, QEMU doesn't know whether a 
domain is PV or PVH. So we would solely rely on IOREQ to return an error.

> 
> This is also how I would imagine it would get integrated in libxl: as a
> xenpv + individual emulated devices. Not as HVM for ARM. The other QEMU
> command line arguments are inline with the xenpv command line arguments
> rather than xenfv command line arguments. This is why the libxl changes
> are small to zero to make it work today.
> 
> So, I think the following options work:
> 
> a) call it "xenpv" because it is an extension of the old xenpv machine
> b) call it "xenpvh" because it is PV + few individual emulated devices
> 
> If we call it xenpv there are fewer changes in libxl. If we call it
> xenpvh there are more changes in libxl but we can distinguish xenpv from
> xenpvh (I don't see why we need it right now, but I could imagine it
> could turn out useful in the future.)

IMHO, we need to plan for the future.

> 
> I would stay away from arch-specific machine names because it will make
> it harder on the libxl side without immediate benefits.

If the name is the only change, then I would expect this could be done 
with a per-arch define. So that would be a few lines change maximum.

Cheers,

-- 
Julien Grall
