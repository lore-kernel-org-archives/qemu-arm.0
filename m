Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp482277lfg;
        Thu, 11 Mar 2021 09:26:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzzZ2V1tLxBOHHdw2Fyi9sIkv/I/f0pynr+DA2wjeewNXMuaIvEXmxPgZBWViv1IxAXUjn+
X-Received: by 2002:a4a:2511:: with SMTP id g17mr7655727ooa.22.1615483584353;
        Thu, 11 Mar 2021 09:26:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615483584; cv=none;
        d=google.com; s=arc-20160816;
        b=N7/E2Ie3z3yi0PS+uTSoHt261/+Ccwr4qFWCoAoHgBAm02OxXWh4ypq4PFoMpKPIli
         BjtyYwr6lCQNp8j9nVvjLretfFR/AXN5cKnzzFEJ+aQb9ERJiWnDxqHv3bH0HvoiiBdK
         bFO8LfYz3xwCbr4HHFfA+rSUDtuzO1sOcgxw52A8vx3cH2dm80PO1YjJO8/u89pZkNuN
         eEOtvc0en8BVMk7xMEyvWWbqCR1FDZNbHiTqW7TvmZaQ3mZhzh56CmTJbJzX6YQw4Xnq
         nwRwnNhieVDi6ushaKvyXoLduz5Y+nKzi8bf0Okwy+LqPHWoQgG5tjo0oFml2ln3sn1d
         XaqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=Oa4NfKjlRRJSgs6S59XU2qceVGfyt7U2XnMT6pGzU1E=;
        b=kfu80DtaR7BlzJ5lWiBM9FRNqWTLLmd1I7HNKfYzuaU3mJVHMNe6qI6gZHHnDO4AaL
         PNChwVwNL1EBq6hbHCyc/MG25CRbTqHipZCrcews01XeVl6AQ+vFt8Z4ezZrsvPKsSfj
         2XDDp9kXwB7KEGRjPGVI5qVPI4IWmF+eQymzGxlP5hRhQKHKzIqL1V1+4oo6gzwYkWdg
         H73rop2Zk9ZxH7nCalUDs1v+kEyhxFqBnjvx1SxZ615mL1DGpHsZAjl9dBUoYESM/1RQ
         rLuhmKUUakh3+c7cp/lmcRTNYNEzHFVLBr1mQzKr9bmezyO0BboHLVEjhkxCPJEgAN/b
         jmXw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n16si2776165otq.170.2021.03.11.09.26.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Mar 2021 09:26:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lKP4p-0003Eh-KV
	for alex.bennee@linaro.org; Thu, 11 Mar 2021 12:26:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lKOvq-0004UL-Pu; Thu, 11 Mar 2021 12:17:08 -0500
Received: from mx2.suse.de ([195.135.220.15]:37818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lKOvl-0007um-5c; Thu, 11 Mar 2021 12:17:06 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4155BAB8C;
 Thu, 11 Mar 2021 17:16:58 +0000 (UTC)
Subject: Re: arm: "max" CPU class hierarchy changes possible?
To: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <11e9d3bb-c94c-4ad7-35b0-b698376c5e00@suse.de>
 <CAFEAcA8T+u6QG9PQWs40PTSZ86SEeLQrciT8WHxFyH3UVbipiA@mail.gmail.com>
 <2e6a5d98-e022-0b39-5f30-92eb74491d3b@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <2277fdf5-ec92-476a-8fe5-0d4eee23dfef@suse.de>
Date: Thu, 11 Mar 2021 18:16:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <2e6a5d98-e022-0b39-5f30-92eb74491d3b@redhat.com>
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-arm <qemu-arm@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MUQzkBkkGn+U

On 3/11/21 5:18 PM, Paolo Bonzini wrote:
> On 11/03/21 16:02, Peter Maydell wrote:
>> On Thu, 11 Mar 2021 at 14:27, Claudio Fontana <cfontana@suse.de> wrote:
>>> the "max" cpu in x86 and s390 is a class,
>>>
>>> and then "host" has "max" as parent.
>>>
>>> This would be a convenient setup for ARM too, as it would allow to put common code between kvm and tcg in the "max" class,
>>> and allow "host" to specialize the behavior for KVM (and in the future HVF probably).
>>>
>>> Would changing the class hierarchy this way be acceptable, cause any problems?
>>
>> It's not clear to me why 'host' would be a subtype of 'max':
>> that doesn't seem like an obvious relationship.
> 
> On x86, "-cpu host" is essentially the same as "-cpu max" with the only 
> difference that it errors out on TCG.  So:
> 
> - with TCG: "-cpu max" enables all that can be emulated, "-cpu host" fails
> 
> - with KVM: "-cpu max" enables all that can be virtualized, "-cpu host" 
> does the same
> 
> Paolo
> 

Maybe Peter you could clarify similarly what the intended meaning of "max" is on ARM?

TCG: for aarch64, the starting point seems to be Cortex-A57, and then lots of other features are added on top of it,
and for non-aarch64, the starting point seems to be Cortex-A15, plus "old-style VFP short-vector support".

Is the intention to enable all that can be emulated here too, like for X86?


KVM: (aarch64-only): aarch64_max_initfn():

The following comment in the code seems wrong to me:

/* -cpu max: if KVM is enabled, like -cpu host (best possible with this host); */

This is not exactly true:

"-cpu max" calls kvm_arm_set_cpu_features_from_host(), (which checks "dtb_compatible", and if not set gets the features from the host, if set ...?)
After that, calls aarch64_add_sve_properties() and then adds also "svw-max-vq". This code is common with TCG.

In the case of cpu host instead,

"-cpu host" calls kvm_arm_set_cpu_features_from_host(), same as max, then calls aarch64_add_sve_properties() but does NOT add "svw-max-vq".

Is this a bug?

Are "max" and "host" for KVM supposed to be the same like with x86?

Thanks,

Claudio
