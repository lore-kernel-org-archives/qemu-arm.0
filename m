Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp1367353lfg;
        Sat, 1 May 2021 15:24:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJshOLfdPfgsnxv1PDKu2ium+CHYG/giQOuHVjJC9xwPqS9DmqM4wIL751iJ9oMdS/4zId
X-Received: by 2002:a25:35d7:: with SMTP id c206mr14641893yba.307.1619907866947;
        Sat, 01 May 2021 15:24:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619907866; cv=none;
        d=google.com; s=arc-20160816;
        b=voCDNSd9wUr5akjIsMoBH2soVhzUL3VT+kEu3ZXFB1rYBdsJ62L4KHs3q9zHC2ziAe
         vEBziZ+C46Y4BPNsKjVeoHAqRkZwr8Eb7dM3Ic88SpZix7oQoruqq9Fnh1FuUAtqOyEl
         +nEM3zWoyuqw4zDtY7v4lmY4L+nKu5tpZIks9Pzh+TulDJ/GJGSAXILHEQXQCBNhEYR+
         KAtRP927GrLcQKzTNUwYdPw8nogLt2GoXS4CS/htzt5j55NFz8Jmk7XFawBfzhTTzetz
         BVZeQugyeXfiz8t4OEdcbh45zaijt8REzIcHFXGV80UO6x8/WmEWQJFh56bYKr+adpWR
         l7wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=9MuaLmZ9c8TYz83S97fJohihh8jWN2HtbczG9ZHrqjk=;
        b=GUrAnkeYRR6pKpNPNhHjaKZF3dl/gTjHeSRVxKfkT37XXgZBA9py2XufWyRbAqZm8R
         RxQZRmP7+gDY5cnJkwXpuI7c9U1GvgA+CUFp7BOR8WG9YAFdAN1yAtjy607oFdc0cJit
         tFq8BMsTsCBIoLKXd1kU2HN6Lj2m96jjUVpqIYY8g7HCvzlMEYEbjMQ51zSnwA7q+WCA
         pkiqwUcQDSlZX/KpGh+T6PCnFzmGU3ksGs3py4hjrEwHI4KYKu9jyTDYwJjfmG1+lEkw
         D3gAU1/2JJ8K/eyDmNAinA/J8vZoRihS8clb3VVKH0jj1rJLxORCpegJRdKoBN6/8I5T
         6i9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=gPGtiFQT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j2si6725912ybo.393.2021.05.01.15.24.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 May 2021 15:24:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=gPGtiFQT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lcy2E-0007aD-9N
	for alex.bennee@linaro.org; Sat, 01 May 2021 18:24:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lcy25-0007Zb-To
 for qemu-arm@nongnu.org; Sat, 01 May 2021 18:24:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lcy24-0000Po-F9
 for qemu-arm@nongnu.org; Sat, 01 May 2021 18:24:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619907855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9MuaLmZ9c8TYz83S97fJohihh8jWN2HtbczG9ZHrqjk=;
 b=gPGtiFQTRfej7k/3NNpUJafxRdMu1CLkkr6FzSAcS2UDA8DsvzkX0eU1V8lDk7niWirINF
 b43yWck+rz+HkqtkrbISLiRYd1wyRtxozblIiZ8qsy1B1NZIiCCCTBohrHygN5XGN9QhYJ
 ievB8sbB7Xjzrpv7dVmRBWmxdM8u26I=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-kb6nIX7JPJqEuFlhrmn-pw-1; Sat, 01 May 2021 18:24:11 -0400
X-MC-Unique: kb6nIX7JPJqEuFlhrmn-pw-1
Received: by mail-wr1-f72.google.com with SMTP id
 4-20020adf80040000b029010cab735fdeso1269894wrk.14
 for <qemu-arm@nongnu.org>; Sat, 01 May 2021 15:24:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9MuaLmZ9c8TYz83S97fJohihh8jWN2HtbczG9ZHrqjk=;
 b=sAd083m4axT3JL0VSN4LhpkGf6RZZ1J6CQ5FeUAH3llyLdGen18/1OhlfZx+We+fwZ
 p/gIJRHlApC8wxEaMchY9kE6durM4XmTywm74OV9FtSkudWJj5P3PTCNnPoBVdU68maf
 61zu26RFzeV6n55iVFnzc6QnsEzdk+W3PZXXPK+b61bNJNy/GOOLoJQp7fatXovt3hYG
 AHJS0Z6dyBSzaaYy6ZFfhiwY1eHCCn3FVGjuiEPwxSFVdz5h69xKquSmUcCNs+NjdPg5
 spGiDF938tLBglSdrEFLeYmp8KgUnNywOHmboCKRmPRGt9FVNhw4e8lDJT3SAC6hpPRk
 4s4w==
