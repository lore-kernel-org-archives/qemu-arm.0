Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1089955lfg;
        Fri, 19 Mar 2021 01:34:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwNDSCTOeUOfdDuhhMso4gOYARt1Bn584FaT7OkYeszdYy+lCGazkNTx0qk6FmdHtQEEcmB
X-Received: by 2002:a25:bacb:: with SMTP id a11mr5347971ybk.128.1616142845299;
        Fri, 19 Mar 2021 01:34:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616142845; cv=none;
        d=google.com; s=arc-20160816;
        b=TO947ueqQTnOjcKZ2sHjIkFIPN2XOwLAICAa8FLF+UnuGIhlbdx0IJ+mmbmN7ZskvQ
         atqE3BMPnNf9imzCHs/xvZemriySx45yYs05tfrB5zpNSBeiajdKNnsLqOHDEbzXPHNW
         rsPVIfekW8Zt71qkKRHHMPZhbdMDJ88MUzS7ap4NuLuzQnmn9qoEZbgWG+BErHHFXyC/
         7IpW4ruMKogRI6BPHaNQVO6kZuX6e7wsp1UphuPpSuhw6ghUHq3k+J0p8E28OD7ZiAYE
         FVhbD8PoBGMqcaICqYTvu/LNKu7yu8CbwZDrdnKURe2RSh1nXLBfR+yagLim4i3hDI07
         8oTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:from:subject;
        bh=USu+IOr9WhcfTZ/YhUHAfSummS87kBVxDYzmdVceUek=;
        b=m6Ew7jnSsXg6T7Gy1g+QHVoSi5c+di//NqEO3+VHWiWiM9j0i4wV8z3wmEPdIEAPCi
         V/cPwM/W4XgBjYP3fzH5Ff4SayrgzWNJbE2BmEEjnigQqulJHv6InpYMUUPULJvlUb3o
         haOujIDNB5L9jWfMJvX7XIWC+8kYOvXIvHyP1ZCMjDHdLdlvn5K1G63g0DHi61xoS1Iw
         azf9l+PidTwhzQx2nUGcFNd08cmfK2/Z9LMa1dr4eCuuwkRE5aNx6n1d2HOyGU1qPtS6
         AT8dukGtBqdabpeR4SaEtJA8YBQpSWrTvRc2zNfnrbrFzw4Q5d6gLS228aZ6lZH24WXt
         RqTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o18si1878860ybk.234.2021.03.19.01.34.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Mar 2021 01:34:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lNAa4-0000v8-JE
	for alex.bennee@linaro.org; Fri, 19 Mar 2021 04:34:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lNAZw-0000uy-DW; Fri, 19 Mar 2021 04:33:56 -0400
