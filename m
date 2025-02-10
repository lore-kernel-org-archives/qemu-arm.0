Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp1798065njb;
        Mon, 10 Feb 2025 00:46:35 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXCvKu3yfYzreAYsU2z5AzyJg0ybTg9QxWvhrZ342mfed7kUVuG6/oWD0w7wG9LvEdcY7PWhfV5ptVQMQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHm4BSoyZ0dl8oaRZc5/yPUCRDPjh3V4QSkXo2iVHBkILtwCoqx1wddbwiONJ6DXgm4S607
X-Received: by 2002:a05:620a:bcb:b0:7b6:d736:55c1 with SMTP id af79cd13be357-7c047ca784cmr2169706185a.48.1739177195244;
        Mon, 10 Feb 2025 00:46:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739177195; cv=none;
        d=google.com; s=arc-20240605;
        b=WUMlB+0mlL+1odSVo6rNx+2uVdjGr1Q8aTH6tdmYyB6jqklI0vnwNRSDKsKIMq+/Ak
         0Ex2SMlT5Mc63N4l+ojNOyknHdNP6j7P3QEVGHxOPlM0n/U2kRIn+F9Ypnf3UglZMguo
         JB89ovUOVNRAMxK3RlJClk6QM21FseHkBfMij+Sz9/NBpFKtHH90fH3efPLMRQ1dX5Lh
         4QBny7C+i4Xke9XTKgbgkpOEfk7RofijmE7KmHhrfeWXrcyeffqSTuee647tNlAdZdrZ
         239yCPhjD88Xr2FO7F7iDqPue+PrQjAg1XfZSolTId5XoBVGisEhKp2hmhMWYlt27TBj
         yLUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=1Yxw9wJ/eCV0W+yEwON0vaPP/3SiyUK8VOJ3gFn3Alc=;
        fh=gOoD+irfJ+rdqpI7t6Lm/8UiMczuT2MRt+dxcmwRFPc=;
        b=dXlbs0KxkLuL0+uSCxl4ujVgHqNabL1jcvB/nJd977MxWCzRzOE7Hozo7a5Po0+bi7
         RIB/01omvDYCG54vvsY8Uld3Xvsq6OGSN+NcnnOCJbYK/SylEbFfe3n5vkG2BHkYIQJk
         MH/efnkwBZ3P2vwjdZjO1NoKe9mZD+IFp5Ayf+nJrp+Pt6PWQ9VFs80Fi7RSeGRXuMhD
         wD3cc8l+MHHQJz8S+ZUEIMZrJ/MijbEqQkkyz/rVpNltLx0P4Un+D2PNUkSr7FwBL1ID
         MlXJ4Emy+Ym2kfhRb8E2q00kbjP0u6IF1TnR89GnNpSryB+S/Fz/0N0A6/BSdOim/Boa
         cNOg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=P0XJzBaf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c041e94dc6si877326985a.258.2025.02.10.00.46.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Feb 2025 00:46:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=P0XJzBaf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1thPQv-000653-RH; Mon, 10 Feb 2025 03:46:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1thPQf-00062g-IW
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 03:46:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1thPQX-00041v-Sz
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 03:46:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739177157;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1Yxw9wJ/eCV0W+yEwON0vaPP/3SiyUK8VOJ3gFn3Alc=;
 b=P0XJzBafk+NV5JTwY1MhuqYqYIIO0sYS2keuoZQ9Pa0Y6dv+ALxuqGi7kUiToJK3BKwe9E
 GQwgrXTUqETWB29isuvCOsJykQCKrCgov/sExPVM4mTpXGRrEOn6Z0zX3RKxuChZ1RAWgi
 1UvXzIWMIj8i16bisMW5Ygjux7EbcZ8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-175-Ao0hebifOJOgkoSXhfUM5w-1; Mon, 10 Feb 2025 03:45:56 -0500
