Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp4641037lfa;
        Tue, 8 Jun 2021 10:23:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxDmcvtuCu0Ff43CPKOlJ1zwJekZFwAaAOc/bIg7X5ZXuL8bherXbWG4AsT649M8NDP7hsr
X-Received: by 2002:a17:906:4e06:: with SMTP id z6mr25377394eju.34.1623173026420;
        Tue, 08 Jun 2021 10:23:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623173026; cv=none;
        d=google.com; s=arc-20160816;
        b=tdQ9D22+wnj8wBhCTAeLj4KC+OcYXaWwaQQKNyicB7FY5eQ8kkQpot02NAlfZhVxYA
         uhmOa9yEf7wtHjHCAOmDezrYsGiUumH4Gt5CngE/uEYEEVbJ4o2GhLhuoXmR/nbiVJ20
         f+I6NKh2rXmPefYxBvkD5UJxDMztSzlnLY5MbsfKwCpj1kR8Z52lUsgo7PudqCD49e1N
         3GvyO72gcWS8DpaC5AB2ejRpXSdngZOGLRDB90a7Qe4UsuljYaZXg2MssqjiZreVHnaC
         gLirJL6fIhQWYVZ/Spj8N3whL/S+E/1vmEFl6anYcsSB8A8CZTA0HGBME9scLvptMPTZ
         8Y5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:subject:from:references:cc:to
         :dkim-signature;
        bh=is8SWdnXuRkabOwAS8mVMm8J5WzMhq7cJ8a9RVI/vJA=;
        b=PKhX79UFciftwVSlxos31Io/jog8gyW0CALGRjqKgD8TZh18adXtPQdqN39I45vAnT
         nPtzZsKECYoPCuD0x6XIyfTOarqus8fKSY8wA3SA3yUd/rj+jJP7loqdJ6ZxetJYSpKe
         VZ7Db0fDU9fGX9IKXVKuyUKuhdhAcISfFD5zl6Hhlv9Vd0uoQvdBX0ULefEw3ivAWw65
         7ChweGNFNBPUb7pr8t+7N/4+vLDwZErA9BMoX7017H7yf2jLH4g674JGnXq3h3tHJGX+
         YRGmmSyl+7QZhHlpeZJMNMBv4eAPouvvdF3NiW9Q7iXFrNpL5nGRzBNcZ/HEXY7Aojnw
         uZdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QSK7X2kq;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d25si244096eje.106.2021.06.08.10.23.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Jun 2021 10:23:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QSK7X2kq;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623173025;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=is8SWdnXuRkabOwAS8mVMm8J5WzMhq7cJ8a9RVI/vJA=;
	b=QSK7X2kq383BemLQO6sUHr+yY8+08mFNvYOx8TMBTUb/xZEFmGr3SgU5b/6YvXKDBtSajE
	AHeJ+euuBkvCdFyHuhGEcS1Qfe7z+J2gR0Vr8rIhaMewDepMry3BwEFUD08+a7ON5iuC2q
	uZNzmhqOxwZexLQNTIpPc5+PH0ufdyI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-mth7r3wMMbKhMQNdDhxGDw-1; Tue, 08 Jun 2021 13:23:44 -0400
X-MC-Unique: mth7r3wMMbKhMQNdDhxGDw-1
Received: by mail-wm1-f69.google.com with SMTP id n21-20020a7bcbd50000b02901a2ee0826aeso1441901wmi.7
        for <alex.bennee@linaro.org>; Tue, 08 Jun 2021 10:23:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=is8SWdnXuRkabOwAS8mVMm8J5WzMhq7cJ8a9RVI/vJA=;
        b=eN95kBO5Ii1dddtbCqpUEgcObI2wVtEnT9EUgdXuoT78LOR77PLDQMFO7zLeuzUJcD
         4p8Sb6BVJpkl9KygPYMDej7KuobZvEjuwdQ8JSvJUFY6EOMyW/wTEPrWm2yWqIi6Qssq
         a0fVrYQPP5O9CCf6NylF84e2Z+C2KM7X9nygvBnisTsnBSP2XqgTXrHqZwEv5fT3sRhr
         vbHCPxP1MQK7568V7ccH16oQ7cagdMG06FzqHalxOc2FAuudt8eUJm5rv2RjbnmLz4H3
         i3LwKQ7oKK5U+RjDb3552j7MbpPSgpqfWIbmuhi55L+q3jtrwJK4/WWqkWsd8TnpftKs
         TpRw==
