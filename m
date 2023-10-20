Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp1057348ejb;
        Fri, 20 Oct 2023 01:13:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGp11V8WXYJzKxhc/AHeJTR2Ram30+Cw3rESEFbDxZy/9GMtCgJtwvkoAMG6C1Vv0sE18uT
X-Received: by 2002:ad4:4ee5:0:b0:66d:17a2:34cc with SMTP id dv5-20020ad44ee5000000b0066d17a234ccmr1189125qvb.64.1697789610611;
        Fri, 20 Oct 2023 01:13:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697789610; cv=none;
        d=google.com; s=arc-20160816;
        b=Ix2anJVyaTwZ6qTLSzt1sv/ZZW4+6R5/EvxveXP2Z+jEwBvQofRXM8j6SswfvYhQN/
         tvUCxQXWz/7FCj5b5KzDhoCofwdcMsal1vPTuYcEb/ObGnlBc4agjy86emUkYHkptNq3
         88gvmbZi/IKsXlXAoMMrUTKJKiMDtP14L2/4rCdoRyZSBCPRbL6ddiQ5srA643SrWXhz
         sq2GFoPM6630xH5TBP+hmT1TOPHBCyRJ+SyFrwnqFOXOlnhz2EiQEHctKfpejfD7yONx
         VOjASlFPkCmVIrmABMgvbVh6hvMPJCxmA9/vNpEcpm6Gc5EfhniiQHVXh5F0IXPvdoth
         B9ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=04xXji+LJxvI6UY2tLIqTDZW0bqxMCV1T+WLcuQs1GA=;
        fh=CZCbEOhTOtZkzw0NMTp694+M8l6mPxr5mERtEaXLscE=;
        b=n6zRmFxTCwE3imYWaxY2Pb368W8prH9APRDG8qPF8q2ddDaiGvU66hF+YLIxVit2AE
         ehPT0/m4wEjZTrB8+OuoJLIq0xRHeGj5xlzpKe4EigFjWde94BKWs79zWuRvCPcrltB9
         CIeme3NA/SMGUA+VkUBQiTeL1/hjlIAs+28SMpeid0RYbo5e9k0cKEp886flqtmP7RCa
         qd+7yhrGw5mo2HJwHofV/Qr9mz+zJYwksYEAUETszs3fYrQEktAIYcg022qTQVOfUjhr
         2P3+rl7twYpy/wCbDZIU30V/0CQnliNhPfOn8wbPhsHu/kteysv/1mo31/ejhKApAsk5
         XeRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="K/LMswwy";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pc6-20020a056214488600b0066b0f53b19asi1038766qvb.242.2023.10.20.01.13.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Oct 2023 01:13:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="K/LMswwy";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtkd5-0007Sx-7z; Fri, 20 Oct 2023 04:13:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qtkd0-0007S3-Ap
 for qemu-arm@nongnu.org; Fri, 20 Oct 2023 04:13:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qtkcx-0003kQ-JS
 for qemu-arm@nongnu.org; Fri, 20 Oct 2023 04:13:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697789582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=04xXji+LJxvI6UY2tLIqTDZW0bqxMCV1T+WLcuQs1GA=;
 b=K/LMswwyJqtF/BPea/lXv10q1hucPrgHiAIPFsS9+c1WPd4vw8DIbPVFFslh4uYlJTmZPJ
 COhnIgApZ+xvGSBWg+zQZc8IjgAeb8tTWH82obv2eRJdUTv2TbYPXxCc8iPCFJZOxSNG1I
 tMJFvLWRfscbb0Og19AO27mwn2ZokTw=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-NvbFsIlnMHCh-o_TmWLCyA-1; Fri, 20 Oct 2023 04:13:00 -0400
X-MC-Unique: NvbFsIlnMHCh-o_TmWLCyA-1
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-778999c5f1dso60981785a.2
 for <qemu-arm@nongnu.org>; Fri, 20 Oct 2023 01:12:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697789579; x=1698394379;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=04xXji+LJxvI6UY2tLIqTDZW0bqxMCV1T+WLcuQs1GA=;
 b=Wh61oe7RzJbmKLKoc3wiTZosfbX+GSQHxr2PZaPXDCKjUTxJCEczf6UTiCgN4e6il0
 7VpuiITotN10qkwJ4QXEfUUFSf9CIcretekvD3Y94tR/L+e3+cqWkSPyIj41520CDeUt
 3sUBRm9ZfPJ6ouiu7upAdtwpePcE1HF7QB6Zv7HvV7GAyu2AQU7kqcd9o3x3FnylshTH
 LuQuOqUXTZtEcGUOhYGPklVMhtG5aJgPwi4WvB8iIKHWHMoutjLmNAEBH34kZ5IT7quq
 0lCndVj5DfrAeXAb3gxNhydp1K0UTwkYqUdG3a7ps4BTyiVCRkll1eZCwW/LwNblrCJ9
 2Sdw==
X-Gm-Message-State: AOJu0Yx2jyXD+/Gfjns7fULRcleE3OCBTUiNX5DYGXBQswVxm3lHJmIH
 WIYkGf6D78zDThL/7tOo1TQ+sIfyHUvrMVy8/swykmqPuyQB4vOaVWxMXV5OOIwBLumyGvFkUFj
 v41htdH6HEiAY
