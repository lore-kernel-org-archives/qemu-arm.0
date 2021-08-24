Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp2562164lfg;
        Tue, 24 Aug 2021 00:24:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7JJBd9D5Sp4PgMONEpoWWJjhTlESA5jw8jkIcWCEMPMxDzRoxJwSkmRmIwFsh9LC5+603
X-Received: by 2002:a05:622a:353:: with SMTP id r19mr33581342qtw.3.1629789899647;
        Tue, 24 Aug 2021 00:24:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629789899; cv=none;
        d=google.com; s=arc-20160816;
        b=at9cx+OfS7w/2FEeynGe/8A2gXX8aJ+YE/yZIqXja4Q+udhwqRS6Ahy9BwXCdXukLu
         vETLVw0f3gbtv6o7cAEYlcalIRRdXfi7WdyszK2QXO9X0mUFTmK14pgrsFroOl1xPHVy
         WlcjxwBXq2UjZ96iZF8p78bV42mYbWksnlgN76Ca5yLqKH6+nyIgDjHA2xqhymxP9UyF
         bZadGgw55Pk4fzwGFUYaNARlB86C5MDnRfSUL8Y6vIAQ8yLvNWrqafAAlVwZfmOu6Kn9
         FfNgQ86jCq9dmEd0dD92O9vUSM4/shWY3Ntqd0SSBMQPxzmby9noYxdj/iruvt5HL08J
         RV/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=wmpWDC7/KlM8wcVIjiS2/9mGUxEKKamLJfbPuuyyaFg=;
        b=Olge1qXJ85jJ07OwQ9Ipi9O3ASgpSAj9sgHu6YVXOzNzF0N45dbB0SzXfc04OJ1ZjQ
         PC5+cFLCgoKl1Y4wVCCKGr9WaQcS/q6aP3zrJ9lDCAE1gCjsodeysYnJlkMcwDThm/GC
         Gdz6VTVko+Hm14CFGIMr4+P/vDpBushrXN7q4Cn3zIM1q8GaPRxqNpbZpUEjazKp+twB
         BOFJtQusWc3lRcf0yPsCxbYsxbDIxTx0Fva0SLVzrZ5uuWkzF3z75rqxXjeRHSPW4Kbw
         k/Xg+cRdCEB3dRJPdmEHfpUbXRaVhSkVIEeMkj6U6D7YilAcjZzsj/sbBUxZHwF7zjbW
         N0qQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=BLUwHGUl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 4si10780500qks.304.2021.08.24.00.24.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Aug 2021 00:24:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=BLUwHGUl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mIQnq-0007dc-VT
	for alex.bennee@linaro.org; Tue, 24 Aug 2021 03:24:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mIQng-0007a9-8f
 for qemu-arm@nongnu.org; Tue, 24 Aug 2021 03:24:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mIQnc-0003rA-Qd
 for qemu-arm@nongnu.org; Tue, 24 Aug 2021 03:24:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629789883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wmpWDC7/KlM8wcVIjiS2/9mGUxEKKamLJfbPuuyyaFg=;
 b=BLUwHGUlF25sriUcdeHUeGWZEh7eRZ3KZqE0ut64wCKzyEM4u1IyM8ieebCwsiTbq7wjqF
 F0RVjltsbI7lpTgOdJnIQ4iw1Y/1Gjh1etoEQGdNBSxMKd0B7c2jHWZT3gWSUj3AfLjMZQ
 WahrZyFY2a+uRHXdrleUKET3Z+c7b0I=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-MnAS7GFcMvmfSu032iYipA-1; Tue, 24 Aug 2021 03:24:38 -0400
X-MC-Unique: MnAS7GFcMvmfSu032iYipA-1
Received: by mail-wm1-f69.google.com with SMTP id
 h1-20020a05600c350100b002e751bf6733so776472wmq.8
 for <qemu-arm@nongnu.org>; Tue, 24 Aug 2021 00:24:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wmpWDC7/KlM8wcVIjiS2/9mGUxEKKamLJfbPuuyyaFg=;
 b=o4SefJ0ZRVEwIj3tLDQn/wXghkGh1eLVVqA82HaAZ9VNpA9uzQkZ2dGOthcFJ+Y0PK
 vuOXEl4lxeSMo2AlIscBAivlN+kHqaFA/4jPLst5FTZEtTYnfEWYz9pyREKWpOk4D8h0
 DhRpO1dQFDjWBtDFD29JF2XnTxLS94Mm2Ue9sXgR7Wp75ZUYpfTCeMCjFPJMMdXL+hWK
 3GWI3ZeH6KZcxRf3hh4RfeBeTqDmFuywyDvh27096JFqXFDaRsSZ8Fk1AbCdtICqdWZN
 CqUqWng2rgmAo4PDwc0mJnXQZzrFHGjCGDj3ogB0iDx+zuGKDBQIZUCI4mjGxUaU1voO
 m3aA==
