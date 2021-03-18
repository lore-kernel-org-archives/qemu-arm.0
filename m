Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp254088lfg;
        Thu, 18 Mar 2021 04:09:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOxb/T5rZ6V5uxs9rVW9skEnOHtQmjOmL/1CQgBVhwiPxEJ76NlyV9x78HWn531gHSJjLV
X-Received: by 2002:a05:6402:4244:: with SMTP id g4mr2944870edb.204.1616065748179;
        Thu, 18 Mar 2021 04:09:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616065748; cv=none;
        d=google.com; s=arc-20160816;
        b=R3xZrtBcq1G5Rvcc5QKuw21p0tlxElVXEGTahbwbqwGvqmbbwXk8SBNqkRampGIn94
         5JFpDH36evEWh4B+snnt/yWmQk0KYXYdEs2icPMcEAwV2kkRgDPkX7iJv+1JhgbWjViD
         /P4lHPDqysE4M4eDf44IVPsOPu024Nv8X+6wy2OT6qJYIQYJQexCoMkhYzoubrBgR6nR
         CihidtH9oX+noA2QGLclsI+xGx0aUo3nZg4EB2/H60a4s4dVH8maKLmZnG/HzHj+aPfj
         HbJnnTOoxipIjsi680505FXVwa2U3vVIdu7/eSpd/35rWyUgQARfMB1ek99d9JmtlNIL
         3Dtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:cc:to:from:subject
         :dkim-signature;
        bh=Su5QXIYBwZ9bftA9ISaXhIKhZvZPIa3gqoeKlzPV1Do=;
        b=Sr59Sox3lxtQccbiY0n45TPnUuz8ySfxeX44ZhU04Flg5QSK9xe4rCElF5ZHh6FElE
         C9CIOUtHxKJJ/XFfvpCcEM/MKJe9vICJxWhtOwXulzM4p1NWtZCaxtzgcx6OTIExOJLj
         /ztqwRn3eD5aqtEBjIZi4evIhjW9sKYp4npqbyjktTujvuvkOHVhwelC3VuWW5CkWRIb
         rldc5PLTl1U+G2bepOe3TAbRVSR8Evqtef+IBXLGN43lR9y4VE1BycZIaLuDkNkFtffd
         LlN6nLN7WRI9V3rKdMAg2D/Zc2JQL+i/yruluDtTCqgPRcEKKXBvP2Jy2LSM0dD7qjVG
         tHrw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MJagqOC2;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id m26si1283157edr.603.2021.03.18.04.09.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Mar 2021 04:09:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MJagqOC2;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1616065747;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Su5QXIYBwZ9bftA9ISaXhIKhZvZPIa3gqoeKlzPV1Do=;
	b=MJagqOC2sb2oWkA1lT8xVk0UW9SZgfTq0vHo5y4tbJRtSRSQFbtuQ6ihLzkl5LpS/YMuMq
	JI+oVhn1eJwCGE1T6oPFSeMBX8s0Rj2lgAcW0xyv6nWpKV+qUbhcQa1+twmFNpK0nHZ5Md
	tl7QZMlRENLvFx1k4YhEFBUNsvGWlA8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315-YrpMYee_Oy6MolxqZTCDqg-1; Thu, 18 Mar 2021 07:09:04 -0400
X-MC-Unique: YrpMYee_Oy6MolxqZTCDqg-1
Received: by mail-wr1-f70.google.com with SMTP id i5so19934946wrp.8
        for <alex.bennee@linaro.org>; Thu, 18 Mar 2021 04:09:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Su5QXIYBwZ9bftA9ISaXhIKhZvZPIa3gqoeKlzPV1Do=;
        b=tONCzS+Piq7JAcZVftSayFjUIGOdPjecM6HbVAHYHOpZ4ZsRVmnY2N1tv32sX69IoB
         uc0M+rR+h8tIhz7vHYJ4w8QIozsW2JMzAIjy7qX/rK/BTvGEkTKodj6MB8iKukCvUzkV
         m/1c+IfJg6sosSU+OMKeT7U1Vi6ccYqqUlXUncArD1NBHDh9BlsOlg0Q35y+iGsLF5KP
         r9lLr9/k/4WRpExuMqHejbN01cCnNX5zT3UwN14MlsktqvJUZMcZ/9MFGFSZo48yEL4y
         tGKym6npsF82dS7npJXMtuIZOaIxXtkeEojtDWbmv0R8SQcv2Sjsr2oj3718MKScid/Y
         nfyQ==