Received: from mx2.suse.de ([195.135.220.15]:55900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lNAZu-0007ZZ-GM; Fri, 19 Mar 2021 04:33:56 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 99E9BAE5C;
 Fri, 19 Mar 2021 08:33:52 +0000 (UTC)
Subject: Re: arm_cpu_post_init (Was: Re: arm: "max" CPU class hierarchy
 changes possible?)
From: Claudio Fontana <cfontana@suse.de>
To: Andrew Jones <drjones@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
References: <11e9d3bb-c94c-4ad7-35b0-b698376c5e00@suse.de>
 <CAFEAcA8T+u6QG9PQWs40PTSZ86SEeLQrciT8WHxFyH3UVbipiA@mail.gmail.com>
 <2e6a5d98-e022-0b39-5f30-92eb74491d3b@redhat.com>
 <2277fdf5-ec92-476a-8fe5-0d4eee23dfef@suse.de>
 <CAFEAcA_j-0+vmNFtPjcxEXC9r4bFrebDfGjq-x1SfguzUG4qcw@mail.gmail.com>
 <20210311191046.ykcelkwq7orajyu7@kamzik.brq.redhat.com>
 <5467e45c-cc8e-6422-0c56-398405a7c331@suse.de>
 <fcfae16c-cfba-db2e-6d4e-e5c88cd64fa8@suse.de>
Message-ID: <b0e3089b-719a-e073-2c29-a88c2baa4ae2@suse.de>
Date: Fri, 19 Mar 2021 09:33:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <fcfae16c-cfba-db2e-6d4e-e5c88cd64fa8@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4IfwwjzXeUaC

On 3/19/21 9:23 AM, Claudio Fontana wrote:
> Hi Markus,
> 
> could you help me untangle the arm_cpu_post_init question?

Nevermind, I think I figured it out. The arm_cpu_post_init are indeed called only for the "leaf" class,
via the "instance_init" functions.

I think I can use it to do things reliably "post init" for all classes in there.

Thanks,

Claudio

> 
> I am trying to cleanup a bit the initialization path for ARM,
> and it seems that arm_cpu_post_init is called numerous times for AArch64 in particular,
> 
> while for "tcg cpus", 32bit it is called only once.
> 
> Any reason for the multiple calls in the hierarchy?
> Was the intention to actually call this just once from the final leaf classes?
> 
> The ability to execute code after the initialization would come in handy in an ARM CPU class refactoring I am doing,
> but I stopped short of adding anything to arm_cpu_post_init since I noticed the inconsistencies.
> 
> Thanks,
> 
> Claudio
> 
> 
> On 3/18/21 12:06 PM, Claudio Fontana wrote:
>> On 3/11/21 8:10 PM, Andrew Jones wrote:
>>> On Thu, Mar 11, 2021 at 06:33:15PM +0000, Peter Maydell wrote:
>>>> On Thu, 11 Mar 2021 at 17:16, Claudio Fontana <cfontana@suse.de> wrote:
>>>>> Maybe Peter you could clarify similarly what the intended meaning of "max" is on ARM?
>>>>
>>>> "max" is "best we can do, whatever that is". (On KVM this is "same as
>>>> the host".)
>>>> "host" is "whatever the host is (KVM only)".
>>>>
>>>>> KVM: (aarch64-only): aarch64_max_initfn():
>>>>>
>>>>> The following comment in the code seems wrong to me:
>>>>>
>>>>> /* -cpu max: if KVM is enabled, like -cpu host (best possible with this host); */
>>>>>
>>>>> This is not exactly true:
>>>>>
>>>>> "-cpu max" calls kvm_arm_set_cpu_features_from_host(), (which checks "dtb_compatible", and if not set gets the features from the host, if set ...?)
>>>>> After that, calls aarch64_add_sve_properties() and then adds also "svw-max-vq". This code is common with TCG.
>>
>>
>> As part of this research I noticed that arm_cpu_post_init() is quite confusing, seems really inconsistent to me.
>>
>> Apparently the intention was to call it from the leaf classes:
>>
>> commit 51e5ef459eca045d7e8afe880ee60190f0b75b26
>> Author: Marc-André Lureau <marcandre.lureau@redhat.com>
>> Date:   Tue Nov 27 12:55:59 2018 +0400
>>
>>     arm: replace instance_post_init()
>>     
>>     Replace arm_cpu_post_init() instance callback by calling it from leaf
>>     classes, to avoid potential ordering issue with other post_init callbacks.
>>     
>>     Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>>     Suggested-by: Igor Mammedov <imammedo@redhat.com>
>>     Reviewed-by: Igor Mammedov <imammedo@redhat.com>
>>     Acked-by: Eduardo Habkost <ehabkost@redhat.com>
>>
>>
>> but then we end up calling it multiple times in the class hierarch, which is a recipe for bugs, and makes it difficult to understand what arm_cpu_post_init()
>> even means, what calling this function is supposed to do.
>>
>> For a "max" or "host" cpu on AArch64, this function is called:
>>
>> for the ARM CPU base class, TYPE_ARM_CPU, in
>>
>> cpu.c::arm_cpu_instance_init,
>>
>> then later again for the TYPE_AARCH64_CPU class, child of TYPE_ARM_CPU, in
>>
>> cpu64.c::aarch64_cpu_instance_init,
>>
>> then later again for the TYPE_ARM_HOST_CPU class, child of TYPE_AARCH64_CPU, in
>>
>> cpu.c::arm_host_initfn.
>>
>> Same for "max".
>>
>> When looking at 32bit CPUs instead, only the ARM CPU base class ends up calling arm_cpu_post_init.
>> "Leaf" classes do not do it (see cpu_tcg.c).
>>
>> What is then arm_cpu_post_init even supposed to mean?
>>
>> Thanks,
>>
>> Claudio
>>
>>
>>>>>
>>>>> In the case of cpu host instead,
>>>>>
>>>>> "-cpu host" calls kvm_arm_set_cpu_features_from_host(), same as max, then calls aarch64_add_sve_properties() but does NOT add "svw-max-vq".
>>>>>
>>>>> Is this a bug?
>>>
>>> It was left out intentionally. More below.
>>>
>>>>
>>>> Maybe; that's a question for Richard or Drew...
>>>>
>>>>> Are "max" and "host" for KVM supposed to be the same like with x86?
>>>
>>> Yes, but my understanding of "max" == "host" for KVM is that that only
>>> applies to the perspective of the guest. What CPU and what CPU features
>>> the guest can see should be exactly the same with either "max" or "host",
>>> depending on the enabling/disabling of any optional CPU properties.
>>>
>>> The question here seems to be that, if one has a CPU property, does that
>>> imply the other should have the same? Which would effectively allow the
>>> two to be aliases (when KVM is enabled). I don't know, does x86 ensure
>>> 100% property compatibility?
>>>
>>> I opted not to support sve-max-vq for "host" because I consider it a
>>> legacy CPU property, one I didn't want to propagate. Indeed it may
>>> make more sense to depreciate sve-max-vq than to "fix" this issue
>>> by adding it to "host". Note, we can already create equivalent SVE
>>> CPUs. The following are the same from the perspective of the guest
>>>
>>>  -accel kvm -cpu host,sve512=on
>>>  -accel kvm -cpu max,sve512=on
>>>
>>> And, for TCG, these are the same from the perspective of the guest
>>>  
>>>  -accel tcg -cpu max,sve512=on
>>>  -accel tcg -cpu max,sve-max-vq=4
>>>
>>> So we already don't need sve-max-vq.
>>>
>>> Thanks,
>>> drew
>>>
>>
>>
> 
> 