X-MC-Unique: Ao0hebifOJOgkoSXhfUM5w-1
X-Mimecast-MFC-AGG-ID: Ao0hebifOJOgkoSXhfUM5w
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-38dce0d3d34so1075566f8f.2
 for <qemu-arm@nongnu.org>; Mon, 10 Feb 2025 00:45:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739177155; x=1739781955;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1Yxw9wJ/eCV0W+yEwON0vaPP/3SiyUK8VOJ3gFn3Alc=;
 b=apwgLLtHJLz1LRW0FwuvMFhDUBWKcs4FxRhWVUY7cYE/zX4P9IRIp4q/dHSGKFtIC3
 NsjmEl9mrfhK1IjvV7PQq8ekNnAhcezvI9MLa1YbkpBXju1AiNaPxUYudaMRTZFW80jO
 TWIpthWPO7YyjQHAjrLQQAKkKbV7UDxDLokG0xylw4Tn7Fj7+TRp6sE3G08D5ds1rM0V
 nC4WeIXqUmVIpGldZZz6CTEef7XnbstQ3pEt9zkcxiYgdY7mEgMt0TjlhzkfWfxW57fY
 j4ytl+qVKRM9s///8ut1Sp2Z+q/OQ2yPqdaiayFx8dtVpFe2nRSlSxi3arWyWvmCw+h7
 jhGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtUTN+M3XyvZNac0oAzPLnvrizu6RdUuEnOGlXgqt00hsZcz5GJCJyOjpNBYoh5vjuhWLmULuSqw==@nongnu.org
X-Gm-Message-State: AOJu0YzWku3b0BKFKBeZ7HZ3mfgRThslfqS0XY6IWZe2UHNIxfJQYZxf
 ZnKrvU9VEoRGkK8yiY4EHZVBFLKDBIfw/4dwYKF8/qBCfM4nGgcdx53ivFtyU7WW+ULCzxCNzke
 mvklTDE+Fel5fCpVjCVwr7YhLagre5OiwA8x8WC3cYdd1IDfmHg==
X-Gm-Gg: ASbGncsBVzSAj3KynzVWd7wRAPKpruoIFSA+s/h6wvre34s8FIzNHCkf8Cn3+R+kjzj
 cHDMvvKHU65YMfcuqFDr7xHSA2k2ctzQwNaZczTGbWAN+5kkfm+sd0qww+WGOWlMlkatIvWweMA
 6AufphqrhU1XMXvPK7FNwhHayd8/GETPkMTRJUJRYKqTbQV0W5htSxprjU/oycCoIU9gNlo4Cmm
 Y3gpQLx35TfQVKxgBvI4sQ4PiPuT0f2kWqWDcBWpLQGB9v/C2vMdoFfI9aSI/QmjXpD12lQrwhQ
 PG64B8pvgCR3iXQd6kFxO1d5PczcU3BOnINwd/95uxf/Lr0Y1e4d
X-Received: by 2002:a5d:598f:0:b0:38d:e250:d960 with SMTP id
 ffacd0b85a97d-38de250dc0emr424878f8f.8.1739177155155; 
 Mon, 10 Feb 2025 00:45:55 -0800 (PST)
X-Received: by 2002:a5d:598f:0:b0:38d:e250:d960 with SMTP id
 ffacd0b85a97d-38de250dc0emr424844f8f.8.1739177154764; 
 Mon, 10 Feb 2025 00:45:54 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dcf35b15bsm8084129f8f.64.2025.02.10.00.45.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 00:45:53 -0800 (PST)
Message-ID: <b08cee40-a726-498e-af28-bf677e41464b@redhat.com>
Date: Mon, 10 Feb 2025 09:45:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] Fix vIOMMU reset order
To: Peter Xu <peterx@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 mst@redhat.com, jasowang@redhat.com, imammedo@redhat.com,
 alex.williamson@redhat.com, clg@redhat.com, philmd@linaro.org,
 zhenzhong.duan@intel.com, ddutile@redhat.com