X-Gm-Message-State: AOAM530sgrepJQZsDI6xbG6Yf5Ktx6v5Wk7pPI+n3ygmX9mRNc/java2
	7W5E7bER0bYd6NUyMiB/4BXgTV707bD1hB3tJjwwUokinw8SJoEih6HD1xn357u0FeWyDPChMQH
	CtJ82G8di/md2+sCL
X-Received: by 2002:a05:600c:1c8e:: with SMTP id k14mr14197706wms.61.1623173022964;
        Tue, 08 Jun 2021 10:23:42 -0700 (PDT)
X-Received: by 2002:a05:600c:1c8e:: with SMTP id k14mr14197686wms.61.1623173022716;
        Tue, 08 Jun 2021 10:23:42 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from thuth.remote.csb (pd9e83d80.dip0.t-ipconnect.de. [217.232.61.128])
        by smtp.gmail.com with ESMTPSA id z3sm22011815wrl.13.2021.06.08.10.23.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jun 2021 10:23:42 -0700 (PDT)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, "open list:IDE"
 <qemu-block@nongnu.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-97-alex.bennee@linaro.org>
 <fdb8ac5d-e6c6-0e13-e8df-f1e3e022c98d@linaro.org> <87im2ol8xu.fsf@linaro.org>
 <3cef0694-0c9c-e0d8-2c30-86dc6978db4d@redhat.com> <87czswl672.fsf@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v16 96/99] tests/qtest: split the cdrom-test into
 arm/aarch64
Message-ID: <c467c2dc-3db7-2e2e-ee05-540a258cff04@redhat.com>
Date: Tue, 8 Jun 2021 19:23:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <87czswl672.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: NSi6OXHJReZY

On 08/06/2021 17.35, Alex Bennée wrote:
> 
> Thomas Huth <thuth@redhat.com> writes:
> 
>> On 08/06/2021 16.27, Alex Bennée wrote:
>>> Richard Henderson <richard.henderson@linaro.org> writes:
>>>
>>>> On 6/4/21 8:53 AM, Alex Bennée wrote:
>>>>> The assumption that the qemu-system-aarch64 image can run all 32 bit
>>>>> machines is about to be broken...
>>>>
>>>> Um, what?
>>> Really what we want is to probe the -M (machines) that a binary
>>> supports rather than just barfing the test because we've built a QEMU
>>> that doesn't support all the random 32 bit machines.
>>>
>>>> r~
>>>>
>>>>
>>>>
>>>>    and besides it's not likely this is
>>>>> improving out coverage by much. Test the "virt" machine for both arm
>>>>> and aarch64 as it can be used by either architecture.
>>> I think this point still stands though, I don't think we get much
>>> from
>>> running the cdrom test with realview et all on qemu-system-aarch64.
>>
>> In a lot of CI pipelines, we are either building aarch64 or arm, but
>> not both, so I think it might be good to keep the tests in here.
> 
> We do test instantiating the cdrom with -M virt, exactly how many extra
> lines of coverage do we get for the rest?

$ grep -r block_default_type.*IF_ hw/arm/
hw/arm/tosa.c:    mc->block_default_type = IF_IDE;
hw/arm/cubieboard.c:    mc->block_default_type = IF_IDE;
hw/arm/virt.c:    mc->block_default_type = IF_VIRTIO;
hw/arm/spitz.c:    mc->block_default_type = IF_IDE;
hw/arm/orangepi.c:    mc->block_default_type = IF_SD;
hw/arm/raspi.c:    mc->block_default_type = IF_SD;
hw/arm/realview.c:    mc->block_default_type = IF_SCSI;
hw/arm/realview.c:    mc->block_default_type = IF_SCSI;
hw/arm/xlnx-zcu102.c:    mc->block_default_type = IF_IDE;
hw/arm/highbank.c:    mc->block_default_type = IF_IDE;
hw/arm/highbank.c:    mc->block_default_type = IF_IDE;
hw/arm/sbsa-ref.c:    mc->block_default_type = IF_IDE;
hw/arm/versatilepb.c:    mc->block_default_type = IF_SCSI;
hw/arm/versatilepb.c:    mc->block_default_type = IF_SCSI;

... thus these tests check quite a bit of different ways to pass a cdrom 
drive to the machine. I'd rather suggest to keep them, but you're the arm 
guy here, so if you don't like these tests anymore, feel free to drop them.

  Thomas
