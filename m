Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp1215957lfk;
        Thu, 18 Nov 2021 13:05:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzNZ8+UtqmyJhFnwcTyK6EfsqjPp6E0xGoyW01JuJbWEp0tstEKuTfgNu4PVLmy9d+3wfrZ
X-Received: by 2002:a37:e15:: with SMTP id 21mr24304456qko.413.1637269518244;
        Thu, 18 Nov 2021 13:05:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637269518; cv=none;
        d=google.com; s=arc-20160816;
        b=FQRRc1/xfuL3m/+zqYmk0duqFZzgZZVZFuC8veo4V/V+ULmNQZaaRR7/fu1L1+pZJl
         PNqJi6Pl1BWsen8XUMpBc4cadcPJRBiH765wJxEhnfW0SPm3/2YzwNg+xK67pzY2jJAJ
         t4lARnww+wyprbjdPfzmv6Nket1I23zEiS+pveS64AQK9K8/37Ne8U9M83xH8Fhzbzbx
         AdfVndjR/3ZH8PZtzUUZQAIsYF4+lIepS46UmooEYYLF9epZqhIdBv3AcjFcuWprlRsb
         0w2AVrO0xng3AGjnGBQ7WLy555WjuOmqgBuuRu6IweOC17zivNXTHSVTEf6XXeQ2x7fb
         MKJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=KtfO0r4hMF1t67Fm/nFejKUhC7rrKBlw0HYHrwB3cdQ=;
        b=YRqMgKQ/PYsE0WPNmIoZTqWqbSQXZqf2gKVOIUaAtDigQCFe06zC7Eo9UMpMc/oQf/
         xH9Wm6ZM/8rRnzzxp0ocXD2AvZgKdgdE0Il1zNFJz1rGB1kEg3ie73Je9iA1nVphaXeT
         GWtGX87mBGyRAFr/7IsdwrFgaTlfvS1uVXUlcnqerkRJfkW+m0cbjmaIFSR4VnwK5khv
         hQ6qHITp0sF3vieF7Bf3e8m5BmeA5tFiDzMNADu18NV/mGvO08v+9vqCwZFgf/QGfBpz
         obkElTEjBu3WuI+1zCV8PH/nxoxSFOVLXmIDZCzzFIEPgRDY6jnzk+15RBvlu0p1pR8B
         jPqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YXXR3RKA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w19si936697qtk.151.2021.11.18.13.05.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Nov 2021 13:05:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YXXR3RKA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mnoar-0002l9-Aj
	for alex.bennee@linaro.org; Thu, 18 Nov 2021 16:05:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mnoaf-0002ku-Al
 for qemu-arm@nongnu.org; Thu, 18 Nov 2021 16:05:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mnoaa-0002dD-Gz
 for qemu-arm@nongnu.org; Thu, 18 Nov 2021 16:05:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637269499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KtfO0r4hMF1t67Fm/nFejKUhC7rrKBlw0HYHrwB3cdQ=;
 b=YXXR3RKA8T+F7w6DZggobzbaP2WKIjfzzdVs00UdCkxWNRiyYZTth55b9V5SvjhOqGXTQ4
 qJtTkkdB/FuWG6lbCxw8wiQ1MTqFRgmLED7IXODyJg7/Kx53tpQAddVjwmmzwyhClyGtUp
 AVWErjw7hdRel5n23kU0Z9f93nCCxTo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-358-PLqt4n-eNuqvTAMZxbpJpw-1; Thu, 18 Nov 2021 16:04:58 -0500
X-MC-Unique: PLqt4n-eNuqvTAMZxbpJpw-1
Received: by mail-wm1-f70.google.com with SMTP id
 l6-20020a05600c4f0600b0033321934a39so3714462wmq.9
 for <qemu-arm@nongnu.org>; Thu, 18 Nov 2021 13:04:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KtfO0r4hMF1t67Fm/nFejKUhC7rrKBlw0HYHrwB3cdQ=;
 b=iweQZH8yOo4JjOwI8K7ShHoNgsSGaVinDiwbFxRNdh7WO8RqFNlvkV9RntOSm5FRk4
 snQ4PlqUxPf0AeIvxpMTcraXT1wZpU1A2XgfmB3eJpZqLZSqXyD6LxikayOkdnLATO7c
 /Urm6zFvzMDJYHS+VL59skUQa6859ARhSAsSXDcJ72EM1GV66HE8XLG3ZJt0YNfPQK2Q
 R6YqsHOK3lEdjXwgf/6WCUbKiklS0DQ61GjeQjbfNM7K/yk4IhlcyO0iMVYD1tHwqEzH
 oMseNt0TzgOGVMbXJYaqACQQJ9cT6oiILbKj/A+jxl3SX8oG36FVeNt4KKc4IC9+Ckd9
 ciRw==
X-Gm-Message-State: AOAM53397MIR0ZIVrL+7kYjkVH9cDo1ihb8KiL7YZ+qhj9OfzO+kW+0J
 zcb5TBv6q8i/2+bw++BSj8ATpjzbfE/kFz1EA1l2qxjECvbIdfTs1RMoS0QTEtOH7u25r6D9SFI
 S/NSxMm5jAYC7
