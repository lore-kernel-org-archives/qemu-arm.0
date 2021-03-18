Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp237352lfg;
        Thu, 18 Mar 2021 03:47:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw6vjFDd+ZTtCPKxV5xDkN9uhEC9SrqlxvJqKJoUwBzeJ88QgaHqcstmAU0SBoE7f4drray
X-Received: by 2002:a05:6402:35cd:: with SMTP id z13mr2823988edc.21.1616064430176;
        Thu, 18 Mar 2021 03:47:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616064430; cv=none;
        d=google.com; s=arc-20160816;
        b=QdTg9Q0+7w9RRGWetOramrHvjyR5KYeQYnUyzgIYLrnc/lecFtJDP5lyb6unchI7Ve
         bbhbF0MMqO5fDPh6yHyJDng+GKtgAi3xWZ3X0WJDnXkcSvpVsnqLAsHQkYj2fRdadH6o
         Yal+g/c2kSgmTdyjl/ZkBVOBghZ9Gbm7r/cM+NxXrb5zqyeglHKHvNy0VRF1l5Pj01T6
         EOWexS79WNJAiB/TalVPGzpuOlaWJkyXTEeBeOKl6aEmbHGkMLiF32Qqsmu12zfmKYxf
         i44O/a6akmZNFKiA9U3TkXRVzmuneUEY1CQvEdPA2icfaWfuJruOUkmod7+zQAJV/z1u
         Sj0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=ydCeXgICna55PjLHgHsra4HmULIKMVLqCEAZhSLxPcY=;
        b=YUzNu0XMUXxFww8sgrU0n37dPtg6JT1hw9s6qiJiy+Q49fZFPZh0XDmBKGvyJMffO8
         b5fXIjHX7nOr1Go86y37Sni9mARDfIeDW0UdC8/9xLcilmi9me4Ix7/4E5OR/1q20IPf
         xIiJdouAqQTOWbo9ShzL5rmhXE614XcrdOWFfht5TVFi+gftOi4IKa6ItApqgmuliBbV
         27Zz2L6l7uJqnkqMI13U8ojectGuMdqEdJ3VE0tGoJQjgfgByav+bWtdtczIouihffbw
         lcD1XKKFR9xyQg1Ak1hleUYTYLzQzLEoGvgJAnSNrbtILnvBjOEkH04NwPd+8SSykykx
         xKGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BNszh4jr;
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [63.128.21.124])
        by mx.google.com with ESMTPS id bf1si1186325edb.359.2021.03.18.03.47.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Mar 2021 03:47:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) client-ip=63.128.21.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BNszh4jr;
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1616064429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ydCeXgICna55PjLHgHsra4HmULIKMVLqCEAZhSLxPcY=;
	b=BNszh4jrUs7u4Vrj6DaYbVkQ2ADi4rqzCuRh/YVYnE7Nj98TVUGzhZcJUwovKPymeEFnt0
	6LyhFn2oNhHv6zbwhzzpwksRO1ws3XPYZeA55OPyxdPHCSbiXTSD7zWYmzmqxZ/UfsdI6Z
	PwDfFjmWlL5Llldd5hL6QNj2+YWtxls=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-nq2xlN2lOiKe_go14kcQlg-1; Thu, 18 Mar 2021 06:47:07 -0400
X-MC-Unique: nq2xlN2lOiKe_go14kcQlg-1
Received: by mail-wr1-f70.google.com with SMTP id n16so18847050wro.1
        for <alex.bennee@linaro.org>; Thu, 18 Mar 2021 03:47:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ydCeXgICna55PjLHgHsra4HmULIKMVLqCEAZhSLxPcY=;
        b=CF1qObEfY0VKZttOvqx/mXwBqoYcZS7GmW8bq+bcEgv/fIeaqmTEjRGbRs0llSlHjN
         sk+H9xQbLiGoxETjW9nPO7ioHskQId50G521H+GlGC1K/CGUXN9a6wqPfT6nmF4klXut
         1m9+MjzYUsjWL9DMhLp6/FeYlUXfJCFDGd3vFmTQSD21sWU6/3qCFLhFOraHs+eFRGGB
         Ug0t86p9ZavJyOKhDa3jT/+4O39SjfRNnQ3uYT0EldZk8Dg4/jZIS6zdkxl5GKRE2G6X
         e308p3a8XMvp1JSc8V5C8CEdfZ1dy+ANmmeOb9Hx9R+/TmbCkW3hARDtMZIiSa+DVqWg
         1Tfw==
