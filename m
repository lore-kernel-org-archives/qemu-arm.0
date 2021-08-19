Received: by 2002:a05:6512:3102:0:0:0:0 with SMTP id n2csp380388lfb;
        Thu, 19 Aug 2021 07:36:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwm+AoPbK9yh6Q5CWDWCVqOcYMU9PELI+ZSMM07GB8LoybpuOf9VpV/mPZSzswNC8aGM3yP
X-Received: by 2002:a67:ecd7:: with SMTP id i23mr12812308vsp.43.1629383817449;
        Thu, 19 Aug 2021 07:36:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629383817; cv=none;
        d=google.com; s=arc-20160816;
        b=aHj2y7N1/zwGFxhE9zFdd+mTG9bEiBw0h5I/XVUIjCwkeO5IxFciFetP+0dYThRB5H
         GSj2ixnXtnr4c4TZruJyepBy2ZzwITnf5K2BcjzKEXEDL7mZXn9K3FLmzFW5jMXsza8X
         VUaE7VaCSMl3SfLHwkPmBlL/0xWnyt4aAUmvsVT+d7Gb6IPkQ02kwOJVSQswW4l15PHv
         YaFvkR5LYYne8V6XjyhzSljxrWD1N1Nj1ru4cHj5OFVfwRAiad/YaY6DN1fhvsyQZB/d
         MYfA3fiQ9XNYiXKxJZaoh8h9XhDiFknJfjOfgF6X2HEsvbKuEcS/kATK/+jliyD+8tvV
         5B/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=GnvmcR9nr2c0K4VyZDFjDiNXdISt6DLhK5k4CQjqItg=;
        b=am2Sou0erLIyikL9vzv5zWMyt9StDFjp6IQdZeyAf5c61HTzewk9+WaSMeAmIKPeAC
         XVasIyPejo86dtCtzHBcHn1vrQQvw3mSKGjAU1ejO1YqWMyMr57mqX+Df0r/ffe5WQEM
         hTdNbIEApO1pi887MPuby4NAQI7JEy8Y7oErul+vvba6jDqEAHzaYvMsWvGtofzLj6Bw
         oFTx/iiW5mzBzYa13FtkEakc6LOAP1GX7jpcQSdCR9zcpRYheyc88L1Lg+TULs2Vnrsx
         lrxbWQoKG8akK5A06Lu36XbcwIMzGtgZkXQL3xGG1xbKc720mCbgeJ6FP3bNJyETDrug
         SwBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=INangwoU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v7si1835293vsr.309.2021.08.19.07.36.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Aug 2021 07:36:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=INangwoU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mGj9o-0008Bp-9K
	for alex.bennee@linaro.org; Thu, 19 Aug 2021 10:36:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGj9g-0008Av-FC
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 10:36:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGj9e-0002bz-Nr
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 10:36:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629383786;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GnvmcR9nr2c0K4VyZDFjDiNXdISt6DLhK5k4CQjqItg=;
 b=INangwoU1njyh9+PFBZFVvnFhBR7gdTo+/oHDNxUCtgZ5YQeYnx1XuqBqka4HoKEZGyFI8
 HFggA74olUlzd5J3iBHO52UwCRs8QO/lHC87P8URNkEemXr6/xUHDFq+r1m9NWt0lUxVdY
 rhdxtKGzJgF0RHwDP5VOzbHgspafc+I=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-126-FZ634WBxPfuofdIYwot0BA-1; Thu, 19 Aug 2021 10:36:22 -0400
