Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp252244lfg;
        Thu, 18 Mar 2021 04:06:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdqGBqxUcNYw7KyR9unAC3QAFxdqM4NDa14C9b3Qi2Wh/QzV3wouzPyaQgyVPOVXBjCp3F
X-Received: by 2002:a92:d80f:: with SMTP id y15mr10294420ilm.96.1616065617856;
        Thu, 18 Mar 2021 04:06:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616065617; cv=none;
        d=google.com; s=arc-20160816;
        b=lU6hLaCSwHIQa5u+M7MVZqtH+z15e/bZlCImnF3rEPAdS44RZ7If+QEeAA8JEvbwdb
         v8u33BTLcv2wIJIUoRmZdBxQAv2rfiuFx5zX+e01w40PoKv2G+o+z77Y+EvLjWvfnTwu
         oANWqPo6pF15WT/4LGKrbJku0cT9lae7qYhLYpS0UGnHCXO7NWGFaAbqIL5PzQsbN90P
         u130WF9t4I3Z9MoKkak1UvPEA/nVGEtI7dGcenEA1RyJ2bzPzkjmTdamB82wFPIYswu4
         wGLmQ4Ltf2VvYuZHPPv4+df8HAFn8wpZ/jxlaUVM+zcZWB5yqeuzf+Idggi2y2wIon0y
         lG7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=3JeSLbMJ9iI8hqt5RgFQmr6Jk96gNdg6srG10ZJOVT8=;
        b=RJ/FUEgvyzorT7AgcBbyDyqjTXE9TrtFoF9j0KUn1QCfWXrF0Q9f9ho75W0Ov8tDa5
         vErkEbPmGshnB2rn9jg9uI9zFk199uLFHv5zfyD7we56mZ63zLV+hkXJM1W4nZBG72Tn
         xu1hYhEACY+WsiZ+oEnzZS4IcUzNk/XBWiZGzaX37Wnx+/qqfwyhfDTIxHeM/sVhn+gr
         fs/KWRHQnCSHcCD9aTqVeiLSHrOLslPeTAL8ynJfkWajEgJQH0cUbLv5ID+9Em+YEtup
         ajD3Sg9Fsy7KtRUAPkkW8rQqMQJ5i+eKuKCa5381hPxvUH0X8gqtx5mlUUT+zK+lPb/6
         Cztw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p13si1076339ilh.128.2021.03.18.04.06.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Mar 2021 04:06:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lMqUT-00047t-6Z
	for alex.bennee@linaro.org; Thu, 18 Mar 2021 07:06:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lMqUJ-00045w-Aw; Thu, 18 Mar 2021 07:06:47 -0400
