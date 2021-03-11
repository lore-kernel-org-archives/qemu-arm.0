Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp405888lfg;
        Thu, 11 Mar 2021 07:53:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxomsxM0TLlSJ9j6WgVgv9G0AIdsk3D1Hh1SP15jTMyzMK1pcqBb88B/QkOohRvRNjShjsr
X-Received: by 2002:a9d:2241:: with SMTP id o59mr7579672ota.8.1615478009823;
        Thu, 11 Mar 2021 07:53:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615478009; cv=none;
        d=google.com; s=arc-20160816;
        b=J7EA2hVIQW4WWWNxvVgIDkzlWgM8E95seMyujfILdYQOQwVmDDDFLpqDEf4C8Pd7NI
         tfueIjcPEodFUlHSlWITwqhoohYY7ygPmULrLY27xb5vNwXYUmL6ez4oyCNT3oCpYbMF
         TuHUlImnw61bIUSZ2+VRoXmZsSX+wUENdRpS78+VhzaLKfBddKYKuXXgBOY4CkZX1g6q
         +xyuEhJrPvKa9huEFUpPZ3OYeAd2lauOy6rI45LUKrDvAXqTyU+0OdnYF1iczq1jZudI
         2pddcH1jYWR0brFtrKXN5moppx5u1Do3rGCpmT88JfD9Af1l3HdQznoDLdqJ2r8itacn
         sC+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=j8nPJvXUbyOQ5Gkj9YVwDjzg3ALdTrwJUJIVGUiF02E=;
        b=gR50pWBdb2/LSSEuyW0PO4LQ2GsCJMwtDC/E3OskZA6ffAG0b39C9q8A26lldqyeeY
         I2brj8FP56BcHi3wEgNkPP5IDdKSRPes0LsPTM+h4GA/oYidN7jJ28pRrPseNoylEmJf
         g32wPVp2B7wuENPSfAHdwDKiqlEpB99vFP82HiHv3cNvlNy85g7a8Kyvl35LMBtLhdRv
         EiLP0sWobOaQcRV8HogO5j5BgRazLLrp8yzdWRhsQRcVwTTJvng5oz9s0iEA9uqX9GT6
         TtEG9wjvO8n7NfGNln8x8tD0o/mkUAungfA+fG5WN4D5TwlnKRaN/HDfFG+emUUm+puN
         isHA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h30si2305210ooe.67.2021.03.11.07.53.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Mar 2021 07:53:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lKNcv-0004t4-38
	for alex.bennee@linaro.org; Thu, 11 Mar 2021 10:53:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lKN7p-000341-Qg; Thu, 11 Mar 2021 10:21:21 -0500
Received: from mx2.suse.de ([195.135.220.15]:34988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lKN7o-0004vL-1f; Thu, 11 Mar 2021 10:21:21 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 58502AB8C;
 Thu, 11 Mar 2021 15:21:18 +0000 (UTC)
Subject: Re: arm: "max" CPU class hierarchy changes possible?
To: Peter Maydell <peter.maydell@linaro.org>
References: <11e9d3bb-c94c-4ad7-35b0-b698376c5e00@suse.de>
 <CAFEAcA8T+u6QG9PQWs40PTSZ86SEeLQrciT8WHxFyH3UVbipiA@mail.gmail.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <e7520c77-16a8-0fda-c138-b411c20f0389@suse.de>
Date: Thu, 11 Mar 2021 16:21:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8T+u6QG9PQWs40PTSZ86SEeLQrciT8WHxFyH3UVbipiA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-arm <qemu-arm@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iwrPzc0Ttu8M

On 3/11/21 4:02 PM, Peter Maydell wrote:
> On Thu, 11 Mar 2021 at 14:27, Claudio Fontana <cfontana@suse.de> wrote:
>> the "max" cpu in x86 and s390 is a class,
>>
>> and then "host" has "max" as parent.
>>
>> This would be a convenient setup for ARM too, as it would allow to put common code between kvm and tcg in the "max" class,
>> and allow "host" to specialize the behavior for KVM (and in the future HVF probably).
>>
>> Would changing the class hierarchy this way be acceptable, cause any problems?
> 
> It's not clear to me why 'host' would be a subtype of 'max':
> that doesn't seem like an obvious relationship.
> 
> thanks
> -- PMM


If there is no blocker on _any_ change to the hierarchy I will put it in the RFC series,
so we can discuss the merits there and investigate alternatives,
if there is no immediate blocker to any change in the object hierarchy.

https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg03864.html

Thanks,

CLaudio