References: <20250206142307.921070-1-eric.auger@redhat.com>
 <Z6Y6sf064FBWT5G1@x1.local>
 <CAFEAcA9ETg2+Xa+e3quJhGG3KsNuH+DW3puuWaJi-q1psUdw6A@mail.gmail.com>
 <Z6ZDf2K0YsqVRE5T@x1.local>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <Z6ZDf2K0YsqVRE5T@x1.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: W-cedfw5dTEcD5PDkv3ZF0A8zi3iUH7FABJ9lnsB7dk_1739177155
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.405,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: GlNMQZ4zBFkb


Hi,

On 2/7/25 6:31 PM, Peter Xu wrote:
> On Fri, Feb 07, 2025 at 05:06:20PM +0000, Peter Maydell wrote:
>> On Fri, 7 Feb 2025 at 16:54, Peter Xu <peterx@redhat.com> wrote:
>>> On Thu, Feb 06, 2025 at 03:21:51PM +0100, Eric Auger wrote:
>>>> This is a follow-up of Peter's attempt to fix the fact that
>>>> vIOMMUs are likely to be reset before the device they protect:
>>>>
>>>> [PATCH 0/4] intel_iommu: Reset vIOMMU after all the rest of devices
>>>> https://lore.kernel.org/all/20240117091559.144730-1-peterx@redhat.com/
>>>>
>>>> This is especially observed with virtio devices when a qmp system_reset
>>>> command is sent but also with VFIO devices.
>>>>
>>>> This series puts the vIOMMU reset in the 3-phase exit callback.
>>>>
>>>> This scheme was tested successful with virtio-devices and some
>>>> VFIO devices. Nevertheless not all the topologies have been
>>>> tested yet.
>>> Eric,
>>>
>>> It's great to know that we seem to be able to fix everything in such small
>>> changeset!
>>>
>>> I would like to double check two things with you here:
>>>
>>>   - For VFIO's reset hook, looks like we have landed more changes so that
>>>     vfio's reset function is now a TYPE_LEGACY_RESET, and it always do the
>>>     reset during "hold" phase only (via legacy_reset_hold()).  That part
>>>     will make sure vIOMMU (if switching to exit()-only reset) will order
>>>     properly with VFIO.  Is my understanding correct here?
>> Yes, we now do a reset of the whole system as a three-phase setup,
>> and the old pre-three-phase reset APIs like qemu_register_reset() and
>> device_class_set_legacy_reset() all happen during the "hold" phase.
>>
>>>   - Is it possible if some PCIe devices that will provide its own
>>>     phase.exit(), would it matter on the order of PCIe device's
>>>     phase.exit() and vIOMMU's phase.exit() (if vIOMMUs switch to use
>>>     exit()-only approach like this one)?
>> It's certainly possible for a PCIe device to implement
>> a three-phase reset which does things in the exit phase. However
>> I think I would say that such a device which didn't cancel all
>> outstanding DMA operations during either 'enter' or 'hold'
>> phases would be broken. If it did some other things during
>> the 'exit' phase I don't think the ordering of those vs the
>> iommu 'exit' handling should matter.
> Yes, this sounds fair.
>
>> (To some extent the splitting into three phases is trying
>> to set up a consistent model as outlined in docs/devel/reset.rst
>> and to some extent it's just a convenient way to get a basic
>> "this reset thing I need to do must happen after some other
>> device has done its reset things" which you can achieve
>> by ad-hoc putting them in different phases. Ideally we get
>> mostly the former and a little pragmatic dose of the latter,
>> but the consistent model is not very solidly nailed down
>> so I have a feeling the proportions may not be quite as
>> lopsided as we'd like :-) )
> Yes, it's a good move that we can have other ways to fix all the problems
> without major surgery, and it also looks solid and clean if we have plan to
> fix any outlier PCIe devices.
>
> If there will be a repost after all, not sure if Eric would like to add
> some of above discussions into either some commit messages or cover letter.
> Or some comment in the code might be even better.
Yes I will definitively augment commit msgs/cover letter with all those
considerations. Thank you very much for this rich discussion!

Eric
>
> Thanks!
>