X-Gm-Message-State: AOAM532cLwqRMpHwpDG72YyP7WS5KF9KGyiqd94mbYC5HraYYt0YDW74
	m1dK1nkFdPu7OAt2BVMmBP+ClSzLPP+B79ey8geLtSWKKV0Ui0ycxF0z6wevE+RhP4ZAapGjggh
	vZGtelfDpLpeFrR/W
X-Received: by 2002:adf:ee92:: with SMTP id b18mr8703430wro.275.1616064426467;
        Thu, 18 Mar 2021 03:47:06 -0700 (PDT)
X-Received: by 2002:adf:ee92:: with SMTP id b18mr8703416wro.275.1616064426302;
        Thu, 18 Mar 2021 03:47:06 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net. [88.21.201.17])
        by smtp.gmail.com with ESMTPSA id g15sm1795135wmq.31.2021.03.18.03.47.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Mar 2021 03:47:05 -0700 (PDT)
Subject: Re: [PATCH v2 3/3] target/arm: Restrict v7A TCG cpus to TCG accel
To: Claudio Fontana <cfontana@suse.de>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-arm@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Andrew Jones <drjones@redhat.com>
References: <20210221222617.2579610-1-f4bug@amsat.org>
 <20210221222617.2579610-4-f4bug@amsat.org>
 <c395479b-d2e0-a862-3446-4afef601ca1f@suse.de>
 <8a302c84-b69c-b0c2-de45-607dd1f686a6@redhat.com>
 <e0d11b2c-7b1c-c968-feb2-675a8c98c7a4@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ec296129-2c4d-fd74-d044-50c470e29609@redhat.com>
Date: Thu, 18 Mar 2021 11:47:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <e0d11b2c-7b1c-c968-feb2-675a8c98c7a4@suse.de>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 4++q/bC1QLfK

On 3/18/21 10:56 AM, Claudio Fontana wrote:
> On 3/18/21 10:47 AM, Philippe Mathieu-Daudé wrote:
>> Hi Peter,
>>
>> On 3/11/21 11:43 AM, Claudio Fontana wrote:
>>> On 2/21/21 11:26 PM, Philippe Mathieu-Daudé wrote:
>>>> KVM requires the target cpu to be at least ARMv8 architecture
>>>> (support on ARMv7 has been dropped in commit 82bf7ae84ce:
>>>> "target/arm: Remove KVM support for 32-bit Arm hosts").
>>>>
>>>> A KVM-only build won't be able to run TCG cpus, move the
>>>> v7A CPU definitions to cpu_tcg.c.
>>>>
>>>> Reported-by: Peter Maydell <peter.maydell@linaro.org>
>>>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>
>>>
>>> Here I think it's better to keep the "a15" cpu around,
>>> until we fix the board configuration situation.
>>>
>>> I added a patch that does that into my KVM-only build series, to avoid the resulting breakages.
>>
>> Actually I got a downstream report that this break migration from QEMU
>> 5.2 to QEMU 6.0.
>>
>> I first thought it was on an old kernel (with 32-bit KVM enabled),
>> but not, it is for Aarch64 VMs on recent KVM (without 32-bit support)
>> but the 'virt' machines were started with default Cortex-A15 CPU...
>>
>>     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
>>
>> I'm not sure upstream should care about this case, but I though
>> maybe you could give me hints about the best way to keep old VMs
>> working, as this likely affects any distribution. Obviously not
>> upgrading QEMU is not a solution :)
>>
>> The simplest seems to revert 82bf7ae84ce and this patch, but I
>> doubt this will be enough.
>>
>> Maybe there is some clever thing to do before reverting 82bf7ae84ce,
>> that could also benefit upstream, by doing something with versioned
>> machines? I have no idea (yet) how that work and if it could work.
> 
> Does just applying my series fix it?

But we are past soft-freeze so I'm looking for a surgical fix.

I'll send a partial revert for now.