X-Received: by 2002:a1c:4d15:: with SMTP id o21mr37607wmh.171.1637269496943;
 Thu, 18 Nov 2021 13:04:56 -0800 (PST)
X-Received: by 2002:a1c:4d15:: with SMTP id o21mr37540wmh.171.1637269496591;
 Thu, 18 Nov 2021 13:04:56 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id o3sm11718511wms.10.2021.11.18.13.04.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Nov 2021 13:04:55 -0800 (PST)
Message-ID: <c91b4ea2-3b2e-f79f-b5ad-3f01961e2974@redhat.com>
Date: Thu, 18 Nov 2021 22:04:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH v2 5/5] softmmu/physmem: Have flaview API check
 MemTxAttrs::bus_perm field
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210823164157.751807-1-philmd@redhat.com>
 <20210823164157.751807-6-philmd@redhat.com>
 <YSTw9VPd44uIZ55L@stefanha-x1.localdomain>
 <569b3a2f-2d05-700d-cae3-07d8b78fcd55@redhat.com>
 <CAFEAcA__epFKNUsZhUChOhkM18xSbm=qndCFDtVBTfm1gSz+Dw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <CAFEAcA__epFKNUsZhUChOhkM18xSbm=qndCFDtVBTfm1gSz+Dw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.084, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Alexander Bulekov <alxndr@bu.edu>, qemu-arm <qemu-arm@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SunQm7yFvahu

On 8/24/21 16:21, Peter Maydell wrote:
> On Tue, 24 Aug 2021 at 14:50, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>> On 8/24/21 3:15 PM, Stefan Hajnoczi wrote:
>>> On Mon, Aug 23, 2021 at 06:41:57PM +0200, Philippe Mathieu-Daudé wrote:
>>>> Check bus permission in flatview_access_allowed() before
>>>> running any bus transaction.
>>>>
>>>> There is not change for the default case (MEMTXPERM_UNSPECIFIED).
>>>>
>>>> The MEMTXPERM_UNRESTRICTED case works as an allow list. Devices
>>>> using it won't be checked by flatview_access_allowed().
>>>>
>>>> The only deny list equivalent is MEMTXPERM_RAM_DEVICE: devices
>>>> using this flag will reject transactions and set the optional
>>>> MemTxResult to MEMTX_BUS_ERROR.
>>>>
>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>> ---
>>>>  softmmu/physmem.c | 17 ++++++++++++++++-
>>>>  1 file changed, 16 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
>>>> index 0d31a2f4199..329542dba75 100644
>>>> --- a/softmmu/physmem.c
>>>> +++ b/softmmu/physmem.c
>>>> @@ -2772,7 +2772,22 @@ static inline bool flatview_access_allowed(MemoryRegion *mr, MemTxAttrs attrs,
>>>>                                             hwaddr addr, hwaddr len,
>>>>                                             MemTxResult *result)
>>>>  {
>>>> -    return true;
>>>> +    if (unlikely(attrs.bus_perm == MEMTXPERM_RAM_DEVICE)) {
>>>> +        if (memory_region_is_ram(mr) || memory_region_is_ram_device(mr)) {
>>>> +            return true;
>>>> +        }
>>>> +        qemu_log_mask(LOG_GUEST_ERROR,
>>>> +                      "Invalid access to non-RAM device at "
>>>> +                      "addr 0x%" HWADDR_PRIX ", size %" HWADDR_PRIu ", "
>>>> +                      "region '%s'\n", addr, len, memory_region_name(mr));
>>>> +        if (result) {
>>>> +            *result |= MEMTX_BUS_ERROR;
>>>
>>> Why bitwise OR?
>>
>> MemTxResult is not an enum but used as a bitfield.
>>
>> See access_with_adjusted_size():
>>
>>     MemTxResult r = MEMTX_OK;
>>     ...
>>     if (memory_region_big_endian(mr)) {
>>         for (i = 0; i < size; i += access_size) {
>>             r |= access_fn(mr, addr + i, value, access_size,
>>                         (size - access_size - i) * 8,
>>                         access_mask, attrs);
>>         }
>>     } else {
>>         for (i = 0; i < size; i += access_size) {
>>             r |= access_fn(mr, addr + i, value, access_size, i * 8,
>>                         access_mask, attrs);
>>         }
>>     }
>>     return r;
>> }
>>
>> and flatview_read_continue() / flatview_write_continue():
>>
>>     for (;;) {
>>         if (!memory_access_is_direct(mr, true)) {
>>             release_lock |= prepare_mmio_access(mr);
>>             l = memory_access_size(mr, l, addr1);
>>             val = ldn_he_p(buf, l);
>>             result |= memory_region_dispatch_write(mr, addr1, val,
>>                                                    size_memop(l),
>>                                                    attrs);
>>     ...
>>     return result;
>> }
> 
> In these two examples we OR together the MemTxResults because
> we are looping over multiple accesses and combining all the
> results together; we want to return a "not OK" result if any
> of the individual results failed. Is that the case for
> flatview_access_allowed() ?

You are right, this is not the case here, so we can simplify as
Stefan suggested. Thanks for clarifying the examples.