X-Gm-Message-State: AOAM531CpxmjE0oTDE43kaF68KVT7Him0UbVHeyBc5OJVJJ09Sxr8Nof
	zWG3aFoHIfHN0Yjya+vzrQ0yGoOG+rRCue5QKiBJgWMswbuw6J3I6hhUgb6y0PHcV147uGBdR7H
	CzbJkdjk/5G9Tlb8B
X-Received: by 2002:a5d:564b:: with SMTP id j11mr9265235wrw.326.1616065743553;
        Thu, 18 Mar 2021 04:09:03 -0700 (PDT)
X-Received: by 2002:a5d:564b:: with SMTP id j11mr9265217wrw.326.1616065743362;
        Thu, 18 Mar 2021 04:09:03 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net. [88.21.201.17])
        by smtp.gmail.com with ESMTPSA id i26sm2068502wmb.18.2021.03.18.04.09.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Mar 2021 04:09:02 -0700 (PDT)
Subject: Re: [PATCH v2 3/3] target/arm: Restrict v7A TCG cpus to TCG accel
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
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
 <ec296129-2c4d-fd74-d044-50c470e29609@redhat.com>
Message-ID: <cd4caf9d-c32c-25fd-a27f-d352ece74ed3@redhat.com>
Date: Thu, 18 Mar 2021 12:09:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <ec296129-2c4d-fd74-d044-50c470e29609@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: kwfIEAmT4ah5

On 3/18/21 11:47 AM, Philippe Mathieu-Daudé wrote:
> On 3/18/21 10:56 AM, Claudio Fontana wrote:
>> On 3/18/21 10:47 AM, Philippe Mathieu-Daudé wrote:
>>> Hi Peter,
>>>
>>> On 3/11/21 11:43 AM, Claudio Fontana wrote:
>>>> On 2/21/21 11:26 PM, Philippe Mathieu-Daudé wrote:
>>>>> KVM requires the target cpu to be at least ARMv8 architecture
>>>>> (support on ARMv7 has been dropped in commit 82bf7ae84ce:
>>>>> "target/arm: Remove KVM support for 32-bit Arm hosts").
>>>>>
>>>>> A KVM-only build won't be able to run TCG cpus, move the
>>>>> v7A CPU definitions to cpu_tcg.c.
>>>>>
>>>>> Reported-by: Peter Maydell <peter.maydell@linaro.org>
>>>>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>>>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>>
>>>>
>>>> Here I think it's better to keep the "a15" cpu around,
>>>> until we fix the board configuration situation.
>>>>
>>>> I added a patch that does that into my KVM-only build series, to avoid the resulting breakages.
>>>
>>> Actually I got a downstream report that this break migration from QEMU
>>> 5.2 to QEMU 6.0.
>>>
>>> I first thought it was on an old kernel (with 32-bit KVM enabled),
>>> but not, it is for Aarch64 VMs on recent KVM (without 32-bit support)
>>> but the 'virt' machines were started with default Cortex-A15 CPU...
>>>
>>>     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
>>>
>>> I'm not sure upstream should care about this case, but I though
>>> maybe you could give me hints about the best way to keep old VMs
>>> working, as this likely affects any distribution. Obviously not
>>> upgrading QEMU is not a solution :)
>>>
>>> The simplest seems to revert 82bf7ae84ce and this patch, but I
>>> doubt this will be enough.
>>>
>>> Maybe there is some clever thing to do before reverting 82bf7ae84ce,
>>> that could also benefit upstream, by doing something with versioned
>>> machines? I have no idea (yet) how that work and if it could work.
>>
>> Does just applying my series fix it?
> 
> But we are past soft-freeze so I'm looking for a surgical fix.
> 
> I'll send a partial revert for now.

Still, I'm not sure it makes sense. If you want to migrate a such
machine, KVM can not virtualize it, so you'll be forced to use TCG
right? In that case cpu_tcg is built in and you have the A15.

IOW the problem is not this patch, it is that since 82bf7ae84ce we
can not migrate A15.

So we need both 1/ revert 82bf7ae84ce and 2/ be sure the kernel
support 32-bit host... Am I missing something?