X-Gm-Message-State: AOAM5319QHS9tAPb+/BQiYE4uOgUVXGyqNe9VA2S5iej7X5HSyRlsO25
 gKfPSpvcDijzD/sXRTWDjUEVIP3TwwflHCxox91k8+dOMAlp8W9itSJR8z0S6CKfeOoLVgXTebo
 Y1mBHAdEMqMZM
X-Received: by 2002:a5d:6483:: with SMTP id o3mr17740344wri.197.1629789876973; 
 Tue, 24 Aug 2021 00:24:36 -0700 (PDT)
X-Received: by 2002:a5d:6483:: with SMTP id o3mr17740315wri.197.1629789876792; 
 Tue, 24 Aug 2021 00:24:36 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id j1sm13601490wrd.50.2021.08.24.00.24.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Aug 2021 00:24:36 -0700 (PDT)
Subject: Re: [RFC PATCH v2 0/5] physmem: Have flaview API check bus permission
 from MemTxAttrs argument
To: Alexander Bulekov <alxndr@bu.edu>, Peter Xu <peterx@redhat.com>
References: <20210823164157.751807-1-philmd@redhat.com>
 <CAFEAcA9_=6n4w86gD3MHhiLeCiui9_+ePT7E2sSHdSRufUJdyA@mail.gmail.com>
 <YSQKHaGiJZE5OAk2@t490s> <20210823222654.4q5prjmqqnukywem@mozz.bu.edu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <91eb2255-a91d-af81-5bc1-ee877d50258c@redhat.com>
Date: Tue, 24 Aug 2021 09:24:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210823222654.4q5prjmqqnukywem@mozz.bu.edu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.023, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, qemu-arm <qemu-arm@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: o27GXEHcJL2z

On 8/24/21 12:26 AM, Alexander Bulekov wrote:
> On 210823 1650, Peter Xu wrote:
>> On Mon, Aug 23, 2021 at 08:10:50PM +0100, Peter Maydell wrote:
>>> On Mon, 23 Aug 2021 at 17:42, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>>>
>>>> This series aim to kill a recent class of bug, the infamous
>>>> "DMA reentrancy" issues found by Alexander while fuzzing.
>>>>
>>>> Introduce the 'bus_perm' field in MemTxAttrs, defining 3 bits:
>>>>
>>>> - MEMTXPERM_UNSPECIFIED (current default, unchanged behavior)
>>>> - MEMTXPERM_UNRESTRICTED (allow list approach)
>>>> - MEMTXPERM_RAM_DEVICE (example of deny list approach)
>>>>
>>>> If a transaction permission is not allowed (for example access
>>>> to non-RAM device), we return the specific MEMTX_BUS_ERROR.
>>>>
>>>> Permissions are checked in after the flatview is resolved, and
>>>> before the access is done, in a new function: flatview_access_allowed().
>>>
>>> So I'm not going to say 'no' to this, because we have a real
>>> recursive-device-handling problem and I don't have a better
>>> idea to hand, but the thing about this is that we end up with
>>> behaviour which is not what the real hardware does. I'm not
>>> aware of any DMA device which has this kind of "can only DMA
>>> to/from RAM, and aborts on access to a device" behaviour...
>>
>> Sorry for not being familiar with the context - is there more info regarding
>> the problem to fix?  I'm looking at the links mentioned in the old series:
>>
>> https://lore.kernel.org/qemu-devel/20200903110831.353476-12-philmd@redhat.com/
>> https://bugs.launchpad.net/qemu/+bug/1886362
>> https://bugs.launchpad.net/qemu/+bug/1888606
>>
>> They seem all marked as fixed now.
> 
> Here are some that should still reproduce:
> https://gitlab.com/qemu-project/qemu/-/issues/542
> https://gitlab.com/qemu-project/qemu/-/issues/540
> https://gitlab.com/qemu-project/qemu/-/issues/541
> https://gitlab.com/qemu-project/qemu/-/issues/62
> https://lore.kernel.org/qemu-devel/20210218140629.373646-1-ppandit@redhat.com/ (CVE-2021-20255)

Also 305, 451, 557.

Issues list tracked here:
https://gitlab.com/qemu-project/qemu/-/issues/556
(Thanks Alex for updating it!)

> 
> There's also this one, that I don't think I ever created a bug report
> for (working on it now):
> https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=33247
> -Alex
> 
>>
>> Thanks,
>>
>> -- 
>> Peter Xu
>>
> 

