Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp428846lfg;
        Thu, 11 Mar 2021 08:20:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzZDE0V2ZwiFqriI3NCxRoiOWqhKMVL4X3Gcxek7Lb1q4P0Fx5UfYIIrtU0jE4miZC+Rrw6
X-Received: by 2002:a92:d80f:: with SMTP id y15mr7120506ilm.96.1615479636046;
        Thu, 11 Mar 2021 08:20:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615479636; cv=none;
        d=google.com; s=arc-20160816;
        b=UqT35HYdz7SAGLp35FHWtTez8I6R55IeUmwKVxqw3Igoq0VhiWQK5azJ4zZqO57eAw
         3P9nx5/JkP9gMKWLUD432nSHIrof8DSdCdEn6eKWAL5veYKjK0806sCeQMEY7zpbdSDy
         AcXmX85QWg0L7IRwmh6+O9pi8cxLKWumxSKsC1j2W5rPU++vVojreMVue7JKC9TkpPGo
         3tVpr7Q40vkXwKW4FBApne9Gh9Itoecjdt9mbC4LT4xccwcxsqelY30ApFco759Hr6LM
         YqfzLfastuqH1L5MHvebeDTUhiJLVeaXHxV5nuJ+fDnSIwXv7RwIL5KK5Ysj0eiVMoZo
         eXFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=LrADqJeed8uGCxsGNZ4KUfZ7NLuQoNuxyycdjUUjj58=;
        b=FscVlqYkEYv/tML20VVtyh9wL87Q/xjGGQGYUg6/ZUhBG3xPI1W6NStN7h+jLop6XU
         rTSVx2I05GKpvXGM4zmpAl5KvuxoBPoOZys8mlTJkXD0imeIbzw5Pwel9kldUNtD5czp
         k4fOTKTCS3IgWNf8+v5WmVLGOABcCjcHCK2UiPewD4Sl9AiBCjdysEonKblNzxS/Bt/h
         JODBpo/MidBf6DRrKnh9IEY5A7nkqH1GXreQYpfyfjSPVBaLp4Udre8Y1MiDWrMzaT4h
         0qXHj0b84PBKImTKo0lzaUFQz/S8rjmPoeHY7a/cKOOUmSAw9KDv/fI28yFdKAIFSB/1
         Nfjg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IK6bf1Hg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y18si3156295jat.6.2021.03.11.08.20.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Mar 2021 08:20:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IK6bf1Hg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lKO39-0007pW-C4
	for alex.bennee@linaro.org; Thu, 11 Mar 2021 11:20:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKO0n-0004GQ-Ft
 for qemu-arm@nongnu.org; Thu, 11 Mar 2021 11:18:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKO0l-0002hv-UH
 for qemu-arm@nongnu.org; Thu, 11 Mar 2021 11:18:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615479487;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LrADqJeed8uGCxsGNZ4KUfZ7NLuQoNuxyycdjUUjj58=;
 b=IK6bf1Hg2zkyPRviOXlVaDW2xbyOA1LQz60iniggwGLdUgJW/OheWmFu0qH9EYS/bY0hvT
 VjEKJTLQM9PdXp/slB8MOyr0PzCzDsnwOOD3dwrn2TqReeG6JTnOhsLR8abPU68DqoLV0W
 rP/+UtJsKBFGPExJ0sbBC8f/X1a8fIc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-sUDz5lgEOVKVbTryuFGEbQ-1; Thu, 11 Mar 2021 11:18:03 -0500
X-MC-Unique: sUDz5lgEOVKVbTryuFGEbQ-1
Received: by mail-wm1-f69.google.com with SMTP id c7so4245541wml.8
 for <qemu-arm@nongnu.org>; Thu, 11 Mar 2021 08:18:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LrADqJeed8uGCxsGNZ4KUfZ7NLuQoNuxyycdjUUjj58=;
 b=ONndPK5HJrEVn/kHr3SPDMOEcOFnJovsIl4C8KLCTau58h86wqw/CD78KEsFexkczN
 E6HC8GDWPPxAOyS2Q30AlVWchCjHsCDa0fFdG/aMIZgAwpLmhfIJMb+wQppXKLQUQheX
 Tq0UbGY+rO0WVDVXYDBR2Zjtn2NWh/tPTOQXuNErKmxgYsd9Lob9ZJOXJNlcu4ZflW37
 EH0OJhxj4HMjkSpVoZbRKk0dC28/yEFC/KBhoy3H0/5arbr7YCpk0MQfNeigK8R9TV4u
 wCoZdv3JPzyMRM7KrbYi9lqiSMV+tF4XACyuVfAPgQOskyenTeJLkchlZzgZttOUKNrH
 456A==
X-Gm-Message-State: AOAM532nmkVp/dUtdonet6iAo4EXUPpY6lguY19w1/8rEtVEtnSe2Fi5
 Cz1+WHHeFBIY8qYct3a6P/Jbc2cqU6wU+80gLTKwfpNuhHlQJkSA2+41T4PUIOAUwJMxwkSYT41
 Dnowt6/vWQxBR
X-Received: by 2002:adf:9bd7:: with SMTP id e23mr9397590wrc.48.1615479482242; 
 Thu, 11 Mar 2021 08:18:02 -0800 (PST)
X-Received: by 2002:adf:9bd7:: with SMTP id e23mr9397562wrc.48.1615479482009; 
 Thu, 11 Mar 2021 08:18:02 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id i8sm5047429wry.90.2021.03.11.08.18.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Mar 2021 08:18:01 -0800 (PST)
Subject: Re: arm: "max" CPU class hierarchy changes possible?
To: Peter Maydell <peter.maydell@linaro.org>,
 Claudio Fontana <cfontana@suse.de>
References: <11e9d3bb-c94c-4ad7-35b0-b698376c5e00@suse.de>
 <CAFEAcA8T+u6QG9PQWs40PTSZ86SEeLQrciT8WHxFyH3UVbipiA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <2e6a5d98-e022-0b39-5f30-92eb74491d3b@redhat.com>
Date: Thu, 11 Mar 2021 17:18:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8T+u6QG9PQWs40PTSZ86SEeLQrciT8WHxFyH3UVbipiA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-arm <qemu-arm@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: junblrCk7JMh

On 11/03/21 16:02, Peter Maydell wrote:
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

On x86, "-cpu host" is essentially the same as "-cpu max" with the only 
difference that it errors out on TCG.  So:

- with TCG: "-cpu max" enables all that can be emulated, "-cpu host" fails

- with KVM: "-cpu max" enables all that can be virtualized, "-cpu host" 
does the same

Paolo