X-Received: by 2002:a05:6214:f61:b0:66d:8524:ebf0 with SMTP id
 iy1-20020a0562140f6100b0066d8524ebf0mr1258180qvb.15.1697789579407; 
 Fri, 20 Oct 2023 01:12:59 -0700 (PDT)
X-Received: by 2002:a05:6214:f61:b0:66d:8524:ebf0 with SMTP id
 iy1-20020a0562140f6100b0066d8524ebf0mr1258140qvb.15.1697789579072; 
 Fri, 20 Oct 2023 01:12:59 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-141.web.vodafone.de.
 [109.43.176.141]) by smtp.gmail.com with ESMTPSA id
 i6-20020a05620a404600b007742c6823a3sm426203qko.108.2023.10.20.01.12.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Oct 2023 01:12:58 -0700 (PDT)
Message-ID: <fefe37b5-640c-4967-9dc6-ebae0c097b65@redhat.com>
Date: Fri, 20 Oct 2023 10:12:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/13] RFC migration: icp/server is a mess
To: Greg Kurz <groug@kaod.org>, Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-ppc@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>, qemu-s390x@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Corey Minyard <cminyard@mvista.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Fabiano Rosas <farosas@suse.de>, Eric Farman <farman@linux.ibm.com>,
 Peter Xu <peterx@redhat.com>, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, qemu-arm@nongnu.org,
 Jason Wang <jasowang@redhat.com>, Corey Minyard <minyard@acm.org>,
 Leonardo Bras <leobras@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Halil Pasic
 <pasic@linux.ibm.com>, Daniel Henrique Barboza <danielhb413@gmail.com>
References: <20231019190831.20363-1-quintela@redhat.com>
 <20231019190831.20363-8-quintela@redhat.com> <20231019233958.17abb488@bahia>
 <875y313g4b.fsf@secure.mitica> <20231020100626.57debfa4@bahia>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20231020100626.57debfa4@bahia>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 1PPkxA1Hnyqw

On 20/10/2023 10.06, Greg Kurz wrote:
> On Fri, 20 Oct 2023 09:30:44 +0200
> Juan Quintela <quintela@redhat.com> wrote:
> 
>> Greg Kurz <groug@kaod.org> wrote:
>>> On Thu, 19 Oct 2023 21:08:25 +0200
>>> Juan Quintela <quintela@redhat.com> wrote:
>>>
>>>> Current code does:
>>>> - register pre_2_10_vmstate_dummy_icp with "icp/server" and instance
>>>>    dependinfg on cpu number
>>>> - for newer machines, it register vmstate_icp with "icp/server" name
>>>>    and instance 0
>>>> - now it unregisters "icp/server" for the 1st instance.
>>>>
>>>> This is wrong at many levels:
>>>> - we shouldn't have two VMSTATEDescriptions with the same name
>>>> - In case this is the only solution that we can came with, it needs to
>>>>    be:
>>>>    * register pre_2_10_vmstate_dummy_icp
>>>>    * unregister pre_2_10_vmstate_dummy_icp
>>>>    * register real vmstate_icp
>>>>
>>>> As the initialization of this machine is already complex enough, I
>>>> need help from PPC maintainers to fix this.
>>>>
>>>> Volunteers?
>>>>
>>>> CC: Cedric Le Goater <clg@kaod.org>
>>>> CC: Daniel Henrique Barboza <danielhb413@gmail.com>
>>>> CC: David Gibson <david@gibson.dropbear.id.au>
>>>> CC: Greg Kurz <groug@kaod.org>
>>>>
>>>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>>>> ---
>>>>   hw/ppc/spapr.c | 7 ++++++-
>>>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
>>>> index cb840676d3..8531d13492 100644
>>>> --- a/hw/ppc/spapr.c
>>>> +++ b/hw/ppc/spapr.c
>>>> @@ -143,7 +143,12 @@ static bool pre_2_10_vmstate_dummy_icp_needed(void *opaque)
>>>>   }
>>>>   
>>>>   static const VMStateDescription pre_2_10_vmstate_dummy_icp = {
>>>> -    .name = "icp/server",
>>>> +    /*
>>>> +     * Hack ahead.  We can't have two devices with the same name and
>>>> +     * instance id.  So I rename this to pass make check.
>>>> +     * Real help from people who knows the hardware is needed.
>>>> +     */
>>>> +    .name = "pre-2.10-icp/server",
>>>>       .version_id = 1,
>>>>       .minimum_version_id = 1,
>>>>       .needed = pre_2_10_vmstate_dummy_icp_needed,
>>>
>>> I guess this fix is acceptable as well and a lot simpler than
>>> reverting the hack actually. Outcome is the same : drop
>>> compat with pseries-2.9 and older.
>>>
>>> Reviewed-by: Greg Kurz <groug@kaod.org>
>>
>> I fully agree with you here.
>> The other options given on this thread is deprecate that machines, but I
>> would like to have this series sooner than 2 releases.
> 
> Yeah and, especially, the deprecation of all these machine types is
> itself a massive chunk of work as it will call to identify and
> remove other related workarounds as well. Given that pretty much
> everyone working in PPC/PAPR moved away, can the community handle
> such a big change ?

I think you could treat that as two work items. First the deprecation and 
removal of old machine types. Second the (optional) cleanups. If we don't 
immediately manage to find and remove each and every possible spot that 
could be cleaned up after the removal of the machine types, so be it. But 
better at least *start* to remove the old cruft, beginning with the machine 
type, than dragging this stuff along forever.

  Thomas