X-MC-Unique: FZ634WBxPfuofdIYwot0BA-1
Received: by mail-wr1-f72.google.com with SMTP id
 q4-20020a05600000c400b00156d811312aso1756144wrx.3
 for <qemu-arm@nongnu.org>; Thu, 19 Aug 2021 07:36:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GnvmcR9nr2c0K4VyZDFjDiNXdISt6DLhK5k4CQjqItg=;
 b=sbasurOd/4JNvDFiPATt/gj+vycVBo7HvBnGFdrnHi999xynPerpmTBRfnrA7Jv7uS
 BQ1ErDGri6VDHtuSL5TTw+wYpcVphTf92mptj+UGkS09/i5f+5J+3na27tPdZEP6xqWb
 vNfzhy8ofXMKQBgkXBLJ7SdLsiQToL74Z/2Yv7QzgaXeaA0ACx018Rjr+zlWZBFneuTS
 l7nQD76iQofskzvBO1ucxAMhAJyXzci9orAW8e9xAJA+9Yxx1u2QjJWE893j8mUxB0hh
 TV6a1XP+iCoLa3jL/U6K8ZJRnVypEmRBWi5x/3mobWkdYOrst//vwOUUHnJWgzSqITjc
 rQJA==
X-Gm-Message-State: AOAM533CsvolMg4kq+BT8bQscPICzZaQ1mJbIHe39aS+VqRf6xxZoGLm
 GSC9IsKr0WxYH9DtziXdQwEyJi6DrxbPvr2gZ/PidjskHzjv25k9g/2rvO1xZwotYNE4Ry3xjNY
 Raf0RyP4oJfyW
X-Received: by 2002:a05:6000:1186:: with SMTP id
 g6mr4285995wrx.147.1629383781390; 
 Thu, 19 Aug 2021 07:36:21 -0700 (PDT)
X-Received: by 2002:a05:6000:1186:: with SMTP id
 g6mr4285975wrx.147.1629383781256; 
 Thu, 19 Aug 2021 07:36:21 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id d18sm3272562wrb.16.2021.08.19.07.36.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Aug 2021 07:36:20 -0700 (PDT)
Subject: Re: [PATCH 2/6] memory: Introduce address_space_create()
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210819142039.2825366-1-philmd@redhat.com>
 <20210819142039.2825366-3-philmd@redhat.com>
 <CAFEAcA_GxyOYSfg+Su4iNrGNXyBB-KCfNQ+m+k9RywBGkQa08A@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <c2935c37-9c08-ed76-31d1-85d69d8c8877@redhat.com>
Date: Thu, 19 Aug 2021 16:36:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_GxyOYSfg+Su4iNrGNXyBB-KCfNQ+m+k9RywBGkQa08A@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.591, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Jianxian Wen <jianxian.wen@verisilicon.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dV4ysT5p9Osg

On 8/19/21 4:24 PM, Peter Maydell wrote:
> On Thu, 19 Aug 2021 at 15:20, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>
>> Introduce address_space_create(). In is similar to
>> address_space_init() but returns a pointer to a heap
>> allocated  AddressSpace.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  include/exec/memory.h | 14 ++++++++++++++
>>  softmmu/memory.c      | 10 ++++++++++
>>  2 files changed, 24 insertions(+)
>>
>> diff --git a/include/exec/memory.h b/include/exec/memory.h
>> index c3d417d317f..b353a48c25f 100644
>> --- a/include/exec/memory.h
>> +++ b/include/exec/memory.h
>> @@ -2418,6 +2418,20 @@ MemTxResult memory_region_dispatch_write(MemoryRegion *mr,
>>   */
>>  void address_space_init(AddressSpace *as, MemoryRegion *root, const char *name);
>>
>> +/**
>> + * address_space_create: Create and initializes an address space
>> + *
>> + * @root: a #MemoryRegion that routes addresses for the address space
>> + * @name: an address space name.  The name is only used for debugging
>> + *        output.
>> + *
>> + * Returns pointer to initialized #AddressSpace.
>> + *
>> + * The caller is responsible for releasing the pointer returned
>> + * with address_space_destroy() after use.
>> + */
>> +AddressSpace *address_space_create(MemoryRegion *root, const char *name);
>> +
> 
> I'm not really a fan of this as an API -- almost always I think
> devices would do better to have an AddressSpace foo field in
> their device struct and call address_space_init() on that.
> Hiding the heap allocation inside this function makes it harder
> to notice it during code review, I think.

So I understand you rather I discard this (simple) approach and
rather modify 'info mtree' "was designed on the assumption that
there's really only one or two interesting address spaces." [*]

[*] https://www.mail-archive.com/qemu-devel@nongnu.org/msg829821.html