X-Gm-Message-State: AOAM530fmnBQMZHf9iS5VRQNrR79HEyQ3HKQm9yuiI3mVqACiH7sYld+
 elfK2MczZexUiEEcBO2zjQHdVANnNKNyBta2XcAU780NYTdeRVVUJj2XNxFHKpTrGmDmBQKpzui
 L+gV0R4PX9L0d
X-Received: by 2002:adf:ed4b:: with SMTP id u11mr16012598wro.293.1619907850532; 
 Sat, 01 May 2021 15:24:10 -0700 (PDT)
X-Received: by 2002:adf:ed4b:: with SMTP id u11mr16012567wro.293.1619907850340; 
 Sat, 01 May 2021 15:24:10 -0700 (PDT)
Received: from [192.168.1.19] (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id l25sm6728390wmi.17.2021.05.01.15.24.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 01 May 2021 15:24:09 -0700 (PDT)
Subject: Re: [PATCH v4 02/12] accel: Introduce 'query-accels' QMP command
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <20210415163304.4120052-1-philmd@redhat.com>
 <20210415163304.4120052-3-philmd@redhat.com>
 <2f6ef548-cff4-273f-5680-f79bda85e197@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b126892b-de53-bfe0-33fe-4757797affda@redhat.com>
Date: Sun, 2 May 2021 00:24:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <2f6ef548-cff4-273f-5680-f79bda85e197@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AOT7PeEhHqqT

On 4/30/21 9:03 PM, Eric Blake wrote:
> On 4/15/21 11:32 AM, Philippe Mathieu-Daudé wrote:
>> Introduce the 'query-accels' QMP command which returns a list
>> of built-in accelerator names.
>>
>> - Accelerator is a QAPI enum of all existing accelerators,
>>
>> - AcceleratorInfo is a QAPI structure providing accelerator
>>   specific information. Currently the common structure base
>>   provides the name of the accelerator, while the specific
>>   part is empty, but each accelerator can expand it.
>>
>> - 'query-accels' QMP command returns a list of @AcceleratorInfo
>>
>> For example on a KVM-only build we get:
>>
>>     { "execute": "query-accels" }
>>     {
>>         "return": [
>>             {
>>                 "name": "qtest"
>>             },
>>             {
>>                 "name": "kvm"
>>             }
>>         ]
>>     }
>>
>> Note that we can't make the enum values or union branches conditional
>> because of target-specific poisoning of accelerator definitions.
>>
>> Reviewed-by: Eric Blake <eblake@redhat.com>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>> Since v3: Simplify over-engineered AcceleratorInfo (Markus, kept Eric R-b)
>> Since v2: @since 6.0 -> 6.1, added note (Eric)
>> Since v1: 'type' -> 'name' in comments
> 
>> +++ b/qapi/machine.json
>> @@ -1274,3 +1274,50 @@
>>  ##
>>  { 'event': 'MEM_UNPLUG_ERROR',
>>    'data': { 'device': 'str', 'msg': 'str' } }
>> +
>> +##
>> +# @Accelerator:
>> +#
>> +# An enumeration of accelerator names.
>> +#
>> +# Since: 6.1
>> +##
>> +{ 'enum': 'Accelerator',
>> +  'data': [ 'qtest', 'tcg', 'kvm', 'hax', 'hvf', 'whpx', 'xen' ] }
> 
> There's no requirement for enums to be in any order, although if the
> list is likely to get larger over time, lexicographic order makes it
> easier to know where to insert new entries.  Up to you whether it is
> worth sorting, and your decision does not invalidate my R-b.

OK will do, thanks!