Received: from mx2.suse.de ([195.135.220.15]:55896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lMqU7-00011g-Re; Thu, 18 Mar 2021 07:06:45 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B6577AC75;
 Thu, 18 Mar 2021 11:06:33 +0000 (UTC)
Subject: arm_cpu_post_init (Was: Re: arm: "max" CPU class hierarchy changes
 possible?)
To: Andrew Jones <drjones@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <11e9d3bb-c94c-4ad7-35b0-b698376c5e00@suse.de>
 <CAFEAcA8T+u6QG9PQWs40PTSZ86SEeLQrciT8WHxFyH3UVbipiA@mail.gmail.com>
 <2e6a5d98-e022-0b39-5f30-92eb74491d3b@redhat.com>
 <2277fdf5-ec92-476a-8fe5-0d4eee23dfef@suse.de>
 <CAFEAcA_j-0+vmNFtPjcxEXC9r4bFrebDfGjq-x1SfguzUG4qcw@mail.gmail.com>
 <20210311191046.ykcelkwq7orajyu7@kamzik.brq.redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <5467e45c-cc8e-6422-0c56-398405a7c331@suse.de>
Date: Thu, 18 Mar 2021 12:06:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210311191046.ykcelkwq7orajyu7@kamzik.brq.redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: q13gT5EKdrVO

On 3/11/21 8:10 PM, Andrew Jones wrote:
> On Thu, Mar 11, 2021 at 06:33:15PM +0000, Peter Maydell wrote:
>> On Thu, 11 Mar 2021 at 17:16, Claudio Fontana <cfontana@suse.de> wrote:
>>> Maybe Peter you could clarify similarly what the intended meaning of "max" is on ARM?
>>
>> "max" is "best we can do, whatever that is". (On KVM this is "same as
>> the host".)
>> "host" is "whatever the host is (KVM only)".
>>
>>> KVM: (aarch64-only): aarch64_max_initfn():
>>>
>>> The following comment in the code seems wrong to me:
>>>
>>> /* -cpu max: if KVM is enabled, like -cpu host (best possible with this host); */
>>>
>>> This is not exactly true:
>>>
>>> "-cpu max" calls kvm_arm_set_cpu_features_from_host(), (which checks "dtb_compatible", and if not set gets the features from the host, if set ...?)
>>> After that, calls aarch64_add_sve_properties() and then adds also "svw-max-vq". This code is common with TCG.


As part of this research I noticed that arm_cpu_post_init() is quite confusing, seems really inconsistent to me.

Apparently the intention was to call it from the leaf classes:

commit 51e5ef459eca045d7e8afe880ee60190f0b75b26
Author: Marc-André Lureau <marcandre.lureau@redhat.com>
Date:   Tue Nov 27 12:55:59 2018 +0400

    arm: replace instance_post_init()
    
    Replace arm_cpu_post_init() instance callback by calling it from leaf
    classes, to avoid potential ordering issue with other post_init callbacks.
    
    Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
    Suggested-by: Igor Mammedov <imammedo@redhat.com>
    Reviewed-by: Igor Mammedov <imammedo@redhat.com>
    Acked-by: Eduardo Habkost <ehabkost@redhat.com>


but then we end up calling it multiple times in the class hierarch, which is a recipe for bugs, and makes it difficult to understand what arm_cpu_post_init()
even means, what calling this function is supposed to do.

For a "max" or "host" cpu on AArch64, this function is called:

for the ARM CPU base class, TYPE_ARM_CPU, in

cpu.c::arm_cpu_instance_init,

then later again for the TYPE_AARCH64_CPU class, child of TYPE_ARM_CPU, in

cpu64.c::aarch64_cpu_instance_init,

then later again for the TYPE_ARM_HOST_CPU class, child of TYPE_AARCH64_CPU, in

cpu.c::arm_host_initfn.

Same for "max".

When looking at 32bit CPUs instead, only the ARM CPU base class ends up calling arm_cpu_post_init.
"Leaf" classes do not do it (see cpu_tcg.c).

What is then arm_cpu_post_init even supposed to mean?

Thanks,

Claudio


>>>
>>> In the case of cpu host instead,
>>>
>>> "-cpu host" calls kvm_arm_set_cpu_features_from_host(), same as max, then calls aarch64_add_sve_properties() but does NOT add "svw-max-vq".
>>>
>>> Is this a bug?
> 
> It was left out intentionally. More below.
> 
>>
>> Maybe; that's a question for Richard or Drew...
>>
>>> Are "max" and "host" for KVM supposed to be the same like with x86?
> 
> Yes, but my understanding of "max" == "host" for KVM is that that only
> applies to the perspective of the guest. What CPU and what CPU features
> the guest can see should be exactly the same with either "max" or "host",
> depending on the enabling/disabling of any optional CPU properties.
> 
> The question here seems to be that, if one has a CPU property, does that
> imply the other should have the same? Which would effectively allow the
> two to be aliases (when KVM is enabled). I don't know, does x86 ensure
> 100% property compatibility?
> 
> I opted not to support sve-max-vq for "host" because I consider it a
> legacy CPU property, one I didn't want to propagate. Indeed it may
> make more sense to depreciate sve-max-vq than to "fix" this issue
> by adding it to "host". Note, we can already create equivalent SVE
> CPUs. The following are the same from the perspective of the guest
> 
>  -accel kvm -cpu host,sve512=on
>  -accel kvm -cpu max,sve512=on
> 
> And, for TCG, these are the same from the perspective of the guest
>  
>  -accel tcg -cpu max,sve512=on
>  -accel tcg -cpu max,sve-max-vq=4
> 
> So we already don't need sve-max-vq.
> 
> Thanks,
> drew
> 

